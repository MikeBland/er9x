/*
 *
 * Author - Karl Szmutny <shadow@privy.de>
 * Author - Uphiearl and Jean-Pierre PARISY
 * Modified to accept NMEA records GGA and RMC - ReSt
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */

#include "er9x.h"
#include "nmea.h"

#define NB_BUF 2
#define LG_BUF 14
#define VALSTR(val)  (rbuf[val][0] ? rbuf[val] : val_unknown)
#define APSIZE (BSS | DBLSIZE)

/*    Received data
Data are received as packets, each packet is identified by a prefix of seven
characters ('$GPGGA,' or '$GPRMC,')and is ended by one star plus two bytes checksum.
The values are terminated by a comma.

$GPGGA - Global Positioning System Fix Data, Time, Position and fix related data fora GPS receiver.

                                                      11
        1         2       3 4        5 6 7  8   9  10 |  12 13  14   15
        |         |       | |        | | |  |   |   | |   | |   |    |
    GGA,hhmmss.ss,llll.ll,a,yyyyy.yy,a,x,xx,x.x,x.x,M,x.x,M,x.x,xxxx*hh<CR><LF>

Field Number:
  1) Universal Time Coordinated (UTC)
  2) Latitude
  3) N or S (North or South)
  4) Longitude
  5) E or W (East or West)
  6) GPS Quality Indicator,
     0 - fix not available,
     1 - GPS fix,
     2 - Differential GPS fix
  7) Number of satellites in view, 00 - 12
  8) Horizontal Dilution of precision
  9) Antenna Altitude above/below mean-sea-level (geoid)
 10) Units of antenna altitude, meters
 11) Geoidal separation, the difference between the WGS-84 earth
     ellipsoid and mean-sea-level (geoid), "-" means mean-sea-level
     below ellipsoid
 12) Units of geoidal separation, meters
 13) Age of differential GPS data, time in seconds since last SC104
     type 1 or 9 update, null field when DGPS is not used
 14) Differential reference station ID, 0000-1023
 *
 15) Checksum
 CrLf


$GPRMC - Recommended Minimum Navigation Information
                                                            12
        1         2 3       4 5        6 7   8   9    10  11|
        |         | |       | |        | |   |   |    |   | |
    RMC,hhmmss.ss,A,llll.ll,a,yyyyy.yy,a,x.x,x.x,xxxx,x.x,a*hh<CR><LF>

 Field Number:
  1) UTC Time
  2) Status, V = Navigation receiver warning
  3) Latitude
  4) N or S
  5) Longitude
  6) E or W
  7) Speed over ground, knots
  8) Track made good, degrees true. = =  Course over ground (COG)
  9) Date, ddmmyy
 10) Magnetic Variation, degrees
 11) E or W
 12) Checksum
*/

// GGA record prefix
#define PACK_GGA 0x47		// "G"
#define PACK_GGA3 0x41		// "A"
// value occurence number in this packet
#define TIM 1
#define LAT 2
#define NOS 3
#define LON 4
#define EOW 5
#define FIX 6
#define SAT 7
#define DIL 8
#define ALT 9
#define MTR 10
#define GEO 11
#define MET 12
#define AGE 13
#define DIF 14


#define PACK_RMC 0x52		// "R"
#define PACK_RMC2 0x4D		// "M"
#define PACK_RMC3 0x43		// "C"
// value occurence number in this packet
#define TIM 1
#define NRW 2
#define LT1 3
#define NSO 4
#define LN1 5
#define EWE 6
#define SOG 7
#define COG 8
#define DAT 9
#define MAG 10
#define EAW 11

// end of packet
#define PACK_END 0x2a			//  *
// end of value
#define VAL_END 0x2c			//  ,

// stateful machine

//   Since the packets are sent continuously, we need to synchronize on the
//   reception of the three chars prefixing a packet, whatever they are.

// states values
#define WAIT_PACKET     1
#define WAIT_PACK_GGA1  2
#define WAIT_PACK_GGA2  3
#define WAIT_PACK_GGA3  4
#define WAIT_PACK_RMC2  5
#define WAIT_PACK_RMC3  6
#define WAIT_VAL_END	7
#define READ_VALUE      8

uint8_t i;							// working variable
uint8_t state;						// currrent state
uint8_t rval, rpack;				// received items
uint8_t xval[NB_BUF];               // expected value
uint8_t xpack[NB_BUF];			    // expected packet
uint8_t ibuf[NB_BUF];				// subscripts on buffers values
char rbuf[NB_BUF][LG_BUF];		    // receive buffers
const char val_unknown[] = "?";

void menuProcNMEA1(uint8_t event);
void menuProcNMEA2(uint8_t event);
void menuProcNMEA3(uint8_t event);
void menuProcNMEA4(uint8_t event);

void title(char x);
void initval(uint8_t num, uint8_t pack, uint8_t val);

ISR (USART0_RX_vect)
{
    uint8_t rl;
    uint8_t rh;                         //USART control and Status Register 0 B	
    uint8_t iostat;                     //USART control and Status Register 0 A

    rl = UDR0;
    iostat = UCSR0A;                    //USART control and Status Register 0 A
 /*
   bit 	7		6		5		4	3		2		1		0
        RxC0	TxC0	UDRE0	FE0	DOR0	UPE0	U2X0	MPCM0
        
        RxC0: 	Receive complete
        TXC0: 	Transmit Complete
        UDRE0: 	USART Data Register Empty
        FE0:	Frame Error
        DOR0:	Data OverRun
        UPE0:	USART Parity Error
        U2X0:	Double Tx Speed
        MPCM0:	MultiProcessor Comms Mode
*/
    if (iostat & ((1 << FE0) | (1 << DOR0) | (1 << UPE0)))
    {
        rl = xpack[0] = xpack[1] = xval[0] = xval[1] = 0;
        state = WAIT_PACKET;			// restart on error
    }
    rh = UCSR0B;                       //USART control and Status Register 0 B	
/* bit 	7		6		5		4		3		2		1		0
        RxCIE0	TxCIE0	UDRIE0	RXEN0	TXEN0	UCSZ02	RXB80	TXB80
        
        RxCIE0: Receive complete int enable
        TXCIE0: Transmit Complete int enable
        UDRIE0: USART Data Register Empty int enable
        RXEN0:	Rx enable
        TXEN0:	Tx Enable
        UCSZ02:	Character Size bit 2
        RXB80:	Rx data bit 8
        TXB80:	Tx data bit 8
*/
  switch (state)
    {
    case WAIT_PACKET:
        switch (rl)
        {
        case PACK_GGA:					// found a new GGA packet  "G"
            state = WAIT_PACK_GGA2;		// wait for the 2nd char
            break;
        case PACK_RMC:					// found a new RMS packet  "R"
            state = WAIT_PACK_RMC2;		// wait for the 2nd char
            break;
        }
        break;			

    case WAIT_PACK_GGA2:				// received 2nd char  "G"
        if (rl == PACK_GGA)
            state = WAIT_PACK_GGA3;			// wait for 3rd character "A"
        else
            state = WAIT_PACKET;		// restart if not "G"
        break;
    case WAIT_PACK_GGA3:				// received 3rd char	"A"
        if (rl == PACK_GGA3)				// found
        {
            state = WAIT_VAL_END;		// wait for ","
            rpack = PACK_GGA;			
            rval = 1;				//clear the buffer
            for (i = 0; i < NB_BUF; i++)
                ibuf[i] = 0;
        }
        else
            state = WAIT_PACKET;		// restart if not found
        break;

    case WAIT_PACK_RMC2:				// wait for 2nd char	"M"
        if (rl == PACK_RMC2)
            state = WAIT_PACK_RMC3;
        else
            state = WAIT_PACKET;		// restart if not found
        break;
    case WAIT_PACK_RMC3:				// wait for 3rd char	"C"
        if (rl == PACK_RMC3)
        {
            state = WAIT_VAL_END;		// wait for ","
            rpack = PACK_RMC;
            rval = 1;
            for (i = 0; i < NB_BUF; i++)	// clear buffer
                ibuf[i] = 0;
        }
        else
            state = WAIT_PACKET;		// restart if not found
        break;

    case WAIT_VAL_END:
	  if (rl == VAL_END)			// "," nach "GGA" oder "RMC"
	  {
		state = READ_VALUE;
            rval = 1;
            for (i = 0; i < NB_BUF; i++)	// clear buffer
                ibuf[i] = 0;
        }
        else
            state = WAIT_PACKET;		// restart if not found
        break;
		

    case READ_VALUE:
        switch (rl)
        {
        case PACK_END:
            state = WAIT_PACKET;		// packet completed, wait for the next packet
            break;
        case VAL_END:					// comma found, value completed
            rval++;						// and get next value
            break;
        default:						// store the char in the corresponding buffer
            for (i = 0; i < NB_BUF; i++)
            {							// is it the expected value in the expected packet ?
                if (rpack == xpack[i] && rval == xval[i] && ibuf[i] < LG_BUF - 1)
                {						// yes, store the char
                    rbuf[i] [ibuf[i]] = rl;
                    ibuf[i]++;
                    rbuf[i] [ibuf[i]] = 0;
                }
            }
            break;
        }
        break;
    }
}

void NMEA_Init (void)
{
    DDRE  &= ~(1 << DDE0);              // set RXD0 pin as input
    PORTE &= ~(1 << PORTE0);            // disable pullup on RXD0 pin

                            // switch (Telem_baud)
                            // {
                            // case 1:
#undef BAUD
#define BAUD 4800
#include <util/setbaud.h>
        UBRR0H = UBRRH_VALUE;
        UBRR0L = UBRRL_VALUE;
                            //    break;
                            // }

    UCSR0A &= ~(1 << U2X0);			// disable double speed operation
    // set 8N1
    UCSR0B = 0|(0<< RXCIE0)|(0<<TXCIE0)|(0<<UDRIE0)|(0<<RXEN0)|(0<<TXEN0)|(0<<UCSZ02);
    UCSR0C = 0|(1 << UCSZ01) | (1 << UCSZ00);
    while ( UCSR0A & (1 << RXC0) )
        UDR0;						    // flush receive buffer
}

void NMEA_DisableTXD (void)
{
    UCSR0B &= ~(1 << TXEN0);            // disable TX
}

void NMEA_EnableTXD (void)
{
    UCSR0B |=  (1 << TXEN0);            // enable TX
}

void NMEA_DisableRXD (void)
{
    UCSR0B &= ~(1 << RXEN0);            // disable RX
    UCSR0B &= ~(1 << RXCIE0);           // disable Interrupt
}

void NMEA_EnableRXD (void)
{
    for (i = 0; i < NB_BUF; i++)
    {
        ibuf[i] = 0;
        rbuf[i][0] = 0;
        xpack[i] = 0;
        xval[i] = 0;
    }
    state = WAIT_PACKET;			    // wait for the next packet
    UCSR0B |=  (1 << RXEN0);		    // enable RX
    UCSR0B |=  (1 << RXCIE0);		    // enable Interrupt
}

void menuProcNMEA(uint8_t event)
{
    menuProcNMEA1(event);
}

// Start of NMEA menus 1-4 <<<<<<<<<<<<<<<<<<<<<<<<<<<

void menuProcNMEA1(uint8_t event)
{
    switch(event)						// new event received, branch accordingly
    {
    case EVT_KEY_FIRST(KEY_UP):
        chainMenu(menuProcNMEA4);
        break;
    case EVT_KEY_FIRST(KEY_DOWN):
        chainMenu(menuProcNMEA2);
        break;
    case EVT_KEY_FIRST(KEY_MENU):
        NMEA_DisableRXD();
        chainMenu(menuProcStatistic);
        break;
    case EVT_KEY_FIRST(KEY_EXIT):
        NMEA_DisableRXD();
        chainMenu(menuProc0);
        break;
    }
/*
    How to use: 

    You choose the values to be displayed using the function:

      initval(<number>, <packet>, <value>);
      -------------------------------------

    That means that "<value>" of "<packet>" is stored in the <number> buffer.
    The first <number> is 0.

    Here are the packet names and the associated value names:

    Position packet (beginning with "GGA"): "PACK_GGA"
	 value names: "TIM", "LAT", "NOS", "LON", "EOW", "FIX", "SAT", "DIL", "ALT", "MTR", "GEO", "MET", "AGE", "DIF",

    Required minimum packet (beginning with "RMC"): "PACK_RMC"
       value names: "TIM", "NRW", "LT1", "NSO", "LN1", "EWE", "SOG", "COG", "DAT", "MAG", "EAW"

    The buffers are accessed using the macro "VALSTR(<n>)", where "<n>" is "0"
    for the first buffer, and "1" for the second buffer.

    When a value is missing, it is replaced by the contents of val_unknown ("?").
*/
// expecting LAT value in POS packet to be stored in the first buffer
    initval (0, PACK_GGA, LAT);
// and LON value in POS packet stored in the second buffer
    initval (1, PACK_GGA, LON);
// title of the screen
    title ('1');
    lcd_puts_P  (5*FW, 1*FH, PSTR(" Latitude"));   // line 1 column 5
// first buffer into line 2 column 2
    lcd_putsAtt (2*FW, 2*FH, VALSTR(0), APSIZE);
    lcd_puts_P  (5*FW, 4*FH, PSTR(" Longitude"));  // line 4 column 5
// second buffer into line 5 column 2
    lcd_putsAtt (1*FW, 5*FH, VALSTR(1), APSIZE);
}

void menuProcNMEA2(uint8_t event)
{
    switch(event)
    {
    case EVT_KEY_FIRST(KEY_UP):
        chainMenu(menuProcNMEA1);
        break;
    case EVT_KEY_FIRST(KEY_DOWN):
        chainMenu(menuProcNMEA3);
        break;
    case EVT_KEY_FIRST(KEY_EXIT):
        NMEA_DisableRXD();
        chainMenu(menuProc0);
        break;
    }
    initval (0, PACK_RMC, SOG);
    initval (1, PACK_RMC, COG);
    title ('2');  
    lcd_puts_P  (1*FW, 1*FH, PSTR(" Speed over ground "));    
    lcd_putsAtt (2*FW, 2*FH, VALSTR(0), APSIZE);
    lcd_puts_P  (1*FW, 4*FH, PSTR(" Course over ground ") );
    lcd_putsAtt (2*FW, 5*FH, VALSTR(1), APSIZE);
}

void menuProcNMEA3(uint8_t event)
{
    switch(event)
    {
    case EVT_KEY_FIRST(KEY_UP):
        chainMenu(menuProcNMEA2);
        break;
    case EVT_KEY_FIRST(KEY_DOWN):
        chainMenu(menuProcNMEA4);
        break;
    case EVT_KEY_FIRST(KEY_EXIT):
        NMEA_DisableRXD();
        chainMenu(menuProc0);
        break;
    }
    initval (0, PACK_GGA, ALT);
    initval (1, PACK_GGA, GEO);
    title ('3');  
    lcd_puts_P  (1*FW, 1*FH, PSTR(" Altitude total "));    
    lcd_putsAtt (2*FW, 2*FH, VALSTR(0), APSIZE);
    lcd_puts_P  (1*FW, 4*FH, PSTR(" Geo. Separation ") );
    lcd_putsAtt (2*FW, 5*FH, VALSTR(1), APSIZE);
}

void menuProcNMEA4(uint8_t event)
{
    switch(event)
    {
    case EVT_KEY_FIRST(KEY_UP):
        chainMenu(menuProcNMEA3);
        break;
    case EVT_KEY_FIRST(KEY_DOWN):
        chainMenu(menuProcNMEA1);
        break;
    case EVT_KEY_FIRST(KEY_EXIT):
        NMEA_DisableRXD();
        chainMenu(menuProc0);
    break;
    }
    initval (0, PACK_GGA, TIM);
    initval (1, PACK_RMC, DAT);
    title ('4'); 
    lcd_puts_P  (1*FW, 1*FH, PSTR(" UTC-Time "));    
    lcd_putsAtt (1*FW, 2*FH, VALSTR(0), APSIZE);
    lcd_puts_P  (1*FW, 4*FH, PSTR(" Date "));
    lcd_putsAtt (2*FW, 5*FH, VALSTR(1), APSIZE);
}

void title(char x)
{
    lcd_putsAtt (0, 0, PSTR("  GPS NMEA data ?/4  "), INVERS);
    lcd_putcAtt(16*FW, 0*FH, x, INVERS);
}

void initval(uint8_t num, uint8_t pack, uint8_t val)
{
    if (xpack[num] != pack || xval[num] != val)
    {
        ibuf[num] = rbuf[num][0] = 0;
        xpack[num] = pack;
        xval[num] = val;
        state = WAIT_PACKET;			// synchronize to the next packet
    }
}

/*
Without NMEA:
Size after:
er9x.elf  :
section             size      addr
.data                164   8388864
.text              50634         0
.bss                3485   8389028
----------------------------------
With NMEA:
Size after:
er9x.elf  :
section             size      addr
.data                166   8388864
.text              53026        0
.bss                3517   8389030
*/

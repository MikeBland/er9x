/*
 * 
 * Author - Philip Moss
 * Adapted from jeti.cpp code by Karl Szmutny <shadow@privy.de>
 *
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

#include "frsky.h"
#include "er9x.h"


uint8_t linkBuffer[9]; // 4 bytes, worst case 8 bytes with byte stuff + 1
uint8_t TelemBuffer[] = "A1:  . VA2:  .   Rx RSSI:   dBTx RSSI:   dB";
uint8_t alrmRequest[] = {0x7e,0xf8,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x7e};
uint8_t FrskyBufferReady;
uint8_t alrmPktRx = 0;
uint8_t stringId =0;
uint8_t fr_editMode;
//uint8_t voltRatio = 13;
uint8_t displayState = 0;
uint8_t a11Adjust,a12Adjust,a21Adjust,a22Adjust;
uint8_t a11Buffer[9] = ""; // 4 bytes, worst case 8 bytes with byte stuff + 1
uint8_t a12Buffer[9] = ""; // 4 bytes, worst case 8 bytes with byte stuff + 1
uint8_t a21Buffer[9] = ""; // 4 bytes, worst case 8 bytes with byte stuff + 1
uint8_t a22Buffer[9] = ""; // 4 bytes, worst case 8 bytes with byte stuff + 1
//uint16_t a11hex;


ISR (USART0_RX_vect)
{
        uint8_t stat;
		uint8_t data;
        static uint8_t startDet = 0;	// packet header flag
		static uint8_t linkPkt = 0;
		static uint8_t usrPkt = 0; 
		static uint8_t a11Pkt = 0;
		static uint8_t a12Pkt = 0;
		static uint8_t a21Pkt = 0;
		static uint8_t a22Pkt = 0;
        static uint8_t linkCtr = 0;
		static uint8_t alrmCtr = 0;
		static uint8_t falseStart = 0;
		static uint8_t byteStuff = 0;
        
        stat = UCSR0A;//USART control and Status Register 0 A
       
		/* bit 	7		6		5		4	3		2		1		0
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
		//rh = UCSR0B; //USART control and Status Register 0 B	
	
		/* bit 	7		6		5		4		3		2		1		0
				RxCIE0	TxCIE0	UDRIE0	RXEN0	TXEN0	UCSZ02	RXB80	TXB80
				
				RxCIE0: 	Receive complete int enable
				TXCIE0: 	Transmit Complete int enable
				UDRIE0: 	USART Data Register Empty int enable
				RXEN0:		Rx enable
				TXEN0:		Tx Enable
				UCSZ02:		Character Size bit 2
				RXB80:		Rx data bit 8
				TXB80:		Tx data bit 8
		*/
		
        data = UDR0;  //USART data register 0

        
        if (stat & ((1 << FE0) | (1 << DOR0) | (1 << UPE0)))
        {       // discard buffer and start new on any error
                FrskyBufferReady = 0;
				startDet = 1;
				linkCtr = 0;
        }
        
		else if (!startDet)
		{
			if (data==0x7e)	//looking for header
            {       
				startDet = 1; // flag possible header	
				falseStart = 1; // flag possible false start
				FrskyBufferReady = 0;
			}
		}
				
		else if (stringId)
		{
			switch (data)
			{
				case 0x7e: // end detected?
					//if (falseStart)
					//	falseStart = 0;	// was false start, now use real one
					//else
						startDet = 0;	// end detected
						FrskyBufferReady = 1;
						linkCtr = 0;
						alrmCtr = 0;
						linkPkt = 0;
						usrPkt = 0;
						a11Pkt = 0;
						a12Pkt = 0;
						a21Pkt = 0;
						a22Pkt = 0;
						stringId = 0;
					break;			
					
				default:
					if (linkPkt)
					{
						//linkBuffer[linkCtr++] = data;

						if (data == 0x7d)
							byteStuff = 1;
						else if (byteStuff) {
							linkBuffer[linkCtr++] = data ^ 0x20;
							byteStuff &= 0;
						}
						else
							linkBuffer[linkCtr++] = data;
					}
					if (a11Pkt)
					{
						if (data == 0x7d)
							byteStuff = 1;
						else if (byteStuff) {
							a11Buffer[alrmCtr++] = data ^ 0x20;
							byteStuff &= 0;
						}
						else
							a11Buffer[alrmCtr++] = data;
							
						alrmPktRx |= 1;
					}
					if (a12Pkt)
					{
						if (data == 0x7d)
							byteStuff = 1;
						else if (byteStuff) {
							a12Buffer[alrmCtr++] = data ^ 0x20;
							byteStuff &= 0;
						}
						else
							a12Buffer[alrmCtr++] = data;
							
						alrmPktRx |= 2;
					}
					if (a21Pkt)
					{
						if (data == 0x7d)
							byteStuff = 1;
						else if (byteStuff) {
							a21Buffer[alrmCtr++] = data ^ 0x20;
							byteStuff &= 0;
						}
						else
							a21Buffer[alrmCtr++] = data;
							
						alrmPktRx |= 4;
					}
					if (a22Pkt)
					{
						if (data == 0x7d)
							byteStuff = 1;
						else if (byteStuff) {
							a22Buffer[alrmCtr++] = data ^ 0x20;
							byteStuff &= 0;
						}
						else
							a22Buffer[alrmCtr++] = data;
							
						alrmPktRx |= 8;
					}
					break;
					// insert user data routine here
				
			}
		}
		else 
		{
			switch (data)
			{
				case 0x7e: // start or end detected?
					if (falseStart)
						falseStart = 0;	// was false start, now use real one
					/*else
						startDet = 0;	// end detected
						FrskyBufferReady = 1;
						linkCtr = 0;
						alrmCtr = 0;
						linkPkt = 0;
						usrPkt = 0;
						a11Pkt = 0;
						a12Pkt = 0;
						a21Pkt = 0;
						a22Pkt = 0;
						stringId = 0; */
					break;
					
				case 0xfe:
					linkPkt = 1;
					falseStart = 0;
					stringId =1;
					break;
					
				case 0xfd:
					usrPkt = 1;// flag user data
					falseStart = 0;
					stringId =1;
					break;

				case 0xfc:
					a11Pkt = 1;
					falseStart = 0;
					stringId =1;
					break;
					
				case 0xfb:
					a12Pkt = 1;
					falseStart = 0;
					stringId =1;
					break;
					
				case 0xfa:
					a21Pkt = 1;
					falseStart = 0;
					stringId =1;
					break;
					
				case 0xf9:
					a22Pkt = 1;
					falseStart = 0;
					stringId =1;
					break;
				
				default: // if second byte not matched above then string corrupted - start again
					startDet = 0;	// end detected
					FrskyBufferReady = 1;
					linkCtr = 0;
					alrmCtr = 0;
					linkPkt = 0;
					usrPkt = 0;
					a11Pkt = 0;
					a12Pkt = 0;
					a21Pkt = 0;
					a22Pkt = 0;
					stringId = 0;
					break;
			}  
		}
		
}



void FRSKY_Init (void)
{
   
   DDRE  &= ~(1 << DDE0);          // set RXD0 pin as input
   PORTE &= ~(1 << PORTE0);        // disable pullup on RXD0 pin

#undef BAUD
#define BAUD 9600
#include <util/setbaud.h>
   UBRR0H = UBRRH_VALUE;
   UBRR0L = UBRRL_VALUE;

   UCSR0A &= ~(1 << U2X0); // disable double speed operation
     
   // set 8N1
   UCSR0B = 0|(0<< RXCIE0)|(0<<TXCIE0)|(0<<UDRIE0)|(0<<RXEN0)|(0<<TXEN0)|(0<<UCSZ02);
   UCSR0C = 0|(1 << UCSZ01) | (1 << UCSZ00);
        
   // flush receive buffer
   while ( UCSR0A & (1 << RXC0) ) UDR0;

}


void FRSKY_DisableTXD (void)
{
        UCSR0B &= ~(1 << TXEN0);        // disable TX
}


void FRSKY_EnableTXD (void)
{
        UCSR0B |=  (1 << TXEN0);        // enable TX
}


void FRSKY_DisableRXD (void)
{
        UCSR0B &= ~(1 << RXEN0);        // disable RX
        UCSR0B &= ~(1 << RXCIE0);       // disable Interrupt
}


void FRSKY_EnableRXD (void)
{
        UCSR0B |=  (1 << RXEN0);        // enable RX
        UCSR0B |=  (1 << RXCIE0);       // enable Interrupt
}

/* FRSKY_Transmit sends a character passed to it out the onboard USART of 	*/
/* an Atmel ATMEGA64 microprocessor.										*/

void FRSKY_Transmit(uint8_t data)
{
/* Wait for empty transmit buffer */
loop_until_bit_is_set(UCSR0A, UDRE0);
	
/* Put data into buffer, send data */
UDR0 = data;
}

void FRSKY_saveAlarms (void)
{	
	uint8_t count;
	uint8_t k=0;
	
	count = 0;
	FRSKY_Transmit(0x7e); //Start
	FRSKY_Transmit(0xfc); //a11
	for (k=0;k<3;k++) {	// 3 bytes plus byte stuff
		if (a11Buffer[count] == 0x7e) {			
			FRSKY_Transmit(0x7d);
			FRSKY_Transmit(0x5e);
		}
		else if (a11Buffer[count] == 0x7d) {			
			FRSKY_Transmit(0x7d);
			FRSKY_Transmit(0x5d);
		}
		else 
			FRSKY_Transmit(a11Buffer[count]);
			
		count++;
		
	}
	for (k=0;k<5;k++) {	// five 0x00 bytes
		FRSKY_Transmit(0);
	}
	FRSKY_Transmit(0x7e);	// end

	count = 0;
	FRSKY_Transmit(0x7e); //Start
	FRSKY_Transmit(0xfb); //a12
	for (k=0;k<3;k++) {	// 3 bytes plus byte stuff
		if (a12Buffer[count] == 0x7e) {			
			FRSKY_Transmit(0x7d);
			FRSKY_Transmit(0x5e);
		}
		else if (a12Buffer[count] == 0x7d) {			
			FRSKY_Transmit(0x7d);
			FRSKY_Transmit(0x5d);
		}
		else 
			FRSKY_Transmit(a12Buffer[count]);
			
		count++;
	}
	for (k=0;k<5;k++) {	// five 0x00 bytes
		FRSKY_Transmit(0);
	}
	FRSKY_Transmit(0x7e);	// end
	
	count = 0;
	FRSKY_Transmit(0x7e); //Start
	FRSKY_Transmit(0xfa); //a21
	for (k=0;k<3;k++) {	// 3 bytes plus byte stuff
		if (a21Buffer[count] == 0x7e) {			
			FRSKY_Transmit(0x7d);
			FRSKY_Transmit(0x5e);
		}
		else if (a21Buffer[count] == 0x7d) {			
			FRSKY_Transmit(0x7d);
			FRSKY_Transmit(0x5d);
		}
		else
			FRSKY_Transmit(a21Buffer[count]);
			
		count++;
	}
	for (k=0;k<5;k++) {	// five 0x00 bytes
		FRSKY_Transmit(0);
	}
	FRSKY_Transmit(0x7e);	// end
	
	count = 0;
	FRSKY_Transmit(0x7e); //Start
	FRSKY_Transmit(0xf9); //a22
	for (k=0;k<3;k++) {	// 3 bytes plus byte stuff
		if (a22Buffer[count] == 0x7e) {			
			FRSKY_Transmit(0x7d);
			FRSKY_Transmit(0x5e);
		}
		else if (a22Buffer[count] == 0x7d) {			
			FRSKY_Transmit(0x7d);
			FRSKY_Transmit(0x5d);
		}
		else
			FRSKY_Transmit(a22Buffer[count]);
			
		count++;
	}
	for (k=0;k<5;k++) {	// five 0x00 bytes
		FRSKY_Transmit(0);
	}
	FRSKY_Transmit(0x7e);	// end

}


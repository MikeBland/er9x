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
uint8_t TelemBuffer[] = "A1:     A2:     Rx RSSI:   dB   ";
uint8_t FrskyBufferReady;


ISR (USART0_RX_vect)
{
        uint8_t stat;
		uint8_t data;
        static uint8_t startDet = 0;	// packet header flag
		static uint8_t linkPkt = 0;
		static uint8_t usrPkt = 0;        
        static uint8_t linkCtr = 0;
		static uint8_t falseStart = 0;
        
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
				
		else if (startDet)
		{
			switch (data)
			{
				case 0x7e: // start or end detected?
					if (falseStart)
						falseStart = 0;	// was false start, now use real one
					else
						startDet = 0;	// end detected
						FrskyBufferReady = 1;
						linkCtr = 0;
					break;
				
				case 0xfe:
					linkPkt = 1;
					falseStart = 0;
					break;
					
				case 0xfd:
					usrPkt = 1;// flag user data
					falseStart = 0;
					break;				
					
				default:
					if (linkPkt)
					{
						linkBuffer[linkCtr++] = data;						
					}
					// insert user data routine here
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


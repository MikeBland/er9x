#include "er9x.h"
#include "pulses.h"

extern uint16_t g_tmr1Latency_max;
extern uint16_t g_tmr1Latency_min;

#define PULSES_WORD_SIZE	72
#define PULSES_BYTE_SIZE	(PULSES_WORD_SIZE * 2)

union p2mhz_t 
{
    uint16_t pword[PULSES_WORD_SIZE] ;   //72
    uint8_t pbyte[PULSES_BYTE_SIZE] ;   //144
} pulses2MHz ;

uint8_t *pulses2MHzptr = pulses2MHz.pbyte ;
uint8_t heartbeat;
uint8_t Current_protocol;
uint8_t pxxFlag = 0;

#define CTRL_END 0
#define CTRL_CNT 1
#define CTRL_REP_1CMD -3
#define CTRL_REP_2CMD -6

#define BindBit 0x80
#define RangeCheckBit 0x20
#define FranceBit 0x10
#define DsmxBit  0x08
#define BadData 0x47


void set_timer3_capture( void ) ;
void set_timer3_ppm( void ) ;
void setupPulsesPPM16( uint8_t proto ) ;

//uint16_t PulseTotal ;

//ISR(TIMER1_OVF_vect)
ISR(TIMER1_COMPA_vect) //2MHz pulse generation
{
    static uint8_t   pulsePol;
    static uint16_t *pulsePtr = pulses2MHz.pword;

    //    uint8_t i = 0;
    //    while((TCNT1L < 10) && (++i < 50))  // Timer does not read too fast, so i
    //        ;
    uint16_t dt=TCNT1;//-OCR1A;

    if(pulsePol)
    {
        PORTB |=  (1<<OUT_B_PPM);
        pulsePol = 0;
    }else{
        PORTB &= ~(1<<OUT_B_PPM);
        pulsePol = 1;
    }

    //  if (g_model.protocol==PROTO_PPM)
    //  {
    //    if ( *(pulsePtr+1) != 0 )  // Not the sync pulse
    //    {
    //      if ( channel & 1 )  // Channel pulse, not gap pulse
    //      {
    //        *pulsePtr = max(min(g_chans512[channel>>1],PPM_range),-PPM_range) + PPM_CENTER - PPM_gap + 600;
    //      }
    //    }
    //    else // sync pulse
    //    {
    //      uint16_t rest ;
    //      rest = PPM_frame - PulseTotal ;
    //      *pulsePtr = rest ;
    //    }
    //    channel += 1 ;
    //  }
    //  PulseTotal += (OCR1A  = *pulsePtr++);
    OCR1A  = *pulsePtr++;
    
    if ( dt > g_tmr1Latency_max) g_tmr1Latency_max = dt ;    // max has leap, therefore vary in length
    if ( dt < g_tmr1Latency_min) g_tmr1Latency_min = dt ;    // max has leap, therefore vary in length

    if( *pulsePtr == 0) {
        //currpulse=0;
        pulsePtr = pulses2MHz.pword;
        pulsePol = !g_model.pulsePol;//0;     // changed polarity
        //    channel = 0 ;
        //    PulseTotal = 0 ;

        TIMSK &= ~(1<<OCIE1A); //stop reentrance
        //        sei();		// Don't do this yet
        setupPulses();
        // For DSM2 problem, missed interrupt
        //		    if (g_model.protocol == PROTO_DSM2)
        //				{
        //					if ( TIFR & (1 << OCF1A ) )		// Interrupt pending
        //					{
        //						TCNT1 = 0 ;
        //					}
        //				}
        if ( (g_model.protocol == PROTO_PPM) || (g_model.protocol == PROTO_PPM16) )
        {
            //            cli();		// Not needed if sei() not done above
            TIMSK |= (1<<OCIE1A);
            sei();
        }
    }
    heartbeat |= HEART_TIMER2Mhz;
}

void setupPulses()
{
	uint8_t required_protocol ;
  required_protocol = g_model.protocol ;
	// Sort required_protocol depending on student mode and PPMSIM allowed

	if ( g_eeGeneral.enablePpmsim )
	{
		if ( SlaveMode )
		{
			required_protocol = PROTO_PPMSIM ;			
		}		
	}

    //	SPY_ON;
    if ( Current_protocol != required_protocol )
    {
        Current_protocol = required_protocol ;
        // switch mode here
        switch(required_protocol)
        {
        case PROTO_PPM:
            set_timer3_capture() ;
            TCCR1B = 0 ;			// Stop counter
            OCR1A = 40000 ;		// Next frame starts in 20 mS
            TCNT1 = 0 ;
            TIMSK &= ~0x3C ;	// All interrupts off
            //				ETIMSK &= ~(1<<OCIE1C) ;		// COMPC1 off
            TIFR = 0x3C ;			// Clear all pending interrupts
            ETIFR = 0x3F ;			// Clear all pending interrupts
            TIMSK |= 0x10 ;		// Enable COMPA
            TCCR1A = (0<<WGM10) ;
            TCCR1B = (1 << WGM12) | (2<<CS10) ; // CTC OCRA, 16MHz / 8
            break;
        case PROTO_PXX:
            set_timer3_capture() ;
            TCCR1B = 0 ;			// Stop counter
            TCNT1 = 0 ;
            OCR1B = 6000 ;		// Next frame starts in 3 mS
            OCR1C = 4000 ;		// Next frame setup in 2 mS
            TIMSK &= ~0x3C ;	// All interrupts off
            TIFR = 0x3C ;			// Clear all pending interrupts
            ETIFR = 0x3F ;			// Clear all pending interrupts
            TIMSK |= (1<<OCIE1B) ;	// Enable COMPB
            ETIMSK |= (1<<OCIE1C);	// Enable COMPC
            TCCR1A  = 0;
            TCCR1B  = (2<<CS10);      //ICNC3 16MHz / 8
            break;
        case PROTO_DSM2:
            set_timer3_capture() ;
            TCCR1B = 0 ;			// Stop counter
            OCR1C = 200 ;			// 100 uS
            TCNT1 = 300 ;			// Past the OCR1C value
            ICR1 = 44000 ;		// Next frame starts in 22 mS
            TIMSK &= ~0x3C ;	// All interrupts off
            TIFR = 0x3C ;			// Clear all pending interrupts
            ETIFR = 0x3F ;			// Clear all pending interrupts
            TIMSK |= 0x20 ;		// Enable CAPT
            ETIMSK |= (1<<OCIE1C);	// Enable COMPC
            TCCR1A = (0<<WGM10) ;
            TCCR1B = (3 << WGM12) | (2<<CS10) ; // CTC ICR, 16MHz / 8
            break;
        case PROTO_PPM16 :
            TCCR1B = 0 ;			// Stop counter
            OCR1A = 40000 ;		// Next frame starts in 20 mS
            TCNT1 = 0 ;
            TIMSK &= ~0x3C ;	// All interrupts off
            ETIMSK &= ~(1<<OCIE1C) ;		// COMPC1 off
            TIFR = 0x3C ;			// Clear all pending interrupts
            ETIFR = 0x3F ;			// Clear all pending interrupts
            TIMSK |= 0x10 ;		// Enable COMPA
            TCCR1A = (0<<WGM10) ;
            TCCR1B = (1 << WGM12) | (2<<CS10) ; // CTC OCRA, 16MHz / 8
            setupPulsesPPM16(PROTO_PPM16);
						OCR3A = 50000 ;
            OCR3B = 5000 ;
            set_timer3_ppm() ;
            break ;
        
        case PROTO_PPMSIM :
            TCCR1B = 0 ;			// Stop counter
            TCNT1 = 0 ;
            TIMSK &= ~0x3C ;	// All interrupts off
            ETIMSK &= ~(1<<OCIE1C) ;		// COMPC1 off
            TIFR = 0x3C ;			// Clear all pending interrupts
            ETIFR = 0x3F ;			// Clear all pending interrupts
            setupPulsesPPM16(PROTO_PPMSIM);
						OCR3A = 50000 ;
            OCR3B = 5000 ;
            set_timer3_ppm() ;
            break ;
				}
    }
    switch(required_protocol)
    {
    case PROTO_PPM:
        setupPulsesPPM();		// Don't enable interrupts through here
        break;
    case PROTO_PXX:
        sei() ;							// Interrupts allowed here
        setupPulsesPXX();
        break;
    case PROTO_DSM2:
        sei() ;							// Interrupts allowed here
        setupPulsesDsm2(6); 
        break;
    case PROTO_PPM16 :
        setupPulsesPPM();		// Don't enable interrupts through here
        // PPM16 pulses are set up automatically within the interrupts
        break ;
    }
    //    SPY_OFF;
}

//inline int16_t reduceRange(int16_t x)  // for in case we want to have room for subtrims
//{
//    return x-(x/4);  //512+128 =? 640,  640 - 640/4  == 640 * 3/4 => 480 (just below 500msec - it can still reach 500 with offset)
//}
//int16_t PPM_range = 512*2;   //range of 0.7..1.7msec
//uint16_t PPM_gap = 300 * 2; //Stoplen *2
//uint16_t PPM_frame ;

void setupPulsesPPM() // changed 10/05/2010 by dino Issue 128
{
#define PPM_CENTER 1500*2
    int16_t PPM_range = g_model.extendedLimits ? 640*2 : 512*2;   //range of 0.7..1.7msec

    //Total frame length = 22.5msec
    //each pulse is 0.7..1.7ms long with a 0.3ms stop tail
    //The pulse ISR is 2mhz that's why everything is multiplied by 2
    uint16_t *ptr ;
    ptr = pulses2MHz.pword ;
    uint8_t p=8+g_model.ppmNCH*2; //Channels *2
    uint16_t q=(g_model.ppmDelay*50+300)*2; //Stoplen *2
    uint16_t rest=22500u*2-q; //Minimum Framelen=22.5 ms
    rest += (int16_t(g_model.ppmFrameLength))*1000;
    //    if(p>9) rest=p*(1720u*2 + q) + 4000u*2; //for more than 9 channels, frame must be longer
    for(uint8_t i=0;i<p;i++){ //NUM_CHNOUT
        int16_t v = max(min(g_chans512[i],PPM_range),-PPM_range) + PPM_CENTER;
 	      rest -= v ; // (*ptr + q);
				*ptr++ = v - q ; /* as Pat MacKenzie suggests */
				*ptr++ = q;      //to here
    }
    //    *ptr=q;       //reverse these two assignments
    //    *(ptr+1)=rest;
    *ptr = rest;
    *(ptr+1) = q;
    *(ptr+2)=0;
    //    pulses2MHz[j++]=q;
    //    pulses2MHz[j++]=rest;
    //    pulses2MHz[j++]=0;
}


// DSM2 protocol pulled from th9x - Thanks thus!!!

//http://www.rclineforum.de/forum/board49-zubeh-r-elektronik-usw/fernsteuerungen-sender-und-emp/neuer-9-kanal-sender-f-r-70-au/Beitrag_3897736#post3897736
//(dsm2( LP4DSM aus den RTF ( Ready To Fly ) Sendern von Spektrum.
//http://www.rcgroups.com/forums/showpost.php?p=18554028&postcount=237
// /home/thus/txt/flieger/PPMtoDSM.c
/*
  125000 Baud 8n1      _ xxxx xxxx - ---
#define DSM2_CHANNELS      6                // Max number of DSM2 Channels transmitted
#define DSM2_BIT (8*2)
bind:
  DSM2_Header = 0x80,0
static byte DSM2_Channel[DSM2_CHANNELS*2] = {
                ch
  0x00,0xAA,     0 0aa
  0x05,0xFF,     1 1ff
  0x09,0xFF,     2 1ff
  0x0D,0xFF,     3 1ff
  0x13,0x54,     4 354
  0x14,0xAA      5 0aa
};

normal:
  DSM2_Header = 0,0;
  DSM2_Channel[i*2]   = (byte)(i<<2) | highByte(pulse);
  DSM2_Channel[i*2+1] = lowByte(pulse);


 */

inline void _send_1(uint16_t v)
{
    *pulses2MHzptr++ = v;
}

#define BITLEN_DSM2 (8*2) //125000 Baud
void sendByteDsm2(uint8_t b) //max 10changes 0 10 10 10 10 1
{
    bool    lev = 0;
    uint8_t len = BITLEN_DSM2; //max val: 9*16 < 256
    for( uint8_t i=0; i<=8; i++){ //8Bits + Stop=1
        bool nlev = b & 1; //lsb first
        if(lev == nlev){
            len += BITLEN_DSM2;
        }else{
            _send_1(len -1);
            len  = BITLEN_DSM2;
            lev  = nlev;
        }
        b = (b>>1) | 0x80; //shift in stop bit
    }
    _send_1(len+BITLEN_DSM2-1); // 2 stop bits
}


static uint8_t *Dsm2_pulsePtr = pulses2MHz.pbyte ;
void setupPulsesDsm2(uint8_t chns)
{
    static uint8_t dsmDat[2+6*2]={0xFF,0x00,  0x00,0xAA,  0x05,0xFF,  0x09,0xFF,  0x0D,0xFF,  0x13,0x54,  0x14,0xAA};
    uint8_t counter ;
    //	CSwData &cs = g_model.customSw[NUM_CSW-1];

    pulses2MHzptr = pulses2MHz.pbyte ;
    
    // If more channels needed make sure the pulses union/array is large enough
    if (dsmDat[0]&BadData)  //first time through, setup header
    {
        switch(g_model.ppmNCH)
        {
        case LPXDSM2:
            dsmDat[0]= 0x80;
            break;
        case DSM2only:
            dsmDat[0]=0x90;
            break;
        default:
            dsmDat[0]=0x98;  //dsmx, bind mode
            break;
        }
    }
    if((dsmDat[0]&BindBit)&&(!keyState(SW_Trainer)))  dsmDat[0]&=~BindBit;		//clear bind bit if trainer not pulled
    if ((!(dsmDat[0]&BindBit))&&getSwitch(MAX_DRSWITCH-1,0,0)) dsmDat[0]|=RangeCheckBit;   //range check function
    else dsmDat[0]&=~RangeCheckBit;
    dsmDat[1]=g_eeGeneral.currModel+1;  //DSM2 Header second byte for model match
    for(uint8_t i=0; i<chns; i++)
    {
		    uint16_t pulse = limit(0, ((g_chans512[i]*13)>>5)+512,1023);
        dsmDat[2+2*i] = (i<<2) | ((pulse>>8)&0x03);
        dsmDat[3+2*i] = pulse & 0xff;
    }

    for ( counter = 0 ; counter < 14 ; counter += 1 )
    {
    	sendByteDsm2(dsmDat[counter]);
    }
    pulses2MHzptr-=1 ; //remove last stopbits and
    _send_1( 255 ) ;	 //prolong them
    _send_1(0);        //end of pulse stream
    Dsm2_pulsePtr = pulses2MHz.pbyte ;
}


ISR(TIMER1_CAPT_vect) //2MHz pulse generation
{
    //      static uint8_t  pulsePol;
    uint8_t x ;
    PORTB ^=  (1<<OUT_B_PPM);
    x = *Dsm2_pulsePtr++;      // Byte size
    ICR1 = x ;
    if ( x > 200 )
    {
        PORTB |=  (1<<OUT_B_PPM);      // Make sure pulses are the correct way up      
    }
    heartbeat |= HEART_TIMER2Mhz;
}


ISR(TIMER1_COMPC_vect) // DSM2 or PXX end of frame
{

    if ( g_model.protocol == PROTO_DSM2 )
    {
        // DSM2
        ICR1 = 41536 ; //next frame starts in 22 msec 41536 = 2*(22000 - 14*11*8)
  	if (OCR1C<255) OCR1C = 39000;  //delay setup pulses by 19.5 msec to reduce sytem latency
  	else
  	{
            OCR1C=200;
            setupPulses();
  	}
    }
    else		// must be PXX
    {
        setupPulses() ;
    }
}

// This interrupt for PXX

ISR(TIMER1_COMPB_vect) // PXX main interrupt
{
    uint8_t x ;
    PORTB ^= (1<<OUT_B_PPM) ;
    x = *pulses2MHzptr;      // Byte size
    if ( ( x & 1 ) == 0 )
    {
        OCR1B += 32 ;
    }
    else
    {
        OCR1B += 16 ;
    }
    if ( (x >>= 1) == 0 )
    {
        if ( *(++pulses2MHzptr) == 0 )
        {
            OCR1B = OCR1C + 2000 ;		// 1mS on from OCR1B
        }
    }
    else
    {
        *pulses2MHzptr = x ;
    }
    heartbeat |= HEART_TIMER2Mhz;
}



void set_timer3_capture()
{
    ETIMSK &= ~( (1<<OCIE3A) | (1<<OCIE3B) | (1<<OCIE3C) ) ;	// Stop compare interrupts
    DDRE &= ~0x80;  PORTE |= 0x80 ;	// Bit 7 input + pullup

    TCCR3B = 0 ;			// Stop counter
    TCCR3A  = 0;
    TCCR3B  = (1<<ICNC3) | (2<<CS30);      //ICNC3 16MHz / 8
    ETIMSK |= (1<<TICIE3);
}

void set_timer3_ppm()
{
    ETIMSK &= ~( 1<<TICIE3) ;	// Stop capture interrupt
    DDRE |= 0x80;					// Bit 7 output

    TCCR3B = 0 ;			// Stop counter
    TCCR3A = (0<<WGM10);
    TCCR3B = (1 << WGM12) | (2<<CS10); // CTC OCR1A, 16MHz / 8

    ETIMSK |= ( (1<<OCIE3A) | (1<<OCIE3B) ); 			// enable immediately before mainloop
}


uint16_t B3_comp_value ;

ISR(TIMER3_COMPA_vect) //2MHz pulse generation
{
    static uint8_t   pulsePol;
    static uint16_t *pulsePtr = &pulses2MHz.pword[PULSES_WORD_SIZE/2];

    if(pulsePol)
    {
        PORTE |= 0x80 ; // (1<<OUT_B_PPM);
        pulsePol = 0;
    }else{
        PORTE &= ~0x80 ;		// (1<<OUT_B_PPM);
        pulsePol = 1;
    }

    OCR3A  = *pulsePtr++;
    OCR3B = B3_comp_value ;
    
    if( *pulsePtr == 0)
    {
        pulsePtr = &pulses2MHz.pword[PULSES_WORD_SIZE/2];
        pulsePol = g_model.pulsePol;//0;     // changed polarity
    }
    heartbeat |= HEART_TIMER2Mhz;
}

ISR(TIMER3_COMPB_vect) //2MHz pulse generation
{
    sei() ;
    if ( Current_protocol != g_model.protocol )
		{
    	if ( Current_protocol == PROTO_PPMSIM )
			{
        setupPulses();
			}
		}
		else
		{
    	setupPulsesPPM16(g_model.protocol) ;
		}
}


void setupPulsesPPM16( uint8_t proto )
{
    int16_t PPM_range = g_model.extendedLimits ? 640*2 : 512*2;   //range of 0.7..1.7msec

    //Total frame length = 22.5msec
    //each pulse is 0.7..1.7ms long with a 0.3ms stop tail
    //The pulse ISR is 2mhz that's why everything is multiplied by 2
    uint16_t *ptr ;
    ptr = &pulses2MHz.pword[PULSES_WORD_SIZE/2] ;
    uint8_t p= ( ( proto == PROTO_PPM16) ? 16 : 8 ) +g_model.ppmNCH*2 ; //Channels *2
    uint16_t q=(g_model.ppmDelay*50+300)*2; //Stoplen *2
    uint16_t rest=22500u*2-q; //Minimum Framelen=22.5 ms
    rest += (int16_t(g_model.ppmFrameLength))*1000;
    //    if(p>9) rest=p*(1720u*2 + q) + 4000u*2; //for more than 9 channels, frame must be longer
		for( uint8_t i = (proto == PROTO_PPM16) ? p-8 : 0 ;i<p ; i++ )
    { //NUM_CHNOUT
        int16_t v = max(min(g_chans512[i],PPM_range),-PPM_range) + PPM_CENTER;
 	      rest -= v ; // (*ptr + q);
        *ptr++ = q;
				*ptr++ = v - q ; /* as Pat MacKenzie suggests */
    }
    *ptr=q;       //reverse these two assignments
    *(ptr+1)=rest;
    B3_comp_value = rest - 1000 ;		// 500uS before end of sync pulse
    *(ptr+2)=0;

}


const prog_uint16_t APM CRCTable[]=
{
    0x0000,0x1189,0x2312,0x329b,0x4624,0x57ad,0x6536,0x74bf,
    0x8c48,0x9dc1,0xaf5a,0xbed3,0xca6c,0xdbe5,0xe97e,0xf8f7,
    0x1081,0x0108,0x3393,0x221a,0x56a5,0x472c,0x75b7,0x643e,
    0x9cc9,0x8d40,0xbfdb,0xae52,0xdaed,0xcb64,0xf9ff,0xe876,
    0x2102,0x308b,0x0210,0x1399,0x6726,0x76af,0x4434,0x55bd,
    0xad4a,0xbcc3,0x8e58,0x9fd1,0xeb6e,0xfae7,0xc87c,0xd9f5,
    0x3183,0x200a,0x1291,0x0318,0x77a7,0x662e,0x54b5,0x453c,
    0xbdcb,0xac42,0x9ed9,0x8f50,0xfbef,0xea66,0xd8fd,0xc974,
    0x4204,0x538d,0x6116,0x709f,0x0420,0x15a9,0x2732,0x36bb,
    0xce4c,0xdfc5,0xed5e,0xfcd7,0x8868,0x99e1,0xab7a,0xbaf3,
    0x5285,0x430c,0x7197,0x601e,0x14a1,0x0528,0x37b3,0x263a,
    0xdecd,0xcf44,0xfddf,0xec56,0x98e9,0x8960,0xbbfb,0xaa72,
    0x6306,0x728f,0x4014,0x519d,0x2522,0x34ab,0x0630,0x17b9,
    0xef4e,0xfec7,0xcc5c,0xddd5,0xa96a,0xb8e3,0x8a78,0x9bf1,
    0x7387,0x620e,0x5095,0x411c,0x35a3,0x242a,0x16b1,0x0738,
    0xffcf,0xee46,0xdcdd,0xcd54,0xb9eb,0xa862,0x9af9,0x8b70,
    0x8408,0x9581,0xa71a,0xb693,0xc22c,0xd3a5,0xe13e,0xf0b7,
    0x0840,0x19c9,0x2b52,0x3adb,0x4e64,0x5fed,0x6d76,0x7cff,
    0x9489,0x8500,0xb79b,0xa612,0xd2ad,0xc324,0xf1bf,0xe036,
    0x18c1,0x0948,0x3bd3,0x2a5a,0x5ee5,0x4f6c,0x7df7,0x6c7e,
    0xa50a,0xb483,0x8618,0x9791,0xe32e,0xf2a7,0xc03c,0xd1b5,
    0x2942,0x38cb,0x0a50,0x1bd9,0x6f66,0x7eef,0x4c74,0x5dfd,
    0xb58b,0xa402,0x9699,0x8710,0xf3af,0xe226,0xd0bd,0xc134,
    0x39c3,0x284a,0x1ad1,0x0b58,0x7fe7,0x6e6e,0x5cf5,0x4d7c,
    0xc60c,0xd785,0xe51e,0xf497,0x8028,0x91a1,0xa33a,0xb2b3,
    0x4a44,0x5bcd,0x6956,0x78df,0x0c60,0x1de9,0x2f72,0x3efb,
    0xd68d,0xc704,0xf59f,0xe416,0x90a9,0x8120,0xb3bb,0xa232,
    0x5ac5,0x4b4c,0x79d7,0x685e,0x1ce1,0x0d68,0x3ff3,0x2e7a,
    0xe70e,0xf687,0xc41c,0xd595,0xa12a,0xb0a3,0x8238,0x93b1,
    0x6b46,0x7acf,0x4854,0x59dd,0x2d62,0x3ceb,0x0e70,0x1ff9,
    0xf78f,0xe606,0xd49d,0xc514,0xb1ab,0xa022,0x92b9,0x8330,
    0x7bc7,0x6a4e,0x58d5,0x495c,0x3de3,0x2c6a,0x1ef1,0x0f78
};






uint8_t PcmByte ;
uint8_t PcmBitCount ;
uint8_t *PcmPtr ;
uint16_t PcmCrc ;
uint8_t PcmOnesCount ;

void crc( uint8_t data )
{
    //	uint8_t i ;

    PcmCrc=(PcmCrc>>8)^pgm_read_word(&CRCTable[(PcmCrc^data) & 0xFF]);
}


void putPcmPart( uint8_t value )
{
    PcmByte >>= 2 ;
    PcmByte |= value ;
    if ( ++PcmBitCount >= 4 )
    {
        *PcmPtr++ = PcmByte ;
        PcmBitCount = PcmByte = 0 ;
    }
}


void putPcmFlush()
{
    while ( PcmBitCount != 0 )
    {
  	putPcmPart( 0 ) ; // Empty
    }
    *PcmPtr = 0 ;				// Mark end
}

void putPcmBit( uint8_t bit )
{
    if ( bit )
    {
        PcmOnesCount += 1 ;
        putPcmPart( 0x80 ) ;
    }
    else
    {
        PcmOnesCount = 0 ;
        putPcmPart( 0xC0 ) ;
    }
    if ( PcmOnesCount >= 5 )
    {
        putPcmBit( 0 ) ;				// Stuff a 0 bit in
    }
}

void putPcmByte( uint8_t byte )
{
    uint8_t i ;

    crc( byte ) ;

    for ( i = 0 ; i < 8 ; i += 1 )
    {
        putPcmBit( byte & 0x80 ) ;
        byte <<= 1 ;
    }
}

void putPcmHead()
{
    // send 7E, do not CRC
    // 01111110
    putPcmPart( 0xC0 ) ;
    putPcmPart( 0x80 ) ;
    putPcmPart( 0x80 ) ;
    putPcmPart( 0x80 ) ;
    putPcmPart( 0x80 ) ;
    putPcmPart( 0x80 ) ;
    putPcmPart( 0x80 ) ;
    putPcmPart( 0xC0 ) ;
}

//void setUpPulsesPCM()
void setupPulsesPXX()
{
    uint8_t i ;
    uint16_t chan ;
    uint16_t chan_1 ;

    pulses2MHzptr = pulses2MHz.pbyte ;
    PcmPtr = pulses2MHz.pbyte ;
    PcmCrc = 0 ;
    PcmBitCount = PcmByte = 0 ;
    PcmOnesCount = 0 ;
    putPcmHead(  ) ;  // sync byte
    putPcmByte( g_model.ppmNCH ) ;     // putPcmByte( g_model.rxnum ) ;  //
    putPcmByte( pxxFlag ) ;     // First byte of flags
    putPcmByte( 0 ) ;     // Second byte of flags
    pxxFlag = 0;          // reset flag after send
    for ( i = 0 ; i < 8 ; i += 2 )		// First 8 channels only
    {																	// Next 8 channels would have 2048 added
        chan = g_chans512[i] *3 / 4 + 2250 ;
        chan_1 = g_chans512[i+1] *3 / 4 + 2250 ;
//        if ( chan > 2047 )
//        {
//            chan = 2047 ;
//        }
//        if ( chan_1 > 2047 )
//        {
//            chan_1 = 2047 ;
//        }
        putPcmByte( chan ) ; // Low byte of channel
        putPcmByte( ( ( chan >> 8 ) & 0x0F ) | ( chan_1 << 4) ) ;  // 4 bits each from 2 channels
        putPcmByte( chan_1 >> 4 ) ;  // High byte of channel
    }
    chan = PcmCrc ;		        // get the crc
    putPcmByte( chan ) ; 			// Checksum lo
    putPcmByte( chan >> 8 ) ; // Checksum hi
    putPcmHead(  ) ;      // sync byte
    putPcmFlush() ;
    OCR1C += 40000 ;		// 20mS on
    PORTB |= (1<<OUT_B_PPM);
}



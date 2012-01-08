#include "er9x.h"
#include "pulses.h"

extern uint16_t g_tmr1Latency_max;
extern uint16_t g_tmr1Latency_min;

union p2mhz_t 
{
	uint16_t pword[72] ;   //72
	uint8_t pbyte[144] ;   //144
} pulses2MHz ;

uint8_t *pulses2MHzptr = pulses2MHz.pbyte ;
uint8_t heartbeat;
uint8_t Current_protocol ;

#define CTRL_END 0
#define CTRL_CNT 1
#define CTRL_REP_1CMD -3
#define CTRL_REP_2CMD -6

#define BindBit 0x80
#define RangeCheckBit 0x20
#define FranceBit 0x10
#define DsmxBit  0x08
#define BadData 0x47

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
        cli();
        TIMSK |= (1<<OCIE1A);
        sei();
    }
    heartbeat |= HEART_TIMER2Mhz;
}

void setupPulses()
{
//	SPY_ON;
	if ( Current_protocol != g_model.protocol )
	{
		Current_protocol = g_model.protocol ;
		// switch mode here
    switch(g_model.protocol)
    {
	    case PROTO_PPM:
				TCCR1B = 0 ;			// Stop counter
			  OCR1A = 40000 ;		// Next frame starts in 20 mS
				TCNT1 = 0 ;
				TIMSK &= ~0x3C ;	// All interrupts off
				TIFR = 0x3C ;			// Clear all pending interrupts
				TIMSK |= 0x10 ;		// Enable COMPA
				TCCR1A = (0<<WGM10) ;
			  TCCR1B = (1 << WGM12) | (2<<CS10) ; // CTC OCRA, 16MHz / 8
      break;
	    case PROTO_PXX:
				// do nothing, not yet implemented				
      break;
	    case PROTO_DSM2:
				TCCR1B = 0 ;			// Stop counter
				OCR1B = 200 ;			// 100 uS
				TCNT1 = 300 ;			// Past the OCR1B value
			  ICR1 = 44000 ;		// Next frame starts in 22 mS
				TIMSK &= ~0x3C ;	// All interrupts off
				TIFR = 0x3C ;			// Clear all pending interrupts
				TIMSK |= 0x28 ;		// Enable CAPT and COMPB
				TCCR1A = (0<<WGM10) ;
			  TCCR1B = (3 << WGM12) | (2<<CS10) ; // CTC ICR, 16MHz / 8
      break;
    }
		
	}
    switch(g_model.protocol)
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
#define PPM_CENTER 1200*2
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
        rest-=(v+q);
//        *ptr++ = q;      //moved down two lines
        //        pulses2MHz[j++] = q;
        *ptr++ = v - q + 600; /* as Pat MacKenzie suggests */
        //        pulses2MHz[j++] = v - q + 600; /* as Pat MacKenzie suggests */
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





void setupPulsesPXX()
{

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
      uint16_t pulse = limit(0, (g_chans512[i]>>1)+512,1023);
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

/*
ISR(TIMER1_CAPT_vect) //2MHz pulse generation
{
  static uint8_t  pulsePol;
	uint8_t x ;
  if(pulsePol)
  {
    PORTB |=  (1<<OUT_B_PPM);
    pulsePol = 0;
  }
	else
	{
    PORTB &= ~(1<<OUT_B_PPM);
    pulsePol = 1;
  }
  x = *Dsm2_pulsePtr++;		// Byte size
  ICR1 = x ;
	if ( x > 200 )
	{
		pulsePol = 0 ;		// Make sure pulses are the correct way up		
	}
  heartbeat |= HEART_TIMER2Mhz;
}
*/


   ISR(TIMER1_CAPT_vect) //2MHz pulse generation
    {
      static uint8_t  pulsePol;
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


ISR(TIMER1_COMPB_vect) // DSM2 end of frame
{
  ICR1 = 41536 ; //next frame starts in 22 msec 41536 = 2*(22000 - 14*11*8)
  if (OCR1B<255) OCR1B = 39000;  //delay setup pulses by 19.5 msec to reduce sytem latency
  else
  {
   	 OCR1B=200;
     sei();
     setupPulses();
  }
}

 

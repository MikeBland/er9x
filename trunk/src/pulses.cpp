#include "er9x.h"
#include "pulses.h"

extern uint16_t g_tmr1Latency_max;
extern uint16_t g_tmr1Latency_min;

uint16_t pulses2MHz[70] = {0};
uint16_t *pulses2MHzptr = pulses2MHz;
uint8_t heartbeat;


#define CTRL_END 0
#define CTRL_CNT 1
#define CTRL_REP_1CMD -3
#define CTRL_REP_2CMD -6

//uint16_t PulseTotal ;

//ISR(TIMER1_OVF_vect)
ISR(TIMER1_COMPA_vect) //2MHz pulse generation
{
    static uint8_t   pulsePol;
    static uint16_t *pulsePtr = pulses2MHz;

    uint8_t i = 0;
    while((TCNT1L < 10) && (++i < 50))  // Timer does not read too fast, so i
        ;
    uint16_t dt=TCNT1;//-OCR1A;

    if(pulsePol)
    {
        PORTB |=  (1<<OUT_B_PPM);
        pulsePol = 0;
    }else{
        PORTB &= ~(1<<OUT_B_PPM);
        pulsePol = 1;
    }
    if ( dt > g_tmr1Latency_max) g_tmr1Latency_max = dt ;    // max has leap, therefore vary in length
    if ( dt < g_tmr1Latency_min) g_tmr1Latency_min = dt ;    // max has leap, therefore vary in length

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

    if( *pulsePtr == 0) {
        //currpulse=0;
        pulsePtr = pulses2MHz;
        pulsePol = g_model.pulsePol;//0;
        //    channel = 0 ;
        //    PulseTotal = 0 ;

        TIMSK &= ~(1<<OCIE1A); //stop reentrance
        sei();
        setupPulses();
        cli();
        TIMSK |= (1<<OCIE1A);
    }
    heartbeat |= HEART_TIMER2Mhz;
}

void setupPulses()
{
    switch(g_model.protocol)
    {
    case PROTO_PPM:
        setupPulsesPPM();
        break;
    case PROTO_PXX:
        setupPulsesPXX();
        break;
    case PROTO_DSM2:
        setupPulsesDsm2(6);
        break;
    }
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
    ptr = pulses2MHz ;
    uint8_t p=8+g_model.ppmNCH*2; //Channels *2
    uint16_t q=(g_model.ppmDelay*50+300)*2; //Stoplen *2
    uint16_t rest=22500u*2-q; //Minimum Framelen=22.5 ms
    rest += (int16_t(g_model.ppmFrameLength))*1000;
    //    if(p>9) rest=p*(1720u*2 + q) + 4000u*2; //for more than 9 channels, frame must be longer
    for(uint8_t i=0;i<p;i++){ //NUM_CHNOUT
        int16_t v = max(min(g_chans512[i],PPM_range),-PPM_range) + PPM_CENTER;
        rest-=(v+q);
        *ptr++ = q;
        //        pulses2MHz[j++] = q;
        *ptr++ = v - q + 600; /* as Pat MacKenzie suggests */
        //        pulses2MHz[j++] = v - q + 600; /* as Pat MacKenzie suggests */
    }
    *ptr=q;
    *(ptr+1)=rest;
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
    _send_1(len + 10*BITLEN_DSM2 -1); //some more space-time for security
}


void setupPulsesDsm2(uint8_t chns)
{
    static uint8_t dsmDat[2+6*2]={0x80,0,  0x00,0xAA,  0x05,0xFF,  0x09,0xFF,  0x0D,0xFF,  0x13,0x54,  0x14,0xAA};

    static uint8_t state = 0;

    pulses2MHzptr = pulses2MHz;
    
    if(state==0){

        if((dsmDat[0] == 0) || ! keyState(SW_Trainer) ){ //init - bind!
            dsmDat[0]=0; dsmDat[1]=0;  //DSM2_Header = 0,0;
            for(uint8_t i=0; i<chns; i++){
                uint16_t pulse = limit(0, g_chans512[i]+512,1023);
                dsmDat[2+2*i] = (i<<2) | ((pulse>>8)&0x03);
                dsmDat[3+2*i] = pulse & 0xff;
            }
        }
    }
    sendByteDsm2(dsmDat[state++]);
    sendByteDsm2(dsmDat[state++]);
    if(state >= 2+chns*2){
        pulses2MHzptr-=3; //remove last stopbits and
        _send_1(20000u*2 -1); //prolong them
        state=0;
    }
}

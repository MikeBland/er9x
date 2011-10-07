/*
 * Author - Rob Thomson <rob@marotori.com>
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
#ifndef audio_h
#define audio_h

//audio
#define AUDIO_QUEUE_LENGTH (5)  //5 seems to suit most alerts
#define BEEP_DEFAULT_FREQ (70)
#define BEEP_OFFSET (10)
#define BEEP_KEY_UP_FREQ  (BEEP_DEFAULT_FREQ+5)
#define BEEP_KEY_DOWN_FREQ (BEEP_DEFAULT_FREQ-5)

#define AUDIO_QUEUE_HEARTBEAT_XSHORT (30) //speaker timing [Norm]
#define AUDIO_QUEUE_HEARTBEAT_SHORT (50) //speaker timing [Norm]
#define AUDIO_QUEUE_HEARTBEAT_NORM (77) //speaker timing [Norm]
#define AUDIO_QUEUE_HEARTBEAT_LONG (130) //speaker timing [Long]
#define AUDIO_QUEUE_HEARTBEAT_XLONG (200) //speaker timing [xLong]



#define HAPTIC_ON    PORTG |=  (1<<2)
#define HAPTIC_OFF   PORTG &= ~(1<<2)

/* make sure the defines below always go in numeric order */
#define AUDIO_TADA (0)
#define AUDIO_WARNING1 (1)
#define AUDIO_WARNING2 (2)
#define AUDIO_WARNING3 (3)
#define AUDIO_ERROR (4)
#define AUDIO_KEYPAD_UP (5)
#define AUDIO_KEYPAD_DOWN (6)
#define AUDIO_TRIM_MOVE (7)
#define AUDIO_TRIM_MIDDLE (8)
#define AUDIO_MENUS (9)
#define AUDIO_POT_STICK_MIDDLE (10)
#define AUDIO_MIX_WARNING_1 (11)
#define AUDIO_MIX_WARNING_2 (12)
#define AUDIO_MIX_WARNING_3 (13)
#define AUDIO_TIMER_30 (14)
#define AUDIO_TIMER_20 (15)
#define AUDIO_TIMER_10 (16)
#define AUDIO_TIMER_LT3 (17)
#define AUDIO_INACTIVITY (18)
#define AUDIO_TX_BATTERY_LOW (19)

#define BEEP_QUIET (0)
#define BEEP_NOKEYS (1)
#define BEEP_XSHORT (2)
#define BEEP_SHORT (3)
#define BEEP_NORMAL (4)
#define BEEP_LONG (5)
#define BEEP_XLONG (6)



//extern uint8_t g_beepVal[5];


struct audioQueue{


    //queue temporaries
    uint8_t t_queueToneStart;
    uint8_t t_queueToneEnd;
    uint8_t t_queueToneLength;
    uint8_t t_queueTonePause;
    uint8_t t_queueToneRepeat;
    uint8_t t_queueToneHaptic;

    //queue general vars
    uint8_t toneFreq;
    uint8_t toneFreqEnd;
    uint8_t toneTimeLeft;
    uint8_t rateOfChange;
    uint8_t DirectionOfChange;
    uint8_t toneInterupt;
    uint8_t tonePause;
    uint8_t queueState;
    uint8_t toneRepeat;
    uint8_t toneRepeatCnt;
    uint8_t inToneRepeat;
    uint8_t toneHaptic;
    uint8_t hapticTick;
   	uint8_t heartbeatTimer;
   	
   	
    //queue arrays
    uint8_t queueToneStart[AUDIO_QUEUE_LENGTH];
    uint8_t queueToneEnd[AUDIO_QUEUE_LENGTH];
    uint8_t queueToneLength[AUDIO_QUEUE_LENGTH];
    uint8_t queueTonePause[AUDIO_QUEUE_LENGTH];
    uint8_t queueToneRepeat[AUDIO_QUEUE_LENGTH];
    uint8_t queueToneHaptic[AUDIO_QUEUE_LENGTH];
    
    //beep length table
    uint8_t beepLenTable[10];


public:
    //constructor
    audioQueue();

		void aqinit() ;		// To stop constructor being compiled twice

		//only difference between these two functions is that one does the 
		//interupt queue (Now) and the other queues for playing ASAP.
		void playNow(uint8_t tStart,uint8_t tLen,uint8_t tPause,uint8_t tRepeat=0,uint8_t tHaptic=0,uint8_t tEnd=0);	
		void playASAP(uint8_t tStart,uint8_t tLen,uint8_t tPause,uint8_t tHaptic=0,uint8_t tRepeat=0,uint8_t tEnd=0);

		void event(uint8_t e,uint8_t f=BEEP_DEFAULT_FREQ);

    void commit();
    
    //set all temporary buffers to default
    void flushTemp();

    void restack();
    //heartbeat is responsibile for issueing the audio tones and general square waves
    // it is essentially the life of the class.
    void heartbeat();
};

//wrapper function - dirty but results in a space saving!!!
extern audioQueue  audio;
//void audioevent(uint8_t e,uint8_t f=BEEP_DEFAULT_FREQ);
void audioDefevent(uint8_t e);




#endif // audio_h

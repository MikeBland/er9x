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
#define AUDIO_QUEUE_LENGTH (10)
#define BEEP_DEFAULT_FREQ (70)
#define BEEP_OFFSET (10)
#define BEEP_KEY_UP_FREQ  (BEEP_DEFAULT_FREQ+5)
#define BEEP_KEY_DOWN_FREQ (BEEP_DEFAULT_FREQ-5)
#define AUDIO_QUEUE_HEARTBEAT (77) //speaker timing
#define HAPTIC_ON    PORTG |=  (1<<2)
#define HAPTIC_OFF   PORTG &= ~(1<<2)



extern uint8_t g_beepVal[5];


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
    //uint8_t HapticTimer;

    //queue arrays
    uint8_t queueToneStart[AUDIO_QUEUE_LENGTH];
    uint8_t queueToneEnd[AUDIO_QUEUE_LENGTH];
    uint8_t queueToneLength[AUDIO_QUEUE_LENGTH];
    uint8_t queueTonePause[AUDIO_QUEUE_LENGTH];
    uint8_t queueToneRepeat[AUDIO_QUEUE_LENGTH];
    uint8_t queueToneHaptic[AUDIO_QUEUE_LENGTH];


public:
    //constructor
    audioQueue();

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




#endif // audio_h

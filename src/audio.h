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


    // these methods simply set the temporary buffer to the params.
    // to commit to the queue you run the member commit.
    void start(uint8_t x){
        t_queueToneStart=x;
    }

    void end(uint8_t x){
        t_queueToneEnd=x;
    }

    void interrupt(){
        toneInterupt = 1;
    }

    void length(uint8_t x){
        t_queueToneLength=x;
    }

    void pause(uint8_t x){
        t_queueTonePause=x;
    }

    void repeat(uint8_t x){
        t_queueToneRepeat=x;
    }

    void haptic(){
        t_queueToneHaptic=1;
    }

    void commit();

    //set all temporary buffers to default
    void flushTemp();

    void restack();


    //heartbeat is responsibile for issueing the audio tones and general square waves
    // it is essentially the life of the class.
    void heartbeat();


    //pre made tune to play the 'startup' tune
    void tada();

    //standard beep function
    void beep(uint8_t freq=BEEP_DEFAULT_FREQ,uint8_t len=g_beepVal[0],uint8_t hap=0,uint8_t rep=0);

    //standard warn function
    void warn(uint8_t level=1,uint8_t freq = BEEP_DEFAULT_FREQ);

    //standard error function
    void error(){
        beep(BEEP_DEFAULT_FREQ,g_beepVal[4],1);
    }


};




#endif // audio_h

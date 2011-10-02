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
#include "er9x.h"
#include "audio.h"


audioQueue::audioQueue()
{
    //make sure haptic off by default

    HAPTIC_OFF;

    //initialize all arrays
    for(uint8_t i=0; i<=AUDIO_QUEUE_LENGTH; i++){
        queueToneStart[i] = 0;
        queueToneEnd[i] = 0;
        queueToneLength[i] = 0;
        queueTonePause[i] = 0;
        queueToneRepeat[i] = 0;
        queueToneHaptic[i] = 0;
    }

    //set key vars to 0 to ensure no garbage
    toneFreq = 0;
    toneFreqEnd = 0;
    toneRepeat = 0;
    toneTimeLeft = 0;
    queueState = 0;
    toneRepeatCnt = 0;
    inToneRepeat = 0;
    hapticTick = 0;


    // set 'temp vars' to default
    flushTemp();

}


void audioQueue::commit()
{
    //step through the queue and insert at first free slot
    if(toneInterupt == 0){
        for(uint8_t i=0; i<=AUDIO_QUEUE_LENGTH-1; i++){
            if(queueToneStart[i] == 0){ //we only check the start var as this is the master
                queueToneStart[i] = t_queueToneStart;
                queueToneEnd[i] = t_queueToneEnd;
                queueToneLength[i] = t_queueToneLength;
                queueTonePause[i] = t_queueTonePause;
                queueToneRepeat[i] = t_queueToneRepeat;
                queueToneHaptic[i] = t_queueToneHaptic;
                inToneRepeat = 0;
                flushTemp();
                break;
            }
        }
    }  else {
        queueToneStart[0] = t_queueToneStart;
        queueToneEnd[0] = t_queueToneEnd;
        queueToneLength[0] = t_queueToneLength;
        queueTonePause[0] = t_queueTonePause;
        queueToneRepeat[0] = t_queueToneRepeat;
        queueToneHaptic[0] = t_queueToneHaptic;
        flushTemp();
    }
}

//set all temporary buffers to default
void audioQueue::flushTemp()
{
    t_queueToneStart = 0;
    t_queueToneEnd = 0;
    t_queueToneLength = 0;
    t_queueTonePause = 0;
    t_queueToneRepeat = 0;
    t_queueToneHaptic = 0;
    rateOfChange = 0;
    toneInterupt = 0;
    toneHaptic = 0;
}


void audioQueue::restack()
{
    for(uint8_t i=0; i<=AUDIO_QUEUE_LENGTH-1; i++){
        if(i == (AUDIO_QUEUE_LENGTH -1)){          //set the last entry to 0 as nothing in stack to add too!
            queueToneStart[i] = 0;
            queueToneEnd[i] = 0;
            queueToneLength[i] = 0;
            queueTonePause[i] = 0;
            queueToneRepeat[i] = 0;
            queueToneHaptic[i] = 0;
        } else {      //shift all values one up in the stack.
            queueToneStart[i] = queueToneStart[i+1];
            queueToneEnd[i] = queueToneEnd[i+1];
            queueToneLength[i] = queueToneLength[i+1];
            queueTonePause[i] = queueTonePause[i+1];
            queueToneRepeat[i] = queueToneRepeat[i+1];
            queueToneHaptic[i] = queueToneHaptic[i+1];
        }
    }
}


//heartbeat is responsibile for issueing the audio tones and general square waves
// it is essentially the life of the class.
void audioQueue::heartbeat()
{

    uint8_t y; //direction calulations
    uint8_t z; //direction calulations


    if(queueState == 1){

#ifdef BEEPSPKR
        //square wave generator use for speaker mod
        //simply generates a square wave for toneFreq for
        //as long as the toneTimeLeft is more than 0
        static uint8_t toneCounter;
        if (toneTimeLeft > 0){
            toneCounter += toneFreq;
            if ((toneCounter & 0x80) == 0x80){
                PORTE |=  (1<<OUT_E_BUZZER); // speaker output 'high'
            } else {
                PORTE &=  ~(1<<OUT_E_BUZZER); // speaker output 'low'
            }
        } else {
            PORTE &=  ~(1<<OUT_E_BUZZER); // speaker output 'low'
        }
#else
        //stock beeper. simply turn port on for x time!
        if (toneTimeLeft > 0){
            PORTE |=  (1<<OUT_E_BUZZER); // speaker output 'high'
        } else {
            PORTE &=  ~(1<<OUT_E_BUZZER); // speaker output 'low'
        }
#endif


        uint8_t hapticStrength = -abs( g_eeGeneral.hapticStrength) + 6;
        if(hapticStrength == 5){
            hapticStrength = 0;
        }
        if (toneHaptic == 1){
            //we only power it ever X number of ticks to provide a crude speed control
            if((hapticTick == hapticStrength || hapticTick+1 == hapticStrength) && hapticStrength > 0){
                HAPTIC_ON; // haptic output 'high'
                hapticTick = 0;
            } else {
                HAPTIC_OFF; //haptic output low
                hapticTick++;
            }
        } else {
            HAPTIC_OFF; // haptic output 'low'
        }


    } else {
        PORTE &=  ~(1<<OUT_E_BUZZER); // speaker output 'low'
        HAPTIC_OFF;
    }



    //step through array checking if we have any tones to play
    //next heartbeat will play whatever we put in queue
    if((queueToneStart[0] > 0 || queueToneHaptic[0] == 1) && toneTimeLeft <= 0 && queueState == 0){

        //scaling handler
        if(queueToneEnd[0] > 0 && queueToneEnd[0] != queueToneStart[0]){

            //if toneEnd is set then we scale the sound to from start to finish
            //at an effective speed determined by the queueToneLength value
            toneFreq = queueToneStart[0] + g_eeGeneral.speakerPitch;
            //calculate the rate of climb
            if(queueToneStart[0] > queueToneEnd[0]){  //tone going down
                z = queueToneStart[0] - queueToneEnd[0];
                y = 0;
            } else { //tone going up
                z = queueToneEnd[0] - queueToneStart[0];
                y = 1;
            }
            toneFreq=queueToneStart[0] + g_eeGeneral.speakerPitch; // add pitch compensator
            toneFreqEnd=queueToneEnd[0] + g_eeGeneral.speakerPitch;
            toneTimeLeft = queueToneLength[0];
            toneTimeLeft = z;
            tonePause = queueTonePause[0];
            rateOfChange = 1;
            DirectionOfChange = y;
            toneRepeat = queueToneRepeat[0];
            toneHaptic = queueToneHaptic[0];
        }	else {

            //simple tone handler
            toneFreq=(queueToneStart[0] + g_eeGeneral.speakerPitch) + BEEP_OFFSET; // add pitch compensator
            toneTimeLeft = queueToneLength[0];
            tonePause = queueTonePause[0];
            toneRepeat = queueToneRepeat[0];
            toneHaptic = queueToneHaptic[0];
            DirectionOfChange = 0;
            rateOfChange = 0;
            toneFreqEnd = 0;
        }
        queueState = 1;
        //HapticTimer = BEEP_HAPTIC_LENGTH;

        if(toneRepeat != 0 && inToneRepeat == 0){
            inToneRepeat = 1;
            toneRepeatCnt = toneRepeat;
        }

        if(inToneRepeat == 1){
            toneRepeatCnt--;
            if(toneRepeatCnt <= 0){
                inToneRepeat = 0;
                //p = 0;
                restack();
            }
        } else {
            //p = 0;
            restack();
        }

    }



    //count down the timer
    static uint8_t cntms = AUDIO_QUEUE_HEARTBEAT;
    if (cntms-- == 0){
        cntms = AUDIO_QUEUE_HEARTBEAT;

        if(toneTimeLeft > 0 && queueState == 1){
            //play the tone


            //alter tone for scaling sound effect
            if(rateOfChange == 1){
                if(DirectionOfChange == 1){
                    toneFreq = toneFreq + rateOfChange;
                } else {
                    toneFreq = toneFreq - rateOfChange;
                }
            }

            toneTimeLeft--; //time gets counted down
        }
        if(toneTimeLeft <= 0 && queueState == 1){
            if(tonePause--	<= 0){
                queueState = 0;
            }
        }
    }

}



//pre made tune to play the 'startup' tune
void audioQueue::tada()
{
    start(50);
    length(10);
    pause(5);
    commit();

    start(90);
    length(10);
    pause(5);
    commit();

    start(110);
    length(6);
    repeat(2);
    pause(4);
    commit();
}



//standard beep function
void audioQueue::beep(uint8_t freq,uint8_t len,uint8_t hap,uint8_t rep)
{
    start(freq);
    length(len);
    pause(1);
    if(hap == 1){
        haptic();
    }
    if(rep != 0){
        repeat(rep);
    }
    interrupt();
    commit();
}

//standard warn function
void audioQueue::warn(uint8_t level,uint8_t freq)
{

    uint8_t len;
    switch (level){
    case 1:
        len = g_beepVal[3];
    case 2:
        len = g_beepVal[1];
    case 3:
        len = g_beepVal[2];
    default:
        len = g_beepVal[3];
    }
    //call beep function
    //with haptic feedback enabled
    beep(freq,len,1);
}




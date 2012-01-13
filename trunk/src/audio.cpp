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
//#include "audio.h"


audioQueue::audioQueue()
{
	aqinit() ;
}

void audioQueue::aqinit()
{
    //make sure haptic off by default

    HAPTIC_OFF;

    //initialize all arrays
    //for(uint8_t i=0; i<=AUDIO_QUEUE_LENGTH-1; i++){
    for(uint8_t i=0; i<AUDIO_QUEUE_LENGTH; i++){
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

#ifdef FRSKY
		frskySample = 0;
#endif    

		heartbeatTimer = 0;


    // set 'temp vars' to default
    flushTemp();

}

bool audioQueue::busy(){
			if(toneTimeLeft > 0){
					return true;
			}	 else {
					return false;
			}	
}

void audioQueue::commit()
{

    if(toneInterupt == 0){
        //for(uint8_t i=0; i<=AUDIO_QUEUE_LENGTH-1; i++){
      for(uint8_t i=0; i<AUDIO_QUEUE_LENGTH; i++){
            if(queueToneStart[i] == 0){ //we only check the start var as this is the master
                queueToneStart[i] = t_queueToneStart;
                queueToneEnd[i] = t_queueToneEnd;
                queueToneLength[i] = t_queueToneLength;
                queueTonePause[i] = t_queueTonePause;
                queueToneRepeat[i] = t_queueToneRepeat;
                queueToneHaptic[i] = t_queueToneHaptic;
                //inToneRepeat = 0;
                flushTemp();
                break;
            } 
        }
    }  else {
				//aqinit();
        queueToneStart[0] = t_queueToneStart;
        queueToneEnd[0] = t_queueToneEnd;
        queueToneLength[0] = t_queueToneLength;
        queueTonePause[0] = t_queueTonePause;
        queueToneRepeat[0] = t_queueToneRepeat;
        queueToneHaptic[0] = t_queueToneHaptic;

				//force everything else in queue to be flushed
				//as this stops things sounding broken on an interrupt routine!
		    for(uint8_t i=1; i<AUDIO_QUEUE_LENGTH; i++){
		        queueToneStart[i] = 0;
		        queueToneEnd[i] = 0;
		        queueToneLength[i] = 0;
		        queueTonePause[i] = 0;
		        queueToneRepeat[i] = 0;
		        queueToneHaptic[i] = 0;
		    }        
        
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
			    for(uint8_t i=0; i<AUDIO_QUEUE_LENGTH; i++){
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
		uint8_t hTimer; //heartbeat timer

    if(queueState == 1){

			if(g_eeGeneral.beeperVal > 0){ 
						//never do sounds if we are set to go quiet 

							switch (g_eeGeneral.speakerMode){
								
									case 0:
							        	//stock beeper. simply turn port on for x time!
								        if (toneTimeLeft > 0){
								            PORTE |=  (1<<OUT_E_BUZZER); // speaker output 'high'
								        } else {
								            PORTE &=  ~(1<<OUT_E_BUZZER); // speaker output 'low'
								        }		
								        break;							
			
									case 1:
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
							        break;
							        
							     case 2:
							     	//PCMWav
							     		
							     		break;   
														
							}	

			}

        uint8_t hapticStrength = g_eeGeneral.hapticStrength;
        if (toneHaptic == 1){
            if((hapticTick <= hapticStrength-1) && hapticStrength > 0){
                HAPTIC_ON; // haptic output 'high'
                hapticTick++;
            } else {
                HAPTIC_OFF; //haptic output low
                hapticTick=0;
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
	        if(queueToneEnd[0] > 0 && queueToneEnd[0] != queueToneStart[0]){
	            if(queueToneStart[0] > queueToneEnd[0]){  //tone going down
	                z = queueToneStart[0] - queueToneEnd[0];
	                y = 0;
	            } else { //tone going up
	                z = queueToneEnd[0] - queueToneStart[0];
	                y = 1;
	            }
	            if(queueToneStart[0] > 0){
	            	toneFreq=queueToneStart[0] + g_eeGeneral.speakerPitch + BEEP_OFFSET; // add pitch compensator
	          	} else {
	          		toneFreq=queueToneStart[0]; // done so hapticOnly option can work
	          	}
	            toneFreqEnd=queueToneEnd[0] + g_eeGeneral.speakerPitch + BEEP_OFFSET;
	            rateOfChange = 1;
	            DirectionOfChange = y;
	            toneTimeLeft = z;
	            tonePause = queueTonePause[0];
	            toneRepeat = queueToneRepeat[0];
	            toneHaptic = queueToneHaptic[0];
	        }	else {					
	            //simple tone handler
	            if(queueToneStart[0] > 0){
	            	toneFreq=(queueToneStart[0] + g_eeGeneral.speakerPitch) + BEEP_OFFSET; // add pitch compensator
	          	} else {
	          		toneFreq=queueToneStart[0];
	          	}	
	            DirectionOfChange = 0;
	            rateOfChange = 0;
	            toneFreqEnd = 0;
	            toneTimeLeft = queueToneLength[0];
	            tonePause = queueTonePause[0];
	            toneRepeat = queueToneRepeat[0];
	            toneHaptic = queueToneHaptic[0];
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
    


    if(g_eeGeneral.beeperVal == 2){
    			//xshort
    			 hTimer= AUDIO_QUEUE_HEARTBEAT_XSHORT;		
    }else if(g_eeGeneral.beeperVal == 3){
    			//short
    			 hTimer= AUDIO_QUEUE_HEARTBEAT_SHORT;
		} else if(g_eeGeneral.beeperVal == 4){
    			//normal
    			 hTimer= AUDIO_QUEUE_HEARTBEAT_NORM;    			 
    } else if(g_eeGeneral.beeperVal == 5){
    			//long
    			hTimer = AUDIO_QUEUE_HEARTBEAT_LONG;
 		} else if(g_eeGeneral.beeperVal == 6){
 					//xlong
    			hTimer = AUDIO_QUEUE_HEARTBEAT_XLONG;		   			
    } else {
	    		//default
	    		hTimer = AUDIO_QUEUE_HEARTBEAT_NORM;
    }				
		
		heartbeatTimer++;
    if(heartbeatTimer >= hTimer){
        
        heartbeatTimer=0;

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


void audioQueue::playNow(uint8_t tStart,uint8_t tLen,uint8_t tPause,uint8_t tRepeat,uint8_t tHaptic,uint8_t tEnd){
        t_queueToneStart=tStart;
        t_queueToneLength=tLen;
        t_queueTonePause=tPause;
   			t_queueToneHaptic=tHaptic;
   			t_queueToneRepeat=tRepeat;
   			t_queueToneEnd=tEnd;
        toneInterupt = 1; //always interrupt in this function
        commit();
}	

void audioQueue::playASAP(uint8_t tStart,uint8_t tLen,uint8_t tPause,uint8_t tRepeat,uint8_t tHaptic,uint8_t tEnd){
        t_queueToneStart=tStart;
        t_queueToneLength=tLen;
        t_queueTonePause=tPause;
   			t_queueToneHaptic=tHaptic;
   			t_queueToneRepeat=tRepeat;
   			t_queueToneEnd=tEnd;
        toneInterupt = 0; //queue the request
        commit();
}	

#ifdef FRSKY		

		//this is done so the menu selections only plays tone once!
		void audioQueue::frskyeventSample(uint8_t e){
			if(frskySample != e){
					aqinit(); //flush the queue
					frskyevent(e);
					frskySample = e;
			}
	  }

		void audioQueue::frskyevent(uint8_t e){
			 // example playASAP(tStart,tLen,tPause,tRepeat,tHaptic,tEnd);
				switch(e){
						case AUDIO_FRSKY_WARN1: 
									playASAP(BEEP_DEFAULT_FREQ+20,25,5,2,1);		
									break;			
						case AUDIO_FRSKY_WARN2:
									playASAP(BEEP_DEFAULT_FREQ+30,25,5,2,1);		
									break;	
						case AUDIO_FRSKY_CHEEP:
									playASAP(BEEP_DEFAULT_FREQ+30,20,2,2,1,BEEP_DEFAULT_FREQ+25);				
									break;	
						case AUDIO_FRSKY_RING:
									playASAP(BEEP_DEFAULT_FREQ+25,2,2,10,1);
									playASAP(BEEP_DEFAULT_FREQ+25,2,10,1,1);	
									playASAP(BEEP_DEFAULT_FREQ+25,2,2,10,1);																		
									break;	
						case AUDIO_FRSKY_SCIFI:
									playASAP(80,4,3,2,0,70);								
									playASAP(60,4,3,2,0,70);						
									playASAP(70,2,1,0,2);			
									break;																			
						case AUDIO_FRSKY_ROBOT: 
									playASAP(70,2,1,1,1);
									playASAP(50,6,2,1,1);	
									playASAP(80,6,2,1,1);		
									break;			
						case AUDIO_FRSKY_CHIRP:
									
									playASAP(BEEP_DEFAULT_FREQ+40,2,1,2,1);		
									playASAP(BEEP_DEFAULT_FREQ+54,2,1,3,1);	
									break;	
						case AUDIO_FRSKY_TADA:
									playASAP(50,10,5);
									playASAP(90,10,5);
									playASAP(110,6,4,2);		
									break;	
						case AUDIO_FRSKY_CRICKET:
									playASAP(80,1,10,3,1);
									playASAP(80,1,20,1,1);
									playASAP(80,1,10,3,1);			
									break;	
						case AUDIO_FRSKY_SIREN:
									playASAP(10,10,10,3,1,70);								
									break;
						case AUDIO_FRSKY_ALARMC:
									playASAP(50,5,10,2,1);
									playASAP(70,5,20,1,1);									
									playASAP(50,5,10,2,1);
									playASAP(70,5,20,1,1);
									break;	
						case AUDIO_FRSKY_RATATA:	
									playASAP(BEEP_DEFAULT_FREQ+50,2,10,10,1);
									break;	
						case AUDIO_FRSKY_TICK:				
									playASAP(BEEP_DEFAULT_FREQ+50,2,50,2,1);	
									break;																																					
						case AUDIO_FRSKY_HAPTIC1:				
									playASAP(0,2,10,1,1);	
									break;		
						case AUDIO_FRSKY_HAPTIC2:				
									playASAP(0,2,10,2,1);	
									break;
						case AUDIO_FRSKY_HAPTIC3:				
									playASAP(0,2,10,3,1);	
									break;
						default:
							break;
				}				
			
		}	
#endif

void audioQueue::event(uint8_t e,uint8_t f){
	
	/*
	 0 =>  startup tune	
	 1 =>  warning one
	 2 =>  warning two
	 3 =>  warning three
	 4 =>  error
	 5 =>  keypad up
	 6 =>  keypad down
	 7 =>	 trim sticks move
	 8 =>  trim sticks center
	 9 =>	 menu display
	 10 => pot/stick center
	 11 => mix warning 1 
	 12 => mix warning 2
	 13 => mix warning 3
	 14 => timer 30 seconds
	 15 => timer 20 seconds
	 16 => timer 10 seconds	 
	 17 => timer < 3 seconds	 
	 18 => inactivity timer alert
	 19 => low battery in tx
	*/
	
	/*
	attention:
	g_eeGeneral.beeperVal == 0  ->  quiet
	g_eeGeneral.beeperVal == 1  ->  no keys
	g_eeGeneral.beeperVal == 2  ->  normal
	g_eeGeneral.beeperVal == 3  ->  long
	g_eeGeneral.beeperVal == 4  ->  xlong
	
	//these are defined!
	#define BEEP_QUIET (0)  //implicet and logic never needs to set this
	#define BEEP_NOKEYS (1) //we only wrap logic in if nokeys set!
	#define BEEP_SHORT (2)
	#define BEEP_NORMAL (3)
	#define BEEP_LONG (4)
	#define BEEP_XLONG (5)	
	
	*/
	
	uint8_t beepVal = g_eeGeneral.beeperVal;
	
	switch(e){
			//startup tune
			// case 0:
			case AUDIO_TADA:
						playASAP(50,10,5);
						playASAP(90,10,5);
						playASAP(110,6,4,2);				
						break;
						
			//warning one
			// case 1:
			case AUDIO_WARNING1:
						playNow(BEEP_DEFAULT_FREQ,25,1,0,1);		
						break;
						
			//warning two
			//case 2:
			case AUDIO_WARNING2:
						playNow(BEEP_DEFAULT_FREQ,34,1,0,1);		
						break;						

			//warning three
			//case 3:
			case AUDIO_WARNING3:
						playNow(BEEP_DEFAULT_FREQ,15,1,0,1);		
						break;
						
			//error
			//case 4:
			case AUDIO_ERROR:
						playNow(BEEP_DEFAULT_FREQ,30,1,0,1);		
						break;
																
			//keypad up (seems to be used when going left/right through system menu options. 0-100 scales etc)
			//case 5:
			case AUDIO_KEYPAD_UP:
						if(beepVal != BEEP_NOKEYS){
							playNow(BEEP_KEY_UP_FREQ,2,1);		
						}
						break;						
						
			//keypad down (seems to be used when going left/right through system menu options. 0-100 scales etc)
			//case 6:
			case AUDIO_KEYPAD_DOWN:
						if(beepVal != BEEP_NOKEYS){
							playNow(BEEP_KEY_DOWN_FREQ,2,1);		
						}
						break;						

			//trim sticks move
			//case 7:
			case AUDIO_TRIM_MOVE:
						//if(beepVal != BEEP_NOKEYS){
							playNow(f,2,1);		
						//}
						break;
							
			//trim sticks center
			//case 8:
			case AUDIO_TRIM_MIDDLE:
						//if(beepVal != BEEP_NOKEYS){
							playNow(BEEP_DEFAULT_FREQ,10,2,0,1);		
						//}
						break;
					
			//menu display (also used by a few generic beeps)		
			//case 9:
			case AUDIO_MENUS:
						if(beepVal != BEEP_NOKEYS){
							playNow(BEEP_DEFAULT_FREQ,2,2,0,1);		
						}
						break;							
			//pot/stick center	
			//case 10:
			case AUDIO_POT_STICK_MIDDLE:
						playNow(BEEP_DEFAULT_FREQ+50,3,1,0,1);		
						break;								
												
			//mix warning 1
			//case 11:
			case AUDIO_MIX_WARNING_1:
						playNow(BEEP_DEFAULT_FREQ+50,2,1,1,1);		
						break;	

			//mix warning 2
			//case 12:
			case AUDIO_MIX_WARNING_2:			
						playNow(BEEP_DEFAULT_FREQ+52,2,1,2,1);		
						break;				

			//mix warning 3
			//case 13:
			case AUDIO_MIX_WARNING_3:			
						playNow(BEEP_DEFAULT_FREQ+54,2,1,3,1);		
						break;		

			//time 30 seconds left
			//case 14:
			case AUDIO_TIMER_30:
						playNow(BEEP_DEFAULT_FREQ + 50,5,3,3,1);		
						break;		

			//time 20 seconds left
			//case 15:
			case AUDIO_TIMER_20:			
						playNow(BEEP_DEFAULT_FREQ + 50,5,3,2,1);		
						break;	

			//time 10 seconds left
			//case 16:
			case AUDIO_TIMER_10:			
						playNow(BEEP_DEFAULT_FREQ + 50,5,3,1,1);		
						break;	

			//time <3 seconds left
			//case 17:
			case AUDIO_TIMER_LT3:
						playNow(BEEP_DEFAULT_FREQ,20,5,1,1);		
						break;

			//inactivity timer alert
			//case 18:
			case AUDIO_INACTIVITY:
						playASAP(70,3,2);
						playASAP(50,3,5);																					
						break;
						
			//low battery in tx
			//case 19:
			case AUDIO_TX_BATTERY_LOW:
						playASAP(60,4,3,2,1,70);						
						playASAP(80,4,3,2,1,70);
						break;						
																												
			default:
				break;	
		
		
	}	
	
}

//wrapper function =- dirty but saves space!!!
//void audioevent(uint8_t e,uint8_t f){
//	audio.event(e,f);
//}	
void audioDefevent(uint8_t e)
{
	audio.event(e,BEEP_DEFAULT_FREQ);
}


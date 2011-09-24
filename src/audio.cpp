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

class audioQueue{


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
	uint8_t RateOfChange;
	uint8_t DirectionOfChange;
	uint8_t toneInterupt;
	uint8_t tonePause;
	uint8_t queueState;
	uint8_t toneRepeat;
	uint8_t toneRepeatCnt;
	uint8_t inToneRepeat;
	uint8_t toneHaptic;
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
		audioQueue(){
				//make sure haptic off by default
				HAPTIC_OFF;

				//initialize all arrays
			    for(uint8_t i=0; i<=AUDIO_QUEUE_LENGTH; i++){
                                        this->queueToneStart[i] = 0;
                                        this->queueToneEnd[i] = 0;
                                        this->queueToneLength[i] = 0;
                                        this->queueTonePause[i] = 0;
                                        this->queueToneRepeat[i] = 0;
                                        this->queueToneHaptic[i] = 0;
			    }

				//set key vars to 0 to ensure no garbage
				this->toneFreq = 0;
				this->toneFreqEnd = 0;
				this->toneRepeat = 0;
				this->toneTimeLeft = 0;
				this->queueState = 0;
				this->toneRepeatCnt = 0;
				this->inToneRepeat = 0;


			  // set 'temp vars' to default
			  flushTemp();

		}


		// these methods simply set the temporary buffer to the params.
		// to commit to the queue you run the member commit.
		void start(uint8_t x){
			this->t_queueToneStart=x;
		}

		void end(uint8_t x){
			this->t_queueToneEnd=x;
		}

		void interrupt(){
			this->toneInterupt = 1;
		}

		void length(uint8_t x){
			this->t_queueToneLength=x;
		}

		void pause(uint8_t x){
			this->t_queueTonePause=x;
		}

		void repeat(uint8_t x){
			this->t_queueToneRepeat=x;
		}

		void haptic(){
			this->t_queueToneHaptic=1;
		}

		void commit(){
						//step through the queue and insert at first free slot
						if(this->toneInterupt == 0){
									for(uint8_t i=0; i<=AUDIO_QUEUE_LENGTH-1; i++){
			                 if(this->queueToneStart[i] == 0){ //we only check the start var as this is the master
						                this->queueToneStart[i] = this->t_queueToneStart;
						                this->queueToneEnd[i] = this->t_queueToneEnd;
						                this->queueToneLength[i] = this->t_queueToneLength;
						                this->queueTonePause[i] = this->t_queueTonePause;
						                this->queueToneRepeat[i] = this->t_queueToneRepeat;
						                this->queueToneHaptic[i] = this->t_queueToneHaptic;
						                this->inToneRepeat = 0;						                
						                flushTemp();
			                  break;
			             }
			           }
			      }  else {
		                this->queueToneStart[0] = this->t_queueToneStart;
		                this->queueToneEnd[0] = this->t_queueToneEnd;
		                this->queueToneLength[0] = this->t_queueToneLength;
		                this->queueTonePause[0] = this->t_queueTonePause;
		                this->queueToneRepeat[0] = this->t_queueToneRepeat;
		                this->queueToneHaptic[0] = this->t_queueToneHaptic;
		                flushTemp();
			      }
		}

		//set all temporary buffers to default
		void flushTemp(){
        this->t_queueToneStart = 0;
        this->t_queueToneEnd = 0;
        this->t_queueToneLength = 0;
        this->t_queueTonePause = 0;
        this->t_queueToneRepeat = 0;
        this->t_queueToneHaptic = 0;
        this->RateOfChange = 0;
        this->toneInterupt = 0;
				this->toneHaptic = 0;
				//this->HapticTimer = 0;
		}


		void restack(){
			         for(uint8_t i=0; i<=AUDIO_QUEUE_LENGTH-1; i++){
			            if(i == (AUDIO_QUEUE_LENGTH -1)){          //set the last entry to 0 as nothing in stack to add too!
						                this->queueToneStart[i] = 0;
						                this->queueToneEnd[i] = 0;
						                this->queueToneLength[i] = 0;
						                this->queueTonePause[i] = 0;
						                this->queueToneRepeat[i] = 0;
						                this->queueToneHaptic[i] = 0;
			            } else {      //shift all values one up in the stack.
						                this->queueToneStart[i] = this->queueToneStart[i+1];
						                this->queueToneEnd[i] = this->queueToneEnd[i+1];
						                this->queueToneLength[i] = this->queueToneLength[i+1];
						                this->queueTonePause[i] = this->queueTonePause[i+1];
						                this->queueToneRepeat[i] = this->queueToneRepeat[i+1];
						                this->queueToneHaptic[i] = this->queueToneHaptic[i+1];
			            }
			         }
		}


		/*void delayHapticOff(){
					//turn off haptic if on and timer greater that BEEP_HAPTIC_LENGTH
					//this happens out of normale queue state as the motor needs to 'wind up'
					if(this->toneHaptic == 1 && this->HapticTimer <= 0){
			    		HAPTIC_OFF; // turn off haptic
			    		this->toneHaptic = 0;
			    		this->HapticTimer = 0;
					} else {
						this->HapticTimer--;
					}
		}*/

		//heartbeat is responsibile for issueing the audio tones and general square waves
		// it is essentially the life of the class.
		void heartbeat(){

		uint8_t y; //direction calulations
		uint8_t z; //direction calulations


		if(this->queueState == 1){

#ifdef BEEPSPKR
					//square wave generator use for speaker mod
					//simply generates a square wave for toneFreq for
					//as long as the this->toneTimeLeft is more than 0
	  				static uint8_t toneCounter;
	  				if (this->toneTimeLeft > 0){
				    	toneCounter += this->toneFreq;
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
					if (this->toneTimeLeft > 0){
						PORTE |=  (1<<OUT_E_BUZZER); // speaker output 'high'
					} else {
						PORTE &=  ~(1<<OUT_E_BUZZER); // speaker output 'low'
					}
#endif

					//haptic tones  // may beed to wrap in sys pref to enable/disable?
					// haptic drives need time to spin up!
					//if (this->toneHaptic == 1 && this->HapticTimer > 0){
					if (this->toneHaptic == 1){
						HAPTIC_ON;
					}	else {
							//delayHapticOff();
							HAPTIC_OFF;
					}


			  } else {
			  	PORTE &=  ~(1<<OUT_E_BUZZER); // speaker output 'low'
					HAPTIC_OFF;
			  }



			    //step through array checking if we have any tones to play
			    //next heartbeat will play whatever we put in queue
							if((this->queueToneStart[0] > 0 || this->queueToneHaptic[0] == 1) && this->toneTimeLeft <= 0 && this->queueState == 0){

											//scaling handler
											if(this->queueToneEnd[0] > 0 && this->queueToneEnd[0] != this->queueToneStart[0]){

													//if toneEnd is set then we scale the sound to from start to finish
													//at an effective speed determined by the queueToneLength value
												  this->toneFreq = this->queueToneStart[0] + g_eeGeneral.speakerPitch;
												  //calculate the rate of climb
												  if(this->queueToneStart[0] > this->queueToneEnd[0]){  //tone going down
												  		z = this->queueToneStart[0] - this->queueToneEnd[0];
												  		y = 0;
												  } else { //tone going up
												  	  z = this->queueToneEnd[0] - this->queueToneStart[0];
												  	  y = 1;
												  }
				                  this->toneFreq=this->queueToneStart[0] + g_eeGeneral.speakerPitch; // add pitch compensator
				                  this->toneFreqEnd=this->queueToneEnd[0] + g_eeGeneral.speakerPitch;
				                  this->toneTimeLeft = this->queueToneLength[0];
				                  this->toneTimeLeft = z;
				                  this->tonePause = this->queueTonePause[0];
												  this->RateOfChange = 1;
												  this->DirectionOfChange = y;
												  this->toneRepeat = this->queueToneRepeat[0];
												  this->toneHaptic = this->queueToneHaptic[0];
											}	else {

											//simple tone handler
				                  this->toneFreq=(this->queueToneStart[0] + g_eeGeneral.speakerPitch) + BEEP_OFFSET; // add pitch compensator
				                  this->toneTimeLeft = this->queueToneLength[0];
				                  this->tonePause = this->queueTonePause[0];
				                  this->toneRepeat = this->queueToneRepeat[0];
				                  this->toneHaptic = this->queueToneHaptic[0];
				                  this->DirectionOfChange = 0;
				                  this->RateOfChange = 0;
				                  this->toneFreqEnd = 0;
		                  }
		                  this->queueState = 1;
		                  //this->HapticTimer = BEEP_HAPTIC_LENGTH;

		                  if(this->toneRepeat != 0 && inToneRepeat == 0){
		                  		inToneRepeat = 1;
		                  		this->toneRepeatCnt = this->toneRepeat;
		                  }

		                  if(inToneRepeat == 1){
		                  	this->toneRepeatCnt--;
		                  	if(this->toneRepeatCnt <= 0){
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

											if(this->toneTimeLeft > 0 && this->queueState == 1){
												 			//play the tone
												 		  
												 		  
															//alter tone for scaling sound effect
															if(this->RateOfChange == 1){
																	if(this->DirectionOfChange == 1){
																			this->toneFreq = this->toneFreq + this->RateOfChange;
																	} else {
																		  this->toneFreq = this->toneFreq - this->RateOfChange;
																	}
															}  	
															
															this->toneTimeLeft--; //time gets counted down
											}
											if(this->toneTimeLeft <= 0 && this->queueState == 1){
														  if(this->tonePause--	<= 0){
														  			this->queueState = 0;
														  }
											}
					}				
					
		}
		
		//pre made tune to play the 'startup' tune
		void tada(){
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
		
		
		//pre made tune to play a generic siren!
		void siren(){
			  start(1);
			  end(120);
			  length(10);
			  pause(5);
			  repeat(5);
			  commit();			
		}	
		
	

};


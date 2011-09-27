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




extern uint8_t g_audioStart;
extern uint8_t g_audioEnd;
extern uint8_t g_audioLength;
extern uint8_t g_audioPause;
extern uint8_t g_audioFirstRun;
extern uint8_t g_Haptic;
extern uint8_t beepOn;
extern uint8_t beepAgain;
class audioQueue;



 
inline void _beepSpkr(uint8_t d, uint8_t f,uint8_t h=0){
  //this is a wrapper function for the audio class
  //and uses the legacy tone import functions in the main er9x file
  if(g_audioFirstRun < 3){
  	//do nothing as cant find strange issue that causes this function to run twice on boot!
  	g_audioFirstRun++;
  } else {
				
				g_audioLength = d ;
				g_audioPause = 2;

				if(h == 1 && g_eeGeneral.hapticStrength > 0){
					g_Haptic = 1;
				} else {
					g_Haptic = 0;
				}	
			
				g_audioStart = f; //keep this as the end to avoid interrupt issues.

	}
}

inline void _beep(uint8_t d,uint8_t h=0) {
				
				g_audioLength = d;
				g_audioPause = 2;
				if(h == 1 && g_eeGeneral.hapticStrength > 0){
					g_Haptic = 1;
				}
				g_audioStart = BEEP_DEFAULT_FREQ; //keep this as the end to avoid interrupt issues.

}


#ifdef BEEPSPKR

#define beepKeySpkr(freq) _beepSpkr(g_beepVal[0],freq)
#define beepTrimSpkr(freq) _beepSpkr(g_beepVal[0],freq)
#define beepWarn1Spkr(freq) _beepSpkr(g_beepVal[1],freq,1)
#define beepWarn2Spkr(freq) _beepSpkr(g_beepVal[2],freq,1)

#define beepKey() _beepSpkr(g_beepVal[0],BEEP_DEFAULT_FREQ)
#define beepWarn() _beepSpkr(g_beepVal[3],BEEP_DEFAULT_FREQ,1)
#define beepWarn1() _beepSpkr(g_beepVal[1],BEEP_DEFAULT_FREQ,1)
#define beepWarn2() _beepSpkr(g_beepVal[2],BEEP_DEFAULT_FREQ,1)
#define beepErr()  _beepSpkr(g_beepVal[4],BEEP_DEFAULT_FREQ,1)


#else
// default beeper
#define beepKey()   _beep(g_beepVal[0])
#define beepWarn() _beep(g_beepVal[3],1)
#define beepWarn1() _beep(g_beepVal[1],1)
#define beepWarn2() _beep(g_beepVal[2],1)
#define beepErr()  _beep(g_beepVal[4],1)

#endif

#endif // audio_h
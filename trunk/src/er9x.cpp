/*
 * Author - Erez Raviv <erezraviv@gmail.com>
 *
 * Based on th9x -> http://code.google.com/p/th9x/
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
#include "s9xsplash.lbm"

/*
mode1 rud ele thr ail
mode2 rud thr ele ail
mode3 ail ele thr rud
mode4 ail thr ele rud
*/



EEGeneral  g_eeGeneral;
ModelData  g_model;

const prog_uint8_t APM chout_ar[] = { //First number is 0..23 -> template setup,  Second is relevant channel out
                                      1,2,3,4 , 1,2,4,3 , 1,3,2,4 , 1,3,4,2 , 1,4,2,3 , 1,4,3,2,
                                      2,1,3,4 , 2,1,4,3 , 2,3,1,4 , 2,3,4,1 , 2,4,1,3 , 2,4,3,1,
                                      3,1,2,4 , 3,1,4,2 , 3,2,1,4 , 3,2,4,1 , 3,4,1,2 , 3,4,2,1,
                                      4,1,2,3 , 4,1,3,2 , 4,2,1,3 , 4,2,3,1 , 4,3,1,2 , 4,3,2,1    };


//new audio object
audioQueue  audio;

uint8_t sysFlags = 0;

const prog_char APM modi12x3[]=
  "RUD ELE THR AIL "
  "RUD THR ELE AIL "
  "AIL ELE THR RUD "
  "AIL THR ELE RUD ";

MixData *mixaddress( uint8_t idx )
{
	return &g_model.mixData[idx] ;
}

LimitData *limitaddress( uint8_t idx )
{
  return &g_model.limitData[idx];
}

void putsTime(uint8_t x,uint8_t y,int16_t tme,uint8_t att,uint8_t att2)
{
  if ( tme<0 )
  {
    lcd_putcAtt( x - ((att&DBLSIZE) ? FWNUM*6-2 : FWNUM*3),    y, '-',att);
    tme = -tme;
  }

  lcd_putcAtt(x, y, ':',att&att2);
  lcd_outdezNAtt(x+ ((att&DBLSIZE) ? 2 : 0), y, tme/60, LEADING0|att,2);
  x += (att&DBLSIZE) ? FWNUM*6-2 : FW*3-1;
  lcd_outdezNAtt(x, y, tme%60, LEADING0|att2,2);
}
void putsVolts(uint8_t x,uint8_t y, uint8_t volts, uint8_t att)
{
  lcd_outdezAtt(x, y, volts, att|PREC1);
  if(!(att&NO_UNIT)) lcd_putcAtt(lcd_lastPos, y, 'v', att);
}
void putsVBat(uint8_t x,uint8_t y,uint8_t att)
{
  //att |= g_vbat100mV < g_eeGeneral.vBatWarn ? BLINK : 0;
  putsVolts(x, y, g_vbat100mV, att);
}
void putsChnRaw(uint8_t x,uint8_t y,uint8_t idx,uint8_t att)
{
  if(idx==0)
    lcd_putsnAtt(x,y,PSTR("----"),4,att);
  else if(idx<=4)
    lcd_putsnAtt(x,y,modi12x3+g_eeGeneral.stickMode*16+4*(idx-1),4,att);
  else if(idx<=NUM_XCHNRAW)
    lcd_putsnAtt(x,y,PSTR("P1  P2  P3  MAX FULLCYC1CYC2CYC3PPM1PPM2PPM3PPM4PPM5PPM6PPM7PPM8CH1 CH2 CH3 CH4 CH5 CH6 CH7 CH8 CH9 CH10CH11CH12CH13CH14CH15CH16"TELEMETRY_CHANNELS)+4*(idx-5),4,att);
}
void putsChn(uint8_t x,uint8_t y,uint8_t idx1,uint8_t att)
{
  // !! todo NUM_CHN !!
  lcd_putsnAtt(x,y,PSTR("--- CH1 CH2 CH3 CH4 CH5 CH6 CH7 CH8 CH9 CH10CH11CH12CH13CH14CH15CH16"
                        "CH17CH18CH19CH20CH21CH22CH23CH24CH25CH26CH27CH28CH29CH30")+4*idx1,4,att);
}

void putsDrSwitches(uint8_t x,uint8_t y,int8_t idx1,uint8_t att)//, bool nc)
{
  switch(idx1){
    case  0:            lcd_putsAtt(x+FW,y,PSTR("---"),att);return;
    case  MAX_DRSWITCH: lcd_putsAtt(x+FW,y,PSTR("ON "),att);return;
    case -MAX_DRSWITCH: lcd_putsAtt(x+FW,y,PSTR("OFF"),att);return;
  }
  lcd_putcAtt(x,y, idx1<0 ? '!' : ' ',att);
  lcd_putsnAtt(x+FW,y,get_switches_string()+3*(abs(idx1)-1),3,att);
}

const prog_char *get_switches_string()
{
  return PSTR(SWITCHES_STR)	;
}	

void putsTmrMode(uint8_t x, uint8_t y, uint8_t attr)
{
  int8_t tm = g_model.tmrMode;
  if(abs(tm)<TMR_VAROFS) {
    lcd_putsnAtt(  x, y, PSTR("OFFABSRUsRU%ELsEL%THsTH%ALsAL%P1 P1%P2 P2%P3 P3%")+3*abs(tm),3,attr);
    if(tm<(-TMRMODE_ABS)) lcd_putcAtt(x-1*FW,  y,'!',attr);
    return;
  }

  if(abs(tm)<(TMR_VAROFS+MAX_DRSWITCH-1)) { //normal on-off
    putsDrSwitches( x-1*FW,y,tm>0 ? tm-(TMR_VAROFS-1) : tm+(TMR_VAROFS-1),attr);
    return;
  }

  putsDrSwitches( x-1*FW,y,tm>0 ? tm-(TMR_VAROFS+MAX_DRSWITCH-1-1) : tm+(TMR_VAROFS+MAX_DRSWITCH-1-1),attr);//momentary on-off
  lcd_putcAtt(x+3*FW,  y,'m',attr);
}

#ifdef FRSKY
void putsTelemValue(uint8_t x, uint8_t y, uint8_t val, uint8_t channel, uint8_t att, uint8_t scale)
{
  uint32_t value ;
//  uint8_t ratio ;
  uint16_t ratio ;
  uint8_t times2 ;

  value = val ;
  if (g_model.frsky.channels[channel].type == 2/*V*/)
  {
    times2 = 1 ;
  }
  else
  {
    times2 = 0 ;
  }

  if ( scale )
  {
    ratio = g_model.frsky.channels[channel].ratio ;
    if ( times2 )
    {
      ratio <<= 1 ;
    }
    value *= ratio ;
    if ( ratio < 100 )
    {
      value *= 2 ;
      value /= 51 ;  // Same as *10 /255 but without overflow
      att |= PREC2 ;		
    }
    else
    {
      value /= 255 ;
    }
	}
  else
  {
    if ( times2 )
    {
      value <<= 1 ;
    }
  }
//              val = (uint16_t)staticTelemetry[i]*g_model.frsky.channels[i].ratio / 255;
//              putsTelemetry(x0-2, 2*FH, val, g_model.frsky.channels[i].type, blink|DBLSIZE|LEFT);
//  if (g_model.frsky.channels[channel].type == 0/*v*/)
  if ( (g_model.frsky.channels[channel].type == 0/*v*/) || (g_model.frsky.channels[channel].type == 2/*v*/) )
  {
    lcd_outdezNAtt(x, y, value, att|PREC1, 5) ;
    if(!(att&NO_UNIT)) lcd_putcAtt(lcd_lastPos, y, 'v', att);
  }
  else
  {
    lcd_outdezAtt(x, y, value, att);
  }
}


#endif

inline int16_t getValue(uint8_t i)
{
  if(i<PPM_BASE) return calibratedStick[i];//-512..512
  else if(i<PPM_BASE+4) return (g_ppmIns[i-PPM_BASE] - g_eeGeneral.trainer.calib[i-PPM_BASE])*2;
  else if(i<CHOUT_BASE) return g_ppmIns[i-PPM_BASE]*2;
  else if(i<CHOUT_BASE+NUM_CHNOUT) return ex_chans[i-CHOUT_BASE];
#ifdef FRSKY
  else if(i<CHOUT_BASE+NUM_CHNOUT+NUM_TELEMETRY) return frskyTelemetry[i-CHOUT_BASE-NUM_CHNOUT].value;
#endif
  else return 0;
}

bool getSwitch(int8_t swtch, bool nc, uint8_t level)
{
  if(level>5) return false; //prevent recursive loop going too deep

  switch(swtch){
    case  0:            return  nc;
    case  MAX_DRSWITCH: return  true;
    case -MAX_DRSWITCH: return  false;
  }

  uint8_t dir = swtch>0;
  if(abs(swtch)<(MAX_DRSWITCH-NUM_CSW)) {
    if(!dir) return ! keyState((EnumKeys)(SW_BASE-swtch-1));
    return            keyState((EnumKeys)(SW_BASE+swtch-1));
  }

  //custom switch, Issue 78
  //use putsChnRaw
  //input -> 1..4 -> sticks,  5..8 pots
  //MAX,FULL - disregard
  //ppm
  CSwData &cs = g_model.customSw[abs(swtch)-(MAX_DRSWITCH-NUM_CSW)];
  if(!cs.func) return false;


  int8_t a = cs.v1;
  int8_t b = cs.v2;
  int16_t x = 0;
  int16_t y = 0;

  // init values only if needed
  uint8_t s = CS_STATE(cs.func);

  if(s == CS_VOFS)
  {
      x = getValue(cs.v1-1);
#ifdef FRSKY
      if (cs.v1 > CHOUT_BASE+NUM_CHNOUT)
        y = 125+cs.v2;
      else
#endif
      y = calc100toRESX(cs.v2);
  }
  else if(s == CS_VCOMP)
  {
      x = getValue(cs.v1-1);
      y = getValue(cs.v2-1);
  }

  switch (cs.func) {
  case (CS_VPOS):
      return swtch>0 ? (x>y) : !(x>y);
      break;
  case (CS_VNEG):
      return swtch>0 ? (x<y) : !(x<y);
      break;
  case (CS_APOS):
  {
      bool res = (abs(x)>y) ;
      return swtch>0 ? res : !res ;
  }
//      return swtch>0 ? (abs(x)>y) : !(abs(x)>y);
      break;
  case (CS_ANEG):
  {
      bool res = (abs(x)<y) ;
      return swtch>0 ? res : !res ;
  }
//      return swtch>0 ? (abs(x)<y) : !(abs(x)<y);
      break;

//  case (CS_AND):
//      return (getSwitch(a,0,level+1) && getSwitch(b,0,level+1));
//      break;
//  case (CS_OR):
//      return (getSwitch(a,0,level+1) || getSwitch(b,0,level+1));
//      break;
//  case (CS_XOR):
//      return (getSwitch(a,0,level+1) ^ getSwitch(b,0,level+1));
//      break;
  case (CS_AND):
  case (CS_OR):
  case (CS_XOR):
  {
    bool res1 = getSwitch(a,0,level+1) ;
    bool res2 = getSwitch(b,0,level+1) ;
    if ( cs.func == CS_AND )
    {
      return res1 && res2 ;
    }
    else if ( cs.func == CS_OR )
    {
      return res1 || res2 ;
    }
    else  // CS_XOR
    {
      return res1 ^ res2 ;
    }
  }
  break;

  case (CS_EQUAL):
      return (x==y);
      break;
  case (CS_NEQUAL):
      return (x!=y);
      break;
  case (CS_GREATER):
      return (x>y);
      break;
  case (CS_LESS):
      return (x<y);
      break;
  case (CS_EGREATER):
      return (x>=y);
      break;
  case (CS_ELESS):
      return (x<=y);
      break;
  default:
      return false;
      break;
  }

}


//#define CS_EQUAL     8
//#define CS_NEQUAL    9
//#define CS_GREATER   10
//#define CS_LESS      11
//#define CS_EGREATER  12
//#define CS_ELESS     13

inline uint8_t keyDown()
{
    return (~PINB) & 0x7E;
}

void clearKeyEvents()
{
    while(keyDown());  // loop until all keys are up
    putEvent(0);
}

void doSplash()
{
    if(!g_eeGeneral.disableSplashScreen)
    {


        if(getSwitch(g_eeGeneral.lightSw,0) || g_eeGeneral.lightAutoOff)
             BACKLIGHT_ON;
        else
             BACKLIGHT_OFF;

        lcd_clear();
        lcd_img(0, 0, s9xsplash,0,0);
        lcd_putsnAtt(0*FW, 7*FH, g_eeGeneral.ownerName ,sizeof(g_eeGeneral.ownerName),BSS);

        refreshDiplay();
        lcdSetRefVolt(g_eeGeneral.contrast);

        clearKeyEvents();

        for(uint8_t i=0; i<32; i++)
            getADC_filt(); // init ADC array

#define INAC_DEVISOR 256   // Issue 206 - bypass splash screen with stick movement
        uint16_t inacSum = 0;
        for(uint8_t i=0; i<4; i++)
           inacSum += anaIn(i)/INAC_DEVISOR;

        uint16_t tgtime = get_tmr10ms() + SPLASH_TIMEOUT;  
        while(tgtime != get_tmr10ms())
        {
            getADC_filt();
            uint16_t tsum = 0;
            for(uint8_t i=0; i<4; i++)
               tsum += anaIn(i)/INAC_DEVISOR;

            if(keyDown() || (tsum!=inacSum))   return;  //wait for key release

            if(getSwitch(g_eeGeneral.lightSw,0) || g_eeGeneral.lightAutoOff)
                BACKLIGHT_ON;
            else
                BACKLIGHT_OFF;
        }
    }
}

void checkMem()
{
  if(g_eeGeneral.disableMemoryWarning) return;
  if(EeFsGetFree() < 200)
  {
    alert(PSTR("EEPROM low mem"));
  }

}

void alertMessages( const prog_char * s, const prog_char * t )
{
  lcd_clear();
  lcd_putsAtt(64-5*FW,0*FH,PSTR("ALERT"),DBLSIZE);
  lcd_puts_P(0,4*FH,s);
  lcd_puts_P(0,5*FH,t);
  lcd_puts_P(0,6*FH,  PSTR("Press any key to skip") ) ;
  refreshDiplay();
  lcdSetRefVolt(g_eeGeneral.contrast);

  clearKeyEvents();
}

void checkTHR()
{
  if(g_eeGeneral.disableThrottleWarning) return;

  int thrchn=(2-(g_eeGeneral.stickMode&1));//stickMode=0123 -> thr=2121

  int16_t lowLim = THRCHK_DEADBAND + g_eeGeneral.calibMid[thrchn] - g_eeGeneral.calibSpanNeg[thrchn];// + g_eeGeneral.calibSpanNeg[thrchn]/8;

  getADC_single();   // if thr is down - do not display warning at all
  int16_t v      = anaIn(thrchn);
  if((v<=lowLim) || (keyDown()))
  {
      return;
  }

  // first - display warning
  alertMessages( PSTR("Throttle not idle"), PSTR("Reset throttle") ) ;
  
	//loop until all switches are reset
  while (1)
  {
      getADC_single();
      int16_t v      = anaIn(thrchn);
      if((v<=lowLim) || (keyDown()))
      {
          return;
      }

      if(getSwitch(g_eeGeneral.lightSw,0) || g_eeGeneral.lightAutoOff)
          BACKLIGHT_ON;
      else
          BACKLIGHT_OFF;
  }
}

void checkAlarm() // added by Gohst
{
    if(g_eeGeneral.disableAlarmWarning) return;
  if(!g_eeGeneral.beeperVal) alert(PSTR("Alarms Disabled"));
}

void checkWarnings()
{
    if(sysFlags && sysFLAG_OLD_EEPROM)
    {
        alert(PSTR(" Old Version EEPROM   CHECK SETTINGS/CALIB")); //will update on next save
        sysFlags &= ~(sysFLAG_OLD_EEPROM); //clear flag
    }
}

void checkSwitches()
{
  if(g_eeGeneral.disableSwitchWarning) return; // if warning is on

  // first - display warning
  alertMessages( PSTR("Switches not off"), PSTR("Please reset them") ) ;
  
	//loop until all switches are reset
  while (1)
  {
    uint8_t i;
    for(i=SW_BASE; i<SW_Trainer; i++)
    {
        if(i==SW_ID0) continue;
//#if (defined(JETI) || defined(FRSKY))
//        if(i==SW_AileDR || i==SW_ThrCt) continue; //issue 166 - commented out since the issue was in error
//#endif
        if(getSwitch(i-SW_BASE+1,0)) break;
    }

    if((i==SW_Trainer) ||
       (keyDown()))
    {
        return;  //wait for key release
    }

    if(getSwitch(g_eeGeneral.lightSw,0) || g_eeGeneral.lightAutoOff)
        BACKLIGHT_ON;
    else
        BACKLIGHT_OFF;
  }
}

void checkQuickSelect()
{
    uint8_t i = keyDown(); //check for keystate
    uint8_t j;
    for(j=1; j<8; j++)
        if(i & (1<<j)) break;
    j--;

    if(j<6) {
        if(!eeModelExists(j)) return;

        eeLoadModel(g_eeGeneral.currModel = j);
        STORE_GENERALVARS;
//        eeDirty(EE_GENERAL);

        lcd_clear();
        lcd_putsAtt(64-7*FW,0*FH,PSTR("LOADING"),DBLSIZE);

        for(uint8_t i=0;i<sizeof(g_model.name);i++)
          lcd_putcAtt(FW*2+i*2*FW-i-2, 3*FH, g_model.name[i],DBLSIZE);

        	refreshDiplay();
        lcdSetRefVolt(g_eeGeneral.contrast);

        if(g_eeGeneral.lightSw || g_eeGeneral.lightAutoOff) // if lightswitch is defined or auto off
            BACKLIGHT_ON;
        else
            BACKLIGHT_OFF;

        clearKeyEvents(); // wait for user to release key
    }
}

MenuFuncP g_menuStack[5];

uint8_t  g_menuStackPtr = 0;
//uint8_t  g_beepCnt;
//uint8_t  g_beepVal[5];

void message(const prog_char * s)
{
  lcd_clear();
  lcd_putsAtt(64-5*FW,0*FH,PSTR("MESSAGE"),DBLSIZE);
  lcd_puts_P(0,4*FW,s);
  refreshDiplay();
  lcdSetRefVolt(g_eeGeneral.contrast);
}

uint8_t heartbeat;

void alert(const prog_char * s, bool defaults)
{
    lcd_clear();
    lcd_putsAtt(64-5*FW,0*FH,PSTR("ALERT"),DBLSIZE);
    lcd_puts_P(0,4*FW,s);
    lcd_puts_P(64-6*FW,7*FH,PSTR("press any Key"));
    refreshDiplay();
    lcdSetRefVolt(defaults ? 25 : g_eeGeneral.contrast);

    audioevent(AUDIO_ERROR);
    clearKeyEvents();
    while(1)
    {
        if(keyDown())
        {
            return;  //wait for key release
        }
        if(heartbeat == 0x3)
        {
            wdt_reset();
            heartbeat = 0;
        }

        if(getSwitch(g_eeGeneral.lightSw,0) || g_eeGeneral.lightAutoOff || defaults)
            BACKLIGHT_ON;
        else
            BACKLIGHT_OFF;
    }
}

int8_t *TrimPtr[4] = 
{
  &g_model.trim[0],
  &g_model.trim[1],
  &g_model.trim[2],
  &g_model.trim[3]
} ;

uint8_t checkTrim(uint8_t event)
{
  int8_t  k = (event & EVT_KEY_MASK) - TRM_BASE;
  int8_t  s = g_model.trimInc;
  if (s>1) s = 1 << (s-1);  // 1=>1  2=>2  3=>4  4=>8

  if((k>=0) && (k<8))// && (event & _MSK_KEY_REPT))
  {
    //LH_DWN LH_UP LV_DWN LV_UP RV_DWN RV_UP RH_DWN RH_UP
    uint8_t idx = k/2;
    int8_t tm = *TrimPtr[idx] ;
    int8_t  v = (s==0) ? (abs(tm)/4)+1 : s;
    bool thrChan = ((2-(g_eeGeneral.stickMode&1)) == idx);
    bool thro = (thrChan && (g_model.thrTrim));
    if(thro) v = 4; // if throttle trim and trim trottle then step=4
    if(thrChan && g_eeGeneral.throttleReversed) v = -v;  // throttle reversed = trim reversed
    int16_t x = (k&1) ? tm + v : tm - v;   // positive = k&1

    if(((x==0)  ||  ((x>=0) != (tm>=0))) && (!thro) && (tm!=0)){
      *TrimPtr[idx]=0;
      killEvents(event);
      audioevent(AUDIO_TRIM_MIDDLE);

    } else if(x>-125 && x<125){
      *TrimPtr[idx] = (int8_t)x;
      STORE_MODELVARS_TRIM;
      //if(event & _MSK_KEY_REPT) warble = true;
			if(x <= 125 && x >= -125){
				audioevent(AUDIO_TRIM_MOVE,(abs(x)/4)+60);
			}	
    }
    else
    {
      *TrimPtr[idx] = (x>0) ? 125 : -125;
      STORE_MODELVARS_TRIM;
			if(x <= 125 && x >= -125){
				audioevent(AUDIO_TRIM_MOVE,(-abs(x)/4)+60);
			}	
    }

    return 0;
  }
  return event;
}

//global helper vars
bool    checkIncDec_Ret;
int16_t p1val;
int16_t p1valdiff;

int16_t checkIncDec16(uint8_t event, int16_t val, int16_t i_min, int16_t i_max, uint8_t i_flags)
{
  int16_t newval = val;
  uint8_t kpl=KEY_RIGHT, kmi=KEY_LEFT, kother = -1;

  if(event & _MSK_KEY_DBL){
    uint8_t hlp=kpl;
    kpl=kmi;
    kmi=hlp;
    event=EVT_KEY_FIRST(EVT_KEY_MASK & event);
  }
  if(event==EVT_KEY_FIRST(kpl) || event== EVT_KEY_REPT(kpl) || (s_editMode && (event==EVT_KEY_FIRST(KEY_UP) || event== EVT_KEY_REPT(KEY_UP))) ) {
    newval++;

		audioevent(AUDIO_KEYPAD_UP);

    kother=kmi;
  }else if(event==EVT_KEY_FIRST(kmi) || event== EVT_KEY_REPT(kmi) || (s_editMode && (event==EVT_KEY_FIRST(KEY_DOWN) || event== EVT_KEY_REPT(KEY_DOWN))) ) {
    newval--;

		audioevent(AUDIO_KEYPAD_DOWN);

    kother=kpl;
  }
  if((kother != (uint8_t)-1) && keyState((EnumKeys)kother)){
    newval=-val;
    killEvents(kmi);
    killEvents(kpl);
  }
  if(i_min==0 && i_max==1 && event==EVT_KEY_FIRST(KEY_MENU))
  {
      s_editMode = false;
      newval=!val;
      killEvents(event);
  }

  //change values based on P1
  newval -= p1valdiff;

  if(newval>i_max)
  {
    newval = i_max;
    killEvents(event);
    audioevent(AUDIO_KEYPAD_UP);
  }
  else if(newval < i_min)
  {
    newval = i_min;
    killEvents(event);
    audioevent(AUDIO_KEYPAD_DOWN);

  }
  if(newval != val) {
    if(newval==0) {
      pauseEvents(event);
  
		if (newval>val){
			audioevent(AUDIO_KEYPAD_UP);
		} else {
			audioevent(AUDIO_KEYPAD_DOWN);
		}		

    }
    eeDirty(i_flags & (EE_GENERAL|EE_MODEL));
    checkIncDec_Ret = true;
  }
  else {
    checkIncDec_Ret = false;
  }
  return newval;
}

int8_t checkIncDec(uint8_t event, int8_t i_val, int8_t i_min, int8_t i_max, uint8_t i_flags)
{
  return checkIncDec16(event,i_val,i_min,i_max,i_flags);
}

int8_t checkIncDec_hm(uint8_t event, int8_t i_val, int8_t i_min, int8_t i_max)
{
  return checkIncDec(event,i_val,i_min,i_max,EE_MODEL);
}

int8_t checkIncDec_hg(uint8_t event, int8_t i_val, int8_t i_min, int8_t i_max)
{
  return checkIncDec(event,i_val,i_min,i_max,EE_GENERAL);
}

MenuFuncP lastPopMenu()
{
  return  g_menuStack[g_menuStackPtr+1];
}

void popMenu(bool uppermost)
{
  if(g_menuStackPtr>0 || uppermost){
    g_menuStackPtr = uppermost ? 0 : g_menuStackPtr-1;
    audioevent(AUDIO_MENUS);
    (*g_menuStack[g_menuStackPtr])(EVT_ENTRY_UP);
  }else{
    alert(PSTR("menuStack underflow"));
  }
}

void chainMenu(MenuFuncP newMenu)
{
  g_menuStack[g_menuStackPtr] = newMenu;
  (*newMenu)(EVT_ENTRY);
  audioevent(AUDIO_MENUS);
}
void pushMenu(MenuFuncP newMenu)
{

  g_menuStackPtr++;
  if(g_menuStackPtr >= DIM(g_menuStack))
  {
    g_menuStackPtr--;
    alert(PSTR("menuStack overflow"));
    return;
  }
  audioevent(AUDIO_MENUS);
  g_menuStack[g_menuStackPtr] = newMenu;
  (*newMenu)(EVT_ENTRY);
}

uint8_t  g_vbat100mV;
volatile uint8_t tick10ms = 0;
uint16_t g_LightOffCounter;

inline bool checkSlaveMode()
{
  // no power -> only phone jack = slave mode

#ifdef BUZZER_MOD
  return SLAVE_MODE;
#else
  static bool lastSlaveMode = false;
// // commented out as seems to serve no purpose with new sound engine 
//  static uint8_t checkDelay = 0;
//  if (g_beepCnt || beepAgain || beepOn) {
//    checkDelay = 20;
//  }
//  else if (checkDelay) {
//    --checkDelay;
//  }
//  else {
    lastSlaveMode = SLAVE_MODE;//
//  }
  return lastSlaveMode;
#endif
}

uint8_t Timer2_running = 0 ;
uint8_t Timer2_pre = 0 ;
uint16_t Timer2 = 0 ;

void resetTimer2()
{
  Timer2_pre = 0 ;
  Timer2 = 0 ;
  Timer2_running = 0 ;   // Stop and clear throttle started flag
}

void perMain()
{
    static uint16_t lastTMR;
    tick10ms = (get_tmr10ms() != lastTMR);
    lastTMR = get_tmr10ms();
//    uint16_t time10ms ;
//		time10ms = get_tmr10ms();
//    tick10ms = (time10ms != lastTMR);
//    lastTMR = time10ms;

    perOut(g_chans512, 0);
    if(!tick10ms) return; //make sure the rest happen only every 10ms.

  //  if ( Timer2_running )
    if ( Timer2_running & 1)  // ignore throttle started flag
    {
        if ( (Timer2_pre += 1 ) >= 100 )
        {
            Timer2_pre -= 100 ;
            Timer2 += 1 ;
        }
    }

    eeCheck();

    lcd_clear();
    uint8_t evt=getEvent();
    evt = checkTrim(evt);

    if(g_LightOffCounter) g_LightOffCounter--;
    if(evt) g_LightOffCounter = g_eeGeneral.lightAutoOff*500; // on keypress turn the light on 5*100

    if(getSwitch(g_eeGeneral.lightSw,0) || g_LightOffCounter)
        BACKLIGHT_ON;
    else
        BACKLIGHT_OFF;


    static int16_t p1valprev;
    p1valdiff = (p1val-calibratedStick[6])/32;
    if(p1valdiff) {
        p1valdiff = (p1valprev-calibratedStick[6])/2;
        p1val = calibratedStick[6];
    }
    p1valprev = calibratedStick[6];
   if ( g_eeGeneral.disablePotScroll )
   {
      p1valdiff = 0 ;			
   	}

    g_menuStack[g_menuStackPtr](evt);
    refreshDiplay();
    if(checkSlaveMode()) {
        PORTG &= ~(1<<OUT_G_SIM_CTL); // 0=ppm out
    }else{
        PORTG |=  (1<<OUT_G_SIM_CTL); // 1=ppm-in
    }

    switch( get_tmr10ms() & 0x1f ) { //alle 10ms*32

    case 2:
    {
        //check v-bat
//        Calculation By Mike Blandford
//        Resistor divide on battery voltage is 5K1 and 2K7 giving a fraction of 2.7/7.8
//        If battery voltage = 10V then A2D voltage = 3.462V
//        11 bit A2D count is 1417 (3.462/5*2048).
//        1417*18/256 = 99 (actually 99.6) to represent 9.9 volts.
//        Erring on the side of low is probably best.

        int16_t ab = anaIn(7);
        ab = ab*16 + ab/8*(6+g_eeGeneral.vBatCalib) ;
        ab /= g_eeGeneral.disableBG ? 240 : BandGap ;
        g_vbat100mV = (ab + g_vbat100mV + 1) >> 1 ;  // Filter it a bit => more stable display

        static uint8_t s_batCheck;
        s_batCheck+=32;
        if((s_batCheck==0) && (g_vbat100mV<g_eeGeneral.vBatWarn) && (g_vbat100mV>49)){

            audioevent(AUDIO_TX_BATTERY_LOW);
            if (g_eeGeneral.flashBeep) g_LightOffCounter = FLASH_DURATION;
        }
    }
        break;
    case 3:
    {
    	/*
        static prog_uint8_t APM beepTab[]= {
            // 0   1   2   3    4
            0,  0,  0,  0,   0, //quiet
            0,  1,  8, 30, 100, //silent
            1,  1,  8, 30, 100, //normal
            1,  1, 15, 50, 150, //for motor
            10, 10, 30, 50, 150, //for motor
        };
        memcpy_P(g_beepVal,beepTab+5*g_eeGeneral.beeperVal,5);
        //g_beepVal = BEEP_VAL;
        */
        /* all this gone and replaced in new sound system */
    }
        break;
    }

}

int16_t g_ppmIns[8];
uint8_t ppmInState = 0; //0=unsync 1..8= wait for value i-1

#include <avr/interrupt.h>
//#include <avr/wdt.h>
#define HEART_TIMER2Mhz 1;
#define HEART_TIMER10ms 2;


extern uint16_t g_tmr1Latency_max;
extern uint16_t g_tmr1Latency_min;

//uint16_t PulseTotal ;

//ISR(TIMER1_OVF_vect)
ISR(TIMER1_COMPA_vect) //2MHz pulse generation
{
  static uint8_t   pulsePol;
  static uint16_t *pulsePtr = pulses2MHz;
//  static uint8_t   channel = 0 ;

//  if( *pulsePtr == 0) {
//    //currpulse=0;
//    pulsePtr = pulses2MHz;
//    pulsePol = g_model.pulsePol;//0;

//    TIMSK &= ~(1<<OCIE1A); //stop reentrance
//    sei();
//    setupPulses();
//    cli();
//    TIMSK |= (1<<OCIE1A);
//  }

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
  g_tmr1Latency_max = max(dt,g_tmr1Latency_max);    // max has leap, therefore vary in length
  g_tmr1Latency_min = min(dt,g_tmr1Latency_min);    // min has leap, therefore vary in length

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

//class AutoLock
//{
//  uint8_t m_saveFlags;
//public:
//  AutoLock(){
//    m_saveFlags = SREG;
//    cli();
//  };
//  ~AutoLock(){
//    if(m_saveFlags & (1<<SREG_I)) sei();
//    //SREG = m_saveFlags;// & (1<<SREG_I)) sei();
//  };
//};

//#define STARTADCONV (ADCSRA  = (1<<ADEN) | (1<<ADPS0) | (1<<ADPS1) | (1<<ADPS2) | (1<<ADSC) | (1 << ADIE))
int16_t BandGap ;

static uint16_t s_anaFilt[8];
uint16_t anaIn(uint8_t chan)
{
  //                     ana-in:   3 1 2 0 4 5 6 7
  //static prog_char APM crossAna[]={4,2,3,1,5,6,7,0}; // wenn schon Tabelle, dann muss sich auch lohnen
  static prog_char APM crossAna[]={3,1,2,0,4,5,6,7};
  volatile uint16_t *p = &s_anaFilt[pgm_read_byte(crossAna+chan)];
//  AutoLock autoLock;
  return  *p;
}



#define ADC_VREF_TYPE 0x40
void getADC_filt()
{
  static uint16_t t_ana[3][8];
  for (uint8_t adc_input=0;adc_input<8;adc_input++){
      ADMUX=adc_input|ADC_VREF_TYPE;
      // Start the AD conversion
      ADCSRA|=0x40;
      // Wait for the AD conversion to complete
      while ((ADCSRA & 0x10)==0);
      ADCSRA|=0x10;

      s_anaFilt[adc_input] = (s_anaFilt[adc_input]/2 + t_ana[1][adc_input]) & 0xFFFE; //gain of 2 on last conversion - clear last bit
      //t_ana[2][adc_input]  =  (t_ana[2][adc_input]  + t_ana[1][adc_input]) >> 1;
      t_ana[1][adc_input]  = (t_ana[1][adc_input]  + t_ana[0][adc_input]) >> 1;

      uint16_t v = ADCW;
      if(IS_THROTTLE(adc_input) && g_eeGeneral.throttleReversed) v = 2048 - v;
      t_ana[0][adc_input]  = (t_ana[0][adc_input]  + v) >> 1;
  }
}
/*
  s_anaFilt[chan] = (s_anaFilt[chan] + sss_ana[chan]) >> 1;
  sss_ana[chan] = (sss_ana[chan] + ss_ana[chan]) >> 1;
  ss_ana[chan] = (ss_ana[chan] + s_ana[chan]) >> 1;
  s_ana[chan] = (ADC + s_ana[chan]) >> 1;
  */

void getADC_osmp()
{
  uint16_t temp_ana[8] = {0};
  for (uint8_t adc_input=0;adc_input<8;adc_input++){
    for (uint8_t i=0; i<4;i++) {  // Going from 10bits to 11 bits.  Addition = n.  Loop 4^n times
      ADMUX=adc_input|ADC_VREF_TYPE;
      // Start the AD conversion
      ADCSRA|=0x40;
      // Wait for the AD conversion to complete
      while ((ADCSRA & 0x10)==0);
      ADCSRA|=0x10;
      temp_ana[adc_input] += ADCW;
    }
    s_anaFilt[adc_input] = temp_ana[adc_input] / 2; // divide by 2^n to normalize result.

    if(IS_THROTTLE(adc_input) && g_eeGeneral.throttleReversed)
        s_anaFilt[adc_input] = 2048 - s_anaFilt[adc_input];
  }
}


void getADC_single()
{
    for (uint8_t adc_input=0;adc_input<8;adc_input++){
      ADMUX=adc_input|ADC_VREF_TYPE;
      // Start the AD conversion
      ADCSRA|=0x40;
      // Wait for the AD conversion to complete
      while ((ADCSRA & 0x10)==0);
      ADCSRA|=0x10;
      s_anaFilt[adc_input]= ADCW * 2; // use 11 bit numbers

      if(IS_THROTTLE(adc_input) && g_eeGeneral.throttleReversed)
          s_anaFilt[adc_input] = 2048 - s_anaFilt[adc_input];
    }
}

void getADC_bandgap()
{
  ADMUX=0x1E|ADC_VREF_TYPE;
  // Start the AD conversion
  ADCSRA|=0x40;
  // Wait for the AD conversion to complete
  while ((ADCSRA & 0x10)==0);
  ADCSRA|=0x10;
  // Do it twice, first conversion may be wrong
  ADCSRA|=0x40;
  // Wait for the AD conversion to complete
  while ((ADCSRA & 0x10)==0);
  ADCSRA|=0x10;
  BandGap = (BandGap * 7 + ADCW + 4 ) >> 3 ;
//  if(BandGap<256)
//      BandGap = 256;
}

getADCp getADC[3] = {
  getADC_single,
  getADC_osmp,
  getADC_filt
  };

volatile uint8_t g_tmr16KHz;

ISR(TIMER0_OVF_vect) //continuous timer 16ms (16MHz/1024)
{
  g_tmr16KHz++;
}

static uint16_t getTmr16KHz()
{
  while(1){
    uint8_t hb  = g_tmr16KHz;
    uint8_t lb  = TCNT0;
    if(hb-g_tmr16KHz==0) return (hb<<8)|lb;
  }
}


ISR(TIMER0_COMP_vect, ISR_NOBLOCK) //10ms timer
{ 
  cli();
  TIMSK &= ~(1<<OCIE0); //stop reentrance
  sei();


  OCR0 += 2;


 //call to sound heatbeat.
 	audio.heartbeat();
 

  static uint8_t cnt10ms = 77; // execute 10ms code once every 78 ISRs
  if (cnt10ms-- == 0) // BEGIN { ... every 10ms ... }
  {
    // Begin 10ms event
    cnt10ms = 77; 


  per10ms();
  heartbeat |= HEART_TIMER10ms;
  

} // end 10ms event


  cli();
  TIMSK |= (1<<OCIE0);
//  sei();	The RETI will do this
}


// Timer3 used for PPM_IN pulse width capture. Counter running at 16MHz / 8 = 2MHz
// equating to one count every half millisecond. (2 counts = 1ms). Control channel
// count delta values thus can range from about 1600 to 4400 counts (800us to 2200us),
// corresponding to a PPM signal in the range 0.8ms to 2.2ms (1.5ms at center).
// (The timer is free-running and is thus not reset to zero at each capture interval.)
ISR(TIMER3_CAPT_vect, ISR_NOBLOCK) //capture ppm in 16MHz / 8 = 2MHz
{
	


 
	
  uint16_t capture=ICR3;
  cli();
  ETIMSK &= ~(1<<TICIE3); //stop reentrance
  sei();

  static uint16_t lastCapt;
  uint16_t val = (capture - lastCapt) / 2;
  lastCapt = capture;

  // We prcoess g_ppmInsright here to make servo movement as smooth as possible
  //    while under trainee control
  if(ppmInState && ppmInState<=8){
    if(val>800 && val<2200){
      g_ppmIns[ppmInState++ - 1] =
        (int16_t)(val - 1500)*(g_eeGeneral.PPM_Multiplier+10)/10; //+-500 != 512, but close enough.
    }else{
      ppmInState=0; // not triggered
    }
  }else{
    if(val>4000 && val < 16000)
    {
      ppmInState=1; // triggered
    }
  }

  cli();
  ETIMSK |= (1<<TICIE3);
//  sei();	The RETI will do this
}

extern uint16_t g_timeMain;
//void main(void) __attribute__((noreturn));

extern unsigned char __bss_end ;

unsigned int stack_free()
{
  unsigned char *p ;

  p = &__bss_end + 1 ;
  while ( *p == 0x55 )
  {
    p+= 1 ;			
  }
  return p - &__bss_end ;
}



int main(void)
{

  DDRA = 0xff;  PORTA = 0x00;
  DDRB = 0x81;  PORTB = 0x7e; //pullups keys+nc
  DDRC = 0x3e;  PORTC = 0xc1; //pullups nc
  DDRD = 0x00;  PORTD = 0xff; //all D inputs pullups keys
  DDRE = 0x08;  PORTE = 0xff-(1<<OUT_E_BUZZER); //pullups + buzzer 0
  DDRF = 0x00;  PORTF = 0x00; //all F inputs anain - pullups are off
  //DDRG = 0x10;  PORTG = 0xff; //pullups + SIM_CTL=1 = phonejack = ppm_in
  DDRG = 0x14; PORTG = 0xfB; //pullups + SIM_CTL=1 = phonejack = ppm_in, Haptic output and off (0)
  lcd_init();


#ifdef JETI
  JETI_Init();
#endif

#ifdef FRSKY
  FRSKY_Init();
#endif

#ifdef ARDUPILOT
  ARDUPILOT_Init();
#endif

#ifdef NMEA
  NMEA_Init();
#endif



  ADMUX=ADC_VREF_TYPE;
  ADCSRA=0x85;

  // TCNT0         10ms = 16MHz/160000  periodic timer
  //TCCR0  = (1<<WGM01)|(7 << CS00);//  CTC mode, clk/1024
  TCCR0  = (7 << CS00);//  Norm mode, clk/1024
  OCR0   = 156;
  TIMSK |= (1<<OCIE0) |  (1<<TOIE0);

  // TCNT1 2MHz Pulse generator
  TCCR1A = (0<<WGM10);
  TCCR1B = (1 << WGM12) | (2<<CS10); // CTC OCR1A, 16MHz / 8
  //TIMSK |= (1<<OCIE1A); enable immediately before mainloop

  TCCR3A  = 0;
  TCCR3B  = (1<<ICNC3) | (2<<CS30);      //ICNC3 16MHz / 8
  ETIMSK |= (1<<TICIE3);


	// Init Stack while interrupts are disabled
#define STACKPTR     _SFR_IO16(0x3D)
  {
    
    unsigned char *p ;
    unsigned char *q ;

    p = (unsigned char *) STACKPTR ;
    q = &__bss_end ;
    p -= 2 ;
    while ( p > q )
    {
      *p-- = 0x55 ;			
    }
  }

  sei(); //damit alert in eeReadGeneral() nicht haengt
  g_menuStack[0] =  menuProc0;

  lcdSetRefVolt(25);
  eeReadAll();
  uint8_t cModel = g_eeGeneral.currModel;
  checkQuickSelect();



// moved here and logic added to only play statup tone if splash screen enabled.
// that way we save a bit, but keep the option for end users!
#ifdef BEEPSPKR
    if(!g_eeGeneral.disableSplashScreen)
    {
			  audioevent(AUDIO_TADA);
		}
#endif
  doSplash();
  checkMem();
  //setupAdc(); //before checkTHR
  getADC_single();
  checkTHR();
  checkSwitches();
  checkAlarm();
  checkWarnings();
  clearKeyEvents(); //make sure no keys are down before proceeding
  
  BandGap = 240 ;
  
  setupPulses();
  wdt_enable(WDTO_500MS);
  perOut(g_chans512, 0);

  pushMenu(menuProcModelSelect);
  popMenu(true);  // this is so the first instance of [MENU LONG] doesn't freak out!
  //g_menuStack[g_menuStackPtr+1] =

  lcdSetRefVolt(g_eeGeneral.contrast);
  g_LightOffCounter = g_eeGeneral.lightAutoOff*500; //turn on light for x seconds - no need to press key Issue 152
  if(cModel!=g_eeGeneral.currModel)
  {
    STORE_GENERALVARS ;    // if model was quick-selected, make sure it sticks
//    eeDirty(EE_GENERAL); // if model was quick-selected, make sure it sticks
    eeWaitComplete() ;
  }
#ifdef FRSKY
  FrskyAlarmSendState |= 0x40 ;
#endif
  
  OCR1A = 2000 ;        // set to 1mS
  TIFR = 1 << OCF1A ;   // Clear pending interrupt

  PULSEGEN_ON; // Pulse generator enable immediately before mainloop
  while(1){
      //uint16_t old10ms=get_tmr10ms();
      mainSequence() ;
  }
}

void mainSequence()
{
      uint16_t t0 = getTmr16KHz();
      getADC[g_eeGeneral.filterInput]();
      getADC_bandgap() ;
      perMain();
      //while(get_tmr10ms()==old10ms) sleep_mode();
      if(heartbeat == 0x3)
      {
          wdt_reset();
          heartbeat = 0;
      }
      t0 = getTmr16KHz() - t0;
      g_timeMain = max(g_timeMain,t0);
}



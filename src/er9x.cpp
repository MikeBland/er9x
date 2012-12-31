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
#include <stdlib.h>

// Next two lines swapped as new complier/linker reverses them in memory!
const
#include "s9xsplash.lbm"
#include "splashmarker.h"

/*
mode1 rud ele thr ail
mode2 rud thr ele ail
mode3 ail ele thr rud
mode4 ail thr ele rud
*/

#define ROTARY	1

extern int16_t AltOffset ;

static void checkMem( void );
static void checkTHR( void );
///   Pr�ft beim Einschalten ob alle Switches 'off' sind.
static void checkSwitches( void );

#ifndef SIMU
static void checkQuickSelect( void ); // Quick model select on startup
static void getADC_osmp( void ) ;
#endif

EEGeneral  g_eeGeneral;
ModelData  g_model;

const prog_char *AlertMessage ;
uint8_t Main_running ;
uint8_t SlaveMode ;
uint8_t Vs_state[NUM_CHNOUT] ;

#if ROTARY		
uint8_t RotPosition ;
uint8_t RotCount ;
uint8_t RotEncoder ;
int8_t LastRotaryValue ;
int8_t Rotary_diff ;
int8_t RotaryControl ;
#endif

uint8_t Tevent ;

//const prog_uint8_t APM chout_ar[] = { //First number is 0..23 -> template setup,  Second is relevant channel out
//                                      1,2,3,4 , 1,2,4,3 , 1,3,2,4 , 1,3,4,2 , 1,4,2,3 , 1,4,3,2,
//                                      2,1,3,4 , 2,1,4,3 , 2,3,1,4 , 2,3,4,1 , 2,4,1,3 , 2,4,3,1,
//                                      3,1,2,4 , 3,1,4,2 , 3,2,1,4 , 3,2,4,1 , 3,4,1,2 , 3,4,2,1,
//                                      4,1,2,3 , 4,1,3,2 , 4,2,1,3 , 4,2,3,1 , 4,3,1,2 , 4,3,2,1    };
const prog_uint8_t APM bchout_ar[] = {
																			0x1B, 0x1E, 0x27, 0x2D, 0x36, 0x39,
																			0x4B, 0x4E, 0x63, 0x6C, 0x72, 0x78,
                                      0x87, 0x8D, 0x93, 0x9C, 0xB1, 0xB4,
                                      0xC6, 0xC9, 0xD2, 0xD8, 0xE1, 0xE4		} ;

//new audio object
audioQueue  audio;

uint8_t sysFlags = 0;

uint8_t AlarmTimer = 100 ;		// Units of 10 mS
uint8_t AlarmCheckFlag = 0 ;
uint8_t CsCheckFlag = 0 ;
uint8_t VoiceFtimer = 10 ;		// Units of 10 mS
uint8_t VoiceCheckFlag = 2 ;
int8_t  CsTimer[NUM_CSW] ;


#define BACKLIGHT_ON    (Voice.Backlight = 1)
#define BACKLIGHT_OFF   (Voice.Backlight = 0)
//#define BACKLIGHT_ON    {Backlight = 1 ; if ( (g_eeGeneral.speakerMode & 2) == 0 ) PORTB |=  (1<<OUT_B_LIGHT);}
//#define BACKLIGHT_OFF   {Backlight = 0 ; if ( (g_eeGeneral.speakerMode & 2) == 0 ) PORTB &= ~(1<<OUT_B_LIGHT);}

const prog_char APM Str_OFF[] =  "OFF" ;
const prog_char APM Str_ON[] = "ON " ;

const prog_char APM modi12x3[]=                         
"RUD ELE THR AIL ";
//"RUD THR ELE AIL "
//"AIL ELE THR RUD "
//"AIL THR ELE RUD ";
// Now indexed using modn2x3 from below

const prog_uint8_t APM modn12x3[]= {
    1, 2, 3, 4,
    1, 3, 2, 4,
    4, 2, 3, 1,
    4, 3, 2, 1 };

//R=1
//E=2
//T=3
//A=4


uint8_t CS_STATE( uint8_t x)
{
	return ((x)<CS_AND ? CS_VOFS : ((x)<CS_EQUAL ? CS_VBOOL : ((x)<CS_TIME ? CS_VCOMP : CS_TIMER))) ;
}

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
	div_t qr ;

    if ( tme<0 )
    {
        lcd_putcAtt( x - ((att&DBLSIZE) ? FWNUM*6-2 : FWNUM*3),    y, '-',att);
        tme = -tme;
    }

    lcd_putcAtt(x, y, ':',att&att2);
		qr = div( tme, 60 ) ;
    lcd_outdezNAtt(x/*+ ((att&DBLSIZE) ? 2 : 0)*/, y, (uint16_t)qr.quot, LEADING0|att,2);
    x += (att&DBLSIZE) ? FWNUM*6-4 : FW*3-3;
    lcd_outdezNAtt(x, y, (uint16_t)qr.rem, LEADING0|att2,2);
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
	uint8_t chanLimit = NUM_XCHNRAW ;
	if ( att & MIX_SOURCE )
	{
#if GVARS
		chanLimit += 6 ;
#else
		chanLimit += 1 ;
#endif
		att &= ~MIX_SOURCE ;		
	}
    if(idx==0)
        lcd_putsnAtt(x,y,PSTR("----"),4,att);
    else if(idx<=4)
        lcd_putsnAtt(x,y,&modi12x3[(pgm_read_byte(modn12x3+g_eeGeneral.stickMode*4+(idx-1))-1)*4],4,att);
//        lcd_putsnAtt(x,y,modi12x3+g_eeGeneral.stickMode*16+4*(idx-1),4,att);
    else if(idx<=chanLimit)
#if GVARS
        lcd_putsAttIdx(x,y,PSTR("\004P1  P2  P3  HALFFULLCYC1CYC2CYC3PPM1PPM2PPM3PPM4PPM5PPM6PPM7PPM8CH1 CH2 CH3 CH4 CH5 CH6 CH7 CH8 CH9 CH10CH11CH12CH13CH14CH15CH163POSGV1 GV2 GV3 GV4 GV5 "),(idx-5),att);
#else
        lcd_putsAttIdx(x,y,PSTR("\004P1  P2  P3  HALFFULLCYC1CYC2CYC3PPM1PPM2PPM3PPM4PPM5PPM6PPM7PPM8CH1 CH2 CH3 CH4 CH5 CH6 CH7 CH8 CH9 CH10CH11CH12CH13CH14CH15CH163POS"),(idx-5),att);
#endif
//        lcd_putsAttIdx(x,y,PSTR("\004P1  P2  P3  HALFFULLCYC1CYC2CYC3PPM1PPM2PPM3PPM4PPM5PPM6PPM7PPM8CH1 CH2 CH3 CH4 CH5 CH6 CH7 CH8 CH9 CH10CH11CH12CH13CH14CH15CH163POS"),(idx-5),att);
#ifdef FRSKY
    else
        lcd_putsAttIdx(x,y,Str_telemItems,(idx-NUM_XCHNRAW),att);
#endif
}

void putsChn(uint8_t x,uint8_t y,uint8_t idx1,uint8_t att)
{
	if ( idx1 == 0 )
	{
    lcd_putsnAtt(x,y,PSTR("--- "),4,att);
	}
	else
	{
		uint8_t x1 ;
		x1 = x + 4*FW-2 ;
		if ( idx1 < 10 )
		{
			x1 -= FWNUM ;			
		}
//		lcd_outdezNAtt(uint8_t x,uint8_t y,int32_t val,uint8_t mode,int8_t len)
//  	lcd_outdezNAtt(x+2*FW,y,idx1,LEFT|att,2);
  	lcd_outdezAtt(x1,y,idx1,att);
    lcd_putsnAtt(x,y,PSTR("CH"),2,att);
	}
    // !! todo NUM_CHN !!
//    lcd_putsnAtt(x,y,PSTR("--- CH1 CH2 CH3 CH4 CH5 CH6 CH7 CH8 CH9 CH10CH11CH12CH13CH14CH15CH16"
//                          "CH17CH18CH19CH20CH21CH22CH23CH24CH25CH26CH27CH28CH29CH30")+4*idx1,4,att);
}

void putsDrSwitches(uint8_t x,uint8_t y,int8_t idx1,uint8_t att)//, bool nc)
{
    switch(idx1){
    case  0:            lcd_putsAtt(x+FW,y,PSTR("---"),att);return;
    case  MAX_DRSWITCH: lcd_putsAtt(x+FW,y,Str_ON ,att);return;
    case -MAX_DRSWITCH: lcd_putsAtt(x+FW,y,Str_OFF,att);return;
    }
		if ( idx1 < 0 )
		{
  		lcd_putcAtt(x,y, '!',att);
		}
		int8_t z ;
		z = idx1 ;
		if ( z < 0 )
		{
			z = -idx1 ;			
		}
    lcd_putsnAtt(x+FW,y,get_switches_string()+3*(z-1),3,att);
}

const prog_char *get_switches_string()
{
    return PSTR(SWITCHES_STR)	;
}	

void putsTmrMode(uint8_t x, uint8_t y, uint8_t attr, uint8_t type )
{ // Valid values of type are 0, 1 or 2 only
  int8_t tm = g_model.tmrMode;
	if ( type < 2 )		// 0 or 1
	{
    if(abs(tm)<TMR_VAROFS) {
        lcd_putsAttIdx(  x, y, PSTR("\003OFFABSRUsRU%ELsEL%THsTH%ALsAL%P1 P1%P2 P2%P3 P3%"),abs(tm),attr);
        if(tm<(-TMRMODE_ABS)) lcd_putcAtt(x-1*FW,  y,'!',attr);
//        return;
    }

    else if(abs(tm)<(TMR_VAROFS+MAX_DRSWITCH-1)) { //normal on-off
        putsDrSwitches( x-1*FW,y,tm>0 ? tm-(TMR_VAROFS-1) : tm+(TMR_VAROFS-1),attr);
//        return;
    }

		else
		{
    	lcd_putcAtt(x+3*FW,  y,'m',attr);
    	putsDrSwitches( x-1*FW,y,tm>0 ? tm-(TMR_VAROFS+MAX_DRSWITCH-1-1) : tm+(TMR_VAROFS+MAX_DRSWITCH-1-1),attr);//momentary on-off
		}
	}
	if ( ( type == 2 ) || ( ( type == 0 ) && ( tm == 1 ) ) )
	{
   	putsDrSwitches( x-1*FW, y, g_model.tmrModeB, attr );
	}
}

#ifdef FRSKY

uint16_t scale_telem_value( uint16_t val, uint8_t channel, uint8_t times2, uint8_t *p_att )
{
  uint32_t value ;
	uint16_t ratio ;
	FrSkyChannelData *fd ;
	
	fd = &g_model.frsky.channels[channel] ;
  value = val ;
  ratio = fd->ratio ;
  if ( times2 )
  {
      ratio <<= 1 ;
  }
  value *= ratio ;
	if ( fd->type == 3/*A*/)
  {
      value /= 100 ;
      *p_att |= PREC1 ;
  }
  else if ( ratio < 100 )
  {
      value *= 2 ;
      value /= 51 ;  // Same as *10 /255 but without overflow
      *p_att |= PREC2 ;
  }
  else
  {
      value /= 255 ;
  }
	return value ;
}

uint8_t putsTelemValue(uint8_t x, uint8_t y, uint8_t val, uint8_t channel, uint8_t att, uint8_t scale)
{
    uint32_t value ;
    //  uint8_t ratio ;
    uint8_t times2 ;
    uint8_t unit = ' ' ;
		FrSkyChannelData *fd ;

		fd = &g_model.frsky.channels[channel] ;
    value = val ;
    if (fd->type == 2/*V*/)
    {
        times2 = 1 ;
    }
    else
    {
        times2 = 0 ;
    }

    if ( scale )
    {
			value = scale_telem_value( val, channel, times2, &att ) ;
    }
    else
    {
        if ( times2 )
        {
            value <<= 1 ;
        }
		  	if (fd->type == 3/*A*/)
        {
            value *= 255 ;
            value /= 100 ;
            att |= PREC1 ;
        }
    }
    //              val = (uint16_t)staticTelemetry[i]*g_model.frsky.channels[i].ratio / 255;
    //              putsTelemetry(x0-2, 2*FH, val, g_model.frsky.channels[i].type, blink|DBLSIZE|LEFT);
    //  if (g_model.frsky.channels[channel].type == 0/*v*/)
    if ( (fd->type == 0/*v*/) || (fd->type == 2/*v*/) )
    {
      lcd_outdezNAtt(x, y, value, att|PREC1, 5) ;
			unit = 'v' ;
      if(!(att&NO_UNIT)) lcd_putcAtt(lcd_lastPos, y, unit, att);
    }
    else
    {
        lcd_outdezAtt(x, y, value, att);
		    if (fd->type == 3/*A*/)
				{
					unit = 'A' ;
        	if(!(att&NO_UNIT)) lcd_putcAtt(lcd_lastPos, y, unit, att);
				}
    }
		return unit ;
}


#endif

int16_t getValue(uint8_t i)
{
#ifdef FRSKY
	int8_t j ;
	int16_t offset = 0 ;
#endif
    if(i<PPM_BASE) return calibratedStick[i];//-512..512
    else if(i<PPM_BASE+4) return (g_ppmIns[i-PPM_BASE] - g_eeGeneral.trainer.calib[i-PPM_BASE])*2;
    else if(i<CHOUT_BASE) return g_ppmIns[i-PPM_BASE]*2;
    else if(i<CHOUT_BASE+NUM_CHNOUT) return ex_chans[i-CHOUT_BASE];
#ifdef FRSKY
    else if(i<CHOUT_BASE+NUM_CHNOUT+NUM_TELEM_ITEMS)
		{
			j = pgm_read_byte( &TelemIndex[i-CHOUT_BASE-NUM_CHNOUT] ) ;
			if ( j >= 0 )
			{
	      if ( j == FR_ALT_BARO )
				{
          offset = AltOffset ;
				}
				return FrskyHubData[j] + offset ;
			}
			else if ( j == -3 )		// Battery
			{
				return g_vbat100mV ;
			}
			else
			{
				return TimerG.s_timerVal[j+2] ;
			}
		}
#endif
    else return 0;
}

bool Last_switch[NUM_CSW] ;

bool getSwitch(int8_t swtch, bool nc, uint8_t level)
{
    bool ret_value ;
    uint8_t cs_index ;

    if(level>5) return false; //prevent recursive loop going too deep

    switch(swtch){
    case  0:            return  nc;
    case  MAX_DRSWITCH: return  true;
    case -MAX_DRSWITCH: return  false;
    }

		if ( swtch > MAX_DRSWITCH )
		{
			return false ;
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
    cs_index = abs(swtch)-(MAX_DRSWITCH-NUM_CSW);
    CSwData &cs = g_model.customSw[cs_index];
    if(!cs.func) return false;

    if ( level>4 )
    {
        ret_value = Last_switch[cs_index] ;
        return swtch>0 ? ret_value : !ret_value ;
    }

    int8_t a = cs.v1;
    int8_t b = cs.v2;
    int16_t x = 0;
    int16_t y = 0;
		uint8_t valid = 1 ;

    // init values only if needed
    uint8_t s = CS_STATE(cs.func);

    if(s == CS_VOFS)
    {
        x = getValue(cs.v1-1);
#ifdef FRSKY
        if (cs.v1 > CHOUT_BASE+NUM_CHNOUT)
				{
          y = convertTelemConstant( cs.v1-CHOUT_BASE-NUM_CHNOUT-1, cs.v2 ) ;
					valid = telemItemValid( cs.v1-CHOUT_BASE-NUM_CHNOUT-1 ) ;
				}
        else
#endif
            y = calc100toRESX(cs.v2);
    }
    else if(s == CS_VCOMP)
    {
        x = getValue(cs.v1-1);
        y = getValue(cs.v2-1);
    }

    switch ((uint8_t)cs.func) {
    case (CS_VPOS):
        ret_value = (x>y);
        break;
    case (CS_VNEG):
        ret_value = (x<y) ;
        break;
    case (CS_APOS):
    {
        ret_value = (abs(x)>y) ;
    }
    //      return swtch>0 ? (abs(x)>y) : !(abs(x)>y);
    break;
    case (CS_ANEG):
    {
        ret_value = (abs(x)<y) ;
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
            ret_value = res1 && res2 ;
        }
        else if ( cs.func == CS_OR )
        {
            ret_value = res1 || res2 ;
        }
        else  // CS_XOR
        {
            ret_value = res1 ^ res2 ;
        }
    }
    break;

    case (CS_EQUAL):
        ret_value = (x==y);
        break;
    case (CS_NEQUAL):
        ret_value = (x!=y);
        break;
    case (CS_GREATER):
        ret_value = (x>y);
        break;
    case (CS_LESS):
        ret_value = (x<y);
        break;
    case (CS_EGREATER):
        ret_value = (x>=y);
        break;
    case (CS_ELESS):
        ret_value = (x<=y);
        break;
    case (CS_TIME):
        ret_value = CsTimer[cs_index] >= 0 ;
        break;
    default:
        ret_value = false;
        break;
    }
		if ( valid == 0 )			// Catch telemetry values not present
		{
      ret_value = false;
		}
		if ( ret_value )
		{
			if ( cs.andsw )
			{
				int8_t x ;
				x = cs.andsw ;
				if ( x > 8 )
				{
					x += 1 ;
				}
      	ret_value = getSwitch( x, 0, level+1) ;
			}
		}
    Last_switch[cs_index] = ret_value ;
    return swtch>0 ? ret_value : !ret_value ;

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

static void clearKeyEvents()
{
#ifdef SIMU
    while (keyDown() && main_thread_running) sleep(1/*ms*/);
#else
    while (keyDown());  // loop until all keys are up
#endif
    putEvent(0);
}

void check_backlight_voice()
{
	static uint8_t tmr10ms ;
    if(getSwitch(g_eeGeneral.lightSw,0) || g_LightOffCounter)
        BACKLIGHT_ON ;
    else
        BACKLIGHT_OFF ;
	
	if ( tmr10ms != g_blinkTmr10ms )
	{
		tmr10ms = g_blinkTmr10ms ;
		Voice.voice_process() ;
	}
}

uint16_t stickMoveValue()
{
#define INAC_DEVISOR 256   // Issue 206 - bypass splash screen with stick movement
    uint16_t sum = 0;
    for(uint8_t i=0; i<4; i++)
        sum += anaIn(i)/INAC_DEVISOR;
    return sum ;
}

static void doSplash()
{
    {

#ifdef SIMU
	    if (!main_thread_running) return;
  	  sleep(1/*ms*/);
#endif

        check_backlight_voice() ;

        lcd_clear();
        lcd_img(0, 0, s9xsplash,0);
        if(!g_eeGeneral.hideNameOnSplash)
            lcd_putsnAtt(0*FW, 7*FH, g_eeGeneral.ownerName ,sizeof(g_eeGeneral.ownerName),BSS);

        refreshDiplay();
				lcdSetContrast() ;

        clearKeyEvents();

//#ifndef SIMU
//        for(uint8_t i=0; i<32; i++)
//            getADC_filt(); // init ADC array
//#endif
        getADC_osmp();

        uint16_t inacSum = stickMoveValue();
        //        for(uint8_t i=0; i<4; i++)
        //           inacSum += anaIn(i)/INAC_DEVISOR;

        uint16_t tgtime = get_tmr10ms() + SPLASH_TIMEOUT;  
        do
				{
        	refreshDiplay();
          check_backlight_voice() ;
#ifdef SIMU
            if (!main_thread_running) return;
            sleep(1/*ms*/);
#else
            getADC_osmp();
#endif
            uint16_t tsum = stickMoveValue();
            //            for(uint8_t i=0; i<4; i++)
            //               tsum += anaIn(i)/INAC_DEVISOR;

            if(keyDown() || (tsum!=inacSum))   return;  //wait for key release

        } while(tgtime != get_tmr10ms()) ;
    }
}

static void checkMem()
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
    lcd_puts_Pleft(4*FH,s);
    lcd_puts_Pleft(5*FH,t);
    lcd_puts_Pleft(6*FH,  PSTR("Press any key to skip") ) ;
    refreshDiplay();
		lcdSetContrast() ;

    clearKeyEvents();
}


int16_t tanaIn( uint8_t chan )
{
 	int16_t v = anaIn(chan) ;
	return  (g_eeGeneral.throttleReversed) ? -v : v ;
}

static void checkTHR()
{
    if(g_eeGeneral.disableThrottleWarning) return;

    uint8_t thrchn=(2-(g_eeGeneral.stickMode&1));//stickMode=0123 -> thr=2121
 	  
#ifndef SIMU
		getADC_osmp();   // if thr is down - do not display warning at all
#endif
 	  
		int16_t lowLim = g_eeGeneral.calibMid[thrchn] ;

		lowLim = (g_eeGeneral.throttleReversed ? (- lowLim) - g_eeGeneral.calibSpanPos[thrchn] : lowLim - g_eeGeneral.calibSpanNeg[thrchn]);
		lowLim += THRCHK_DEADBAND ;
 
 	  int16_t v = tanaIn(thrchn);
 
 	  if(v<=lowLim) return;

    // first - display warning
    alertMessages( PSTR("Throttle not idle"), PSTR("Reset throttle") ) ;

    //loop until all switches are reset
    while (1)
    {
#ifdef SIMU
      if (!main_thread_running) return;
      sleep(1/*ms*/);
#else
        getADC_osmp();
#endif
        check_backlight_voice() ;
        
				v = tanaIn(thrchn);
        
				if((v<=lowLim) || (keyDown()))
        {
            return;
        }
    }
}

static void checkAlarm() // added by Gohst
{
    if(g_eeGeneral.disableAlarmWarning) return;
    if(!g_eeGeneral.beeperVal) alert(PSTR("Alarms Disabled"));
}

static void checkWarnings()
{
    if(sysFlags && sysFLAG_OLD_EEPROM)
    {
        alert(PSTR(" Old Version EEPROM   CHECK SETTINGS/CALIB")); //will update on next save
        sysFlags &= ~(sysFLAG_OLD_EEPROM); //clear flag
    }
}

void putWarnSwitch( uint8_t x, uint8_t idx )
{
  lcd_putsnAtt( x, 2*FH, get_switches_string() + idx, 3, 0) ;
}

static void checkSwitches()
{
	uint8_t warningStates ;
	
	warningStates = g_eeGeneral.switchWarningStates ;

    if(g_eeGeneral.disableSwitchWarning) return; // if warning is on

    // first - display warning
    alertMessages( Str_Switch_warn, PSTR("Please Reset Switches") ) ;
//    for(uint8_t i=0;i<8;i++) lcd_putsnAtt((5+i)*FW, 3*FH, PSTR("TRE012AG")+i,1,  ((g_eeGeneral.switchWarningStates & (1<<i)) ? INVERS : 0 ) );
//    refreshDiplay();

    uint8_t x = warningStates & SWP_IL5;
//    if(x==SWP_IL1 || x==SWP_IL2 || x==SWP_IL3 || x==SWP_IL4 || x==SWP_IL5) //illegal states for ID0/1/2
    if(!(x==SWP_LEG1 || x==SWP_LEG2 || x==SWP_LEG3)) //legal states for ID0/1/2
    {
        warningStates &= ~SWP_IL5; // turn all off, make sure only one is on
        warningStates |=  SWP_ID0B;
				g_eeGeneral.switchWarningStates = warningStates ;
    }

    //loop until all switches are reset
    while (1)
    {
        uint8_t i = 0;
        for(uint8_t j=0; j<8; j++)
        {
            bool t=keyState((EnumKeys)(SW_BASE_DIAG+7-j));
						i <<= 1 ;
            i |= t;
        }
//        alertMessages( PSTR("Switches Warning"), PSTR("Please Reset Switches") ) ;


        //show the difference between i and switch?
        //show just the offending switches.
        //first row - THR, GEA, AIL, ELE, ID0/1/2
        uint8_t x = i ^ warningStates ;

        lcd_puts_Pleft( 2*FH, PSTR("                      ") ) ;

        if(x & SWP_THRB)
            putWarnSwitch(2 + 0*FW, 0 );
        if(x & SWP_RUDB)
            putWarnSwitch(2 + 3*FW + FW/2, 3 );
        if(x & SWP_ELEB)
            putWarnSwitch(2 + 7*FW, 6 );

        if(x & SWP_IL5)
        {
            if(i & SWP_ID0B)
                putWarnSwitch(2 + 10*FW + FW/2, 9 );
            else if(i & SWP_ID1B)
                putWarnSwitch(2 + 10*FW + FW/2, 12 );
            else if(i & SWP_ID2B)
                putWarnSwitch(2 + 10*FW + FW/2, 15 );
        }

        if(x & SWP_AILB)
            putWarnSwitch(2 + 14*FW, 18 );
        if(x & SWP_GEAB)
            putWarnSwitch(2 + 17*FW + FW/2, 21 );


        refreshDiplay();


        if((i==warningStates) || (keyDown())) // check state against settings
        {
            return;  //wait for key release
        }

        check_backlight_voice() ;
    }
}

void putsDblSizeName( uint8_t y )
{
	for(uint8_t i=0;i<sizeof(g_model.name);i++)
		lcd_putcAtt(FW*2+i*2*FW-i-2, y, g_model.name[i],DBLSIZE);
}

#ifndef SIMU
static void checkQuickSelect()
{
    uint8_t i = keyDown(); //check for keystate
    uint8_t j;

    for(j=0; j<7; j++)
		{
			if ( i & 0x02 ) break ;
			i >>= 1 ;
		}

//    for(j=1; j<8; j++)
//        if(i & ((uint8_t)(1<<j))) break;
//    j--;

    if(j<6) {
        if(!eeModelExists(j)) return;

        eeLoadModel(g_eeGeneral.currModel = j);
        STORE_GENERALVARS;
        //        eeDirty(EE_GENERAL);

        lcd_clear();
        lcd_putsAtt(64-7*FW,0*FH,PSTR("LOADING"),DBLSIZE);

				putsDblSizeName( 3*FH ) ;
//        for(uint8_t i=0;i<sizeof(g_model.name);i++)
//            lcd_putcAtt(FW*2+i*2*FW-i-2, 3*FH, g_model.name[i],DBLSIZE);

        refreshDiplay();
        clearKeyEvents(); // wait for user to release key
    }
}
#endif

MenuFuncP g_menuStack[5];

uint8_t  g_menuStackPtr = 0;
//uint8_t  g_beepCnt;
//uint8_t  g_beepVal[5];

#define	ALERT_TYPE	0
#define MESS_TYPE		1

void almess( const prog_char * s, uint8_t type )
{
	const prog_char *h ;
  lcd_clear();
  lcd_puts_Pleft(4*FW,s);
	if ( type == ALERT_TYPE)
	{
    lcd_puts_P(64-6*FW,7*FH,PSTR("press any Key"));
		h = PSTR("ALERT") ;
	}
	else
	{
		h = PSTR("MESSAGE") ;
	}
  lcd_putsAtt(64-5*FW,0*FH, h,DBLSIZE);
  refreshDiplay();
}


void message(const prog_char * s)
{
	almess( s, MESS_TYPE ) ;
	lcdSetContrast() ;
}

void alert(const prog_char * s, bool defaults)
{
	if ( Main_running )
	{
		AlertMessage = s ;
		return ;
	}
	
	almess( s, ALERT_TYPE ) ;
  
	lcdSetRefVolt(defaults ? 25 : g_eeGeneral.contrast);
  audioVoiceDefevent(AU_ERROR, V_ALERT);

    clearKeyEvents();
    while(1)
    {
#ifdef SIMU
    if (!main_thread_running) return;
    sleep(1/*ms*/);
#endif
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
        	BACKLIGHT_ON ;
		    else
    	    BACKLIGHT_OFF ;
        check_backlight_voice() ;
    }
}

int8_t *TrimPtr[4] = 
{
    &g_model.trim[0],
    &g_model.trim[1],
    &g_model.trim[2],
    &g_model.trim[3]
} ;

static uint8_t checkTrim(uint8_t event)
{
    int8_t  k = (event & EVT_KEY_MASK) - TRM_BASE;
    int8_t  s = g_model.trimInc;
//    if (s>1) s = 1 << (s-1);  // 1=>1  2=>2  3=>4  4=>8
		if ( s == 4 )
		{
			s = 8 ;			  // 1=>1  2=>2  3=>4  4=>8
		}
		else
		{
			if ( s == 3 )
			{
				s = 4 ;			  // 1=>1  2=>2  3=>4  4=>8
			}
		}


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
            audioDefevent(AU_TRIM_MIDDLE);

        } else if(x>-125 && x<125){
            *TrimPtr[idx] = (int8_t)x;
            STORE_MODELVARS_TRIM;
            //if(event & _MSK_KEY_REPT) warble = true;
            if(x <= 125 && x >= -125){
                audio.event(AU_TRIM_MOVE,(abs(x)/4)+60);
            }
        }
        else
        {
            *TrimPtr[idx] = (x>0) ? 125 : -125;
            STORE_MODELVARS_TRIM;
            if(x <= 125 && x >= -125){
                audio.event(AU_TRIM_MOVE,(-abs(x)/4)+60);
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

int16_t checkIncDec16( int16_t val, int16_t i_min, int16_t i_max, uint8_t i_flags)
{
    int16_t newval = val;
    uint8_t kpl=KEY_RIGHT, kmi=KEY_LEFT, kother = -1;
		uint8_t skipPause = 0 ;

		uint8_t event = Tevent ;
//    if(event & _MSK_KEY_DBL){
//        uint8_t hlp=kpl;
//        kpl=kmi;
//        kmi=hlp;
//        event=EVT_KEY_FIRST(EVT_KEY_MASK & event);
//    }
    if(event==EVT_KEY_FIRST(kpl) || event== EVT_KEY_REPT(kpl) || (s_editMode && (event==EVT_KEY_FIRST(KEY_UP) || event== EVT_KEY_REPT(KEY_UP))) ) {
        newval++;

        audioDefevent(AU_KEYPAD_UP);

        kother=kmi;
    }else if(event==EVT_KEY_FIRST(kmi) || event== EVT_KEY_REPT(kmi) || (s_editMode && (event==EVT_KEY_FIRST(KEY_DOWN) || event== EVT_KEY_REPT(KEY_DOWN))) ) {
        newval--;

        audioDefevent(AU_KEYPAD_DOWN);

        kother=kpl;
    }
    if((kother != (uint8_t)-1) && keyState((EnumKeys)kother)){
        newval=-val;
        killEvents(kmi);
        killEvents(kpl);
    }
    if(i_min==0 && i_max==1 && (event==EVT_KEY_FIRST(KEY_MENU) || event==EVT_KEY_BREAK(BTN_RE)) )
    {
        s_editMode = false;
        newval=!val;
        killEvents(event);
				skipPause = 1 ;
				if ( event==EVT_KEY_BREAK(BTN_RE) )
				{
					RotaryState = ROTARY_MENU_UD ;
				}
    }

    //change values based on P1
    newval -= p1valdiff;
		if ( RotaryState == ROTARY_VALUE )
		{
			newval += Rotary_diff ;
		}
    if(newval>i_max)
    {
        newval = i_max;
        killEvents(event);
        audioDefevent(AU_KEYPAD_UP);
    }
    else if(newval < i_min)
    {
        newval = i_min;
        killEvents(event);
        audioDefevent(AU_KEYPAD_DOWN);

    }
    if(newval != val) {
        if(newval==0) {
						if ( !skipPause )
						{
          	  pauseEvents(event);
						}

            if (newval>val){
                audioDefevent(AU_KEYPAD_UP);
            } else {
                audioDefevent(AU_KEYPAD_DOWN);
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

NOINLINE int8_t checkIncDec( int8_t i_val, int8_t i_min, int8_t i_max, uint8_t i_flags)
{
    return checkIncDec16( i_val,i_min,i_max,i_flags);
}

int8_t checkIncDec_hm( int8_t i_val, int8_t i_min, int8_t i_max)
{
    return checkIncDec( i_val,i_min,i_max,EE_MODEL);
}

int8_t checkIncDec_hm0( int8_t i_val, int8_t i_max)
{
    return checkIncDec( i_val,0,i_max,EE_MODEL);
}

int8_t checkIncDec_hg( int8_t i_val, int8_t i_min, int8_t i_max)
{
    return checkIncDec( i_val,i_min,i_max,EE_GENERAL);
}

MenuFuncP lastPopMenu()
{
    return  g_menuStack[g_menuStackPtr+1];
}

void popMenu(bool uppermost)
{
    if(g_menuStackPtr>0 || uppermost){
        g_menuStackPtr = uppermost ? 0 : g_menuStackPtr-1;
        audioDefevent(AU_MENUS);
        (*g_menuStack[g_menuStackPtr])(EVT_ENTRY_UP);
    }else{
        alert(PSTR("menuStack underflow"));
    }
}

void chainMenu(MenuFuncP newMenu)
{
    g_menuStack[g_menuStackPtr] = newMenu;
    (*newMenu)(EVT_ENTRY);
    audioDefevent(AU_MENUS);
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
    audioDefevent(AU_MENUS);
    g_menuStack[g_menuStackPtr] = newMenu;
    (*newMenu)(EVT_ENTRY);
}

uint8_t  g_vbat100mV = 74 ;
volatile uint8_t tick10ms = 0;
uint16_t g_LightOffCounter;
uint8_t  stickMoved = 0;

inline bool checkSlaveMode()
{
    // no power -> only phone jack = slave mode

#ifdef BUZZER_MOD
    return SlaveMode = SLAVE_MODE ;
#else
    static bool lastSlaveMode = false;

    static uint8_t checkDelay = 0;
    if (audio.busy()) {
        checkDelay = 20;
    }
    else if (checkDelay) {
        --checkDelay;
    }
    else {
        lastSlaveMode = SLAVE_MODE;//
    }
    return (SlaveMode = lastSlaveMode) ;
#endif
}


//uint16_t Timer2 = 0 ;

void resetTimer2()
{
	struct t_timerg *tptr ;

	tptr = &TimerG ;
	FORCE_INDIRECT(tptr) ;
  tptr->Timer2_pre = 0 ;
  tptr->s_timerVal[1] = 0 ;
  tptr->Timer2_running = 0 ;   // Stop and clear throttle started flag
}

void doBackLightVoice(uint8_t evt)
{
    uint8_t a = 0;
    uint16_t b ;
    uint16_t lightoffctr ;
		lightoffctr = g_LightOffCounter ;

    if(lightoffctr) lightoffctr--;
    if(evt) a = g_eeGeneral.lightAutoOff ; // on keypress turn the light on 5*100
    if(stickMoved)
		{
			if ( g_eeGeneral.lightOnStickMove > a )
			{
				a = g_eeGeneral.lightOnStickMove ;
			}
		}
    b = a * 250 ;
		b <<= 1 ;				// b = a * 500, but less code
		if(b>lightoffctr) lightoffctr = b;
		g_LightOffCounter = lightoffctr ;
    check_backlight_voice();
}

//static uint8_t v_ctr ;
//uint8_t v_first[8] ;


void putVoiceQueueUpper( uint8_t value )
{
	putVoiceQueueLong( value + 260 ) ;
}


void putVoiceQueue( uint8_t value )
{
	putVoiceQueueLong( value ) ;
}

void putVoiceQueueLong( uint16_t value )
{
	struct t_voice *vptr ;
	vptr = &Voice ;
	FORCE_INDIRECT(vptr) ;
	
	if ( vptr->VoiceQueueCount < VOICE_Q_LENGTH )
	{
		vptr->VoiceQueue[vptr->VoiceQueueInIndex++] = value ;
		if (vptr->VoiceQueueInIndex > ( VOICE_Q_LENGTH - 1 ) )
		{
			vptr->VoiceQueueInIndex = 0 ;			
		}
		vptr->VoiceQueueCount += 1 ;
	}
}

void t_voice::voice_process(void)
{
	if ( g_eeGeneral.speakerMode & 2 )
	{
		if ( Backlight )
		{
			VoiceLatch |= BACKLIGHT_BIT ;			
		}
		else
		{
			VoiceLatch &= ~BACKLIGHT_BIT ;			
		}

		if ( VoiceState == V_IDLE )
		{
			PORTB |= (1<<OUT_B_LIGHT) ;				// Latch clock high
			if ( VoiceQueueCount )
			{
				VoiceSerial = VoiceQueue[VoiceQueueOutIndex++] ;
				if (VoiceQueueOutIndex > ( VOICE_Q_LENGTH - 1 ) )
				{
					VoiceQueueOutIndex = 0 ;			
				}
				VoiceQueueCount -= 1 ;
//				if ( VoiceShift )
//				{
//					VoiceShift = 0 ;
//					VoiceSerial += 260 ;
//				}
				VoiceTimer = 17 ;
//				if ( ( VoiceSerial & 0x00FF ) >= 0xF0 )
				if ( VoiceSerial & 0x8000 )	// Looking for Volume setting
				{
//					if ( VoiceSerial == 0xFF )
//					{
//						VoiceShift = 1 ;
//						return ;
//					}
//					VoiceSerial |= 0xFF00 ;
					VoiceTimer = 40 ;
				}
				VoiceLatch &= ~VOICE_CLOCK_BIT & ~VOICE_DATA_BIT ;
				if ( VoiceSerial & 0x8000 )
				{
					VoiceLatch |= VOICE_DATA_BIT ;
				}
				PORTA_LCD_DAT = VoiceLatch ;			// Latch data set
				PORTB &= ~(1<<OUT_B_LIGHT) ;			// Latch clock low
				VoiceCounter = 31 ;
				VoiceState = V_CLOCKING ;
			}
			else
			{
				PORTA_LCD_DAT = VoiceLatch ;			// Latch data set
				PORTB &= ~(1<<OUT_B_LIGHT) ;			// Latch clock low
			}
		}
		else if ( VoiceState == V_STARTUP )
		{
			PORTB |= (1<<OUT_B_LIGHT) ;				// Latch clock high
			VoiceLatch |= VOICE_CLOCK_BIT | VOICE_DATA_BIT ;
			PORTA_LCD_DAT = VoiceLatch ;			// Latch data set
			if ( g_blinkTmr10ms > 60 )					// Give module 1.4 secs to initialise
			{
				VoiceState = V_WAIT_START_BUSY_OFF ;
			}
			PORTB &= ~(1<<OUT_B_LIGHT) ;			// Latch clock low
		}
		else if ( VoiceState != V_CLOCKING )
		{
			uint8_t busy ;
			PORTA_LCD_DAT = VoiceLatch ;			// Latch data set
			PORTB |= (1<<OUT_B_LIGHT) ;				// Drive high,pullup enabled
			DDRB &= ~(1<<OUT_B_LIGHT) ;				// Change to input
			asm(" rjmp 1f") ;
			asm("1:") ;
			asm(" nop") ;											// delay to allow input to settle
			asm(" rjmp 1f") ;
			asm("1:") ;
			busy = PINB & 0x80 ;
			DDRB |= (1<<OUT_B_LIGHT) ;				// Change to output
			// The next bit guarantees the backlight output gets clocked out
			if ( VoiceState == V_WAIT_BUSY_ON )	// check for busy processing here
			{
				if ( busy == 0 )									// Busy is active
				{
					VoiceState = V_WAIT_BUSY_OFF ;
				}
				else
				{
					if ( --VoiceTimer == 0 )
					{
						VoiceState = V_WAIT_BUSY_OFF ;
					}
				}
			}
			else if (	VoiceState == V_WAIT_BUSY_OFF)	// check for busy processing here
			{
				if ( busy )									// Busy is inactive
				{
					VoiceTimer = 3 ;
					VoiceState = V_WAIT_BUSY_DELAY ;
				}
			}
			else if (	VoiceState == V_WAIT_BUSY_DELAY)
			{
				if ( --VoiceTimer == 0 )
				{
					VoiceState = V_IDLE ;
				}
			}
			else if (	VoiceState == V_WAIT_START_BUSY_OFF)	// check for busy processing here
			{
				if ( busy )									// Busy is inactive
				{
					VoiceTimer = 20 ;
					VoiceState = V_WAIT_BUSY_DELAY ;
				}
			}
			PORTB &= ~(1<<OUT_B_LIGHT) ;			// Latch clock low
		}
	}
	else// no voice, put backlight control out
	{
		if ( Backlight ^ g_eeGeneral.blightinv )
		{
			PORTB |= (1<<OUT_B_LIGHT) ;				// Drive high,pullup enabled
		}
		else
		{
			PORTB &= ~(1<<OUT_B_LIGHT) ;			// Latch clock low
		}
	}
}

#if ROTARY		
void pollRotary()
{
	// Rotary Encoder polling
	PORTA = 0 ;			// No pullups
	DDRA = 0x1F ;		// Top 3 bits input
	asm(" rjmp 1f") ;
	asm("1:") ;
//	asm(" nop") ;
//	asm(" nop") ;
	uint8_t rotary ;
	rotary = PINA ;
	DDRA = 0xFF ;		// Back to all outputs
	rotary &= 0xE0 ;
	RotEncoder = rotary ;
	rotary &= 0xDF ;
	if ( rotary != RotPosition )
	{
		uint8_t x ;
		x = RotPosition & 0x40 ;
		x <<= 1 ;
		x ^= rotary & 0x80 ;
		if ( x )
		{
			RotCount -= 1 ;
		}
		else
		{
			RotCount += 1 ;
		}
		RotPosition = rotary ;
	}
}
#endif


void perMain()
{
    static uint16_t lastTMR;
		uint16_t t10ms ;
		t10ms = get_tmr10ms() ;
    tick10ms = t10ms != lastTMR;
    lastTMR = t10ms ;
    //    uint16_t time10ms ;
    //		time10ms = get_tmr10ms();
    //    tick10ms = (time10ms != lastTMR);
    //    lastTMR = time10ms;

    perOut(g_chans512, 0);
    if(!tick10ms) return; //make sure the rest happen only every 10ms.

		{
			struct t_timerg *tptr ;

			tptr = &TimerG ;
			FORCE_INDIRECT(tptr) ;

    	//  if ( Timer2_running )
    	if ( tptr->Timer2_running & 1)  // ignore throttle started flag
    	{
    	  if ( (tptr->Timer2_pre += 1 ) >= 100 )
    	  {
    	      tptr->Timer2_pre -= 100 ;
    	      tptr->s_timerVal[1] += 1 ;
    	  }
    	}
		}


    eeCheck();

		// Every 10mS update backlight output to external latch
		// Note: LcdLock not needed here as at tasking level

    lcd_clear();
    uint8_t evt=getEvent();
    evt = checkTrim(evt);

    doBackLightVoice(evt);

#ifndef NOPOTSCROLL
    static int16_t p1valprev;
		int16_t p1d ;

    p1d = (p1val-calibratedStick[6])/32;
    if(p1d) {
        p1d = (p1valprev-calibratedStick[6])/2;
        p1val = calibratedStick[6];
    }
    p1valprev = calibratedStick[6];
    if ( g_eeGeneral.disablePotScroll )
    {
        p1d = 0 ;
    }
		p1valdiff = p1d ;
#endif

		{
			int8_t x ;
			x = RotCount - LastRotaryValue ;
			if ( x == -1 )
			{
				x = 0 ;
			}
			Rotary_diff = ( x ) / 2 ;
			LastRotaryValue += Rotary_diff * 2 ;
		}

		if ( g_menuStack[g_menuStackPtr] == menuProc0)
		{
			if ( Rotary_diff )
			{
				int16_t x = RotaryControl ;
				x += Rotary_diff ;
				if ( x > 125 )
				{
					RotaryControl = 125 ;
				}
				else if ( x < -125 )
				{
					RotaryControl = -125 ;
				}
				else
				{
					RotaryControl = x ;					
				}
				Rotary_diff = 0 ;
			}
		}

#if GVARS
		for( uint8_t i = 0 ; i < MAX_GVARS ; i += 1 )
		{
			if ( g_model.gvars[i].gvsource )
			{
				if ( g_model.gvars[i].gvsource <= 4 )
				{
					g_model.gvars[i].gvar = *TrimPtr[ convert_mode_helper(g_model.gvars[i].gvsource) - 1 ] ;
				}
			  else if ( g_model.gvars[i].gvsource == 5 )	// REN
				{
					g_model.gvars[i].gvar = RotaryControl ;
				}
				else if ( g_model.gvars[i].gvsource <= 9 )	// Stick
				{
					g_model.gvars[i].gvar = limit( -125, calibratedStick[ convert_mode_helper(g_model.gvars[i].gvsource-5) - 1 ] / 8, 125 ) ;
				}
				else if ( g_model.gvars[i].gvsource <= 12 )	// Pot
				{
					g_model.gvars[i].gvar = limit( -125, calibratedStick[ (g_model.gvars[i].gvsource-6)] / 8, 125 ) ;
				}
			}
		}
#endif

		if ( AlertMessage )
		{
			almess( AlertMessage, ALERT_TYPE ) ;
      if(keyDown())
			{
				AlertMessage = 0 ;
			}
//    	if ( stickMoved )
//			{
//				AlertMessage = 0 ;
//			}
		}
		else
		{
			Tevent = evt ;
    	g_menuStack[g_menuStackPtr](evt);
		}
    refreshDiplay();
		{
			uint8_t pg ;
			pg = PORTG ;
    	if( (checkSlaveMode()) && (!g_eeGeneral.enablePpmsim))
			{
    	    pg &= ~(1<<OUT_G_SIM_CTL); // 0=ppm out
    	}else{
    	    pg |=  (1<<OUT_G_SIM_CTL); // 1=ppm-in
    	}
			PORTG = pg ;
		}

    switch( g_blinkTmr10ms & 0x1f ) { //alle 10ms*32

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
        ab = (uint16_t) ab / (g_eeGeneral.disableBG ? 240 : BandGap ) ;  // ab might be more than 32767
        g_vbat100mV = (ab + g_vbat100mV + 1) >> 1 ;  // Filter it a bit => more stable display

        static uint8_t s_batCheck;
        s_batCheck+=16 ;
        if((s_batCheck==0) && (g_vbat100mV<g_eeGeneral.vBatWarn) && (g_vbat100mV>49)){

            audioVoiceDefevent(AU_TX_BATTERY_LOW, V_BATTERY_LOW);
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


    stickMoved = 0; //reset this flag
}

int16_t g_ppmIns[8];
uint8_t ppmInState = 0; //0=unsync 1..8= wait for value i-1

#ifndef SIMU
#include <avr/interrupt.h>
#endif

//#include <avr/wdt.h>

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
int16_t BandGap = 240 ;

#ifndef SIMU
static uint16_t s_anaFilt[8];
uint16_t anaIn(uint8_t chan)
{
    //                     ana-in:   3 1 2 0 4 5 6 7
    //static prog_char APM crossAna[]={4,2,3,1,5,6,7,0}; // wenn schon Tabelle, dann muss sich auch lohnen
    const static prog_char APM crossAna[]={3,1,2,0,4,5,6,7};
    volatile uint16_t *p = &s_anaFilt[pgm_read_byte(crossAna+chan)];
    //  AutoLock autoLock;
    return  *p;
}


#define ADC_VREF_TYPE 0x40
//void getADC_filt()
//{
//    static uint16_t t_ana[2][8];
//    //	uint8_t thro_rev_chan = g_eeGeneral.throttleReversed ? THR_STICK : 10 ;  // 10 means don't reverse
//    for (uint8_t adc_input=0;adc_input<8;adc_input++){
//        ADMUX=adc_input|ADC_VREF_TYPE;
//        // Start the AD conversion
//        ADCSRA|=0x40;
//        // Do this while waiting
//        s_anaFilt[adc_input] = (s_anaFilt[adc_input]/2 + t_ana[1][adc_input]) & 0xFFFE; //gain of 2 on last conversion - clear last bit
//        //t_ana[2][adc_input]  =  (t_ana[2][adc_input]  + t_ana[1][adc_input]) >> 1;
//        t_ana[1][adc_input]  = (t_ana[1][adc_input]  + t_ana[0][adc_input]) >> 1;

//        // Now wait for the AD conversion to complete
//        while ((ADCSRA & 0x10)==0);
//        ADCSRA|=0x10;

//        uint16_t v = ADCW;
//        //      if(adc_input == thro_rev_chan) v = 1024 - v;
//        t_ana[0][adc_input]  = (t_ana[0][adc_input]  + v) >> 1;
//    }
//}
/*
  s_anaFilt[chan] = (s_anaFilt[chan] + sss_ana[chan]) >> 1;
  sss_ana[chan] = (sss_ana[chan] + ss_ana[chan]) >> 1;
  ss_ana[chan] = (ss_ana[chan] + s_ana[chan]) >> 1;
  s_ana[chan] = (ADC + s_ana[chan]) >> 1;
  */

static void getADC_osmp()
{
    //  uint16_t temp_ana[8] = {0};
    uint16_t temp_ana ;
    //	uint8_t thro_rev_chan = g_eeGeneral.throttleReversed ? THR_STICK : 10 ;  // 10 means don't reverse
    for (uint8_t adc_input=0;adc_input<8;adc_input++){
//        temp_ana = 0 ;
//        for (uint8_t i=0; i<2;i++) {  // Going from 10bits to 11 bits.  Addition = n.  Loop 2 times
            ADMUX=adc_input|ADC_VREF_TYPE;
            // Start the AD conversion
            ADCSRA|=0x40;
            // Wait for the AD conversion to complete
            while (ADCSRA & 0x40);
//            ADCSRA|=0x10;
            //      temp_ana[adc_input] += ADCW;
            temp_ana = ADCW;
            ADCSRA|=0x40;
            // Wait for the AD conversion to complete
            while (ADCSRA & 0x40);
//        }

//        temp_ana /= 2; // divide by 2^n to normalize result.
        //    if(adc_input == thro_rev_chan)
        //        temp_ana = 2048 -temp_ana;

        //		s_anaFilt[adc_input] = temp_ana[adc_input] / 2; // divide by 2^n to normalize result.
        s_anaFilt[adc_input] = temp_ana + ADCW ;

        //    if(IS_THROTTLE(adc_input) && g_eeGeneral.throttleReversed)
        //        s_anaFilt[adc_input] = 2048 - s_anaFilt[adc_input];
    }
}


//void getADC_single()
//{
//    uint16_t result ;
//    //	  uint8_t thro_rev_chan = g_eeGeneral.throttleReversed ? THR_STICK : 10 ;  // 10 means don't reverse
//    for (uint8_t adc_input=0;adc_input<8;adc_input++){
//        ADMUX=adc_input|ADC_VREF_TYPE;
//        // Start the AD conversion
//        ADCSRA|=0x40;
//        // Wait for the AD conversion to complete
//        while ((ADCSRA & 0x10)==0);
//        ADCSRA|=0x10;
//        result = ADCW * 2; // use 11 bit numbers

//        //      if(adc_input == thro_rev_chan)
//        //          result = 2048 - result ;
//        s_anaFilt[adc_input] = result ; // use 11 bit numbers
//    }
//}

static void getADC_bandgap()
{
    ADMUX=0x1E|ADC_VREF_TYPE;
    // Start the AD conversion
    //  ADCSRA|=0x40;
    // Wait for the AD conversion to complete
    //  while ((ADCSRA & 0x10)==0);
    //  ADCSRA|=0x10;
    // Do it twice, first conversion may be wrong
    ADCSRA|=0x40;
    // Wait for the AD conversion to complete
    while ((ADCSRA & 0x10)==0);
    ADCSRA|=0x10;
    BandGap = (BandGap * 7 + ADCW + 4 ) >> 3 ;
    //  if(BandGap<256)
    //      BandGap = 256;
}

//getADCp getADC[3] = {
//  getADC_single,
//  getADC_osmp,
//  getADC_filt
//  };
#endif

volatile uint8_t g_tmr16KHz;

#ifndef SIMU
ISR(TIMER0_OVF_vect, ISR_NOBLOCK) //continuous timer 16ms (16MHz/1024)
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


// Clocks every 64 uS
ISR(TIMER0_COMP_vect, ISR_NOBLOCK) //10ms timer
{ 
    cli();
    TIMSK &= ~(1<<OCIE0); //stop reentrance
    sei();


    OCR0 += 2;			// Interrupt every 128 uS

  
  AUDIO_DRIVER();  // the tone generator
	// Now handle the Voice output
	// Check for LcdLocked (in interrupt), and voice_enabled
	if ( g_eeGeneral.speakerMode & 2 )
	{
		if ( LcdLock == 0 )		// LCD not in use
		{
			struct t_voice *vptr ;
			vptr = &Voice ;
			FORCE_INDIRECT(vptr) ;
			if ( vptr->VoiceState == V_CLOCKING )
			{
				if ( vptr->VoiceTimer )
				{
					vptr->VoiceTimer -= 1 ;
				}
				else
				{
					PORTB |= (1<<OUT_B_LIGHT) ;				// Latch clock high
					if ( ( vptr->VoiceCounter & 1 ) == 0 )
					{
						vptr->VoiceLatch &= ~VOICE_DATA_BIT ;
						if ( vptr->VoiceSerial & 0x4000 )
						{
							vptr->VoiceLatch |= VOICE_DATA_BIT ;
						}
						vptr->VoiceSerial <<= 1 ;
					}
					vptr->VoiceLatch ^= VOICE_CLOCK_BIT ;
					PORTA_LCD_DAT = vptr->VoiceLatch ;			// Latch data set
					PORTB &= ~(1<<OUT_B_LIGHT) ;			// Latch clock low
					if ( --vptr->VoiceCounter == 0 )
					{
						vptr->VoiceState = V_WAIT_BUSY_ON ;
						vptr->VoiceTimer = 5 ;		// 50 mS
					}
				}
			}
		}
	}


  static uint8_t cnt10ms = 77; // execute 10ms code once every 78 ISRs
  if (cnt10ms-- == 0) { // BEGIN { ... every 10ms ... }
    // Begin 10ms event
    cnt10ms = 77;

		AUDIO_HEARTBEAT();  // the queue processing

        per10ms();
#ifdef FRSKY
		check_frsky() ;
#endif
        heartbeat |= HEART_TIMER10ms;
	// See if time for alarm checking
		if (--AlarmTimer == 0 )
		{
			AlarmTimer = 100 ;		// Restart timer
			AlarmCheckFlag += 1 ;	// Flag time to check alarms
			CsCheckFlag = 1 ;
		}
		if (--VoiceFtimer == 0 )
		{
			VoiceFtimer = 10 ;		// Restart timer
			VoiceCheckFlag = 1 ;	// Flag time to check alarms
		}

  } // end 10ms event

  cli();
  TIMSK |= (1<<OCIE0);
  sei();
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
  	if (val>4000 && val < 16000) // G: Prioritize reset pulse. (Needed when less than 8 incoming pulses)
  	  ppmInState = 1; // triggered
  	else
  	{
  		if(ppmInState && ppmInState<=8)
			{
  	  	if(val>800 && val<2200)
				{
  		    g_ppmIns[ppmInState++ - 1] =
  	  	    (int16_t)(val - 1500)*(g_eeGeneral.PPM_Multiplier+10)/10; //+-500 != 512, but close enough.

		    }else{
  		    ppmInState=0; // not triggered
  	  	}
  	  }
  	}

    cli();
    ETIMSK |= (1<<TICIE3);
    sei();
}

extern uint16_t g_timeMain;
//void main(void) __attribute__((noreturn));

#if STACK_TRACE
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
#endif





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

//		PORTB |= (1<<OUT_B_LIGHT) ;				// Latch clock high
//		PORTA_LCD_DAT = 0 ; // VOICE_CLOCK_BIT ;			// Latch data set
//		Voice.VoiceLatch = 0 ; // VOICE_CLOCK_BIT ;
//		PORTB &= ~(1<<OUT_B_LIGHT) ;			// Latch clock low

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


#if STACK_TRACE
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
#endif

    sei(); //damit alert in eeReadGeneral() nicht haengt
    g_menuStack[0] =  menuProc0;

    lcdSetRefVolt(25);
    eeReadAll();
    uint8_t cModel = g_eeGeneral.currModel;
    checkQuickSelect();

		lcdSetContrast() ;
//    if(g_eeGeneral.lightSw || g_eeGeneral.lightAutoOff || g_eeGeneral.lightOnStickMove) // if lightswitch is defined or auto off
//        BACKLIGHT_ON;
//    else
//        BACKLIGHT_OFF;

    //we assume that startup is like pressing a switch and moving sticks.  Hence the lightcounter is set
    //if we have a switch on backlight it will be able to turn on the backlight.

		uint8_t loc ;
    loc = g_eeGeneral.lightOnStickMove ;
    if(g_eeGeneral.lightAutoOff > g_eeGeneral.lightOnStickMove)
      loc = g_eeGeneral.lightAutoOff ;
    
		g_LightOffCounter = (loc*250)<<1;

    check_backlight_voice();

    // moved here and logic added to only play statup tone if splash screen enabled.
    // that way we save a bit, but keep the option for end users!
		putVoiceQueueLong( g_eeGeneral.volume + 0xFFF7 ) ;
    if(!g_eeGeneral.disableSplashScreen)
    {
	    if( g_eeGeneral.speakerMode )		// Not just beeper
			{
				audioVoiceDefevent( AU_TADA, V_HELLO ) ;
      }
  	  doSplash();
    }
    checkMem();
    //setupAdc(); //before checkTHR
    getADC_osmp();
    checkTHR();
    checkSwitches();
    checkAlarm();
    checkWarnings();
    clearKeyEvents(); //make sure no keys are down before proceeding

    BandGap = 240 ;
		putVoiceQueueUpper( g_model.modelVoice ) ;
    setupPulses();
    wdt_enable(WDTO_500MS);
    perOut(g_chans512, 0);

//    pushMenu(menuProcModelSelect);
//    popMenu(true);  
    g_menuStack[1] = menuProcModelSelect ;	// this is so the first instance of [MENU LONG] doesn't freak out!

		lcdSetContrast() ;

    if(cModel!=g_eeGeneral.currModel)
    {
        STORE_GENERALVARS ;    // if model was quick-selected, make sure it sticks
        //    eeDirty(EE_GENERAL); // if model was quick-selected, make sure it sticks
        eeWaitComplete() ;
    }
#ifdef FRSKY
    FrskyAlarmSendState |= 0x40 ;
#endif

    // This bit depends on protocol
    OCR1A = 2000 ;        // set to 1mS
    TIFR = 1 << OCF1A ;   // Clear pending interrupt

		Main_running = 1 ;
    PULSEGEN_ON; // Pulse generator enable immediately before mainloop
    while(1){
        //uint16_t old10ms=get_tmr10ms();
        mainSequence() ;
    }
}

#ifdef FRSKY
extern int16_t AltOffset ;
#endif


void mainSequence()
{
    uint16_t t0 = getTmr16KHz();
		uint8_t numSafety = 16 - g_model.numVoice ;
    //      getADC[g_eeGeneral.filterInput]();
//    if ( g_eeGeneral.filterInput == 1)
//    {
//        getADC_filt() ;
//    }
//    else if ( g_eeGeneral.filterInput == 2)
//    {
        getADC_osmp() ;
//    }
//    else
//    {
//        getADC_single() ;
//    }
    ADMUX=0x1E|ADC_VREF_TYPE;   // Select bandgap
		pollRotary() ;
    perMain();      // Give bandgap plenty of time to settle
    getADC_bandgap() ;
    //while(get_tmr10ms()==old10ms) sleep_mode();
    if(heartbeat == 0x3)
    {
        wdt_reset();
        heartbeat = 0;
    }
    t0 = getTmr16KHz() - t0;
    if ( t0 > g_timeMain ) g_timeMain = t0 ;
    if ( AlarmCheckFlag > 1 )
    {
        AlarmCheckFlag = 0 ;
        // Check for alarms here
        // Including Altitude limit
//				Debug3 = 1 ;

#ifdef FRSKY
        if (frskyUsrStreaming)
        {
            int16_t limit = g_model.FrSkyAltAlarm ;
            int16_t altitude ;
            if ( limit )
            {
                if (limit == 2)  // 400
                {
                    limit = 400 ;	//ft
                }
                else
                {
                    limit = 122 ;	//m
                }
								altitude = FrskyHubData[FR_ALT_BARO] + AltOffset ;
								if (g_model.FrSkyUsrProto == 0)  // Hub
								{
      						if ( g_model.FrSkyImperial )
									{
        						altitude = m_to_ft( altitude ) ;
									}
								}
                if ( altitude > limit )
                {
                    audioDefevent(AU_WARNING2) ;
                }
            }
						uint16_t total_volts = 0 ;
						uint8_t audio_sounded = 0 ;
						uint8_t low_cell = 220 ;		// 4.4V
				    for (uint8_t k=0; k<FrskyBattCells; k++)
						{
							total_volts += FrskyVolts[k] ;
							if ( FrskyVolts[k] < low_cell )
							{
								low_cell = FrskyVolts[k] ;
							}

							if ( audio_sounded == 0 )
							{
	        			if ( FrskyVolts[k] < g_model.frSkyVoltThreshold )
								{
	            		audioDefevent(AU_WARNING3);
									audio_sounded = 1 ;
			        	}
							}
	  			  }
						// Now we have total volts available
						FrskyHubData[FR_CELLS_TOT] = total_volts / 5 ;
						if ( low_cell < 220 )
						{
							FrskyHubData[FR_CELL_MIN] = low_cell ;
						}

        }


        // this var prevents and alarm sounding if an earlier alarm is already sounding
        // firing two alarms at once is pointless and sounds rubbish!
        // this also means channel A alarms always over ride same level alarms on channel B
        // up to debate if this is correct!
        //				bool AlarmRaisedAlready = false;

        if (frskyStreaming)
				{
//            enum AlarmLevel level[4] ;
//            // RED ALERTS
//            if( (level[0]=FRSKY_alarmRaised(0,0)) == alarm_red) FRSKY_alarmPlay(0,0);
//            else if( (level[1]=FRSKY_alarmRaised(0,1)) == alarm_red) FRSKY_alarmPlay(0,1);
//            else	if( (level[2]=FRSKY_alarmRaised(1,0)) == alarm_red) FRSKY_alarmPlay(1,0);
//            else if( (level[3]=FRSKY_alarmRaised(1,1)) == alarm_red) FRSKY_alarmPlay(1,1);
//            // ORANGE ALERTS
//            else	if( level[0] == alarm_orange) FRSKY_alarmPlay(0,0);
//            else if( level[1] == alarm_orange) FRSKY_alarmPlay(0,1);
//            else	if( level[2] == alarm_orange) FRSKY_alarmPlay(1,0);
//            else if( level[3] == alarm_orange) FRSKY_alarmPlay(1,1);
//            // YELLOW ALERTS
//            else	if( level[0] == alarm_yellow) FRSKY_alarmPlay(0,0);
//            else if( level[1] == alarm_yellow) FRSKY_alarmPlay(0,1);
//            else	if( level[2] == alarm_yellow) FRSKY_alarmPlay(1,0);
//            else if( level[3] == alarm_yellow) FRSKY_alarmPlay(1,1);

						// Check for current alarm
        		for (int i=0; i<2; i++)
						{
							// To be enhanced by checking the type as well
       		    if (g_model.frsky.channels[i].ratio)
							{
     		        if ( g_model.frsky.channels[i].type == 3 )		// Current (A)
								{
									if ( g_model.frsky.alarmData[0].frskyAlarmLimit )
									{
    		          	if ( (  FrskyHubData[FR_A1_MAH+i] >> 6 ) >= g_model.frsky.alarmData[0].frskyAlarmLimit )
										{
											if ( g_eeGeneral.speakerMode & 2 )
											{
												putVoiceQueue( V_CAPACITY ) ;
											}
											else
											{
												audio.event( g_model.frsky.alarmData[0].frskyAlarmSound ) ;
											}
										}
									}
								}
       		    }
        		}
        }
#endif

				// Now for the Safety/alarm switch alarms
				{
					uint8_t i ;
					static uint8_t periodCounter ;
					
					periodCounter += 0x11 ;
					periodCounter &= 0xF7 ;
					if ( periodCounter > 0x5F )
					{
						periodCounter &= 0x0F ;
					}
					for ( i = 0 ; i < numSafety ; i += 1 )
					{
    				SafetySwData *sd = &g_model.safetySw[i] ;
						if (sd->opt.ss.mode == 1)
						{
							if(getSwitch( sd->opt.ss.swtch,0))
							{
								audio.event( ((g_eeGeneral.speakerMode & 1) == 0) ? 1 : sd->opt.ss.val ) ;
							}
						}
						if (sd->opt.ss.mode == 2)
						{
							if ( sd->opt.ss.swtch > MAX_DRSWITCH )
							{
								switch ( sd->opt.ss.swtch - MAX_DRSWITCH -1 )
								{
									case 0 :
										if ( ( periodCounter & 3 ) == 0 )
										{
											voice_telem_item( sd->opt.ss.val ) ;
										}
									break ;
									case 1 :
										if ( ( periodCounter & 0xF0 ) == 0 )
										{
											voice_telem_item( sd->opt.ss.val ) ;
										}
									break ;
									case 2 :
										if ( ( periodCounter & 7 ) == 2 )
										{
											voice_telem_item( sd->opt.ss.val ) ;
										}
									break ;
								}
							}
							else if ( ( periodCounter & 1 ) == 0 )		// Every 4 seconds
							{
								if(getSwitch( sd->opt.ss.swtch,0))
								{
									putVoiceQueue( sd->opt.ss.val + 128 ) ;
								}
							}
						}
					}
				}
    }
	// New switch voices
	// New entries, Switch, (on/off/both), voice file index

  if ( VoiceCheckFlag )		// Every 100 mS
  {
		uint8_t i ;
		static uint16_t timer ;
    
		timer += 1 ;

		for ( i = numSafety ; i < NUM_CHNOUT ; i += 1 )
		{
			uint8_t curent_state ;
			uint8_t mode ;
    	SafetySwData *sd = &g_model.safetySw[i];

			mode = sd->opt.vs.vmode ;
			if ( sd->opt.vs.vswtch )		// Configured
			{
				curent_state = getSwitch( sd->opt.vs.vswtch, 0 ) ;
				if ( VoiceCheckFlag != 2 )
				{
					if ( ( mode == 0 ) || ( mode == 2 ) )
					{ // ON
						if ( ( Vs_state[i] == 0 ) && curent_state )
						{
							putVoiceQueue( sd->opt.vs.vval ) ;
						}
					}
					if ( ( mode == 1 ) || ( mode == 2 ) )
					{ // OFF
						if ( ( Vs_state[i] == 1 ) && !curent_state )
						{
							uint8_t x ;
							x = sd->opt.vs.vval ;
							if ( mode == 2 )
							{
								x += 1 ;							
							}
							putVoiceQueue( x ) ;
						}
					}
					if ( mode > 5 )
					{
						if ( ( Vs_state[i] == 0 ) && curent_state )
						{
							voice_telem_item( sd->opt.vs.vval ) ;
						}					
					}
					else if ( mode > 2 )
					{ // 15, 30 or 60 secs
						if ( curent_state )
						{
							uint16_t mask ;
							mask = 150 ;
							if ( mode == 4 ) mask = 300 ;
							if ( mode == 5 ) mask = 600 ;
							if ( timer % mask == 0 )
							{
								putVoiceQueue( sd->opt.vs.vval ) ;
							}
						}
					}
				}
				Vs_state[i] = curent_state ;
			}
		}
		VoiceCheckFlag = 0 ;
	}
	if ( CsCheckFlag )		// Custom Switch Timers
	{
		CsCheckFlag = 0 ;
		uint8_t i ;
		
		for ( i = 0 ; i < NUM_CSW ; i += 1 )
		{
    	CSwData &cs = g_model.customSw[i];
    	uint8_t cstate = CS_STATE(cs.func);

    	if(cstate == CS_TIMER)
			{
				if ( CsTimer[i] == 0 )
				{
					CsTimer[i] = -cs.v1-1 ;
				}
				else if ( CsTimer[i] < 0 )
				{
					if ( ++CsTimer[i] == 0 )
					{
						CsTimer[i] = cs.v2 ;
					}
				}
				else  // if ( CsTimer[i] > 0 )
				{
					CsTimer[i] -= 1 ;
				}
				if ( cs.andsw )
				{
					int8_t x ;
					x = cs.andsw ;
					if ( x > 8 )
					{
						x += 1 ;
					}
	        if (getSwitch( x, 0, 0) == 0 )
				  {
						CsTimer[i] = -1 ;
					}	
				}
			}
		}
	}
}
#endif


int16_t calc1000toRESX(int16_t x)  // improve calc time by Pat MacKenzie
{
    int16_t y = x>>5;
    x+=y;
    y=y>>2;
    x-=y;
    return x+(y>>2);
    //  return x + x/32 - x/128 + x/512;
}

#if GVARS
int8_t REG100_100(int8_t x)
{
	return REG( x, -100, 100 ) ;
}

int8_t REG(int8_t x, int8_t min, int8_t max)
{
  int8_t result = x;
  if (x >= 126 || x <= -126) {
    x = (uint8_t)x - 126;
    result = g_model.gvars[x].gvar ;
    if (result < min) {
      g_model.gvars[x].gvar = result = min;
//      eeDirty( EE_MODEL | EE_TRIM ) ;
    }
    if (result > max) {
      g_model.gvars[x].gvar = result = max;
//      eeDirty( EE_MODEL | EE_TRIM ) ;
    }
  }
  return result;
}
#endif


uint8_t IS_THROTTLE( uint8_t x )
{
	return (((2-(g_eeGeneral.stickMode&1)) == x) && (x<4)) ;
}




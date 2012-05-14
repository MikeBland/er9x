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

#include "splashmarker.h"
const
#include "s9xsplash.lbm"

/*
mode1 rud ele thr ail
mode2 rud thr ele ail
mode3 ail ele thr rud
mode4 ail thr ele rud
*/


extern int16_t AltOffset ;

EEGeneral  g_eeGeneral;
ModelData  g_model;

uint8_t SlaveMode ;

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

uint8_t AlarmTimer = 200 ;		// Units of 10 mS
uint8_t AlarmCheckFlag = 0 ;

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
    lcd_outdezNAtt(x/*+ ((att&DBLSIZE) ? 2 : 0)*/, y, tme/60, LEADING0|att,2);
    x += (att&DBLSIZE) ? FWNUM*6-4 : FW*3-3;
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
        lcd_putsnAtt(x,y,&modi12x3[(pgm_read_byte(modn12x3+g_eeGeneral.stickMode*4+(idx-1))-1)*4],4,att);
//        lcd_putsnAtt(x,y,modi12x3+g_eeGeneral.stickMode*16+4*(idx-1),4,att);
    else if(idx<=NUM_XCHNRAW)
        lcd_putsAttIdx(x,y,PSTR("\004P1  P2  P3  HALFFULLCYC1CYC2CYC3PPM1PPM2PPM3PPM4PPM5PPM6PPM7PPM8CH1 CH2 CH3 CH4 CH5 CH6 CH7 CH8 CH9 CH10CH11CH12CH13CH14CH15CH16"),(idx-5),att);
#ifdef FRSKY
    else
        lcd_putsAttIdx(x,y,Str_telemItems,(idx-NUM_XCHNRAW-1),att);
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
    lcd_putcAtt(x,y, idx1<0 ? '!' : ' ',att);
    lcd_putsnAtt(x+FW,y,get_switches_string()+3*(abs(idx1)-1),3,att);
}

const prog_char *get_switches_string()
{
    return PSTR(SWITCHES_STR)	;
}	

void putsTmrMode(uint8_t x, uint8_t y, uint8_t attr, uint8_t type )
{
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
    	putsDrSwitches( x-1*FW,y,tm>0 ? tm-(TMR_VAROFS+MAX_DRSWITCH-1-1) : tm+(TMR_VAROFS+MAX_DRSWITCH-1-1),attr);//momentary on-off
    	lcd_putcAtt(x+3*FW,  y,'m',attr);
		}
	}
	if ( ( type == 2 ) || ( ( type == 0 ) && ( tm == 1 ) ) )
	{
   	putsDrSwitches( x-1*FW, y, g_model.tmrModeB, attr );
	}
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
  	if (g_model.frsky.channels[channel].type == 3/*A*/)
        {
            value /= 100 ;
            att |= PREC1 ;
        }
        else if ( ratio < 100 )
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
  	if (g_model.frsky.channels[channel].type == 3/*A*/)
        {
            value *= 255 ;
            value /= 100 ;
            att |= PREC1 ;
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
		    if (g_model.frsky.channels[channel].type == 3/*A*/)
				{
        	if(!(att&NO_UNIT)) lcd_putcAtt(lcd_lastPos, y, 'A', att);
				}
    }
}


#endif

inline int16_t getValue(uint8_t i)
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
			else
			{
				return s_timerVal[j+2] ;
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

    // init values only if needed
    uint8_t s = CS_STATE(cs.func);

    if(s == CS_VOFS)
    {
        x = getValue(cs.v1-1);
#ifdef FRSKY
        if (cs.v1 > CHOUT_BASE+NUM_CHNOUT)
          y = convertTelemConstant( cs.v1-CHOUT_BASE-NUM_CHNOUT-1, cs.v2 ) ;
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
    default:
        ret_value = false;
        break;
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

void clearKeyEvents()
{
    while(keyDown());  // loop until all keys are up
    putEvent(0);
}

void check_backlight()
{
    if(getSwitch(g_eeGeneral.lightSw,0) || g_LightOffCounter)
        BACKLIGHT_ON;
    else
        BACKLIGHT_OFF;
}

uint16_t stickMoveValue()
{
#define INAC_DEVISOR 256   // Issue 206 - bypass splash screen with stick movement
    uint16_t sum = 0;
    for(uint8_t i=0; i<4; i++)
        sum += anaIn(i)/INAC_DEVISOR;
    return sum ;
}

void doSplash()
{
    if(!g_eeGeneral.disableSplashScreen)
    {


        check_backlight() ;

        lcd_clear();
        lcd_img(0, 0, s9xsplash,0,0);
        if(!g_eeGeneral.hideNameOnSplash)
            lcd_putsnAtt(0*FW, 7*FH, g_eeGeneral.ownerName ,sizeof(g_eeGeneral.ownerName),BSS);

        refreshDiplay();
        lcdSetRefVolt(g_eeGeneral.contrast);

        clearKeyEvents();

        for(uint8_t i=0; i<32; i++)
            getADC_filt(); // init ADC array

        uint16_t inacSum = stickMoveValue();
        //        for(uint8_t i=0; i<4; i++)
        //           inacSum += anaIn(i)/INAC_DEVISOR;

        uint16_t tgtime = get_tmr10ms() + SPLASH_TIMEOUT;  
        while(tgtime != get_tmr10ms())
        {
            getADC_filt();
            uint16_t tsum = stickMoveValue();
            //            for(uint8_t i=0; i<4; i++)
            //               tsum += anaIn(i)/INAC_DEVISOR;

            if(keyDown() || (tsum!=inacSum))   return;  //wait for key release

            check_backlight() ;
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
    lcd_puts_Pleft(4*FH,s);
    lcd_puts_Pleft(5*FH,t);
    lcd_puts_Pleft(6*FH,  PSTR("Press any key to skip") ) ;
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

        check_backlight() ;
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

void putWarnSwitch( uint8_t x, uint8_t idx )
{
  lcd_putsnAtt( x, 2*FH, get_switches_string() + idx, 3, 0) ;
}

void checkSwitches()
{
    if(g_eeGeneral.disableSwitchWarning) return; // if warning is on

    // first - display warning
    alertMessages( PSTR("Switch Warning"), PSTR("Please Reset Switches") ) ;
//    for(uint8_t i=0;i<8;i++) lcd_putsnAtt((5+i)*FW, 3*FH, PSTR("TRE012AG")+i,1,  ((g_eeGeneral.switchWarningStates & (1<<i)) ? INVERS : 0 ) );
//    refreshDiplay();

    uint8_t x = g_eeGeneral.switchWarningStates & SWP_IL5;
//    if(x==SWP_IL1 || x==SWP_IL2 || x==SWP_IL3 || x==SWP_IL4 || x==SWP_IL5) //illegal states for ID0/1/2
    if(!(x==SWP_LEG1 || x==SWP_LEG2 || x==SWP_LEG3)) //legal states for ID0/1/2
    {
        g_eeGeneral.switchWarningStates &= ~SWP_IL5; // turn all off, make sure only one is on
        g_eeGeneral.switchWarningStates |=  SWP_ID0B;
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
        uint8_t x = i ^ g_eeGeneral.switchWarningStates;

        lcd_putsnAtt(0*FW, 2*FH, PSTR("                      "), 22, 0);

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
            if(i & SWP_ID1B)
                putWarnSwitch(2 + 10*FW + FW/2, 12 );
            if(i & SWP_ID2B)
                putWarnSwitch(2 + 10*FW + FW/2, 15 );
        }

        if(x & SWP_AILB)
            putWarnSwitch(2 + 14*FW, 18 );
        if(x & SWP_GEAB)
            putWarnSwitch(2 + 17*FW + FW/2, 21 );


        refreshDiplay();


        if((i==g_eeGeneral.switchWarningStates) || (keyDown())) // check state against settings
        {
            return;  //wait for key release
        }

        check_backlight() ;
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
        clearKeyEvents(); // wait for user to release key
    }
}

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
  lcdSetRefVolt(g_eeGeneral.contrast);
}

void alert(const prog_char * s, bool defaults)
{
	almess( s, ALERT_TYPE ) ;
  lcdSetRefVolt(defaults ? 25 : g_eeGeneral.contrast);

    audioDefevent(AU_ERROR);
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
            pauseEvents(event);

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

NOINLINE int8_t checkIncDec(uint8_t event, int8_t i_val, int8_t i_min, int8_t i_max, uint8_t i_flags)
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


uint8_t Timer2_running = 0 ;
uint8_t Timer2_pre = 0 ;
//uint16_t Timer2 = 0 ;

void resetTimer2()
{
    Timer2_pre = 0 ;
    s_timerVal[1] = 0 ;
    Timer2_running = 0 ;   // Stop and clear throttle started flag
}

void doBackLight(uint8_t evt)
{
    uint16_t a = 0;
    uint16_t b = 0;
    uint16_t lightoffctr ;
		lightoffctr = g_LightOffCounter ;

    if(lightoffctr) lightoffctr--;
    if(evt) a = g_eeGeneral.lightAutoOff*500; // on keypress turn the light on 5*100
    if(stickMoved) b = g_eeGeneral.lightOnStickMove*500;
    if(a>lightoffctr) lightoffctr = a;
    if(b>lightoffctr) lightoffctr = b;
		g_LightOffCounter = lightoffctr ;
    check_backlight();
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
            s_timerVal[1] += 1 ;
        }
    }

    eeCheck();

    lcd_clear();
    uint8_t evt=getEvent();
    evt = checkTrim(evt);

    doBackLight(evt);

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
    if( (checkSlaveMode()) && (!g_eeGeneral.enablePpmsim))
		{
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
        ab = (uint16_t) ab / (g_eeGeneral.disableBG ? 240 : BandGap ) ;  // ab might be more than 32767
        g_vbat100mV = (ab + g_vbat100mV + 1) >> 1 ;  // Filter it a bit => more stable display

        static uint8_t s_batCheck;
        s_batCheck+=32;
        if((s_batCheck==0) && (g_vbat100mV<g_eeGeneral.vBatWarn) && (g_vbat100mV>49)){

            audioDefevent(AU_TX_BATTERY_LOW);
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

#include <avr/interrupt.h>
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
void getADC_filt()
{
    static uint16_t t_ana[2][8];
    //	uint8_t thro_rev_chan = g_eeGeneral.throttleReversed ? THR_STICK : 10 ;  // 10 means don't reverse
    for (uint8_t adc_input=0;adc_input<8;adc_input++){
        ADMUX=adc_input|ADC_VREF_TYPE;
        // Start the AD conversion
        ADCSRA|=0x40;
        // Do this while waiting
        s_anaFilt[adc_input] = (s_anaFilt[adc_input]/2 + t_ana[1][adc_input]) & 0xFFFE; //gain of 2 on last conversion - clear last bit
        //t_ana[2][adc_input]  =  (t_ana[2][adc_input]  + t_ana[1][adc_input]) >> 1;
        t_ana[1][adc_input]  = (t_ana[1][adc_input]  + t_ana[0][adc_input]) >> 1;

        // Now wait for the AD conversion to complete
        while ((ADCSRA & 0x10)==0);
        ADCSRA|=0x10;

        uint16_t v = ADCW;
        //      if(adc_input == thro_rev_chan) v = 1024 - v;
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
    //  uint16_t temp_ana[8] = {0};
    uint16_t temp_ana ;
    //	uint8_t thro_rev_chan = g_eeGeneral.throttleReversed ? THR_STICK : 10 ;  // 10 means don't reverse
    for (uint8_t adc_input=0;adc_input<8;adc_input++){
        temp_ana = 0 ;
        for (uint8_t i=0; i<4;i++) {  // Going from 10bits to 11 bits.  Addition = n.  Loop 4^n times
            ADMUX=adc_input|ADC_VREF_TYPE;
            // Start the AD conversion
            ADCSRA|=0x40;
            // Wait for the AD conversion to complete
            while ((ADCSRA & 0x10)==0);
            ADCSRA|=0x10;
            //      temp_ana[adc_input] += ADCW;
            temp_ana += ADCW;
        }

        temp_ana /= 2; // divide by 2^n to normalize result.
        //    if(adc_input == thro_rev_chan)
        //        temp_ana = 2048 -temp_ana;

        //		s_anaFilt[adc_input] = temp_ana[adc_input] / 2; // divide by 2^n to normalize result.
        s_anaFilt[adc_input] = temp_ana ;

        //    if(IS_THROTTLE(adc_input) && g_eeGeneral.throttleReversed)
        //        s_anaFilt[adc_input] = 2048 - s_anaFilt[adc_input];
    }
}


void getADC_single()
{
    uint16_t result ;
    //	  uint8_t thro_rev_chan = g_eeGeneral.throttleReversed ? THR_STICK : 10 ;  // 10 means don't reverse
    for (uint8_t adc_input=0;adc_input<8;adc_input++){
        ADMUX=adc_input|ADC_VREF_TYPE;
        // Start the AD conversion
        ADCSRA|=0x40;
        // Wait for the AD conversion to complete
        while ((ADCSRA & 0x10)==0);
        ADCSRA|=0x10;
        result = ADCW * 2; // use 11 bit numbers

        //      if(adc_input == thro_rev_chan)
        //          result = 2048 - result ;
        s_anaFilt[adc_input] = result ; // use 11 bit numbers
    }
}

void getADC_bandgap()
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

volatile uint8_t g_tmr16KHz;

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


ISR(TIMER0_COMP_vect, ISR_NOBLOCK) //10ms timer
{ 
    cli();
    TIMSK &= ~(1<<OCIE0); //stop reentrance
    sei();


    OCR0 += 2;

  
  AUDIO_DRIVER();  // the tone generator

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
			AlarmTimer = 200 ;		// Restart timer
			AlarmCheckFlag = 1 ;	// Flag time to check alarms
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
    sei();
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

    lcdSetRefVolt(g_eeGeneral.contrast);
//    if(g_eeGeneral.lightSw || g_eeGeneral.lightAutoOff || g_eeGeneral.lightOnStickMove) // if lightswitch is defined or auto off
//        BACKLIGHT_ON;
//    else
//        BACKLIGHT_OFF;

    //we assume that startup is like pressing a switch and moving sticks.  Hence the lightcounter is set
    //if we have a switch on backlight it will be able to turn on the backlight.

    g_LightOffCounter = g_eeGeneral.lightOnStickMove ;
    if(g_eeGeneral.lightAutoOff > g_eeGeneral.lightOnStickMove)
      g_LightOffCounter = g_eeGeneral.lightAutoOff ;
    g_LightOffCounter *= 500 ;
    check_backlight();

    // moved here and logic added to only play statup tone if splash screen enabled.
    // that way we save a bit, but keep the option for end users!
    if(g_eeGeneral.speakerMode == 1){
        if(!g_eeGeneral.disableSplashScreen)
        {
            audioDefevent(AU_TADA);
        }
    }
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

//    pushMenu(menuProcModelSelect);
//    popMenu(true);  
    g_menuStack[1] = menuProcModelSelect ;	// this is so the first instance of [MENU LONG] doesn't freak out!

    lcdSetRefVolt(g_eeGeneral.contrast);

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
    //      getADC[g_eeGeneral.filterInput]();
    if ( g_eeGeneral.filterInput == 1)
    {
        getADC_filt() ;
    }
    else if ( g_eeGeneral.filterInput == 2)
    {
        getADC_osmp() ;
    }
    else
    {
        getADC_single() ;
    }
    ADMUX=0x1E|ADC_VREF_TYPE;   // Select bandgap
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
    if ( AlarmCheckFlag )
    {
        AlarmCheckFlag = 0 ;
        // Check for alarms here
        // Including Altitude limit

#ifdef FRSKY
        if (frskyUsrStreaming)
        {
            int16_t limit = g_model.FrSkyAltAlarm ;
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
                if ( ( FrskyHubData[FR_ALT_BARO] + AltOffset ) > limit )
                {
                    audioDefevent(AU_WARNING2) ;
                }
            }
				    for (uint8_t k=0; k<FrskyBattCells; k++)
						{
	        		if ( FrskyVolts[k] < g_model.frSkyVoltThreshold )
							{
	            	audioDefevent(AU_WARNING3);
	            	break;
			        }
	  			  }

        }


        // this var prevents and alarm sounding if an earlier alarm is already sounding
        // firing two alarms at once is pointless and sounds rubbish!
        // this also means channel A alarms always over ride same level alarms on channel B
        // up to debate if this is correct!
        //				bool AlarmRaisedAlready = false;

        if (frskyStreaming)
				{
            enum AlarmLevel level[4] ;
            // RED ALERTS
            if( (level[0]=FRSKY_alarmRaised(0,0)) == alarm_red) FRSKY_alarmPlay(0,0);
            else if( (level[1]=FRSKY_alarmRaised(0,1)) == alarm_red) FRSKY_alarmPlay(0,1);
            else	if( (level[2]=FRSKY_alarmRaised(1,0)) == alarm_red) FRSKY_alarmPlay(1,0);
            else if( (level[3]=FRSKY_alarmRaised(1,1)) == alarm_red) FRSKY_alarmPlay(1,1);
            // ORANGE ALERTS
            else	if( level[0] == alarm_orange) FRSKY_alarmPlay(0,0);
            else if( level[1] == alarm_orange) FRSKY_alarmPlay(0,1);
            else	if( level[2] == alarm_orange) FRSKY_alarmPlay(1,0);
            else if( level[3] == alarm_orange) FRSKY_alarmPlay(1,1);
            // YELLOW ALERTS
            else	if( level[0] == alarm_yellow) FRSKY_alarmPlay(0,0);
            else if( level[1] == alarm_yellow) FRSKY_alarmPlay(0,1);
            else	if( level[2] == alarm_yellow) FRSKY_alarmPlay(1,0);
            else if( level[3] == alarm_yellow) FRSKY_alarmPlay(1,1);

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
											audio.event( g_model.frsky.alarmData[0].frskyAlarmSound ) ;
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
					for ( i = 0 ; i < NUM_CSW ; i += 1 )
					{
    				SafetySwData *sd = &g_model.safetySw[i] ;
						if (sd->mode == 1)
						{
							if(getSwitch( sd->swtch,0))
							{
								audio.event( (g_eeGeneral.speakerMode == 0) ? 1 : sd->val ) ;
							}
						}
					}
				}
    }
}



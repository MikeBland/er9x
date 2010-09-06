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

/*
mode1 rud ele thr ail
mode2 rud thr ele ail
mode3 ail ele thr rud
mode4 ail thr ele rud
*/



EEGeneral  g_eeGeneral;
ModelData  g_model;

bool warble = false;

const prog_char APM modi12x3[]=
  "RUD ELE THR AIL "
  "RUD THR ELE AIL "
  "AIL ELE THR RUD "
  "AIL THR ELE RUD ";


void putsTime(uint8_t x,uint8_t y,int16_t tme,uint8_t att,uint8_t att2)
{
  //uint8_t fw=FWNUM; //FW-1;
  //if(att&DBLSIZE) fw+=fw;

  lcd_putcAtt(   x,    y, tme<0 ?'-':' ',att);
  x += (att&DBLSIZE) ? FWNUM*5 : FWNUM*3+2;
  lcd_putcAtt(   x, y, ':',att);
  lcd_outdezNAtt(x, y, abs(tme)/60,LEADING0+att,2);
  x += (att&DBLSIZE) ? FWNUM*5-1 : FWNUM*4-2;
  lcd_outdezNAtt(x, y, abs(tme)%60,LEADING0+att2,2);
}
void putsVBat(uint8_t x,uint8_t y,uint8_t hideV,uint8_t att)
{
  //att |= g_vbat100mV < g_eeGeneral.vBatWarn ? BLINK : 0;
  if(!hideV) lcd_putcAtt(   x+ 4*FW,   y,    'V',att);
  lcd_outdezAtt( x+ 4*FW,   y,   g_vbat100mV,att);
}
void putsChnRaw(uint8_t x,uint8_t y,uint8_t idx1,uint8_t att)
{
  if(!idx1)
    lcd_putsnAtt(x,y,PSTR("----"),4,att);
  else if((idx1>=1) && (idx1 <=4))
    lcd_putsnAtt(x,y,modi12x3+g_eeGeneral.stickMode*16+4*(idx1-1),4,att);
  else                // 4   5   6   7   8   9
    lcd_putsnAtt(x,y,PSTR("P1  P2  P3  MAX FULLPPM1PPM2PPM3PPM4PPM5PPM6PPM7PPM8CH1 CH2 CH3 CH4 CH5 CH6 CH7 CH8 CH9 CH10CH11CH12CH13CH14CH15CH16"
                          "CH17CH18CH19CH20CH21CH22CH23CH24CH25CH26CH27CH28CH29CH30")+4*(idx1-5),4,att);
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
  lcd_putsnAtt(x+FW,y,PSTR(SWITCHES_STR)+3*(abs(idx1)-1),3,att);
}

void putsTmrMode(uint8_t x, uint8_t y, uint8_t attr)
{
  int8_t tm = g_model.tmrMode;
  if(abs(tm)<TMR_VAROFS) {
    lcd_putsnAtt(  x, y, PSTR("OFFABSRUsRU%ELsEL%THsTH%ALsAL%P1 P1%P2 P2%P3 P3%")+3*abs(tm),3,attr);
    if(tm<(-TMRMODE_ABS)) lcd_putcAtt(x-1*FW,  y,'!',attr);
    return;
  }

  if(abs(g_model.tmrMode)<(TMR_VAROFS+MAX_DRSWITCH-1)) { //normal on-off
    putsDrSwitches( x-1*FW,y,tm>0 ? tm-15 : tm+15,attr);
    return;
  }

  putsDrSwitches( x-1*FW,y,tm>0 ? tm-(TMR_VAROFS+MAX_DRSWITCH-1-1) : tm+(TMR_VAROFS+MAX_DRSWITCH-1-1),attr);//momentary on-off
  lcd_putcAtt(x+3*FW,  y,'m',attr);
}

bool getSwitch(int8_t swtch, bool nc)
{
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
  int16_t  v = 0;
  uint8_t  i = cs.input-1;
  if(!i) return false;
  else if(i<MIX_MAX) v = calibratedStick[i];//-512..512
  else if(i<=MIX_FULL) v = 1024; //FULL/MAX
  else if(i<MIX_FULL+NUM_PPM) v = g_ppmIns[i-MIX_FULL] - g_eeGeneral.ppmInCalib[i-MIX_FULL];
  else v = ex_chans[i-MIX_FULL-NUM_PPM];

  int16_t ofs = calc100toRESX(cs.offset); //coffset 100 -> 1024
  switch (cs.func) {
    case (CS_VPOS):   return swtch>0 ? (v>ofs) : !(v>ofs);
    case (CS_VNEG):   return swtch>0 ? (v<ofs) : !(v<ofs);
    case (CS_APOS):   return swtch>0 ? (abs(v)>ofs) : !(abs(v)>ofs);
    case (CS_ANEG):   return swtch>0 ? (abs(v)<ofs) : !(abs(v)<ofs);
    default:          return false;
  }
}

void checkMem()
{
  if(! WARN_MEM) return;
  if(EeFsGetFree() < 200)
  {
    alert(PSTR("EEPROM low mem"));
  }

}
void checkTHR()
{
  if(! WARN_THR) return;
#ifdef SIM
  for(uint8_t i=0; i<20; i++) per10ms(); //read anas
#else
  while(g_tmr10ms<20){} //wait for some ana in
#endif
  int thrchn=(2-(g_eeGeneral.stickMode&1));//stickMode=0123 -> thr=2121
  //int16_t v      = g_anaIns[thrchn];
  int16_t v      = anaIn(thrchn);

  int16_t lowLim = g_eeGeneral.calibMid[thrchn] - g_eeGeneral.calibSpanNeg[thrchn] +
    g_eeGeneral.calibSpanNeg[thrchn]/8;

  int16_t highLim = g_eeGeneral.calibMid[thrchn] + g_eeGeneral.calibSpanPos[thrchn] -
    g_eeGeneral.calibSpanPos[thrchn]/8;
  //  v -= g_eeGeneral.calibMid[thrchn];
  //v  = v * (512/8) / (max(40,g_eeGeneral.calibSpan[thrchn]/8));
  if(((v>lowLim) && !g_eeGeneral.throttleReversed) || ((v<highLim) && g_eeGeneral.throttleReversed))
  {
    alert(PSTR("THR not idle"));
  }
}

void checkSwitches()
{
  if(! WARN_SW) return;
  uint8_t i;
  for(i=SW_BASE_DIAG; i< SW_Trainer; i++)
  {
    if(i==SW_ID0) continue;
    //if(getSwitch(i-SW_BASE,0)) break;
    if(keyState((EnumKeys)i)) break;
  }
  if(i==SW_Trainer) return;
  beepErr();
  pushMenu(menuProcDiagKeys);
}

MenuFuncP g_menuStack[5]
#ifdef SIM
 = {menuProc0};
#endif
;
uint8_t  g_menuStackPtr = 0;
uint8_t  g_beepCnt;
uint8_t  g_beepVal[4];

void alert(const prog_char * s)
{
  lcd_clear();
  lcd_putsAtt(64-5*FW,0*FH,PSTR("ALERT"),DBLSIZE);
  lcd_puts_P(0,4*FW,s);
  lcd_puts_P(64-6*FW,7*FH,PSTR("press any Key"));
  refreshDiplay();
  lcdSetRefVolt(g_eeGeneral.contrast);
  beepErr();
  while(1)
  {
    if(IS_KEY_BREAK(getEvent()))   return;  //wait for key release
  }
}

uint8_t question(const prog_char * s)
{
  lcd_clear();
  //lcd_putsAtt(64-5*FW,0*FH,PSTR("ALERT"),DBLSIZE);
  lcd_putsAtt(0,2*FH,s,0);
  lcd_puts_P(3*FW,5*FH,PSTR(" YES      NO  "));
  lcd_puts_P(3*FW,6*FH,PSTR("[MENU]  [EXIT]"));
  refreshDiplay();
  lcdSetRefVolt(g_eeGeneral.contrast);
  beepWarn();
  while(getEvent());
  while(!IS_KEY_BREAK(getEvent()));
  while(1)
  {
    if(EVT_KEY_FIRST(getEvent())==KEY_MENU)   return true;
    if(EVT_KEY_FIRST(getEvent())==KEY_EXIT)   return false;
    //if(IS_KEY_BREAK(getEvent()))   return 0;  //wait for key release
  }
}


#define RPT_TRIM(x) ( x==EVT_KEY_REPT(TRM_LH_DWN) || \
                      x==EVT_KEY_REPT(TRM_LH_UP)  || \
                      x==EVT_KEY_REPT(TRM_LV_DWN) || \
                      x==EVT_KEY_REPT(TRM_LV_UP)  || \
                      x==EVT_KEY_REPT(TRM_RV_DWN) || \
                      x==EVT_KEY_REPT(TRM_RV_UP)  || \
                      x==EVT_KEY_REPT(TRM_RH_DWN) || \
                      x==EVT_KEY_REPT(TRM_RH_UP) )

uint8_t checkTrim(uint8_t event)
{
  int8_t  k = (event & EVT_KEY_MASK) - TRM_BASE;
  int8_t  s = g_model.trimInc;
  if (s>1) s = 1 << (s-1);  // 1=>1  2=>2  3=>4  4=>8

  if((k>=0) && (k<8) && (event & _MSK_KEY_REPT))
  {
    //LH_DWN LH_UP LV_DWN LV_UP RV_DWN RV_UP RH_DWN RH_UP
    uint8_t idx = k/2;
    int8_t  v = (s==0) ? (abs(g_model.trim[idx])/4)+1 : s;
    bool thro = (((2-(g_eeGeneral.stickMode&1)) == idx) && (g_model.thrTrim));
    if (thro) v = 4; // if throttle trim and trim trottle then step=4
    int16_t x = (k&1) ? g_model.trim[idx] + v : g_model.trim[idx] - v;   // positive = k&1

    if(((x==0)  ||  ((x>=0) != (g_model.trim[idx]>=0))) && (!thro) && (g_model.trim[idx]!=0)){
      g_model.trim[idx]=0;
      killEvents(event);
      warble = false;
      beepWarn();
    }
    else if(x>-125 && x<125){
      g_model.trim[idx] = (int8_t)x;
      STORE_MODELVARS;
      if(RPT_TRIM(event)) warble = true;
      beepWarn1();//beepKey();
    }
    else
    {
      g_model.trim[idx] = (x>0) ? 125 : -125;
      STORE_MODELVARS;
      warble = false;
      beepWarn();
    }

    return 0;
  }
  return event;
}

//global helper vars
bool    checkIncDec_Ret;

bool checkIncDecGen2(uint8_t event, void *i_pval, int16_t i_min, int16_t i_max, uint8_t i_flags)
{
  int16_t val = i_flags & _FL_SIZE2 ? *(int16_t*)i_pval : *(int8_t*)i_pval ;
  int16_t newval = val;
  uint8_t kpl=KEY_RIGHT, kmi=KEY_LEFT, kother = -1;

  if(i_flags&_FL_VERT){
    kpl=KEY_UP; kmi=KEY_DOWN;
  }
  if(event & _MSK_KEY_DBL){
    uint8_t hlp=kpl;
    kpl=kmi;
    kmi=hlp;
    event=EVT_KEY_FIRST(EVT_KEY_MASK & event);
  }
  if(event==EVT_KEY_FIRST(kpl) || event== EVT_KEY_REPT(kpl) || (s_editMode && (event==EVT_KEY_FIRST(KEY_UP) || event== EVT_KEY_REPT(KEY_UP))) ) {
    newval++;
    beepKey();
    kother=kmi;
  }else if(event==EVT_KEY_FIRST(kmi) || event== EVT_KEY_REPT(kmi) || (s_editMode && (event==EVT_KEY_FIRST(KEY_DOWN) || event== EVT_KEY_REPT(KEY_DOWN))) ) {
    newval--;
    beepKey();
    kother=kpl;
  }
  if((kother != (uint8_t)-1) && keyState((EnumKeys)kother)){
    newval=-val;
    killEvents(kmi);
    killEvents(kpl);
  }
  /*
  //change values based on P1
   static int16_t p1val;
   int16_t diff = p1val-anaIn(4);
   if(!diff) newval += diff>0 ? 3 : -3;
   p1val = anaIn(4);
   */

  if(newval>i_max)
  {
    newval = i_max;
    killEvents(event);
    beepWarn();
  }
  if(newval < i_min)
  {
    newval = i_min;
    killEvents(event);
    beepWarn();
  }
  if(newval != val){
    if(newval==0) {
      pauseEvents(event);
      beepKey(); //beepWarn();
    }
    if(i_flags & _FL_SIZE2 ) *(int16_t*)i_pval = newval;
    else                     *( int8_t*)i_pval = newval;
    eeDirty(i_flags & (EE_GENERAL|EE_MODEL));
    return checkIncDec_Ret=true;
  }
  return checkIncDec_Ret=false;
}

int8_t checkIncDec_hm(uint8_t event, int8_t i_val, int8_t i_min, int8_t i_max)
{
  checkIncDecGen2(event,&i_val,i_min,i_max,EE_MODEL);
  return i_val;
}
int8_t checkIncDec_vm(uint8_t event, int8_t i_val, int8_t i_min, int8_t i_max)
{
  checkIncDecGen2(event,&i_val,i_min,i_max,_FL_VERT|EE_MODEL);
  return i_val;
}
int8_t checkIncDec_hg(uint8_t event, int8_t i_val, int8_t i_min, int8_t i_max)
{
  checkIncDecGen2(event,&i_val,i_min,i_max,EE_GENERAL);
  return i_val;
}
int8_t checkIncDec_vg(uint8_t event, int8_t i_val, int8_t i_min, int8_t i_max)
{
  checkIncDecGen2(event,&i_val,i_min,i_max,_FL_VERT|EE_GENERAL);
  return i_val;
}

#if 0
//uint8_t checkSubGen(uint8_t event,uint8_t num, uint8_t sub, bool vert)
uint8_t checkSubGen(uint8_t event,uint8_t num, uint8_t sub, uint8_t mode)
{
  uint8_t subOld=sub;

  if(mode==SUB_MODE_H_DBL){
    if(event==EVT_KEY_FIRST(KEY_RIGHT) && getEventDbl(KEY_RIGHT)==2)
    {
      beepKey();
      if(sub < (num-1)) {
        (sub)++;
      }else{
        (sub)=0;
      }
    }
    else if(event==EVT_KEY_FIRST(KEY_LEFT) && getEventDbl(KEY_LEFT)==2)
    {
      beepKey();
      if(sub > 0) {
        (sub)--;
      }else{
        (sub)=(num-1);
      }
    }
  }else{

    uint8_t inc = (mode==SUB_MODE_V) ?  KEY_DOWN : KEY_RIGHT;
    uint8_t dec = (mode==SUB_MODE_V) ?  KEY_UP   : KEY_LEFT;

    if(event==EVT_KEY_REPT(inc) || event==EVT_KEY_FIRST(inc))
    {
      beepKey();
      if(sub < (num-1)) {
        (sub)++;
      }else{
        if(event==EVT_KEY_REPT(inc))
        {
          beepWarn();
          killEvents(event);
        }else{
          (sub)=0;
        }
      }
    }
    else if(event==EVT_KEY_REPT(dec) || event==EVT_KEY_FIRST(dec))
    {
      beepKey();
      if(sub > 0) {
        (sub)--;
      }else{
        if(event==EVT_KEY_REPT(dec))
        {
          beepWarn();
          killEvents(event);
        }else{
          (sub)=(num-1);
        }
      }
    }
    else if(event==EVT_ENTRY)
    {
      sub = 0;
    }
  }
  if(subOld!=sub) BLINK_SYNC;
  return sub;
}
#endif

MenuFuncP lastPopMenu()
{
  return  g_menuStack[g_menuStackPtr+1];
}
void popMenu(bool uppermost)
{
  if(g_menuStackPtr>0){
    g_menuStackPtr = uppermost ? 0 : g_menuStackPtr-1;
    beepKey();
    (*g_menuStack[g_menuStackPtr])(EVT_ENTRY_UP);
  }else{
    alert(PSTR("menuStack underflow"));
  }
}

extern MenuFuncP lastMenu;
void chainMenu(MenuFuncP newMenu)
{
  lastMenu = newMenu;
  g_menuStack[g_menuStackPtr] = newMenu;
  (*newMenu)(EVT_ENTRY);
  beepKey();
}
void pushMenu(MenuFuncP newMenu)
{
  lastMenu = newMenu;
  g_menuStackPtr++;
  if(g_menuStackPtr >= DIM(g_menuStack))
  {
    g_menuStackPtr--;
    alert(PSTR("menuStack overflow"));
    return;
  }
  beepKey();
  g_menuStack[g_menuStackPtr] = newMenu;
  (*newMenu)(EVT_ENTRY);
}





uint8_t  g_vbat100mV;
void evalCaptures();

void perMain()
{
  perOut(g_chans512,false, false);
  eeCheck();

  lcd_clear();
  uint8_t evt=getEvent();
  evt = checkTrim(evt);
  g_menuStack[g_menuStackPtr](evt);
  refreshDiplay();
  if(PING & (1<<INP_G_RF_POW)) { //no power -> only phone jack = slave mode
    PORTG &= ~(1<<OUT_G_SIM_CTL); // 0=ppm out
  }else{
    PORTG |=  (1<<OUT_G_SIM_CTL); // 1=ppm-in
    evalCaptures();
  }
  switch( g_tmr10ms & 0x1f ) { //alle 10ms*32
    case 1:
      //check light switch
      if( getSwitch(g_eeGeneral.lightSw,0)) PORTB |=  (1<<OUT_B_LIGHT);
      else                                  PORTB &= ~(1<<OUT_B_LIGHT);
      break;

    case 2:
      {
        //check v-bat
        //14.2246465682983   -> 10.7 V  ((2.65+5.07)/2.65*5/1024)*1000  mV
        //0.142246465682983   -> 10.7 V  ((2.65+5.07)/2.65*5/1024)*10    1/10 V
        //0.137176291331963    k=((2.65+5.07)/2.65*5/1024)*10*9.74/10.1
        // g_vbat100mV=g_anaIns[7]*35/256; //34/239;
        // g_vbat100mV += g_vbat100mV*g_eeGeneral.vBatCalib/256;
        //g_vbat100mV = (g_anaIns[7]*35+g_anaIns[7]/4*g_eeGeneral.vBatCalib) / 256;
        uint16_t ab = anaIn(7);
        g_vbat100mV = (ab*35 + ab / 4 * g_eeGeneral.vBatCalib) / 512;

        static uint8_t s_batCheck;
        s_batCheck+=32;
        if(s_batCheck==0 && g_vbat100mV < g_eeGeneral.vBatWarn){
          beepErr();
        }
      }
      break;
    case 3:
      {
        static prog_uint8_t APM beepTab[]= {
          0,0, 0,  0, //quiet
          0,1,30,100, //silent
          1,1,30,100, //normal
          1,1,50,150, //for motor
        };
        memcpy_P(g_beepVal,beepTab+4*BEEP_VAL,4);
          //g_beepVal = BEEP_VAL;
      }
      break;
  }

}
volatile uint16_t captureRing[16];
volatile uint8_t  captureWr;
volatile uint8_t  captureRd;
int16_t g_ppmIns[8];
uint8_t ppmInState; //0=unsync 1..8= wait for value i-1

#ifndef SIM
#include <avr/interrupt.h>
//#include <avr/wdt.h>
#define HEART_TIMER2Mhz 1;
#define HEART_TIMER10ms 2;

uint8_t heartbeat;

extern uint16_t g_tmr1Latency_max;
extern uint16_t g_tmr1Latency_min;

//ISR(TIMER1_OVF_vect)
ISR(TIMER1_COMPA_vect) //2MHz pulse generation
{
  static uint8_t   pulsePol;
  static uint16_t *pulsePtr = pulses2MHz;

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

  OCR1A  = *pulsePtr++;

  if( *pulsePtr == 0) {
    //currpulse=0;
    pulsePtr = pulses2MHz;
    pulsePol = 0;

    TIMSK &= ~(1<<OCIE1A); //stop reentrance
    sei();
    setupPulses();
    cli();
    TIMSK |= (1<<OCIE1A);
  }
  heartbeat |= HEART_TIMER2Mhz;
}

class AutoLock
{
  uint8_t m_saveFlags;
public:
  AutoLock(){
    m_saveFlags = SREG;
    cli();
  };
  ~AutoLock(){
    if(m_saveFlags & (1<<SREG_I)) sei();
    //SREG = m_saveFlags;// & (1<<SREG_I)) sei();
  };
};

#define STARTADCONV (ADCSRA  = (1<<ADEN) | (1<<ADPS0) | (1<<ADPS1) | (1<<ADPS2) | (1<<ADSC) | (1 << ADIE))
static uint16_t s_anaFilt[8];
uint16_t anaIn(uint8_t chan)
{
  //                     ana-in:   3 1 2 0 4 5 6 7
  //static prog_char APM crossAna[]={4,2,3,1,5,6,7,0}; // wenn schon Tabelle, dann muss sich auch lohnen
  static prog_char APM crossAna[]={3,1,2,0,4,5,6,7};
  volatile uint16_t *p = &s_anaFilt[pgm_read_byte(crossAna+chan)];
  AutoLock autoLock;
  return *p;
}


#define ADC_VREF_TYPE 0x40
void getADC_filt()
{
  for (uint8_t adc_input=0;adc_input<8;adc_input++){
    uint16_t t = 0;
    for (uint8_t i=0; i<4;i++) {  // Going from 10bits to 11 bits.  Addition = n.  Loop 4^n times
      ADMUX=adc_input|ADC_VREF_TYPE;
      // Start the AD conversion
      ADCSRA|=0x40;
      // Wait for the AD conversion to complete
      while ((ADCSRA & 0x10)==0);
      ADCSRA|=0x10;
      t += ADCW;
    }
    s_anaFilt[adc_input] = t/2;
  }
}


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
    }
}

volatile uint8_t g_tmr16KHz;

ISR(TIMER0_OVF_vect) //continuous timer 16ms (16MHz/1024)
{
  g_tmr16KHz++;
}

uint16_t getTmr16KHz()
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
  OCR0 = OCR0 + 156;
  if(g_beepCnt){
    g_beepCnt--;
    static bool warbleC;
    warbleC = warble && !warbleC;
    if(warbleC)
      PORTE &= ~(1<<OUT_E_BUZZER);//buzzer off
    else
      PORTE |=  (1<<OUT_E_BUZZER);//buzzer on
  }else{
    PORTE &= ~(1<<OUT_E_BUZZER);
    warble = false;
  }
  per10ms();
  heartbeat |= HEART_TIMER10ms;
  cli();
  TIMSK |= (1<<OCIE0);
  sei();
}



ISR(TIMER3_CAPT_vect, ISR_NOBLOCK) //capture ppm in 16MHz / 8 = 2MHz
{
  uint16_t capture=ICR3;
  cli();
  ETIMSK &= ~(1<<TICIE3); //stop reentrance
  sei();

  static uint16_t lastCapt;
  uint8_t nWr = (captureWr+1) % DIM(captureRing);
  if(nWr == captureRd) //overflow
  {
    captureRing[(captureWr+DIM(captureRing)-1) % DIM(captureRing)] = 0; //distroy last value
    beepErr();
  }else{
    captureRing[captureWr] = capture - lastCapt;
    captureWr              = nWr;
  }
  lastCapt = capture;

  cli();
  ETIMSK |= (1<<TICIE3);
  sei();
}

void evalCaptures()
{
  while(captureRd != captureWr)
  {
    uint16_t val = captureRing[captureRd] / 2; // us
    captureRd = (captureRd + 1)  % DIM(captureRing); //next read
    if(ppmInState && ppmInState<=8){
      if(val>800 && val <2200){
        g_ppmIns[ppmInState++ - 1] = val - 1500; //+-500 != 512, Fehler ignoriert
      }else{
        ppmInState=0; //not triggered
      }
    }else{
      if(val>4000 && val < 16000)
      {
        ppmInState=1; //triggered
      }
    }
  }
}


extern uint16_t g_timeMain;
//void main(void) __attribute__((noreturn));

int main(void)
{
  DDRA = 0xff;  PORTA = 0x00;
  DDRB = 0x81;  PORTB = 0x7e; //pullups keys+nc
  DDRC = 0x3e;  PORTC = 0xc1; //pullups nc
  DDRD = 0x00;  PORTD = 0xff; //pullups keys
  DDRE = 0x08;  PORTE = 0xff-(1<<OUT_E_BUZZER); //pullups + buzzer 0
  DDRF = 0x00;  PORTF = 0xff; //anain
  DDRG = 0x10;  PORTG = 0xff; //pullups + SIM_CTL=1 = phonejack = ppm_in
  lcd_init();

#ifdef JETI
  JETI_Init();
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

  sei(); //damit alert in eeReadGeneral() nicht haengt
  g_menuStack[0] =  menuProc0;

  lcdSetRefVolt(25);
  eeReadAll();
  checkMem();
  //setupAdc(); //before checkTHR
  getADC_single();
  checkTHR();
  checkSwitches();
  setupPulses();
  wdt_enable(WDTO_500MS);
  perOut(g_chans512, true, false);

  lcdSetRefVolt(g_eeGeneral.contrast);
  TIMSK |= (1<<OCIE1A); // Pulse generator enable immediately before mainloop
  while(1){
    //uint16_t old10ms=g_tmr10ms;
    uint16_t t0 = getTmr16KHz();
    getADC_osmp(); //over sample -> add one bit 10bit ADC => 11 bit ADC
    perMain();
    //while(g_tmr10ms==old10ms) sleep_mode();
    if(heartbeat == 0x3)
    {
      wdt_reset();
     heartbeat = 0;
    }
    t0 = getTmr16KHz() - t0;
    g_timeMain = max(g_timeMain,t0);

  }
}
#endif

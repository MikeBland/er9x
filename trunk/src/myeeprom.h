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
#ifndef eeprom_h
#define eeprom_h


//eeprom data
//#define EE_VERSION 2
#define MAX_MODELS 16
#define MAX_MIXERS 32
#define MAX_CURVE5 8
#define MAX_CURVE9 8
#define MDVERS_r9  1
#define MDVERS_r14 2
#define MDVERS_r22 3
#define MDVERS_r77 4
#define MDVERS_r85 5
#define MDVERS     6


#define GENERAL_MYVER 3


// eeprom ver <9 => mdvers == 1
// eeprom ver >9 => mdvers ==2


typedef struct t_EEGeneral {
  uint8_t   myVers;
  int16_t   calibMid[7];
  int16_t   calibSpanNeg[7];
  int16_t   calibSpanPos[7];
  uint16_t  chkSum;
  uint8_t   currModel; //0..15
  uint8_t   contrast;
  uint8_t   vBatWarn;
  int8_t    vBatCalib;
  int8_t    lightSw;
  int16_t   ppmInCalib[8];
  uint8_t   view;     //index of subview in main scrren
#define WARN_THR     (!(g_eeGeneral.warnOpts & 0x01))
#define WARN_THR_REV (!(g_eeGeneral.warnOpts & 0x20))
#define WARN_SW      (!(g_eeGeneral.warnOpts & 0x02))
#define WARN_MEM     (!(g_eeGeneral.warnOpts & 0x04))
#define BEEP_VAL     ( (g_eeGeneral.warnOpts & 0x18) >>3 )
  uint8_t   warnOpts; //bitset for several warnings
  uint8_t   stickMode;
  uint8_t   inactivityTimer;
  uint8_t   throttleReversed;
  uint8_t   filterInput;
  uint8_t   res[4];
} __attribute__((packed)) EEGeneral;



#define MIX_P1    5
#define MIX_P2    6
#define MIX_P3    7
#define MIX_MAX   8
#define MIX_FULL  9



#define DR_HIGH   0
#define DR_MID    1
#define DR_LOW    2
#define DR_EXPO   0
#define DR_WEIGHT 1
#define DR_RIGHT  0
#define DR_LEFT   1
#define DR_DRSW1  99
#define DR_DRSW2  98

//eeprom modelspec
//expo[3][2][2] //[Norm/Dr][expo/weight][R/L]

typedef struct t_ExpoData {
  int8_t  expo[3][2][2];
  int8_t  drSw1;
  int8_t  drSw2;
} __attribute__((packed)) ExpoData;


typedef struct t_LimitData {
  int8_t  min;
  int8_t  max;
  bool    revert;
  int16_t  offset;
} __attribute__((packed)) LimitData;

#define MLTPX_ADD  0
#define MLTPX_MUL  1
#define MLTPX_REP  2

typedef struct t_MixData {
  uint8_t destCh;            //        1..NUM_CHNOUT
  uint8_t srcRaw;            //
  int8_t  weight;
  int8_t  swtch;
  uint8_t curve;             //0=symmetrisch 1=no neg 2=no pos
  uint8_t delayUp:4;
  uint8_t delayDown:4;
  uint8_t speedUp:4;         // Servogeschwindigkeit aus Tabelle (10ms Cycle)
  uint8_t speedDown:4;       // 0 nichts
  uint8_t carryTrim:1;
  uint8_t mltpx:3;           // multiplex method 0=+ 1=* 2=replace
  uint8_t mixWarn:4;         // mixer warning
  int8_t  sOffset;
  int8_t  res;
} __attribute__((packed)) MixData;

#define CS_OFF     0
#define CS_VPOS    1  //v>offset
#define CS_VNEG    2  //v<offset
#define CS_APOS    3  //|v|>offset
#define CS_ANEG    4  //|v|<offset
#define CS_MAXF    4  //max function


typedef struct t_CSwData { // Custom Switches data
  uint8_t input;
  int8_t  offset;
  uint8_t func;
} __attribute__((packed)) CSwData;


typedef struct t_SwashRingData { // Swash Ring data
  uint8_t lim;   // 0 mean off 100 full deflection
  uint8_t chX; // 2 channels to limit
  uint8_t chY; // 2 channels to limit
} __attribute__((packed)) SwashRingData;

typedef struct t_ModelData {
  char      name[10];             // 10 must be first for eeLoadModelName
  uint8_t   mdVers;
  int8_t    tmrMode;   //timer trigger source -> off, abs, stk, stk%, sw/!sw, !m_sw/!m_sw
  int8_t    tmrDir;    //0=>Count Down, 1=>Count Up
  uint16_t  tmrVal;
  uint8_t   protocol;
  int8_t    ppmNCH;
  int8_t    thrTrim:4;            // Enable Throttle Trim
  int8_t    thrExpo:4;            // Enable Throttle Expo
  int8_t    trimInc;              // Trim Increments
  int8_t    ppmDelay;
  int8_t    trimSw;
  uint8_t   beepANACenter;        //1<<0->A1.. 1<<6->A7
  char      res[4];
  MixData   mixData[MAX_MIXERS];
  LimitData limitData[NUM_CHNOUT];
  ExpoData  expoData[4];
  int8_t    trim[4];
  int8_t    curves5[MAX_CURVE5][5];
  int8_t    curves9[MAX_CURVE9][9];
  CSwData   customSw[NUM_CSW];
  SwashRingData swashR;
} __attribute__((packed)) ModelData;



#define TOTAL_EEPROM_USAGE (sizeof(ModelData)*MAX_MODELS + sizeof(EEGeneral))


extern EEGeneral g_eeGeneral;
extern ModelData g_model;












#endif
/*eof*/

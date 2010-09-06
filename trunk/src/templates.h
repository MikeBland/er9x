/*
 * Author - Erez Raviv <erezraviv@gmail.com>
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
 * ============================================================
 * Templates file
 *
 * eccpm
 * crow
 * throttle cut
 * flaperon
 * elevon
 * v-tail
 * throttle hold
 * Aileron Differential
 * Spoilers
 * Snap Roll
 * ELE->Flap
 * Flap->ELE
 *
 *
 *
 * =============================================================
 * Assumptions:
 * All primary channels are per modi12x3
 * Each template added to the end of each channel
 *
 *
 *
 */


 /*
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
  uint8_t boolres:4;
  int8_t  sOffset;
  int8_t  res;
} __attribute__((packed)) MixData;
  */


#define STK_RUD  1
#define STK_ELE  2
#define STK_THR  3
#define STK_AIL  4
#define STK_P1   5
#define STK_P2   6
#define STK_P3   7
#define NUM_TEMPLATES    DIM(n_Templates)
#define NUM_TEMPLATE_MIX 8
#define TEMPLATE_NLEN    15

#define CM(x) (CONVERT_MODE((x)))

const char n_Templates[][TEMPLATE_NLEN] = {
  "Simple 4-CH",
  "T-Cut",
  "V-Tail",
  "Elevon\\Delta",
  "eCCPM"
};


MixData* setDest(uint8_t dch)
{
  uint8_t i = 0;
  while ((g_model.mixData[i].destCh<=dch) && (g_model.mixData[i].destCh) && (i<MAX_MIXERS)) i++;
  if(i==MAX_MIXERS) return &g_model.mixData[0];
  
  memmove(&g_model.mixData[i+1],&g_model.mixData[i],
         (MAX_MIXERS-(i+1))*sizeof(MixData) );
  memset(&g_model.mixData[i],0,sizeof(MixData));
  g_model.mixData[i].destCh = dch;
  return &g_model.mixData[i];
}

void applyTemplate(uint8_t idx)
{
  MixData *md = &g_model.mixData[0];
  
  switch (idx){
  //Simple 4-Ch
  case (0):
    md=setDest(CM(STK_RUD));  md->srcRaw=CM(STK_RUD);  md->weight=100;
    md=setDest(CM(STK_ELE));  md->srcRaw=CM(STK_ELE);  md->weight=100;
    md=setDest(CM(STK_THR));  md->srcRaw=CM(STK_THR);  md->weight=100;
    md=setDest(CM(STK_AIL));  md->srcRaw=CM(STK_AIL);  md->weight=100;
  break;
    
  //T-Cut  
  case (1):
    md=setDest(CM(STK_THR));  md->srcRaw=MIX_MAX;  md->weight=-100;  md->swtch=DSW_THR;  md->mltpx=MLTPX_REP;
  break;

  //V-Tail
  case (2):
    md=setDest(CM(STK_RUD));  md->srcRaw=CM(STK_RUD);  md->weight= 100;
    md=setDest(CM(STK_RUD));  md->srcRaw=CM(STK_ELE);  md->weight=-100;
    md=setDest(CM(STK_ELE));  md->srcRaw=CM(STK_RUD);  md->weight= 100;
    md=setDest(CM(STK_ELE));  md->srcRaw=CM(STK_ELE);  md->weight= 100;
  break;

  //Elevon\\Delta
  case (3):
    md=setDest(CM(STK_ELE));  md->srcRaw=CM(STK_ELE);  md->weight= 100;
    md=setDest(CM(STK_ELE));  md->srcRaw=CM(STK_AIL);  md->weight= 100;
    md=setDest(CM(STK_AIL));  md->srcRaw=CM(STK_ELE);  md->weight= 100;
    md=setDest(CM(STK_AIL));  md->srcRaw=CM(STK_AIL);  md->weight=-100;
  break;

  //eCCPM
  case (4):
    md=setDest(CM(STK_ELE));  md->srcRaw=CM(STK_ELE);  md->weight= 72;
    md=setDest(CM(STK_ELE));  md->srcRaw=CM(STK_THR);  md->weight= 55;
    md=setDest(CM(STK_AIL));  md->srcRaw=CM(STK_ELE);  md->weight=-36;
    md=setDest(CM(STK_AIL));  md->srcRaw=CM(STK_AIL);  md->weight= 62;
    md=setDest(CM(STK_AIL));  md->srcRaw=CM(STK_THR);  md->weight= 55;
    md=setDest(6);            md->srcRaw=CM(STK_ELE);  md->weight=-36;
    md=setDest(6);            md->srcRaw=CM(STK_AIL);  md->weight=-62;
    md=setDest(6);            md->srcRaw=CM(STK_THR);  md->weight= 55;
  break;

}
 STORE_MODELVARS;

}

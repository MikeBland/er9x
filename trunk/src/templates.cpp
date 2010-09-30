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

#include "er9x.h"
#include "templates.h"

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

void clearMixes()
{
    memset(g_model.mixData,0,sizeof(g_model.mixData)); //clear all mixes
}

void clearCurves()
{
    memset(g_model.curves5,0,sizeof(g_model.curves5)); //clear all curves
    memset(g_model.curves9,0,sizeof(g_model.curves9)); //clear all curves
}

void setCurve(uint8_t c, int8_t ar[])
{
    if(c<MAX_CURVE5) //5 pt curve
        for(uint8_t i=0; i<5; i++) g_model.curves5[c][i] = ar[i];
    else  //9 pt curve
        for(uint8_t i=0; i<9; i++) g_model.curves9[c-MAX_CURVE5][i] = ar[i];
}

void applyTemplate(uint8_t idx)
{
  MixData *md = &g_model.mixData[0];
  
  switch (idx){
  //Simple 4-Ch
  case (0):
    md=setDest(CC(STK_RUD));  md->srcRaw=CM(STK_RUD);  md->weight=100;
    md=setDest(CC(STK_ELE));  md->srcRaw=CM(STK_ELE);  md->weight=100;
    md=setDest(CC(STK_THR));  md->srcRaw=CM(STK_THR);  md->weight=100;
    md=setDest(CC(STK_AIL));  md->srcRaw=CM(STK_AIL);  md->weight=100;
  break;
    
  //T-Cut  
  case (1):
    md=setDest(CC(STK_THR));  md->srcRaw=MIX_MAX;  md->weight=-100;  md->swtch=DSW_THR;  md->mltpx=MLTPX_REP;
  break;

  //V-Tail
  case (2):
    md=setDest(CC(STK_RUD));  md->srcRaw=CM(STK_RUD);  md->weight= 100;
    md=setDest(CC(STK_RUD));  md->srcRaw=CM(STK_ELE);  md->weight=-100;
    md=setDest(CC(STK_ELE));  md->srcRaw=CM(STK_RUD);  md->weight= 100;
    md=setDest(CC(STK_ELE));  md->srcRaw=CM(STK_ELE);  md->weight= 100;
  break;

  //Elevon\\Delta
  case (3):
    md=setDest(CC(STK_ELE));  md->srcRaw=CM(STK_ELE);  md->weight= 100;
    md=setDest(CC(STK_ELE));  md->srcRaw=CM(STK_AIL);  md->weight= 100;
    md=setDest(CC(STK_AIL));  md->srcRaw=CM(STK_ELE);  md->weight= 100;
    md=setDest(CC(STK_AIL));  md->srcRaw=CM(STK_AIL);  md->weight=-100;
  break;

  //eCCPM
  case (4):
    md=setDest(CC(STK_ELE));  md->srcRaw=CM(STK_ELE);  md->weight= 72;
    md=setDest(CC(STK_ELE));  md->srcRaw=CM(STK_THR);  md->weight= 55;
    md=setDest(CC(STK_AIL));  md->srcRaw=CM(STK_ELE);  md->weight=-36;
    md=setDest(CC(STK_AIL));  md->srcRaw=CM(STK_AIL);  md->weight= 62;
    md=setDest(CC(STK_AIL));  md->srcRaw=CM(STK_THR);  md->weight= 55;
    md=setDest(6);            md->srcRaw=CM(STK_ELE);  md->weight=-36;
    md=setDest(6);            md->srcRaw=CM(STK_AIL);  md->weight=-62;
    md=setDest(6);            md->srcRaw=CM(STK_THR);  md->weight= 55;
  break;
  
  //Heli Setup
  case (5):
    clearMixes();  //This time we want a clean slate
    clearCurves();
    
    //Set up Mixes
    md=setDest(CC(STK_AIL));  md->srcRaw=CH(9);   md->weight=  50;
    md=setDest(CC(STK_AIL));  md->srcRaw=CH(10);  md->weight=-100;
    md=setDest(CC(STK_AIL));  md->srcRaw=CH(11);  md->weight= 100; md->carryTrim=TRIM_OFF; 
    
    md=setDest(CC(STK_ELE));  md->srcRaw=CH(9);   md->weight=-100;
    md=setDest(CC(STK_ELE));  md->srcRaw=CH(11);  md->weight= 100; md->carryTrim=TRIM_OFF; 
    
    md=setDest(CC(STK_THR));  md->srcRaw=CM(STK_THR);  md->weight= 100; md->swtch=DSW_ID0; md->curve=CV(1); md->carryTrim=TRIM_OFF;
    md=setDest(CC(STK_THR));  md->srcRaw=CM(STK_THR);  md->weight= 100; md->swtch=DSW_ID1; md->curve=CV(2); md->carryTrim=TRIM_OFF;
    md=setDest(CC(STK_THR));  md->srcRaw=CM(STK_THR);  md->weight= 110; md->swtch=DSW_ID2; md->curve=CV(2); md->carryTrim=TRIM_OFF;
    md=setDest(CC(STK_THR));  md->srcRaw=MIX_MAX;      md->weight=-125; md->swtch=DSW_THR;  md->mltpx=MLTPX_REP; md->carryTrim=TRIM_OFF;
    
    md=setDest(CC(STK_RUD));  md->srcRaw=CM(STK_RUD); md->weight=100;
    
    md=setDest(5);  md->srcRaw=MIX_MAX; md->weight= 50; md->swtch=-DSW_GEA; md->carryTrim=TRIM_OFF;
    md=setDest(5);  md->srcRaw=MIX_MAX; md->weight=-50; md->swtch= DSW_GEA; md->carryTrim=TRIM_OFF;
    md=setDest(5);  md->srcRaw=STK_P3;  md->weight= 40; md->carryTrim=TRIM_OFF;
    
    md=setDest(6);  md->srcRaw=CH(9);   md->weight= -50;
    md=setDest(6);  md->srcRaw=CH(10);  md->weight=-100;
    md=setDest(6);  md->srcRaw=CH(11);  md->weight=-100; md->carryTrim=TRIM_OFF; 
    
    md=setDest(9);  md->srcRaw=CM(STK_ELE);  md->weight= 60;
    md=setDest(10); md->srcRaw=CM(STK_AIL);  md->weight=-52;
    md=setDest(11); md->srcRaw=CM(STK_THR);  md->weight= 70; md->swtch=DSW_ID0; md->curve=CV(3); md->carryTrim=TRIM_OFF;  
    md=setDest(11); md->srcRaw=CM(STK_THR);  md->weight= 70; md->swtch=DSW_ID1; md->curve=CV(4); md->carryTrim=TRIM_OFF;  
    md=setDest(11); md->srcRaw=CM(STK_THR);  md->weight= 70; md->swtch=DSW_ID2; md->curve=CV(4); md->carryTrim=TRIM_OFF; 
    md=setDest(11); md->srcRaw=CM(STK_THR);  md->weight=100; md->swtch=DSW_THR; md->curve=CV(5); md->carryTrim=TRIM_OFF;  md->mltpx=MLTPX_REP;
    
    //Set up Curves
    int8_t ar1[] = {-100, 20, 50, 70, 90};
    int8_t ar2[] = {90, 70, 50, 70, 90};
    int8_t ar3[] = {-20, -20, 0, 60, 100};
    int8_t ar4[] = {-100, -60, 0, 60, 100};
    int8_t ar5[] = {-100, 0, 0, 0, 100};
    setCurve(CURVE5(1),ar1);
    setCurve(CURVE5(2),ar2);
    setCurve(CURVE5(3),ar3);
    setCurve(CURVE5(4),ar4);
    setCurve(CURVE5(5),ar5);
  break;

}
 STORE_MODELVARS;

}

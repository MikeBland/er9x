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

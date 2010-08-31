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

typedef struct t_TemplateData {
  char      name[10];
  uint8_t   mCount;
  MixData   md[]
} __attribute__((packed)) TemplateData;

//TEPLATES -> GO BY MODE 1 => "RUD ELE THR AIL"

#define STK_RUD  1
#define STK_ELE  2
#define STK_THR  3
#define STK_AIL  4
#define NUM_TEMPLATES DIM(mix_Templates)

const TemplateData APM  mix_Templates[] =
{
  .name="T-Cut",
  .count=1,
  .md[0]={.destCh=STK_THR,  .srcRaw=MIX_MAX,  .weight=-100,  .swtch=DSW_THR,  .mltpx=MLTPX_REP}
},
{
  .name="V-Tail",
  .count=4,
  .md[0]={.destCh=STK_RUD,  .srcRaw=STK_RUD,  .weight=100},
  .md[1]={.destCh=STK_RUD,  .srcRaw=STK_ELE,  .weight=100},
  .md[2]={.destCh=STK_ELE,  .srcRaw=STK_RUD,  .weight=100},
  .md[3]={.destCh=STK_ELE,  .srcRaw=STK_ELE,  .weight=100}
},
{
  .name="Elevon",
  .count=4,
  .md[0]={.destCh=STK_ELE,  .srcRaw=STK_ELE,  .weight=100},
  .md[1]={.destCh=STK_ELE,  .srcRaw=STK_AIL,  .weight=100},
  .md[2]={.destCh=STK_AIL,  .srcRaw=STK_ELE,  .weight=100},
  .md[3]={.destCh=STK_AIL,  .srcRaw=STK_AIL,  .weight=100}
};


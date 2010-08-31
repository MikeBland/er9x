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
#define NUM_TEMPLATES    3
#define NUM_TEMPLATE_MIX 4

typedef struct t_TemplateData {
  char      name[15];
  MixData   md[NUM_TEMPLATE_MIX];
} __attribute__((packed)) TemplateData;

//TEMPLATES -> GO BY MODE 1 => "RUD ELE THR AIL"

TemplateData  mix_Templates[NUM_TEMPLATES];

void initTemplates()
{
  memset(mix_Templates,0,sizeof(mix_Templates));
  TemplateData *td;
  
  uint8_t j=0;
  uint8_t i=0;
  
  i=0;
  td = &mix_Templates[j];
  memset(td->name,' ',sizeof(td->name));
  strcpy_P(td->name,PSTR("T-Cut"));
  td->md[i].destCh=STK_THR;  td->md[i].srcRaw=MIX_MAX;  td->md[i].weight=-100;  td->md[i].swtch=DSW_THR;  td->md[i].mltpx=MLTPX_REP;
  j++;
  
  i=0;
  td = &mix_Templates[j];
  memset(td->name,' ',sizeof(td->name));
  strcpy_P(td->name,PSTR("V-Tail"));
  td->md[i].destCh=STK_RUD;  td->md[i].srcRaw=STK_RUD;  td->md[i].weight=-100; i++;
  td->md[i].destCh=STK_RUD;  td->md[i].srcRaw=STK_ELE;  td->md[i].weight=-100; i++;
  td->md[i].destCh=STK_ELE;  td->md[i].srcRaw=STK_RUD;  td->md[i].weight=-100; i++;
  td->md[i].destCh=STK_ELE;  td->md[i].srcRaw=STK_ELE;  td->md[i].weight=-100; i++;
  j++;

  i=0;
  td = &mix_Templates[j];
  memset(td->name,' ',sizeof(td->name));
  strcpy_P(td->name,PSTR("Elevon\\Delta"));
  td->md[i].destCh=STK_ELE;  td->md[i].srcRaw=STK_ELE;  td->md[i].weight=-100; i++;
  td->md[i].destCh=STK_ELE;  td->md[i].srcRaw=STK_AIL;  td->md[i].weight=-100; i++;
  td->md[i].destCh=STK_AIL;  td->md[i].srcRaw=STK_ELE;  td->md[i].weight=-100; i++;
  td->md[i].destCh=STK_AIL;  td->md[i].srcRaw=STK_AIL;  td->md[i].weight=-100; i++;
  j++;
  
}

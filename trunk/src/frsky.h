/*
 * Author - Philip Moss
 * Adapted from jeti.h code by Karl Szmutny <shadow@privy.de>
 * 
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

#ifndef frsky_h
#define frsky_h


#include "er9x.h"


extern uint8_t linkBuffer[9]; // 4 bytes, worst case 8 bytes with byte stuff + 1
extern uint8_t TelemBuffer[33];
extern uint8_t FrskyBufferReady;

void FRSKY_Init(void);
void FRSKY_DisableTXD (void);
void FRSKY_EnableTXD (void);
void FRSKY_DisableRXD (void);
void FRSKY_EnableRXD (void);


#endif


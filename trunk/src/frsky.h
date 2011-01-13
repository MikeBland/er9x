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
extern uint8_t TelemBuffer[45];
extern uint8_t alrmRequest[11];
extern uint8_t FrskyBufferReady;
extern uint8_t alrmPktRx;
extern uint8_t fr_editMode;
extern uint8_t a11Buffer[9]; // 4 bytes, worst case 8 bytes with byte stuff + 1
extern uint8_t a12Buffer[9]; // 4 bytes, worst case 8 bytes with byte stuff + 1
extern uint8_t a21Buffer[9]; // 4 bytes, worst case 8 bytes with byte stuff + 1
extern uint8_t a22Buffer[9]; // 4 bytes, worst case 8 bytes with byte stuff + 1
//extern uint16_t a11hex;

void FRSKY_Init(void);
void FRSKY_DisableTXD (void);
void FRSKY_EnableTXD (void);
void FRSKY_DisableRXD (void);
void FRSKY_EnableRXD (void);
void FRSKY_Transmit(uint8_t data);
void FRSKY_saveAlarms (void);

#endif


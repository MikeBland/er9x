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
#ifndef er9x_h
#define er9x_h

#define VERS 1

#include <inttypes.h>
#include <string.h>

///opt/cross/avr/include/avr/pgmspace.h
#include <stddef.h>

#ifndef SIMU

#include <avr/io.h>
#define assert(x)
//disable whole pgmspace functionality for all avr-gcc because
//avr-gcc > 4.2.1 does not work anyway
//http://www.mail-archive.com/gcc-bugs@gcc.gnu.org/msg239240.html
//http://gcc.gnu.org/bugzilla/show_bug.cgi?id=34734
//
//Workarounds:
//
//PSTR is fixed below
//all prog_xx definitions must use APM explicitely

//#define __ATTR_PROGMEM__
#include <avr/pgmspace.h>


#undef prog_void
#undef prog_char
#undef prog_uchar
#undef prog_int8_t
#undef prog_uint8_t
#undef prog_int16_t
#undef prog_uint16_t
#undef prog_int32_t
#undef prog_uint32_t


typedef void prog_void __attribute__((__progmem__));//,deprecated("prog_void type is deprecated.")));
typedef char prog_char __attribute__((__progmem__));//,deprecated("prog_char type is deprecated.")));
typedef unsigned char prog_uchar __attribute__((__progmem__));//,deprecated("prog_uchar type is deprecated.")));
typedef int8_t    prog_int8_t   __attribute__((__progmem__));//,deprecated("prog_int8_t type is deprecated.")));
typedef uint8_t   prog_uint8_t  __attribute__((__progmem__));//,deprecated("prog_uint8_t type is deprecated.")));
typedef int16_t   prog_int16_t  __attribute__((__progmem__));//,deprecated("prog_int16_t type is deprecated.")));
typedef uint16_t  prog_uint16_t __attribute__((__progmem__));//,deprecated("prog_uint16_t type is deprecated.")));
typedef int32_t   prog_int32_t  __attribute__((__progmem__));//,deprecated("prog_int32_t type is deprecated.")));
typedef uint32_t  prog_uint32_t __attribute__((__progmem__));//,deprecated("prog_uint32_t type is deprecated.")));

#undef PGM_P
#define PGM_P const prog_char *

#ifndef FORCEINLINE
#define FORCEINLINE inline __attribute__ ((always_inline))
#endif

#ifndef NOINLINE
#define NOINLINE __attribute__ ((noinline))
#endif

#ifdef __cplusplus
#define APM __attribute__(( section(".progmem.data") ))
#undef PSTR
#define PSTR(s) (__extension__({const static prog_char APM __c[] = (s);&__c[0];}))
#endif

#include <avr/eeprom.h>
#include <avr/sleep.h>
#include <avr/interrupt.h>
#define F_CPU 16000000UL  // 16 MHz
#include <util/delay.h>
#define pgm_read_adr(address_short) pgm_read_word(address_short)
#include <avr/wdt.h>

//#define eeprom_write_block eeWriteBlockCmp

#endif

#include "file.h"
//
//                  elev                        thr
//                   LV                         RV
//                 2 ^                        4 ^
//                   1                          2
//                   |     rudd                 |     aile
//              <----X--3-> LH             <----X--0-> RH
//              6    |    7                1    |    0
//                   |                          |
//                 3 v                        5 v
//


//PORTA  7      6       5       4       3       2       1       0
//       O      O       O       O       O       O       O       O
//       ------------------------ LCD_DAT -----------------------
//
//PORTB  7      6       5       4       3       2       1       0
//       O      i       i       i       i       i       i       O
//       light  KEY_LFT KEY_RGT KEY_UP  KEY_DWN KEY_EXT KEY_MEN  PPM
//
//PORTC  7      6       5       4       3       2       1       0
//       -      -       O       O       O       O       O       -
//       FRSKY  FRSKY LCD_E   LCD_RNW  LCD_A0  LCD_RES LCD_CS1  NC
//
//PORTD  7      6       5       4       3       2       1       0
//       i      i       i       i       i       i       i       i
//     TRM_D_DWN _UP  TRM_C_DWN _UP   TRM_B_DWN _UP   TRM_A_DWN _UP
//
//PORTE  7      6       5       4       3       2       1       0
//       i      i       i       i       O       i       i       i
//     PPM_IN  ID2    Trainer  Gear   Buzzer   ElevDR  AileDR  THRCT
//
//PORTF  7      6       5       4       3       2       1       0
//       ai     ai      ai      ai      ai      ai      ai      ai
// ANA_ BAT   PITT_TRM HOV_THR HOV_PIT  STCK_LH STCK_RV STCK_LV STCK_RH
//                                      rud    thro   elev   aile
//PORTG  7      6       5       4       3       2       1       0
//       -      -       -       O       i               i       i
//                            SIM_CTL  ID1    HAPTIC  RF_POW   RuddDR

#define PORTA_LCD_DAT  PORTA
#define OUT_B_LIGHT   7
#define INP_B_KEY_LFT 6
#define INP_B_KEY_RGT 5
#define INP_B_KEY_UP  4
#define INP_B_KEY_DWN 3
#define INP_B_KEY_EXT 2
#define INP_B_KEY_MEN 1
#define OUT_B_PPM 0
#define PORTC_LCD_CTRL PORTC
#define OUT_C_LCD_E     5
#define OUT_C_LCD_RnW   4
#define OUT_C_LCD_A0    3
#define OUT_C_LCD_RES   2
#define OUT_C_LCD_CS1   1

#define INP_D_TRM_LH_UP   7
#define INP_D_TRM_LH_DWN  6
#define INP_D_TRM_RV_DWN  5
#define INP_D_TRM_RV_UP   4
#define INP_D_TRM_LV_DWN  3
#define INP_D_TRM_LV_UP   2
#define INP_D_TRM_RH_DWN  1
#define INP_D_TRM_RH_UP   0

#define INP_E_PPM_IN  7
#define INP_E_ID2     6
#define INP_E_Trainer 5
#define INP_E_Gear    4
#define OUT_E_BUZZER  3
#define INP_E_ElevDR  2


#define INP_E_AileDR  1
#define INP_E_ThrCt   0

#if (defined(JETI) || defined(FRSKY) || defined(ARDUPILOT) || defined(NMEA))
#undef INP_E_ThrCt
#undef INP_E_AileDR
#define INP_C_ThrCt   6
#define INP_C_AileDR  7
#endif




#define OUT_G_SIM_CTL  4 //1 : phone-jack=ppm_in
#define INP_G_ID1      3
#define INP_G_RF_POW   1
#define INP_G_RuddDR   0

#define SLAVE_MODE (PING & (1<<INP_G_RF_POW))

extern uint8_t SlaveMode ;

extern const prog_uint8_t APM modn12x3[] ;
extern const prog_char APM Str_OFF[] ;
extern const prog_char APM Str_ON[] ;

//extern const prog_uint8_t APM chout_ar[] ;
extern const prog_uint8_t APM bchout_ar[] ;

//convert from mode 1 to mode g_eeGeneral.stickMode
//NOTICE!  =>  1..4 -> 1..4
extern uint8_t convert_mode_helper(uint8_t x) ;

#define CONVERT_MODE(x)  (((x)<=4) ? convert_mode_helper(x) : (x))
//#define CHANNEL_ORDER(x) (pgm_read_byte(chout_ar + g_eeGeneral.templateSetup*4 + (x)-1))
#define CHANNEL_ORDER(x) ( ( (pgm_read_byte(bchout_ar + g_eeGeneral.templateSetup) >> (6-(x-1) * 2)) & 3 ) + 1 )
#define THR_STICK       (2-(g_eeGeneral.stickMode&1))
#define ELE_STICK       (1+(g_eeGeneral.stickMode&1))
#define AIL_STICK       ((g_eeGeneral.stickMode&2) ? 0 : 3)
#define RUD_STICK       ((g_eeGeneral.stickMode&2) ? 3 : 0)

enum EnumKeys {
    KEY_MENU ,
    KEY_EXIT ,
    KEY_DOWN ,
    KEY_UP  ,
    KEY_RIGHT ,
    KEY_LEFT ,
    TRM_LH_DWN  ,
    TRM_LH_UP   ,
    TRM_LV_DWN  ,
    TRM_LV_UP   ,
    TRM_RV_DWN  ,
    TRM_RV_UP   ,
    TRM_RH_DWN  ,
    TRM_RH_UP   ,
    //SW_NC     ,
    //SW_ON     ,
    SW_ThrCt  ,
    SW_RuddDR ,
    SW_ElevDR ,
    SW_ID0    ,
    SW_ID1    ,
    SW_ID2    ,
    SW_AileDR ,
    SW_Gear   ,
    SW_Trainer
}; 

#define SWITCHES_STR "THR""RUD""ELE""ID0""ID1""ID2""AIL""GEA""TRN""SW1""SW2""SW3""SW4""SW5""SW6""SW7""SW8""SW9""SWA""SWB""SWC"
#define NUM_CSW  12 //number of custom switches

#define CURV_STR "---x>0x<0|x|f>0f<0|f|c1 c2 c3 c4 c5 c6 c7 c8 c9 c10c11c12c13c14c15c16"
#define CURVE_BASE 7

#define CSWITCH_STR  "\007----   v>ofs  v<ofs  |v|>ofs|v|<ofsAND    OR     XOR    ""v1==v2 ""v1!=v2 ""v1>v2  ""v1<v2  ""v1>=v2 ""v1<=v2 "
//#define CSW_LEN_FUNC 7

#define CS_OFF       0
#define CS_VPOS      1  //v>offset
#define CS_VNEG      2  //v<offset
#define CS_APOS      3  //|v|>offset
#define CS_ANEG      4  //|v|<offset
#define CS_AND       5
#define CS_OR        6
#define CS_XOR       7
#define CS_EQUAL     8
#define CS_NEQUAL    9
#define CS_GREATER   10
#define CS_LESS      11
#define CS_EGREATER  12
#define CS_ELESS     13
#define CS_MAXF      13  //max function

#define CS_VOFS       0
#define CS_VBOOL      1
#define CS_VCOMP      2
#define CS_STATE(x)   ((x)<CS_AND ? CS_VOFS : ((x)<CS_EQUAL ? CS_VBOOL : CS_VCOMP))


const prog_char APM s_charTab[]=" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-.";
#define NUMCHARS (sizeof(s_charTab)-1)


//#define SW_BASE      SW_NC
#define SW_BASE      SW_ThrCt
#define SW_BASE_DIAG SW_ThrCt
//#define SWITCHES_STR "  NC  ON THR RUD ELE ID0 ID1 ID2 AILGEARTRNR"
#define MAX_DRSWITCH (1+SW_Trainer-SW_ThrCt+1+NUM_CSW)

#define SWP_RUD (SW_RuddDR-SW_BASE)
#define SWP_ELE (SW_ElevDR-SW_BASE)
#define SWP_AIL (SW_AileDR-SW_BASE)
#define SWP_THR (SW_ThrCt-SW_BASE)
#define SWP_GEA (SW_Gear-SW_BASE)

#define SWP_RUDB (1<<SWP_RUD)
#define SWP_ELEB (1<<SWP_ELE)
#define SWP_AILB (1<<SWP_AIL)
#define SWP_THRB (1<<SWP_THR)
#define SWP_GEAB (1<<SWP_GEA)

#define SWP_ID0 (SW_ID0-SW_BASE)
#define SWP_ID1 (SW_ID1-SW_BASE)
#define SWP_ID2 (SW_ID2-SW_BASE)
#define SWP_ID0B (1<<SWP_ID0)
#define SWP_ID1B (1<<SWP_ID1)
#define SWP_ID2B (1<<SWP_ID2)

//Switch Position Illigal states
#define SWP_IL1 (0)
#define SWP_IL2 (SWP_ID0B | SWP_ID1B)
#define SWP_IL3 (SWP_ID0B | SWP_ID2B)
#define SWP_IL4 (SWP_ID1B | SWP_ID2B)
#define SWP_IL5 (SWP_ID0B | SWP_ID1B | SWP_ID2B)

#define SWP_LEG1	(SWP_ID0B)
#define SWP_LEG2	(SWP_ID1B)
#define SWP_LEG3	(SWP_ID2B)


#define SWASH_TYPE_STR   "\006---   ""120   ""120X  ""140   ""90    "

#define SWASH_TYPE_120   1
#define SWASH_TYPE_120X  2
#define SWASH_TYPE_140   3
#define SWASH_TYPE_90    4
#define SWASH_TYPE_NUM   4

#define MIX_P1    5
#define MIX_P2    6
#define MIX_P3    7
#define MIX_MAX   8
#define MIX_FULL  9
#define MIX_CYC1  10
#define MIX_CYC2  11
#define MIX_CYC3  12

#define DR_HIGH   0
#define DR_MID    1
#define DR_LOW    2
#define DR_EXPO   0
#define DR_WEIGHT 1
#define DR_RIGHT  0
#define DR_LEFT   1
#define DR_DRSW1  99
#define DR_DRSW2  98

#define DSW_THR  1
#define DSW_RUD  2
#define DSW_ELE  3
#define DSW_ID0  4
#define DSW_ID1  5
#define DSW_ID2  6
#define DSW_AIL  7
#define DSW_GEA  8
#define DSW_TRN  9
#define DSW_SW1  10
#define DSW_SW2  11
#define DSW_SW3  12
#define DSW_SW4  13
#define DSW_SW5  14
#define DSW_SW6  15
#define DSW_SW7   16
#define DSW_SW8   17
#define DSW_SW9   18
#define DSW_SWA   19
#define DSW_SWB   20
#define DSW_SWC   21

#define SCROLL_TH 64
#define INACTIVITY_THRESHOLD 256
#define THRCHK_DEADBAND 16
#define SPLASH_TIMEOUT  (4*100)  //400 msec - 4 seconds

#define IS_THROTTLE(x)  (((2-(g_eeGeneral.stickMode&1)) == x) && (x<4))


#define NUM_KEYS TRM_RH_UP+1
#define TRM_BASE TRM_LH_DWN

//#define _MSK_KEY_FIRST (_MSK_KEY_REPT|0x20)
//#define EVT_KEY_GEN_BREAK(key) ((key)|0x20)
#define _MSK_KEY_REPT    0x40
#define _MSK_KEY_DBL     0x10
#define IS_KEY_BREAK(key)  (((key)&0xf0)        ==  0x20)
#define EVT_KEY_BREAK(key) ((key)|                  0x20)
#define EVT_KEY_FIRST(key) ((key)|    _MSK_KEY_REPT|0x20)
#define EVT_KEY_REPT(key)  ((key)|    _MSK_KEY_REPT     )
#define EVT_KEY_LONG(key)  ((key)|0x80)
#define EVT_KEY_DBL(key)   ((key)|_MSK_KEY_DBL)
//#define EVT_KEY_DBL(key)   ((key)|0x10)
#define EVT_ENTRY               (0xff - _MSK_KEY_REPT)
#define EVT_ENTRY_UP            (0xfe - _MSK_KEY_REPT)
#define EVT_KEY_MASK             0x0f

#define HEART_TIMER2Mhz 1;
#define HEART_TIMER10ms 2;

#define TMRMODE_NONE     0
#define TMRMODE_ABS      1
#define TMRMODE_THR      2
#define TMRMODE_THR_REL  3
#define MAX_ALERT_TIME   60

#define PROTO_PPM        0
#define PROTO_PXX        1
#define PROTO_DSM2       2
#define PROTO_PPM16	     3
#define PROTO_PPMSIM     4		// Always make this the last protocol
#define PROT_MAX         4
#define PROT_STR "PPM   PXX   DSM2  PPM16 PPMSIM"
#define PROT_STR_LEN     6
#define DSM2_STR "LP4/LP5  DSM2only DSM2/DSMX"
#define DSM2_STR_LEN     9
#define LPXDSM2          0
#define DSM2only         1
#define DSM2_DSMX        2

#define PXX_SEND_RXNUM     0x01
#define PXX_SEND_FAILSAFE  0x02

extern uint8_t pxxFlag;
extern uint8_t stickMoved;

typedef void (*MenuFuncP)(uint8_t event);
typedef void (*getADCp)();

/// stoppt alle events von dieser taste bis eine kurze Zeit abgelaufen ist
void pauseEvents(uint8_t enuk);
/// liefert die Zahl der schnellen Wiederholungen dieser Taste
uint8_t getEventDbl(uint8_t event);
/// stoppt alle events von dieser taste bis diese wieder losgelassen wird
void    killEvents(uint8_t enuk);
/// liefert den Wert einer beliebigen Taste KEY_MENU..SW_Trainer
bool    keyState(EnumKeys enuk);
/// Liefert das naechste Tasten-Event, auch trim-Tasten.
/// Das Ergebnis hat die Form:
/// EVT_KEY_BREAK(key), EVT_KEY_FIRST(key), EVT_KEY_REPT(key) oder EVT_KEY_LONG(key)
uint8_t getEvent();
void putEvent(uint8_t evt);


/// goto given Menu, but substitute current menu in menuStack
void    chainMenu(MenuFuncP newMenu);
/// goto given Menu, store current menu in menuStack
void    pushMenu(MenuFuncP newMenu);
///deliver address of last menu which was popped from
MenuFuncP lastPopMenu();
/// return to last menu in menustack
/// if uppermost is set true, thenmenu return to uppermost menu in menustack
void    popMenu(bool uppermost=false);
/// Gibt Alarm Maske auf lcd aus.
/// Die Maske wird so lange angezeigt bis eine beliebige Taste gedrueckt wird.
void alert(const prog_char * s, bool defaults=false);
void message(const prog_char * s);
/// periodisches Hauptprogramm
void    perMain();
/// Bearbeitet alle zeitkritischen Jobs.
/// wie z.B. einlesen aller Eingaenge, Entprellung, Key-Repeat..
void    per10ms();
/// Erzeugt periodisch alle Outputs ausser Bildschirmausgaben.
void zeroVariables();
void mainSequence() ;

#define NO_TRAINER 0x01
#define NO_INPUT   0x02
void perOut(int16_t *chanOut, uint8_t att);
///   Liefert den Zustand des Switches 'swtch'. Die Numerierung erfolgt ab 1
///   (1=SW_ON, 2=SW_ThrCt, 10=SW_Trainer). 0 Bedeutet not conected.
///   Negative Werte  erzeugen invertierte Ergebnisse.
///   Die Funktion putsDrSwitches(..) erzeugt den passenden Ausdruck.
///
///   \param swtch
///     0                : not connected. Liefert den Wert 'nc'
///     1.. MAX_DRSWITCH : SW_ON .. SW_Trainer
///    -1..-MAX_DRSWITCH : negierte Werte
///   \param nc Wert, der bei swtch==0 geliefert wird.
bool    getSwitch(int8_t swtch, bool nc, uint8_t level=0);
/// Zeigt den Namen des Switches 'swtch' im display an
///   \param x     x-koordinate 0..127
///   \param y     y-koordinate 0..63 (nur durch 8 teilbar)
///   \param swtch -MAX_DRSWITCH ..  MAX_DRSWITCH
///   \param att   NO_INV,INVERS,BLINK
///
void putsDrSwitches(uint8_t x,uint8_t y,int8_t swtch,uint8_t att);
void putsTmrMode(uint8_t x, uint8_t y, uint8_t attr, uint8_t type);

extern uint8_t  s_timerState;
#define TMR_OFF     0
#define TMR_RUNNING 1
#define TMR_BEEPING 2
#define TMR_STOPPED 3
void resetTimer();

extern uint8_t Timer2_running ;
extern int16_t s_timerVal[] ;
void resetTimer2() ;

const prog_char *get_switches_string() ;
const prog_char *get_curve_string() ;

extern uint8_t heartbeat;

uint8_t char2idx(char c);
char idx2char(uint8_t idx);

void checkMem();
void checkTHR();
///   Pr�ft beim Einschalten ob alle Switches 'off' sind.
void checkSwitches();
void checkQuickSelect(); // Quick model select on startup

#define EE_GENERAL 1
#define EE_MODEL   2
#define EE_TRIM    4           // Store model because of trim

extern bool    checkIncDec_Ret;//global helper vars
extern uint8_t s_editMode;     //global editmode

/// Bearbeite alle events die zum gewaehlten mode passen.
/// KEY_LEFT u. KEY_RIGHT
/// oder KEY_UP u. KEY_DOWN falls _FL_VERT in i_flags gesetzt ist.
/// Dabei wird der Wert der Variablen i_pval unter Beachtung der Grenzen
/// i_min und i_max veraendet.
/// i_pval hat die Groesse 1Byte oder 2Bytes falls _FL_SIZE2  in i_flags gesetzt ist
/// falls EE_GENERAL oder EE_MODEL in i_flags gesetzt ist wird bei Aenderung
/// der Variablen zusaetzlich eeDirty() aufgerufen.
/// Als Bestaetigung wird beep() aufgerufen bzw. audio.warn() wenn die Stellgrenze erreicht wird.
int16_t checkIncDec16(uint8_t event, int16_t i_pval, int16_t i_min, int16_t i_max, uint8_t i_flags);
int8_t checkIncDec(uint8_t event, int8_t i_val, int8_t i_min, int8_t i_max, uint8_t i_flags);
int8_t checkIncDec_hm(uint8_t event, int8_t i_val, int8_t i_min, int8_t i_max);
int8_t checkIncDec_vm(uint8_t event, int8_t i_val, int8_t i_min, int8_t i_max);
int8_t checkIncDec_hg(uint8_t event, int8_t i_val, int8_t i_min, int8_t i_max);

#define CHECK_INCDEC_H_GENVAR( event, var, min, max)     \
    var = checkIncDec_hg(event,var,min,max)

#define CHECK_INCDEC_H_MODELVAR( event, var, min, max)     \
    var = checkIncDec_hm(event,var,min,max)

#define STORE_MODELVARS_TRIM   eeDirty(EE_MODEL|EE_TRIM)
#define STORE_MODELVARS   eeDirty(EE_MODEL)
#define STORE_GENERALVARS eeDirty(EE_GENERAL)
#define BACKLIGHT_ON    PORTB |=  (1<<OUT_B_LIGHT)
#define BACKLIGHT_OFF   PORTB &= ~(1<<OUT_B_LIGHT)

#define SPY_ON    //PORTB |=  (1<<OUT_B_LIGHT)
#define SPY_OFF   //PORTB &= ~(1<<OUT_B_LIGHT)


#define PULSEGEN_ON     TIMSK |=  (1<<OCIE1A)
#define PULSEGEN_OFF    TIMSK &= ~(1<<OCIE1A)

#define BITMASK(bit) (1<<(bit))

//#define PPM_CENTER 1200*2
//extern int16_t PPM_range ;
//extern uint16_t PPM_gap;
//extern uint16_t PPM_frame ;

/// liefert Dimension eines Arrays
#define DIM(arr) (sizeof((arr))/sizeof((arr)[0]))

/// liefert Betrag des Arguments
template<class t> inline t abs(t a){ return a>0?a:-a; }
/// liefert das Minimum der Argumente
template<class t> inline t min(t a, t b){ return a<b?a:b; }
/// liefert das Maximum der Argumente
template<class t> inline t max(t a, t b){ return a>b?a:b; }
template<class t> inline int8_t sgn(t a){ return a>0 ? 1 : (a < 0 ? -1 : 0); }
template<class t> inline t limit(t mi, t x, t ma){ return min(max(mi,x),ma); }

/// Markiert einen EEPROM-Bereich als dirty. der Bereich wird dann in
/// eeCheck ins EEPROM zurueckgeschrieben.
void eeWriteBlockCmp(const void *i_pointer_ram, uint16_t i_pointer_eeprom, size_t size);
void eeWaitComplete();
void eeDirty(uint8_t msk);
void eeCheck(bool immediately=false);
//void eeWriteGeneral();
void eeReadAll();
void eeLoadModelName(uint8_t id,char*buf,uint8_t len);
//uint16_t eeFileSize(uint8_t id);
void eeLoadModel(uint8_t id);
//void eeSaveModel(uint8_t id);
bool eeDuplicateModel(uint8_t id);
bool eeModelExists(uint8_t id);

#define NUM_PPM     8
//number of real outputchannels CH1-CH16
#define NUM_CHNOUT  16
///number of real input channels (1-9) plus virtual input channels X1-X4
#define PPM_BASE    MIX_CYC3
#define CHOUT_BASE  (PPM_BASE+NUM_PPM)


#define NUM_XCHNRAW (CHOUT_BASE+NUM_CHNOUT) // NUMCH + P1P2P3+ AIL/RUD/ELE/THR + MAX/FULL + CYC1/CYC2/CYC3
///number of real output channels (CH1-CH8) plus virtual output channels X1-X4
#define NUM_XCHNOUT (NUM_CHNOUT) //(NUM_CHNOUT)//+NUM_VIRT)

//#define MAX_CHNRAW 8
/// Schreibt [RUD ELE THR AIL P1 P2 P3 MAX] aufs lcd
void putsChnRaw(uint8_t x,uint8_t y,uint8_t idx1,uint8_t att);
//#define MAX_CHN 8

/// Schreibt [CH1 CH2 CH3 CH4 CH5 CH6 CH7 CH8] aufs lcd
void putsChn(uint8_t x,uint8_t y,uint8_t idx1,uint8_t att);
/// Schreibt die Batteriespannung aufs lcd
void putsVolts(uint8_t x,uint8_t y, uint8_t volts, uint8_t att);
void putsVBat(uint8_t x,uint8_t y,uint8_t att);
void putsTime(uint8_t x,uint8_t y,int16_t tme,uint8_t att,uint8_t att2);

#ifdef FRSKY
void putsTelemetry(uint8_t x, uint8_t y, uint8_t val, uint8_t unit, uint8_t att);
void putsTelemValue(uint8_t x, uint8_t y, uint8_t val, uint8_t channel, uint8_t att, uint8_t scale) ;
#endif

extern inline int16_t calc100toRESX(int8_t x)
{
    return ((x*41)>>2) - x/64;
}

uint8_t getMixerCount();
bool reachMixerCountLimit();
void menuMixersLimit(uint8_t event);

extern inline int16_t calc1000toRESX(int16_t x)  // improve calc time by Pat MacKenzie
{
    int16_t y = x>>5;
    x+=y;
    y=y>>2;
    x-=y;
    return x+(y>>2);
    //  return x + x/32 - x/128 + x/512;
}

extern volatile uint16_t g_tmr10ms;
extern volatile uint8_t g8_tmr10ms;

extern inline uint16_t get_tmr10ms()
{
    uint16_t time  ;
    cli();
    time = g_tmr10ms ;
    sei();
    return time ;
}



#define TMR_VAROFS  16

#define SUB_MODE_V     1
#define SUB_MODE_H     2
#define SUB_MODE_H_DBL 3
//uint8_t checkSubGen(uint8_t event,uint8_t num, uint8_t sub, uint8_t mode);

void menuProcLimits(uint8_t event);
void menuProcMixOne(uint8_t event);
void menuProcMix(uint8_t event);
void menuProcCurve(uint8_t event);
void menuProcTrim(uint8_t event);
void menuProcExpoOne(uint8_t event);
void menuProcExpoAll(uint8_t event);
void menuProcModel(uint8_t event);
void menuProcHeli(uint8_t event);
void menuProcDiagCalib(uint8_t event);
void menuProcDiagAna(uint8_t event);
void menuProcDiagKeys(uint8_t event);
void menuProcDiagVers(uint8_t event);
void menuProcTrainer(uint8_t event);
void menuProcSetup(uint8_t event);
void menuProcMain(uint8_t event);
void menuProcModelSelect(uint8_t event);
void menuProcTemplates(uint8_t event);
void menuProcSwitches(uint8_t event);
void menuProcSafetySwitches(uint8_t event);
#ifdef FRSKY
void menuProcTelemetry(uint8_t event);
void menuProcTelemetry2(uint8_t event);
#endif

void menuProcStatistic2(uint8_t event);
void menuProcStatistic(uint8_t event);
void menuProc0(uint8_t event);

extern void setupPulses();

void initTemplates();

extern int16_t intpol(int16_t, uint8_t);

//extern uint16_t s_ana[8];
extern uint16_t anaIn(uint8_t chan);
extern int16_t calibratedStick[7];
extern int16_t ex_chans[NUM_CHNOUT];

void getADC_single();
void getADC_osmp();
void getADC_filt();

void checkTHR();


#ifdef JETI
// Jeti-DUPLEX Telemetry
extern uint16_t jeti_keys;
#include "jeti.h"
#endif

#ifdef FRSKY
// FrSky Telemetry
#include "frsky.h"
#endif

#ifdef ARDUPILOT
// ArduPilot Telemetry
#include "ardupilot.h"
#endif

#ifdef NMEA
// NMEA Telemetry
#include "nmea.h"
#endif

//extern TrainerData g_trainer;
//extern uint16_t           g_anaIns[8];
extern uint8_t            g_vbat100mV;
extern volatile uint8_t   g_blinkTmr10ms;
extern uint8_t            g_beepCnt;
//extern uint8_t            g_beepVal[5];
//extern const PROGMEM char modi12x3[];
extern union p2mhz_t pulses2MHz ;
extern int16_t            g_ppmIns[8];
extern int16_t            g_chans512[NUM_CHNOUT];
extern volatile uint8_t   tick10ms;

extern int16_t BandGap ; // VccV ;
extern uint8_t Ee_lock ;

// Bit masks in Ee_lock
#define EE_LOCK      1
#define EE_TRIM_LOCK 2

#include "lcd.h"
extern const char stamp1[];
extern const char stamp2[];
extern const char stamp3[];
extern const char stamp4[];
extern const char stamp5[];
#include "myeeprom.h"

extern const prog_uchar APM s9xsplashMarker[] ;
extern const prog_uchar APM s9xsplash[] ;

extern const prog_char APM Str_telemItems[] ;
extern const prog_int8_t APM TelemIndex[] ;
extern int16_t convertTelemConstant( int8_t channel, int8_t value) ;

#ifdef FRSKY
#define NUM_TELEM_ITEMS 16
#else
#define NUM_TELEM_ITEMS 2
#endif

#define FLASH_DURATION 50

//extern uint8_t  beepAgain;
extern uint16_t g_LightOffCounter;


#define sysFLAG_OLD_EEPROM (0x01)
extern uint8_t sysFlags;

//audio settungs are external to keep out clutter!
#include "audio.h"

#endif // er9x_h
/*eof*/



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

#ifdef SIMU
bool lcd_refresh = true;
uint8_t lcd_buf[DISPLAY_W*DISPLAY_H/8];
#endif

uint8_t lcd_lastPos;

uint8_t displayBuf[DISPLAY_W*DISPLAY_H/8];
#define DISPLAY_END (displayBuf+sizeof(displayBuf))
const
#include "font.lbm"
#define font_5x8_x20_x7f (font+3)

const
#include "font_dblsize.lbm"
#define font_10x16_x20_x7f (font_dblsize+3)

void lcd_clear()
{
  //for(unsigned i=0; i<sizeof(displayBuf); i++) displayBuf[i]=0;
  memset(displayBuf, 0, sizeof(displayBuf));
}


void lcd_img(uint8_t i_x,uint8_t i_y,const prog_uchar * imgdat,uint8_t idx,uint8_t mode)
{
  const prog_uchar  *q = imgdat;
  uint8_t w    = pgm_read_byte(q++);
  uint8_t hb   = (pgm_read_byte(q++)+7)/8;
  uint8_t sze1 = pgm_read_byte(q++);
  q += idx*sze1;
  bool    inv  = (mode & INVERS) ? true : (mode & BLINK ? BLINK_ON_PHASE : false);
  for(uint8_t yb = 0; yb < hb; yb++){
    uint8_t   *p = &displayBuf[ (i_y / 8 + yb) * DISPLAY_W + i_x ];
    for(uint8_t x=0; x < w; x++){
      uint8_t b = pgm_read_byte(q++);
      *p++ = inv ? ~b : b;
    }
  }
}

uint8_t lcd_putc(uint8_t x,uint8_t y,const char c)
{
  return lcd_putcAtt(x,y,c,0);
}

/// invers: 0 no 1=yes 2=blink
uint8_t lcd_putcAtt(uint8_t x,uint8_t y,const char c,uint8_t mode)
{
    uint8_t *p    = &displayBuf[ y / 8 * DISPLAY_W + x ];
    //uint8_t *pmax = &displayBuf[ DISPLAY_H/8 * DISPLAY_W ];
		if ( c < 22 )		// Move to specific x position (c)*FW
		{
			x = c * FW ;
  		if(mode&DBLSIZE)
			{
				x += x ;
			}
			return x ;
		}
		x += FW ;
    const prog_uchar    *q = &font_5x8_x20_x7f[(c-0x20)*5];
    bool         inv = (mode & INVERS) ? true : (mode & BLINK ? BLINK_ON_PHASE : false);
    if(mode&DBLSIZE)
    {
			if ( (c!=0x2E)) x+=FW; //check for decimal point
	/* each letter consists of ten top bytes followed by
	 * five bottom by ten bottom bytes (20 bytes per 
	 * char) */
        q = &font_10x16_x20_x7f[(c-0x20)*10 + ((c-0x20)/16)*160];
        for(char i=5; i>=0; i--){
	    /*top byte*/
            uint8_t b1 = i>0 ? pgm_read_byte(q) : 0;
	    /*bottom byte*/
            uint8_t b3 = i>0 ? pgm_read_byte(160+q) : 0;
	    /*top byte*/
            uint8_t b2 = i>0 ? pgm_read_byte(++q) : 0;
	    /*bottom byte*/
            uint8_t b4 = i>0 ? pgm_read_byte(160+q) : 0;
            q++;
            if(inv) {
                b1=~b1;
                b2=~b2;
                b3=~b3;
                b4=~b4;
            }

            if(&p[DISPLAY_W+1] < DISPLAY_END){
                p[0]=b1;
                p[1]=b2;
                p[DISPLAY_W] = b3;
                p[DISPLAY_W+1] = b4;
                p+=2;
            }
        }
//        q = &dbl_font[(c-0x20)*20];
//        for(char i=0; i<10; i++){
//            uint8_t b = pgm_read_byte(q++);
//            if((p+DISPLAY_W)<DISPLAY_END) *(p+DISPLAY_W) = inv ? ~b : b;
//            b = pgm_read_byte(q++);
//            if(p<DISPLAY_END) *p = inv ? ~b : b;
//            p++;
//        }
//        if(p<DISPLAY_END) *p = inv ? ~0 : 0;
//        if((p+DISPLAY_W)<DISPLAY_END) *(p+DISPLAY_W) = inv ? ~0 : 0;
    }
    else
    {
        uint8_t condense=0;

        if (mode & CONDENSED) {
            *p++ = inv ? ~0 : 0;
            condense=1;
	    	x += FW-FWNUM ;
	}

        for(char i=5; i!=0; i--){
            uint8_t b = pgm_read_byte(q++);
    	    if (condense && i==4) {
                /*condense the letter by skipping column 4 */
                continue;
            }
            if(p<DISPLAY_END) *p++ = inv ? ~b : b;
        }
        if(p<DISPLAY_END) *p++ = inv ? ~0 : 0;
    }
		return x ;
}

// Puts sub-string from string options
// First byte of string is sub-string length
// idx is index into string (in length units)
// Output length characters
void lcd_putsAttIdx(uint8_t x,uint8_t y,const prog_char * s,uint8_t idx,uint8_t att)
{
	uint8_t length ;
	length = pgm_read_byte(s++) ;

  lcd_putsnAtt(x,y,s+length*idx,length,att) ;
}


//uint8_t lcd_putsnAtt(uint8_t x,uint8_t y,const prog_char * s,uint8_t len,uint8_t mode)
void lcd_putsnAtt(uint8_t x,uint8_t y,const prog_char * s,uint8_t len,uint8_t mode)
{
	uint8_t source ;
//	uint8_t size ;
	source = mode & BSS ;
//	size = mode & DBLSIZE ;
  while(len!=0) {
    char c = (source) ? *s++ : pgm_read_byte(s++);
    x = lcd_putcAtt(x,y,c,mode);
//    x+=FW;
//		if ((size)&& (c!=0x2E)) x+=FW; //check for decimal point
    len--;
  }
}
void lcd_putsn_P(uint8_t x,uint8_t y,const prog_char * s,uint8_t len)
{
  lcd_putsnAtt( x,y,s,len,0);
}

//uint8_t lcd_puts2Att(uint8_t x,uint8_t y,const prog_char * s,const prog_char * t ,uint8_t mode)
//{
//	x = lcd_putsAtt( x, y, s, mode ) ;
//	return lcd_putsAtt( x, y, t, mode ) ;	
//}

uint8_t lcd_putsAtt(uint8_t x,uint8_t y,const prog_char * s,uint8_t mode)
{
	uint8_t source ;
//	uint8_t size ;
	source = mode & BSS ;
//	size = mode & DBLSIZE ;
  //while(char c=pgm_read_byte(s++)) {
  while(1) {
    char c = (source) ? *s++ : pgm_read_byte(s++);
    if(!c) break;
    x = lcd_putcAtt(x,y,c,mode);
//    x+=FW;
//		if ((size)&& (c!=0x2E)) x+=FW; //check for decimal point
  }
  return x;
}

void lcd_puts_Pleft(uint8_t y,const prog_char * s)
{
  lcd_putsAtt( 0, y, s, 0);
}

void lcd_puts_P(uint8_t x,uint8_t y,const prog_char * s)
{
  lcd_putsAtt( x, y, s, 0);
}
void lcd_outhex4(uint8_t x,uint8_t y,uint16_t val)
{
  x+=FWNUM*4;
  for(int i=0; i<4; i++)
  {
    x-=FWNUM;
    char c = val & 0xf;
    c = c>9 ? c+'A'-10 : c+'0';
    lcd_putcAtt(x,y,c,c>='A'?CONDENSED:0);
    val>>=4;
  }
}
void lcd_outdez(uint8_t x,uint8_t y,int16_t val)
{
  lcd_outdezAtt(x,y,val,0);
}

void lcd_outdezAtt(uint8_t x,uint8_t y,int16_t val,uint8_t mode)
{
  lcd_outdezNAtt( x,y,val,mode,5);
}

#define PREC(n) ((n&0x20) ? ((n&0x10) ? 2 : 1) : 0)
void lcd_outdezNAtt(uint8_t x,uint8_t y,int32_t val,uint8_t mode,int8_t len)
{
  uint8_t fw = FWNUM;
  uint8_t prec = PREC(mode);
	uint8_t negative = 0 ;
  uint8_t xn = 0;
  uint8_t ln = 2;
  char c;
  uint8_t xinc ;
	uint8_t fullwidth = 0 ;
	if ( len < 0 )
	{
		fullwidth = 1 ;
		len = -len ;		
	}

  if ( val < 0 )
	{
		val = -val ;
		negative = 1 ;
	}

  if (mode & DBLSIZE)
  {
    fw += FWNUM ;
    xinc = 2*FWNUM;
    lcd_lastPos = 2*FW;
  }
  else
  {
    xinc = FWNUM ;
    lcd_lastPos = FW;
  }

  if (mode & LEFT) {
//    if (val >= 10000)
//      x += fw;
    if(negative)
    {
      x += fw;
    }
    if (val >= 1000)
      x += fw;
    if (val >= 100)
      x += fw;
    if (val >= 10)
      x += fw;
    if ( prec )
    {
      if ( prec == 2 )
      {
        if ( val < 100 )
        {
          x += fw;
        }
      }
      if ( val < 10 )
      {
        x+= fw;
      }
    }
  }
  else
  {
    x -= xinc;
  }
  lcd_lastPos += x ;

  if ( prec == 2 )
  {
    mode -= LEADING0;  // Can't have PREC2 and LEADING0
  }

  for (uint8_t i=1; i<=len; i++) {
    c = (val % 10) + '0';
    lcd_putcAtt(x, y, c, mode);
    if (prec==i) {
      if (mode & DBLSIZE) {
        xn = x;
        if(c=='2' || c=='3' || c=='1') ln++;
        uint8_t tn = (val/10) % 10;
        if(tn==2 || tn==4) {
          if (c=='4') {
            xn++;
          }
          else {
            xn--; ln++;
          }
        }
      }
      else {
        x -= 2;
        if (mode & INVERS)
          lcd_vline(x+1, y, 7);
        else
          lcd_plot(x+1, y+6);
      }
      if (val >= 10)
        prec = 0;
    }
    val /= 10;
    if (!val)
    {
      if (prec)
      {
        if ( prec == 2 )
        {
          if ( i > 1 )
          {
            prec = 0 ;
          }
        }
        else
        {
          prec = 0 ;
        }
      }
      else if (mode & LEADING0)
			{
				if ( fullwidth == 0 )
				{
        	mode -= LEADING0;
				}
			}
      else
        break;
    }
    x-=fw;
  }
  if (xn) {
    lcd_hline(xn, y+2*FH-4, ln);
    lcd_hline(xn, y+2*FH-3, ln);
  }
  if(negative) lcd_putcAtt(x-fw,y,'-',mode);
}

void lcd_hbar( uint8_t x, uint8_t y, uint8_t w, uint8_t h, uint8_t percent )
{
	uint8_t solid ;
	if ( percent > 100 )
	{
		percent = 100 ;
	}
	solid = (w-2) * percent / 100 ;
	lcd_rect( x, y, w, h ) ;

	if ( solid )
	{
		w = y + h - 1 ;
		y += 1 ;
		x += 1 ;
		while ( y < w )
		{
 			lcd_hline(x, y, solid ) ;
			y += 1 ;			
		}
	}
}

void lcd_rect(uint8_t x, uint8_t y, uint8_t w, uint8_t h )
{
  lcd_vline(x, y, h ) ;
	if ( w > 1 )
	{
  	lcd_vline(x+w-1, y, h ) ;
	}
 	lcd_hline(x+1, y+h-1, w-2 ) ;
 	lcd_hline(x+1, y, w-2 ) ;
}

void lcd_plot(uint8_t x,uint8_t y)
{
  //  if(y>=64)  return;
  //  if(x>=128) return;
  //  displayBuf[ y / 8 * DISPLAY_W + x ] ^= BITMASK(y%8);
  uint8_t *p   = &displayBuf[ y / 8 * DISPLAY_W + x ];
  if(p<DISPLAY_END) *p ^= BITMASK(y%8);
}
void lcd_hlineStip(unsigned char x,unsigned char y, signed char w,uint8_t pat)
{
  if(w<0) {x+=w; w=-w;}
  uint8_t *p  = &displayBuf[ y / 8 * DISPLAY_W + x ];
  uint8_t msk = BITMASK(y%8);
  while(w){
    if ( p>=DISPLAY_END)
    {
      break ;			
    }
    if(pat&1) {
      //lcd_plot(x,y);
      *p ^= msk;
      pat = (pat >> 1) | 0x80;
    }else{
      pat = pat >> 1;
    }
    w--;
    p++;
  }
}

void lcd_hline(uint8_t x,uint8_t y, int8_t w)
{
  lcd_hlineStip(x,y,w,0xff);
}

void lcd_vline(uint8_t x,uint8_t y, int8_t h)
{
//    while ((y+h)>=DISPLAY_H) h--;
    uint8_t *p  = &displayBuf[ y / 8 * DISPLAY_W + x ];
    uint8_t *q  = &displayBuf[ (y+h) / 8 * DISPLAY_W + x ];
    *p ^= ~(BITMASK(y%8)-1);
    while(p<q){
        p  += DISPLAY_W;
        if ( p>=DISPLAY_END)
        {
          break ;			
        }
        *p ^= 0xff;
    }
    if(p<DISPLAY_END) *p ^= ~(BITMASK((y+h)%8)-1);
}


void lcdSendCtl(uint8_t val)
{
  PORTC_LCD_CTRL &= ~(1<<OUT_C_LCD_CS1);
  PORTC_LCD_CTRL &= ~(1<<OUT_C_LCD_A0);
  PORTC_LCD_CTRL &= ~(1<<OUT_C_LCD_RnW);
  PORTA_LCD_DAT = val;
  PORTC_LCD_CTRL |=  (1<<OUT_C_LCD_E);
  PORTC_LCD_CTRL &= ~(1<<OUT_C_LCD_E);
  PORTC_LCD_CTRL |=  (1<<OUT_C_LCD_A0);
  PORTC_LCD_CTRL |=  (1<<OUT_C_LCD_CS1);
}


#define delay_1us() _delay_us(1)
void delay_1_5us(int ms)
{
  for(int i=0; i<ms; i++) delay_1us();
}


void lcd_init()
{
  // /home/thus/txt/datasheets/lcd/KS0713.pdf
  // ~/txt/flieger/ST7565RV17.pdf  from http://www.glyn.de/content.asp?wdid=132&sid=

  PORTC_LCD_CTRL &= ~(1<<OUT_C_LCD_RES);  //LCD_RES
  delay_1us();
  delay_1us();//    f520  call  0xf4ce  delay_1us() ; 0x0xf4ce
  PORTC_LCD_CTRL |= (1<<OUT_C_LCD_RES); //  f524  sbi 0x15, 2 IOADR-PORTC_LCD_CTRL; 21           1
  delay_1_5us(1500);
  lcdSendCtl(0xe2); //Initialize the internal functions
  lcdSendCtl(0xae); //DON = 0: display OFF
  lcdSendCtl(0xa1); //ADC = 1: reverse direction(SEG132->SEG1)
  lcdSendCtl(0xA6); //REV = 0: non-reverse display
  lcdSendCtl(0xA4); //EON = 0: normal display. non-entire
  lcdSendCtl(0xA2); // Select LCD bias=0
  lcdSendCtl(0xC0); //SHL = 0: normal direction (COM1->COM64)
  lcdSendCtl(0x2F); //Control power circuit operation VC=VR=VF=1
  lcdSendCtl(0x25); //Select int resistance ratio R2 R1 R0 =5
  lcdSendCtl(0x81); //Set reference voltage Mode
  lcdSendCtl(0x22); // 24 SV5 SV4 SV3 SV2 SV1 SV0 = 0x18
  lcdSendCtl(0xAF); //DON = 1: display ON
  g_eeGeneral.contrast = 0x22;
}
void lcdSetRefVolt(uint8_t val)
{
  lcdSendCtl(0x81);
  lcdSendCtl(val);
}

volatile uint8_t LcdLock ;
volatile uint8_t LcdTrims ;
uint8_t LcdTrimSwapped ;


void refreshDiplay()
{
#ifdef SIMU
  memcpy(lcd_buf, displayBuf, sizeof(displayBuf));
  lcd_refresh = true;
#else

  uint8_t *p=displayBuf;
  for(uint8_t y=0; y < 8; y++) {
    lcdSendCtl(0x04);
    lcdSendCtl(0x10); //column addr 0
    lcdSendCtl( y | 0xB0); //page addr y
    
		PORTC_LCD_CTRL &= ~(1<<OUT_C_LCD_CS1);
    PORTC_LCD_CTRL |=  (1<<OUT_C_LCD_A0);
    PORTC_LCD_CTRL &= ~(1<<OUT_C_LCD_RnW);
		
    for(uint8_t x=32; x>0; x--){
//      lcdSendDat(*p);
      PORTA_LCD_DAT = *p++;
      PORTC_LCD_CTRL |=  (1<<OUT_C_LCD_E);
      PORTC_LCD_CTRL &= ~(1<<OUT_C_LCD_E);
      PORTA_LCD_DAT = *p++;
      PORTC_LCD_CTRL |=  (1<<OUT_C_LCD_E);
      PORTC_LCD_CTRL &= ~(1<<OUT_C_LCD_E);
      PORTA_LCD_DAT = *p++;
      PORTC_LCD_CTRL |=  (1<<OUT_C_LCD_E);
      PORTC_LCD_CTRL &= ~(1<<OUT_C_LCD_E);
      PORTA_LCD_DAT = *p++;
      PORTC_LCD_CTRL |=  (1<<OUT_C_LCD_E);
      PORTC_LCD_CTRL &= ~(1<<OUT_C_LCD_E);
//      p++;
    }
    PORTC_LCD_CTRL |=  (1<<OUT_C_LCD_A0);
    PORTC_LCD_CTRL |=  (1<<OUT_C_LCD_CS1);
  }
#endif
}

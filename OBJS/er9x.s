	.file	"er9x.cpp"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__CCP__  = 0x34
__tmp_reg__ = 0
__zero_reg__ = 1
	.global __do_copy_data
	.global __do_clear_bss
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.text
.Ltext0:
.global	_Z11lastPopMenuv
	.type	_Z11lastPopMenuv, @function
_Z11lastPopMenuv:
.LFB29:
.LM1:
/* prologue: function */
/* frame size = 0 */
.LM2:
	lds r30,g_menuStackPtr
	ldi r31,lo8(0)
	lsl r30
	rol r31
	subi r30,lo8(-(g_menuStack+2))
	sbci r31,hi8(-(g_menuStack+2))
.LM3:
	ld r24,Z
	ldd r25,Z+1
/* epilogue start */
	ret
.LFE29:
	.size	_Z11lastPopMenuv, .-_Z11lastPopMenuv
.global	_Z9chainMenuPFvhE
	.type	_Z9chainMenuPFvhE, @function
_Z9chainMenuPFvhE:
.LFB31:
.LM4:
.LVL0:
/* prologue: function */
/* frame size = 0 */
	movw r30,r24
.LM5:
	lds r26,g_menuStackPtr
	ldi r27,lo8(0)
	lsl r26
	rol r27
	subi r26,lo8(-(g_menuStack))
	sbci r27,hi8(-(g_menuStack))
	st X+,r30
	st X,r31
.LM6:
	ldi r24,lo8(-65)
.LVL1:
	icall
.LVL2:
.LBB104:
.LBB105:
.LM7:
	lds r24,g_beepVal
	sts g_beepCnt,r24
/* epilogue start */
.LBE105:
.LBE104:
.LM8:
	ret
.LFE31:
	.size	_Z9chainMenuPFvhE, .-_Z9chainMenuPFvhE
.global	_Z5anaInh
	.type	_Z5anaInh, @function
_Z5anaInh:
.LFB41:
.LM9:
.LVL3:
/* prologue: function */
/* frame size = 0 */
.LBB106:
.LBB107:
.LM10:
	mov r30,r24
	ldi r31,lo8(0)
.LVL4:
	subi r30,lo8(-(_ZZ5anaInhE8crossAna))
	sbci r31,hi8(-(_ZZ5anaInhE8crossAna))
.LVL5:
/* #APP */
 ;  534 "../src/er9x.cpp" 1
	lpm r30, Z
	
 ;  0 "" 2
.LVL6:
/* #NOAPP */
.LBE107:
	ldi r31,lo8(0)
.LVL7:
	lsl r30
	rol r31
.LVL8:
	subi r30,lo8(-(_ZL9s_anaFilt))
	sbci r31,hi8(-(_ZL9s_anaFilt))
.LVL9:
.LBB108:
.LBB109:
.LBB110:
.LM11:
	in r24,__SREG__
.LM12:
/* #APP */
 ;  519 "../src/er9x.cpp" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE110:
.LBE109:
.LBE108:
.LM13:
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
.LVL10:
.LBB111:
.LBB112:
.LM14:
	sbrs r24,7
	rjmp .L6
/* #APP */
 ;  522 "../src/er9x.cpp" 1
	sei
 ;  0 "" 2
/* #NOAPP */
.L6:
.LBE112:
.LBE111:
.LBE106:
.LM15:
	movw r24,r30
/* epilogue start */
	ret
.LFE41:
	.size	_Z5anaInh, .-_Z5anaInh
.global	__vector_21
	.type	__vector_21, @function
__vector_21:
.LFB42:
.LM16:
	sei
	push __zero_reg__
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
	push r19
	push r20
	push r22
	push r23
	push r24
	push r25
	push r26
	push r27
	push r30
	push r31
/* prologue: Interrupt */
/* frame size = 0 */
.LBB113:
.LM17:
	out 38-32,__zero_reg__
.LM18:
	lds r20,_ZZ11__vector_21E4chan
	mov r30,r20
	ldi r31,lo8(0)
	lsl r30
	rol r31
	movw r26,r30
	subi r26,lo8(-(_ZZ11__vector_21E5s_ana))
	sbci r27,hi8(-(_ZZ11__vector_21E5s_ana))
	ld r24,X+
	ld r25,X
	sbiw r26,1
	movw r22,r24
	ldi r19,4
1:	lsr r23
	ror r22
	dec r19
	brne 1b
	subi r30,lo8(-(_ZL9s_anaFilt))
	sbci r31,hi8(-(_ZL9s_anaFilt))
	std Z+1,r23
	st Z,r22
.LM19:
	in r18,36-32
	in r19,(36)+1-32
	add r24,r18
	adc r25,r19
	sub r24,r22
	sbc r25,r23
	st X+,r24
	st X,r25
.LM20:
	subi r20,lo8(-(1))
	andi r20,lo8(7)
	sts _ZZ11__vector_21E4chan,r20
.LM21:
	ori r20,lo8(64)
	out 39-32,r20
.LM22:
	ldi r24,lo8(-49)
	out 38-32,r24
/* epilogue start */
.LBE113:
.LM23:
	pop r31
	pop r30
	pop r27
	pop r26
	pop r25
	pop r24
	pop r23
	pop r22
	pop r20
	pop r19
	pop r18
	pop r0
	out __SREG__,r0
	pop r0
	pop __zero_reg__
	reti
.LFE42:
	.size	__vector_21, .-__vector_21
.global	_Z8setupAdcv
	.type	_Z8setupAdcv, @function
_Z8setupAdcv:
.LFB43:
.LM24:
/* prologue: function */
/* frame size = 0 */
.LM25:
	ldi r24,lo8(64)
	out 39-32,r24
.LM26:
	ldi r24,lo8(-49)
	out 38-32,r24
/* epilogue start */
.LM27:
	ret
.LFE43:
	.size	_Z8setupAdcv, .-_Z8setupAdcv
.global	__vector_16
	.type	__vector_16, @function
__vector_16:
.LFB44:
.LM28:
	push __zero_reg__
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r24
/* prologue: Signal */
/* frame size = 0 */
.LM29:
	lds r24,g_tmr16KHz
	subi r24,lo8(-(1))
	sts g_tmr16KHz,r24
/* epilogue start */
.LM30:
	pop r24
	pop r0
	out __SREG__,r0
	pop r0
	pop __zero_reg__
	reti
.LFE44:
	.size	__vector_16, .-__vector_16
.global	_Z11getTmr16KHzv
	.type	_Z11getTmr16KHzv, @function
_Z11getTmr16KHzv:
.LFB45:
.LM31:
/* prologue: function */
/* frame size = 0 */
.L15:
.LBB114:
.LM32:
	lds r20,g_tmr16KHz
.LVL11:
.LM33:
	in r18,82-32
.LVL12:
.LM34:
	lds r24,g_tmr16KHz
	cp r20,r24
	brne .L15
	mov r25,r20
.LVL13:
	ldi r24,lo8(0)
.LVL14:
	ldi r19,lo8(0)
	or r18,r24
	or r19,r25
.LVL15:
.LBE114:
.LM35:
	movw r24,r18
.LVL16:
/* epilogue start */
	ret
.LFE45:
	.size	_Z11getTmr16KHzv, .-_Z11getTmr16KHzv
.global	__vector_25
	.type	__vector_25, @function
__vector_25:
.LFB47:
.LM36:
	sei
	push __zero_reg__
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
	push r20
	push r21
	push r22
	push r23
	push r24
	push r25
	push r30
	push r31
/* prologue: Interrupt */
/* frame size = 0 */
.LBB115:
.LM37:
	lds r20,128
	lds r21,(128)+1
.LVL17:
.LM38:
/* #APP */
 ;  622 "../src/er9x.cpp" 1
	cli
 ;  0 "" 2
.LM39:
/* #NOAPP */
	lds r24,125
	andi r24,lo8(-33)
	sts 125,r24
.LM40:
/* #APP */
 ;  624 "../src/er9x.cpp" 1
	sei
 ;  0 "" 2
.LM41:
/* #NOAPP */
	lds r18,captureWr
.LVL18:
	subi r18,lo8(-(1))
	andi r18,lo8(15)
.LM42:
	lds r24,captureRd
	cp r18,r24
	brne .L19
.LM43:
	lds r30,captureWr
	ldi r31,lo8(0)
	adiw r30,15
	andi r30,lo8(15)
	andi r31,hi8(15)
	lsl r30
	rol r31
	subi r30,lo8(-(captureRing))
	sbci r31,hi8(-(captureRing))
	std Z+1,__zero_reg__
	st Z,__zero_reg__
.LBB116:
.LBB117:
.LM44:
	lds r24,g_beepVal+3
	sts g_beepCnt,r24
	rjmp .L20
.L19:
.LBE117:
.LBE116:
.LM45:
	lds r30,captureWr
	ldi r31,lo8(0)
	lds r24,_ZZ11__vector_25E8lastCapt
	lds r25,(_ZZ11__vector_25E8lastCapt)+1
	movw r22,r20
	sub r22,r24
	sbc r23,r25
	movw r24,r22
	lsl r30
	rol r31
	subi r30,lo8(-(captureRing))
	sbci r31,hi8(-(captureRing))
	std Z+1,r25
	st Z,r24
.LM46:
	sts captureWr,r18
.L20:
.LM47:
	sts (_ZZ11__vector_25E8lastCapt)+1,r21
	sts _ZZ11__vector_25E8lastCapt,r20
.LM48:
/* #APP */
 ;  638 "../src/er9x.cpp" 1
	cli
 ;  0 "" 2
.LM49:
/* #NOAPP */
	lds r24,125
	ori r24,lo8(32)
	sts 125,r24
.LM50:
/* #APP */
 ;  640 "../src/er9x.cpp" 1
	sei
 ;  0 "" 2
/* epilogue start */
/* #NOAPP */
.LBE115:
.LM51:
	pop r31
	pop r30
	pop r25
	pop r24
	pop r23
	pop r22
	pop r21
	pop r20
.LVL19:
	pop r18
.LVL20:
	pop r0
	out __SREG__,r0
	pop r0
	pop __zero_reg__
	reti
.LFE47:
	.size	__vector_25, .-__vector_25
.global	_Z12evalCapturesv
	.type	_Z12evalCapturesv, @function
_Z12evalCapturesv:
.LFB48:
.LM52:
/* prologue: function */
/* frame size = 0 */
.LM53:
	lds r20,ppmInState
	rjmp .L30
.LVL21:
.L26:
.LBB118:
.LBB119:
.LM54:
	lds r30,captureRd
	ldi r31,lo8(0)
	lsl r30
	rol r31
	subi r30,lo8(-(captureRing))
	sbci r31,hi8(-(captureRing))
	ld r18,Z
	ldd r19,Z+1
	lsr r19
	ror r18
.LM55:
	lds r24,captureRd
	subi r24,lo8(-(1))
	andi r24,lo8(15)
	sts captureRd,r24
.LM56:
	mov r24,r20
	subi r24,lo8(-(-1))
	cpi r24,lo8(8)
	brsh .L24
.LM57:
	movw r24,r18
	subi r24,lo8(-(-801))
	sbci r25,hi8(-(-801))
	subi r24,lo8(1399)
	sbci r25,hi8(1399)
	brlo .L25
	ldi r20,lo8(0)
	rjmp .L30
.L25:
.LM58:
	mov r30,r20
	ldi r31,lo8(0)
	lsl r30
	rol r31
	subi r30,lo8(-(g_ppmIns-2))
	sbci r31,hi8(-(g_ppmIns-2))
	subi r18,lo8(-(-1500))
	sbci r19,hi8(-(-1500))
	std Z+1,r19
	st Z,r18
	subi r20,lo8(-(1))
	rjmp .L30
.L24:
.LM59:
	subi r18,lo8(-(-4001))
	sbci r19,hi8(-(-4001))
	subi r18,lo8(11999)
	sbci r19,hi8(11999)
	brsh .L30
	ldi r20,lo8(1)
.L30:
.LBE119:
.LM60:
	lds r25,captureRd
	lds r24,captureWr
	cp r25,r24
	brne .L26
	sts ppmInState,r20
/* epilogue start */
.LBE118:
.LM61:
	ret
.LFE48:
	.size	_Z12evalCapturesv, .-_Z12evalCapturesv
.global	__vector_12
	.type	__vector_12, @function
__vector_12:
.LFB34:
.LM62:
	push __zero_reg__
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
	push r19
	push r20
	push r21
	push r22
	push r23
	push r24
	push r25
	push r26
	push r27
	push r30
	push r31
/* prologue: Signal */
/* frame size = 0 */
.LM63:
	ldi r25,lo8(0)
.LVL22:
.L33:
.LBB120:
.LM64:
	in r24,76-32
	cpi r24,lo8(10)
	brlo .+2
	rjmp .L32
	subi r25,lo8(-(1))
	cpi r25,lo8(50)
	brne .+2
	rjmp .L32
	rjmp .L33
.LVL23:
.L38:
.LM65:
	sbi 56-32,0
.LM66:
	sts _ZZ11__vector_12E8pulsePol,__zero_reg__
	rjmp .L34
.L42:
.LM67:
	cbi 56-32,0
.LM68:
	ldi r24,lo8(1)
	sts _ZZ11__vector_12E8pulsePol,r24
.L34:
.LM69:
	lds r24,g_tmr1Latency_max
.LVL24:
	lds r25,g_tmr1Latency_max+1
.LVL25:
	movw r18,r24
.LVL26:
	cp r18,r20
	cpc r19,r21
.LVL27:
	brsh .L35
.LVL28:
	movw r18,r20
.L35:
	sts (g_tmr1Latency_max)+1,r19
	sts g_tmr1Latency_max,r18
.LM70:
	lds r24,g_tmr1Latency_min
.LVL29:
	lds r25,g_tmr1Latency_min+1
.LVL30:
	movw r18,r24
.LVL31:
	cp r20,r18
	cpc r21,r19
.LVL32:
	brsh .L36
.LVL33:
	movw r18,r20
.L36:
	sts (g_tmr1Latency_min)+1,r19
	sts g_tmr1Latency_min,r18
.LM71:
	lds r26,_ZZ11__vector_12E8pulsePtr
	lds r27,(_ZZ11__vector_12E8pulsePtr)+1
	movw r30,r26
	ld r24,Z+
	ld r25,Z+
	out (74)+1-32,r25
	out 74-32,r24
	sts (_ZZ11__vector_12E8pulsePtr)+1,r31
	sts _ZZ11__vector_12E8pulsePtr,r30
.LM72:
	adiw r26,2
	ld r24,X+
	ld r25,X
	sbiw r26,2+1
	or r24,r25
	brne .L37
.LVL34:
.LM73:
	ldi r24,lo8(pulses2MHz)
	ldi r25,hi8(pulses2MHz)
	sts (_ZZ11__vector_12E8pulsePtr)+1,r25
	sts _ZZ11__vector_12E8pulsePtr,r24
.LM74:
	sts _ZZ11__vector_12E8pulsePol,__zero_reg__
.LM75:
	in r24,87-32
	andi r24,lo8(-17)
	out 87-32,r24
.LM76:
/* #APP */
 ;  505 "../src/er9x.cpp" 1
	sei
 ;  0 "" 2
.LM77:
/* #NOAPP */
	call _Z11setupPulsesv
.LVL35:
.LM78:
/* #APP */
 ;  507 "../src/er9x.cpp" 1
	cli
 ;  0 "" 2
.LM79:
/* #NOAPP */
	in r24,87-32
	ori r24,lo8(16)
	out 87-32,r24
.LVL36:
.L37:
.LM80:
	lds r24,heartbeat
	ori r24,lo8(1)
	sts heartbeat,r24
/* epilogue start */
.LBE120:
.LM81:
	pop r31
	pop r30
	pop r27
	pop r26
	pop r25
.LVL37:
	pop r24
	pop r23
	pop r22
	pop r21
	pop r20
	pop r19
	pop r18
.LVL38:
	pop r0
	out __SREG__,r0
	pop r0
	pop __zero_reg__
	reti
.LVL39:
.L32:
.LBB121:
.LM82:
	in r20,76-32
	in r21,(76)+1-32
.LVL40:
.LM83:
	lds r24,_ZZ11__vector_12E8pulsePol
	tst r24
	breq .+2
	rjmp .L38
	rjmp .L42
.LBE121:
.LFE34:
	.size	__vector_12, .-__vector_12
.global	__vector_15
	.type	__vector_15, @function
__vector_15:
.LFB46:
.LM84:
	sei
	push __zero_reg__
	push r0
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
	push r19
	push r20
	push r21
	push r22
	push r23
	push r24
	push r25
	push r26
	push r27
	push r30
	push r31
/* prologue: Interrupt */
/* frame size = 0 */
.LM85:
/* #APP */
 ;  600 "../src/er9x.cpp" 1
	cli
 ;  0 "" 2
.LM86:
/* #NOAPP */
	in r24,87-32
	andi r24,lo8(-3)
	out 87-32,r24
.LM87:
/* #APP */
 ;  602 "../src/er9x.cpp" 1
	sei
 ;  0 "" 2
.LM88:
/* #NOAPP */
	in r24,81-32
	subi r24,lo8(-(-100))
	out 81-32,r24
.LM89:
	lds r24,g_beepCnt
	tst r24
	breq .L44
.LM90:
	subi r24,lo8(-(-1))
	sts g_beepCnt,r24
.LM91:
	sbi 35-32,3
	rjmp .L45
.L44:
.LM92:
	cbi 35-32,3
.L45:
.LM93:
	call _Z7per10msv
.LM94:
	lds r24,heartbeat
	ori r24,lo8(2)
	sts heartbeat,r24
.LM95:
/* #APP */
 ;  612 "../src/er9x.cpp" 1
	cli
 ;  0 "" 2
.LM96:
/* #NOAPP */
	in r24,87-32
	ori r24,lo8(2)
	out 87-32,r24
.LM97:
/* #APP */
 ;  614 "../src/er9x.cpp" 1
	sei
 ;  0 "" 2
/* epilogue start */
.LM98:
/* #NOAPP */
	pop r31
	pop r30
	pop r27
	pop r26
	pop r25
	pop r24
	pop r23
	pop r22
	pop r21
	pop r20
	pop r19
	pop r18
	pop r0
	out __SREG__,r0
	pop r0
	pop __zero_reg__
	reti
.LFE46:
	.size	__vector_15, .-__vector_15
.global	_Z9getSwitchab
	.type	_Z9getSwitchab, @function
_Z9getSwitchab:
.LFB18:
.LM99:
.LVL41:
/* prologue: function */
/* frame size = 0 */
.LM100:
	tst r24
	breq .L50
	cpi r24,lo8(10)
	breq .L51
	cpi r24,lo8(-10)
	brne .L54
	rjmp .L55
.L51:
	ldi r22,lo8(1)
.LVL42:
	rjmp .L50
.L55:
	ldi r22,lo8(0)
.LVL43:
	rjmp .L50
.L54:
	mov r18,r24
	clr r19
	sbrc r18,7
	com r19
.LVL44:
.LM101:
	sbrs r24,7
	rjmp .L52
.LVL45:
	ldi r24,lo8(13)
	ldi r25,hi8(13)
.LVL46:
	sub r24,r18
	sbc r25,r19
	call _Z8keyState8EnumKeys
.LVL47:
	ldi r22,lo8(1)
.LVL48:
	eor r22,r24
	rjmp .L50
.LVL49:
.L52:
.LM102:
	movw r24,r18
.LVL50:
	adiw r24,13
	call _Z8keyState8EnumKeys
.LVL51:
	mov r22,r24
.LVL52:
.L50:
.LM103:
	mov r24,r22
.LVL53:
/* epilogue start */
	ret
.LFE18:
	.size	_Z9getSwitchab, .-_Z9getSwitchab
.global	_Z15checkIncDecGen2hPviih
	.type	_Z15checkIncDecGen2hPviih, @function
_Z15checkIncDecGen2hPviih:
.LFB24:
.LM104:
.LVL54:
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
.LVL55:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	mov r15,r24
	movw r10,r22
	movw r6,r20
	movw r8,r18
	mov r14,r16
.LVL56:
.LBB122:
.LM105:
	mov r18,r16
.LVL57:
	ldi r19,lo8(0)
	ldi r23,lo8(4)
	mov r4,r23
	mov r5,__zero_reg__
	and r4,r18
	and r5,r19
	sbrs r16,2
	rjmp .L57
.LVL58:
	movw r30,r10
	ld r12,Z
	ldd r13,Z+1
.LVL59:
	rjmp .L58
.LVL60:
.L57:
	movw r30,r10
	ld r24,Z
	mov r12,r24
	clr r13
	sbrc r12,7
	com r13
.LVL61:
.L58:
.LM106:
	sbrc r18,3
	rjmp .L59
	ldi r17,lo8(5)
.LVL62:
	ldi r16,lo8(4)
.LVL63:
	rjmp .L60
.LVL64:
.L59:
	ldi r17,lo8(2)
.LVL65:
	ldi r16,lo8(3)
.LVL66:
.L60:
.LM107:
	sbrs r15,4
	rjmp .L61
.LBB133:
.LM108:
	ldi r31,lo8(15)
	and r15,r31
	ldi r24,lo8(96)
	or r15,r24
	mov r24,r16
	mov r16,r17
	mov r17,r24
.LVL67:
.L61:
.LBE133:
.LM109:
	mov r24,r16
	ori r24,lo8(96)
	cp r15,r24
	breq .L62
	mov r24,r16
	ori r24,lo8(64)
	cp r15,r24
	brne .L63
.L62:
.LM110:
	movw r28,r12
.LVL68:
	adiw r28,1
.LBB131:
.LBB132:
.LM111:
	lds r24,g_beepVal
	sts g_beepCnt,r24
	mov r24,r17
.LVL69:
	rjmp .L64
.LVL70:
.L63:
.LBE132:
.LBE131:
.LM112:
	mov r24,r17
	ori r24,lo8(96)
	cp r15,r24
	breq .L65
	mov r24,r17
	ori r24,lo8(64)
	cp r15,r24
	breq .+2
	rjmp .L66
.L65:
.LM113:
	movw r28,r12
.LVL71:
	sbiw r28,1
.LBB129:
.LBB130:
.LM114:
	lds r24,g_beepVal
	sts g_beepCnt,r24
	mov r24,r16
.LVL72:
.L64:
.LBE130:
.LBE129:
.LM115:
	ldi r25,lo8(0)
	call _Z8keyState8EnumKeys
.LVL73:
	tst r24
	breq .L67
.LM116:
	clr r28
	clr r29
	sub r28,r12
	sbc r29,r13
.LM117:
	mov r24,r17
	call _Z10killEventsh
.LM118:
	mov r24,r16
	call _Z10killEventsh
.LVL74:
.L67:
.LM119:
	cp r8,r28
	cpc r9,r29
	brge .L68
.LM120:
	mov r24,r15
	call _Z10killEventsh
.LBB127:
.LBB128:
.LM121:
	lds r24,g_beepVal+2
	sts g_beepCnt,r24
	movw r28,r8
.LVL75:
.L68:
.LBE128:
.LBE127:
.LM122:
	cp r28,r6
	cpc r29,r7
	brge .L69
.LM123:
	mov r24,r15
	call _Z10killEventsh
.LBB125:
.LBB126:
.LM124:
	lds r24,g_beepVal+2
	sts g_beepCnt,r24
	movw r28,r6
.LVL76:
.L69:
.LBE126:
.LBE125:
.LM125:
	cp r28,r12
	cpc r29,r13
	breq .L70
.LM126:
	sbiw r28,0
	brne .L71
.LM127:
	mov r24,r15
	call _Z11pauseEventsh
.LBB123:
.LBB124:
.LM128:
	lds r24,g_beepVal
	sts g_beepCnt,r24
.LVL77:
.L71:
.LBE124:
.LBE123:
.LM129:
	or r4,r5
	breq .L72
	movw r30,r10
	std Z+1,r29
	st Z,r28
	rjmp .L73
.L72:
.LM130:
	movw r30,r10
	st Z,r28
.L73:
.LM131:
	mov r24,r14
	andi r24,lo8(3)
	call _Z7eeDirtyh
.LM132:
	ldi r24,lo8(1)
	sts checkIncDec_Ret,r24
	rjmp .L74
.LVL78:
.L70:
.LM133:
	sts checkIncDec_Ret,__zero_reg__
	ldi r24,lo8(0)
.L74:
/* epilogue start */
.LBE122:
.LM134:
	pop r29
	pop r28
.LVL79:
	pop r17
.LVL80:
	pop r16
.LVL81:
	pop r15
.LVL82:
	pop r14
.LVL83:
	pop r13
	pop r12
.LVL84:
	pop r11
	pop r10
.LVL85:
	pop r9
	pop r8
.LVL86:
	pop r7
	pop r6
.LVL87:
	pop r5
	pop r4
	ret
.LVL88:
.L66:
.LBB134:
.LM135:
	movw r28,r12
.LVL89:
	rjmp .L67
.LBE134:
.LFE24:
	.size	_Z15checkIncDecGen2hPviih, .-_Z15checkIncDecGen2hPviih
.global	_Z14checkIncDec_vghaaa
	.type	_Z14checkIncDec_vghaaa, @function
_Z14checkIncDec_vghaaa:
.LFB28:
.LM136:
.LVL90:
	push r16
	push r29
	push r28
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
	std Y+1,r22
.LM137:
	clr r21
	sbrc r20,7
	com r21
.LVL91:
	clr r19
	sbrc r18,7
	com r19
.LVL92:
	movw r22,r28
.LVL93:
	subi r22,lo8(-(1))
	sbci r23,hi8(-(1))
	ldi r16,lo8(9)
	call _Z15checkIncDecGen2hPviih
.LVL94:
.LM138:
	ldd r24,Y+1
/* epilogue start */
	pop __tmp_reg__
	pop r28
	pop r29
	pop r16
	ret
.LFE28:
	.size	_Z14checkIncDec_vghaaa, .-_Z14checkIncDec_vghaaa
.global	_Z14checkIncDec_hghaaa
	.type	_Z14checkIncDec_hghaaa, @function
_Z14checkIncDec_hghaaa:
.LFB27:
.LM139:
.LVL95:
	push r16
	push r29
	push r28
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
	std Y+1,r22
.LM140:
	clr r21
	sbrc r20,7
	com r21
.LVL96:
	clr r19
	sbrc r18,7
	com r19
.LVL97:
	movw r22,r28
.LVL98:
	subi r22,lo8(-(1))
	sbci r23,hi8(-(1))
	ldi r16,lo8(1)
	call _Z15checkIncDecGen2hPviih
.LVL99:
.LM141:
	ldd r24,Y+1
/* epilogue start */
	pop __tmp_reg__
	pop r28
	pop r29
	pop r16
	ret
.LFE27:
	.size	_Z14checkIncDec_hghaaa, .-_Z14checkIncDec_hghaaa
.global	_Z14checkIncDec_vmhaaa
	.type	_Z14checkIncDec_vmhaaa, @function
_Z14checkIncDec_vmhaaa:
.LFB26:
.LM142:
.LVL100:
	push r16
	push r29
	push r28
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
	std Y+1,r22
.LM143:
	clr r21
	sbrc r20,7
	com r21
.LVL101:
	clr r19
	sbrc r18,7
	com r19
.LVL102:
	movw r22,r28
.LVL103:
	subi r22,lo8(-(1))
	sbci r23,hi8(-(1))
	ldi r16,lo8(10)
	call _Z15checkIncDecGen2hPviih
.LVL104:
.LM144:
	ldd r24,Y+1
/* epilogue start */
	pop __tmp_reg__
	pop r28
	pop r29
	pop r16
	ret
.LFE26:
	.size	_Z14checkIncDec_vmhaaa, .-_Z14checkIncDec_vmhaaa
.global	_Z14checkIncDec_hmhaaa
	.type	_Z14checkIncDec_hmhaaa, @function
_Z14checkIncDec_hmhaaa:
.LFB25:
.LM145:
.LVL105:
	push r16
	push r29
	push r28
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
	std Y+1,r22
.LM146:
	clr r21
	sbrc r20,7
	com r21
.LVL106:
	clr r19
	sbrc r18,7
	com r19
.LVL107:
	movw r22,r28
.LVL108:
	subi r22,lo8(-(1))
	sbci r23,hi8(-(1))
	ldi r16,lo8(2)
	call _Z15checkIncDecGen2hPviih
.LVL109:
.LM147:
	ldd r24,Y+1
/* epilogue start */
	pop __tmp_reg__
	pop r28
	pop r29
	pop r16
	ret
.LFE25:
	.size	_Z14checkIncDec_hmhaaa, .-_Z14checkIncDec_hmhaaa
.global	_Z9checkTrimh
	.type	_Z9checkTrimh, @function
_Z9checkTrimh:
.LFB23:
.LM148:
.LVL110:
	push r17
/* prologue: function */
/* frame size = 0 */
	mov r26,r24
.LBB135:
.LM149:
	mov r27,r24
	andi r27,lo8(15)
	subi r27,lo8(-(-6))
.LM150:
	lds r18,g_model+19
.LVL111:
.LM151:
	cpi r18,lo8(2)
	brlt .L85
	clr r19
	sbrc r18,7
	com r19
.LVL112:
	subi r18,lo8(-(-1))
	sbci r19,hi8(-(-1))
.LVL113:
	ldi r24,lo8(1)
	ldi r25,hi8(1)
.LVL114:
	rjmp 2f
1:	lsl r24
	rol r25
2:	dec r18
	brpl 1b
	mov r18,r24
.LVL115:
.L85:
.LM152:
	cpi r27,lo8(8)
	brlo .+2
	rjmp .L86
	sbrs r26,6
	rjmp .L86
.LBB136:
.LM153:
	mov r19,r27
.LVL116:
	asr r19
.LM154:
	tst r18
	breq .L87
	mov r20,r18
.LVL117:
	rjmp .L88
.LVL118:
.L87:
	mov r24,r19
	ldi r25,lo8(0)
.LVL119:
	movw r30,r24
	lsl r30
	rol r31
.LVL120:
	add r30,r24
	adc r31,r25
	subi r30,lo8(-(g_model+171))
	sbci r31,hi8(-(g_model+171))
	ld r24,Z
	mov r20,r24
	clr r21
	sbrc r20,7
	com r21
	sbrs r21,7
	rjmp .L89
	com r21
	neg r20
	sbci r21,lo8(-1)
.L89:
	mov r18,r20
	sbrc r20,7
	subi r18,lo8(-(3))
.L90:
	mov r20,r18
.LVL121:
	asr r20
	asr r20
	subi r20,lo8(-(1))
.LVL122:
.L88:
.LM155:
	mov r22,r19
	ldi r23,lo8(0)
	lds r18,g_eeGeneral+50
.LVL123:
	ldi r19,lo8(0)
.LVL124:
	andi r18,lo8(1)
	andi r19,hi8(1)
	ldi r24,lo8(2)
	ldi r25,hi8(2)
	sub r24,r18
	sbc r25,r19
	cp r24,r22
	cpc r25,r23
	brne .L91
	lds r24,g_model+18
	cpi r24,lo8(1)
	brne .L91
	ldi r20,lo8(4)
	ldi r17,lo8(1)
.LVL125:
	rjmp .L92
.LVL126:
.L91:
	ldi r17,lo8(0)
.LVL127:
.L92:
	mov r18,r20
	clr r19
	sbrc r18,7
	com r19
.LVL128:
	movw r30,r22
	lsl r30
	rol r31
.LVL129:
.LM156:
	sbrs r27,0
	rjmp .L93
	add r30,r22
	adc r31,r23
	subi r30,lo8(-(g_model+171))
	sbci r31,hi8(-(g_model+171))
	ld r24,Z
	mov r20,r24
	clr r21
	sbrc r20,7
	com r21
.LVL130:
	add r20,r18
	adc r21,r19
	rjmp .L94
.LVL131:
.L93:
	add r30,r22
	adc r31,r23
	subi r30,lo8(-(g_model+171))
	sbci r31,hi8(-(g_model+171))
	ld r24,Z
	mov r20,r24
	clr r21
	sbrc r20,7
	com r21
.LVL132:
	sub r20,r18
	sbc r21,r19
.L94:
.LM157:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	breq .L95
	mov r25,r21
	com r25
	rol r25
	clr r25
	rol r25
	ldi r18,lo8(0)
.LVL133:
	movw r30,r22
	lsl r30
	rol r31
	add r30,r22
	adc r31,r23
	subi r30,lo8(-(g_model+171))
	sbci r31,hi8(-(g_model+171))
	ld r24,Z
	sbrs r24,7
	ldi r18,lo8(1)
.L98:
	cp r25,r18
	breq .L96
.LVL134:
.L95:
	tst r17
	brne .L96
	movw r30,r22
	lsl r30
	rol r31
.LVL135:
	add r30,r22
	adc r31,r23
	subi r30,lo8(-(g_model+171))
	sbci r31,hi8(-(g_model+171))
	ld r24,Z
	tst r24
	breq .L96
.LM158:
	st Z,__zero_reg__
.LM159:
	mov r24,r26
	call _Z10killEventsh
.LVL136:
	rjmp .L103
.LVL137:
.L96:
.LM160:
	movw r24,r20
	subi r24,lo8(-(125))
	sbci r25,hi8(-(125))
	cpi r24,251
	cpc r25,__zero_reg__
	brsh .L99
.LM161:
	movw r30,r22
	lsl r30
	rol r31
	add r30,r22
	adc r31,r23
	subi r30,lo8(-(g_model+171))
	sbci r31,hi8(-(g_model+171))
	st Z,r20
.LM162:
	ldi r24,lo8(2)
	call _Z7eeDirtyh
.LVL138:
.LBB137:
.LBB138:
.LM163:
	lds r24,g_beepVal
	rjmp .L104
.LVL139:
.L99:
.LBE138:
.LBE137:
.LM164:
	cp __zero_reg__,r20
	cpc __zero_reg__,r21
	brlt .L100
	ldi r24,lo8(-125)
	rjmp .L101
.L100:
	ldi r24,lo8(125)
.L101:
	movw r30,r22
	lsl r30
	rol r31
.LVL140:
	add r30,r22
	adc r31,r23
	subi r30,lo8(-(g_model+171))
	sbci r31,hi8(-(g_model+171))
	st Z,r24
.LM165:
	ldi r24,lo8(2)
	call _Z7eeDirtyh
.LVL141:
.L103:
.LBB139:
.LBB140:
.LM166:
	lds r24,g_beepVal+2
.L104:
	sts g_beepCnt,r24
	ldi r26,lo8(0)
.LVL142:
.L86:
.LBE140:
.LBE139:
.LBE136:
.LBE135:
.LM167:
	mov r24,r26
/* epilogue start */
	pop r17
.LVL143:
	ret
.LFE23:
	.size	_Z9checkTrimh, .-_Z9checkTrimh
.global	_Z7perMainv
	.type	_Z7perMainv, @function
_Z7perMainv:
.LFB33:
.LM168:
/* prologue: function */
/* frame size = 0 */
.LBB141:
.LM169:
	ldi r24,lo8(g_chans512)
	ldi r25,hi8(g_chans512)
	call _Z6perOutPi
.LM170:
	ldi r24,lo8(0)
	call _Z7eeCheckb
.LM171:
	call _Z9lcd_clearv
.LM172:
	call _Z8getEventv
.LM173:
	call _Z9checkTrimh
.LM174:
	lds r30,g_menuStackPtr
	ldi r31,lo8(0)
	lsl r30
	rol r31
	subi r30,lo8(-(g_menuStack))
	sbci r31,hi8(-(g_menuStack))
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
	icall
.LM175:
	call _Z13refreshDiplayv
.LM176:
	lds r24,99
	sbrs r24,1
	rjmp .L106
.LM177:
	lds r24,101
	andi r24,lo8(-17)
	sts 101,r24
	rjmp .L107
.L106:
.LM178:
	lds r24,101
	ori r24,lo8(16)
	sts 101,r24
.LM179:
	call _Z12evalCapturesv
.L107:
.LM180:
	lds r24,g_tmr10ms
	lds r25,(g_tmr10ms)+1
	andi r24,lo8(31)
	andi r25,hi8(31)
	cpi r24,2
	cpc r25,__zero_reg__
	breq .L110
	cpi r24,3
	cpc r25,__zero_reg__
	brne .+2
	rjmp .L111
	sbiw r24,1
	breq .+2
	rjmp .L114
.LM181:
	lds r24,g_eeGeneral+31
	ldi r22,lo8(0)
	call _Z9getSwitchab
	tst r24
	breq .L112
	sbi 56-32,7
	ret
.L112:
.LM182:
	cbi 56-32,7
	ret
.L110:
.LBB142:
.LBB143:
.LBB144:
.LBB145:
.LBB146:
.LM183:
	ldi r30,lo8(_ZZ5anaInhE8crossAna+7)
	ldi r31,hi8(_ZZ5anaInhE8crossAna+7)
/* #APP */
 ;  534 "../src/er9x.cpp" 1
	lpm r30, Z
	
 ;  0 "" 2
.LVL144:
/* #NOAPP */
.LBE146:
	ldi r31,lo8(0)
.LVL145:
	lsl r30
	rol r31
.LVL146:
	subi r30,lo8(-(_ZL9s_anaFilt))
	sbci r31,hi8(-(_ZL9s_anaFilt))
.LVL147:
.LBB147:
.LBB148:
.LBB149:
.LM184:
	in r24,__SREG__
.LM185:
/* #APP */
 ;  519 "../src/er9x.cpp" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE149:
.LBE148:
.LBE147:
.LM186:
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
.LVL148:
.LBB150:
.LBB151:
.LM187:
	sbrs r24,7
	rjmp .L113
/* #APP */
 ;  522 "../src/er9x.cpp" 1
	sei
 ;  0 "" 2
/* #NOAPP */
.L113:
.LBE151:
.LBE150:
.LBE145:
.LBE144:
.LBE143:
.LM188:
	movw r18,r30
	lsr r19
	ror r18
	lsr r19
	ror r18
	lds r24,g_eeGeneral+30
	clr r25
	sbrc r24,7
	com r25
	movw r20,r24
	mul r18,r20
	movw r24,r0
	mul r18,r21
	add r25,r0
	mul r19,r20
	add r25,r0
	clr r1
	ldi r18,lo8(35)
	ldi r19,hi8(35)
	movw r20,r18
	mul r30,r20
	movw r18,r0
	mul r30,r21
	add r19,r0
	mul r31,r20
	add r19,r0
	clr r1
	add r24,r18
	adc r25,r19
	sts g_vbat100mV,r25
.LM189:
	lds r24,_ZZ7perMainvE10s_batCheck
	subi r24,lo8(-(32))
	sts _ZZ7perMainvE10s_batCheck,r24
.LM190:
	tst r24
	brne .L114
	lds r24,g_eeGeneral+29
	cp r25,r24
	brsh .L114
.LBB152:
.LBB153:
.LM191:
	lds r24,g_beepVal+1
	sts g_beepCnt,r24
	ret
.LVL149:
.L111:
.LBE153:
.LBE152:
.LBE142:
.LBB154:
.LM192:
	lds r22,g_eeGeneral+49
	ldi r23,lo8(0)
	andi r22,lo8(24)
	andi r23,hi8(24)
	lsr r23
	ror r22
	subi r22,lo8(-(_ZZ7perMainvE7beepTab))
	sbci r23,hi8(-(_ZZ7perMainvE7beepTab))
	ldi r24,lo8(g_beepVal)
	ldi r25,hi8(g_beepVal)
	ldi r20,lo8(4)
	ldi r21,hi8(4)
	call memcpy_P
.LVL150:
.L114:
	ret
.LBE154:
.LBE141:
.LFE33:
	.size	_Z7perMainv, .-_Z7perMainv
.global	_Z5alertPKc
	.type	_Z5alertPKc, @function
_Z5alertPKc:
.LFB22:
.LM193:
.LVL151:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
	movw r16,r24
.LBB155:
.LM194:
	call _Z9lcd_clearv
.LVL152:
.LM195:
	ldi r24,lo8(34)
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ5alertPKcE3__c)
	ldi r21,hi8(_ZZ5alertPKcE3__c)
	ldi r18,lo8(-128)
	call _Z11lcd_putsAtthhPKch
.LM196:
	ldi r24,lo8(0)
	ldi r22,lo8(24)
	movw r20,r16
	call _Z10lcd_puts_PhhPKc
.LM197:
	ldi r24,lo8(28)
	ldi r22,lo8(56)
	ldi r20,lo8(_ZZ5alertPKcE3__c_0)
	ldi r21,hi8(_ZZ5alertPKcE3__c_0)
	call _Z10lcd_puts_PhhPKc
.LM198:
	call _Z13refreshDiplayv
.LBB156:
.LBB157:
.LM199:
	lds r24,g_beepVal+3
	sts g_beepCnt,r24
.L116:
.LBE157:
.LBE156:
.LM200:
	call _Z8getEventv
	andi r24,lo8(-16)
	cpi r24,lo8(32)
	brne .L116
/* epilogue start */
.LBE155:
.LM201:
	pop r17
	pop r16
.LVL153:
	ret
.LFE22:
	.size	_Z5alertPKc, .-_Z5alertPKc
.global	_Z8pushMenuPFvhE
	.type	_Z8pushMenuPFvhE, @function
_Z8pushMenuPFvhE:
.LFB32:
.LM202:
.LVL154:
/* prologue: function */
/* frame size = 0 */
	movw r18,r24
.LBB158:
.LM203:
	lds r24,g_menuStackPtr
.LVL155:
	mov r30,r24
	subi r30,lo8(-(1))
	sts g_menuStackPtr,r30
.LM204:
	cpi r30,lo8(5)
	brlo .L120
.LM205:
	sts g_menuStackPtr,r24
.LM206:
	ldi r24,lo8(_ZZ8pushMenuPFvhEE3__c)
	ldi r25,hi8(_ZZ8pushMenuPFvhEE3__c)
	call _Z5alertPKc
.LVL156:
	ret
.LVL157:
.L120:
.LBB159:
.LBB160:
.LM207:
	lds r24,g_beepVal
	sts g_beepCnt,r24
.LBE160:
.LBE159:
.LM208:
	ldi r31,lo8(0)
	lsl r30
	rol r31
	subi r30,lo8(-(g_menuStack))
	sbci r31,hi8(-(g_menuStack))
	std Z+1,r19
	st Z,r18
.LM209:
	ldi r24,lo8(-65)
	movw r30,r18
	icall
.LVL158:
	ret
.LBE158:
.LFE32:
	.size	_Z8pushMenuPFvhE, .-_Z8pushMenuPFvhE
.global	_Z13checkSwitchesv
	.type	_Z13checkSwitchesv, @function
_Z13checkSwitchesv:
.LFB21:
.LM210:
	push r17
/* prologue: function */
/* frame size = 0 */
.LBB161:
.LM211:
	lds r24,g_eeGeneral+49
	sbrc r24,1
	rjmp .L128
	ldi r17,lo8(14)
.LVL159:
.L127:
.LM212:
	cpi r17,lo8(17)
	breq .L125
.LM213:
	mov r24,r17
	ldi r25,lo8(0)
	call _Z8keyState8EnumKeys
	tst r24
	brne .L126
.L125:
.LM214:
	subi r17,lo8(-(1))
	cpi r17,lo8(22)
	brne .L127
	rjmp .L128
.L126:
.LBB162:
.LBB163:
.LM215:
	lds r24,g_beepVal+3
	sts g_beepCnt,r24
.LBE163:
.LBE162:
.LM216:
	ldi r24,lo8(gs(_Z16menuProcDiagKeysh))
	ldi r25,hi8(gs(_Z16menuProcDiagKeysh))
	call _Z8pushMenuPFvhE
.L128:
/* epilogue start */
.LBE161:
.LM217:
	pop r17
.LVL160:
	ret
.LFE21:
	.size	_Z13checkSwitchesv, .-_Z13checkSwitchesv
.global	_Z7popMenub
	.type	_Z7popMenub, @function
_Z7popMenub:
.LFB30:
.LM218:
.LVL161:
/* prologue: function */
/* frame size = 0 */
.LBB164:
.LM219:
	lds r30,g_menuStackPtr
	tst r30
	breq .L131
.LM220:
	tst r24
	breq .L132
	ldi r30,lo8(0)
	rjmp .L133
.L132:
	subi r30,lo8(-(-1))
.L133:
	sts g_menuStackPtr,r30
.LBB165:
.LBB166:
.LM221:
	lds r24,g_beepVal
.LVL162:
	sts g_beepCnt,r24
.LBE166:
.LBE165:
.LM222:
	ldi r31,lo8(0)
	lsl r30
	rol r31
	subi r30,lo8(-(g_menuStack))
	sbci r31,hi8(-(g_menuStack))
	ld __tmp_reg__,Z+
	ld r31,Z
	mov r30,__tmp_reg__
	ldi r24,lo8(-66)
	icall
	ret
.LVL163:
.L131:
.LM223:
	ldi r24,lo8(_ZZ7popMenubE3__c)
	ldi r25,hi8(_ZZ7popMenubE3__c)
.LVL164:
	call _Z5alertPKc
	ret
.LBE164:
.LFE30:
	.size	_Z7popMenub, .-_Z7popMenub
.global	_Z8checkTHRv
	.type	_Z8checkTHRv, @function
_Z8checkTHRv:
.LFB20:
.LM224:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
.LBB167:
.LM225:
	lds r24,g_eeGeneral+49
	sbrc r24,0
	rjmp .L140
.L141:
.LM226:
	lds r24,g_tmr10ms
	lds r25,(g_tmr10ms)+1
	sbiw r24,20
	brlo .L141
.LM227:
	lds r24,g_eeGeneral+50
	ldi r25,lo8(0)
	andi r24,lo8(1)
	andi r25,hi8(1)
	ldi r18,lo8(2)
	ldi r19,hi8(2)
.LVL165:
	sub r18,r24
	sbc r19,r25
.LBB168:
.LBB169:
.LBB170:
.LBB171:
.LM228:
	mov r30,r18
	ldi r31,lo8(0)
.LVL166:
	subi r30,lo8(-(_ZZ5anaInhE8crossAna))
	sbci r31,hi8(-(_ZZ5anaInhE8crossAna))
.LVL167:
/* #APP */
 ;  534 "../src/er9x.cpp" 1
	lpm r30, Z
	
 ;  0 "" 2
.LVL168:
/* #NOAPP */
.LBE171:
	ldi r31,lo8(0)
.LVL169:
	lsl r30
	rol r31
.LVL170:
	subi r30,lo8(-(_ZL9s_anaFilt))
	sbci r31,hi8(-(_ZL9s_anaFilt))
.LVL171:
.LBB172:
.LBB173:
.LBB174:
.LM229:
	in r24,__SREG__
.LM230:
/* #APP */
 ;  519 "../src/er9x.cpp" 1
	cli
 ;  0 "" 2
/* #NOAPP */
.LBE174:
.LBE173:
.LBE172:
.LM231:
	ld r28,Z
	ldd r29,Z+1
.LBB175:
.LBB176:
.LM232:
	sbrs r24,7
	rjmp .L139
/* #APP */
 ;  522 "../src/er9x.cpp" 1
	sei
 ;  0 "" 2
/* #NOAPP */
.L139:
.LBE176:
.LBE175:
.LBE170:
.LBE169:
.LBE168:
.LM233:
	movw r30,r18
.LVL172:
	lsl r30
	rol r31
	subi r30,lo8(-(g_eeGeneral))
	sbci r31,hi8(-(g_eeGeneral))
	ldd r18,Z+9
	ldd r19,Z+10
.LVL173:
.LM234:
	movw r24,r18
	ldi r22,lo8(8)
	ldi r23,hi8(8)
	call __divmodhi4
	sub r22,r18
	sbc r23,r19
	ldd r24,Z+1
	ldd r25,Z+2
	add r24,r22
	adc r25,r23
	cp r24,r28
	cpc r25,r29
	brge .L140
.LM235:
	ldi r24,lo8(_ZZ8checkTHRvE3__c)
	ldi r25,hi8(_ZZ8checkTHRvE3__c)
	call _Z5alertPKc
.LVL174:
.L140:
/* epilogue start */
.LBE167:
.LM236:
	pop r29
	pop r28
	ret
.LFE20:
	.size	_Z8checkTHRv, .-_Z8checkTHRv
.global	_Z8checkMemv
	.type	_Z8checkMemv, @function
_Z8checkMemv:
.LFB19:
.LM237:
/* prologue: function */
/* frame size = 0 */
.LBB177:
.LM238:
	lds r24,g_eeGeneral+49
	sbrc r24,2
	rjmp .L145
.LM239:
	call _Z11EeFsGetFreev
	cpi r24,200
	cpc r25,__zero_reg__
	brsh .L145
.LM240:
	ldi r24,lo8(_ZZ8checkMemvE3__c)
	ldi r25,hi8(_ZZ8checkMemvE3__c)
	call _Z5alertPKc
.L145:
	ret
.LBE177:
.LFE19:
	.size	_Z8checkMemv, .-_Z8checkMemv
.global	main
	.type	main, @function
main:
.LFB49:
.LM241:
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
.LM242:
	ldi r25,lo8(-1)
	out 58-32,r25
	out 59-32,__zero_reg__
.LM243:
	ldi r24,lo8(-127)
	out 55-32,r24
	ldi r24,lo8(126)
	out 56-32,r24
.LM244:
	ldi r24,lo8(62)
	out 52-32,r24
	ldi r24,lo8(-63)
	out 53-32,r24
.LM245:
	out 49-32,__zero_reg__
	out 50-32,r25
.LM246:
	ldi r24,lo8(8)
	out 34-32,r24
	ldi r24,lo8(-9)
	out 35-32,r24
.LM247:
	sts 97,__zero_reg__
	sts 98,r25
.LM248:
	ldi r24,lo8(16)
	sts 100,r24
	sts 101,r25
.LM249:
	call _Z8lcd_initv
.LM250:
	ldi r24,lo8(7)
	out 83-32,r24
.LM251:
	ldi r24,lo8(-100)
	out 81-32,r24
.LM252:
	in r24,87-32
	ori r24,lo8(3)
	out 87-32,r24
.LM253:
	out 79-32,__zero_reg__
.LM254:
	ldi r24,lo8(10)
	out 78-32,r24
.LM255:
	sts 139,__zero_reg__
.LM256:
	ldi r24,lo8(-126)
	sts 138,r24
.LM257:
	lds r24,125
	ori r24,lo8(32)
	sts 125,r24
.LM258:
/* #APP */
 ;  694 "../src/er9x.cpp" 1
	sei
 ;  0 "" 2
.LM259:
/* #NOAPP */
	ldi r24,lo8(gs(_Z9menuProc0h))
	ldi r25,hi8(gs(_Z9menuProc0h))
	sts (g_menuStack)+1,r25
	sts g_menuStack,r24
.LM260:
	call _Z9eeReadAllv
.LM261:
	call _Z8checkMemv
.LBB178:
.LBB179:
.LM262:
	ldi r24,lo8(64)
	out 39-32,r24
.LM263:
	ldi r24,lo8(-49)
	out 38-32,r24
.LBE179:
.LBE178:
.LM264:
	call _Z8checkTHRv
.LM265:
	call _Z13checkSwitchesv
.LM266:
	call _Z11setupPulsesv
.LM267:
	ldi r18,lo8(13)
	ldi r24,lo8(24)
	ldi r25,hi8(24)
/* #APP */
 ;  703 "../src/er9x.cpp" 1
	in __tmp_reg__,__SREG__
	cli
	wdr
	out 33,r24
	out __SREG__,__tmp_reg__
	out 33,r18
 ;  0 "" 2
.LM268:
/* #NOAPP */
	lds r24,g_eeGeneral+28
	call _Z13lcdSetRefVolth
.LM269:
	in r24,87-32
	ori r24,lo8(16)
	out 87-32,r24
.LVL175:
.L158:
.LBB180:
.LM270:
	lds r12,g_tmr10ms
	lds r13,(g_tmr10ms)+1
.LVL176:
.L147:
.LBB181:
.LBB182:
.LBB183:
.LM271:
	lds r15,g_tmr16KHz
.LVL177:
.LM272:
	in r14,82-32
.LM273:
	lds r24,g_tmr16KHz
	cp r15,r24
	brne .L147
.LBE183:
.LBE182:
.LBE181:
.LM274:
	call _Z7perMainv
.LVL178:
.L148:
.LBB186:
.LBB187:
.LBB188:
.LM275:
	lds r18,g_tmr16KHz
.LVL179:
.LM276:
	in r19,82-32
.LM277:
	lds r24,g_tmr16KHz
	cp r18,r24
	brne .L148
.LBE188:
.LBE187:
.LBE186:
.LBB189:
.LBB185:
.LBB184:
	mov r17,r15
	ldi r16,lo8(0)
.LVL180:
	mov r24,r14
	ldi r25,lo8(0)
.LVL181:
	or r24,r16
	or r25,r17
.LVL182:
.LBE184:
.LBE185:
.LBE189:
.LM278:
	mov r29,r18
	ldi r28,lo8(0)
.LVL183:
	mov r18,r19
.LVL184:
	ldi r19,lo8(0)
.LVL185:
	or r18,r28
	or r19,r29
.LVL186:
.LM279:
	lds r20,g_timeMain
	lds r21,(g_timeMain)+1
.LVL187:
	sub r18,r24
	sbc r19,r25
.LVL188:
	cp r18,r20
	cpc r19,r21
	brsh .L149
.LVL189:
	movw r18,r20
.L149:
	sts (g_timeMain)+1,r19
	sts g_timeMain,r18
	rjmp .L150
.LVL190:
.L151:
.LM280:
	in r24,85-32
	ori r24,lo8(32)
	out 85-32,r24
/* #APP */
 ;  713 "../src/er9x.cpp" 1
	sleep
	
 ;  0 "" 2
/* #NOAPP */
	in r24,85-32
	andi r24,lo8(-33)
	out 85-32,r24
.LVL191:
.L150:
	lds r24,g_tmr10ms
	lds r25,(g_tmr10ms)+1
.LVL192:
	cp r24,r12
	cpc r25,r13
	breq .L151
.LM281:
	lds r24,heartbeat
	cpi r24,lo8(3)
	breq .+2
	rjmp .L158
.LM282:
/* #APP */
 ;  716 "../src/er9x.cpp" 1
	wdr
 ;  0 "" 2
.LM283:
/* #NOAPP */
	sts heartbeat,__zero_reg__
	rjmp .L158
.LBE180:
.LFE49:
	.size	main, .-main
.global	_Z14putsDrSwitcheshhah
	.type	_Z14putsDrSwitcheshhah, @function
_Z14putsDrSwitcheshhah:
.LFB17:
.LM284:
.LVL193:
	push r14
	push r15
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
	mov r16,r24
	mov r15,r22
	mov r17,r20
	mov r14,r18
.LBB190:
.LM285:
	tst r20
	breq .L162
.LVL194:
	cpi r20,lo8(10)
	breq .L163
	cpi r20,lo8(-10)
	brne .L169
	rjmp .L171
.L162:
.LM286:
	subi r24,lo8(-(6))
	ldi r20,lo8(_ZZ14putsDrSwitcheshhahE3__c)
	ldi r21,hi8(_ZZ14putsDrSwitcheshhahE3__c)
.LVL195:
	rjmp .L170
.LVL196:
.L163:
.LM287:
	subi r24,lo8(-(6))
	ldi r20,lo8(_ZZ14putsDrSwitcheshhahE3__c_0)
	ldi r21,hi8(_ZZ14putsDrSwitcheshhahE3__c_0)
.LVL197:
	rjmp .L170
.LVL198:
.L171:
.LM288:
	subi r24,lo8(-(6))
	ldi r20,lo8(_ZZ14putsDrSwitcheshhahE3__c_1)
	ldi r21,hi8(_ZZ14putsDrSwitcheshhahE3__c_1)
.LVL199:
.L170:
	mov r18,r14
	call _Z11lcd_putsAtthhPKch
	rjmp .L168
.LVL200:
.L169:
.LM289:
	rol r20
	clr r20
	rol r20
.LVL201:
	subi r20,lo8(-(32))
	call _Z11lcd_putcAtthhch
.LM290:
	mov r18,r16
	subi r18,lo8(-(6))
	mov r20,r17
	clr r21
	sbrc r20,7
	com r21
.LVL202:
	sbrs r21,7
	rjmp .L167
	com r21
	neg r20
	sbci r21,lo8(-1)
.LVL203:
.L167:
	mov r24,r20
	clr r25
	sbrc r24,7
	com r25
	sbiw r24,1
	movw r20,r24
.LVL204:
	lsl r20
	rol r21
	add r20,r24
	adc r21,r25
	subi r20,lo8(-(_ZZ14putsDrSwitcheshhahE3__c_2))
	sbci r21,hi8(-(_ZZ14putsDrSwitcheshhahE3__c_2))
	mov r24,r18
	mov r22,r15
	ldi r18,lo8(3)
	mov r16,r14
.LVL205:
	call _Z12lcd_putsnAtthhPKchh
.LVL206:
.L168:
/* epilogue start */
.LBE190:
.LM291:
	pop r17
.LVL207:
	pop r16
.LVL208:
	pop r15
.LVL209:
	pop r14
.LVL210:
	ret
.LFE17:
	.size	_Z14putsDrSwitcheshhah, .-_Z14putsDrSwitcheshhah
.global	_Z7putsChnhhhh
	.type	_Z7putsChnhhhh, @function
_Z7putsChnhhhh:
.LFB16:
.LM292:
.LVL211:
	push r16
/* prologue: function */
/* frame size = 0 */
	mov r16,r18
.LBB191:
.LM293:
	ldi r21,lo8(0)
.LVL212:
	lsl r20
	rol r21
	lsl r20
	rol r21
.LVL213:
	subi r20,lo8(-(_ZZ7putsChnhhhhE3__c))
	sbci r21,hi8(-(_ZZ7putsChnhhhhE3__c))
.LVL214:
	ldi r18,lo8(4)
.LVL215:
	call _Z12lcd_putsnAtthhPKchh
.LVL216:
/* epilogue start */
.LBE191:
.LM294:
	pop r16
.LVL217:
	ret
.LFE16:
	.size	_Z7putsChnhhhh, .-_Z7putsChnhhhh
.global	_Z10putsChnRawhhhh
	.type	_Z10putsChnRawhhhh, @function
_Z10putsChnRawhhhh:
.LFB15:
.LM295:
.LVL218:
	push r16
/* prologue: function */
/* frame size = 0 */
	mov r16,r18
	mov r18,r20
.LVL219:
	ldi r19,lo8(0)
.LVL220:
.LBB192:
.LM296:
	subi r20,lo8(-(-1))
	cpi r20,lo8(4)
	brsh .L175
.LM297:
	lds r20,g_eeGeneral+50
.LVL221:
	ldi r21,lo8(0)
	lsl r20
	rol r21
	lsl r20
	rol r21
	subi r20,lo8(-(-1))
	sbci r21,hi8(-(-1))
	add r20,r18
	adc r21,r19
.LVL222:
	lsl r20
	rol r21
	lsl r20
	rol r21
	subi r20,lo8(-(modi12x3))
	sbci r21,hi8(-(modi12x3))
	rjmp .L178
.LVL223:
.L175:
.LM298:
	lsl r18
	rol r19
	lsl r18
	rol r19
.LVL224:
	subi r18,lo8(-(_ZZ10putsChnRawhhhhE3__c-20))
	sbci r19,hi8(-(_ZZ10putsChnRawhhhhE3__c-20))
.LVL225:
	movw r20,r18
.L178:
	ldi r18,lo8(4)
.LVL226:
	call _Z12lcd_putsnAtthhPKchh
.LVL227:
/* epilogue start */
.LBE192:
.LM299:
	pop r16
.LVL228:
	ret
.LFE15:
	.size	_Z10putsChnRawhhhh, .-_Z10putsChnRawhhhh
.global	_Z8putsVBathhh
	.type	_Z8putsVBathhh, @function
_Z8putsVBathhh:
.LFB14:
.LM300:
.LVL229:
	push r15
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
	mov r15,r22
	mov r17,r20
.LM301:
	mov r16,r24
	subi r16,lo8(-(24))
	mov r24,r16
.LVL230:
	ldi r20,lo8(86)
.LVL231:
	mov r18,r17
	call _Z11lcd_putcAtthhch
.LVL232:
.LM302:
	lds r20,g_vbat100mV
	ori r17,lo8(32)
	mov r24,r16
	mov r22,r15
	ldi r21,lo8(0)
	mov r18,r17
	call _Z13lcd_outdezAtthhih
/* epilogue start */
.LM303:
	pop r17
.LVL233:
	pop r16
	pop r15
.LVL234:
	ret
.LFE14:
	.size	_Z8putsVBathhh, .-_Z8putsVBathhh
.global	_Z8putsTimehhihh
	.type	_Z8putsTimehhihh, @function
_Z8putsTimehhihh:
.LFB13:
.LM304:
.LVL235:
	push r13
	push r14
	push r15
	push r16
.LVL236:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	mov r15,r24
	mov r14,r22
	movw r28,r20
	mov r17,r18
	mov r13,r16
.LVL237:
.LM305:
	sbrc r21,7
	rjmp .L182
.LVL238:
	ldi r20,lo8(32)
.LVL239:
	rjmp .L183
.LVL240:
.L182:
	ldi r20,lo8(45)
.LVL241:
.L183:
	mov r24,r15
	mov r22,r14
	mov r18,r17
	call _Z11lcd_putcAtthhch
.LM306:
	sbrc r17,7
	rjmp .L184
	ldi r24,lo8(17)
	rjmp .L185
.L184:
	ldi r24,lo8(25)
.L185:
	add r15,r24
.LVL242:
.LM307:
	mov r24,r15
	mov r22,r14
	ldi r20,lo8(58)
	mov r18,r17
	call _Z11lcd_putcAtthhch
.LBB193:
.LBB194:
.LM308:
	sbrs r29,7
	rjmp .L186
.LVL243:
	com r29
	neg r28
	sbci r29,lo8(-1)
.L186:
.LBE194:
.LBE193:
.LM309:
	movw r24,r28
	ldi r22,lo8(60)
	ldi r23,hi8(60)
	call __divmodhi4
	movw r20,r22
	mov r18,r17
	subi r18,lo8(-(4))
	mov r24,r15
	mov r22,r14
	ldi r16,lo8(2)
	call _Z14lcd_outdezNAtthhihh
.LM310:
	sbrc r17,7
	rjmp .L187
	ldi r18,lo8(18)
	rjmp .L188
.L187:
	ldi r18,lo8(24)
.L188:
.LM311:
	movw r24,r28
	ldi r22,lo8(60)
	ldi r23,hi8(60)
	call __divmodhi4
	movw r20,r24
	ldi r24,lo8(4)
	add r13,r24
	mov r24,r18
	add r24,r15
	mov r22,r14
	mov r18,r13
	ldi r16,lo8(2)
	call _Z14lcd_outdezNAtthhihh
/* epilogue start */
.LM312:
	pop r29
	pop r28
	pop r17
.LVL244:
	pop r16
	pop r15
.LVL245:
	pop r14
.LVL246:
	pop r13
.LVL247:
	ret
.LFE13:
	.size	_Z8putsTimehhihh, .-_Z8putsTimehhihh
.global	g_eeGeneral
.global	g_eeGeneral
	.section .bss
	.type	g_eeGeneral, @object
	.size	g_eeGeneral, 51
g_eeGeneral:
	.skip 51,0
.global	g_model
.global	g_model
	.type	g_model, @object
	.size	g_model, 395
g_model:
	.skip 395,0
.global	modi12x3
	.section	.progmem.data,"a",@progbits
	.type	modi12x3, @object
	.size	modi12x3, 65
modi12x3:
	.string	"RUD ELE THR AIL RUD THR ELE AIL AIL ELE THR RUD AIL THR ELE RUD "
.global	g_menuStack
.global	g_menuStack
	.section .bss
	.type	g_menuStack, @object
	.size	g_menuStack, 10
g_menuStack:
	.skip 10,0
.global	g_menuStackPtr
.global	g_menuStackPtr
	.type	g_menuStackPtr, @object
	.size	g_menuStackPtr, 1
g_menuStackPtr:
	.skip 1,0
.global	g_beepCnt
.global	g_beepCnt
	.type	g_beepCnt, @object
	.size	g_beepCnt, 1
g_beepCnt:
	.skip 1,0
.global	g_beepVal
.global	g_beepVal
	.type	g_beepVal, @object
	.size	g_beepVal, 4
g_beepVal:
	.skip 4,0
.global	checkIncDec_Ret
.global	checkIncDec_Ret
	.type	checkIncDec_Ret, @object
	.size	checkIncDec_Ret, 1
checkIncDec_Ret:
	.skip 1,0
.global	g_vbat100mV
.global	g_vbat100mV
	.type	g_vbat100mV, @object
	.size	g_vbat100mV, 1
g_vbat100mV:
	.skip 1,0
.global	captureRing
.global	captureRing
	.type	captureRing, @object
	.size	captureRing, 32
captureRing:
	.skip 32,0
.global	captureWr
.global	captureWr
	.type	captureWr, @object
	.size	captureWr, 1
captureWr:
	.skip 1,0
.global	captureRd
.global	captureRd
	.type	captureRd, @object
	.size	captureRd, 1
captureRd:
	.skip 1,0
.global	g_ppmIns
.global	g_ppmIns
	.type	g_ppmIns, @object
	.size	g_ppmIns, 16
g_ppmIns:
	.skip 16,0
.global	ppmInState
.global	ppmInState
	.type	ppmInState, @object
	.size	ppmInState, 1
ppmInState:
	.skip 1,0
.global	heartbeat
.global	heartbeat
	.type	heartbeat, @object
	.size	heartbeat, 1
heartbeat:
	.skip 1,0
.global	g_tmr16KHz
.global	g_tmr16KHz
	.type	g_tmr16KHz, @object
	.size	g_tmr16KHz, 1
g_tmr16KHz:
	.skip 1,0
	.lcomm _ZZ11__vector_25E8lastCapt,2
	.lcomm _ZL9s_anaFilt,16
	.lcomm _ZZ11__vector_21E5s_ana,16
	.lcomm _ZZ11__vector_21E4chan,1
	.section	.progmem.data
	.type	_ZZ5anaInhE8crossAna, @object
	.size	_ZZ5anaInhE8crossAna, 8
_ZZ5anaInhE8crossAna:
	.byte	3
	.byte	1
	.byte	2
	.byte	0
	.byte	4
	.byte	5
	.byte	6
	.byte	7
	.data
	.type	_ZZ11__vector_12E8pulsePtr, @object
	.size	_ZZ11__vector_12E8pulsePtr, 2
_ZZ11__vector_12E8pulsePtr:
	.word	pulses2MHz
	.lcomm _ZZ11__vector_12E8pulsePol,1
	.section	.progmem.data
	.type	_ZZ7perMainvE7beepTab, @object
	.size	_ZZ7perMainvE7beepTab, 16
_ZZ7perMainvE7beepTab:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	30
	.byte	100
	.byte	1
	.byte	1
	.byte	30
	.byte	100
	.byte	4
	.byte	4
	.byte	50
	.byte	-106
	.lcomm _ZZ7perMainvE10s_batCheck,1
	.type	_ZZ8pushMenuPFvhEE3__c, @object
	.size	_ZZ8pushMenuPFvhEE3__c, 19
_ZZ8pushMenuPFvhEE3__c:
	.string	"menuStack overflow"
	.type	_ZZ7popMenubE3__c, @object
	.size	_ZZ7popMenubE3__c, 20
_ZZ7popMenubE3__c:
	.string	"menuStack underflow"
	.type	_ZZ5alertPKcE3__c_0, @object
	.size	_ZZ5alertPKcE3__c_0, 14
_ZZ5alertPKcE3__c_0:
	.string	"press any Key"
	.type	_ZZ5alertPKcE3__c, @object
	.size	_ZZ5alertPKcE3__c, 6
_ZZ5alertPKcE3__c:
	.string	"ALERT"
	.type	_ZZ8checkTHRvE3__c, @object
	.size	_ZZ8checkTHRvE3__c, 13
_ZZ8checkTHRvE3__c:
	.string	"THR not idle"
	.type	_ZZ8checkMemvE3__c, @object
	.size	_ZZ8checkMemvE3__c, 15
_ZZ8checkMemvE3__c:
	.string	"EEPROM low mem"
	.type	_ZZ14putsDrSwitcheshhahE3__c_2, @object
	.size	_ZZ14putsDrSwitcheshhahE3__c_2, 28
_ZZ14putsDrSwitcheshhahE3__c_2:
	.string	"THRRUDELEID0ID1ID2AILGEATRN"
	.type	_ZZ14putsDrSwitcheshhahE3__c_1, @object
	.size	_ZZ14putsDrSwitcheshhahE3__c_1, 4
_ZZ14putsDrSwitcheshhahE3__c_1:
	.string	"OFF"
	.type	_ZZ14putsDrSwitcheshhahE3__c_0, @object
	.size	_ZZ14putsDrSwitcheshhahE3__c_0, 4
_ZZ14putsDrSwitcheshhahE3__c_0:
	.string	"ON "
	.type	_ZZ14putsDrSwitcheshhahE3__c, @object
	.size	_ZZ14putsDrSwitcheshhahE3__c, 4
_ZZ14putsDrSwitcheshhahE3__c:
	.string	" - "
	.type	_ZZ7putsChnhhhhE3__c, @object
	.size	_ZZ7putsChnhhhhE3__c, 125
_ZZ7putsChnhhhhE3__c:
	.ascii	"    CH1 CH2 CH3 CH4 CH5 CH6 CH7 CH8 CH9 CH10CH11CH12CH13CH14"
	.string	"CH15CH16CH17CH18CH19CH20CH21CH22CH23CH24CH25CH26CH27CH28CH29CH30"
	.type	_ZZ10putsChnRawhhhhE3__c, @object
	.size	_ZZ10putsChnRawhhhhE3__c, 141
_ZZ10putsChnRawhhhhE3__c:
	.ascii	"P1  P2  P3  MAX FULLCH1 CH2 CH3 CH4 CH5 CH6 CH7 CH8 CH9 CH10"
	.ascii	"CH11CH12CH13CH14"
	.string	"CH15CH16CH17CH18CH19CH20CH21CH22CH23CH24CH25CH26CH27CH28CH29CH30"
	.section	.debug_frame,"",@progbits
.Lframe0:
	.long	.LECIE0-.LSCIE0
.LSCIE0:
	.long	0xffffffff
	.byte	0x1
	.string	""
	.uleb128 0x1
	.sleb128 -1
	.byte	0x24
	.byte	0xc
	.uleb128 0x20
	.uleb128 0x0
	.p2align	2
.LECIE0:
.LSFDE0:
	.long	.LEFDE0-.LASFDE0
.LASFDE0:
	.long	.Lframe0
	.long	.LFB29
	.long	.LFE29-.LFB29
	.p2align	2
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB31
	.long	.LFE31-.LFB31
	.p2align	2
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB41
	.long	.LFE41-.LFB41
	.p2align	2
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.long	.Lframe0
	.long	.LFB42
	.long	.LFE42-.LFB42
	.p2align	2
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.long	.Lframe0
	.long	.LFB43
	.long	.LFE43-.LFB43
	.p2align	2
.LEFDE8:
.LSFDE10:
	.long	.LEFDE10-.LASFDE10
.LASFDE10:
	.long	.Lframe0
	.long	.LFB44
	.long	.LFE44-.LFB44
	.p2align	2
.LEFDE10:
.LSFDE12:
	.long	.LEFDE12-.LASFDE12
.LASFDE12:
	.long	.Lframe0
	.long	.LFB45
	.long	.LFE45-.LFB45
	.p2align	2
.LEFDE12:
.LSFDE14:
	.long	.LEFDE14-.LASFDE14
.LASFDE14:
	.long	.Lframe0
	.long	.LFB47
	.long	.LFE47-.LFB47
	.p2align	2
.LEFDE14:
.LSFDE16:
	.long	.LEFDE16-.LASFDE16
.LASFDE16:
	.long	.Lframe0
	.long	.LFB48
	.long	.LFE48-.LFB48
	.p2align	2
.LEFDE16:
.LSFDE18:
	.long	.LEFDE18-.LASFDE18
.LASFDE18:
	.long	.Lframe0
	.long	.LFB34
	.long	.LFE34-.LFB34
	.p2align	2
.LEFDE18:
.LSFDE20:
	.long	.LEFDE20-.LASFDE20
.LASFDE20:
	.long	.Lframe0
	.long	.LFB46
	.long	.LFE46-.LFB46
	.p2align	2
.LEFDE20:
.LSFDE22:
	.long	.LEFDE22-.LASFDE22
.LASFDE22:
	.long	.Lframe0
	.long	.LFB18
	.long	.LFE18-.LFB18
	.p2align	2
.LEFDE22:
.LSFDE24:
	.long	.LEFDE24-.LASFDE24
.LASFDE24:
	.long	.Lframe0
	.long	.LFB24
	.long	.LFE24-.LFB24
	.p2align	2
.LEFDE24:
.LSFDE26:
	.long	.LEFDE26-.LASFDE26
.LASFDE26:
	.long	.Lframe0
	.long	.LFB28
	.long	.LFE28-.LFB28
	.p2align	2
.LEFDE26:
.LSFDE28:
	.long	.LEFDE28-.LASFDE28
.LASFDE28:
	.long	.Lframe0
	.long	.LFB27
	.long	.LFE27-.LFB27
	.p2align	2
.LEFDE28:
.LSFDE30:
	.long	.LEFDE30-.LASFDE30
.LASFDE30:
	.long	.Lframe0
	.long	.LFB26
	.long	.LFE26-.LFB26
	.p2align	2
.LEFDE30:
.LSFDE32:
	.long	.LEFDE32-.LASFDE32
.LASFDE32:
	.long	.Lframe0
	.long	.LFB25
	.long	.LFE25-.LFB25
	.p2align	2
.LEFDE32:
.LSFDE34:
	.long	.LEFDE34-.LASFDE34
.LASFDE34:
	.long	.Lframe0
	.long	.LFB23
	.long	.LFE23-.LFB23
	.p2align	2
.LEFDE34:
.LSFDE36:
	.long	.LEFDE36-.LASFDE36
.LASFDE36:
	.long	.Lframe0
	.long	.LFB33
	.long	.LFE33-.LFB33
	.p2align	2
.LEFDE36:
.LSFDE38:
	.long	.LEFDE38-.LASFDE38
.LASFDE38:
	.long	.Lframe0
	.long	.LFB22
	.long	.LFE22-.LFB22
	.p2align	2
.LEFDE38:
.LSFDE40:
	.long	.LEFDE40-.LASFDE40
.LASFDE40:
	.long	.Lframe0
	.long	.LFB32
	.long	.LFE32-.LFB32
	.p2align	2
.LEFDE40:
.LSFDE42:
	.long	.LEFDE42-.LASFDE42
.LASFDE42:
	.long	.Lframe0
	.long	.LFB21
	.long	.LFE21-.LFB21
	.p2align	2
.LEFDE42:
.LSFDE44:
	.long	.LEFDE44-.LASFDE44
.LASFDE44:
	.long	.Lframe0
	.long	.LFB30
	.long	.LFE30-.LFB30
	.p2align	2
.LEFDE44:
.LSFDE46:
	.long	.LEFDE46-.LASFDE46
.LASFDE46:
	.long	.Lframe0
	.long	.LFB20
	.long	.LFE20-.LFB20
	.p2align	2
.LEFDE46:
.LSFDE48:
	.long	.LEFDE48-.LASFDE48
.LASFDE48:
	.long	.Lframe0
	.long	.LFB19
	.long	.LFE19-.LFB19
	.p2align	2
.LEFDE48:
.LSFDE50:
	.long	.LEFDE50-.LASFDE50
.LASFDE50:
	.long	.Lframe0
	.long	.LFB49
	.long	.LFE49-.LFB49
	.p2align	2
.LEFDE50:
.LSFDE52:
	.long	.LEFDE52-.LASFDE52
.LASFDE52:
	.long	.Lframe0
	.long	.LFB17
	.long	.LFE17-.LFB17
	.p2align	2
.LEFDE52:
.LSFDE54:
	.long	.LEFDE54-.LASFDE54
.LASFDE54:
	.long	.Lframe0
	.long	.LFB16
	.long	.LFE16-.LFB16
	.p2align	2
.LEFDE54:
.LSFDE56:
	.long	.LEFDE56-.LASFDE56
.LASFDE56:
	.long	.Lframe0
	.long	.LFB15
	.long	.LFE15-.LFB15
	.p2align	2
.LEFDE56:
.LSFDE58:
	.long	.LEFDE58-.LASFDE58
.LASFDE58:
	.long	.Lframe0
	.long	.LFB14
	.long	.LFE14-.LFB14
	.p2align	2
.LEFDE58:
.LSFDE60:
	.long	.LEFDE60-.LASFDE60
.LASFDE60:
	.long	.Lframe0
	.long	.LFB13
	.long	.LFE13-.LFB13
	.p2align	2
.LEFDE60:
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST2:
	.long	.LVL0-.Ltext0
	.long	.LVL1-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL1-.Ltext0
	.long	.LVL2-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST4:
	.long	.LVL3-.Ltext0
	.long	.LVL4-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL4-.Ltext0
	.long	.LVL6-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST5:
	.long	.LVL6-.Ltext0
	.long	.LVL7-.Ltext0
	.word	0x1
	.byte	0x6e
	.long	.LVL7-.Ltext0
	.long	.LVL10-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST10:
	.long	.LVL11-.Ltext0
	.long	.LVL13-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL13-.Ltext0
	.long	.LVL14-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL14-.Ltext0
	.long	.LVL16-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST11:
	.long	.LVL12-.Ltext0
	.long	.LVL15-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST13:
	.long	.LVL17-.Ltext0
	.long	.LVL19-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST14:
	.long	.LVL18-.Ltext0
	.long	.LVL20-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST17:
	.long	.LVL22-.Ltext0
	.long	.LVL25-.Ltext0
	.word	0x1
	.byte	0x69
	.long	.LVL39-.Ltext0
	.long	.LFE34-.Ltext0
	.word	0x1
	.byte	0x69
	.long	0x0
	.long	0x0
.LLST18:
	.long	.LVL23-.Ltext0
	.long	.LVL24-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL25-.Ltext0
	.long	.LVL26-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL27-.Ltext0
	.long	.LVL28-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL28-.Ltext0
	.long	.LVL29-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL29-.Ltext0
	.long	.LVL31-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL32-.Ltext0
	.long	.LVL33-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL33-.Ltext0
	.long	.LVL34-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL34-.Ltext0
	.long	.LVL35-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL36-.Ltext0
	.long	.LVL38-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL40-.Ltext0
	.long	.LFE34-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST21:
	.long	.LVL41-.Ltext0
	.long	.LVL44-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL44-.Ltext0
	.long	.LVL45-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL45-.Ltext0
	.long	.LVL46-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL46-.Ltext0
	.long	.LVL47-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL49-.Ltext0
	.long	.LVL50-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL50-.Ltext0
	.long	.LVL51-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL52-.Ltext0
	.long	.LVL53-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST22:
	.long	.LVL41-.Ltext0
	.long	.LVL47-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL48-.Ltext0
	.long	.LVL51-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL52-.Ltext0
	.long	.LFE18-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST24:
	.long	.LVL54-.Ltext0
	.long	.LVL58-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL58-.Ltext0
	.long	.LVL82-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	.LVL88-.Ltext0
	.long	.LFE24-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST25:
	.long	.LVL54-.Ltext0
	.long	.LVL58-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL58-.Ltext0
	.long	.LVL85-.Ltext0
	.word	0x6
	.byte	0x5a
	.byte	0x93
	.uleb128 0x1
	.byte	0x5b
	.byte	0x93
	.uleb128 0x1
	.long	.LVL85-.Ltext0
	.long	.LVL88-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL88-.Ltext0
	.long	.LFE24-.Ltext0
	.word	0x6
	.byte	0x5a
	.byte	0x93
	.uleb128 0x1
	.byte	0x5b
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST26:
	.long	.LVL54-.Ltext0
	.long	.LVL58-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL58-.Ltext0
	.long	.LVL87-.Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x1
	.byte	0x57
	.byte	0x93
	.uleb128 0x1
	.long	.LVL87-.Ltext0
	.long	.LVL88-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL88-.Ltext0
	.long	.LFE24-.Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x1
	.byte	0x57
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST27:
	.long	.LVL54-.Ltext0
	.long	.LVL57-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL57-.Ltext0
	.long	.LVL86-.Ltext0
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	.LVL88-.Ltext0
	.long	.LFE24-.Ltext0
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST28:
	.long	.LVL54-.Ltext0
	.long	.LVL55-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL56-.Ltext0
	.long	.LVL58-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL58-.Ltext0
	.long	.LVL83-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL88-.Ltext0
	.long	.LFE24-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	0x0
	.long	0x0
.LLST29:
	.long	.LVL59-.Ltext0
	.long	.LVL60-.Ltext0
	.word	0x6
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL61-.Ltext0
	.long	.LVL84-.Ltext0
	.word	0x6
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL88-.Ltext0
	.long	.LFE24-.Ltext0
	.word	0x6
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST30:
	.long	.LVL68-.Ltext0
	.long	.LVL70-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL71-.Ltext0
	.long	.LVL79-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL89-.Ltext0
	.long	.LFE24-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST31:
	.long	.LVL63-.Ltext0
	.long	.LVL64-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL66-.Ltext0
	.long	.LVL81-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL88-.Ltext0
	.long	.LFE24-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST32:
	.long	.LVL62-.Ltext0
	.long	.LVL64-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL65-.Ltext0
	.long	.LVL80-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL88-.Ltext0
	.long	.LFE24-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST33:
	.long	.LVL69-.Ltext0
	.long	.LVL70-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL72-.Ltext0
	.long	.LVL73-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST35:
	.long	.LVL90-.Ltext0
	.long	.LVL94-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST36:
	.long	.LVL90-.Ltext0
	.long	.LVL93-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL93-.Ltext0
	.long	.LFE28-.Ltext0
	.word	0x2
	.byte	0x8c
	.sleb128 1
	.long	0x0
	.long	0x0
.LLST37:
	.long	.LVL90-.Ltext0
	.long	.LVL94-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST38:
	.long	.LVL90-.Ltext0
	.long	.LVL94-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST40:
	.long	.LVL95-.Ltext0
	.long	.LVL99-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST41:
	.long	.LVL95-.Ltext0
	.long	.LVL98-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL98-.Ltext0
	.long	.LFE27-.Ltext0
	.word	0x2
	.byte	0x8c
	.sleb128 1
	.long	0x0
	.long	0x0
.LLST42:
	.long	.LVL95-.Ltext0
	.long	.LVL99-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST43:
	.long	.LVL95-.Ltext0
	.long	.LVL99-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST45:
	.long	.LVL100-.Ltext0
	.long	.LVL104-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST46:
	.long	.LVL100-.Ltext0
	.long	.LVL103-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL103-.Ltext0
	.long	.LFE26-.Ltext0
	.word	0x2
	.byte	0x8c
	.sleb128 1
	.long	0x0
	.long	0x0
.LLST47:
	.long	.LVL100-.Ltext0
	.long	.LVL104-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST48:
	.long	.LVL100-.Ltext0
	.long	.LVL104-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST50:
	.long	.LVL105-.Ltext0
	.long	.LVL109-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST51:
	.long	.LVL105-.Ltext0
	.long	.LVL108-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL108-.Ltext0
	.long	.LFE25-.Ltext0
	.word	0x2
	.byte	0x8c
	.sleb128 1
	.long	0x0
	.long	0x0
.LLST52:
	.long	.LVL105-.Ltext0
	.long	.LVL109-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST53:
	.long	.LVL105-.Ltext0
	.long	.LVL109-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST55:
	.long	.LVL110-.Ltext0
	.long	.LVL114-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL114-.Ltext0
	.long	.LVL136-.Ltext0
	.word	0x1
	.byte	0x6a
	.long	.LVL137-.Ltext0
	.long	.LVL138-.Ltext0
	.word	0x1
	.byte	0x6a
	.long	.LVL139-.Ltext0
	.long	.LVL140-.Ltext0
	.word	0x1
	.byte	0x6a
	.long	.LVL142-.Ltext0
	.long	.LFE23-.Ltext0
	.word	0x1
	.byte	0x6a
	.long	0x0
	.long	0x0
.LLST56:
	.long	.LVL111-.Ltext0
	.long	.LVL120-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL122-.Ltext0
	.long	.LVL123-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL142-.Ltext0
	.long	.LFE23-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST57:
	.long	.LVL116-.Ltext0
	.long	.LVL119-.Ltext0
	.word	0x1
	.byte	0x63
	.long	.LVL119-.Ltext0
	.long	.LVL124-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST58:
	.long	.LVL117-.Ltext0
	.long	.LVL118-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL121-.Ltext0
	.long	.LVL128-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL128-.Ltext0
	.long	.LVL133-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL134-.Ltext0
	.long	.LVL136-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL137-.Ltext0
	.long	.LVL138-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL139-.Ltext0
	.long	.LVL141-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST59:
	.long	.LVL125-.Ltext0
	.long	.LVL126-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL127-.Ltext0
	.long	.LVL135-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL137-.Ltext0
	.long	.LVL143-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST60:
	.long	.LVL130-.Ltext0
	.long	.LVL131-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL132-.Ltext0
	.long	.LVL136-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL137-.Ltext0
	.long	.LVL138-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL139-.Ltext0
	.long	.LVL141-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST62:
	.long	.LVL148-.Ltext0
	.long	.LVL149-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL150-.Ltext0
	.long	.LFE33-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST63:
	.long	.LVL144-.Ltext0
	.long	.LVL145-.Ltext0
	.word	0x1
	.byte	0x6e
	.long	.LVL145-.Ltext0
	.long	.LVL148-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST65:
	.long	.LVL151-.Ltext0
	.long	.LVL152-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL152-.Ltext0
	.long	.LVL153-.Ltext0
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST67:
	.long	.LVL154-.Ltext0
	.long	.LVL155-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL155-.Ltext0
	.long	.LVL156-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL157-.Ltext0
	.long	.LVL158-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST69:
	.long	.LVL159-.Ltext0
	.long	.LVL160-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST71:
	.long	.LVL161-.Ltext0
	.long	.LVL162-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL163-.Ltext0
	.long	.LVL164-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST73:
	.long	.LVL165-.Ltext0
	.long	.LVL166-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL166-.Ltext0
	.long	.LVL168-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL172-.Ltext0
	.long	.LVL173-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST74:
	.long	.LVL168-.Ltext0
	.long	.LVL169-.Ltext0
	.word	0x1
	.byte	0x6e
	.long	.LVL169-.Ltext0
	.long	.LVL172-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST77:
	.long	.LVL175-.Ltext0
	.long	.LVL178-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL185-.Ltext0
	.long	.LVL187-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL187-.Ltext0
	.long	.LVL188-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL188-.Ltext0
	.long	.LVL189-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL189-.Ltext0
	.long	.LVL190-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL190-.Ltext0
	.long	.LFE49-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST78:
	.long	.LVL175-.Ltext0
	.long	.LVL177-.Ltext0
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL177-.Ltext0
	.long	.LVL180-.Ltext0
	.word	0x6
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL180-.Ltext0
	.long	.LFE49-.Ltext0
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST79:
	.long	.LVL176-.Ltext0
	.long	.LVL178-.Ltext0
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL178-.Ltext0
	.long	.LVL181-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL181-.Ltext0
	.long	.LVL190-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL191-.Ltext0
	.long	.LVL192-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST80:
	.long	.LVL175-.Ltext0
	.long	.LVL179-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL179-.Ltext0
	.long	.LVL183-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL183-.Ltext0
	.long	.LFE49-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST81:
	.long	.LVL178-.Ltext0
	.long	.LVL185-.Ltext0
	.word	0x1
	.byte	0x63
	.long	0x0
	.long	0x0
.LLST83:
	.long	.LVL193-.Ltext0
	.long	.LVL194-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL194-.Ltext0
	.long	.LVL205-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL206-.Ltext0
	.long	.LVL208-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST84:
	.long	.LVL193-.Ltext0
	.long	.LVL194-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL194-.Ltext0
	.long	.LVL209-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST85:
	.long	.LVL193-.Ltext0
	.long	.LVL195-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL195-.Ltext0
	.long	.LVL196-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL196-.Ltext0
	.long	.LVL197-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL197-.Ltext0
	.long	.LVL198-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL198-.Ltext0
	.long	.LVL199-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL199-.Ltext0
	.long	.LVL200-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL200-.Ltext0
	.long	.LVL201-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL201-.Ltext0
	.long	.LVL202-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL202-.Ltext0
	.long	.LVL204-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL206-.Ltext0
	.long	.LVL207-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST86:
	.long	.LVL193-.Ltext0
	.long	.LVL194-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL194-.Ltext0
	.long	.LVL210-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	0x0
	.long	0x0
.LLST88:
	.long	.LVL211-.Ltext0
	.long	.LVL216-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST89:
	.long	.LVL211-.Ltext0
	.long	.LVL216-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST90:
	.long	.LVL211-.Ltext0
	.long	.LVL212-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL212-.Ltext0
	.long	.LVL216-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST91:
	.long	.LVL211-.Ltext0
	.long	.LVL215-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL215-.Ltext0
	.long	.LVL217-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST93:
	.long	.LVL218-.Ltext0
	.long	.LVL227-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST94:
	.long	.LVL218-.Ltext0
	.long	.LVL227-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST95:
	.long	.LVL218-.Ltext0
	.long	.LVL220-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL220-.Ltext0
	.long	.LVL221-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL222-.Ltext0
	.long	.LVL223-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL223-.Ltext0
	.long	.LVL224-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL224-.Ltext0
	.long	.LVL226-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST96:
	.long	.LVL218-.Ltext0
	.long	.LVL219-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL219-.Ltext0
	.long	.LVL228-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST98:
	.long	.LVL229-.Ltext0
	.long	.LVL230-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST99:
	.long	.LVL229-.Ltext0
	.long	.LVL232-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL232-.Ltext0
	.long	.LVL234-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST100:
	.long	.LVL229-.Ltext0
	.long	.LVL231-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL231-.Ltext0
	.long	.LVL233-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST102:
	.long	.LVL235-.Ltext0
	.long	.LVL238-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL238-.Ltext0
	.long	.LVL245-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST103:
	.long	.LVL235-.Ltext0
	.long	.LVL238-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL238-.Ltext0
	.long	.LVL246-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	0x0
	.long	0x0
.LLST104:
	.long	.LVL235-.Ltext0
	.long	.LVL239-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL239-.Ltext0
	.long	.LVL240-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL240-.Ltext0
	.long	.LVL241-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL241-.Ltext0
	.long	.LVL243-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST105:
	.long	.LVL235-.Ltext0
	.long	.LVL238-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL238-.Ltext0
	.long	.LVL244-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST106:
	.long	.LVL235-.Ltext0
	.long	.LVL236-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL237-.Ltext0
	.long	.LVL238-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL238-.Ltext0
	.long	.LVL247-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	0x0
	.long	0x0
	.section	.debug_info
	.long	0x1688
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF214
	.byte	0x4
	.long	.LASF215
	.long	.LASF216
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x3
	.byte	0x79
	.long	0x30
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x2
	.long	.LASF1
	.byte	0x3
	.byte	0x7a
	.long	0x42
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x2
	.long	.LASF4
	.byte	0x3
	.byte	0x7b
	.long	0x54
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.long	.LASF5
	.byte	0x3
	.byte	0x7c
	.long	0x66
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF6
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.long	.LASF7
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF9
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF10
	.uleb128 0x2
	.long	.LASF11
	.byte	0x4
	.byte	0xd4
	.long	0x94
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.long	.LASF12
	.byte	0x4
	.byte	0xd8
	.long	0x97
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF13
	.uleb128 0x6
	.long	.LASF217
	.byte	0x2
	.byte	0x2
	.byte	0x8f
	.long	0x143
	.uleb128 0x7
	.long	.LASF14
	.sleb128 0
	.uleb128 0x7
	.long	.LASF15
	.sleb128 1
	.uleb128 0x7
	.long	.LASF16
	.sleb128 2
	.uleb128 0x7
	.long	.LASF17
	.sleb128 3
	.uleb128 0x7
	.long	.LASF18
	.sleb128 4
	.uleb128 0x7
	.long	.LASF19
	.sleb128 5
	.uleb128 0x7
	.long	.LASF20
	.sleb128 6
	.uleb128 0x7
	.long	.LASF21
	.sleb128 7
	.uleb128 0x7
	.long	.LASF22
	.sleb128 8
	.uleb128 0x7
	.long	.LASF23
	.sleb128 9
	.uleb128 0x7
	.long	.LASF24
	.sleb128 10
	.uleb128 0x7
	.long	.LASF25
	.sleb128 11
	.uleb128 0x7
	.long	.LASF26
	.sleb128 12
	.uleb128 0x7
	.long	.LASF27
	.sleb128 13
	.uleb128 0x7
	.long	.LASF28
	.sleb128 14
	.uleb128 0x7
	.long	.LASF29
	.sleb128 15
	.uleb128 0x7
	.long	.LASF30
	.sleb128 16
	.uleb128 0x7
	.long	.LASF31
	.sleb128 17
	.uleb128 0x7
	.long	.LASF32
	.sleb128 18
	.uleb128 0x7
	.long	.LASF33
	.sleb128 19
	.uleb128 0x7
	.long	.LASF34
	.sleb128 20
	.uleb128 0x7
	.long	.LASF35
	.sleb128 21
	.uleb128 0x7
	.long	.LASF36
	.sleb128 22
	.byte	0x0
	.uleb128 0x2
	.long	.LASF37
	.byte	0x2
	.byte	0xd2
	.long	0x14e
	.uleb128 0x8
	.byte	0x2
	.long	0x154
	.uleb128 0x9
	.long	0x15f
	.uleb128 0xa
	.long	0x37
	.byte	0x0
	.uleb128 0xb
	.long	.LASF43
	.byte	0x2
	.byte	0x5
	.byte	0x1d
	.long	0x1b0
	.uleb128 0xc
	.long	.LASF38
	.byte	0x5
	.byte	0x1e
	.long	0x37
	.byte	0x1
	.byte	0x3
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.long	.LASF39
	.byte	0x5
	.byte	0x1f
	.long	0x25
	.byte	0x1
	.byte	0x5
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.long	.LASF40
	.byte	0x5
	.byte	0x20
	.long	0x25
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xc
	.long	.LASF41
	.byte	0x5
	.byte	0x21
	.long	0x37
	.byte	0x1
	.byte	0x2
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0x0
	.uleb128 0x2
	.long	.LASF42
	.byte	0x5
	.byte	0x22
	.long	0x15f
	.uleb128 0xb
	.long	.LASF44
	.byte	0x10
	.byte	0x5
	.byte	0x24
	.long	0x1e4
	.uleb128 0xd
	.long	.LASF45
	.byte	0x5
	.byte	0x25
	.long	0x1e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.long	.LASF46
	.byte	0x5
	.byte	0x26
	.long	0x1f7
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xe
	.long	0x49
	.long	0x1f4
	.uleb128 0xf
	.long	0x1f4
	.byte	0x3
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.uleb128 0xe
	.long	0x1b0
	.long	0x207
	.uleb128 0xf
	.long	0x1f4
	.byte	0x3
	.byte	0x0
	.uleb128 0x2
	.long	.LASF47
	.byte	0x5
	.byte	0x27
	.long	0x1bb
	.uleb128 0xb
	.long	.LASF48
	.byte	0x33
	.byte	0x5
	.byte	0x2a
	.long	0x2e3
	.uleb128 0xd
	.long	.LASF49
	.byte	0x5
	.byte	0x2b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.long	.LASF50
	.byte	0x5
	.byte	0x2c
	.long	0x1e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xd
	.long	.LASF51
	.byte	0x5
	.byte	0x2d
	.long	0x1e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xd
	.long	.LASF52
	.byte	0x5
	.byte	0x2e
	.long	0x1e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x11
	.uleb128 0xd
	.long	.LASF53
	.byte	0x5
	.byte	0x2f
	.long	0x5b
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xd
	.long	.LASF54
	.byte	0x5
	.byte	0x30
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1b
	.uleb128 0xd
	.long	.LASF55
	.byte	0x5
	.byte	0x31
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xd
	.long	.LASF56
	.byte	0x5
	.byte	0x32
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0xd
	.long	.LASF57
	.byte	0x5
	.byte	0x33
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xd
	.long	.LASF58
	.byte	0x5
	.byte	0x34
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1f
	.uleb128 0xd
	.long	.LASF59
	.byte	0x5
	.byte	0x35
	.long	0x207
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xd
	.long	.LASF60
	.byte	0x5
	.byte	0x36
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xd
	.long	.LASF61
	.byte	0x5
	.byte	0x3b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x31
	.uleb128 0xd
	.long	.LASF62
	.byte	0x5
	.byte	0x3c
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x32
	.byte	0x0
	.uleb128 0x2
	.long	.LASF63
	.byte	0x5
	.byte	0x3d
	.long	0x212
	.uleb128 0xb
	.long	.LASF64
	.byte	0x5
	.byte	0x5
	.byte	0x47
	.long	0x341
	.uleb128 0xd
	.long	.LASF65
	.byte	0x5
	.byte	0x48
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.long	.LASF66
	.byte	0x5
	.byte	0x49
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xd
	.long	.LASF67
	.byte	0x5
	.byte	0x4a
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xd
	.long	.LASF68
	.byte	0x5
	.byte	0x4b
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xd
	.long	.LASF69
	.byte	0x5
	.byte	0x4c
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.long	.LASF70
	.byte	0x5
	.byte	0x4d
	.long	0x2ee
	.uleb128 0xb
	.long	.LASF71
	.byte	0x3
	.byte	0x5
	.byte	0x4f
	.long	0x375
	.uleb128 0xd
	.long	.LASF72
	.byte	0x5
	.byte	0x50
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.long	.LASF73
	.byte	0x5
	.byte	0x51
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0x0
	.uleb128 0x2
	.long	.LASF74
	.byte	0x5
	.byte	0x52
	.long	0x34c
	.uleb128 0xb
	.long	.LASF75
	.byte	0x5
	.byte	0x5
	.byte	0x54
	.long	0x3c5
	.uleb128 0x10
	.string	"min"
	.byte	0x5
	.byte	0x55
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.string	"max"
	.byte	0x5
	.byte	0x56
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xd
	.long	.LASF76
	.byte	0x5
	.byte	0x57
	.long	0xa5
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xd
	.long	.LASF77
	.byte	0x5
	.byte	0x58
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0x2
	.long	.LASF78
	.byte	0x5
	.byte	0x59
	.long	0x380
	.uleb128 0xb
	.long	.LASF79
	.byte	0x6
	.byte	0x5
	.byte	0x5c
	.long	0x459
	.uleb128 0xd
	.long	.LASF80
	.byte	0x5
	.byte	0x5d
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.long	.LASF81
	.byte	0x5
	.byte	0x5e
	.long	0x37
	.byte	0x1
	.byte	0x7
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xc
	.long	.LASF82
	.byte	0x5
	.byte	0x5f
	.long	0x37
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xd
	.long	.LASF83
	.byte	0x5
	.byte	0x60
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xd
	.long	.LASF39
	.byte	0x5
	.byte	0x61
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xd
	.long	.LASF84
	.byte	0x5
	.byte	0x62
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xc
	.long	.LASF85
	.byte	0x5
	.byte	0x63
	.long	0x37
	.byte	0x1
	.byte	0x4
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0xc
	.long	.LASF86
	.byte	0x5
	.byte	0x64
	.long	0x37
	.byte	0x1
	.byte	0x4
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x2
	.long	.LASF87
	.byte	0x5
	.byte	0x65
	.long	0x3d0
	.uleb128 0x11
	.long	.LASF88
	.word	0x18b
	.byte	0x5
	.byte	0x68
	.long	0x557
	.uleb128 0xd
	.long	.LASF89
	.byte	0x5
	.byte	0x69
	.long	0x557
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.long	.LASF90
	.byte	0x5
	.byte	0x6a
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xd
	.long	.LASF91
	.byte	0x5
	.byte	0x6b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0xd
	.long	.LASF92
	.byte	0x5
	.byte	0x6c
	.long	0x5b
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xd
	.long	.LASF93
	.byte	0x5
	.byte	0x6d
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xd
	.long	.LASF94
	.byte	0x5
	.byte	0x6e
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0x10
	.string	"res"
	.byte	0x5
	.byte	0x6f
	.long	0x56e
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xd
	.long	.LASF95
	.byte	0x5
	.byte	0x70
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xd
	.long	.LASF96
	.byte	0x5
	.byte	0x71
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xd
	.long	.LASF97
	.byte	0x5
	.byte	0x72
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xd
	.long	.LASF98
	.byte	0x5
	.byte	0x73
	.long	0x57e
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xd
	.long	.LASF99
	.byte	0x5
	.byte	0x74
	.long	0x58e
	.byte	0x3
	.byte	0x23
	.uleb128 0xab
	.uleb128 0xd
	.long	.LASF100
	.byte	0x5
	.byte	0x75
	.long	0x59e
	.byte	0x3
	.byte	0x23
	.uleb128 0xb7
	.uleb128 0xd
	.long	.LASF101
	.byte	0x5
	.byte	0x76
	.long	0x5ae
	.byte	0x3
	.byte	0x23
	.uleb128 0x107
	.uleb128 0xd
	.long	.LASF102
	.byte	0x5
	.byte	0x77
	.long	0x5be
	.byte	0x3
	.byte	0x23
	.uleb128 0x11b
	.uleb128 0xd
	.long	.LASF103
	.byte	0x5
	.byte	0x78
	.long	0x5d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x143
	.byte	0x0
	.uleb128 0xe
	.long	0x567
	.long	0x567
	.uleb128 0xf
	.long	0x1f4
	.byte	0x9
	.byte	0x0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF104
	.uleb128 0xe
	.long	0x567
	.long	0x57e
	.uleb128 0xf
	.long	0x1f4
	.byte	0x1
	.byte	0x0
	.uleb128 0xe
	.long	0x459
	.long	0x58e
	.uleb128 0xf
	.long	0x1f4
	.byte	0x18
	.byte	0x0
	.uleb128 0xe
	.long	0x375
	.long	0x59e
	.uleb128 0xf
	.long	0x1f4
	.byte	0x3
	.byte	0x0
	.uleb128 0xe
	.long	0x3c5
	.long	0x5ae
	.uleb128 0xf
	.long	0x1f4
	.byte	0xf
	.byte	0x0
	.uleb128 0xe
	.long	0x341
	.long	0x5be
	.uleb128 0xf
	.long	0x1f4
	.byte	0x3
	.byte	0x0
	.uleb128 0xe
	.long	0x25
	.long	0x5d4
	.uleb128 0xf
	.long	0x1f4
	.byte	0x7
	.uleb128 0xf
	.long	0x1f4
	.byte	0x4
	.byte	0x0
	.uleb128 0xe
	.long	0x25
	.long	0x5ea
	.uleb128 0xf
	.long	0x1f4
	.byte	0x7
	.uleb128 0xf
	.long	0x1f4
	.byte	0x8
	.byte	0x0
	.uleb128 0x2
	.long	.LASF105
	.byte	0x5
	.byte	0x7c
	.long	0x464
	.uleb128 0x12
	.long	.LASF106
	.byte	0x1
	.byte	0x1
	.word	0x202
	.long	0x63f
	.uleb128 0x13
	.long	.LASF218
	.byte	0x1
	.word	0x203
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x3
	.uleb128 0x14
	.byte	0x1
	.long	.LASF106
	.byte	0x1
	.word	0x205
	.byte	0x1
	.long	0x627
	.uleb128 0x15
	.long	0x63f
	.byte	0x1
	.byte	0x0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF219
	.byte	0x1
	.word	0x209
	.byte	0x1
	.uleb128 0x15
	.long	0x63f
	.byte	0x1
	.uleb128 0x15
	.long	0x54
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.long	0x5f5
	.uleb128 0x17
	.byte	0x1
	.long	.LASF107
	.byte	0x2
	.word	0x1b2
	.byte	0x3
	.long	0x65e
	.uleb128 0x18
	.string	"b"
	.byte	0x2
	.word	0x1b2
	.long	0x37
	.byte	0x0
	.uleb128 0x19
	.long	0x612
	.byte	0x3
	.long	0x673
	.uleb128 0x1a
	.long	.LASF108
	.long	0x673
	.byte	0x1
	.byte	0x0
	.uleb128 0x1b
	.long	0x63f
	.uleb128 0x19
	.long	0x627
	.byte	0x3
	.long	0x697
	.uleb128 0x1a
	.long	.LASF108
	.long	0x673
	.byte	0x1
	.uleb128 0x1a
	.long	.LASF109
	.long	0x697
	.byte	0x1
	.byte	0x0
	.uleb128 0x1b
	.long	0x54
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF110
	.byte	0x2
	.word	0x150
	.long	0x66
	.byte	0x3
	.long	0x6c3
	.uleb128 0x18
	.string	"a"
	.byte	0x2
	.word	0x150
	.long	0x66
	.uleb128 0x18
	.string	"b"
	.byte	0x2
	.word	0x150
	.long	0x66
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF111
	.byte	0x2
	.word	0x14e
	.long	0x66
	.byte	0x3
	.long	0x6ea
	.uleb128 0x18
	.string	"a"
	.byte	0x2
	.word	0x14e
	.long	0x66
	.uleb128 0x18
	.string	"b"
	.byte	0x2
	.word	0x14e
	.long	0x66
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF112
	.byte	0x2
	.word	0x14c
	.long	0x30
	.byte	0x3
	.long	0x707
	.uleb128 0x18
	.string	"a"
	.byte	0x2
	.word	0x14c
	.long	0x30
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF113
	.byte	0x1
	.word	0x211
	.long	0x5b
	.byte	0x1
	.long	0x777
	.uleb128 0x1d
	.long	.LASF114
	.byte	0x1
	.word	0x211
	.long	0x37
	.uleb128 0x1e
	.string	"p"
	.byte	0x1
	.word	0x216
	.long	0x777
	.uleb128 0x1f
	.long	.LASF115
	.byte	0x1
	.word	0x217
	.long	0x5f5
	.uleb128 0x20
	.long	0x759
	.uleb128 0x1f
	.long	.LASF116
	.byte	0x1
	.word	0x216
	.long	0x5b
	.uleb128 0x1f
	.long	.LASF117
	.byte	0x1
	.word	0x216
	.long	0x37
	.byte	0x0
	.uleb128 0x20
	.long	0x764
	.uleb128 0x21
	.long	0x668
	.byte	0x0
	.uleb128 0x20
	.long	0x76f
	.uleb128 0x21
	.long	0x682
	.byte	0x0
	.uleb128 0x22
	.byte	0x5
	.byte	0x3
	.long	_ZZ5anaInhE8crossAna
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.long	0x77d
	.uleb128 0x23
	.long	0x5b
	.uleb128 0x24
	.byte	0x1
	.long	.LASF220
	.byte	0x1
	.word	0x22b
	.byte	0x1
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF118
	.byte	0x1
	.word	0x24d
	.long	0x5b
	.byte	0x1
	.long	0x7b5
	.uleb128 0x1e
	.string	"hb"
	.byte	0x1
	.word	0x250
	.long	0x37
	.uleb128 0x1e
	.string	"lb"
	.byte	0x1
	.word	0x251
	.long	0x37
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF119
	.byte	0x2
	.word	0x14c
	.long	0x54
	.byte	0x3
	.long	0x7d2
	.uleb128 0x18
	.string	"a"
	.byte	0x2
	.word	0x14c
	.long	0x54
	.byte	0x0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF221
	.byte	0x1
	.word	0x166
	.long	.LASF222
	.long	0x143
	.long	.LFB29
	.long	.LFE29
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.uleb128 0x26
	.byte	0x1
	.long	.LASF125
	.byte	0x1
	.word	0x174
	.long	.LASF127
	.long	.LFB31
	.long	.LFE31
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x82b
	.uleb128 0x27
	.long	.LASF134
	.byte	0x1
	.word	0x174
	.long	0x143
	.long	.LLST2
	.uleb128 0x28
	.long	0x645
	.long	.LBB104
	.long	.LBE104
	.byte	0x1
	.word	0x178
	.byte	0x0
	.uleb128 0x29
	.long	0x707
	.long	.LFB41
	.long	.LFE41
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x89f
	.uleb128 0x2a
	.long	0x719
	.long	.LLST4
	.uleb128 0x2b
	.long	0x725
	.uleb128 0x2b
	.long	0x72f
	.uleb128 0x2c
	.long	.LBB107
	.long	.LBE107
	.long	0x86e
	.uleb128 0x2b
	.long	0x740
	.uleb128 0x2d
	.long	0x74c
	.long	.LLST5
	.byte	0x0
	.uleb128 0x2e
	.long	0x65e
	.long	.LBB108
	.long	.LBE108
	.byte	0x1
	.word	0x217
	.long	0x888
	.uleb128 0x21
	.long	0x668
	.byte	0x0
	.uleb128 0x2f
	.long	0x678
	.long	.LBB111
	.long	.LBE111
	.byte	0x1
	.word	0x218
	.uleb128 0x21
	.long	0x682
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.byte	0x1
	.long	.LASF121
	.byte	0x1
	.word	0x21c
	.long	.LFB42
	.long	.LFE42
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x8dc
	.uleb128 0x31
	.long	.LASF114
	.byte	0x1
	.word	0x21e
	.long	0x37
	.byte	0x5
	.byte	0x3
	.long	_ZZ11__vector_21E4chan
	.uleb128 0x31
	.long	.LASF120
	.byte	0x1
	.word	0x21f
	.long	0x146e
	.byte	0x5
	.byte	0x3
	.long	_ZZ11__vector_21E5s_ana
	.byte	0x0
	.uleb128 0x32
	.long	0x782
	.long	.LFB43
	.long	.LFE43
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.uleb128 0x33
	.byte	0x1
	.long	.LASF132
	.byte	0x1
	.word	0x248
	.long	.LFB44
	.long	.LFE44
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.uleb128 0x29
	.long	0x78c
	.long	.LFB45
	.long	.LFE45
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x927
	.uleb128 0x2d
	.long	0x79e
	.long	.LLST10
	.uleb128 0x2d
	.long	0x7a9
	.long	.LLST11
	.byte	0x0
	.uleb128 0x30
	.byte	0x1
	.long	.LASF122
	.byte	0x1
	.word	0x26b
	.long	.LFB47
	.long	.LFE47
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x982
	.uleb128 0x34
	.long	.LASF123
	.byte	0x1
	.word	0x26d
	.long	0x5b
	.long	.LLST13
	.uleb128 0x35
	.string	"nWr"
	.byte	0x1
	.word	0x273
	.long	0x37
	.long	.LLST14
	.uleb128 0x28
	.long	0x645
	.long	.LBB116
	.long	.LBE116
	.byte	0x1
	.word	0x277
	.uleb128 0x31
	.long	.LASF124
	.byte	0x1
	.word	0x272
	.long	0x5b
	.byte	0x5
	.byte	0x3
	.long	_ZZ11__vector_25E8lastCapt
	.byte	0x0
	.uleb128 0x26
	.byte	0x1
	.long	.LASF126
	.byte	0x1
	.word	0x283
	.long	.LASF128
	.long	.LFB48
	.long	.LFE48
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x9bc
	.uleb128 0x36
	.long	.LBB119
	.long	.LBE119
	.uleb128 0x37
	.string	"val"
	.byte	0x1
	.word	0x287
	.long	0x5b
	.byte	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.byte	0x1
	.long	.LASF129
	.byte	0x1
	.word	0x1dc
	.long	.LFB34
	.long	.LFE34
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xa16
	.uleb128 0x35
	.string	"i"
	.byte	0x1
	.word	0x1e1
	.long	0x37
	.long	.LLST17
	.uleb128 0x35
	.string	"dt"
	.byte	0x1
	.word	0x1e4
	.long	0x5b
	.long	.LLST18
	.uleb128 0x31
	.long	.LASF130
	.byte	0x1
	.word	0x1de
	.long	0x37
	.byte	0x5
	.byte	0x3
	.long	_ZZ11__vector_12E8pulsePol
	.uleb128 0x31
	.long	.LASF131
	.byte	0x1
	.word	0x1df
	.long	0x1468
	.byte	0x5
	.byte	0x3
	.long	_ZZ11__vector_12E8pulsePtr
	.byte	0x0
	.uleb128 0x33
	.byte	0x1
	.long	.LASF133
	.byte	0x1
	.word	0x256
	.long	.LFB46
	.long	.LFE46
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.uleb128 0x38
	.byte	0x1
	.long	.LASF135
	.byte	0x1
	.byte	0x5a
	.long	.LASF137
	.long	0xa5
	.long	.LFB18
	.long	.LFE18
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xa67
	.uleb128 0x39
	.long	.LASF39
	.byte	0x1
	.byte	0x5a
	.long	0x25
	.long	.LLST21
	.uleb128 0x3a
	.string	"nc"
	.byte	0x1
	.byte	0x5a
	.long	0xa5
	.long	.LLST22
	.byte	0x0
	.uleb128 0x38
	.byte	0x1
	.long	.LASF136
	.byte	0x1
	.byte	0xd3
	.long	.LASF138
	.long	0xa5
	.long	.LFB24
	.long	.LFE24
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xb7e
	.uleb128 0x39
	.long	.LASF139
	.byte	0x1
	.byte	0xd3
	.long	0x37
	.long	.LLST24
	.uleb128 0x39
	.long	.LASF140
	.byte	0x1
	.byte	0xd3
	.long	0xb7e
	.long	.LLST25
	.uleb128 0x39
	.long	.LASF141
	.byte	0x1
	.byte	0xd3
	.long	0x49
	.long	.LLST26
	.uleb128 0x39
	.long	.LASF142
	.byte	0x1
	.byte	0xd3
	.long	0x49
	.long	.LLST27
	.uleb128 0x39
	.long	.LASF143
	.byte	0x1
	.byte	0xd3
	.long	0x37
	.long	.LLST28
	.uleb128 0x3b
	.string	"val"
	.byte	0x1
	.byte	0xd5
	.long	0x49
	.long	.LLST29
	.uleb128 0x3c
	.long	.LASF144
	.byte	0x1
	.byte	0xd6
	.long	0x49
	.long	.LLST30
	.uleb128 0x3b
	.string	"kpl"
	.byte	0x1
	.byte	0xd7
	.long	0x37
	.long	.LLST31
	.uleb128 0x3b
	.string	"kmi"
	.byte	0x1
	.byte	0xd7
	.long	0x37
	.long	.LLST32
	.uleb128 0x3c
	.long	.LASF145
	.byte	0x1
	.byte	0xd7
	.long	0x37
	.long	.LLST33
	.uleb128 0x28
	.long	0x645
	.long	.LBB123
	.long	.LBE123
	.byte	0x1
	.word	0x101
	.uleb128 0x3d
	.long	0x645
	.long	.LBB125
	.long	.LBE125
	.byte	0x1
	.byte	0xfc
	.uleb128 0x3d
	.long	0x645
	.long	.LBB127
	.long	.LBE127
	.byte	0x1
	.byte	0xf6
	.uleb128 0x3d
	.long	0x645
	.long	.LBB129
	.long	.LBE129
	.byte	0x1
	.byte	0xe8
	.uleb128 0x3d
	.long	0x645
	.long	.LBB131
	.long	.LBE131
	.byte	0x1
	.byte	0xe4
	.uleb128 0x36
	.long	.LBB133
	.long	.LBE133
	.uleb128 0x3e
	.string	"hlp"
	.byte	0x1
	.byte	0xdd
	.long	0x37
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.byte	0x2
	.uleb128 0x40
	.byte	0x1
	.long	.LASF146
	.byte	0x1
	.word	0x11a
	.long	.LASF149
	.long	0x25
	.long	.LFB28
	.long	.LFE28
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xbe1
	.uleb128 0x27
	.long	.LASF139
	.byte	0x1
	.word	0x11a
	.long	0x37
	.long	.LLST35
	.uleb128 0x27
	.long	.LASF147
	.byte	0x1
	.word	0x11a
	.long	0x25
	.long	.LLST36
	.uleb128 0x27
	.long	.LASF141
	.byte	0x1
	.word	0x11a
	.long	0x25
	.long	.LLST37
	.uleb128 0x27
	.long	.LASF142
	.byte	0x1
	.word	0x11a
	.long	0x25
	.long	.LLST38
	.byte	0x0
	.uleb128 0x40
	.byte	0x1
	.long	.LASF148
	.byte	0x1
	.word	0x115
	.long	.LASF150
	.long	0x25
	.long	.LFB27
	.long	.LFE27
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xc42
	.uleb128 0x27
	.long	.LASF139
	.byte	0x1
	.word	0x115
	.long	0x37
	.long	.LLST40
	.uleb128 0x27
	.long	.LASF147
	.byte	0x1
	.word	0x115
	.long	0x25
	.long	.LLST41
	.uleb128 0x27
	.long	.LASF141
	.byte	0x1
	.word	0x115
	.long	0x25
	.long	.LLST42
	.uleb128 0x27
	.long	.LASF142
	.byte	0x1
	.word	0x115
	.long	0x25
	.long	.LLST43
	.byte	0x0
	.uleb128 0x40
	.byte	0x1
	.long	.LASF151
	.byte	0x1
	.word	0x110
	.long	.LASF152
	.long	0x25
	.long	.LFB26
	.long	.LFE26
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xca3
	.uleb128 0x27
	.long	.LASF139
	.byte	0x1
	.word	0x110
	.long	0x37
	.long	.LLST45
	.uleb128 0x27
	.long	.LASF147
	.byte	0x1
	.word	0x110
	.long	0x25
	.long	.LLST46
	.uleb128 0x27
	.long	.LASF141
	.byte	0x1
	.word	0x110
	.long	0x25
	.long	.LLST47
	.uleb128 0x27
	.long	.LASF142
	.byte	0x1
	.word	0x110
	.long	0x25
	.long	.LLST48
	.byte	0x0
	.uleb128 0x40
	.byte	0x1
	.long	.LASF153
	.byte	0x1
	.word	0x10b
	.long	.LASF154
	.long	0x25
	.long	.LFB25
	.long	.LFE25
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xd04
	.uleb128 0x27
	.long	.LASF139
	.byte	0x1
	.word	0x10b
	.long	0x37
	.long	.LLST50
	.uleb128 0x27
	.long	.LASF147
	.byte	0x1
	.word	0x10b
	.long	0x25
	.long	.LLST51
	.uleb128 0x27
	.long	.LASF141
	.byte	0x1
	.word	0x10b
	.long	0x25
	.long	.LLST52
	.uleb128 0x27
	.long	.LASF142
	.byte	0x1
	.word	0x10b
	.long	0x25
	.long	.LLST53
	.byte	0x0
	.uleb128 0x38
	.byte	0x1
	.long	.LASF155
	.byte	0x1
	.byte	0xab
	.long	.LASF156
	.long	0x37
	.long	.LFB23
	.long	.LFE23
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xda9
	.uleb128 0x39
	.long	.LASF139
	.byte	0x1
	.byte	0xab
	.long	0x37
	.long	.LLST55
	.uleb128 0x3e
	.string	"k"
	.byte	0x1
	.byte	0xad
	.long	0x25
	.uleb128 0x3b
	.string	"s"
	.byte	0x1
	.byte	0xae
	.long	0x25
	.long	.LLST56
	.uleb128 0x36
	.long	.LBB136
	.long	.LBE136
	.uleb128 0x3b
	.string	"idx"
	.byte	0x1
	.byte	0xb4
	.long	0x37
	.long	.LLST57
	.uleb128 0x3b
	.string	"v"
	.byte	0x1
	.byte	0xb5
	.long	0x25
	.long	.LLST58
	.uleb128 0x3c
	.long	.LASF157
	.byte	0x1
	.byte	0xb6
	.long	0xa5
	.long	.LLST59
	.uleb128 0x3b
	.string	"x"
	.byte	0x1
	.byte	0xb8
	.long	0x49
	.long	.LLST60
	.uleb128 0x3d
	.long	0x645
	.long	.LBB137
	.long	.LBE137
	.byte	0x1
	.byte	0xc2
	.uleb128 0x3d
	.long	0x645
	.long	.LBB139
	.long	.LBE139
	.byte	0x1
	.byte	0xc8
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.byte	0x1
	.long	.LASF158
	.byte	0x1
	.word	0x18f
	.long	.LASF159
	.long	.LFB33
	.long	.LFE33
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xe9c
	.uleb128 0x1e
	.string	"evt"
	.byte	0x1
	.word	0x195
	.long	0x37
	.uleb128 0x2c
	.long	.LBB142
	.long	.LBE142
	.long	0xe6e
	.uleb128 0x35
	.string	"ab"
	.byte	0x1
	.word	0x1b1
	.long	0x5b
	.long	.LLST62
	.uleb128 0x2e
	.long	0x707
	.long	.LBB143
	.long	.LBE143
	.byte	0x1
	.word	0x1b1
	.long	0xe5d
	.uleb128 0x21
	.long	0x83f
	.uleb128 0x2b
	.long	0x725
	.uleb128 0x2b
	.long	0x72f
	.uleb128 0x2c
	.long	.LBB146
	.long	.LBE146
	.long	0xe2c
	.uleb128 0x2b
	.long	0x740
	.uleb128 0x2d
	.long	0x74c
	.long	.LLST63
	.byte	0x0
	.uleb128 0x2e
	.long	0x65e
	.long	.LBB147
	.long	.LBE147
	.byte	0x1
	.word	0x217
	.long	0xe46
	.uleb128 0x21
	.long	0x668
	.byte	0x0
	.uleb128 0x2f
	.long	0x678
	.long	.LBB150
	.long	.LBE150
	.byte	0x1
	.word	0x218
	.uleb128 0x21
	.long	0x682
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.long	0x645
	.long	.LBB152
	.long	.LBE152
	.byte	0x1
	.word	0x1b7
	.byte	0x0
	.uleb128 0x41
	.long	.LBB154
	.long	.LBE154
	.uleb128 0x31
	.long	.LASF160
	.byte	0x1
	.word	0x1b4
	.long	0x37
	.byte	0x5
	.byte	0x3
	.long	_ZZ7perMainvE10s_batCheck
	.uleb128 0x31
	.long	.LASF161
	.byte	0x1
	.word	0x1bd
	.long	0x1463
	.byte	0x5
	.byte	0x3
	.long	_ZZ7perMainvE7beepTab
	.byte	0x0
	.uleb128 0x42
	.byte	0x1
	.long	.LASF162
	.byte	0x1
	.byte	0x9e
	.long	.LASF166
	.long	.LFB22
	.long	.LFE22
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xef6
	.uleb128 0x3a
	.string	"s"
	.byte	0x1
	.byte	0x9e
	.long	0xef6
	.long	.LLST65
	.uleb128 0x3d
	.long	0x645
	.long	.LBB156
	.long	.LBE156
	.byte	0x1
	.byte	0xa5
	.uleb128 0x43
	.string	"__c"
	.byte	0x1
	.byte	0xa1
	.long	0x140f
	.byte	0x5
	.byte	0x3
	.long	_ZZ5alertPKcE3__c
	.uleb128 0x43
	.string	"__c"
	.byte	0x1
	.byte	0xa3
	.long	0x1424
	.byte	0x5
	.byte	0x3
	.long	_ZZ5alertPKcE3__c_0
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.long	0xefc
	.uleb128 0x1b
	.long	0x89
	.uleb128 0x26
	.byte	0x1
	.long	.LASF163
	.byte	0x1
	.word	0x17a
	.long	.LASF164
	.long	.LFB32
	.long	.LFE32
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xf50
	.uleb128 0x27
	.long	.LASF134
	.byte	0x1
	.word	0x17a
	.long	0x143
	.long	.LLST67
	.uleb128 0x28
	.long	0x645
	.long	.LBB159
	.long	.LBE159
	.byte	0x1
	.word	0x183
	.uleb128 0x37
	.string	"__c"
	.byte	0x1
	.word	0x180
	.long	0x144e
	.byte	0x5
	.byte	0x3
	.long	_ZZ8pushMenuPFvhEE3__c
	.byte	0x0
	.uleb128 0x42
	.byte	0x1
	.long	.LASF165
	.byte	0x1
	.byte	0x84
	.long	.LASF167
	.long	.LFB21
	.long	.LFE21
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xf88
	.uleb128 0x3b
	.string	"i"
	.byte	0x1
	.byte	0x87
	.long	0x37
	.long	.LLST69
	.uleb128 0x3d
	.long	0x645
	.long	.LBB162
	.long	.LBE162
	.byte	0x1
	.byte	0x8f
	.byte	0x0
	.uleb128 0x26
	.byte	0x1
	.long	.LASF168
	.byte	0x1
	.word	0x16a
	.long	.LASF169
	.long	.LFB30
	.long	.LFE30
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xfd7
	.uleb128 0x27
	.long	.LASF170
	.byte	0x1
	.word	0x16a
	.long	0xa5
	.long	.LLST71
	.uleb128 0x28
	.long	0x645
	.long	.LBB165
	.long	.LBE165
	.byte	0x1
	.word	0x16e
	.uleb128 0x37
	.string	"__c"
	.byte	0x1
	.word	0x171
	.long	0x1439
	.byte	0x5
	.byte	0x3
	.long	_ZZ7popMenubE3__c
	.byte	0x0
	.uleb128 0x42
	.byte	0x1
	.long	.LASF171
	.byte	0x1
	.byte	0x6e
	.long	.LASF172
	.long	.LFB20
	.long	.LFE20
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x1096
	.uleb128 0x3c
	.long	.LASF173
	.byte	0x1
	.byte	0x76
	.long	0x54
	.long	.LLST73
	.uleb128 0x3e
	.string	"v"
	.byte	0x1
	.byte	0x78
	.long	0x49
	.uleb128 0x44
	.long	.LASF174
	.byte	0x1
	.byte	0x7a
	.long	0x49
	.uleb128 0x45
	.long	0x707
	.long	.LBB168
	.long	.LBE168
	.byte	0x1
	.byte	0x78
	.long	0x1084
	.uleb128 0x21
	.long	0x83f
	.uleb128 0x2b
	.long	0x725
	.uleb128 0x2b
	.long	0x72f
	.uleb128 0x2c
	.long	.LBB171
	.long	.LBE171
	.long	0x1053
	.uleb128 0x2b
	.long	0x740
	.uleb128 0x2d
	.long	0x74c
	.long	.LLST74
	.byte	0x0
	.uleb128 0x2e
	.long	0x65e
	.long	.LBB172
	.long	.LBE172
	.byte	0x1
	.word	0x217
	.long	0x106d
	.uleb128 0x21
	.long	0x668
	.byte	0x0
	.uleb128 0x2f
	.long	0x678
	.long	.LBB175
	.long	.LBE175
	.byte	0x1
	.word	0x218
	.uleb128 0x21
	.long	0x682
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.string	"__c"
	.byte	0x1
	.byte	0x80
	.long	0x13fa
	.byte	0x5
	.byte	0x3
	.long	_ZZ8checkTHRvE3__c
	.byte	0x0
	.uleb128 0x42
	.byte	0x1
	.long	.LASF175
	.byte	0x1
	.byte	0x65
	.long	.LASF176
	.long	.LFB19
	.long	.LFE19
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x10c3
	.uleb128 0x43
	.string	"__c"
	.byte	0x1
	.byte	0x6a
	.long	0x13e5
	.byte	0x5
	.byte	0x3
	.long	_ZZ8checkMemvE3__c
	.byte	0x0
	.uleb128 0x46
	.byte	0x1
	.long	.LASF177
	.byte	0x1
	.word	0x29c
	.long	0x54
	.long	.LFB49
	.long	.LFE49
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x1158
	.uleb128 0x28
	.long	0x782
	.long	.LBB178
	.long	.LBE178
	.byte	0x1
	.word	0x2bb
	.uleb128 0x31
	.long	.LASF178
	.byte	0x1
	.word	0x2c4
	.long	0x5b
	.byte	0x6
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x35
	.string	"t0"
	.byte	0x1
	.word	0x2c5
	.long	0x5b
	.long	.LLST77
	.uleb128 0x47
	.long	0x78c
	.long	.Ldebug_ranges0+0x0
	.byte	0x1
	.word	0x2c5
	.long	0x1134
	.uleb128 0x2d
	.long	0x79e
	.long	.LLST78
	.uleb128 0x2d
	.long	0x7a9
	.long	.LLST79
	.byte	0x0
	.uleb128 0x2f
	.long	0x78c
	.long	.LBB186
	.long	.LBE186
	.byte	0x1
	.word	0x2c7
	.uleb128 0x2d
	.long	0x79e
	.long	.LLST80
	.uleb128 0x2d
	.long	0x7a9
	.long	.LLST81
	.byte	0x0
	.byte	0x0
	.uleb128 0x42
	.byte	0x1
	.long	.LASF179
	.byte	0x1
	.byte	0x50
	.long	.LASF180
	.long	.LFB17
	.long	.LFE17
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x11f0
	.uleb128 0x3a
	.string	"x"
	.byte	0x1
	.byte	0x50
	.long	0x37
	.long	.LLST83
	.uleb128 0x3a
	.string	"y"
	.byte	0x1
	.byte	0x50
	.long	0x37
	.long	.LLST84
	.uleb128 0x39
	.long	.LASF181
	.byte	0x1
	.byte	0x50
	.long	0x25
	.long	.LLST85
	.uleb128 0x3a
	.string	"att"
	.byte	0x1
	.byte	0x50
	.long	0x37
	.long	.LLST86
	.uleb128 0x43
	.string	"__c"
	.byte	0x1
	.byte	0x53
	.long	0x13b1
	.byte	0x5
	.byte	0x3
	.long	_ZZ14putsDrSwitcheshhahE3__c
	.uleb128 0x43
	.string	"__c"
	.byte	0x1
	.byte	0x54
	.long	0x13b6
	.byte	0x5
	.byte	0x3
	.long	_ZZ14putsDrSwitcheshhahE3__c_0
	.uleb128 0x43
	.string	"__c"
	.byte	0x1
	.byte	0x55
	.long	0x13bb
	.byte	0x5
	.byte	0x3
	.long	_ZZ14putsDrSwitcheshhahE3__c_1
	.uleb128 0x43
	.string	"__c"
	.byte	0x1
	.byte	0x58
	.long	0x13d0
	.byte	0x5
	.byte	0x3
	.long	_ZZ14putsDrSwitcheshhahE3__c_2
	.byte	0x0
	.uleb128 0x42
	.byte	0x1
	.long	.LASF182
	.byte	0x1
	.byte	0x45
	.long	.LASF183
	.long	.LFB16
	.long	.LFE16
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x1255
	.uleb128 0x3a
	.string	"x"
	.byte	0x1
	.byte	0x45
	.long	0x37
	.long	.LLST88
	.uleb128 0x3a
	.string	"y"
	.byte	0x1
	.byte	0x45
	.long	0x37
	.long	.LLST89
	.uleb128 0x39
	.long	.LASF181
	.byte	0x1
	.byte	0x45
	.long	0x37
	.long	.LLST90
	.uleb128 0x3a
	.string	"att"
	.byte	0x1
	.byte	0x45
	.long	0x37
	.long	.LLST91
	.uleb128 0x43
	.string	"__c"
	.byte	0x1
	.byte	0x48
	.long	0x139c
	.byte	0x5
	.byte	0x3
	.long	_ZZ7putsChnhhhhE3__c
	.byte	0x0
	.uleb128 0x42
	.byte	0x1
	.long	.LASF184
	.byte	0x1
	.byte	0x3b
	.long	.LASF185
	.long	.LFB15
	.long	.LFE15
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x12ba
	.uleb128 0x3a
	.string	"x"
	.byte	0x1
	.byte	0x3b
	.long	0x37
	.long	.LLST93
	.uleb128 0x3a
	.string	"y"
	.byte	0x1
	.byte	0x3b
	.long	0x37
	.long	.LLST94
	.uleb128 0x39
	.long	.LASF181
	.byte	0x1
	.byte	0x3b
	.long	0x37
	.long	.LLST95
	.uleb128 0x3a
	.string	"att"
	.byte	0x1
	.byte	0x3b
	.long	0x37
	.long	.LLST96
	.uleb128 0x43
	.string	"__c"
	.byte	0x1
	.byte	0x41
	.long	0x1387
	.byte	0x5
	.byte	0x3
	.long	_ZZ10putsChnRawhhhhE3__c
	.byte	0x0
	.uleb128 0x42
	.byte	0x1
	.long	.LASF186
	.byte	0x1
	.byte	0x35
	.long	.LASF187
	.long	.LFB14
	.long	.LFE14
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x12ff
	.uleb128 0x3a
	.string	"x"
	.byte	0x1
	.byte	0x35
	.long	0x37
	.long	.LLST98
	.uleb128 0x3a
	.string	"y"
	.byte	0x1
	.byte	0x35
	.long	0x37
	.long	.LLST99
	.uleb128 0x3a
	.string	"att"
	.byte	0x1
	.byte	0x35
	.long	0x37
	.long	.LLST100
	.byte	0x0
	.uleb128 0x42
	.byte	0x1
	.long	.LASF188
	.byte	0x1
	.byte	0x29
	.long	.LASF189
	.long	.LFB13
	.long	.LFE13
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x1377
	.uleb128 0x3a
	.string	"x"
	.byte	0x1
	.byte	0x29
	.long	0x37
	.long	.LLST102
	.uleb128 0x3a
	.string	"y"
	.byte	0x1
	.byte	0x29
	.long	0x37
	.long	.LLST103
	.uleb128 0x3a
	.string	"tme"
	.byte	0x1
	.byte	0x29
	.long	0x49
	.long	.LLST104
	.uleb128 0x3a
	.string	"att"
	.byte	0x1
	.byte	0x29
	.long	0x37
	.long	.LLST105
	.uleb128 0x39
	.long	.LASF190
	.byte	0x1
	.byte	0x29
	.long	0x37
	.long	.LLST106
	.uleb128 0x48
	.long	0x7b5
	.long	.LBB193
	.long	.LBE193
	.byte	0x1
	.byte	0x31
	.uleb128 0x21
	.long	0x7c7
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.long	0x89
	.long	0x1387
	.uleb128 0xf
	.long	0x1f4
	.byte	0x8c
	.byte	0x0
	.uleb128 0x1b
	.long	0x1377
	.uleb128 0xe
	.long	0x89
	.long	0x139c
	.uleb128 0xf
	.long	0x1f4
	.byte	0x7c
	.byte	0x0
	.uleb128 0x1b
	.long	0x138c
	.uleb128 0xe
	.long	0x89
	.long	0x13b1
	.uleb128 0xf
	.long	0x1f4
	.byte	0x3
	.byte	0x0
	.uleb128 0x1b
	.long	0x13a1
	.uleb128 0x1b
	.long	0x13a1
	.uleb128 0x1b
	.long	0x13a1
	.uleb128 0xe
	.long	0x89
	.long	0x13d0
	.uleb128 0xf
	.long	0x1f4
	.byte	0x1b
	.byte	0x0
	.uleb128 0x1b
	.long	0x13c0
	.uleb128 0xe
	.long	0x89
	.long	0x13e5
	.uleb128 0xf
	.long	0x1f4
	.byte	0xe
	.byte	0x0
	.uleb128 0x1b
	.long	0x13d5
	.uleb128 0xe
	.long	0x89
	.long	0x13fa
	.uleb128 0xf
	.long	0x1f4
	.byte	0xc
	.byte	0x0
	.uleb128 0x1b
	.long	0x13ea
	.uleb128 0xe
	.long	0x89
	.long	0x140f
	.uleb128 0xf
	.long	0x1f4
	.byte	0x5
	.byte	0x0
	.uleb128 0x1b
	.long	0x13ff
	.uleb128 0xe
	.long	0x89
	.long	0x1424
	.uleb128 0xf
	.long	0x1f4
	.byte	0xd
	.byte	0x0
	.uleb128 0x1b
	.long	0x1414
	.uleb128 0xe
	.long	0x89
	.long	0x1439
	.uleb128 0xf
	.long	0x1f4
	.byte	0x13
	.byte	0x0
	.uleb128 0x1b
	.long	0x1429
	.uleb128 0xe
	.long	0x89
	.long	0x144e
	.uleb128 0xf
	.long	0x1f4
	.byte	0x12
	.byte	0x0
	.uleb128 0x1b
	.long	0x143e
	.uleb128 0xe
	.long	0x9a
	.long	0x1463
	.uleb128 0xf
	.long	0x1f4
	.byte	0xf
	.byte	0x0
	.uleb128 0x1b
	.long	0x1453
	.uleb128 0x8
	.byte	0x2
	.long	0x5b
	.uleb128 0xe
	.long	0x5b
	.long	0x147e
	.uleb128 0xf
	.long	0x1f4
	.byte	0x7
	.byte	0x0
	.uleb128 0x49
	.long	.LASF191
	.byte	0x1
	.byte	0xd1
	.long	0xa5
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	checkIncDec_Ret
	.uleb128 0x4a
	.long	.LASF192
	.byte	0x1
	.word	0x18c
	.long	0x37
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	g_vbat100mV
	.uleb128 0x4b
	.long	.LASF193
	.byte	0x2
	.word	0x1a0
	.long	0x77d
	.byte	0x1
	.byte	0x1
	.uleb128 0x49
	.long	.LASF194
	.byte	0x1
	.byte	0x9b
	.long	0x37
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	g_beepCnt
	.uleb128 0xe
	.long	0x37
	.long	0x14d3
	.uleb128 0xf
	.long	0x1f4
	.byte	0x3
	.byte	0x0
	.uleb128 0x49
	.long	.LASF195
	.byte	0x1
	.byte	0x9c
	.long	0x14c3
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	g_beepVal
	.uleb128 0xe
	.long	0x89
	.long	0x14f5
	.uleb128 0xf
	.long	0x1f4
	.byte	0x40
	.byte	0x0
	.uleb128 0x49
	.long	.LASF196
	.byte	0x1
	.byte	0x22
	.long	0x1507
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	modi12x3
	.uleb128 0x1b
	.long	0x14e5
	.uleb128 0xe
	.long	0x5b
	.long	0x151c
	.uleb128 0xf
	.long	0x1f4
	.byte	0x3b
	.byte	0x0
	.uleb128 0x4b
	.long	.LASF197
	.byte	0x2
	.word	0x1a6
	.long	0x150c
	.byte	0x1
	.byte	0x1
	.uleb128 0xe
	.long	0x49
	.long	0x153a
	.uleb128 0xf
	.long	0x1f4
	.byte	0x7
	.byte	0x0
	.uleb128 0x4a
	.long	.LASF198
	.byte	0x1
	.word	0x1cd
	.long	0x152a
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	g_ppmIns
	.uleb128 0xe
	.long	0x49
	.long	0x155d
	.uleb128 0xf
	.long	0x1f4
	.byte	0xf
	.byte	0x0
	.uleb128 0x4b
	.long	.LASF199
	.byte	0x2
	.word	0x1a8
	.long	0x154d
	.byte	0x1
	.byte	0x1
	.uleb128 0x49
	.long	.LASF200
	.byte	0x1
	.byte	0x1c
	.long	0x2e3
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	g_eeGeneral
	.uleb128 0x49
	.long	.LASF201
	.byte	0x1
	.byte	0x1d
	.long	0x5ea
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	g_model
	.uleb128 0xe
	.long	0x143
	.long	0x159f
	.uleb128 0xf
	.long	0x1f4
	.byte	0x4
	.byte	0x0
	.uleb128 0x49
	.long	.LASF202
	.byte	0x1
	.byte	0x95
	.long	0x158f
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	g_menuStack
	.uleb128 0x49
	.long	.LASF203
	.byte	0x1
	.byte	0x9a
	.long	0x37
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	g_menuStackPtr
	.uleb128 0xe
	.long	0x5b
	.long	0x15d3
	.uleb128 0xf
	.long	0x1f4
	.byte	0xf
	.byte	0x0
	.uleb128 0x4a
	.long	.LASF204
	.byte	0x1
	.word	0x1ca
	.long	0x15e6
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	captureRing
	.uleb128 0x23
	.long	0x15c3
	.uleb128 0x4a
	.long	.LASF205
	.byte	0x1
	.word	0x1cb
	.long	0x15fe
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	captureWr
	.uleb128 0x23
	.long	0x37
	.uleb128 0x4a
	.long	.LASF206
	.byte	0x1
	.word	0x1cc
	.long	0x15fe
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	captureRd
	.uleb128 0x4a
	.long	.LASF207
	.byte	0x1
	.word	0x1ce
	.long	0x37
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	ppmInState
	.uleb128 0x4a
	.long	.LASF208
	.byte	0x1
	.word	0x1d6
	.long	0x37
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	heartbeat
	.uleb128 0x4b
	.long	.LASF209
	.byte	0x1
	.word	0x1d8
	.long	0x5b
	.byte	0x1
	.byte	0x1
	.uleb128 0x4b
	.long	.LASF210
	.byte	0x1
	.word	0x1d9
	.long	0x5b
	.byte	0x1
	.byte	0x1
	.uleb128 0x31
	.long	.LASF211
	.byte	0x1
	.word	0x210
	.long	0x146e
	.byte	0x5
	.byte	0x3
	.long	_ZL9s_anaFilt
	.uleb128 0x4a
	.long	.LASF212
	.byte	0x1
	.word	0x246
	.long	0x15fe
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	g_tmr16KHz
	.uleb128 0x4b
	.long	.LASF213
	.byte	0x1
	.word	0x299
	.long	0x5b
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.section	.debug_abbrev
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0x0
	.byte	0x0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0x0
	.byte	0x0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
	.uleb128 0x28
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xd
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x9
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0xd
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.uleb128 0x32
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x20
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.uleb128 0x1d
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.uleb128 0x2e
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x34
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x37
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x39
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x3d
	.uleb128 0x1d
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x3e
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3f
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x40
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x41
	.uleb128 0xb
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x42
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x43
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x44
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x45
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x46
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x47
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x4a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x4b
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x2cd
	.word	0x2
	.long	.Ldebug_info0
	.long	0x168c
	.long	0x7d2
	.string	"lastPopMenu"
	.long	0x7ee
	.string	"chainMenu"
	.long	0x82b
	.string	"anaIn"
	.long	0x89f
	.string	"__vector_21"
	.long	0x8dc
	.string	"setupAdc"
	.long	0x8ec
	.string	"__vector_16"
	.long	0x900
	.string	"getTmr16KHz"
	.long	0x927
	.string	"__vector_25"
	.long	0x982
	.string	"evalCaptures"
	.long	0x9bc
	.string	"__vector_12"
	.long	0xa16
	.string	"__vector_15"
	.long	0xa2a
	.string	"getSwitch"
	.long	0xa67
	.string	"checkIncDecGen2"
	.long	0xb80
	.string	"checkIncDec_vg"
	.long	0xbe1
	.string	"checkIncDec_hg"
	.long	0xc42
	.string	"checkIncDec_vm"
	.long	0xca3
	.string	"checkIncDec_hm"
	.long	0xd04
	.string	"checkTrim"
	.long	0xda9
	.string	"perMain"
	.long	0xe9c
	.string	"alert"
	.long	0xf01
	.string	"pushMenu"
	.long	0xf50
	.string	"checkSwitches"
	.long	0xf88
	.string	"popMenu"
	.long	0xfd7
	.string	"checkTHR"
	.long	0x1096
	.string	"checkMem"
	.long	0x10c3
	.string	"main"
	.long	0x1158
	.string	"putsDrSwitches"
	.long	0x11f0
	.string	"putsChn"
	.long	0x1255
	.string	"putsChnRaw"
	.long	0x12ba
	.string	"putsVBat"
	.long	0x12ff
	.string	"putsTime"
	.long	0x147e
	.string	"checkIncDec_Ret"
	.long	0x1490
	.string	"g_vbat100mV"
	.long	0x14b1
	.string	"g_beepCnt"
	.long	0x14d3
	.string	"g_beepVal"
	.long	0x14f5
	.string	"modi12x3"
	.long	0x153a
	.string	"g_ppmIns"
	.long	0x156b
	.string	"g_eeGeneral"
	.long	0x157d
	.string	"g_model"
	.long	0x159f
	.string	"g_menuStack"
	.long	0x15b1
	.string	"g_menuStackPtr"
	.long	0x15d3
	.string	"captureRing"
	.long	0x15eb
	.string	"captureWr"
	.long	0x1603
	.string	"captureRd"
	.long	0x1616
	.string	"ppmInState"
	.long	0x1629
	.string	"heartbeat"
	.long	0x166a
	.string	"g_tmr16KHz"
	.long	0x0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0x0
	.word	0x0
	.word	0x0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LBB181-.Ltext0
	.long	.LBE181-.Ltext0
	.long	.LBB189-.Ltext0
	.long	.LBE189-.Ltext0
	.long	0x0
	.long	0x0
	.section	.debug_line
	.long	.LELT0-.LSLT0
.LSLT0:
	.word	0x2
	.long	.LELTP0-.LASLTP0
.LASLTP0:
	.byte	0x1
	.byte	0x1
	.byte	0xf6
	.byte	0xf5
	.byte	0xa
	.byte	0x0
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x1
	.ascii	"../src"
	.byte	0
	.ascii	"/usr/lib/gcc/avr/4.3.4/../../../avr/include"
	.byte	0
	.ascii	"/usr/lib/gcc/avr/4.3.4/../../../avr/include/avr"
	.byte	0
	.byte	0x0
	.string	"er9x.cpp"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.string	"er9x.h"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.string	"stdint.h"
	.uleb128 0x2
	.uleb128 0x0
	.uleb128 0x0
	.string	"avr/pgmspace.h"
	.uleb128 0x2
	.uleb128 0x0
	.uleb128 0x0
	.string	"myeeprom.h"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.byte	0x0
.LELTP0:
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1
	.byte	0x3
	.sleb128 357
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM2
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM3
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM4
	.byte	0x1f
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM5
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM6
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM7
	.byte	0x4
	.uleb128 0x2
	.byte	0x50
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM8
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -58
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM9
	.byte	0xac
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM10
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM11
	.byte	0x3
	.sleb128 -16
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM12
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM13
	.byte	0x25
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM14
	.byte	0x3
	.sleb128 -14
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM15
	.byte	0x23
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM16
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM17
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM18
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM19
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM20
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM21
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM22
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM23
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM24
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM25
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM26
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM27
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM28
	.byte	0x2d
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM29
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM30
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM31
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM32
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM33
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM34
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM35
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM36
	.byte	0x2b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM37
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM38
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM39
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM40
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM41
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM42
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM43
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM44
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -195
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM45
	.byte	0x4
	.uleb128 0x1
	.byte	0xda
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM46
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM47
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM48
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM49
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM50
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM51
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM52
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM53
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM54
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM55
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM56
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM57
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM58
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM59
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM60
	.byte	0x3
	.sleb128 -11
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM61
	.byte	0x25
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM62
	.byte	0x3
	.sleb128 -186
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM63
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM64
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM65
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM66
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM67
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM68
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM69
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM70
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM71
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM72
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM73
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM74
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM75
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM76
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM77
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM78
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM79
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM80
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM81
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM82
	.byte	0x3
	.sleb128 -27
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM83
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM84
	.byte	0x84
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM85
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM86
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM87
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM88
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM89
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM90
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM91
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM92
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM93
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM94
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM95
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM96
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM97
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM98
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM99
	.byte	0x3
	.sleb128 -525
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM100
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM101
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM102
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM103
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM104
	.byte	0x84
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM105
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM106
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM107
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM108
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM109
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM110
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM111
	.byte	0x4
	.uleb128 0x2
	.byte	0xe4
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM112
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -205
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM113
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM114
	.byte	0x4
	.uleb128 0x2
	.byte	0xe0
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM115
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -200
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM116
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM117
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM118
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM119
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM120
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM121
	.byte	0x4
	.uleb128 0x2
	.byte	0xd2
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM122
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -187
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM123
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM124
	.byte	0x4
	.uleb128 0x2
	.byte	0xcc
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM125
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -181
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM126
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM127
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM128
	.byte	0x4
	.uleb128 0x2
	.byte	0xc7
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM129
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -176
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM130
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM131
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM132
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM133
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM134
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM135
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM136
	.byte	0x26
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM137
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM138
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM139
	.byte	0xb
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM140
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM141
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM142
	.byte	0xb
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM143
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM144
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM145
	.byte	0xb
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM146
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM147
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM148
	.byte	0x3
	.sleb128 -100
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM149
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM150
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM151
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM152
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM153
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM154
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM155
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM156
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM157
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM158
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM159
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM160
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM161
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM162
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM163
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 242
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM164
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -237
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM165
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM166
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 236
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM167
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -229
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM168
	.byte	0xd5
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM169
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM170
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM171
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM172
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM173
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM174
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM175
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM176
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM177
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM178
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM179
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM180
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM181
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM182
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM183
	.byte	0x85
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM184
	.byte	0x3
	.sleb128 -16
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM185
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM186
	.byte	0x25
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM187
	.byte	0x3
	.sleb128 -14
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM188
	.byte	0x3
	.sleb128 -88
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM189
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM190
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM191
	.byte	0x4
	.uleb128 0x2
	.byte	0x11
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM192
	.byte	0x4
	.uleb128 0x1
	.byte	0x24
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM193
	.byte	0x3
	.sleb128 -293
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM194
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM195
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM196
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM197
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM198
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM199
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 271
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM200
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -267
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM201
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM202
	.byte	0xe4
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM203
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM204
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM205
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM206
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM207
	.byte	0x4
	.uleb128 0x2
	.byte	0x47
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM208
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -47
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM209
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM210
	.byte	0x3
	.sleb128 -257
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM211
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM212
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM213
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM214
	.byte	0x10
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM215
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 299
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM216
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -291
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM217
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM218
	.byte	0xed
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM219
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM220
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM221
	.byte	0x4
	.uleb128 0x2
	.byte	0x5a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM222
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -68
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM223
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM224
	.byte	0x3
	.sleb128 -259
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM225
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM226
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM227
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM228
	.byte	0x3
	.sleb128 416
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM229
	.byte	0x3
	.sleb128 -16
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM230
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM231
	.byte	0x25
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM232
	.byte	0x3
	.sleb128 -14
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM233
	.byte	0x3
	.sleb128 -399
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM234
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM235
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM236
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM237
	.byte	0x3
	.sleb128 -29
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM238
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM239
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM240
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM241
	.byte	0x3
	.sleb128 562
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM242
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM243
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM244
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM245
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM246
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM247
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM248
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM249
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM250
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM251
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM252
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM253
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM254
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM255
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM256
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM257
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM258
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM259
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM260
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM261
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM262
	.byte	0x3
	.sleb128 -141
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM263
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM264
	.byte	0xa2
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM265
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM266
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM267
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM268
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM269
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM270
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM271
	.byte	0x3
	.sleb128 -116
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM272
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM273
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM274
	.byte	0x88
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM275
	.byte	0x3
	.sleb128 -118
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM276
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM277
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM278
	.byte	0x89
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM279
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM280
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM281
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM282
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM283
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM284
	.byte	0x3
	.sleb128 -637
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM285
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM286
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM287
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM288
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM289
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM290
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM291
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM292
	.byte	0x3
	.sleb128 -20
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM293
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM294
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM295
	.byte	0x3
	.sleb128 -15
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM296
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM297
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM298
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM299
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM300
	.byte	0x3
	.sleb128 -15
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM301
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM302
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM303
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM304
	.byte	0x3
	.sleb128 -17
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM305
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM306
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM307
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM308
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 284
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM309
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -283
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM310
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM311
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM312
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.Letext0
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,"MS",@progbits,1
.LASF199:
	.string	"g_chans512"
.LASF201:
	.string	"g_model"
.LASF67:
	.string	"drSw"
.LASF44:
	.string	"t_TrainerData"
.LASF62:
	.string	"stickMode"
.LASF26:
	.string	"TRM_RH_DWN"
.LASF109:
	.string	"__in_chrg"
.LASF211:
	.string	"s_anaFilt"
.LASF85:
	.string	"speedUp"
.LASF116:
	.string	"__addr16"
.LASF48:
	.string	"t_EEGeneral"
.LASF90:
	.string	"mdVers"
.LASF168:
	.string	"popMenu"
.LASF121:
	.string	"__vector_21"
.LASF37:
	.string	"MenuFuncP"
.LASF122:
	.string	"__vector_25"
.LASF221:
	.string	"lastPopMenu"
.LASF174:
	.string	"lowLim"
.LASF70:
	.string	"ExpoData"
.LASF148:
	.string	"checkIncDec_hg"
.LASF131:
	.string	"pulsePtr"
.LASF10:
	.string	"long long unsigned int"
.LASF153:
	.string	"checkIncDec_hm"
.LASF15:
	.string	"KEY_EXIT"
.LASF159:
	.string	"_Z7perMainv"
.LASF182:
	.string	"putsChn"
.LASF95:
	.string	"thrTrim"
.LASF145:
	.string	"kother"
.LASF130:
	.string	"pulsePol"
.LASF214:
	.string	"GNU C++ 4.3.4"
.LASF31:
	.string	"SW_ID0"
.LASF32:
	.string	"SW_ID1"
.LASF33:
	.string	"SW_ID2"
.LASF4:
	.string	"int16_t"
.LASF9:
	.string	"long long int"
.LASF2:
	.string	"signed char"
.LASF193:
	.string	"g_tmr10ms"
.LASF127:
	.string	"_Z9chainMenuPFvhE"
.LASF63:
	.string	"EEGeneral"
.LASF212:
	.string	"g_tmr16KHz"
.LASF171:
	.string	"checkTHR"
.LASF136:
	.string	"checkIncDecGen2"
.LASF74:
	.string	"TrimData"
.LASF202:
	.string	"g_menuStack"
.LASF7:
	.string	"long int"
.LASF18:
	.string	"KEY_RIGHT"
.LASF49:
	.string	"myVers"
.LASF106:
	.string	"AutoLock"
.LASF213:
	.string	"g_timeMain"
.LASF27:
	.string	"TRM_RH_UP"
.LASF46:
	.string	"chanMix"
.LASF137:
	.string	"_Z9getSwitchab"
.LASF5:
	.string	"uint16_t"
.LASF220:
	.string	"setupAdc"
.LASF158:
	.string	"perMain"
.LASF108:
	.string	"this"
.LASF64:
	.string	"t_ExpoData"
.LASF117:
	.string	"__result"
.LASF185:
	.string	"_Z10putsChnRawhhhh"
.LASF142:
	.string	"i_max"
.LASF147:
	.string	"i_val"
.LASF115:
	.string	"autoLock"
.LASF210:
	.string	"g_tmr1Latency_min"
.LASF92:
	.string	"tmrVal"
.LASF134:
	.string	"newMenu"
.LASF123:
	.string	"capture"
.LASF30:
	.string	"SW_ElevDR"
.LASF141:
	.string	"i_min"
.LASF200:
	.string	"g_eeGeneral"
.LASF14:
	.string	"KEY_MENU"
.LASF6:
	.string	"unsigned int"
.LASF60:
	.string	"view"
.LASF76:
	.string	"revert"
.LASF183:
	.string	"_Z7putsChnhhhh"
.LASF133:
	.string	"__vector_15"
.LASF180:
	.string	"_Z14putsDrSwitcheshhah"
.LASF187:
	.string	"_Z8putsVBathhh"
.LASF8:
	.string	"long unsigned int"
.LASF112:
	.string	"abs<signed char>"
.LASF172:
	.string	"_Z8checkTHRv"
.LASF89:
	.string	"name"
.LASF86:
	.string	"speedDown"
.LASF19:
	.string	"KEY_LEFT"
.LASF198:
	.string	"g_ppmIns"
.LASF139:
	.string	"event"
.LASF138:
	.string	"_Z15checkIncDecGen2hPviih"
.LASF128:
	.string	"_Z12evalCapturesv"
.LASF126:
	.string	"evalCaptures"
.LASF170:
	.string	"uppermost"
.LASF99:
	.string	"trimData"
.LASF29:
	.string	"SW_RuddDR"
.LASF196:
	.string	"modi12x3"
.LASF157:
	.string	"thro"
.LASF72:
	.string	"trim"
.LASF35:
	.string	"SW_Gear"
.LASF13:
	.string	"bool"
.LASF215:
	.string	"../src/er9x.cpp"
.LASF21:
	.string	"TRM_LH_UP"
.LASF59:
	.string	"trainer"
.LASF184:
	.string	"putsChnRaw"
.LASF69:
	.string	"expSwWeight"
.LASF160:
	.string	"s_batCheck"
.LASF93:
	.string	"protocol"
.LASF179:
	.string	"putsDrSwitches"
.LASF45:
	.string	"calib"
.LASF22:
	.string	"TRM_LV_DWN"
.LASF194:
	.string	"g_beepCnt"
.LASF162:
	.string	"alert"
.LASF61:
	.string	"warnOpts"
.LASF68:
	.string	"expNormWeight"
.LASF65:
	.string	"expNorm"
.LASF100:
	.string	"limitData"
.LASF80:
	.string	"destCh"
.LASF38:
	.string	"srcChn"
.LASF206:
	.string	"captureRd"
.LASF152:
	.string	"_Z14checkIncDec_vmhaaa"
.LASF169:
	.string	"_Z7popMenub"
.LASF150:
	.string	"_Z14checkIncDec_hghaaa"
.LASF111:
	.string	"min<unsigned int>"
.LASF190:
	.string	"att2"
.LASF94:
	.string	"ppmNCH"
.LASF97:
	.string	"tcutSW"
.LASF87:
	.string	"MixData"
.LASF73:
	.string	"trimDef"
.LASF197:
	.string	"pulses2MHz"
.LASF107:
	.string	"_beep"
.LASF75:
	.string	"t_LimitData"
.LASF12:
	.string	"prog_uint8_t"
.LASF105:
	.string	"ModelData"
.LASF40:
	.string	"studWeight"
.LASF154:
	.string	"_Z14checkIncDec_hmhaaa"
.LASF217:
	.string	"EnumKeys"
.LASF47:
	.string	"TrainerData"
.LASF66:
	.string	"expDr"
.LASF3:
	.string	"unsigned char"
.LASF186:
	.string	"putsVBat"
.LASF51:
	.string	"calibSpanNeg"
.LASF98:
	.string	"mixData"
.LASF91:
	.string	"tmrMode"
.LASF218:
	.string	"m_saveFlags"
.LASF102:
	.string	"curves5"
.LASF16:
	.string	"KEY_DOWN"
.LASF25:
	.string	"TRM_RV_UP"
.LASF103:
	.string	"curves9"
.LASF54:
	.string	"currModel"
.LASF20:
	.string	"TRM_LH_DWN"
.LASF118:
	.string	"getTmr16KHz"
.LASF56:
	.string	"vBatWarn"
.LASF144:
	.string	"newval"
.LASF219:
	.string	"~AutoLock"
.LASF167:
	.string	"_Z13checkSwitchesv"
.LASF28:
	.string	"SW_ThrCt"
.LASF120:
	.string	"s_ana"
.LASF101:
	.string	"expoData"
.LASF181:
	.string	"idx1"
.LASF53:
	.string	"chkSum"
.LASF192:
	.string	"g_vbat100mV"
.LASF78:
	.string	"LimitData"
.LASF114:
	.string	"chan"
.LASF104:
	.string	"char"
.LASF82:
	.string	"carryTrim"
.LASF41:
	.string	"mode"
.LASF125:
	.string	"chainMenu"
.LASF58:
	.string	"lightSw"
.LASF208:
	.string	"heartbeat"
.LASF149:
	.string	"_Z14checkIncDec_vghaaa"
.LASF164:
	.string	"_Z8pushMenuPFvhE"
.LASF143:
	.string	"i_flags"
.LASF209:
	.string	"g_tmr1Latency_max"
.LASF175:
	.string	"checkMem"
.LASF191:
	.string	"checkIncDec_Ret"
.LASF155:
	.string	"checkTrim"
.LASF77:
	.string	"offset"
.LASF39:
	.string	"swtch"
.LASF36:
	.string	"SW_Trainer"
.LASF24:
	.string	"TRM_RV_DWN"
.LASF11:
	.string	"prog_char"
.LASF0:
	.string	"int8_t"
.LASF83:
	.string	"weight"
.LASF178:
	.string	"old10ms"
.LASF119:
	.string	"abs<int>"
.LASF165:
	.string	"checkSwitches"
.LASF146:
	.string	"checkIncDec_vg"
.LASF55:
	.string	"contrast"
.LASF216:
	.string	"/home/erez/Desktop/er9x/er9x/OBJS"
.LASF79:
	.string	"t_MixData"
.LASF96:
	.string	"trimInc"
.LASF140:
	.string	"i_pval"
.LASF110:
	.string	"max<unsigned int>"
.LASF189:
	.string	"_Z8putsTimehhihh"
.LASF1:
	.string	"uint8_t"
.LASF166:
	.string	"_Z5alertPKc"
.LASF163:
	.string	"pushMenu"
.LASF23:
	.string	"TRM_LV_UP"
.LASF84:
	.string	"curve"
.LASF222:
	.string	"_Z11lastPopMenuv"
.LASF205:
	.string	"captureWr"
.LASF17:
	.string	"KEY_UP"
.LASF81:
	.string	"srcRaw"
.LASF43:
	.string	"t_TrainerData1"
.LASF129:
	.string	"__vector_12"
.LASF50:
	.string	"calibMid"
.LASF34:
	.string	"SW_AileDR"
.LASF124:
	.string	"lastCapt"
.LASF132:
	.string	"__vector_16"
.LASF52:
	.string	"calibSpanPos"
.LASF173:
	.string	"thrchn"
.LASF151:
	.string	"checkIncDec_vm"
.LASF57:
	.string	"vBatCalib"
.LASF203:
	.string	"g_menuStackPtr"
.LASF135:
	.string	"getSwitch"
.LASF156:
	.string	"_Z9checkTrimh"
.LASF42:
	.string	"TrainerData1"
.LASF188:
	.string	"putsTime"
.LASF113:
	.string	"anaIn"
.LASF207:
	.string	"ppmInState"
.LASF177:
	.string	"main"
.LASF176:
	.string	"_Z8checkMemv"
.LASF161:
	.string	"beepTab"
.LASF195:
	.string	"g_beepVal"
.LASF88:
	.string	"t_ModelData"
.LASF204:
	.string	"captureRing"
.LASF71:
	.string	"t_TrimData"

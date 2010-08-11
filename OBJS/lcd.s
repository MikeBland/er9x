	.file	"lcd.cpp"
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
.global	_Z9lcd_clearv
	.type	_Z9lcd_clearv, @function
_Z9lcd_clearv:
.LFB13:
.LM1:
/* prologue: function */
/* frame size = 0 */
.LM2:
	ldi r30,lo8(displayBuf)
	ldi r31,hi8(displayBuf)
.L2:
.LBB67:
.LM3:
	st Z+,__zero_reg__
	ldi r24,hi8(displayBuf+1024)
	cpi r30,lo8(displayBuf+1024)
	cpc r31,r24
	brne .L2
/* epilogue start */
.LBE67:
.LM4:
	ret
.LFE13:
	.size	_Z9lcd_clearv, .-_Z9lcd_clearv
.global	_Z7lcd_imghhPKhhh
	.type	_Z7lcd_imghhPKhhh, @function
_Z7lcd_imghhPKhhh:
.LFB14:
.LM5:
.LVL0:
	push r15
	push r16
.LVL1:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	mov r26,r24
	mov r23,r18
.LBB68:
.LBB69:
.LM6:
	movw r28,r20
.LVL2:
	adiw r28,1
	movw r30,r20
/* #APP */
 ;  46 "../src/lcd.cpp" 1
	lpm r17, Z
	
 ;  0 "" 2
.LVL3:
/* #NOAPP */
.LBE69:
.LBB70:
.LM7:
	movw r20,r28
.LVL4:
	subi r20,lo8(-(1))
	sbci r21,hi8(-(1))
.LVL5:
	movw r30,r28
/* #APP */
 ;  47 "../src/lcd.cpp" 1
	lpm r24, Z
	
 ;  0 "" 2
.LVL6:
/* #NOAPP */
.LBE70:
	ldi r25,lo8(0)
.LVL7:
	adiw r24,7
.LVL8:
	ldi r30,3
1:	asr r25
	ror r24
	dec r30
	brne 1b
.LVL9:
	mov r15,r24
.LVL10:
.LBB71:
.LM8:
	movw r30,r20
/* #APP */
 ;  48 "../src/lcd.cpp" 1
	lpm r18, Z
	
 ;  0 "" 2
.LVL11:
/* #NOAPP */
.LBE71:
.LM9:
	sbrs r16,0
	rjmp .L6
	ldi r19,lo8(1)
.LVL12:
	rjmp .L7
.LVL13:
.L6:
	sbrc r16,1
	rjmp .L8
	ldi r19,lo8(0)
.LVL14:
	rjmp .L7
.LVL15:
.L8:
	lds r24,g_blinkTmr10ms
.LVL16:
	ldi r25,lo8(0)
.LVL17:
	ldi r19,6
1:	lsr r25
	ror r24
	dec r19
	brne 1b
	mov r19,r24
.LVL18:
	andi r19,lo8(1)
.LVL19:
.L7:
.LBB72:
.LM10:
	subi r20,lo8(-(1))
	sbci r21,hi8(-(1))
.LVL20:
.LBE72:
.LM11:
	mul r18,r23
	movw r24,r0
	clr r1
.LVL21:
	add r20,r24
	adc r21,r25
	lsr r22
	lsr r22
	lsr r22
.LVL22:
	ldi r23,lo8(0)
.LVL23:
	lsr r23
	mov r23,r22
	clr r22
	ror r23
	ror r22
.LVL24:
	add r22,r26
	adc r23,__zero_reg__
	ldi r25,lo8(0)
.LVL25:
.LBB73:
.LBB74:
.LBB75:
.LM12:
	mov r28,r17
	ldi r29,lo8(0)
.LVL26:
	rjmp .L9
.LVL27:
.L14:
.LBE75:
.LM13:
	movw r26,r22
.LVL28:
	subi r26,lo8(-(displayBuf))
	sbci r27,hi8(-(displayBuf))
	movw r30,r20
	rjmp .L10
.LVL29:
.L13:
.LBB79:
.LBB76:
.LBB77:
.LM14:
/* #APP */
 ;  54 "../src/lcd.cpp" 1
	lpm r24, Z
	
 ;  0 "" 2
.LVL30:
/* #NOAPP */
.LBE77:
.LM15:
	cpse r19,__zero_reg__
.LVL31:
	com r24
.LVL32:
.L12:
.LBB78:
.LM16:
	adiw r30,1
.LBE78:
.LM17:
	st X+,r24
.LVL33:
.L10:
.LBE76:
.LM18:
	mov r24,r30
.LVL34:
	sub r24,r20
	cp r24,r17
	brlo .L13
.LM19:
	add r20,r28
	adc r21,r29
.LBE79:
.LBE74:
.LM20:
	subi r25,lo8(-(1))
	subi r22,lo8(-(128))
	sbci r23,hi8(-(128))
.LVL35:
.L9:
	cp r25,r15
	brlo .L14
/* epilogue start */
.LBE73:
.LBE68:
.LM21:
	pop r29
.LVL36:
	pop r28
.LVL37:
	pop r17
.LVL38:
	pop r16
	pop r15
.LVL39:
	ret
.LFE14:
	.size	_Z7lcd_imghhPKhhh, .-_Z7lcd_imghhPKhhh
.global	_Z11lcd_putcAtthhch
	.type	_Z11lcd_putcAtthhch, @function
_Z11lcd_putcAtthhch:
.LFB15:
.LM22:
.LVL40:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
.LBB80:
.LM23:
	lsr r22
	lsr r22
	lsr r22
.LVL41:
	mov r28,r22
.LVL42:
	ldi r29,lo8(0)
.LVL43:
	lsr r29
	mov r29,r28
	clr r28
	ror r29
	ror r28
.LVL44:
	add r28,r24
	adc r29,__zero_reg__
	subi r28,lo8(-(displayBuf))
	sbci r29,hi8(-(displayBuf))
.LM24:
	ldi r24,lo8(5)
.LVL45:
	muls r20,r24
	movw r20,r0
	clr r1
.LVL46:
	subi r20,lo8(-(font-157))
	sbci r21,hi8(-(font-157))
.LM25:
	sbrs r18,0
	rjmp .L17
.LVL47:
	ldi r22,lo8(1)
.LVL48:
	rjmp .L18
.LVL49:
.L17:
	sbrc r18,1
	rjmp .L19
	ldi r22,lo8(0)
.LVL50:
	rjmp .L18
.LVL51:
.L19:
	lds r24,g_blinkTmr10ms
	ldi r25,lo8(0)
	ldi r26,6
1:	lsr r25
	ror r24
	dec r26
	brne 1b
	mov r22,r24
.LVL52:
	andi r22,lo8(1)
.L18:
.LM26:
	sbrs r18,7
	rjmp .L20
.LVL53:
	ldi r25,lo8(5)
.LVL54:
.L25:
.LBB81:
.LBB82:
.LM27:
	tst r25
	brne .L21
	ldi r26,lo8(0)
	rjmp .L22
.L21:
.LBB83:
	movw r30,r20
	subi r20,lo8(-(1))
	sbci r21,hi8(-(1))
/* #APP */
 ;  71 "../src/lcd.cpp" 1
	lpm r26, Z
	
 ;  0 "" 2
/* #NOAPP */
.L22:
.LBE83:
.LM28:
	cpse r22,__zero_reg__
	com r26
.L23:
.LM29:
	movw r18,r28
.LVL55:
	subi r18,lo8(-(129))
	sbci r19,hi8(-(129))
	ldi r24,hi8(displayBuf+1024)
	cpi r18,lo8(displayBuf+1024)
	cpc r19,r24
	brsh .L24
.LM30:
	ldi r27,lo8(0)
	movw r30,r26
.LVL56:
	andi r30,lo8(15)
	andi r31,hi8(15)
	subi r30,lo8(-(_ZZ11lcd_putcAtthhchE3dbl))
	sbci r31,hi8(-(_ZZ11lcd_putcAtthhchE3dbl))
	ld r24,Z
	std Y+1,r24
	st Y,r24
.LM31:
	ldi r31,4
1:	asr r27
	ror r26
	dec r31
	brne 1b
	subi r26,lo8(-(_ZZ11lcd_putcAtthhchE3dbl))
	sbci r27,hi8(-(_ZZ11lcd_putcAtthhchE3dbl))
	ld r24,X
	movw r30,r18
	st Z,r24
	subi r28,lo8(-(128))
	sbci r29,hi8(-(128))
	st Y,r24
.LM32:
	subi r28,lo8(-(-126))
	sbci r29,hi8(-(-126))
.LVL57:
.L24:
.LBE82:
.LM33:
	subi r25,1
	brcc .L25
	rjmp .L33
.LVL58:
.L20:
	ldi r24,lo8(0)
	ldi r25,hi8(0)
.LVL59:
.L30:
.LBE81:
.LBB84:
.LBB85:
.LBB86:
.LM34:
	movw r30,r20
	add r30,r24
	adc r31,r25
/* #APP */
 ;  83 "../src/lcd.cpp" 1
	lpm r18, Z
	
 ;  0 "" 2
.LVL60:
/* #NOAPP */
.LBE86:
.LM35:
	ldi r31,hi8(displayBuf+1024)
	cpi r28,lo8(displayBuf+1024)
	cpc r29,r31
	brsh .L27
	cpse r22,__zero_reg__
	com r18
.LVL61:
.L29:
	st Y+,r18
.L27:
	adiw r24,1
.LBE85:
.LM36:
	cpi r24,5
	cpc r25,__zero_reg__
	brne .L30
.LBE84:
.LM37:
	ldi r19,hi8(displayBuf+1024)
	cpi r28,lo8(displayBuf+1024)
	cpc r29,r19
	brsh .L33
	tst r22
	brne .L31
	ldi r24,lo8(0)
	rjmp .L32
.L31:
	ldi r24,lo8(-1)
.L32:
	st Y,r24
.LVL62:
.L33:
/* epilogue start */
.LBE80:
.LM38:
	pop r29
.LVL63:
	pop r28
.LVL64:
	ret
.LFE15:
	.size	_Z11lcd_putcAtthhch, .-_Z11lcd_putcAtthhch
.global	_Z8lcd_putchhc
	.type	_Z8lcd_putchhc, @function
_Z8lcd_putchhc:
.LFB16:
.LM39:
.LVL65:
/* prologue: function */
/* frame size = 0 */
.LM40:
	ldi r18,lo8(0)
	call _Z11lcd_putcAtthhch
.LVL66:
/* epilogue start */
.LM41:
	ret
.LFE16:
	.size	_Z8lcd_putchhc, .-_Z8lcd_putchhc
.global	_Z12lcd_putsnAtthhPKchh
	.type	_Z12lcd_putsnAtthhPKchh, @function
_Z12lcd_putsnAtthhPKchh:
.LFB17:
.LM42:
.LVL67:
	push r12
	push r13
	push r14
	push r15
	push r16
.LVL68:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	mov r14,r24
	mov r12,r22
	mov r15,r18
	mov r13,r16
.LVL69:
.LM43:
	movw r28,r20
.LVL70:
.LBB87:
.LBB88:
.LM44:
	ldi r17,lo8(0)
	andi r16,lo8(16)
	andi r17,hi8(16)
.LVL71:
	rjmp .L39
.LVL72:
.L42:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .L40
	ld r20,Y
.LVL73:
	rjmp .L41
.LVL74:
.L40:
.LBB89:
	movw r30,r28
/* #APP */
 ;  99 "../src/lcd.cpp" 1
	lpm r20, Z
	
 ;  0 "" 2
.LVL75:
/* #NOAPP */
.L41:
.LBE89:
.LM45:
	mov r24,r14
	mov r22,r12
	mov r18,r13
	call _Z11lcd_putcAtthhch
.LVL76:
.LM46:
	ldi r31,lo8(6)
	add r14,r31
.LM47:
	dec r15
	adiw r28,1
.LVL77:
.L39:
.LBE88:
.LM48:
	tst r15
	brne .L42
/* epilogue start */
.LBE87:
.LM49:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
.LVL78:
	pop r14
.LVL79:
	pop r13
.LVL80:
	pop r12
.LVL81:
	ret
.LFE17:
	.size	_Z12lcd_putsnAtthhPKchh, .-_Z12lcd_putsnAtthhPKchh
.global	_Z11lcd_putsn_PhhPKch
	.type	_Z11lcd_putsn_PhhPKch, @function
_Z11lcd_putsn_PhhPKch:
.LFB18:
.LM50:
.LVL82:
	push r16
/* prologue: function */
/* frame size = 0 */
.LM51:
	ldi r16,lo8(0)
	call _Z12lcd_putsnAtthhPKchh
.LVL83:
/* epilogue start */
.LM52:
	pop r16
	ret
.LFE18:
	.size	_Z11lcd_putsn_PhhPKch, .-_Z11lcd_putsn_PhhPKch
.global	_Z11lcd_putsAtthhPKch
	.type	_Z11lcd_putsAtthhPKch, @function
_Z11lcd_putsAtthhPKch:
.LFB19:
.LM53:
.LVL84:
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	mov r15,r24
	mov r13,r22
	mov r14,r18
.LM54:
	movw r28,r20
.LVL85:
.LBB90:
.LBB91:
.LM55:
	mov r16,r18
	ldi r17,lo8(0)
	andi r16,lo8(16)
	andi r17,hi8(16)
	rjmp .L47
.LVL86:
.L51:
.LBE91:
.LBE90:
.LM56:
	adiw r28,1
.LVL87:
.L47:
.LBB94:
.LBB93:
.LM57:
	cp r16,__zero_reg__
	cpc r17,__zero_reg__
	breq .L48
.LVL88:
	ld r20,Y
.LVL89:
	rjmp .L49
.LVL90:
.L48:
.LBB92:
	movw r30,r28
/* #APP */
 ;  113 "../src/lcd.cpp" 1
	lpm r20, Z
	
 ;  0 "" 2
.LVL91:
/* #NOAPP */
.L49:
.LBE92:
.LM58:
	tst r20
	breq .L50
.LM59:
	mov r24,r15
	mov r22,r13
	mov r18,r14
.LVL92:
	call _Z11lcd_putcAtthhch
.LVL93:
.LM60:
	ldi r31,lo8(6)
	add r15,r31
.LM61:
	sbrs r14,7
	rjmp .L51
	add r15,r31
	rjmp .L51
.LVL94:
.L50:
.LBE93:
.LBE94:
.LM62:
	mov r24,r15
/* epilogue start */
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
.LVL95:
	pop r14
	pop r13
.LVL96:
	ret
.LFE19:
	.size	_Z11lcd_putsAtthhPKch, .-_Z11lcd_putsAtthhPKch
.global	_Z10lcd_puts_PhhPKc
	.type	_Z10lcd_puts_PhhPKc, @function
_Z10lcd_puts_PhhPKc:
.LFB20:
.LM63:
.LVL97:
/* prologue: function */
/* frame size = 0 */
.LM64:
	ldi r18,lo8(0)
	call _Z11lcd_putsAtthhPKch
.LVL98:
/* epilogue start */
.LM65:
	ret
.LFE20:
	.size	_Z10lcd_puts_PhhPKc, .-_Z10lcd_puts_PhhPKc
.global	_Z11lcd_outhex4hhj
	.type	_Z11lcd_outhex4hhj, @function
_Z11lcd_outhex4hhj:
.LFB21:
.LM66:
.LVL99:
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	mov r16,r24
	mov r15,r22
	movw r28,r20
.LBB95:
.LM67:
	mov r17,r24
	subi r17,lo8(-(20))
.LVL100:
.L59:
.LBB96:
.LBB97:
.LM68:
	subi r17,lo8(-(-5))
.LM69:
	movw r24,r28
	andi r24,lo8(15)
	mov r20,r24
.LVL101:
.LM70:
	cpi r24,lo8(10)
	brlt .L56
.LVL102:
	subi r20,lo8(-(55))
.LVL103:
	rjmp .L57
.LVL104:
.L56:
	subi r20,lo8(-(48))
.LVL105:
.L57:
.LM71:
	mov r24,r17
	mov r22,r15
	call _Z8lcd_putchhc
.LVL106:
.LBE97:
.LM72:
	cp r17,r16
	breq .L60
.LVL107:
.LBB98:
.LM73:
	ldi r24,4
1:	lsr r29
	ror r28
	dec r24
	brne 1b
	rjmp .L59
.L60:
/* epilogue start */
.LBE98:
.LBE96:
.LBE95:
.LM74:
	pop r29
	pop r28
.LVL108:
	pop r17
	pop r16
.LVL109:
	pop r15
.LVL110:
	ret
.LFE21:
	.size	_Z11lcd_outhex4hhj, .-_Z11lcd_outhex4hhj
.global	_Z8lcd_plothh
	.type	_Z8lcd_plothh, @function
_Z8lcd_plothh:
.LFB25:
.LM75:
.LVL111:
/* prologue: function */
/* frame size = 0 */
.LBB99:
.LM76:
	mov r25,r22
	lsr r25
	lsr r25
	lsr r25
	mov r30,r25
	ldi r31,lo8(0)
	lsr r31
	mov r31,r30
	clr r30
	ror r31
	ror r30
	add r30,r24
	adc r31,__zero_reg__
.LM77:
	subi r30,lo8(-(displayBuf))
	sbci r31,hi8(-(displayBuf))
	ldi r24,hi8(displayBuf+1024)
	cpi r30,lo8(displayBuf+1024)
	cpc r31,r24
.LVL112:
	brsh .L63
	andi r22,lo8(7)
.LVL113:
	ldi r24,lo8(1)
	ldi r25,hi8(1)
	rjmp 2f
1:	lsl r24
	rol r25
2:	dec r22
	brpl 1b
	ld r18,Z
	eor r18,r24
	st Z,r18
.L63:
	ret
.LBE99:
.LFE25:
	.size	_Z8lcd_plothh, .-_Z8lcd_plothh
.global	_Z14lcd_outdezNAtthhihh
	.type	_Z14lcd_outdezNAtthhihh, @function
_Z14lcd_outdezNAtthhihh:
.LFB24:
.LM78:
.LVL114:
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
.LVL115:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	mov r19,r24
	mov r12,r22
	movw r28,r20
	mov r11,r18
	mov r4,r16
.LVL116:
.LBB100:
.LM79:
	sbrs r18,7
	rjmp .L65
.LVL117:
	ldi r23,lo8(10)
	mov r10,r23
.LVL118:
	rjmp .L66
.LVL119:
.L65:
	ldi r22,lo8(5)
	mov r10,r22
.LVL120:
.L66:
.LM80:
	mov r14,r11
	clr r15
.LM81:
	clr r7
.LVL121:
	sbrs r29,7
	rjmp .L68
.LVL122:
	clr r7
	inc r7
.LM82:
	com r29
	neg r28
	sbci r29,lo8(-1)
.LVL123:
.L68:
.LM83:
	movw r24,r14
	ldi r21,5
1:	asr r25
	ror r24
	dec r21
	brne 1b
	mov r16,r24
.LVL124:
	andi r16,lo8(3)
.LM84:
	mov r17,r19
	subi r17,lo8(-(-6))
.LVL125:
	clr r13
.LVL126:
.LBB101:
.LM85:
	ldi r20,lo8(7)
	mov r5,r20
	add r5,r12
.LM86:
	ldi r19,lo8(6)
	mov r6,r19
	add r6,r12
.LM87:
	ldi r18,lo8(4)
	mov r8,r18
	mov r9,__zero_reg__
	and r8,r14
	and r9,r15
	rjmp .L69
.LVL127:
.L74:
.LM88:
	tst r16
	breq .L70
	cp r16,r13
	brne .L70
.LM89:
	subi r17,lo8(-(-1))
.LM90:
	movw r24,r28
	ldi r22,lo8(10)
	ldi r23,hi8(10)
	call __divmodhi4
	mov r20,r24
	subi r20,lo8(-(48))
	mov r24,r17
	mov r22,r12
	mov r18,r11
	call _Z11lcd_putcAtthhch
.LM91:
	mov r24,r17
	subi r24,lo8(-(5))
	mov r22,r5
	call _Z8lcd_plothh
.LM92:
	mov r24,r17
	subi r24,lo8(-(6))
	mov r22,r6
	call _Z8lcd_plothh
	ldi r16,lo8(0)
	rjmp .L71
.LVL128:
.L70:
.LM93:
	movw r24,r28
	ldi r22,lo8(10)
	ldi r23,hi8(10)
	call __divmodhi4
	mov r20,r24
	subi r20,lo8(-(48))
	mov r24,r17
	mov r22,r12
	mov r18,r11
	call _Z11lcd_putcAtthhch
.L71:
.LM94:
	movw r24,r28
	ldi r22,lo8(10)
	ldi r23,hi8(10)
	call __divmodhi4
	movw r28,r22
.LM95:
	cp r8,__zero_reg__
	cpc r9,__zero_reg__
	brne .L72
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	brne .L72
.LVL129:
	tst r16
	breq .L73
.LVL130:
.L72:
.LM96:
	sub r17,r10
.LM97:
	inc r13
.LVL131:
.L69:
	cp r13,r4
	brlo .L74
.LVL132:
.L73:
.LBE101:
.LM98:
	tst r7
	breq .L75
.LVL133:
	mov r24,r17
	sub r24,r10
	mov r22,r12
	ldi r20,lo8(45)
	rjmp .L78
.LVL134:
.L75:
.LM99:
	sbrs r14,3
	rjmp .L77
	mov r24,r17
	sub r24,r10
	mov r22,r12
	ldi r20,lo8(43)
.L78:
	mov r18,r11
	call _Z11lcd_putcAtthhch
.LVL135:
.L77:
/* epilogue start */
.LBE100:
.LM100:
	pop r29
	pop r28
.LVL136:
	pop r17
.LVL137:
	pop r16
.LVL138:
	pop r15
	pop r14
	pop r13
.LVL139:
	pop r12
.LVL140:
	pop r11
.LVL141:
	pop r10
.LVL142:
	pop r9
	pop r8
	pop r7
.LVL143:
	pop r6
	pop r5
	pop r4
.LVL144:
	ret
.LFE24:
	.size	_Z14lcd_outdezNAtthhihh, .-_Z14lcd_outdezNAtthhihh
.global	_Z13lcd_outdezAtthhih
	.type	_Z13lcd_outdezAtthhih, @function
_Z13lcd_outdezAtthhih:
.LFB23:
.LM101:
.LVL145:
	push r16
/* prologue: function */
/* frame size = 0 */
.LM102:
	ldi r16,lo8(5)
	call _Z14lcd_outdezNAtthhihh
.LVL146:
/* epilogue start */
.LM103:
	pop r16
	ret
.LFE23:
	.size	_Z13lcd_outdezAtthhih, .-_Z13lcd_outdezAtthhih
.global	_Z10lcd_outdezhhi
	.type	_Z10lcd_outdezhhi, @function
_Z10lcd_outdezhhi:
.LFB22:
.LM104:
.LVL147:
/* prologue: function */
/* frame size = 0 */
.LM105:
	ldi r18,lo8(0)
	call _Z13lcd_outdezAtthhih
.LVL148:
/* epilogue start */
.LM106:
	ret
.LFE22:
	.size	_Z10lcd_outdezhhi, .-_Z10lcd_outdezhhi
.global	_Z13lcd_hlineStiphhah
	.type	_Z13lcd_hlineStiphhah, @function
_Z13lcd_hlineStiphhah:
.LFB26:
.LM107:
.LVL149:
/* prologue: function */
/* frame size = 0 */
	mov r25,r24
.LBB102:
.LM108:
	sbrs r20,7
	rjmp .L84
.LVL150:
	add r25,r20
	neg r20
.LVL151:
.L84:
.LM109:
	mov r24,r22
	lsr r24
	lsr r24
	lsr r24
	mov r30,r24
.LVL152:
	ldi r31,lo8(0)
.LVL153:
	lsr r31
	mov r31,r30
	clr r30
	ror r31
	ror r30
.LVL154:
	add r30,r25
	adc r31,__zero_reg__
	subi r30,lo8(-(displayBuf))
	sbci r31,hi8(-(displayBuf))
.LM110:
	andi r22,lo8(7)
.LVL155:
	ldi r24,lo8(1)
	ldi r25,hi8(1)
	mov r19,r24
	rjmp 2f
1:	lsl r19
2:	dec r22
	brpl 1b
	mov r22,r19
.LVL156:
	rjmp .L85
.L88:
.LM111:
	mov r24,r18
	ldi r25,lo8(0)
.LVL157:
	movw r18,r24
.LVL158:
	asr r19
	ror r18
	sbrs r24,0
	rjmp .L87
.LM112:
	ld r24,Z
	eor r24,r22
	st Z,r24
.LM113:
	ori r18,lo8(-128)
.LVL159:
.L87:
.LM114:
	subi r20,lo8(-(-1))
.LVL160:
.LM115:
	adiw r30,1
.LVL161:
.L85:
.LM116:
	tst r20
	brne .L88
/* epilogue start */
.LBE102:
.LM117:
	ret
.LFE26:
	.size	_Z13lcd_hlineStiphhah, .-_Z13lcd_hlineStiphhah
.global	_Z9lcd_hlinehha
	.type	_Z9lcd_hlinehha, @function
_Z9lcd_hlinehha:
.LFB27:
.LM118:
.LVL162:
/* prologue: function */
/* frame size = 0 */
.LM119:
	ldi r18,lo8(-1)
	call _Z13lcd_hlineStiphhah
.LVL163:
/* epilogue start */
.LM120:
	ret
.LFE27:
	.size	_Z9lcd_hlinehha, .-_Z9lcd_hlinehha
.global	_Z9lcd_vlinehha
	.type	_Z9lcd_vlinehha, @function
_Z9lcd_vlinehha:
.LFB28:
.LM121:
.LVL164:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	mov r18,r22
.LBB103:
.LM122:
	mov r30,r24
	ldi r31,lo8(0)
	mov r24,r22
.LVL165:
	lsr r24
	lsr r24
	lsr r24
	mov r28,r24
.LVL166:
	ldi r29,lo8(0)
.LVL167:
	lsr r29
	mov r29,r28
	clr r28
	ror r29
	ror r28
.LVL168:
	add r28,r30
	adc r29,r31
	subi r28,lo8(-(displayBuf))
	sbci r29,hi8(-(displayBuf))
.LM123:
	ldi r19,lo8(0)
	mov r16,r20
	clr r17
	sbrc r16,7
	com r17
	add r16,r18
	adc r17,r19
	movw r24,r16
	ldi r22,lo8(8)
	ldi r23,hi8(8)
.LVL169:
	call __divmodhi4
	lsr r23
	mov r23,r22
	clr r22
	ror r23
	ror r22
.LVL170:
	add r22,r30
	adc r23,r31
	subi r22,lo8(-(displayBuf))
	sbci r23,hi8(-(displayBuf))
.LM124:
	andi r18,lo8(7)
	andi r19,hi8(7)
	ldi r24,lo8(1)
	ldi r25,hi8(1)
	rjmp 2f
1:	lsl r24
	rol r25
2:	dec r18
	brpl 1b
	neg r24
	ld r18,Y
	eor r18,r24
	st Y,r18
	rjmp .L93
.L94:
.LM125:
	subi r28,lo8(-(128))
	sbci r29,hi8(-(128))
.LM126:
	ld r24,Y
	com r24
	st Y,r24
.L93:
.LM127:
	cp r28,r22
	cpc r29,r23
	brlo .L94
.LM128:
	movw r24,r16
	ldi r22,lo8(8)
	ldi r23,hi8(8)
.LVL171:
	call __divmodhi4
	ldi r18,lo8(1)
	ldi r19,hi8(1)
	rjmp 2f
1:	lsl r18
	rol r19
2:	dec r24
	brpl 1b
	neg r18
	ld r24,Y
	eor r24,r18
	st Y,r24
/* epilogue start */
.LBE103:
.LM129:
	pop r29
.LVL172:
	pop r28
.LVL173:
	pop r17
	pop r16
	ret
.LFE28:
	.size	_Z9lcd_vlinehha, .-_Z9lcd_vlinehha
.global	_Z10lcdSendCtlh
	.type	_Z10lcdSendCtlh, @function
_Z10lcdSendCtlh:
.LFB29:
.LM130:
.LVL174:
/* prologue: function */
/* frame size = 0 */
.LM131:
	cbi 53-32,1
.LM132:
	cbi 53-32,3
.LM133:
	cbi 53-32,4
.LM134:
	out 59-32,r24
.LM135:
	sbi 53-32,5
.LM136:
	cbi 53-32,5
.LM137:
	sbi 53-32,3
.LM138:
	sbi 53-32,1
/* epilogue start */
.LM139:
	ret
.LFE29:
	.size	_Z10lcdSendCtlh, .-_Z10lcdSendCtlh
.global	_Z10lcdSendDath
	.type	_Z10lcdSendDath, @function
_Z10lcdSendDath:
.LFB30:
.LM140:
.LVL175:
/* prologue: function */
/* frame size = 0 */
.LM141:
	cbi 53-32,1
.LM142:
	sbi 53-32,3
.LM143:
	cbi 53-32,4
.LM144:
	out 59-32,r24
.LM145:
	sbi 53-32,5
.LM146:
	cbi 53-32,5
.LM147:
	sbi 53-32,3
.LM148:
	sbi 53-32,1
/* epilogue start */
.LM149:
	ret
.LFE30:
	.size	_Z10lcdSendDath, .-_Z10lcdSendDath
.global	_Z11delay_1_5usi
	.type	_Z11delay_1_5usi, @function
_Z11delay_1_5usi:
.LFB31:
.LM150:
.LVL176:
/* prologue: function */
/* frame size = 0 */
.LM151:
	ldi r18,lo8(0)
	ldi r19,hi8(0)
.LVL177:
.LBB104:
.LBB105:
.LBB106:
.LBB107:
.LBB108:
.LBB109:
.LM152:
	ldi r21,lo8(5)
	rjmp .L101
.LVL178:
.L102:
	mov r20,r21
/* #APP */
 ;  88 "/usr/lib/gcc/avr/4.3.4/../../../avr/include/util/delay_basic.h" 1
	1: dec r20
	brne 1b
 ;  0 "" 2
/* #NOAPP */
.LBE109:
.LBE108:
.LBE107:
.LBE106:
.LBE105:
.LM153:
	subi r18,lo8(-(1))
	sbci r19,hi8(-(1))
.L101:
	cp r18,r24
	cpc r19,r25
	brlt .L102
/* epilogue start */
.LBE104:
.LM154:
	ret
.LFE31:
	.size	_Z11delay_1_5usi, .-_Z11delay_1_5usi
.global	_Z8lcd_initv
	.type	_Z8lcd_initv, @function
_Z8lcd_initv:
.LFB32:
.LM155:
/* prologue: function */
/* frame size = 0 */
.LM156:
	cbi 53-32,2
.LBB110:
.LBB111:
.LBB112:
.LBB113:
.LBB114:
.LM157:
	ldi r24,lo8(5)
	mov r25,r24
.LVL179:
/* #APP */
 ;  88 "/usr/lib/gcc/avr/4.3.4/../../../avr/include/util/delay_basic.h" 1
	1: dec r25
	brne 1b
 ;  0 "" 2
/* #NOAPP */
.LBE114:
.LBE113:
.LBE112:
.LBE111:
.LBE110:
.LBB115:
.LBB116:
.LBB117:
.LBB118:
.LBB119:
/* #APP */
 ;  88 "/usr/lib/gcc/avr/4.3.4/../../../avr/include/util/delay_basic.h" 1
	1: dec r24
	brne 1b
 ;  0 "" 2
.LVL180:
/* #NOAPP */
.LBE119:
.LBE118:
.LBE117:
.LBE116:
.LBE115:
.LM158:
	sbi 53-32,2
	ldi r24,lo8(0)
	ldi r25,hi8(0)
.LVL181:
.LBB120:
.LBB121:
.LBB122:
.LBB123:
.LBB124:
.LBB125:
.LBB126:
.LBB127:
.LM159:
	ldi r19,lo8(5)
.L105:
	mov r18,r19
.LVL182:
/* #APP */
 ;  88 "/usr/lib/gcc/avr/4.3.4/../../../avr/include/util/delay_basic.h" 1
	1: dec r18
	brne 1b
 ;  0 "" 2
/* #NOAPP */
.LBE127:
.LBE126:
.LBE125:
.LBE124:
.LBE123:
.LM160:
	adiw r24,1
	ldi r18,hi8(1500)
	cpi r24,lo8(1500)
	cpc r25,r18
.LVL183:
	brne .L105
.LBE122:
.LBE121:
.LBE120:
.LM161:
	ldi r24,lo8(-30)
.LVL184:
	call _Z10lcdSendCtlh
.LVL185:
.LM162:
	ldi r24,lo8(-82)
	call _Z10lcdSendCtlh
.LM163:
	ldi r24,lo8(-95)
	call _Z10lcdSendCtlh
.LM164:
	ldi r24,lo8(-90)
	call _Z10lcdSendCtlh
.LM165:
	ldi r24,lo8(-92)
	call _Z10lcdSendCtlh
.LM166:
	ldi r24,lo8(-94)
	call _Z10lcdSendCtlh
.LM167:
	ldi r24,lo8(-64)
	call _Z10lcdSendCtlh
.LM168:
	ldi r24,lo8(47)
	call _Z10lcdSendCtlh
.LM169:
	ldi r24,lo8(37)
	call _Z10lcdSendCtlh
.LM170:
	ldi r24,lo8(-127)
	call _Z10lcdSendCtlh
.LM171:
	ldi r24,lo8(34)
	call _Z10lcdSendCtlh
.LM172:
	ldi r24,lo8(-81)
	call _Z10lcdSendCtlh
.LM173:
	ldi r24,lo8(34)
	sts g_eeGeneral+28,r24
/* epilogue start */
.LM174:
	ret
.LFE32:
	.size	_Z8lcd_initv, .-_Z8lcd_initv
.global	_Z13lcdSetRefVolth
	.type	_Z13lcdSetRefVolth, @function
_Z13lcdSetRefVolth:
.LFB33:
.LM175:
.LVL186:
	push r17
/* prologue: function */
/* frame size = 0 */
	mov r17,r24
.LM176:
	ldi r24,lo8(-127)
.LVL187:
	call _Z10lcdSendCtlh
.LM177:
	mov r24,r17
	call _Z10lcdSendCtlh
/* epilogue start */
.LM178:
	pop r17
.LVL188:
	ret
.LFE33:
	.size	_Z13lcdSetRefVolth, .-_Z13lcdSetRefVolth
.global	_Z13refreshDiplayv
	.type	_Z13refreshDiplayv, @function
_Z13refreshDiplayv:
.LFB34:
.LM179:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
.LM180:
	ldi r28,lo8(displayBuf)
	ldi r29,hi8(displayBuf)
	ldi r16,lo8(0)
.LVL189:
.L112:
	movw r14,r28
.LBB128:
.LBB129:
.LM181:
	ldi r24,lo8(4)
	call _Z10lcdSendCtlh
.LM182:
	ldi r24,lo8(16)
	call _Z10lcdSendCtlh
.LM183:
	mov r24,r16
	ori r24,lo8(-80)
	call _Z10lcdSendCtlh
	ldi r17,lo8(0)
.L111:
.LBB130:
.LM184:
	movw r30,r14
	ld r24,Z+
	movw r14,r30
	call _Z10lcdSendDath
.LM185:
	subi r17,lo8(-(1))
	cpi r17,lo8(-128)
	brne .L111
.LBE130:
.LM186:
	subi r16,lo8(-(1))
	subi r28,lo8(-(128))
	sbci r29,hi8(-(128))
	cpi r16,lo8(8)
	brne .L112
/* epilogue start */
.LBE129:
.LBE128:
.LM187:
	pop r29
	pop r28
	pop r17
.LVL190:
	pop r16
.LVL191:
	pop r15
	pop r14
.LVL192:
	ret
.LFE34:
	.size	_Z13refreshDiplayv, .-_Z13refreshDiplayv
.global	displayBuf
.global	displayBuf
	.section .bss
	.type	displayBuf, @object
	.size	displayBuf, 1024
displayBuf:
	.skip 1024,0
.global	font
	.section	.progmem.data,"a",@progbits
	.type	font, @object
	.size	font, 483
font:
	.byte	80
	.byte	8
	.byte	80
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	94
	.byte	0
	.byte	0
	.byte	0
	.byte	8
	.byte	6
	.byte	8
	.byte	6
	.byte	40
	.byte	126
	.byte	40
	.byte	126
	.byte	40
	.byte	4
	.byte	42
	.byte	126
	.byte	42
	.byte	16
	.byte	76
	.byte	44
	.byte	16
	.byte	104
	.byte	100
	.byte	52
	.byte	74
	.byte	86
	.byte	32
	.byte	80
	.byte	0
	.byte	0
	.byte	0
	.byte	8
	.byte	6
	.byte	0
	.byte	0
	.byte	24
	.byte	36
	.byte	66
	.byte	0
	.byte	0
	.byte	66
	.byte	36
	.byte	24
	.byte	20
	.byte	8
	.byte	62
	.byte	8
	.byte	20
	.byte	8
	.byte	8
	.byte	62
	.byte	8
	.byte	8
	.byte	0
	.byte	0
	.byte	-80
	.byte	112
	.byte	0
	.byte	0
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	0
	.byte	0
	.byte	96
	.byte	96
	.byte	0
	.byte	0
	.byte	96
	.byte	24
	.byte	6
	.byte	0
	.byte	0
	.byte	60
	.byte	66
	.byte	66
	.byte	60
	.byte	0
	.byte	0
	.byte	68
	.byte	126
	.byte	64
	.byte	0
	.byte	68
	.byte	98
	.byte	82
	.byte	76
	.byte	0
	.byte	66
	.byte	74
	.byte	74
	.byte	52
	.byte	0
	.byte	24
	.byte	20
	.byte	122
	.byte	16
	.byte	0
	.byte	46
	.byte	74
	.byte	74
	.byte	50
	.byte	0
	.byte	60
	.byte	74
	.byte	74
	.byte	48
	.byte	0
	.byte	2
	.byte	114
	.byte	10
	.byte	6
	.byte	0
	.byte	52
	.byte	74
	.byte	74
	.byte	52
	.byte	0
	.byte	12
	.byte	82
	.byte	82
	.byte	60
	.byte	0
	.byte	0
	.byte	108
	.byte	108
	.byte	0
	.byte	0
	.byte	0
	.byte	-88
	.byte	104
	.byte	0
	.byte	0
	.byte	0
	.byte	8
	.byte	20
	.byte	34
	.byte	0
	.byte	20
	.byte	20
	.byte	20
	.byte	20
	.byte	0
	.byte	0
	.byte	34
	.byte	20
	.byte	8
	.byte	0
	.byte	4
	.byte	82
	.byte	10
	.byte	4
	.byte	60
	.byte	66
	.byte	90
	.byte	90
	.byte	28
	.byte	0
	.byte	124
	.byte	18
	.byte	18
	.byte	124
	.byte	0
	.byte	126
	.byte	74
	.byte	74
	.byte	52
	.byte	0
	.byte	60
	.byte	66
	.byte	66
	.byte	36
	.byte	0
	.byte	126
	.byte	66
	.byte	66
	.byte	60
	.byte	0
	.byte	126
	.byte	74
	.byte	74
	.byte	66
	.byte	0
	.byte	126
	.byte	10
	.byte	10
	.byte	2
	.byte	0
	.byte	60
	.byte	66
	.byte	82
	.byte	52
	.byte	0
	.byte	126
	.byte	16
	.byte	16
	.byte	126
	.byte	0
	.byte	66
	.byte	126
	.byte	66
	.byte	0
	.byte	0
	.byte	32
	.byte	64
	.byte	64
	.byte	62
	.byte	0
	.byte	126
	.byte	24
	.byte	36
	.byte	66
	.byte	0
	.byte	126
	.byte	64
	.byte	64
	.byte	64
	.byte	126
	.byte	4
	.byte	8
	.byte	4
	.byte	126
	.byte	0
	.byte	126
	.byte	8
	.byte	16
	.byte	126
	.byte	0
	.byte	60
	.byte	66
	.byte	66
	.byte	60
	.byte	0
	.byte	126
	.byte	18
	.byte	18
	.byte	12
	.byte	0
	.byte	60
	.byte	66
	.byte	34
	.byte	92
	.byte	0
	.byte	126
	.byte	18
	.byte	50
	.byte	76
	.byte	0
	.byte	36
	.byte	74
	.byte	82
	.byte	36
	.byte	2
	.byte	2
	.byte	126
	.byte	2
	.byte	2
	.byte	0
	.byte	62
	.byte	64
	.byte	64
	.byte	62
	.byte	30
	.byte	32
	.byte	64
	.byte	32
	.byte	30
	.byte	126
	.byte	32
	.byte	24
	.byte	32
	.byte	126
	.byte	66
	.byte	36
	.byte	24
	.byte	36
	.byte	66
	.byte	2
	.byte	4
	.byte	120
	.byte	4
	.byte	2
	.byte	0
	.byte	98
	.byte	82
	.byte	74
	.byte	70
	.byte	0
	.byte	126
	.byte	66
	.byte	66
	.byte	0
	.byte	0
	.byte	6
	.byte	24
	.byte	96
	.byte	0
	.byte	0
	.byte	66
	.byte	66
	.byte	126
	.byte	0
	.byte	8
	.byte	4
	.byte	2
	.byte	4
	.byte	8
	.byte	64
	.byte	64
	.byte	64
	.byte	64
	.byte	64
	.byte	0
	.byte	0
	.byte	6
	.byte	8
	.byte	0
	.byte	0
	.byte	48
	.byte	72
	.byte	72
	.byte	120
	.byte	0
	.byte	126
	.byte	72
	.byte	72
	.byte	48
	.byte	0
	.byte	48
	.byte	72
	.byte	72
	.byte	72
	.byte	0
	.byte	48
	.byte	72
	.byte	72
	.byte	126
	.byte	0
	.byte	120
	.byte	72
	.byte	88
	.byte	88
	.byte	0
	.byte	8
	.byte	-2
	.byte	10
	.byte	8
	.byte	0
	.byte	16
	.byte	-88
	.byte	-88
	.byte	120
	.byte	0
	.byte	126
	.byte	8
	.byte	8
	.byte	112
	.byte	0
	.byte	72
	.byte	122
	.byte	64
	.byte	0
	.byte	0
	.byte	-128
	.byte	-120
	.byte	-6
	.byte	0
	.byte	0
	.byte	126
	.byte	16
	.byte	40
	.byte	64
	.byte	0
	.byte	66
	.byte	126
	.byte	64
	.byte	0
	.byte	120
	.byte	8
	.byte	112
	.byte	8
	.byte	112
	.byte	0
	.byte	120
	.byte	8
	.byte	8
	.byte	112
	.byte	0
	.byte	48
	.byte	72
	.byte	72
	.byte	48
	.byte	0
	.byte	-8
	.byte	40
	.byte	40
	.byte	16
	.byte	0
	.byte	16
	.byte	40
	.byte	40
	.byte	-8
	.byte	0
	.byte	120
	.byte	16
	.byte	8
	.byte	8
	.byte	0
	.byte	80
	.byte	88
	.byte	104
	.byte	40
	.byte	0
	.byte	8
	.byte	126
	.byte	72
	.byte	72
	.byte	0
	.byte	56
	.byte	64
	.byte	64
	.byte	120
	.byte	24
	.byte	32
	.byte	64
	.byte	32
	.byte	24
	.byte	56
	.byte	64
	.byte	48
	.byte	64
	.byte	56
	.byte	0
	.byte	72
	.byte	48
	.byte	48
	.byte	72
	.byte	0
	.byte	-104
	.byte	-96
	.byte	-96
	.byte	120
	.byte	0
	.byte	72
	.byte	104
	.byte	88
	.byte	72
	.byte	0
	.byte	16
	.byte	124
	.byte	68
	.byte	0
	.byte	0
	.byte	0
	.byte	126
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	68
	.byte	124
	.byte	16
	.byte	16
	.byte	16
	.byte	68
	.byte	56
	.byte	16
	.byte	16
	.byte	56
	.byte	68
	.byte	16
	.byte	16
	.data
	.type	_ZZ11lcd_putcAtthhchE3dbl, @object
	.size	_ZZ11lcd_putcAtthhchE3dbl, 16
_ZZ11lcd_putcAtthhchE3dbl:
	.byte	0
	.byte	3
	.byte	12
	.byte	15
	.byte	48
	.byte	51
	.byte	60
	.byte	63
	.byte	-64
	.byte	-61
	.byte	-52
	.byte	-49
	.byte	-16
	.byte	-13
	.byte	-4
	.byte	-1
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
	.long	.LFB13
	.long	.LFE13-.LFB13
	.p2align	2
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB14
	.long	.LFE14-.LFB14
	.p2align	2
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB15
	.long	.LFE15-.LFB15
	.p2align	2
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.long	.Lframe0
	.long	.LFB16
	.long	.LFE16-.LFB16
	.p2align	2
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.long	.Lframe0
	.long	.LFB17
	.long	.LFE17-.LFB17
	.p2align	2
.LEFDE8:
.LSFDE10:
	.long	.LEFDE10-.LASFDE10
.LASFDE10:
	.long	.Lframe0
	.long	.LFB18
	.long	.LFE18-.LFB18
	.p2align	2
.LEFDE10:
.LSFDE12:
	.long	.LEFDE12-.LASFDE12
.LASFDE12:
	.long	.Lframe0
	.long	.LFB19
	.long	.LFE19-.LFB19
	.p2align	2
.LEFDE12:
.LSFDE14:
	.long	.LEFDE14-.LASFDE14
.LASFDE14:
	.long	.Lframe0
	.long	.LFB20
	.long	.LFE20-.LFB20
	.p2align	2
.LEFDE14:
.LSFDE16:
	.long	.LEFDE16-.LASFDE16
.LASFDE16:
	.long	.Lframe0
	.long	.LFB21
	.long	.LFE21-.LFB21
	.p2align	2
.LEFDE16:
.LSFDE18:
	.long	.LEFDE18-.LASFDE18
.LASFDE18:
	.long	.Lframe0
	.long	.LFB25
	.long	.LFE25-.LFB25
	.p2align	2
.LEFDE18:
.LSFDE20:
	.long	.LEFDE20-.LASFDE20
.LASFDE20:
	.long	.Lframe0
	.long	.LFB24
	.long	.LFE24-.LFB24
	.p2align	2
.LEFDE20:
.LSFDE22:
	.long	.LEFDE22-.LASFDE22
.LASFDE22:
	.long	.Lframe0
	.long	.LFB23
	.long	.LFE23-.LFB23
	.p2align	2
.LEFDE22:
.LSFDE24:
	.long	.LEFDE24-.LASFDE24
.LASFDE24:
	.long	.Lframe0
	.long	.LFB22
	.long	.LFE22-.LFB22
	.p2align	2
.LEFDE24:
.LSFDE26:
	.long	.LEFDE26-.LASFDE26
.LASFDE26:
	.long	.Lframe0
	.long	.LFB26
	.long	.LFE26-.LFB26
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
	.long	.LFB28
	.long	.LFE28-.LFB28
	.p2align	2
.LEFDE30:
.LSFDE32:
	.long	.LEFDE32-.LASFDE32
.LASFDE32:
	.long	.Lframe0
	.long	.LFB29
	.long	.LFE29-.LFB29
	.p2align	2
.LEFDE32:
.LSFDE34:
	.long	.LEFDE34-.LASFDE34
.LASFDE34:
	.long	.Lframe0
	.long	.LFB30
	.long	.LFE30-.LFB30
	.p2align	2
.LEFDE34:
.LSFDE36:
	.long	.LEFDE36-.LASFDE36
.LASFDE36:
	.long	.Lframe0
	.long	.LFB31
	.long	.LFE31-.LFB31
	.p2align	2
.LEFDE36:
.LSFDE38:
	.long	.LEFDE38-.LASFDE38
.LASFDE38:
	.long	.Lframe0
	.long	.LFB32
	.long	.LFE32-.LFB32
	.p2align	2
.LEFDE38:
.LSFDE40:
	.long	.LEFDE40-.LASFDE40
.LASFDE40:
	.long	.Lframe0
	.long	.LFB33
	.long	.LFE33-.LFB33
	.p2align	2
.LEFDE40:
.LSFDE42:
	.long	.LEFDE42-.LASFDE42
.LASFDE42:
	.long	.Lframe0
	.long	.LFB34
	.long	.LFE34-.LFB34
	.p2align	2
.LEFDE42:
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST2:
	.long	.LVL0-.Ltext0
	.long	.LVL6-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL6-.Ltext0
	.long	.LVL28-.Ltext0
	.word	0x1
	.byte	0x6a
	.long	.LVL35-.Ltext0
	.long	.LFE14-.Ltext0
	.word	0x1
	.byte	0x6a
	.long	0x0
	.long	0x0
.LLST3:
	.long	.LVL0-.Ltext0
	.long	.LVL24-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST4:
	.long	.LVL0-.Ltext0
	.long	.LVL4-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST5:
	.long	.LVL0-.Ltext0
	.long	.LVL11-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL11-.Ltext0
	.long	.LVL23-.Ltext0
	.word	0x1
	.byte	0x67
	.long	0x0
	.long	0x0
.LLST6:
	.long	.LVL0-.Ltext0
	.long	.LVL1-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST7:
	.long	.LVL2-.Ltext0
	.long	.LVL5-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL5-.Ltext0
	.long	.LVL31-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL31-.Ltext0
	.long	.LVL34-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL34-.Ltext0
	.long	.LFE14-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST8:
	.long	.LVL10-.Ltext0
	.long	.LVL39-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST9:
	.long	.LVL12-.Ltext0
	.long	.LVL13-.Ltext0
	.word	0x1
	.byte	0x63
	.long	.LVL14-.Ltext0
	.long	.LVL15-.Ltext0
	.word	0x1
	.byte	0x63
	.long	.LVL18-.Ltext0
	.long	.LFE14-.Ltext0
	.word	0x1
	.byte	0x63
	.long	0x0
	.long	0x0
.LLST10:
	.long	.LVL3-.Ltext0
	.long	.LVL26-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL26-.Ltext0
	.long	.LVL29-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL29-.Ltext0
	.long	.LVL35-.Ltext0
	.word	0x6
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL35-.Ltext0
	.long	.LVL36-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL36-.Ltext0
	.long	.LVL37-.Ltext0
	.word	0x1
	.byte	0x6c
	.long	.LVL37-.Ltext0
	.long	.LVL38-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST11:
	.long	.LVL6-.Ltext0
	.long	.LVL7-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL7-.Ltext0
	.long	.LVL16-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL19-.Ltext0
	.long	.LVL21-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST12:
	.long	.LVL32-.Ltext0
	.long	.LVL34-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST13:
	.long	.LVL30-.Ltext0
	.long	.LVL32-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL32-.Ltext0
	.long	.LVL34-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST15:
	.long	.LVL40-.Ltext0
	.long	.LVL45-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST16:
	.long	.LVL40-.Ltext0
	.long	.LVL48-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL49-.Ltext0
	.long	.LVL50-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL51-.Ltext0
	.long	.LVL52-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST17:
	.long	.LVL40-.Ltext0
	.long	.LVL46-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST18:
	.long	.LVL40-.Ltext0
	.long	.LVL47-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL53-.Ltext0
	.long	.LVL55-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL58-.Ltext0
	.long	.LVL60-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST19:
	.long	.LVL43-.Ltext0
	.long	.LVL64-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST20:
	.long	.LVL48-.Ltext0
	.long	.LVL49-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL50-.Ltext0
	.long	.LVL51-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL52-.Ltext0
	.long	.LFE15-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST21:
	.long	.LVL54-.Ltext0
	.long	.LVL58-.Ltext0
	.word	0x1
	.byte	0x69
	.long	.LVL62-.Ltext0
	.long	.LFE15-.Ltext0
	.word	0x1
	.byte	0x69
	.long	0x0
	.long	0x0
.LLST22:
	.long	.LVL54-.Ltext0
	.long	.LVL56-.Ltext0
	.word	0x1
	.byte	0x6a
	.long	.LVL57-.Ltext0
	.long	.LVL58-.Ltext0
	.word	0x1
	.byte	0x6a
	.long	.LVL62-.Ltext0
	.long	.LFE15-.Ltext0
	.word	0x1
	.byte	0x6a
	.long	0x0
	.long	0x0
.LLST23:
	.long	.LVL54-.Ltext0
	.long	.LVL56-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL57-.Ltext0
	.long	.LVL58-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL62-.Ltext0
	.long	.LFE15-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST24:
	.long	.LVL59-.Ltext0
	.long	.LVL60-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL61-.Ltext0
	.long	.LFE15-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST25:
	.long	.LVL59-.Ltext0
	.long	.LVL61-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL61-.Ltext0
	.long	.LFE15-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST27:
	.long	.LVL65-.Ltext0
	.long	.LVL66-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST28:
	.long	.LVL65-.Ltext0
	.long	.LVL66-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST29:
	.long	.LVL65-.Ltext0
	.long	.LVL66-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST31:
	.long	.LVL67-.Ltext0
	.long	.LVL72-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL72-.Ltext0
	.long	.LVL79-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL79-.Ltext0
	.long	.LFE17-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST32:
	.long	.LVL67-.Ltext0
	.long	.LVL72-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL72-.Ltext0
	.long	.LVL81-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	.LVL81-.Ltext0
	.long	.LFE17-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST33:
	.long	.LVL67-.Ltext0
	.long	.LVL70-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST34:
	.long	.LVL67-.Ltext0
	.long	.LVL72-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL72-.Ltext0
	.long	.LVL78-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	.LVL78-.Ltext0
	.long	.LFE17-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST35:
	.long	.LVL67-.Ltext0
	.long	.LVL68-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL69-.Ltext0
	.long	.LVL71-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL71-.Ltext0
	.long	.LVL80-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	0x0
	.long	0x0
.LLST36:
	.long	.LVL73-.Ltext0
	.long	.LVL74-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL75-.Ltext0
	.long	.LVL76-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST38:
	.long	.LVL82-.Ltext0
	.long	.LVL83-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST39:
	.long	.LVL82-.Ltext0
	.long	.LVL83-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST40:
	.long	.LVL82-.Ltext0
	.long	.LVL83-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST41:
	.long	.LVL82-.Ltext0
	.long	.LVL83-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST43:
	.long	.LVL84-.Ltext0
	.long	.LVL86-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL86-.Ltext0
	.long	.LVL95-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST44:
	.long	.LVL84-.Ltext0
	.long	.LVL86-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL86-.Ltext0
	.long	.LVL96-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	.LVL96-.Ltext0
	.long	.LFE19-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST45:
	.long	.LVL84-.Ltext0
	.long	.LVL85-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST46:
	.long	.LVL84-.Ltext0
	.long	.LVL86-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL86-.Ltext0
	.long	.LVL88-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL88-.Ltext0
	.long	.LVL92-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL92-.Ltext0
	.long	.LVL94-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL94-.Ltext0
	.long	.LFE19-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST47:
	.long	.LVL89-.Ltext0
	.long	.LVL90-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL91-.Ltext0
	.long	.LVL93-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL94-.Ltext0
	.long	.LFE19-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST49:
	.long	.LVL97-.Ltext0
	.long	.LVL98-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST50:
	.long	.LVL97-.Ltext0
	.long	.LVL98-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST51:
	.long	.LVL97-.Ltext0
	.long	.LVL98-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST53:
	.long	.LVL99-.Ltext0
	.long	.LVL100-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL100-.Ltext0
	.long	.LVL107-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL107-.Ltext0
	.long	.LVL109-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST54:
	.long	.LVL99-.Ltext0
	.long	.LVL100-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL100-.Ltext0
	.long	.LVL110-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST55:
	.long	.LVL99-.Ltext0
	.long	.LVL100-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL100-.Ltext0
	.long	.LVL108-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST56:
	.long	.LVL101-.Ltext0
	.long	.LVL102-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL102-.Ltext0
	.long	.LVL103-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL103-.Ltext0
	.long	.LVL104-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL104-.Ltext0
	.long	.LVL105-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL105-.Ltext0
	.long	.LVL106-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST58:
	.long	.LVL111-.Ltext0
	.long	.LVL112-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST60:
	.long	.LVL114-.Ltext0
	.long	.LVL117-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL117-.Ltext0
	.long	.LVL125-.Ltext0
	.word	0x1
	.byte	0x63
	.long	.LVL125-.Ltext0
	.long	.LVL137-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST61:
	.long	.LVL114-.Ltext0
	.long	.LVL117-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL117-.Ltext0
	.long	.LVL140-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	.LVL140-.Ltext0
	.long	.LFE24-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST62:
	.long	.LVL114-.Ltext0
	.long	.LVL117-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL117-.Ltext0
	.long	.LVL129-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL129-.Ltext0
	.long	.LVL130-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL130-.Ltext0
	.long	.LVL132-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL132-.Ltext0
	.long	.LVL133-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL133-.Ltext0
	.long	.LVL136-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL136-.Ltext0
	.long	.LFE24-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST63:
	.long	.LVL114-.Ltext0
	.long	.LVL122-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL122-.Ltext0
	.long	.LVL141-.Ltext0
	.word	0x1
	.byte	0x5b
	.long	0x0
	.long	0x0
.LLST64:
	.long	.LVL114-.Ltext0
	.long	.LVL115-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL116-.Ltext0
	.long	.LVL117-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL117-.Ltext0
	.long	.LVL144-.Ltext0
	.word	0x1
	.byte	0x54
	.long	0x0
	.long	0x0
.LLST65:
	.long	.LVL118-.Ltext0
	.long	.LVL119-.Ltext0
	.word	0x1
	.byte	0x5a
	.long	.LVL120-.Ltext0
	.long	.LVL142-.Ltext0
	.word	0x1
	.byte	0x5a
	.long	0x0
	.long	0x0
.LLST66:
	.long	.LVL124-.Ltext0
	.long	.LVL138-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST67:
	.long	.LVL121-.Ltext0
	.long	.LVL143-.Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST68:
	.long	.LVL126-.Ltext0
	.long	.LVL139-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	0x0
	.long	0x0
.LLST70:
	.long	.LVL145-.Ltext0
	.long	.LVL146-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST71:
	.long	.LVL145-.Ltext0
	.long	.LVL146-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST72:
	.long	.LVL145-.Ltext0
	.long	.LVL146-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST73:
	.long	.LVL145-.Ltext0
	.long	.LVL146-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST75:
	.long	.LVL147-.Ltext0
	.long	.LVL148-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST76:
	.long	.LVL147-.Ltext0
	.long	.LVL148-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST77:
	.long	.LVL147-.Ltext0
	.long	.LVL148-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST79:
	.long	.LVL149-.Ltext0
	.long	.LVL150-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL150-.Ltext0
	.long	.LVL157-.Ltext0
	.word	0x1
	.byte	0x69
	.long	.LVL161-.Ltext0
	.long	.LFE26-.Ltext0
	.word	0x1
	.byte	0x69
	.long	0x0
	.long	0x0
.LLST80:
	.long	.LVL149-.Ltext0
	.long	.LVL156-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST81:
	.long	.LVL149-.Ltext0
	.long	.LVL158-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL159-.Ltext0
	.long	.LFE26-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST83:
	.long	.LVL162-.Ltext0
	.long	.LVL163-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST84:
	.long	.LVL162-.Ltext0
	.long	.LVL163-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST85:
	.long	.LVL162-.Ltext0
	.long	.LVL163-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST87:
	.long	.LVL164-.Ltext0
	.long	.LVL165-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST88:
	.long	.LVL164-.Ltext0
	.long	.LVL169-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST89:
	.long	.LVL167-.Ltext0
	.long	.LVL173-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST90:
	.long	.LVL170-.Ltext0
	.long	.LVL171-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST95:
	.long	.LVL179-.Ltext0
	.long	.LVL185-.Ltext0
	.word	0x1
	.byte	0x69
	.long	0x0
	.long	0x0
.LLST96:
	.long	.LVL180-.Ltext0
	.long	.LVL181-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST97:
	.long	.LVL181-.Ltext0
	.long	.LVL184-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST98:
	.long	.LVL182-.Ltext0
	.long	.LVL183-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST100:
	.long	.LVL186-.Ltext0
	.long	.LVL187-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL187-.Ltext0
	.long	.LVL188-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST102:
	.long	.LVL189-.Ltext0
	.long	.LVL192-.Ltext0
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST103:
	.long	.LVL189-.Ltext0
	.long	.LVL191-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST104:
	.long	.LVL189-.Ltext0
	.long	.LVL190-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
	.section	.debug_info
	.long	0xd90
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF101
	.byte	0x4
	.long	.LASF102
	.long	.LASF103
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
	.uleb128 0x2
	.long	.LASF12
	.byte	0x4
	.byte	0xd5
	.long	0xa2
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF13
	.uleb128 0x6
	.byte	0x2
	.long	0x37
	.uleb128 0x7
	.long	.LASF19
	.byte	0x2
	.byte	0x5
	.byte	0x1d
	.long	0x103
	.uleb128 0x8
	.long	.LASF14
	.byte	0x5
	.byte	0x1e
	.long	0x37
	.byte	0x1
	.byte	0x3
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.long	.LASF15
	.byte	0x5
	.byte	0x1f
	.long	0x25
	.byte	0x1
	.byte	0x5
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x8
	.long	.LASF16
	.byte	0x5
	.byte	0x20
	.long	0x25
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x8
	.long	.LASF17
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
	.long	.LASF18
	.byte	0x5
	.byte	0x22
	.long	0xb2
	.uleb128 0x7
	.long	.LASF20
	.byte	0x10
	.byte	0x5
	.byte	0x24
	.long	0x137
	.uleb128 0x9
	.long	.LASF21
	.byte	0x5
	.byte	0x25
	.long	0x137
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF22
	.byte	0x5
	.byte	0x26
	.long	0x14a
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xa
	.long	0x49
	.long	0x147
	.uleb128 0xb
	.long	0x147
	.byte	0x3
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.uleb128 0xa
	.long	0x103
	.long	0x15a
	.uleb128 0xb
	.long	0x147
	.byte	0x3
	.byte	0x0
	.uleb128 0x2
	.long	.LASF23
	.byte	0x5
	.byte	0x27
	.long	0x10e
	.uleb128 0x7
	.long	.LASF24
	.byte	0x33
	.byte	0x5
	.byte	0x2a
	.long	0x236
	.uleb128 0x9
	.long	.LASF25
	.byte	0x5
	.byte	0x2b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x9
	.long	.LASF26
	.byte	0x5
	.byte	0x2c
	.long	0x137
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x9
	.long	.LASF27
	.byte	0x5
	.byte	0x2d
	.long	0x137
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0x9
	.long	.LASF28
	.byte	0x5
	.byte	0x2e
	.long	0x137
	.byte	0x2
	.byte	0x23
	.uleb128 0x11
	.uleb128 0x9
	.long	.LASF29
	.byte	0x5
	.byte	0x2f
	.long	0x5b
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0x9
	.long	.LASF30
	.byte	0x5
	.byte	0x30
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1b
	.uleb128 0x9
	.long	.LASF31
	.byte	0x5
	.byte	0x31
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x9
	.long	.LASF32
	.byte	0x5
	.byte	0x32
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0x9
	.long	.LASF33
	.byte	0x5
	.byte	0x33
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0x9
	.long	.LASF34
	.byte	0x5
	.byte	0x34
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1f
	.uleb128 0x9
	.long	.LASF35
	.byte	0x5
	.byte	0x35
	.long	0x15a
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x9
	.long	.LASF36
	.byte	0x5
	.byte	0x36
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x9
	.long	.LASF37
	.byte	0x5
	.byte	0x3b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x31
	.uleb128 0x9
	.long	.LASF38
	.byte	0x5
	.byte	0x3c
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x32
	.byte	0x0
	.uleb128 0x2
	.long	.LASF39
	.byte	0x5
	.byte	0x3d
	.long	0x165
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF40
	.uleb128 0xc
	.long	.LASF41
	.byte	0x2
	.byte	0x67
	.byte	0x3
	.long	0x260
	.uleb128 0xd
	.long	.LASF43
	.byte	0x2
	.byte	0x67
	.long	0x5b
	.byte	0x0
	.uleb128 0xc
	.long	.LASF42
	.byte	0x6
	.byte	0x6e
	.byte	0x3
	.long	0x290
	.uleb128 0xd
	.long	.LASF44
	.byte	0x6
	.byte	0x6e
	.long	0x290
	.uleb128 0xe
	.long	.LASF45
	.byte	0x6
	.byte	0x70
	.long	0x5b
	.uleb128 0xe
	.long	.LASF46
	.byte	0x6
	.byte	0x71
	.long	0x290
	.uleb128 0xf
	.uleb128 0xf
	.byte	0x0
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF47
	.uleb128 0xc
	.long	.LASF48
	.byte	0x2
	.byte	0x51
	.byte	0x3
	.long	0x2af
	.uleb128 0xd
	.long	.LASF43
	.byte	0x2
	.byte	0x51
	.long	0x37
	.byte	0x0
	.uleb128 0xc
	.long	.LASF49
	.byte	0x6
	.byte	0x94
	.byte	0x3
	.long	0x2f5
	.uleb128 0xd
	.long	.LASF50
	.byte	0x6
	.byte	0x94
	.long	0x290
	.uleb128 0xe
	.long	.LASF45
	.byte	0x6
	.byte	0x96
	.long	0x37
	.uleb128 0xe
	.long	.LASF46
	.byte	0x6
	.byte	0x97
	.long	0x290
	.uleb128 0x10
	.long	0x2f3
	.uleb128 0x11
	.long	0x26c
	.uleb128 0x12
	.long	0x277
	.uleb128 0x12
	.long	0x282
	.uleb128 0xf
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xf
	.byte	0x0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF104
	.byte	0x1
	.byte	0xfc
	.byte	0x1
	.long	0x321
	.uleb128 0x14
	.string	"ms"
	.byte	0x1
	.byte	0xfc
	.long	0x54
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0xfe
	.long	0x54
	.uleb128 0x16
	.uleb128 0x10
	.long	0x31e
	.uleb128 0xf
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xf
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF51
	.byte	0x1
	.byte	0x25
	.long	.LASF53
	.long	.LFB13
	.long	.LFE13
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x346
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x27
	.long	0x66
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF52
	.byte	0x1
	.byte	0x2b
	.long	.LASF54
	.long	.LFB14
	.long	.LFE14
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x4d3
	.uleb128 0x18
	.string	"i_x"
	.byte	0x1
	.byte	0x2b
	.long	0x37
	.long	.LLST2
	.uleb128 0x18
	.string	"i_y"
	.byte	0x1
	.byte	0x2b
	.long	0x37
	.long	.LLST3
	.uleb128 0x19
	.long	.LASF55
	.byte	0x1
	.byte	0x2b
	.long	0x4d3
	.long	.LLST4
	.uleb128 0x18
	.string	"idx"
	.byte	0x1
	.byte	0x2b
	.long	0x37
	.long	.LLST5
	.uleb128 0x19
	.long	.LASF17
	.byte	0x1
	.byte	0x2b
	.long	0x37
	.long	.LLST6
	.uleb128 0x1a
	.string	"q"
	.byte	0x1
	.byte	0x2d
	.long	0x4d3
	.long	.LLST7
	.uleb128 0x15
	.string	"w"
	.byte	0x1
	.byte	0x2e
	.long	0x37
	.uleb128 0x1a
	.string	"hb"
	.byte	0x1
	.byte	0x2f
	.long	0x37
	.long	.LLST8
	.uleb128 0xe
	.long	.LASF56
	.byte	0x1
	.byte	0x30
	.long	0x37
	.uleb128 0x1a
	.string	"inv"
	.byte	0x1
	.byte	0x32
	.long	0xa5
	.long	.LLST9
	.uleb128 0x1b
	.long	.LBB69
	.long	.LBE69
	.long	0x412
	.uleb128 0xe
	.long	.LASF57
	.byte	0x1
	.byte	0x2e
	.long	0x5b
	.uleb128 0x1c
	.long	.LASF58
	.byte	0x1
	.byte	0x2e
	.long	0x37
	.long	.LLST10
	.byte	0x0
	.uleb128 0x1b
	.long	.LBB70
	.long	.LBE70
	.long	0x43a
	.uleb128 0xe
	.long	.LASF57
	.byte	0x1
	.byte	0x2f
	.long	0x5b
	.uleb128 0x1c
	.long	.LASF58
	.byte	0x1
	.byte	0x2f
	.long	0x37
	.long	.LLST11
	.byte	0x0
	.uleb128 0x1d
	.long	.Ldebug_ranges0+0x0
	.long	0x45c
	.uleb128 0xe
	.long	.LASF57
	.byte	0x1
	.byte	0x30
	.long	0x5b
	.uleb128 0x1e
	.long	.LASF58
	.byte	0x1
	.byte	0x30
	.long	0x37
	.byte	0x1
	.byte	0x62
	.byte	0x0
	.uleb128 0x1f
	.long	.LBB73
	.long	.LBE73
	.uleb128 0x20
	.string	"yb"
	.byte	0x1
	.byte	0x33
	.long	0x37
	.byte	0x1
	.byte	0x69
	.uleb128 0x1f
	.long	.LBB74
	.long	.LBE74
	.uleb128 0x20
	.string	"p"
	.byte	0x1
	.byte	0x34
	.long	0xac
	.byte	0x6
	.byte	0x6a
	.byte	0x93
	.uleb128 0x1
	.byte	0x6b
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x21
	.long	.Ldebug_ranges0+0x18
	.uleb128 0x15
	.string	"x"
	.byte	0x1
	.byte	0x35
	.long	0x37
	.uleb128 0x1f
	.long	.LBB76
	.long	.LBE76
	.uleb128 0x1a
	.string	"b"
	.byte	0x1
	.byte	0x36
	.long	0x37
	.long	.LLST12
	.uleb128 0x21
	.long	.Ldebug_ranges0+0x30
	.uleb128 0xe
	.long	.LASF57
	.byte	0x1
	.byte	0x36
	.long	0x5b
	.uleb128 0x1c
	.long	.LASF58
	.byte	0x1
	.byte	0x36
	.long	0x37
	.long	.LLST13
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x2
	.long	0x4d9
	.uleb128 0x22
	.long	0x97
	.uleb128 0x17
	.byte	0x1
	.long	.LASF59
	.byte	0x1
	.byte	0x3d
	.long	.LASF60
	.long	.LFB15
	.long	.LFE15
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x615
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0x3d
	.long	0x37
	.long	.LLST15
	.uleb128 0x18
	.string	"y"
	.byte	0x1
	.byte	0x3d
	.long	0x37
	.long	.LLST16
	.uleb128 0x18
	.string	"c"
	.byte	0x1
	.byte	0x3d
	.long	0x615
	.long	.LLST17
	.uleb128 0x19
	.long	.LASF17
	.byte	0x1
	.byte	0x3d
	.long	0x37
	.long	.LLST18
	.uleb128 0x1a
	.string	"p"
	.byte	0x1
	.byte	0x3f
	.long	0xac
	.long	.LLST19
	.uleb128 0x20
	.string	"q"
	.byte	0x1
	.byte	0x42
	.long	0x61a
	.byte	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x1a
	.string	"inv"
	.byte	0x1
	.byte	0x43
	.long	0xa5
	.long	.LLST20
	.uleb128 0x1b
	.long	.LBB81
	.long	.LBE81
	.long	0x5b1
	.uleb128 0x1a
	.string	"i"
	.byte	0x1
	.byte	0x46
	.long	0x241
	.long	.LLST21
	.uleb128 0x1f
	.long	.LBB82
	.long	.LBE82
	.uleb128 0x1a
	.string	"b"
	.byte	0x1
	.byte	0x47
	.long	0x37
	.long	.LLST22
	.uleb128 0x1f
	.long	.LBB83
	.long	.LBE83
	.uleb128 0x1c
	.long	.LASF57
	.byte	0x1
	.byte	0x47
	.long	0x5b
	.long	.LLST23
	.uleb128 0xe
	.long	.LASF58
	.byte	0x1
	.byte	0x47
	.long	0x37
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.long	.LBB84
	.long	.LBE84
	.long	0x603
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x52
	.long	0x241
	.uleb128 0x1f
	.long	.LBB85
	.long	.LBE85
	.uleb128 0x1a
	.string	"b"
	.byte	0x1
	.byte	0x53
	.long	0x37
	.long	.LLST24
	.uleb128 0x1f
	.long	.LBB86
	.long	.LBE86
	.uleb128 0xe
	.long	.LASF57
	.byte	0x1
	.byte	0x53
	.long	0x5b
	.uleb128 0x1c
	.long	.LASF58
	.byte	0x1
	.byte	0x53
	.long	0x37
	.long	.LLST25
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.string	"dbl"
	.byte	0x1
	.byte	0x49
	.long	0xd15
	.byte	0x5
	.byte	0x3
	.long	_ZZ11lcd_putcAtthhchE3dbl
	.byte	0x0
	.uleb128 0x22
	.long	0x241
	.uleb128 0x6
	.byte	0x2
	.long	0x97
	.uleb128 0x17
	.byte	0x1
	.long	.LASF61
	.byte	0x1
	.byte	0x5c
	.long	.LASF62
	.long	.LFB16
	.long	.LFE16
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x663
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0x5c
	.long	0x37
	.long	.LLST27
	.uleb128 0x18
	.string	"y"
	.byte	0x1
	.byte	0x5c
	.long	0x37
	.long	.LLST28
	.uleb128 0x18
	.string	"c"
	.byte	0x1
	.byte	0x5c
	.long	0x615
	.long	.LLST29
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF63
	.byte	0x1
	.byte	0x60
	.long	.LASF64
	.long	.LFB17
	.long	.LFE17
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x6fb
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0x60
	.long	0x37
	.long	.LLST31
	.uleb128 0x18
	.string	"y"
	.byte	0x1
	.byte	0x60
	.long	0x37
	.long	.LLST32
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0x60
	.long	0x6fb
	.long	.LLST33
	.uleb128 0x18
	.string	"len"
	.byte	0x1
	.byte	0x60
	.long	0x37
	.long	.LLST34
	.uleb128 0x19
	.long	.LASF17
	.byte	0x1
	.byte	0x60
	.long	0x37
	.long	.LLST35
	.uleb128 0x1f
	.long	.LBB88
	.long	.LBE88
	.uleb128 0x1a
	.string	"c"
	.byte	0x1
	.byte	0x63
	.long	0x241
	.long	.LLST36
	.uleb128 0x1f
	.long	.LBB89
	.long	.LBE89
	.uleb128 0xe
	.long	.LASF57
	.byte	0x1
	.byte	0x63
	.long	0x5b
	.uleb128 0xe
	.long	.LASF58
	.byte	0x1
	.byte	0x63
	.long	0x37
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x6
	.byte	0x2
	.long	0x701
	.uleb128 0x22
	.long	0x89
	.uleb128 0x17
	.byte	0x1
	.long	.LASF65
	.byte	0x1
	.byte	0x69
	.long	.LASF66
	.long	.LFB18
	.long	.LFE18
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x758
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0x69
	.long	0x37
	.long	.LLST38
	.uleb128 0x18
	.string	"y"
	.byte	0x1
	.byte	0x69
	.long	0x37
	.long	.LLST39
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0x69
	.long	0x6fb
	.long	.LLST40
	.uleb128 0x18
	.string	"len"
	.byte	0x1
	.byte	0x69
	.long	0x37
	.long	.LLST41
	.byte	0x0
	.uleb128 0x23
	.byte	0x1
	.long	.LASF105
	.byte	0x1
	.byte	0x6d
	.long	.LASF106
	.long	0x37
	.long	.LFB19
	.long	.LFE19
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x7e1
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0x6d
	.long	0x37
	.long	.LLST43
	.uleb128 0x18
	.string	"y"
	.byte	0x1
	.byte	0x6d
	.long	0x37
	.long	.LLST44
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0x6d
	.long	0x6fb
	.long	.LLST45
	.uleb128 0x19
	.long	.LASF17
	.byte	0x1
	.byte	0x6d
	.long	0x37
	.long	.LLST46
	.uleb128 0x21
	.long	.Ldebug_ranges0+0x48
	.uleb128 0x1a
	.string	"c"
	.byte	0x1
	.byte	0x71
	.long	0x241
	.long	.LLST47
	.uleb128 0x1f
	.long	.LBB92
	.long	.LBE92
	.uleb128 0xe
	.long	.LASF57
	.byte	0x1
	.byte	0x71
	.long	0x5b
	.uleb128 0xe
	.long	.LASF58
	.byte	0x1
	.byte	0x71
	.long	0x37
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF67
	.byte	0x1
	.byte	0x79
	.long	.LASF68
	.long	.LFB20
	.long	.LFE20
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x824
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0x79
	.long	0x37
	.long	.LLST49
	.uleb128 0x18
	.string	"y"
	.byte	0x1
	.byte	0x79
	.long	0x37
	.long	.LLST50
	.uleb128 0x18
	.string	"s"
	.byte	0x1
	.byte	0x79
	.long	0x6fb
	.long	.LLST51
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF69
	.byte	0x1
	.byte	0x7d
	.long	.LASF70
	.long	.LFB21
	.long	.LFE21
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x88f
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0x7d
	.long	0x37
	.long	.LLST53
	.uleb128 0x18
	.string	"y"
	.byte	0x1
	.byte	0x7d
	.long	0x37
	.long	.LLST54
	.uleb128 0x18
	.string	"val"
	.byte	0x1
	.byte	0x7d
	.long	0x5b
	.long	.LLST55
	.uleb128 0x1f
	.long	.LBB96
	.long	.LBE96
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x80
	.long	0x54
	.uleb128 0x21
	.long	.Ldebug_ranges0+0x60
	.uleb128 0x1a
	.string	"c"
	.byte	0x1
	.byte	0x83
	.long	0x241
	.long	.LLST56
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF71
	.byte	0x1
	.byte	0xb5
	.long	.LASF72
	.long	.LFB25
	.long	.LFE25
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x8cc
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0xb5
	.long	0x37
	.long	.LLST58
	.uleb128 0x24
	.string	"y"
	.byte	0x1
	.byte	0xb5
	.long	0x37
	.byte	0x1
	.byte	0x66
	.uleb128 0x15
	.string	"p"
	.byte	0x1
	.byte	0xba
	.long	0xac
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF73
	.byte	0x1
	.byte	0x96
	.long	.LASF74
	.long	.LFB24
	.long	.LFE24
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x972
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0x96
	.long	0x37
	.long	.LLST60
	.uleb128 0x18
	.string	"y"
	.byte	0x1
	.byte	0x96
	.long	0x37
	.long	.LLST61
	.uleb128 0x18
	.string	"val"
	.byte	0x1
	.byte	0x96
	.long	0x49
	.long	.LLST62
	.uleb128 0x19
	.long	.LASF17
	.byte	0x1
	.byte	0x96
	.long	0x37
	.long	.LLST63
	.uleb128 0x18
	.string	"len"
	.byte	0x1
	.byte	0x96
	.long	0x37
	.long	.LLST64
	.uleb128 0x1a
	.string	"fw"
	.byte	0x1
	.byte	0x98
	.long	0x37
	.long	.LLST65
	.uleb128 0x1c
	.long	.LASF75
	.byte	0x1
	.byte	0x9a
	.long	0x37
	.long	.LLST66
	.uleb128 0x1a
	.string	"neg"
	.byte	0x1
	.byte	0x9b
	.long	0xa5
	.long	.LLST67
	.uleb128 0x1f
	.long	.LBB101
	.long	.LBE101
	.uleb128 0x1a
	.string	"i"
	.byte	0x1
	.byte	0x9f
	.long	0x37
	.long	.LLST68
	.byte	0x0
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF76
	.byte	0x1
	.byte	0x92
	.long	.LASF77
	.long	.LFB23
	.long	.LFE23
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x9c6
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0x92
	.long	0x37
	.long	.LLST70
	.uleb128 0x18
	.string	"y"
	.byte	0x1
	.byte	0x92
	.long	0x37
	.long	.LLST71
	.uleb128 0x18
	.string	"val"
	.byte	0x1
	.byte	0x92
	.long	0x49
	.long	.LLST72
	.uleb128 0x19
	.long	.LASF17
	.byte	0x1
	.byte	0x92
	.long	0x37
	.long	.LLST73
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF78
	.byte	0x1
	.byte	0x89
	.long	.LASF79
	.long	.LFB22
	.long	.LFE22
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xa0b
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0x89
	.long	0x37
	.long	.LLST75
	.uleb128 0x18
	.string	"y"
	.byte	0x1
	.byte	0x89
	.long	0x37
	.long	.LLST76
	.uleb128 0x18
	.string	"val"
	.byte	0x1
	.byte	0x89
	.long	0x49
	.long	.LLST77
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF80
	.byte	0x1
	.byte	0xbd
	.long	.LASF81
	.long	.LFB26
	.long	.LFE26
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xa78
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0xbd
	.long	0x42
	.long	.LLST79
	.uleb128 0x18
	.string	"y"
	.byte	0x1
	.byte	0xbd
	.long	0x42
	.long	.LLST80
	.uleb128 0x24
	.string	"w"
	.byte	0x1
	.byte	0xbd
	.long	0x30
	.byte	0x1
	.byte	0x64
	.uleb128 0x18
	.string	"pat"
	.byte	0x1
	.byte	0xbd
	.long	0x37
	.long	.LLST81
	.uleb128 0x20
	.string	"p"
	.byte	0x1
	.byte	0xc0
	.long	0xac
	.byte	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x20
	.string	"msk"
	.byte	0x1
	.byte	0xc1
	.long	0x37
	.byte	0x1
	.byte	0x66
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF82
	.byte	0x1
	.byte	0xcf
	.long	.LASF83
	.long	.LFB27
	.long	.LFE27
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xabb
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0xcf
	.long	0x37
	.long	.LLST83
	.uleb128 0x18
	.string	"y"
	.byte	0x1
	.byte	0xcf
	.long	0x37
	.long	.LLST84
	.uleb128 0x18
	.string	"w"
	.byte	0x1
	.byte	0xcf
	.long	0x25
	.long	.LLST85
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF84
	.byte	0x1
	.byte	0xd3
	.long	.LASF85
	.long	.LFB28
	.long	.LFE28
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xb16
	.uleb128 0x18
	.string	"x"
	.byte	0x1
	.byte	0xd3
	.long	0x37
	.long	.LLST87
	.uleb128 0x18
	.string	"y"
	.byte	0x1
	.byte	0xd3
	.long	0x37
	.long	.LLST88
	.uleb128 0x24
	.string	"h"
	.byte	0x1
	.byte	0xd3
	.long	0x25
	.byte	0x1
	.byte	0x64
	.uleb128 0x1a
	.string	"p"
	.byte	0x1
	.byte	0xd9
	.long	0xac
	.long	.LLST89
	.uleb128 0x1a
	.string	"q"
	.byte	0x1
	.byte	0xda
	.long	0xac
	.long	.LLST90
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF86
	.byte	0x1
	.byte	0xe3
	.long	.LASF87
	.long	.LFB29
	.long	.LFE29
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xb3f
	.uleb128 0x24
	.string	"val"
	.byte	0x1
	.byte	0xe3
	.long	0x37
	.byte	0x1
	.byte	0x68
	.byte	0x0
	.uleb128 0x17
	.byte	0x1
	.long	.LASF88
	.byte	0x1
	.byte	0xef
	.long	.LASF89
	.long	.LFB30
	.long	.LFE30
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xb68
	.uleb128 0x24
	.string	"val"
	.byte	0x1
	.byte	0xef
	.long	0x37
	.byte	0x1
	.byte	0x68
	.byte	0x0
	.uleb128 0x25
	.long	0x2f5
	.long	.LFB31
	.long	.LFE31
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xbbc
	.uleb128 0x26
	.long	0x302
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x27
	.long	0x30c
	.byte	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x28
	.long	0x2af
	.long	.LBB105
	.long	.LBE105
	.byte	0x1
	.byte	0xfe
	.uleb128 0x28
	.long	0x297
	.long	.LBB108
	.long	.LBE108
	.byte	0x6
	.byte	0xa1
	.uleb128 0x26
	.long	0x2a3
	.byte	0x1
	.byte	0x64
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.byte	0x1
	.long	.LASF90
	.byte	0x1
	.word	0x102
	.long	.LASF92
	.long	.LFB32
	.long	.LFE32
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xc7d
	.uleb128 0x2a
	.long	0x2af
	.long	.LBB110
	.long	.LBE110
	.byte	0x1
	.word	0x108
	.long	0xc06
	.uleb128 0x28
	.long	0x297
	.long	.LBB113
	.long	.LBE113
	.byte	0x6
	.byte	0xa1
	.uleb128 0x2b
	.long	0x2a3
	.long	.LLST95
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.long	0x2af
	.long	.LBB115
	.long	.LBE115
	.byte	0x1
	.word	0x109
	.long	0xc34
	.uleb128 0x28
	.long	0x297
	.long	.LBB118
	.long	.LBE118
	.byte	0x6
	.byte	0xa1
	.uleb128 0x2b
	.long	0x2a3
	.long	.LLST96
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.long	0x2f5
	.long	.LBB120
	.long	.LBE120
	.byte	0x1
	.word	0x10b
	.uleb128 0x11
	.long	0xb7c
	.uleb128 0x2d
	.long	0x30c
	.long	.LLST97
	.uleb128 0x28
	.long	0x2af
	.long	.LBB123
	.long	.LBE123
	.byte	0x1
	.byte	0xfe
	.uleb128 0x28
	.long	0x297
	.long	.LBB126
	.long	.LBE126
	.byte	0x6
	.byte	0xa1
	.uleb128 0x2b
	.long	0x2a3
	.long	.LLST98
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x29
	.byte	0x1
	.long	.LASF91
	.byte	0x1
	.word	0x11a
	.long	.LASF93
	.long	.LFB33
	.long	.LFE33
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xcaa
	.uleb128 0x2e
	.string	"val"
	.byte	0x1
	.word	0x11a
	.long	0x37
	.long	.LLST100
	.byte	0x0
	.uleb128 0x29
	.byte	0x1
	.long	.LASF94
	.byte	0x1
	.word	0x120
	.long	.LASF95
	.long	.LFB34
	.long	.LFE34
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xd05
	.uleb128 0x2f
	.string	"p"
	.byte	0x1
	.word	0x122
	.long	0xac
	.long	.LLST102
	.uleb128 0x1f
	.long	.LBB129
	.long	.LBE129
	.uleb128 0x2f
	.string	"y"
	.byte	0x1
	.word	0x123
	.long	0x37
	.long	.LLST103
	.uleb128 0x1f
	.long	.LBB130
	.long	.LBE130
	.uleb128 0x2f
	.string	"x"
	.byte	0x1
	.word	0x127
	.long	0x37
	.long	.LLST104
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
	.long	0x37
	.long	0xd15
	.uleb128 0xb
	.long	0x147
	.byte	0xf
	.byte	0x0
	.uleb128 0x22
	.long	0xd05
	.uleb128 0x30
	.long	.LASF96
	.byte	0x7
	.word	0x1a1
	.long	0xd28
	.byte	0x1
	.byte	0x1
	.uleb128 0x31
	.long	0x37
	.uleb128 0x30
	.long	.LASF97
	.byte	0x7
	.word	0x1a2
	.long	0x37
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.long	0x37
	.long	0xd4c
	.uleb128 0x32
	.long	0x147
	.word	0x3ff
	.byte	0x0
	.uleb128 0x33
	.long	.LASF98
	.byte	0x1
	.byte	0x1f
	.long	0xd3b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	displayBuf
	.uleb128 0x34
	.long	.LASF99
	.byte	0x5
	.byte	0x82
	.long	0x236
	.byte	0x1
	.byte	0x1
	.uleb128 0xa
	.long	0x97
	.long	0xd7c
	.uleb128 0x32
	.long	0x147
	.word	0x1e2
	.byte	0x0
	.uleb128 0x33
	.long	.LASF100
	.byte	0x8
	.byte	0x1
	.long	0xd8e
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	font
	.uleb128 0x22
	.long	0xd6b
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
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
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
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
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
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
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
	.byte	0x0
	.byte	0x0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0xb
	.byte	0x1
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1e
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
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
	.uleb128 0x26
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
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
	.uleb128 0x2b
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x31
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
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
	.uleb128 0x34
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0x17b
	.word	0x2
	.long	.Ldebug_info0
	.long	0xd94
	.long	0x321
	.string	"lcd_clear"
	.long	0x346
	.string	"lcd_img"
	.long	0x4de
	.string	"lcd_putcAtt"
	.long	0x620
	.string	"lcd_putc"
	.long	0x663
	.string	"lcd_putsnAtt"
	.long	0x706
	.string	"lcd_putsn_P"
	.long	0x758
	.string	"lcd_putsAtt"
	.long	0x7e1
	.string	"lcd_puts_P"
	.long	0x824
	.string	"lcd_outhex4"
	.long	0x88f
	.string	"lcd_plot"
	.long	0x8cc
	.string	"lcd_outdezNAtt"
	.long	0x972
	.string	"lcd_outdezAtt"
	.long	0x9c6
	.string	"lcd_outdez"
	.long	0xa0b
	.string	"lcd_hlineStip"
	.long	0xa78
	.string	"lcd_hline"
	.long	0xabb
	.string	"lcd_vline"
	.long	0xb16
	.string	"lcdSendCtl"
	.long	0xb3f
	.string	"lcdSendDat"
	.long	0xb68
	.string	"delay_1_5us"
	.long	0xbbc
	.string	"lcd_init"
	.long	0xc7d
	.string	"lcdSetRefVolt"
	.long	0xcaa
	.string	"refreshDiplay"
	.long	0xd4c
	.string	"displayBuf"
	.long	0xd7c
	.string	"font"
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
	.long	.LBB71-.Ltext0
	.long	.LBE71-.Ltext0
	.long	.LBB72-.Ltext0
	.long	.LBE72-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB75-.Ltext0
	.long	.LBE75-.Ltext0
	.long	.LBB79-.Ltext0
	.long	.LBE79-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB77-.Ltext0
	.long	.LBE77-.Ltext0
	.long	.LBB78-.Ltext0
	.long	.LBE78-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB91-.Ltext0
	.long	.LBE91-.Ltext0
	.long	.LBB93-.Ltext0
	.long	.LBE93-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB97-.Ltext0
	.long	.LBE97-.Ltext0
	.long	.LBB98-.Ltext0
	.long	.LBE98-.Ltext0
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
	.ascii	"/usr/lib/gcc/avr/4.3.4/../../../avr/include/util"
	.byte	0
	.byte	0x0
	.string	"lcd.cpp"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.string	"util/delay_basic.h"
	.uleb128 0x2
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
	.string	"util/delay.h"
	.uleb128 0x2
	.uleb128 0x0
	.uleb128 0x0
	.string	"er9x.h"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.string	"font.lbm"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.byte	0x0
.LELTP0:
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1
	.byte	0x38
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM2
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM3
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM4
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM5
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM6
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM7
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM8
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM9
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM10
	.byte	0x12
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM11
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM12
	.byte	0xe
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM13
	.byte	0x1d
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM14
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM15
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM16
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM17
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM18
	.byte	0x12
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM19
	.byte	0xa
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM20
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM21
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM22
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM23
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM24
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM25
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM26
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM27
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM28
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM29
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM30
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM31
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM32
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM33
	.byte	0xc
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM34
	.byte	0x21
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM35
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM36
	.byte	0x12
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM37
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM38
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM39
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM40
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM41
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM42
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM43
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM44
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM45
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM46
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM47
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM48
	.byte	0x10
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM49
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM50
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM51
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM52
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM53
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM54
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM55
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM56
	.byte	0x10
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM57
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM58
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM59
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM60
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM61
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM62
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM63
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM64
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM65
	.byte	0x15
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
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM69
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM70
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM71
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM72
	.byte	0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM73
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM74
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM75
	.byte	0x41
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM76
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM77
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM78
	.byte	0x3
	.sleb128 -37
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM79
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM80
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM81
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM82
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM83
	.byte	0x12
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM84
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM85
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM86
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM87
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM88
	.byte	0x3
	.sleb128 -13
	.byte	0x1
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
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM93
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM94
	.byte	0x16
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
	.byte	0x3
	.sleb128 -16
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM98
	.byte	0x26
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM99
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM100
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM101
	.byte	0x3
	.sleb128 -33
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM102
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM103
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM104
	.byte	0x3
	.sleb128 -12
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM105
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM106
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM107
	.byte	0x45
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM108
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM109
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM110
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM111
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM112
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM113
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM114
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM115
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM116
	.byte	0xb
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM117
	.byte	0x1f
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM118
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM119
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM120
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM121
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM122
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM123
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM124
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM125
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM126
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM127
	.byte	0x12
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM128
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM129
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM130
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM131
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM132
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM133
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM134
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM135
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM136
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM137
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM138
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM139
	.byte	0x15
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
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM143
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM144
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM145
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM146
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM147
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM148
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM149
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM150
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM151
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM152
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -164
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM153
	.byte	0x4
	.uleb128 0x1
	.byte	0xba
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM154
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM155
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM156
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM157
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -175
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM158
	.byte	0x4
	.uleb128 0x1
	.byte	0xc6
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM159
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -178
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM160
	.byte	0x4
	.uleb128 0x1
	.byte	0xba
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM161
	.byte	0x22
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM162
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM163
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM164
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM165
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM166
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM167
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM168
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM169
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM170
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM171
	.byte	0x15
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
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM177
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM178
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM179
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM180
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM181
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM182
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM183
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM184
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM185
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM186
	.byte	0x10
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM187
	.byte	0x1d
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.Letext0
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,"MS",@progbits,1
.LASF20:
	.string	"t_TrainerData"
.LASF38:
	.string	"stickMode"
.LASF42:
	.string	"_delay_ms"
.LASF57:
	.string	"__addr16"
.LASF24:
	.string	"t_EEGeneral"
.LASF65:
	.string	"lcd_putsn_P"
.LASF106:
	.string	"_Z11lcd_putsAtthhPKch"
.LASF54:
	.string	"_Z7lcd_imghhPKhhh"
.LASF59:
	.string	"lcd_putcAtt"
.LASF10:
	.string	"long long unsigned int"
.LASF49:
	.string	"_delay_us"
.LASF83:
	.string	"_Z9lcd_hlinehha"
.LASF101:
	.string	"GNU C++ 4.3.4"
.LASF4:
	.string	"int16_t"
.LASF9:
	.string	"long long int"
.LASF2:
	.string	"signed char"
.LASF31:
	.string	"contrast"
.LASF39:
	.string	"EEGeneral"
.LASF85:
	.string	"_Z9lcd_vlinehha"
.LASF7:
	.string	"long int"
.LASF86:
	.string	"lcdSendCtl"
.LASF45:
	.string	"__ticks"
.LASF70:
	.string	"_Z11lcd_outhex4hhj"
.LASF25:
	.string	"myVers"
.LASF22:
	.string	"chanMix"
.LASF5:
	.string	"uint16_t"
.LASF76:
	.string	"lcd_outdezAtt"
.LASF47:
	.string	"double"
.LASF53:
	.string	"_Z9lcd_clearv"
.LASF58:
	.string	"__result"
.LASF73:
	.string	"lcd_outdezNAtt"
.LASF79:
	.string	"_Z10lcd_outdezhhi"
.LASF46:
	.string	"__tmp"
.LASF105:
	.string	"lcd_putsAtt"
.LASF6:
	.string	"unsigned int"
.LASF36:
	.string	"view"
.LASF61:
	.string	"lcd_putc"
.LASF71:
	.string	"lcd_plot"
.LASF8:
	.string	"long unsigned int"
.LASF96:
	.string	"g_blinkTmr10ms"
.LASF87:
	.string	"_Z10lcdSendCtlh"
.LASF78:
	.string	"lcd_outdez"
.LASF80:
	.string	"lcd_hlineStip"
.LASF66:
	.string	"_Z11lcd_putsn_PhhPKch"
.LASF44:
	.string	"__ms"
.LASF13:
	.string	"bool"
.LASF56:
	.string	"sze1"
.LASF35:
	.string	"trainer"
.LASF50:
	.string	"__us"
.LASF21:
	.string	"calib"
.LASF94:
	.string	"refreshDiplay"
.LASF37:
	.string	"warnOpts"
.LASF77:
	.string	"_Z13lcd_outdezAtthhih"
.LASF99:
	.string	"g_eeGeneral"
.LASF28:
	.string	"calibSpanPos"
.LASF68:
	.string	"_Z10lcd_puts_PhhPKc"
.LASF14:
	.string	"srcChn"
.LASF74:
	.string	"_Z14lcd_outdezNAtthhihh"
.LASF60:
	.string	"_Z11lcd_putcAtthhch"
.LASF64:
	.string	"_Z12lcd_putsnAtthhPKchh"
.LASF84:
	.string	"lcd_vline"
.LASF16:
	.string	"studWeight"
.LASF91:
	.string	"lcdSetRefVolt"
.LASF93:
	.string	"_Z13lcdSetRefVolth"
.LASF23:
	.string	"TrainerData"
.LASF48:
	.string	"_delay_loop_1"
.LASF41:
	.string	"_delay_loop_2"
.LASF3:
	.string	"unsigned char"
.LASF27:
	.string	"calibSpanNeg"
.LASF30:
	.string	"currModel"
.LASF32:
	.string	"vBatWarn"
.LASF51:
	.string	"lcd_clear"
.LASF81:
	.string	"_Z13lcd_hlineStiphhah"
.LASF72:
	.string	"_Z8lcd_plothh"
.LASF29:
	.string	"chkSum"
.LASF43:
	.string	"__count"
.LASF40:
	.string	"char"
.LASF17:
	.string	"mode"
.LASF34:
	.string	"lightSw"
.LASF62:
	.string	"_Z8lcd_putchhc"
.LASF95:
	.string	"_Z13refreshDiplayv"
.LASF98:
	.string	"displayBuf"
.LASF82:
	.string	"lcd_hline"
.LASF97:
	.string	"g_beepCnt"
.LASF15:
	.string	"swtch"
.LASF75:
	.string	"prec"
.LASF11:
	.string	"prog_char"
.LASF0:
	.string	"int8_t"
.LASF12:
	.string	"prog_uchar"
.LASF103:
	.string	"/home/erez/Desktop/er9x/er9x/OBJS"
.LASF100:
	.string	"font"
.LASF89:
	.string	"_Z10lcdSendDath"
.LASF88:
	.string	"lcdSendDat"
.LASF1:
	.string	"uint8_t"
.LASF69:
	.string	"lcd_outhex4"
.LASF52:
	.string	"lcd_img"
.LASF67:
	.string	"lcd_puts_P"
.LASF19:
	.string	"t_TrainerData1"
.LASF26:
	.string	"calibMid"
.LASF102:
	.string	"../src/lcd.cpp"
.LASF104:
	.string	"delay_1_5us"
.LASF33:
	.string	"vBatCalib"
.LASF63:
	.string	"lcd_putsnAtt"
.LASF55:
	.string	"imgdat"
.LASF18:
	.string	"TrainerData1"
.LASF90:
	.string	"lcd_init"
.LASF92:
	.string	"_Z8lcd_initv"

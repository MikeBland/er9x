	.file	"drivers.cpp"
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
.global	_Z15eeWriteBlockCmpPKvPvj
	.type	_Z15eeWriteBlockCmpPKvPvj, @function
_Z15eeWriteBlockCmpPKvPvj:
.LFB14:
.LM1:
.LVL0:
/* prologue: function */
/* frame size = 0 */
.LBB22:
.LM2:
	movw r30,r24
.LVL1:
.LM3:
	movw r18,r22
.LVL2:
	rjmp .L2
.LVL3:
.L5:
.LM4:
	ld r25,Z
.L3:
.LBB23:
.LBB24:
.LBB25:
.LM5:
	sbic 60-32,1
	rjmp .L3
.LM6:
	out (62)+1-32,r19
	out 62-32,r18
.LM7:
	sbi 60-32,0
.LM8:
	in r24,61-32
.LVL4:
	cp r25,r24
	breq .L4
.LM9:
	out 61-32,r25
.LM10:
	in r24,__SREG__
.LVL5:
.LM11:
/* #APP */
 ;  38 "../src/drivers.cpp" 1
	cli
 ;  0 "" 2
.LM12:
/* #NOAPP */
	sbi 60-32,2
.LM13:
	sbi 60-32,1
.LM14:
	out __SREG__,r24
.L4:
.LBE25:
.LBE24:
.LBE23:
.LM15:
	adiw r30,1
	subi r18,lo8(-(1))
	sbci r19,hi8(-(1))
.LM16:
	subi r20,lo8(-(-1))
	sbci r21,hi8(-(-1))
.LVL6:
.L2:
.LM17:
	cp r20,__zero_reg__
	cpc r21,__zero_reg__
	brne .L5
/* epilogue start */
.LBE22:
.LM18:
	ret
.LFE14:
	.size	_Z15eeWriteBlockCmpPKvPvj, .-_Z15eeWriteBlockCmpPKvPvj
.global	_Z8putEventh
	.type	_Z8putEventh, @function
_Z8putEventh:
.LFB15:
.LM19:
.LVL7:
/* prologue: function */
/* frame size = 0 */
.LM20:
	sts _ZL5s_evt,r24
/* epilogue start */
.LM21:
	ret
.LFE15:
	.size	_Z8putEventh, .-_Z8putEventh
.global	_Z8getEventv
	.type	_Z8getEventv, @function
_Z8getEventv:
.LFB16:
.LM22:
/* prologue: function */
/* frame size = 0 */
.LBB26:
.LM23:
	lds r24,_ZL5s_evt
.LVL8:
.LM24:
	sts _ZL5s_evt,__zero_reg__
.LVL9:
/* epilogue start */
.LBE26:
.LM25:
	ret
.LFE16:
	.size	_Z8getEventv, .-_Z8getEventv
.global	_ZN3Key5inputEb8EnumKeys
	.type	_ZN3Key5inputEb8EnumKeys, @function
_ZN3Key5inputEb8EnumKeys:
.LFB21:
.LM26:
.LVL10:
/* prologue: function */
/* frame size = 0 */
	movw r30,r24
.LM27:
	ld r24,Z
.LVL11:
	mov r25,r24
	lsl r25
	andi r25,lo8(2)
	andi r24,lo8(-4)
	or r24,r25
	st Z,r24
	tst r22
	breq .L13
	ori r25,lo8(1)
	andi r24,lo8(-4)
	or r24,r25
	st Z,r24
.L13:
.LM28:
	ldd r18,Z+1
	subi r18,lo8(-(1))
	std Z+1,r18
.LM29:
	ldd r25,Z+2
	tst r25
	breq .L14
	ld r24,Z
	andi r24,lo8(3)
	brne .L14
.LM30:
	cpi r25,lo8(99)
	breq .L15
.LBB27:
.LBB28:
.LM31:
	mov r24,r20
	ori r24,lo8(32)
	sts _ZL5s_evt,r24
.LBE28:
.LBE27:
.LM32:
	cpi r25,lo8(16)
	brne .L16
	cpi r18,lo8(16)
	brlo .L15
.L16:
.LM33:
	ld r24,Z
	andi r24,lo8(-13)
	st Z,r24
.L15:
.LM34:
	std Z+1,__zero_reg__
.LM35:
	std Z+2,__zero_reg__
.L14:
.LM36:
	ldd r25,Z+2
	cpi r25,lo8(4)
	brne .+2
	rjmp .L20
	cpi r25,lo8(5)
	brsh .L24
	cpi r25,lo8(1)
	brne .+2
	rjmp .L19
	cpi r25,lo8(1)
	brlo .L18
	cpi r25,lo8(2)
	breq .+2
	rjmp .L27
	rjmp .L20
.L24:
	cpi r25,lo8(16)
	breq .L21
	cpi r25,lo8(17)
	brsh .L25
	cpi r25,lo8(8)
	breq .+2
	rjmp .L27
	rjmp .L20
.L25:
	cpi r25,lo8(97)
	breq .L22
	cpi r25,lo8(98)
	breq .+2
	rjmp .L27
	rjmp .L29
.L18:
.LM37:
	ld r25,Z
	mov r24,r25
	andi r24,lo8(3)
	cpi r24,lo8(3)
	brne .L27
.LM38:
	ldi r24,lo8(97)
	std Z+2,r24
.LM39:
	ldd r24,Z+1
	cpi r24,lo8(17)
	brlo .L28
	andi r25,lo8(-13)
	st Z,r25
	rjmp .L28
.L22:
.LBB29:
.LBB30:
.LM40:
	ori r20,lo8(96)
.LVL12:
	sts _ZL5s_evt,r20
.LBE30:
.LBE29:
.LM41:
	ld r24,Z
	mov r25,r24
	lsr r25
	lsr r25
	subi r25,lo8(-(1))
	andi r25,lo8(3)
	lsl r25
	lsl r25
	andi r24,lo8(-13)
	or r24,r25
	st Z,r24
.LM42:
	ldi r24,lo8(16)
	std Z+2,r24
.L28:
.LM43:
	std Z+1,__zero_reg__
	ret
.L21:
.LM44:
	ldd r24,Z+1
	cpi r24,lo8(24)
	brne .L20
.LBB31:
.LBB32:
.LM45:
	mov r24,r20
	ori r24,lo8(-128)
	sts _ZL5s_evt,r24
.L20:
.LBE32:
.LBE31:
.LM46:
	ldd r24,Z+1
	cpi r24,lo8(48)
	brlo .L19
.LM47:
	mov r24,r25
	ldi r25,lo8(0)
	asr r25
	ror r24
	std Z+2,r24
.LM48:
	std Z+1,__zero_reg__
.L19:
.LM49:
	ldd r24,Z+2
	ldi r25,lo8(0)
	sbiw r24,1
	ldd r18,Z+1
	ldi r19,lo8(0)
	and r24,r18
	and r25,r19
	or r24,r25
	brne .L27
.LBB33:
.LBB34:
.LM50:
	ori r20,lo8(64)
.LVL13:
	sts _ZL5s_evt,r20
	ret
.L29:
.LBE34:
.LBE33:
.LM51:
	ldd r24,Z+1
	cpi r24,lo8(64)
	brlo .L27
.LM52:
	ldi r24,lo8(8)
	std Z+2,r24
.LM53:
	std Z+1,__zero_reg__
.L27:
	ret
.LFE21:
	.size	_ZN3Key5inputEb8EnumKeys, .-_ZN3Key5inputEb8EnumKeys
.global	_Z8keyState8EnumKeys
	.type	_Z8keyState8EnumKeys, @function
_Z8keyState8EnumKeys:
.LFB22:
.LM54:
.LVL14:
/* prologue: function */
/* frame size = 0 */
.LM55:
	movw r18,r24
.LVL15:
	cpi r24,14
	cpc r25,__zero_reg__
	brge .L31
.LBB35:
.LBB36:
.LM56:
	ldi r25,lo8(0)
	movw r30,r18
	lsl r30
	rol r31
	add r30,r18
	adc r31,r19
	subi r30,lo8(-(keys))
	sbci r31,hi8(-(keys))
	ld r24,Z
	andi r24,lo8(3)
	cpi r24,lo8(3)
	breq .+2
	rjmp .L33
	ldi r25,lo8(1)
	rjmp .L33
.L31:
.LBE36:
.LBE35:
.LM57:
	cpi r24,18
	cpc r25,__zero_reg__
	breq .L39
	cpi r24,19
	cpc r25,__zero_reg__
	brge .L44
	cpi r24,15
	cpc r25,__zero_reg__
	breq .L36
	cpi r24,16
	cpc r25,__zero_reg__
	brge .L45
	cpi r24,14
	cpc r25,__zero_reg__
	breq .+2
	rjmp .L34
	rjmp .L50
.L45:
	cpi r24,16
	cpc r25,__zero_reg__
	breq .L37
	cpi r24,17
	cpc r25,__zero_reg__
	breq .+2
	rjmp .L34
	rjmp .L51
.L44:
	cpi r24,20
	cpc r25,__zero_reg__
	breq .L41
	cpi r24,20
	cpc r25,__zero_reg__
	brlt .L40
	cpi r24,21
	cpc r25,__zero_reg__
	breq .L42
	cpi r24,22
	cpc r25,__zero_reg__
	brne .L34
	rjmp .L52
.L37:
.LM58:
	in r24,33-32
	ldi r25,lo8(0)
	lsr r25
	ror r24
	lsr r25
	ror r24
	rjmp .L48
.L41:
.LM59:
	in r24,33-32
	ldi r25,lo8(0)
	lsr r25
	ror r24
	rjmp .L48
.L36:
.LM60:
	lds r25,99
	rjmp .L47
.L51:
.LM61:
	lds r25,99
	lsr r25
	lsr r25
	lsr r25
	rjmp .L49
.L39:
.LM62:
	lds r24,99
	sbrs r24,3
	rjmp .L34
	in r24,33-32
	ldi r25,lo8(0)
	ldi r21,6
1:	lsr r25
	ror r24
	dec r21
	brne 1b
	rjmp .L48
.L40:
.LM63:
	in r25,33-32
	swap r25
	lsr r25
	lsr r25
	andi r25,0x3
.L49:
	com r25
	rjmp .L47
.L42:
.LM64:
	in r24,33-32
	ldi r25,lo8(0)
	ldi r20,4
1:	lsr r25
	ror r24
	dec r20
	brne 1b
	rjmp .L48
.L50:
.LM65:
	in r25,33-32
.L47:
	andi r25,lo8(1)
	rjmp .L33
.L52:
.LM66:
	in r24,33-32
	ldi r25,lo8(0)
	ldi r19,5
1:	lsr r25
	ror r24
	dec r19
	brne 1b
.L48:
	mov r25,r24
	rjmp .L47
.L34:
	ldi r25,lo8(0)
.L33:
.LM67:
	mov r24,r25
/* epilogue start */
	ret
.LFE22:
	.size	_Z8keyState8EnumKeys, .-_Z8keyState8EnumKeys
.global	_Z11pauseEventsh
	.type	_Z11pauseEventsh, @function
_Z11pauseEventsh:
.LFB23:
.LM68:
.LVL16:
/* prologue: function */
/* frame size = 0 */
.LM69:
	andi r24,lo8(15)
.LVL17:
.LM70:
	cpi r24,lo8(14)
	brsh .L55
	ldi r25,lo8(0)
.LBB37:
.LBB38:
.LM71:
	movw r30,r24
.LVL18:
	lsl r30
	rol r31
	add r30,r24
	adc r31,r25
	subi r30,lo8(-(keys))
	sbci r31,hi8(-(keys))
	ldi r24,lo8(98)
	std Z+2,r24
	std Z+1,__zero_reg__
.LVL19:
.L55:
	ret
.LBE38:
.LBE37:
.LFE23:
	.size	_Z11pauseEventsh, .-_Z11pauseEventsh
.global	_Z10killEventsh
	.type	_Z10killEventsh, @function
_Z10killEventsh:
.LFB24:
.LM72:
.LVL20:
/* prologue: function */
/* frame size = 0 */
.LM73:
	andi r24,lo8(15)
.LVL21:
.LM74:
	cpi r24,lo8(14)
	brsh .L58
	ldi r25,lo8(0)
.LBB39:
.LBB40:
.LM75:
	movw r30,r24
.LVL22:
	lsl r30
	rol r31
	add r30,r24
	adc r31,r25
	subi r30,lo8(-(keys))
	sbci r31,hi8(-(keys))
	ldi r24,lo8(99)
	std Z+2,r24
	ld r24,Z
	andi r24,lo8(-13)
	st Z,r24
.LVL23:
.L58:
	ret
.LBE40:
.LBE39:
.LFE24:
	.size	_Z10killEventsh, .-_Z10killEventsh
.global	_Z11getEventDblh
	.type	_Z11getEventDblh, @function
_Z11getEventDblh:
.LFB25:
.LM76:
.LVL24:
/* prologue: function */
/* frame size = 0 */
.LM77:
	andi r24,lo8(15)
.LVL25:
.LM78:
	cpi r24,lo8(14)
	brlo .L60
	ldi r24,lo8(0)
.LVL26:
	ret
.LVL27:
.L60:
.LBB41:
.LBB42:
.LM79:
	ldi r25,lo8(0)
.LVL28:
	movw r30,r24
	lsl r30
	rol r31
	add r30,r24
	adc r31,r25
	subi r30,lo8(-(keys))
	sbci r31,hi8(-(keys))
	ld r24,Z
.LVL29:
	lsr r24
	lsr r24
	andi r24,lo8(3)
.LBE42:
.LBE41:
.LM80:
	ret
.LFE25:
	.size	_Z11getEventDblh, .-_Z11getEventDblh
.global	_Z7per10msv
	.type	_Z7per10msv, @function
_Z7per10msv:
.LFB26:
.LM81:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
.LBB43:
.LM82:
	lds r24,g_tmr10ms
	lds r25,(g_tmr10ms)+1
	adiw r24,1
	sts (g_tmr10ms)+1,r25
	sts g_tmr10ms,r24
.LM83:
	lds r24,g_blinkTmr10ms
	subi r24,lo8(-(1))
	sts g_blinkTmr10ms,r24
.LM84:
	in r24,54-32
	com r24
	ldi r20,lo8(0)
	ldi r21,hi8(0)
.LBB44:
.LM85:
	mov r28,r24
.LVL30:
	ldi r29,lo8(0)
.LVL31:
.L64:
.LBE44:
.LM86:
	movw r16,r20
	subi r16,lo8(-(1))
	sbci r17,hi8(-(1))
.LBB45:
.LM87:
	movw r24,r20
	lsl r24
	rol r25
	add r24,r20
	adc r25,r21
	movw r22,r28
	mov r0,r16
	rjmp 2f
1:	asr r23
	ror r22
2:	dec r0
	brpl 1b
	andi r22,lo8(1)
	andi r23,hi8(1)
	subi r24,lo8(-(keys))
	sbci r25,hi8(-(keys))
	ldi r21,lo8(0)
	call _ZN3Key5inputEb8EnumKeys
	movw r20,r16
.LM88:
	cpi r16,6
	cpc r17,__zero_reg__
	brne .L64
.LBE45:
.LM89:
	in r24,48-32
	com r24
	ldi r28,lo8(6)
	ldi r29,hi8(6)
.LVL32:
.LBB46:
.LM90:
	mov r16,r24
.LVL33:
	ldi r17,lo8(0)
.LVL34:
.L66:
.LBB47:
	movw r30,r28
	subi r30,lo8(-(_ZZ7per10msvE9crossTrim-6))
	sbci r31,hi8(-(_ZZ7per10msvE9crossTrim-6))
/* #APP */
 ;  231 "../src/drivers.cpp" 1
	lpm r30, Z
	
 ;  0 "" 2
.LVL35:
/* #NOAPP */
.LBE47:
	movw r18,r28
	lsl r18
	rol r19
	add r18,r28
	adc r19,r29
	subi r18,lo8(-(keys))
	sbci r19,hi8(-(keys))
	ldi r22,lo8(0)
	mov r24,r30
	ldi r25,lo8(0)
.LVL36:
	and r24,r16
	and r25,r17
.LVL37:
	or r24,r25
	breq .L65
	ldi r22,lo8(1)
.L65:
	movw r24,r18
.LVL38:
	mov r20,r28
	ldi r21,lo8(0)
	call _ZN3Key5inputEb8EnumKeys
.LVL39:
	adiw r28,1
.LM91:
	cpi r28,14
	cpc r29,__zero_reg__
	brne .L66
/* epilogue start */
.LBE46:
.LBE43:
.LM92:
	pop r29
	pop r28
	pop r17
.LVL40:
	pop r16
.LVL41:
	ret
.LFE26:
	.size	_Z7per10msv, .-_Z7per10msv
.global	keys
.global	keys
	.section .bss
	.type	keys, @object
	.size	keys, 42
keys:
	.skip 42,0
.global	g_tmr10ms
.global	g_tmr10ms
	.type	g_tmr10ms, @object
	.size	g_tmr10ms, 2
g_tmr10ms:
	.skip 2,0
.global	g_blinkTmr10ms
.global	g_blinkTmr10ms
	.type	g_blinkTmr10ms, @object
	.size	g_blinkTmr10ms, 1
g_blinkTmr10ms:
	.skip 1,0
	.section	.progmem.data,"a",@progbits
	.type	_ZZ7per10msvE9crossTrim, @object
	.size	_ZZ7per10msvE9crossTrim, 8
_ZZ7per10msvE9crossTrim:
	.byte	64
	.byte	-128
	.byte	8
	.byte	4
	.byte	32
	.byte	16
	.byte	2
	.byte	1
	.lcomm _ZL5s_evt,1
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
	.long	.LFB14
	.long	.LFE14-.LFB14
	.p2align	2
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB15
	.long	.LFE15-.LFB15
	.p2align	2
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB16
	.long	.LFE16-.LFB16
	.p2align	2
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.long	.Lframe0
	.long	.LFB21
	.long	.LFE21-.LFB21
	.p2align	2
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.long	.Lframe0
	.long	.LFB22
	.long	.LFE22-.LFB22
	.p2align	2
.LEFDE8:
.LSFDE10:
	.long	.LEFDE10-.LASFDE10
.LASFDE10:
	.long	.Lframe0
	.long	.LFB23
	.long	.LFE23-.LFB23
	.p2align	2
.LEFDE10:
.LSFDE12:
	.long	.LEFDE12-.LASFDE12
.LASFDE12:
	.long	.Lframe0
	.long	.LFB24
	.long	.LFE24-.LFB24
	.p2align	2
.LEFDE12:
.LSFDE14:
	.long	.LEFDE14-.LASFDE14
.LASFDE14:
	.long	.Lframe0
	.long	.LFB25
	.long	.LFE25-.LFB25
	.p2align	2
.LEFDE14:
.LSFDE16:
	.long	.LEFDE16-.LASFDE16
.LASFDE16:
	.long	.Lframe0
	.long	.LFB26
	.long	.LFE26-.LFB26
	.p2align	2
.LEFDE16:
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST1:
	.long	.LVL0-.Ltext0
	.long	.LVL4-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL6-.Ltext0
	.long	.LFE14-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST2:
	.long	.LVL1-.Ltext0
	.long	.LVL3-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL3-.Ltext0
	.long	.LFE14-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST3:
	.long	.LVL2-.Ltext0
	.long	.LVL3-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL3-.Ltext0
	.long	.LFE14-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST4:
	.long	.LVL3-.Ltext0
	.long	.LVL4-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL5-.Ltext0
	.long	.LFE14-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST7:
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST9:
	.long	.LVL10-.Ltext0
	.long	.LVL11-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL11-.Ltext0
	.long	.LFE21-.Ltext0
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
	.long	.LVL10-.Ltext0
	.long	.LVL12-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST12:
	.long	.LVL14-.Ltext0
	.long	.LVL15-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST14:
	.long	.LVL16-.Ltext0
	.long	.LVL18-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL19-.Ltext0
	.long	.LFE23-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST16:
	.long	.LVL20-.Ltext0
	.long	.LVL22-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL23-.Ltext0
	.long	.LFE24-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST18:
	.long	.LVL24-.Ltext0
	.long	.LVL26-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL27-.Ltext0
	.long	.LVL28-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL28-.Ltext0
	.long	.LVL29-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST20:
	.long	.LVL30-.Ltext0
	.long	.LVL31-.Ltext0
	.word	0x1
	.byte	0x6c
	.long	.LVL31-.Ltext0
	.long	.LVL32-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL33-.Ltext0
	.long	.LVL34-.Ltext0
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL34-.Ltext0
	.long	.LVL40-.Ltext0
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL40-.Ltext0
	.long	.LVL41-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST21:
	.long	.LVL35-.Ltext0
	.long	.LVL36-.Ltext0
	.word	0x1
	.byte	0x6e
	.long	.LVL36-.Ltext0
	.long	.LVL38-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
	.section	.debug_info
	.long	0x63a
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF77
	.byte	0x4
	.long	.LASF78
	.long	.LASF79
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF2
	.byte	0x2
	.byte	0x7a
	.long	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF3
	.byte	0x2
	.byte	0x7c
	.long	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x3
	.long	.LASF9
	.byte	0x3
	.byte	0xd6
	.long	0x50
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.uleb128 0x3
	.long	.LASF10
	.byte	0x4
	.byte	0xd5
	.long	0x8c
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.byte	0x1
	.byte	0x2
	.long	.LASF11
	.uleb128 0x6
	.long	.LASF80
	.byte	0x2
	.byte	0x5
	.byte	0x8f
	.long	0x12d
	.uleb128 0x7
	.long	.LASF12
	.sleb128 0
	.uleb128 0x7
	.long	.LASF13
	.sleb128 1
	.uleb128 0x7
	.long	.LASF14
	.sleb128 2
	.uleb128 0x7
	.long	.LASF15
	.sleb128 3
	.uleb128 0x7
	.long	.LASF16
	.sleb128 4
	.uleb128 0x7
	.long	.LASF17
	.sleb128 5
	.uleb128 0x7
	.long	.LASF18
	.sleb128 6
	.uleb128 0x7
	.long	.LASF19
	.sleb128 7
	.uleb128 0x7
	.long	.LASF20
	.sleb128 8
	.uleb128 0x7
	.long	.LASF21
	.sleb128 9
	.uleb128 0x7
	.long	.LASF22
	.sleb128 10
	.uleb128 0x7
	.long	.LASF23
	.sleb128 11
	.uleb128 0x7
	.long	.LASF24
	.sleb128 12
	.uleb128 0x7
	.long	.LASF25
	.sleb128 13
	.uleb128 0x7
	.long	.LASF26
	.sleb128 14
	.uleb128 0x7
	.long	.LASF27
	.sleb128 15
	.uleb128 0x7
	.long	.LASF28
	.sleb128 16
	.uleb128 0x7
	.long	.LASF29
	.sleb128 17
	.uleb128 0x7
	.long	.LASF30
	.sleb128 18
	.uleb128 0x7
	.long	.LASF31
	.sleb128 19
	.uleb128 0x7
	.long	.LASF32
	.sleb128 20
	.uleb128 0x7
	.long	.LASF33
	.sleb128 21
	.uleb128 0x7
	.long	.LASF34
	.sleb128 22
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF35
	.uleb128 0x8
	.string	"Key"
	.byte	0x3
	.byte	0x1
	.byte	0x51
	.long	0x20c
	.uleb128 0x9
	.long	.LASF36
	.byte	0x1
	.byte	0x58
	.long	0x2c
	.byte	0x1
	.byte	0x2
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x3
	.uleb128 0x9
	.long	.LASF37
	.byte	0x1
	.byte	0x59
	.long	0x2c
	.byte	0x1
	.byte	0x2
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x3
	.uleb128 0xa
	.long	.LASF38
	.byte	0x1
	.byte	0x5a
	.long	0x2c
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0x3
	.uleb128 0xa
	.long	.LASF39
	.byte	0x1
	.byte	0x5b
	.long	0x2c
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.byte	0x3
	.uleb128 0xb
	.byte	0x1
	.long	.LASF40
	.byte	0x1
	.byte	0x5d
	.long	.LASF42
	.byte	0x1
	.long	0x1a7
	.uleb128 0xc
	.long	0x20c
	.byte	0x1
	.uleb128 0xd
	.long	0x8f
	.uleb128 0xd
	.long	0x96
	.byte	0x0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF81
	.byte	0x1
	.byte	0x5e
	.long	.LASF82
	.long	0x8f
	.byte	0x1
	.long	0x1c3
	.uleb128 0xc
	.long	0x20c
	.byte	0x1
	.byte	0x0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF41
	.byte	0x1
	.byte	0x5f
	.long	.LASF43
	.byte	0x1
	.long	0x1db
	.uleb128 0xc
	.long	0x20c
	.byte	0x1
	.byte	0x0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF44
	.byte	0x1
	.byte	0x60
	.long	.LASF45
	.byte	0x1
	.long	0x1f3
	.uleb128 0xc
	.long	0x20c
	.byte	0x1
	.byte	0x0
	.uleb128 0xf
	.byte	0x1
	.long	.LASF46
	.byte	0x1
	.byte	0x61
	.long	.LASF47
	.long	0x2c
	.byte	0x1
	.uleb128 0xc
	.long	0x20c
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.byte	0x2
	.long	0x137
	.uleb128 0x11
	.long	.LASF83
	.byte	0x1
	.byte	0x1a
	.byte	0x3
	.long	0x240
	.uleb128 0x12
	.string	"dat"
	.byte	0x1
	.byte	0x1a
	.long	0x2c
	.uleb128 0x13
	.long	.LASF48
	.byte	0x1
	.byte	0x1a
	.long	0x45
	.uleb128 0x14
	.long	.LASF68
	.byte	0x1
	.byte	0x25
	.long	0x2c
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF84
	.byte	0x1
	.byte	0x42
	.byte	0x1
	.long	0x259
	.uleb128 0x12
	.string	"evt"
	.byte	0x1
	.byte	0x42
	.long	0x2c
	.byte	0x0
	.uleb128 0x16
	.long	0x1a7
	.byte	0x3
	.long	0x26e
	.uleb128 0x17
	.long	.LASF49
	.long	0x26e
	.byte	0x1
	.byte	0x0
	.uleb128 0x18
	.long	0x20c
	.uleb128 0x16
	.long	0x1c3
	.byte	0x3
	.long	0x288
	.uleb128 0x17
	.long	.LASF49
	.long	0x26e
	.byte	0x1
	.byte	0x0
	.uleb128 0x16
	.long	0x1db
	.byte	0x3
	.long	0x29d
	.uleb128 0x17
	.long	.LASF49
	.long	0x26e
	.byte	0x1
	.byte	0x0
	.uleb128 0x16
	.long	0x1f3
	.byte	0x3
	.long	0x2b2
	.uleb128 0x17
	.long	.LASF49
	.long	0x26e
	.byte	0x1
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF59
	.byte	0x1
	.byte	0x2c
	.long	.LASF60
	.long	.LFB14
	.long	.LFE14
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x342
	.uleb128 0x1a
	.long	.LASF50
	.byte	0x1
	.byte	0x2c
	.long	0x342
	.long	.LLST1
	.uleb128 0x1b
	.long	.LASF51
	.byte	0x1
	.byte	0x2c
	.long	0x349
	.byte	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x1b
	.long	.LASF52
	.byte	0x1
	.byte	0x2c
	.long	0x73
	.byte	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x1c
	.long	.LASF53
	.byte	0x1
	.byte	0x2e
	.long	0x34b
	.long	.LLST2
	.uleb128 0x1c
	.long	.LASF48
	.byte	0x1
	.byte	0x2f
	.long	0x45
	.long	.LLST3
	.uleb128 0x1d
	.long	0x212
	.long	.LBB23
	.long	.LBE23
	.byte	0x1
	.byte	0x31
	.uleb128 0x1e
	.long	0x229
	.uleb128 0x1e
	.long	0x21e
	.uleb128 0x1f
	.long	0x234
	.long	.LLST4
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.byte	0x2
	.long	0x348
	.uleb128 0x20
	.uleb128 0x21
	.byte	0x2
	.uleb128 0x10
	.byte	0x2
	.long	0x351
	.uleb128 0x18
	.long	0x130
	.uleb128 0x22
	.long	0x240
	.long	.LFB15
	.long	.LFE15
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x372
	.uleb128 0x23
	.long	0x24d
	.byte	0x1
	.byte	0x68
	.byte	0x0
	.uleb128 0x24
	.byte	0x1
	.long	.LASF55
	.byte	0x1
	.byte	0x49
	.long	.LASF57
	.long	0x2c
	.long	.LFB16
	.long	.LFE16
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x3a1
	.uleb128 0x25
	.string	"evt"
	.byte	0x1
	.byte	0x4b
	.long	0x2c
	.long	.LLST7
	.byte	0x0
	.uleb128 0x26
	.long	0x185
	.byte	0x66
	.long	.LFB21
	.long	.LFE21
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x41d
	.uleb128 0x27
	.long	.LASF49
	.long	0x26e
	.byte	0x1
	.long	.LLST9
	.uleb128 0x28
	.string	"val"
	.byte	0x1
	.byte	0x66
	.long	0x8f
	.byte	0x1
	.byte	0x66
	.uleb128 0x1a
	.long	.LASF54
	.byte	0x1
	.byte	0x66
	.long	0x96
	.long	.LLST10
	.uleb128 0x29
	.long	0x240
	.long	.LBB27
	.long	.LBE27
	.byte	0x1
	.byte	0x6e
	.uleb128 0x29
	.long	0x240
	.long	.LBB29
	.long	.LBE29
	.byte	0x1
	.byte	0x81
	.uleb128 0x29
	.long	0x240
	.long	.LBB31
	.long	.LBE31
	.byte	0x1
	.byte	0x87
	.uleb128 0x29
	.long	0x240
	.long	.LBB33
	.long	.LBE33
	.byte	0x1
	.byte	0x92
	.byte	0x0
	.uleb128 0x24
	.byte	0x1
	.long	.LASF56
	.byte	0x1
	.byte	0xa1
	.long	.LASF58
	.long	0x8f
	.long	.LFB22
	.long	.LFE22
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x461
	.uleb128 0x1a
	.long	.LASF54
	.byte	0x1
	.byte	0xa1
	.long	0x96
	.long	.LLST12
	.uleb128 0x1d
	.long	0x259
	.long	.LBB35
	.long	.LBE35
	.byte	0x1
	.byte	0xa3
	.uleb128 0x1e
	.long	0x263
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF41
	.byte	0x1
	.byte	0xb7
	.long	.LASF61
	.long	.LFB23
	.long	.LFE23
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x4a1
	.uleb128 0x1a
	.long	.LASF62
	.byte	0x1
	.byte	0xb7
	.long	0x2c
	.long	.LLST14
	.uleb128 0x1d
	.long	0x273
	.long	.LBB37
	.long	.LBE37
	.byte	0x1
	.byte	0xba
	.uleb128 0x1e
	.long	0x27d
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF44
	.byte	0x1
	.byte	0xbc
	.long	.LASF63
	.long	.LFB24
	.long	.LFE24
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x4e1
	.uleb128 0x1a
	.long	.LASF62
	.byte	0x1
	.byte	0xbc
	.long	0x2c
	.long	.LLST16
	.uleb128 0x1d
	.long	0x288
	.long	.LBB39
	.long	.LBE39
	.byte	0x1
	.byte	0xbf
	.uleb128 0x1e
	.long	0x292
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
	.byte	0x1
	.long	.LASF64
	.byte	0x1
	.byte	0xc2
	.long	.LASF65
	.long	0x2c
	.long	.LFB25
	.long	.LFE25
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x525
	.uleb128 0x1a
	.long	.LASF62
	.byte	0x1
	.byte	0xc2
	.long	0x2c
	.long	.LLST18
	.uleb128 0x1d
	.long	0x29d
	.long	.LBB41
	.long	.LBE41
	.byte	0x1
	.byte	0xc5
	.uleb128 0x1e
	.long	0x2a7
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF66
	.byte	0x1
	.byte	0xcd
	.long	.LASF67
	.long	.LFB26
	.long	.LFE26
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x5b9
	.uleb128 0x14
	.long	.LASF54
	.byte	0x1
	.byte	0xd1
	.long	0x2c
	.uleb128 0x25
	.string	"in"
	.byte	0x1
	.byte	0xd2
	.long	0x2c
	.long	.LLST20
	.uleb128 0x2a
	.long	.Ldebug_ranges0+0x0
	.long	0x56c
	.uleb128 0x2b
	.string	"i"
	.byte	0x1
	.byte	0xd3
	.long	0x3e
	.byte	0x0
	.uleb128 0x2c
	.long	.LBB46
	.long	.LBE46
	.long	0x5a7
	.uleb128 0x2b
	.string	"i"
	.byte	0x1
	.byte	0xe4
	.long	0x3e
	.uleb128 0x2d
	.long	.LBB47
	.long	.LBE47
	.uleb128 0x14
	.long	.LASF69
	.byte	0x1
	.byte	0xe7
	.long	0x45
	.uleb128 0x1c
	.long	.LASF70
	.byte	0x1
	.byte	0xe7
	.long	0x2c
	.long	.LLST21
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.long	.LASF71
	.byte	0x1
	.byte	0xd9
	.long	0x5c9
	.byte	0x5
	.byte	0x3
	.long	_ZZ7per10msvE9crossTrim
	.byte	0x0
	.uleb128 0x2f
	.long	0x81
	.long	0x5c9
	.uleb128 0x30
	.long	0x12d
	.byte	0x7
	.byte	0x0
	.uleb128 0x18
	.long	0x5b9
	.uleb128 0x31
	.long	.LASF72
	.byte	0x1
	.byte	0xca
	.long	0x5e0
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	g_tmr10ms
	.uleb128 0x32
	.long	0x45
	.uleb128 0x31
	.long	.LASF73
	.byte	0x1
	.byte	0xcb
	.long	0x5f7
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	g_blinkTmr10ms
	.uleb128 0x32
	.long	0x2c
	.uleb128 0x33
	.long	.LASF74
	.byte	0x5
	.word	0x1a2
	.long	0x2c
	.byte	0x1
	.byte	0x1
	.uleb128 0x2e
	.long	.LASF75
	.byte	0x1
	.byte	0x41
	.long	0x2c
	.byte	0x5
	.byte	0x3
	.long	_ZL5s_evt
	.uleb128 0x2f
	.long	0x137
	.long	0x62b
	.uleb128 0x30
	.long	0x12d
	.byte	0xd
	.byte	0x0
	.uleb128 0x31
	.long	.LASF76
	.byte	0x1
	.byte	0x65
	.long	0x61b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	keys
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
	.uleb128 0x3
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
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xa
	.uleb128 0x32
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
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
	.uleb128 0x32
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0xb
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0xd
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xe
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x10
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x11
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
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0xa
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
	.uleb128 0x1e
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x20
	.uleb128 0x26
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3b
	.uleb128 0xb
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
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
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
	.uleb128 0x2f
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x32
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
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
	.long	0xbd
	.word	0x2
	.long	.Ldebug_info0
	.long	0x63e
	.long	0x2b2
	.string	"eeWriteBlockCmp"
	.long	0x356
	.string	"putEvent"
	.long	0x372
	.string	"getEvent"
	.long	0x3a1
	.string	"Key::input"
	.long	0x41d
	.string	"keyState"
	.long	0x461
	.string	"pauseEvents"
	.long	0x4a1
	.string	"killEvents"
	.long	0x4e1
	.string	"getEventDbl"
	.long	0x525
	.string	"per10ms"
	.long	0x5ce
	.string	"g_tmr10ms"
	.long	0x5e5
	.string	"g_blinkTmr10ms"
	.long	0x62b
	.string	"keys"
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
	.long	.LBB44-.Ltext0
	.long	.LBE44-.Ltext0
	.long	.LBB45-.Ltext0
	.long	.LBE45-.Ltext0
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
	.ascii	"/usr/lib/gcc/avr/4.3.4/include"
	.byte	0
	.byte	0x0
	.string	"drivers.cpp"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.string	"stdint.h"
	.uleb128 0x2
	.uleb128 0x0
	.uleb128 0x0
	.string	"stddef.h"
	.uleb128 0x4
	.uleb128 0x0
	.uleb128 0x0
	.string	"avr/pgmspace.h"
	.uleb128 0x2
	.uleb128 0x0
	.uleb128 0x0
	.string	"er9x.h"
	.uleb128 0x1
	.uleb128 0x0
	.uleb128 0x0
	.byte	0x0
.LELTP0:
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1
	.byte	0x3f
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM2
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM3
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM4
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM5
	.byte	0x3
	.sleb128 -20
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM6
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM7
	.byte	0x16
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
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM11
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM12
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM13
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM14
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM15
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM16
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM17
	.byte	0x12
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM18
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM19
	.byte	0x22
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM20
	.byte	0x19
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
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM24
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM25
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM26
	.byte	0x2c
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
	.byte	0x3
	.sleb128 -38
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM32
	.byte	0x3c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM33
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM34
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM35
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM36
	.byte	0x16
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
	.byte	0x3
	.sleb128 -52
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM41
	.byte	0x4f
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM42
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM43
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM44
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM45
	.byte	0x3
	.sleb128 -64
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM46
	.byte	0x59
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM47
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM48
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM49
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM50
	.byte	0x3
	.sleb128 -75
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM51
	.byte	0x63
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
	.byte	0x1d
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM55
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM56
	.byte	0x3
	.sleb128 -69
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM57
	.byte	0x5a
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
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM62
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM63
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM64
	.byte	0x15
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
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM68
	.byte	0x16
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
	.byte	0x3
	.sleb128 -91
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM72
	.byte	0x71
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
	.byte	0x3
	.sleb128 -95
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM76
	.byte	0x76
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM77
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM78
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM79
	.byte	0x3
	.sleb128 -100
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM80
	.byte	0x7a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM81
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM82
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM83
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM84
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM85
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM86
	.byte	0xb
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM87
	.byte	0x1d
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM88
	.byte	0x11
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM89
	.byte	0x24
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM90
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM91
	.byte	0x11
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM92
	.byte	0x21
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.Letext0
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,"MS",@progbits,1
.LASF61:
	.string	"_Z11pauseEventsh"
.LASF24:
	.string	"TRM_RH_DWN"
.LASF71:
	.string	"crossTrim"
.LASF9:
	.string	"size_t"
.LASF69:
	.string	"__addr16"
.LASF83:
	.string	"eeprom_write_byte_cmp"
.LASF75:
	.string	"s_evt"
.LASF54:
	.string	"enuk"
.LASF8:
	.string	"long long unsigned int"
.LASF13:
	.string	"KEY_EXIT"
.LASF41:
	.string	"pauseEvents"
.LASF39:
	.string	"m_state"
.LASF79:
	.string	"/home/erez/mnt/erez/er9x/trunk/OBJS"
.LASF77:
	.string	"GNU C++ 4.3.4"
.LASF29:
	.string	"SW_ID0"
.LASF30:
	.string	"SW_ID1"
.LASF31:
	.string	"SW_ID2"
.LASF53:
	.string	"pointer_ram"
.LASF7:
	.string	"long long int"
.LASF0:
	.string	"signed char"
.LASF55:
	.string	"getEvent"
.LASF48:
	.string	"pointer_eeprom"
.LASF81:
	.string	"state"
.LASF60:
	.string	"_Z15eeWriteBlockCmpPKvPvj"
.LASF5:
	.string	"long int"
.LASF16:
	.string	"KEY_RIGHT"
.LASF25:
	.string	"TRM_RH_UP"
.LASF44:
	.string	"killEvents"
.LASF3:
	.string	"uint16_t"
.LASF49:
	.string	"this"
.LASF70:
	.string	"__result"
.LASF36:
	.string	"m_vals"
.LASF56:
	.string	"keyState"
.LASF84:
	.string	"putEvent"
.LASF28:
	.string	"SW_ElevDR"
.LASF78:
	.string	"../src/drivers.cpp"
.LASF42:
	.string	"_ZN3Key5inputEb8EnumKeys"
.LASF12:
	.string	"KEY_MENU"
.LASF4:
	.string	"unsigned int"
.LASF6:
	.string	"long unsigned int"
.LASF73:
	.string	"g_blinkTmr10ms"
.LASF47:
	.string	"_ZN3Key6getDblEv"
.LASF17:
	.string	"KEY_LEFT"
.LASF62:
	.string	"event"
.LASF52:
	.string	"size"
.LASF57:
	.string	"_Z8getEventv"
.LASF27:
	.string	"SW_RuddDR"
.LASF33:
	.string	"SW_Gear"
.LASF11:
	.string	"bool"
.LASF19:
	.string	"TRM_LH_UP"
.LASF43:
	.string	"_ZN3Key11pauseEventsEv"
.LASF20:
	.string	"TRM_LV_DWN"
.LASF76:
	.string	"keys"
.LASF80:
	.string	"EnumKeys"
.LASF63:
	.string	"_Z10killEventsh"
.LASF1:
	.string	"unsigned char"
.LASF58:
	.string	"_Z8keyState8EnumKeys"
.LASF38:
	.string	"m_cnt"
.LASF14:
	.string	"KEY_DOWN"
.LASF23:
	.string	"TRM_RV_UP"
.LASF18:
	.string	"TRM_LH_DWN"
.LASF72:
	.string	"g_tmr10ms"
.LASF26:
	.string	"SW_ThrCt"
.LASF66:
	.string	"per10ms"
.LASF40:
	.string	"input"
.LASF35:
	.string	"char"
.LASF51:
	.string	"i_pointer_eeprom"
.LASF37:
	.string	"m_dblcnt"
.LASF74:
	.string	"g_beepCnt"
.LASF34:
	.string	"SW_Trainer"
.LASF22:
	.string	"TRM_RV_DWN"
.LASF59:
	.string	"eeWriteBlockCmp"
.LASF67:
	.string	"_Z7per10msv"
.LASF46:
	.string	"getDbl"
.LASF10:
	.string	"prog_uchar"
.LASF82:
	.string	"_ZN3Key5stateEv"
.LASF50:
	.string	"i_pointer_ram"
.LASF45:
	.string	"_ZN3Key10killEventsEv"
.LASF65:
	.string	"_Z11getEventDblh"
.LASF2:
	.string	"uint8_t"
.LASF21:
	.string	"TRM_LV_UP"
.LASF68:
	.string	"flags"
.LASF15:
	.string	"KEY_UP"
.LASF32:
	.string	"SW_AileDR"
.LASF64:
	.string	"getEventDbl"

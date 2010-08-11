	.file	"pers.cpp"
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
.global	_Z10trimReverti
	.type	_Z10trimReverti, @function
_Z10trimReverti:
.LFB17:
.LM1:
.LVL0:
/* prologue: function */
/* frame size = 0 */
.LBB14:
.LBB15:
.LBB16:
.LM2:
	movw r18,r24
	sbrs r25,7
	rjmp .L2
	clr r18
	clr r19
	sub r18,r24
	sbc r19,r25
.LVL1:
.L2:
	ldi r20,lo8(0)
.LVL2:
	rjmp .L3
.L4:
.LBE16:
.LBE15:
.LM3:
	subi r20,lo8(-(1))
.LM4:
	sub r18,r20
	sbc r19,__zero_reg__
.LVL3:
.L3:
.LM5:
	cp __zero_reg__,r18
	cpc __zero_reg__,r19
	brlt .L4
.LM6:
	sbrs r25,7
	rjmp .L5
.LVL4:
	mov r24,r20
.LVL5:
	neg r24
	ret
.LVL6:
.L5:
	mov r24,r20
.LVL7:
.LBE14:
.LM7:
	ret
.LFE17:
	.size	_Z10trimReverti, .-_Z10trimReverti
.global	_Z7eeDirtyh
	.type	_Z7eeDirtyh, @function
_Z7eeDirtyh:
.LFB21:
.LM8:
.LVL8:
/* prologue: function */
/* frame size = 0 */
	mov r25,r24
.LM9:
	tst r24
	breq .L10
.LM10:
	lds r24,_ZL12s_eeDirtyMsk
.LVL9:
	or r24,r25
	sts _ZL12s_eeDirtyMsk,r24
.LM11:
	lds r24,g_tmr10ms
	lds r25,(g_tmr10ms)+1
	sts (_ZL17s_eeDirtyTime10ms)+1,r25
	sts _ZL17s_eeDirtyTime10ms,r24
.LVL10:
.L10:
	ret
.LFE21:
	.size	_Z7eeDirtyh, .-_Z7eeDirtyh
.global	_Z7eeCheckb
	.type	_Z7eeCheckb, @function
_Z7eeCheckb:
.LFB22:
.LM12:
.LVL11:
	push r14
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
.LBB17:
.LM13:
	lds r20,_ZL12s_eeDirtyMsk
.LVL12:
.LM14:
	tst r20
	brne .+2
	rjmp .L21
.LM15:
	tst r24
	breq .+2
	rjmp .L13
	lds r24,g_tmr10ms
	lds r25,(g_tmr10ms)+1
.LVL13:
	lds r18,_ZL17s_eeDirtyTime10ms
	lds r19,(_ZL17s_eeDirtyTime10ms)+1
	sub r24,r18
	sbc r25,r19
	cpi r24,100
	cpc r25,__zero_reg__
	brlo .+2
	rjmp .L13
	rjmp .L21
.LVL14:
.L26:
.LM16:
	ldi r24,lo8(theFile)
	ldi r25,hi8(theFile)
	ldi r22,lo8(17)
	ldi r20,lo8(1)
	ldi r18,lo8(g_eeGeneral)
	ldi r19,hi8(g_eeGeneral)
	ldi r16,lo8(51)
	ldi r17,hi8(51)
	ldi r23,lo8(20)
	mov r14,r23
	call _ZN5EFile8writeRlcEhhPhjh
	sbiw r24,51
	brne .L14
.LM17:
	ldi r24,lo8(0)
	rjmp .L23
.L14:
.LM18:
	lds r24,theFile+6
	cpi r24,lo8(2)
	brne .L16
.LM19:
	lds r24,_ZL12s_eeDirtyMsk
	ori r24,lo8(1)
	rjmp .L25
.L16:
.LM20:
	ldi r24,lo8(_ZZ7eeCheckbE3__c)
	ldi r25,hi8(_ZZ7eeCheckbE3__c)
	rjmp .L24
.L22:
.LM21:
	sbrs r24,1
	rjmp .L15
.LM22:
	ldi r24,lo8(theFile)
	ldi r25,hi8(theFile)
	ldi r22,lo8(17)
	ldi r20,lo8(2)
	ldi r18,lo8(g_model)
	ldi r19,hi8(g_model)
	ldi r16,lo8(395)
	ldi r17,hi8(395)
	ldi r21,lo8(20)
	mov r14,r21
	call _ZN5EFile8writeRlcEhhPhjh
	subi r24,lo8(395)
	sbci r25,hi8(395)
	brne .L17
.LM23:
	lds r24,g_eeGeneral+27
	subi r24,lo8(-(1))
.L23:
	ldi r22,lo8(17)
	call _ZN5EFile4swapEhh
	rjmp .L15
.L17:
.LM24:
	lds r24,theFile+6
	cpi r24,lo8(2)
	brne .L18
.LM25:
	lds r24,_ZL12s_eeDirtyMsk
	ori r24,lo8(2)
.L25:
	sts _ZL12s_eeDirtyMsk,r24
.LM26:
	lds r24,g_tmr10ms
	lds r25,(g_tmr10ms)+1
	subi r24,lo8(-(-100))
	sbci r25,hi8(-(-100))
	sts (_ZL17s_eeDirtyTime10ms)+1,r25
	sts _ZL17s_eeDirtyTime10ms,r24
	rjmp .L15
.L18:
.LM27:
	ldi r24,lo8(_ZZ7eeCheckbE3__c_0)
	ldi r25,hi8(_ZZ7eeCheckbE3__c_0)
.L24:
	call _Z5alertPKc
.L15:
.LBB18:
.LBB19:
.LM28:
	lds r24,g_beepVal+1
	sts g_beepCnt,r24
	rjmp .L21
.LVL15:
.L13:
.LBE19:
.LBE18:
.LM29:
	sts _ZL12s_eeDirtyMsk,__zero_reg__
.LM30:
	mov r24,r20
.LVL16:
	sbrs r20,0
	rjmp .L22
.LVL17:
	rjmp .L26
.LVL18:
.L21:
/* epilogue start */
.LBE17:
.LM31:
	pop r17
	pop r16
	pop r14
	ret
.LFE22:
	.size	_Z7eeCheckb, .-_Z7eeCheckb
.global	_Z16eeDuplicateModelh
	.type	_Z16eeDuplicateModelh, @function
_Z16eeDuplicateModelh:
.LFB19:
.LM32:
.LVL19:
	push r15
	push r16
	push r17
	push r29
	push r28
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,15
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 15 */
.LBB20:
.LM33:
	mov r15,r24
.LVL20:
	inc r15
	mov r17,r15
	rjmp .L28
.LVL21:
.L30:
.LM34:
	mov r16,r17
	subi r16,lo8(-(1))
.LVL22:
	mov r24,r16
.LVL23:
	call _ZN5EFile6existsEh
	tst r24
	breq .L29
	mov r17,r16
.LVL24:
.L28:
.LM35:
	cpi r17,lo8(16)
	brlo .L30
.LM36:
	cpi r17,lo8(16)
	brne .L29
	ldi r24,lo8(0)
.LVL25:
	rjmp .L31
.LVL26:
.L29:
.LM37:
	ldi r24,lo8(theFile)
	ldi r25,hi8(theFile)
.LVL27:
	mov r22,r15
	call _ZN5EFile6openRdEh
.LM38:
	subi r17,lo8(-(1))
.LVL28:
	ldi r24,lo8(theFile2)
	ldi r25,hi8(theFile2)
	mov r22,r17
	ldi r20,lo8(2)
	ldi r18,lo8(-56)
	call _ZN5EFile6createEhhh
.LM39:
	movw r16,r28
	subi r16,lo8(-(1))
	sbci r17,hi8(-(1))
	rjmp .L32
.LVL29:
.L33:
.LM40:
	ldi r24,lo8(theFile2)
	ldi r25,hi8(theFile2)
.LVL30:
	movw r22,r16
	call _ZN5EFile5writeEPhh
.LVL31:
.LM41:
/* #APP */
 ;  149 "../src/pers.cpp" 1
	wdr
 ;  0 "" 2
/* #NOAPP */
.L32:
.LM42:
	ldi r24,lo8(theFile)
	ldi r25,hi8(theFile)
	movw r22,r16
	ldi r20,lo8(15)
	call _ZN5EFile4readEPhh
	mov r20,r24
.LVL32:
	tst r24
	brne .L33
.LVL33:
.LM43:
	ldi r24,lo8(theFile2)
	ldi r25,hi8(theFile2)
.LVL34:
	call _ZN5EFile10closeTruncEv
.LVL35:
	ldi r24,lo8(1)
.LVL36:
.L31:
/* epilogue start */
.LBE20:
.LM44:
	adiw r28,15
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r28
	pop r29
	pop r17
.LVL37:
	pop r16
.LVL38:
	pop r15
.LVL39:
	ret
.LFE19:
	.size	_Z16eeDuplicateModelh, .-_Z16eeDuplicateModelh
.global	_Z13eeLoadGeneralv
	.type	_Z13eeLoadGeneralv, @function
_Z13eeLoadGeneralv:
.LFB14:
.LM45:
/* prologue: function */
/* frame size = 0 */
.LBB21:
.LM46:
	ldi r24,lo8(theFile)
	ldi r25,hi8(theFile)
	ldi r22,lo8(0)
	call _ZN5EFile6openRdEh
.LM47:
	ldi r24,lo8(theFile)
	ldi r25,hi8(theFile)
	ldi r22,lo8(g_eeGeneral)
	ldi r23,hi8(g_eeGeneral)
	ldi r20,lo8(51)
	ldi r21,hi8(51)
	call _ZN5EFile7readRlcEPhj
.LM48:
	cpi r24,lo8(51)
	brne .L36
	lds r24,g_eeGeneral
	cpi r24,lo8(2)
	brne .L36
	ldi r30,lo8(g_eeGeneral+1)
	ldi r31,hi8(g_eeGeneral+1)
	ldi r18,lo8(0)
	ldi r19,hi8(0)
.LVL40:
.L37:
.LBB22:
.LM49:
	ld r24,Z+
	ld r25,Z+
	add r18,r24
	adc r19,r25
	ldi r24,hi8(g_eeGeneral+25)
	cpi r30,lo8(g_eeGeneral+25)
	cpc r31,r24
	brne .L37
.LBE22:
.LM50:
	ldi r20,lo8(0)
	ld r24,Z
	ldd r25,Z+1
	cp r24,r18
	cpc r25,r19
	brne .L39
	ldi r20,lo8(1)
	rjmp .L39
.LVL41:
.L36:
	ldi r20,lo8(0)
.LVL42:
.L39:
.LBE21:
.LM51:
	mov r24,r20
/* epilogue start */
	ret
.LFE14:
	.size	_Z13eeLoadGeneralv, .-_Z13eeLoadGeneralv
.global	_Z14generalDefaultv
	.type	_Z14generalDefaultv, @function
_Z14generalDefaultv:
.LFB13:
.LM52:
/* prologue: function */
/* frame size = 0 */
.LBB23:
.LM53:
	ldi r30,lo8(g_eeGeneral)
	ldi r31,hi8(g_eeGeneral)
	ldi r24,lo8(51)
	movw r26,r30
	st X+,__zero_reg__
        dec r24
	brne .-6
.LM54:
	ldi r24,lo8(2)
	sts g_eeGeneral,r24
.LM55:
	sts g_eeGeneral+27,__zero_reg__
.LM56:
	ldi r24,lo8(30)
	sts g_eeGeneral+28,r24
.LM57:
	ldi r24,lo8(90)
	sts g_eeGeneral+29,r24
.LM58:
	ldi r24,lo8(1)
	sts g_eeGeneral+50,r24
	adiw r30,1
.LBB24:
.LM59:
	ldi r18,lo8(512)
	ldi r19,hi8(512)
.LM60:
	ldi r24,lo8(384)
	ldi r25,hi8(384)
.L43:
.LM61:
	std Z+1,r19
	st Z,r18
.LM62:
	std Z+9,r25
	std Z+8,r24
.LM63:
	std Z+17,r25
	std Z+16,r24
	adiw r30,2
.LM64:
	ldi r27,hi8(g_eeGeneral+9)
	cpi r30,lo8(g_eeGeneral+9)
	cpc r31,r27
	brne .L43
.LBE24:
.LM65:
	ldi r24,lo8(5120)
	ldi r25,hi8(5120)
	std Z+17,r25
	std Z+16,r24
/* epilogue start */
.LBE23:
.LM66:
	ret
.LFE13:
	.size	_Z14generalDefaultv, .-_Z14generalDefaultv
.global	_Z15eeLoadModelNamehPch
	.type	_Z15eeLoadModelNamehPch, @function
_Z15eeLoadModelNamehPch:
.LFB16:
.LM67:
.LVL43:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	mov r18,r24
	movw r28,r22
	mov r17,r20
.LBB25:
.LM68:
	cpi r24,lo8(16)
	brsh .L50
.LVL44:
.LM69:
	subi r18,lo8(-(1))
.LVL45:
	ldi r24,lo8(theFile)
	ldi r25,hi8(theFile)
	mov r22,r18
	call _ZN5EFile6openRdEh
.LVL46:
.LM70:
	mov r16,r17
	ldi r17,lo8(0)
.LVL47:
	movw r24,r28
	ldi r22,lo8(32)
	ldi r23,hi8(32)
	movw r20,r16
	call memset
.LM71:
	ldi r24,lo8(theFile)
	ldi r25,hi8(theFile)
	movw r22,r28
	ldi r20,lo8(10)
	ldi r21,hi8(10)
	call _ZN5EFile7readRlcEPhj
	sbiw r24,10
	brne .L50
.LBB26:
.LM72:
	ldi r24,lo8(theFile)
	ldi r25,hi8(theFile)
	call _ZN5EFile4sizeEv
	movw r18,r24
.LVL48:
.LM73:
	movw r30,r28
	add r30,r16
	adc r31,r17
.LVL49:
	rjmp .L48
.LVL50:
.L49:
.LM74:
	movw r24,r18
	ldi r22,lo8(10)
	ldi r23,hi8(10)
	call __udivmodhi4
	subi r24,lo8(-(48))
	st -Z,r24
	movw r24,r18
	ldi r22,lo8(10)
	ldi r23,hi8(10)
	call __udivmodhi4
	movw r18,r22
.L48:
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .L49
.LVL51:
.L50:
/* epilogue start */
.LBE26:
.LBE25:
.LM75:
	pop r29
	pop r28
.LVL52:
	pop r17
.LVL53:
	pop r16
	ret
.LFE16:
	.size	_Z15eeLoadModelNamehPch, .-_Z15eeLoadModelNamehPch
.global	_Z12modelDefaulthb
	.type	_Z12modelDefaulthb, @function
_Z12modelDefaulthb:
.LFB15:
.LM76:
.LVL54:
	push r17
	push r29
	push r28
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,10
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 10 */
	mov r17,r24
.LBB27:
.LM77:
	movw r26,r28
	adiw r26,1
	ldi r30,lo8(g_model)
	ldi r31,hi8(g_model)
	ldi r24,lo8(10)
.LVL55:
.L52:
	ld r0,Z+
	st X+,r0
	subi r24,lo8(-(-1))
	brne .L52
.LM78:
	ldi r30,lo8(g_model)
	ldi r31,hi8(g_model)
	ldi r24,lo8(395)
	ldi r25,hi8(395)
	movw r26,r30
	movw r18,r24
	st X+,__zero_reg__
	subi r18,1
	sbci r19,0
	brne .-8
.LM79:
	tst r22
	breq .L53
.LM80:
	movw r26,r30
	movw r30,r28
	adiw r30,1
	ldi r24,lo8(10)
.L54:
	ld r0,Z+
	st X+,r0
	subi r24,lo8(-(-1))
	brne .L54
.L57:
.LBB28:
.LM81:
	ldi r24,lo8(1)
	sts g_model+21,r24
.LM82:
	lds r24,g_model+22
	andi r24,lo8(-128)
	ori r24,lo8(1)
	sts g_model+22,r24
.LM83:
	ldi r25,lo8(100)
	sts g_model+23,r25
.LM84:
	ldi r24,lo8(2)
	sts g_model+27,r24
.LM85:
	lds r19,g_model+28
	andi r19,lo8(-128)
	ori r19,lo8(2)
	sts g_model+28,r19
.LM86:
	sts g_model+29,r25
.LM87:
	ldi r24,lo8(3)
	sts g_model+33,r24
.LM88:
	lds r18,g_model+34
	andi r18,lo8(-128)
	ori r18,lo8(3)
	sts g_model+34,r18
.LM89:
	sts g_model+35,r25
.LM90:
	ldi r24,lo8(4)
	sts g_model+39,r24
.LM91:
	lds r24,g_model+40
	andi r24,lo8(-128)
	ori r24,lo8(4)
	sts g_model+40,r24
.LM92:
	sts g_model+41,r25
.LBE28:
.LM93:
	lds r24,g_eeGeneral+50
	sbrc r24,0
	rjmp .L55
	rjmp .L56
.L53:
.LM94:
	movw r24,r30
	ldi r22,lo8(_ZZ12modelDefaulthbE3__c)
	ldi r23,hi8(_ZZ12modelDefaulthbE3__c)
.LVL56:
	call strcpy_P
.LM95:
	mov r18,r17
	ldi r19,lo8(0)
	subi r18,lo8(-(1))
	sbci r19,hi8(-(1))
	movw r24,r18
	ldi r22,lo8(10)
	ldi r23,hi8(10)
	call __divmodhi4
	subi r22,lo8(-(48))
	sts g_model+5,r22
.LM96:
	movw r24,r18
	ldi r22,lo8(10)
	ldi r23,hi8(10)
	call __divmodhi4
	subi r24,lo8(-(48))
	sts g_model+6,r24
.LM97:
	ldi r24,lo8(1)
	sts g_model+10,r24
	rjmp .L57
.LVL57:
.L55:
.LM98:
	andi r19,lo8(-128)
	ori r19,lo8(3)
	sts g_model+28,r19
.LM99:
	andi r18,lo8(-128)
	ori r18,lo8(2)
	sts g_model+34,r18
.L56:
.LM100:
	sbrs r24,1
	rjmp .L59
.LM101:
	lds r24,g_model+22
	andi r24,lo8(-128)
	ori r24,lo8(4)
	sts g_model+22,r24
.LM102:
	lds r24,g_model+40
	andi r24,lo8(-128)
	ori r24,lo8(1)
	sts g_model+40,r24
.L59:
/* epilogue start */
.LBE27:
.LM103:
	adiw r28,10
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r28
	pop r29
	pop r17
.LVL58:
	ret
.LFE15:
	.size	_Z12modelDefaulthb, .-_Z12modelDefaulthb
.global	_Z11eeLoadModelh
	.type	_Z11eeLoadModelh, @function
_Z11eeLoadModelh:
.LFB18:
.LM104:
.LVL59:
	push r17
/* prologue: function */
/* frame size = 0 */
	mov r17,r24
.LBB29:
.LM105:
	cpi r24,lo8(16)
	brsh .L64
.LBB30:
.LM106:
	mov r22,r24
	subi r22,lo8(-(1))
	ldi r24,lo8(theFile)
	ldi r25,hi8(theFile)
.LVL60:
	call _ZN5EFile6openRdEh
.LM107:
	ldi r24,lo8(theFile)
	ldi r25,hi8(theFile)
	ldi r22,lo8(g_model)
	ldi r23,hi8(g_model)
	ldi r20,lo8(395)
	ldi r21,hi8(395)
	call _ZN5EFile7readRlcEPhj
.LM108:
	subi r24,lo8(395)
	sbci r25,hi8(395)
	breq .L64
.LM109:
	ldi r24,lo8(_ZZ11eeLoadModelhE3__c)
	ldi r25,hi8(_ZZ11eeLoadModelhE3__c)
	call _Z5alertPKc
.LM110:
	mov r24,r17
	ldi r22,lo8(1)
	call _Z12modelDefaulthb
.LVL61:
.L64:
/* epilogue start */
.LBE30:
.LBE29:
.LM111:
	pop r17
.LVL62:
	ret
.LFE18:
	.size	_Z11eeLoadModelh, .-_Z11eeLoadModelh
.global	_Z9eeReadAllv
	.type	_Z9eeReadAllv, @function
_Z9eeReadAllv:
.LFB20:
.LM112:
	push r14
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
.LBB31:
.LM113:
	call _Z8EeFsOpenv
	tst r24
	breq .L66
	call _Z6EeFsckv
	sbrc r24,7
	rjmp .L66
	call _Z13eeLoadGeneralv
	tst r24
	brne .L67
.L66:
.LBB32:
.LM114:
	ldi r24,lo8(_ZZ9eeReadAllvE3__c)
	ldi r25,hi8(_ZZ9eeReadAllvE3__c)
	call _Z5alertPKc
.LM115:
	call _Z10EeFsFormatv
.LM116:
	call _Z14generalDefaultv
.LM117:
	ldi r24,lo8(theFile)
	ldi r25,hi8(theFile)
	ldi r22,lo8(0)
	ldi r20,lo8(1)
	ldi r18,lo8(g_eeGeneral)
	ldi r19,hi8(g_eeGeneral)
	ldi r16,lo8(51)
	ldi r17,hi8(51)
	ldi r31,lo8(-56)
	mov r14,r31
	call _ZN5EFile8writeRlcEhhPhjh
.LM118:
	sbiw r24,51
	breq .L68
	ldi r24,lo8(_ZZ9eeReadAllvE3__c_0)
	ldi r25,hi8(_ZZ9eeReadAllvE3__c_0)
	call _Z5alertPKc
.L68:
.LM119:
	ldi r24,lo8(0)
	ldi r22,lo8(0)
	call _Z12modelDefaulthb
.LM120:
	ldi r24,lo8(theFile)
	ldi r25,hi8(theFile)
	ldi r22,lo8(1)
	ldi r20,lo8(2)
	ldi r18,lo8(g_model)
	ldi r19,hi8(g_model)
	ldi r16,lo8(395)
	ldi r17,hi8(395)
	ldi r30,lo8(-56)
	mov r14,r30
	call _ZN5EFile8writeRlcEhhPhjh
.LM121:
	ldi r24,lo8(_ZZ9eeReadAllvE3__c_1)
	ldi r25,hi8(_ZZ9eeReadAllvE3__c_1)
	call _Z5alertPKc
.L67:
.LBE32:
.LM122:
	lds r24,g_eeGeneral+27
	call _Z11eeLoadModelh
/* epilogue start */
.LBE31:
.LM123:
	pop r17
	pop r16
	pop r14
	ret
.LFE20:
	.size	_Z9eeReadAllv, .-_Z9eeReadAllv
.global	theFile
.global	theFile
	.section .bss
	.type	theFile, @object
	.size	theFile, 9
theFile:
	.skip 9,0
.global	theFile2
.global	theFile2
	.type	theFile2, @object
	.size	theFile2, 9
theFile2:
	.skip 9,0
	.lcomm _ZL12s_eeDirtyMsk,1
	.lcomm _ZL17s_eeDirtyTime10ms,2
	.section	.progmem.data,"a",@progbits
	.type	_ZZ7eeCheckbE3__c_0, @object
	.size	_ZZ7eeCheckbE3__c_0, 16
_ZZ7eeCheckbE3__c_0:
	.string	"EEPROM overflow"
	.type	_ZZ7eeCheckbE3__c, @object
	.size	_ZZ7eeCheckbE3__c, 16
_ZZ7eeCheckbE3__c:
	.string	"EEPROM overflow"
	.type	_ZZ9eeReadAllvE3__c_1, @object
	.size	_ZZ9eeReadAllvE3__c_1, 12
_ZZ9eeReadAllvE3__c_1:
	.string	"modwrite ok"
	.type	_ZZ9eeReadAllvE3__c_0, @object
	.size	_ZZ9eeReadAllvE3__c_0, 15
_ZZ9eeReadAllvE3__c_0:
	.string	"genwrite error"
	.type	_ZZ9eeReadAllvE3__c, @object
	.size	_ZZ9eeReadAllvE3__c, 16
_ZZ9eeReadAllvE3__c:
	.string	"Bad EEprom Data"
	.type	_ZZ11eeLoadModelhE3__c, @object
	.size	_ZZ11eeLoadModelhE3__c, 27
_ZZ11eeLoadModelhE3__c:
	.string	"EEprom Data not compatible"
	.type	_ZZ12modelDefaulthbE3__c, @object
	.size	_ZZ12modelDefaulthbE3__c, 11
_ZZ12modelDefaulthbE3__c:
	.string	"MODEL     "
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
	.long	.LFB17
	.long	.LFE17-.LFB17
	.p2align	2
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB21
	.long	.LFE21-.LFB21
	.p2align	2
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB22
	.long	.LFE22-.LFB22
	.p2align	2
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.long	.Lframe0
	.long	.LFB19
	.long	.LFE19-.LFB19
	.p2align	2
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.long	.Lframe0
	.long	.LFB14
	.long	.LFE14-.LFB14
	.p2align	2
.LEFDE8:
.LSFDE10:
	.long	.LEFDE10-.LASFDE10
.LASFDE10:
	.long	.Lframe0
	.long	.LFB13
	.long	.LFE13-.LFB13
	.p2align	2
.LEFDE10:
.LSFDE12:
	.long	.LEFDE12-.LASFDE12
.LASFDE12:
	.long	.Lframe0
	.long	.LFB16
	.long	.LFE16-.LFB16
	.p2align	2
.LEFDE12:
.LSFDE14:
	.long	.LEFDE14-.LASFDE14
.LASFDE14:
	.long	.Lframe0
	.long	.LFB15
	.long	.LFE15-.LFB15
	.p2align	2
.LEFDE14:
.LSFDE16:
	.long	.LEFDE16-.LASFDE16
.LASFDE16:
	.long	.Lframe0
	.long	.LFB18
	.long	.LFE18-.LFB18
	.p2align	2
.LEFDE16:
.LSFDE18:
	.long	.LEFDE18-.LASFDE18
.LASFDE18:
	.long	.Lframe0
	.long	.LFB20
	.long	.LFE20-.LFB20
	.p2align	2
.LEFDE18:
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST1:
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
	.long	.LVL4-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL4-.Ltext0
	.long	.LVL5-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL5-.Ltext0
	.long	.LVL6-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL6-.Ltext0
	.long	.LVL7-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL7-.Ltext0
	.long	.LFE17-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST3:
	.long	.LVL8-.Ltext0
	.long	.LVL9-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL9-.Ltext0
	.long	.LFE21-.Ltext0
	.word	0x1
	.byte	0x69
	.long	0x0
	.long	0x0
.LLST5:
	.long	.LVL11-.Ltext0
	.long	.LVL13-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL15-.Ltext0
	.long	.LVL16-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL18-.Ltext0
	.long	.LFE22-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST6:
	.long	.LVL12-.Ltext0
	.long	.LVL14-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL15-.Ltext0
	.long	.LVL17-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL18-.Ltext0
	.long	.LFE22-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST8:
	.long	.LVL19-.Ltext0
	.long	.LVL23-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL24-.Ltext0
	.long	.LVL25-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL26-.Ltext0
	.long	.LVL27-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST9:
	.long	.LVL20-.Ltext0
	.long	.LVL21-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	.LVL21-.Ltext0
	.long	.LVL22-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL22-.Ltext0
	.long	.LVL24-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL24-.Ltext0
	.long	.LVL26-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL26-.Ltext0
	.long	.LVL28-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL28-.Ltext0
	.long	.LVL37-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL37-.Ltext0
	.long	.LVL38-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL38-.Ltext0
	.long	.LVL39-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST10:
	.long	.LVL29-.Ltext0
	.long	.LVL30-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL30-.Ltext0
	.long	.LVL31-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL32-.Ltext0
	.long	.LVL33-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL33-.Ltext0
	.long	.LVL34-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL34-.Ltext0
	.long	.LVL35-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST12:
	.long	.LVL40-.Ltext0
	.long	.LVL41-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL42-.Ltext0
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
.LLST15:
	.long	.LVL43-.Ltext0
	.long	.LVL45-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL45-.Ltext0
	.long	.LVL46-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL51-.Ltext0
	.long	.LFE16-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST16:
	.long	.LVL43-.Ltext0
	.long	.LVL44-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL44-.Ltext0
	.long	.LVL49-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL49-.Ltext0
	.long	.LVL51-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL51-.Ltext0
	.long	.LVL52-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL52-.Ltext0
	.long	.LFE16-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST17:
	.long	.LVL43-.Ltext0
	.long	.LVL44-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL44-.Ltext0
	.long	.LVL47-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL51-.Ltext0
	.long	.LVL53-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL53-.Ltext0
	.long	.LFE16-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST19:
	.long	.LVL54-.Ltext0
	.long	.LVL55-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL55-.Ltext0
	.long	.LVL58-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST20:
	.long	.LVL54-.Ltext0
	.long	.LVL56-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL57-.Ltext0
	.long	.LFE15-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST22:
	.long	.LVL59-.Ltext0
	.long	.LVL60-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL60-.Ltext0
	.long	.LVL62-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL62-.Ltext0
	.long	.LFE18-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
	.section	.debug_info
	.long	0xc10
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF143
	.byte	0x4
	.long	.LASF144
	.long	.LASF145
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
	.uleb128 0x6
	.long	.LASF146
	.byte	0x9
	.byte	0x5
	.byte	0x22
	.long	0x298
	.uleb128 0x7
	.long	.LASF12
	.byte	0x5
	.byte	0x23
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.byte	0x3
	.uleb128 0x7
	.long	.LASF13
	.byte	0x5
	.byte	0x24
	.long	0x5b
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0x3
	.uleb128 0x7
	.long	.LASF14
	.byte	0x5
	.byte	0x25
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x3
	.uleb128 0x7
	.long	.LASF15
	.byte	0x5
	.byte	0x26
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x3
	.uleb128 0x7
	.long	.LASF16
	.byte	0x5
	.byte	0x27
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.byte	0x3
	.uleb128 0x7
	.long	.LASF17
	.byte	0x5
	.byte	0x28
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x6
	.byte	0x3
	.uleb128 0x7
	.long	.LASF18
	.byte	0x5
	.byte	0x29
	.long	0x5b
	.byte	0x2
	.byte	0x23
	.uleb128 0x7
	.byte	0x3
	.uleb128 0x8
	.byte	0x1
	.string	"rm"
	.byte	0x5
	.byte	0x2c
	.long	.LASF147
	.byte	0x1
	.long	0x125
	.uleb128 0x9
	.long	0x37
	.byte	0x0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF19
	.byte	0x5
	.byte	0x2f
	.long	.LASF25
	.byte	0x1
	.long	0x141
	.uleb128 0x9
	.long	0x37
	.uleb128 0x9
	.long	0x37
	.byte	0x0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF20
	.byte	0x5
	.byte	0x32
	.long	.LASF22
	.long	0x298
	.byte	0x1
	.long	0x15c
	.uleb128 0x9
	.long	0x37
	.byte	0x0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF21
	.byte	0x5
	.byte	0x36
	.long	.LASF23
	.long	0x37
	.byte	0x1
	.long	0x17d
	.uleb128 0xc
	.long	0x29f
	.byte	0x1
	.uleb128 0x9
	.long	0x37
	.byte	0x0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF24
	.byte	0x5
	.byte	0x3b
	.long	.LASF26
	.byte	0x1
	.long	0x1a4
	.uleb128 0xc
	.long	0x29f
	.byte	0x1
	.uleb128 0x9
	.long	0x37
	.uleb128 0x9
	.long	0x37
	.uleb128 0x9
	.long	0x37
	.byte	0x0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF27
	.byte	0x5
	.byte	0x3d
	.long	.LASF28
	.byte	0x1
	.long	0x1bc
	.uleb128 0xc
	.long	0x29f
	.byte	0x1
	.byte	0x0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF29
	.byte	0x5
	.byte	0x42
	.long	.LASF30
	.long	0x5b
	.byte	0x1
	.long	0x1f1
	.uleb128 0xc
	.long	0x29f
	.byte	0x1
	.uleb128 0x9
	.long	0x37
	.uleb128 0x9
	.long	0x37
	.uleb128 0x9
	.long	0x2a5
	.uleb128 0x9
	.long	0x5b
	.uleb128 0x9
	.long	0x37
	.byte	0x0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF31
	.byte	0x5
	.byte	0x44
	.long	.LASF32
	.long	0x37
	.byte	0x1
	.long	0x217
	.uleb128 0xc
	.long	0x29f
	.byte	0x1
	.uleb128 0x9
	.long	0x2a5
	.uleb128 0x9
	.long	0x37
	.byte	0x0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF33
	.byte	0x5
	.byte	0x45
	.long	.LASF34
	.long	0x37
	.byte	0x1
	.long	0x23d
	.uleb128 0xc
	.long	0x29f
	.byte	0x1
	.uleb128 0x9
	.long	0x2a5
	.uleb128 0x9
	.long	0x37
	.byte	0x0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF35
	.byte	0x5
	.byte	0x48
	.long	.LASF36
	.long	0x5b
	.byte	0x1
	.long	0x259
	.uleb128 0xc
	.long	0x29f
	.byte	0x1
	.byte	0x0
	.uleb128 0xb
	.byte	0x1
	.long	.LASF37
	.byte	0x5
	.byte	0x4a
	.long	.LASF38
	.long	0x5b
	.byte	0x1
	.long	0x27f
	.uleb128 0xc
	.long	0x29f
	.byte	0x1
	.uleb128 0x9
	.long	0x2a5
	.uleb128 0x9
	.long	0x5b
	.byte	0x0
	.uleb128 0xd
	.byte	0x1
	.long	.LASF39
	.byte	0x5
	.byte	0x4c
	.long	.LASF40
	.long	0x37
	.byte	0x1
	.uleb128 0xc
	.long	0x29f
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF41
	.uleb128 0xe
	.byte	0x2
	.long	0x9a
	.uleb128 0xe
	.byte	0x2
	.long	0x37
	.uleb128 0xf
	.long	.LASF47
	.byte	0x2
	.byte	0x6
	.byte	0x1d
	.long	0x2fc
	.uleb128 0x10
	.long	.LASF42
	.byte	0x6
	.byte	0x1e
	.long	0x37
	.byte	0x1
	.byte	0x3
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.long	.LASF43
	.byte	0x6
	.byte	0x1f
	.long	0x25
	.byte	0x1
	.byte	0x5
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.long	.LASF44
	.byte	0x6
	.byte	0x20
	.long	0x25
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x10
	.long	.LASF45
	.byte	0x6
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
	.long	.LASF46
	.byte	0x6
	.byte	0x22
	.long	0x2ab
	.uleb128 0xf
	.long	.LASF48
	.byte	0x10
	.byte	0x6
	.byte	0x24
	.long	0x330
	.uleb128 0x11
	.long	.LASF49
	.byte	0x6
	.byte	0x25
	.long	0x330
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x11
	.long	.LASF50
	.byte	0x6
	.byte	0x26
	.long	0x343
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0x12
	.long	0x49
	.long	0x340
	.uleb128 0x13
	.long	0x340
	.byte	0x3
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.uleb128 0x12
	.long	0x2fc
	.long	0x353
	.uleb128 0x13
	.long	0x340
	.byte	0x3
	.byte	0x0
	.uleb128 0x2
	.long	.LASF51
	.byte	0x6
	.byte	0x27
	.long	0x307
	.uleb128 0xf
	.long	.LASF52
	.byte	0x33
	.byte	0x6
	.byte	0x2a
	.long	0x42f
	.uleb128 0x11
	.long	.LASF53
	.byte	0x6
	.byte	0x2b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x11
	.long	.LASF54
	.byte	0x6
	.byte	0x2c
	.long	0x330
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x11
	.long	.LASF55
	.byte	0x6
	.byte	0x2d
	.long	0x330
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0x11
	.long	.LASF56
	.byte	0x6
	.byte	0x2e
	.long	0x330
	.byte	0x2
	.byte	0x23
	.uleb128 0x11
	.uleb128 0x11
	.long	.LASF57
	.byte	0x6
	.byte	0x2f
	.long	0x5b
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0x11
	.long	.LASF58
	.byte	0x6
	.byte	0x30
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1b
	.uleb128 0x11
	.long	.LASF59
	.byte	0x6
	.byte	0x31
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0x11
	.long	.LASF60
	.byte	0x6
	.byte	0x32
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0x11
	.long	.LASF61
	.byte	0x6
	.byte	0x33
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0x11
	.long	.LASF62
	.byte	0x6
	.byte	0x34
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1f
	.uleb128 0x11
	.long	.LASF63
	.byte	0x6
	.byte	0x35
	.long	0x353
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0x11
	.long	.LASF64
	.byte	0x6
	.byte	0x36
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0x11
	.long	.LASF65
	.byte	0x6
	.byte	0x3b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x31
	.uleb128 0x11
	.long	.LASF66
	.byte	0x6
	.byte	0x3c
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x32
	.byte	0x0
	.uleb128 0x2
	.long	.LASF67
	.byte	0x6
	.byte	0x3d
	.long	0x35e
	.uleb128 0xf
	.long	.LASF68
	.byte	0x5
	.byte	0x6
	.byte	0x47
	.long	0x48d
	.uleb128 0x11
	.long	.LASF69
	.byte	0x6
	.byte	0x48
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x11
	.long	.LASF70
	.byte	0x6
	.byte	0x49
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x11
	.long	.LASF71
	.byte	0x6
	.byte	0x4a
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x11
	.long	.LASF72
	.byte	0x6
	.byte	0x4b
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x11
	.long	.LASF73
	.byte	0x6
	.byte	0x4c
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.long	.LASF74
	.byte	0x6
	.byte	0x4d
	.long	0x43a
	.uleb128 0xf
	.long	.LASF75
	.byte	0x3
	.byte	0x6
	.byte	0x4f
	.long	0x4c1
	.uleb128 0x11
	.long	.LASF76
	.byte	0x6
	.byte	0x50
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x11
	.long	.LASF77
	.byte	0x6
	.byte	0x51
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0x0
	.uleb128 0x2
	.long	.LASF78
	.byte	0x6
	.byte	0x52
	.long	0x498
	.uleb128 0xf
	.long	.LASF79
	.byte	0x5
	.byte	0x6
	.byte	0x54
	.long	0x511
	.uleb128 0x14
	.string	"min"
	.byte	0x6
	.byte	0x55
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x14
	.string	"max"
	.byte	0x6
	.byte	0x56
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x11
	.long	.LASF80
	.byte	0x6
	.byte	0x57
	.long	0x298
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x11
	.long	.LASF81
	.byte	0x6
	.byte	0x58
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0x2
	.long	.LASF82
	.byte	0x6
	.byte	0x59
	.long	0x4cc
	.uleb128 0xf
	.long	.LASF83
	.byte	0x6
	.byte	0x6
	.byte	0x5c
	.long	0x5a5
	.uleb128 0x11
	.long	.LASF84
	.byte	0x6
	.byte	0x5d
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x10
	.long	.LASF85
	.byte	0x6
	.byte	0x5e
	.long	0x37
	.byte	0x1
	.byte	0x7
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x10
	.long	.LASF86
	.byte	0x6
	.byte	0x5f
	.long	0x37
	.byte	0x1
	.byte	0x1
	.byte	0x0
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x11
	.long	.LASF87
	.byte	0x6
	.byte	0x60
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x11
	.long	.LASF43
	.byte	0x6
	.byte	0x61
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x11
	.long	.LASF88
	.byte	0x6
	.byte	0x62
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x10
	.long	.LASF89
	.byte	0x6
	.byte	0x63
	.long	0x37
	.byte	0x1
	.byte	0x4
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x10
	.long	.LASF90
	.byte	0x6
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
	.long	.LASF91
	.byte	0x6
	.byte	0x65
	.long	0x51c
	.uleb128 0x15
	.long	.LASF92
	.word	0x18b
	.byte	0x6
	.byte	0x68
	.long	0x6a3
	.uleb128 0x11
	.long	.LASF93
	.byte	0x6
	.byte	0x69
	.long	0x6a3
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x11
	.long	.LASF94
	.byte	0x6
	.byte	0x6a
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0x11
	.long	.LASF95
	.byte	0x6
	.byte	0x6b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0x11
	.long	.LASF96
	.byte	0x6
	.byte	0x6c
	.long	0x5b
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0x11
	.long	.LASF97
	.byte	0x6
	.byte	0x6d
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0x11
	.long	.LASF98
	.byte	0x6
	.byte	0x6e
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xf
	.uleb128 0x14
	.string	"res"
	.byte	0x6
	.byte	0x6f
	.long	0x6ba
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0x11
	.long	.LASF99
	.byte	0x6
	.byte	0x70
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0x11
	.long	.LASF100
	.byte	0x6
	.byte	0x71
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0x11
	.long	.LASF101
	.byte	0x6
	.byte	0x72
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0x11
	.long	.LASF102
	.byte	0x6
	.byte	0x73
	.long	0x6ca
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0x11
	.long	.LASF103
	.byte	0x6
	.byte	0x74
	.long	0x6da
	.byte	0x3
	.byte	0x23
	.uleb128 0xab
	.uleb128 0x11
	.long	.LASF104
	.byte	0x6
	.byte	0x75
	.long	0x6ea
	.byte	0x3
	.byte	0x23
	.uleb128 0xb7
	.uleb128 0x11
	.long	.LASF105
	.byte	0x6
	.byte	0x76
	.long	0x6fa
	.byte	0x3
	.byte	0x23
	.uleb128 0x107
	.uleb128 0x11
	.long	.LASF106
	.byte	0x6
	.byte	0x77
	.long	0x70a
	.byte	0x3
	.byte	0x23
	.uleb128 0x11b
	.uleb128 0x11
	.long	.LASF107
	.byte	0x6
	.byte	0x78
	.long	0x720
	.byte	0x3
	.byte	0x23
	.uleb128 0x143
	.byte	0x0
	.uleb128 0x12
	.long	0x6b3
	.long	0x6b3
	.uleb128 0x13
	.long	0x340
	.byte	0x9
	.byte	0x0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF108
	.uleb128 0x12
	.long	0x6b3
	.long	0x6ca
	.uleb128 0x13
	.long	0x340
	.byte	0x1
	.byte	0x0
	.uleb128 0x12
	.long	0x5a5
	.long	0x6da
	.uleb128 0x13
	.long	0x340
	.byte	0x18
	.byte	0x0
	.uleb128 0x12
	.long	0x4c1
	.long	0x6ea
	.uleb128 0x13
	.long	0x340
	.byte	0x3
	.byte	0x0
	.uleb128 0x12
	.long	0x511
	.long	0x6fa
	.uleb128 0x13
	.long	0x340
	.byte	0xf
	.byte	0x0
	.uleb128 0x12
	.long	0x48d
	.long	0x70a
	.uleb128 0x13
	.long	0x340
	.byte	0x3
	.byte	0x0
	.uleb128 0x12
	.long	0x25
	.long	0x720
	.uleb128 0x13
	.long	0x340
	.byte	0x7
	.uleb128 0x13
	.long	0x340
	.byte	0x4
	.byte	0x0
	.uleb128 0x12
	.long	0x25
	.long	0x736
	.uleb128 0x13
	.long	0x340
	.byte	0x7
	.uleb128 0x13
	.long	0x340
	.byte	0x8
	.byte	0x0
	.uleb128 0x2
	.long	.LASF109
	.byte	0x6
	.byte	0x7c
	.long	0x5b0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF110
	.byte	0x2
	.word	0x14c
	.long	0x54
	.byte	0x3
	.long	0x75e
	.uleb128 0x17
	.string	"a"
	.byte	0x2
	.word	0x14c
	.long	0x54
	.byte	0x0
	.uleb128 0x18
	.long	0x27f
	.byte	0x3
	.long	0x773
	.uleb128 0x19
	.long	.LASF148
	.long	0x773
	.byte	0x1
	.byte	0x0
	.uleb128 0x1a
	.long	0x29f
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF149
	.byte	0x2
	.word	0x1b2
	.byte	0x3
	.long	0x791
	.uleb128 0x17
	.string	"b"
	.byte	0x2
	.word	0x1b2
	.long	0x37
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF116
	.byte	0x1
	.byte	0x6b
	.long	.LASF118
	.long	0x25
	.long	.LFB17
	.long	.LFE17
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x7ed
	.uleb128 0x1d
	.string	"val"
	.byte	0x1
	.byte	0x6b
	.long	0x49
	.long	.LLST1
	.uleb128 0x1e
	.string	"idx"
	.byte	0x1
	.byte	0x6d
	.long	0x37
	.byte	0x1
	.byte	0x64
	.uleb128 0x1f
	.string	"neg"
	.byte	0x1
	.byte	0x6e
	.long	0x298
	.uleb128 0x20
	.long	0x741
	.long	.LBB15
	.long	.LBE15
	.byte	0x1
	.byte	0x6e
	.uleb128 0x21
	.long	0x753
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF111
	.byte	0x1
	.byte	0xb7
	.long	.LASF113
	.long	.LFB21
	.long	.LFE21
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x818
	.uleb128 0x1d
	.string	"msk"
	.byte	0x1
	.byte	0xb7
	.long	0x37
	.long	.LLST3
	.byte	0x0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF112
	.byte	0x1
	.byte	0xbe
	.long	.LASF114
	.long	.LFB22
	.long	.LFE22
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x883
	.uleb128 0x23
	.long	.LASF115
	.byte	0x1
	.byte	0xbe
	.long	0x298
	.long	.LLST5
	.uleb128 0x24
	.string	"msk"
	.byte	0x1
	.byte	0xc0
	.long	0x37
	.long	.LLST6
	.uleb128 0x25
	.long	0x778
	.long	.LBB18
	.long	.LBE18
	.byte	0x1
	.byte	0xe7
	.uleb128 0x1e
	.string	"__c"
	.byte	0x1
	.byte	0xd1
	.long	0xb6a
	.byte	0x5
	.byte	0x3
	.long	_ZZ7eeCheckbE3__c
	.uleb128 0x1e
	.string	"__c"
	.byte	0x1
	.byte	0xe3
	.long	0xb6f
	.byte	0x5
	.byte	0x3
	.long	_ZZ7eeCheckbE3__c_0
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF117
	.byte	0x1
	.byte	0x85
	.long	.LASF119
	.long	0x298
	.long	.LFB19
	.long	.LFE19
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x8d9
	.uleb128 0x1d
	.string	"id"
	.byte	0x1
	.byte	0x85
	.long	0x37
	.long	.LLST8
	.uleb128 0x24
	.string	"i"
	.byte	0x1
	.byte	0x87
	.long	0x37
	.long	.LLST9
	.uleb128 0x1e
	.string	"buf"
	.byte	0x1
	.byte	0x90
	.long	0x8d9
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.uleb128 0x24
	.string	"l"
	.byte	0x1
	.byte	0x91
	.long	0x37
	.long	.LLST10
	.byte	0x0
	.uleb128 0x12
	.long	0x37
	.long	0x8e9
	.uleb128 0x13
	.long	0x340
	.byte	0xe
	.byte	0x0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF120
	.byte	0x1
	.byte	0x2f
	.long	.LASF121
	.long	0x298
	.long	.LFB14
	.long	.LFE14
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x935
	.uleb128 0x1f
	.string	"sz"
	.byte	0x1
	.byte	0x32
	.long	0x37
	.uleb128 0x24
	.string	"sum"
	.byte	0x1
	.byte	0x33
	.long	0x5b
	.long	.LLST12
	.uleb128 0x26
	.long	.LBB22
	.long	.LBE22
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.byte	0x35
	.long	0x54
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF122
	.byte	0x1
	.byte	0x1f
	.long	.LASF123
	.long	.LFB13
	.long	.LFE13
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x96f
	.uleb128 0x1f
	.string	"sum"
	.byte	0x1
	.byte	0x27
	.long	0x49
	.uleb128 0x26
	.long	.LBB24
	.long	.LBE24
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.byte	0x28
	.long	0x54
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF124
	.byte	0x1
	.byte	0x5c
	.long	.LASF125
	.long	.LFB16
	.long	.LFE16
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x9d2
	.uleb128 0x1d
	.string	"id"
	.byte	0x1
	.byte	0x5c
	.long	0x37
	.long	.LLST15
	.uleb128 0x1d
	.string	"buf"
	.byte	0x1
	.byte	0x5c
	.long	0x9d2
	.long	.LLST16
	.uleb128 0x1d
	.string	"len"
	.byte	0x1
	.byte	0x5c
	.long	0x37
	.long	.LLST17
	.uleb128 0x26
	.long	.LBB26
	.long	.LBE26
	.uleb128 0x1e
	.string	"sz"
	.byte	0x1
	.byte	0x65
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
	.uleb128 0xe
	.byte	0x2
	.long	0x6b3
	.uleb128 0x22
	.byte	0x1
	.long	.LASF126
	.byte	0x1
	.byte	0x3b
	.long	.LASF127
	.long	.LFB15
	.long	.LFE15
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xa47
	.uleb128 0x1d
	.string	"id"
	.byte	0x1
	.byte	0x3b
	.long	0x37
	.long	.LLST19
	.uleb128 0x23
	.long	.LASF128
	.byte	0x1
	.byte	0x3b
	.long	0x298
	.long	.LLST20
	.uleb128 0x27
	.long	.LASF129
	.byte	0x1
	.byte	0x3d
	.long	0x6a3
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.uleb128 0x28
	.long	.LBB28
	.long	.LBE28
	.long	0xa35
	.uleb128 0x1f
	.string	"i"
	.byte	0x1
	.byte	0x49
	.long	0x37
	.byte	0x0
	.uleb128 0x1e
	.string	"__c"
	.byte	0x1
	.byte	0x44
	.long	0xb11
	.byte	0x5
	.byte	0x3
	.long	_ZZ12modelDefaulthbE3__c
	.byte	0x0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF130
	.byte	0x1
	.byte	0x77
	.long	.LASF131
	.long	.LFB18
	.long	.LFE18
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xa9a
	.uleb128 0x1d
	.string	"id"
	.byte	0x1
	.byte	0x77
	.long	0x37
	.long	.LLST22
	.uleb128 0x28
	.long	.LBB30
	.long	.LBE30
	.long	0xa88
	.uleb128 0x1f
	.string	"sz"
	.byte	0x1
	.byte	0x7c
	.long	0x5b
	.byte	0x0
	.uleb128 0x1e
	.string	"__c"
	.byte	0x1
	.byte	0x7f
	.long	0xb26
	.byte	0x5
	.byte	0x3
	.long	_ZZ11eeLoadModelhE3__c
	.byte	0x0
	.uleb128 0x22
	.byte	0x1
	.long	.LASF132
	.byte	0x1
	.byte	0x9b
	.long	.LASF133
	.long	.LFB20
	.long	.LFE20
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xb01
	.uleb128 0x28
	.long	.LBB32
	.long	.LBE32
	.long	0xacd
	.uleb128 0x1f
	.string	"sz"
	.byte	0x1
	.byte	0xa8
	.long	0x5b
	.byte	0x0
	.uleb128 0x1e
	.string	"__c"
	.byte	0x1
	.byte	0xa2
	.long	0xb3b
	.byte	0x5
	.byte	0x3
	.long	_ZZ9eeReadAllvE3__c
	.uleb128 0x1e
	.string	"__c"
	.byte	0x1
	.byte	0xa9
	.long	0xb50
	.byte	0x5
	.byte	0x3
	.long	_ZZ9eeReadAllvE3__c_0
	.uleb128 0x1e
	.string	"__c"
	.byte	0x1
	.byte	0xae
	.long	0xb65
	.byte	0x5
	.byte	0x3
	.long	_ZZ9eeReadAllvE3__c_1
	.byte	0x0
	.uleb128 0x12
	.long	0x89
	.long	0xb11
	.uleb128 0x13
	.long	0x340
	.byte	0xa
	.byte	0x0
	.uleb128 0x1a
	.long	0xb01
	.uleb128 0x12
	.long	0x89
	.long	0xb26
	.uleb128 0x13
	.long	0x340
	.byte	0x1a
	.byte	0x0
	.uleb128 0x1a
	.long	0xb16
	.uleb128 0x12
	.long	0x89
	.long	0xb3b
	.uleb128 0x13
	.long	0x340
	.byte	0xf
	.byte	0x0
	.uleb128 0x1a
	.long	0xb2b
	.uleb128 0x12
	.long	0x89
	.long	0xb50
	.uleb128 0x13
	.long	0x340
	.byte	0xe
	.byte	0x0
	.uleb128 0x1a
	.long	0xb40
	.uleb128 0x12
	.long	0x89
	.long	0xb65
	.uleb128 0x13
	.long	0x340
	.byte	0xb
	.byte	0x0
	.uleb128 0x1a
	.long	0xb55
	.uleb128 0x1a
	.long	0xb2b
	.uleb128 0x1a
	.long	0xb2b
	.uleb128 0x29
	.long	.LASF134
	.byte	0x2
	.word	0x1a0
	.long	0xb82
	.byte	0x1
	.byte	0x1
	.uleb128 0x2a
	.long	0x5b
	.uleb128 0x29
	.long	.LASF135
	.byte	0x2
	.word	0x1a2
	.long	0x37
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.long	0x37
	.long	0xba5
	.uleb128 0x13
	.long	0x340
	.byte	0x3
	.byte	0x0
	.uleb128 0x29
	.long	.LASF136
	.byte	0x2
	.word	0x1a3
	.long	0xb95
	.byte	0x1
	.byte	0x1
	.uleb128 0x2b
	.long	.LASF137
	.byte	0x6
	.byte	0x82
	.long	0x42f
	.byte	0x1
	.byte	0x1
	.uleb128 0x2b
	.long	.LASF138
	.byte	0x6
	.byte	0x83
	.long	0x736
	.byte	0x1
	.byte	0x1
	.uleb128 0x2c
	.long	.LASF139
	.byte	0x1
	.byte	0x14
	.long	0x9a
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	theFile
	.uleb128 0x2c
	.long	.LASF140
	.byte	0x1
	.byte	0x15
	.long	0x9a
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	theFile2
	.uleb128 0x27
	.long	.LASF141
	.byte	0x1
	.byte	0xb5
	.long	0x37
	.byte	0x5
	.byte	0x3
	.long	_ZL12s_eeDirtyMsk
	.uleb128 0x27
	.long	.LASF142
	.byte	0x1
	.byte	0xb6
	.long	0x5b
	.byte	0x5
	.byte	0x3
	.long	_ZL17s_eeDirtyTime10ms
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
	.uleb128 0x2
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
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
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
	.uleb128 0x9
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xa
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xe
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0xf
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
	.uleb128 0x10
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
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x13
	.uleb128 0x21
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x49
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
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
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
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x22
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
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x29
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
	.uleb128 0x2a
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
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
	.uleb128 0x2c
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
	.byte	0x0
	.section	.debug_pubnames,"",@progbits
	.long	0xcb
	.word	0x2
	.long	.Ldebug_info0
	.long	0xc14
	.long	0x791
	.string	"trimRevert"
	.long	0x7ed
	.string	"eeDirty"
	.long	0x818
	.string	"eeCheck"
	.long	0x883
	.string	"eeDuplicateModel"
	.long	0x8e9
	.string	"eeLoadGeneral"
	.long	0x935
	.string	"generalDefault"
	.long	0x96f
	.string	"eeLoadModelName"
	.long	0x9d8
	.string	"modelDefault"
	.long	0xa47
	.string	"eeLoadModel"
	.long	0xa9a
	.string	"eeReadAll"
	.long	0xbcd
	.string	"theFile"
	.long	0xbdf
	.string	"theFile2"
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
	.string	"pers.cpp"
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
	.string	"file.h"
	.uleb128 0x1
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
	.byte	0x7e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM2
	.byte	0x4
	.uleb128 0x2
	.byte	0xf5
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM3
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -220
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM4
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM5
	.byte	0x12
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM6
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM7
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM8
	.byte	0x57
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
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM13
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM14
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM15
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM16
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM17
	.byte	0x17
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
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM21
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM22
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM23
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM24
	.byte	0x16
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
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM28
	.byte	0x4
	.uleb128 0x2
	.byte	0xe4
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM29
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -240
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM30
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM31
	.byte	0x38
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM32
	.byte	0x3
	.sleb128 -99
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM33
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM34
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM35
	.byte	0x12
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM36
	.byte	0x18
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
	.byte	0x17
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
	.byte	0x11
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM43
	.byte	0x19
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
	.sleb128 -107
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM46
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM47
	.byte	0x15
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
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM52
	.byte	0x3
	.sleb128 -26
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM53
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM54
	.byte	0x15
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
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM60
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM61
	.byte	0x13
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
	.byte	0x11
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM65
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM66
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM67
	.byte	0x42
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM68
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM69
	.byte	0x17
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
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM73
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM74
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM75
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM76
	.byte	0x3
	.sleb128 -47
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM77
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM78
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM79
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM80
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM81
	.byte	0x21
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM82
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM83
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM84
	.byte	0x12
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM85
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM86
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM87
	.byte	0x12
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
	.byte	0x12
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM91
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM92
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM93
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM94
	.byte	0x3
	.sleb128 -15
	.byte	0x1
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
	.byte	0x21
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM99
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM100
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM101
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM102
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM103
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM104
	.byte	0x30
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM105
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM106
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM107
	.byte	0x15
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
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM112
	.byte	0x2c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM113
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM114
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM115
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM116
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM117
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM118
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM119
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM120
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM121
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM122
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM123
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
.LASF120:
	.string	"eeLoadGeneral"
.LASF71:
	.string	"drSw"
.LASF111:
	.string	"eeDirty"
.LASF48:
	.string	"t_TrainerData"
.LASF66:
	.string	"stickMode"
.LASF89:
	.string	"speedUp"
.LASF52:
	.string	"t_EEGeneral"
.LASF94:
	.string	"mdVers"
.LASF114:
	.string	"_Z7eeCheckb"
.LASF37:
	.string	"readRlc"
.LASF118:
	.string	"_Z10trimReverti"
.LASF121:
	.string	"_Z13eeLoadGeneralv"
.LASF15:
	.string	"m_ofs"
.LASF74:
	.string	"ExpoData"
.LASF13:
	.string	"m_pos"
.LASF10:
	.string	"long long unsigned int"
.LASF99:
	.string	"thrTrim"
.LASF122:
	.string	"generalDefault"
.LASF143:
	.string	"GNU C++ 4.3.4"
.LASF4:
	.string	"int16_t"
.LASF9:
	.string	"long long int"
.LASF2:
	.string	"signed char"
.LASF25:
	.string	"_ZN5EFile4swapEhh"
.LASF30:
	.string	"_ZN5EFile8writeRlcEhhPhjh"
.LASF135:
	.string	"g_beepCnt"
.LASF16:
	.string	"m_bRlc"
.LASF40:
	.string	"_ZN5EFile5errnoEv"
.LASF34:
	.string	"_ZN5EFile5writeEPhh"
.LASF54:
	.string	"calibMid"
.LASF67:
	.string	"EEGeneral"
.LASF26:
	.string	"_ZN5EFile6createEhhh"
.LASF112:
	.string	"eeCheck"
.LASF12:
	.string	"m_fileId"
.LASF78:
	.string	"TrimData"
.LASF7:
	.string	"long int"
.LASF129:
	.string	"orig_name"
.LASF53:
	.string	"myVers"
.LASF50:
	.string	"chanMix"
.LASF5:
	.string	"uint16_t"
.LASF32:
	.string	"_ZN5EFile4readEPhh"
.LASF29:
	.string	"writeRlc"
.LASF148:
	.string	"this"
.LASF68:
	.string	"t_ExpoData"
.LASF123:
	.string	"_Z14generalDefaultv"
.LASF119:
	.string	"_Z16eeDuplicateModelh"
.LASF96:
	.string	"tmrVal"
.LASF137:
	.string	"g_eeGeneral"
.LASF6:
	.string	"unsigned int"
.LASF64:
	.string	"view"
.LASF80:
	.string	"revert"
.LASF126:
	.string	"modelDefault"
.LASF8:
	.string	"long unsigned int"
.LASF93:
	.string	"name"
.LASF90:
	.string	"speedDown"
.LASF35:
	.string	"size"
.LASF125:
	.string	"_Z15eeLoadModelNamehPch"
.LASF128:
	.string	"keep_name"
.LASF103:
	.string	"trimData"
.LASF76:
	.string	"trim"
.LASF132:
	.string	"eeReadAll"
.LASF41:
	.string	"bool"
.LASF63:
	.string	"trainer"
.LASF22:
	.string	"_ZN5EFile6existsEh"
.LASF105:
	.string	"expoData"
.LASF113:
	.string	"_Z7eeDirtyh"
.LASF39:
	.string	"errno"
.LASF17:
	.string	"m_err"
.LASF28:
	.string	"_ZN5EFile10closeTruncEv"
.LASF49:
	.string	"calib"
.LASF33:
	.string	"write"
.LASF38:
	.string	"_ZN5EFile7readRlcEPhj"
.LASF139:
	.string	"theFile"
.LASF65:
	.string	"warnOpts"
.LASF72:
	.string	"expNormWeight"
.LASF104:
	.string	"limitData"
.LASF84:
	.string	"destCh"
.LASF138:
	.string	"g_model"
.LASF146:
	.string	"EFile"
.LASF140:
	.string	"theFile2"
.LASF42:
	.string	"srcChn"
.LASF127:
	.string	"_Z12modelDefaulthb"
.LASF98:
	.string	"ppmNCH"
.LASF21:
	.string	"openRd"
.LASF19:
	.string	"swap"
.LASF91:
	.string	"MixData"
.LASF77:
	.string	"trimDef"
.LASF149:
	.string	"_beep"
.LASF79:
	.string	"t_LimitData"
.LASF73:
	.string	"expSwWeight"
.LASF109:
	.string	"ModelData"
.LASF44:
	.string	"studWeight"
.LASF124:
	.string	"eeLoadModelName"
.LASF97:
	.string	"protocol"
.LASF18:
	.string	"m_stopTime10ms"
.LASF70:
	.string	"expDr"
.LASF3:
	.string	"unsigned char"
.LASF20:
	.string	"exists"
.LASF130:
	.string	"eeLoadModel"
.LASF131:
	.string	"_Z11eeLoadModelh"
.LASF55:
	.string	"calibSpanNeg"
.LASF102:
	.string	"mixData"
.LASF95:
	.string	"tmrMode"
.LASF106:
	.string	"curves5"
.LASF107:
	.string	"curves9"
.LASF58:
	.string	"currModel"
.LASF69:
	.string	"expNorm"
.LASF60:
	.string	"vBatWarn"
.LASF134:
	.string	"g_tmr10ms"
.LASF57:
	.string	"chkSum"
.LASF82:
	.string	"LimitData"
.LASF108:
	.string	"char"
.LASF86:
	.string	"carryTrim"
.LASF45:
	.string	"mode"
.LASF62:
	.string	"lightSw"
.LASF141:
	.string	"s_eeDirtyMsk"
.LASF115:
	.string	"immediately"
.LASF117:
	.string	"eeDuplicateModel"
.LASF81:
	.string	"offset"
.LASF43:
	.string	"swtch"
.LASF23:
	.string	"_ZN5EFile6openRdEh"
.LASF11:
	.string	"prog_char"
.LASF133:
	.string	"_Z9eeReadAllv"
.LASF0:
	.string	"int8_t"
.LASF87:
	.string	"weight"
.LASF142:
	.string	"s_eeDirtyTime10ms"
.LASF110:
	.string	"abs<int>"
.LASF14:
	.string	"m_currBlk"
.LASF59:
	.string	"contrast"
.LASF145:
	.string	"/home/erez/Desktop/er9x/er9x/OBJS"
.LASF83:
	.string	"t_MixData"
.LASF51:
	.string	"TrainerData"
.LASF100:
	.string	"trimInc"
.LASF1:
	.string	"uint8_t"
.LASF88:
	.string	"curve"
.LASF36:
	.string	"_ZN5EFile4sizeEv"
.LASF85:
	.string	"srcRaw"
.LASF47:
	.string	"t_TrainerData1"
.LASF31:
	.string	"read"
.LASF116:
	.string	"trimRevert"
.LASF56:
	.string	"calibSpanPos"
.LASF101:
	.string	"tcutSW"
.LASF147:
	.string	"_ZN5EFile2rmEh"
.LASF61:
	.string	"vBatCalib"
.LASF46:
	.string	"TrainerData1"
.LASF144:
	.string	"../src/pers.cpp"
.LASF27:
	.string	"closeTrunc"
.LASF136:
	.string	"g_beepVal"
.LASF92:
	.string	"t_ModelData"
.LASF24:
	.string	"create"
.LASF75:
	.string	"t_TrimData"

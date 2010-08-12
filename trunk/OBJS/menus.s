	.file	"menus.cpp"
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
.global	_Z5expoujj
	.type	_Z5expoujj, @function
_Z5expoujj:
.LFB23:
.LM1:
.LVL0:
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
	push r17
/* prologue: function */
/* frame size = 0 */
	movw r6,r22
.LM2:
	movw r14,r24
	ldi r16,lo8(0)
	ldi r17,hi8(0)
	clr r8
	clr r9
	ldi r22,lo8(100)
	ldi r23,hi8(100)
	ldi r24,hlo8(100)
	ldi r25,hhi8(100)
.LVL1:
	sub r22,r6
	sbc r23,r7
	sbc r24,r8
	sbc r25,r9
.LVL2:
	movw r20,r16
	movw r18,r14
	call __mulsi3
	movw r10,r22
	movw r12,r24
	ldi r24,lo8(50)
	ldi r25,hi8(50)
	ldi r26,hlo8(50)
	ldi r27,hhi8(50)
.LVL3:
	add r10,r24
	adc r11,r25
	adc r12,r26
	adc r13,r27
	movw r24,r16
	movw r22,r14
	call __mulsi3
	call __mulsi3
	movw r22,r24
	clr r24
	clr r25
	movw r20,r8
	movw r18,r6
	call __mulsi3
	ldi r18,2
1:	lsr r25
	ror r24
	ror r23
	ror r22
	dec r18
	brne 1b
	add r10,r22
	adc r11,r23
	adc r12,r24
	adc r13,r25
	movw r24,r12
	movw r22,r10
	ldi r18,lo8(100)
	ldi r19,hi8(100)
	ldi r20,hlo8(100)
	ldi r21,hhi8(100)
	call __udivmodsi4
	movw r24,r18
/* epilogue start */
.LM3:
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	ret
.LFE23:
	.size	_Z5expoujj, .-_Z5expoujj
.global	_Z4expoii
	.type	_Z4expoii, @function
_Z4expoii:
.LFB24:
.LM4:
.LVL4:
	push r15
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
	movw r18,r24
	movw r20,r22
.LBB331:
.LM5:
	cp r22,__zero_reg__
	cpc r23,__zero_reg__
	breq .L4
.LVL5:
.LM6:
	clr r15
.LVL6:
	sbrs r25,7
	rjmp .L6
.LVL7:
	clr r15
	inc r15
.LM7:
	com r19
	neg r18
	sbci r19,lo8(-1)
.LVL8:
.L6:
.LM8:
	sbrs r21,7
	rjmp .L7
.LVL9:
.LM9:
	ldi r16,lo8(512)
	ldi r17,hi8(512)
	clr r22
	clr r23
	sub r22,r20
	sbc r23,r21
	movw r24,r16
	sub r24,r18
	sbc r25,r19
	call _Z5expoujj
.LVL10:
	movw r18,r16
	sub r18,r24
	sbc r19,r25
	movw r24,r18
.LVL11:
	rjmp .L8
.LVL12:
.L7:
.LM10:
	movw r24,r18
	movw r22,r20
	call _Z5expoujj
.LVL13:
.LVL14:
.L8:
.LM11:
	tst r15
	brne .L9
	movw r18,r24
.LVL15:
	rjmp .L4
.LVL16:
.L9:
	clr r18
	clr r19
	sub r18,r24
	sbc r19,r25
.LVL17:
.L4:
.LBE331:
.LM12:
	movw r24,r18
.LVL18:
/* epilogue start */
	pop r17
	pop r16
	pop r15
.LVL19:
	ret
.LFE24:
	.size	_Z4expoii, .-_Z4expoii
.global	_Z8char2idxc
	.type	_Z8char2idxc, @function
_Z8char2idxc:
.LFB28:
.LM13:
.LVL20:
/* prologue: function */
/* frame size = 0 */
	mov r18,r24
.LM14:
	ldi r30,lo8(_ZL9s_charTab)
	ldi r31,hi8(_ZL9s_charTab)
	ldi r24,lo8(0)
.LVL21:
.L15:
.LBB332:
.LBB333:
.LBB334:
.LM15:
/* #APP */
 ;  873 "../src/menus.cpp" 1
	lpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE334:
.LM16:
	cp r25,r18
	breq .L13
	adiw r30,1
.LM17:
	tst r25
	breq .L14
.LBE333:
.LM18:
	subi r24,lo8(-(1))
	rjmp .L15
.L14:
	ldi r24,lo8(0)
.LVL22:
.L13:
.LVL23:
.LBE332:
.LM19:
	ret
.LFE28:
	.size	_Z8char2idxc, .-_Z8char2idxc
.global	_Z8idx2charh
	.type	_Z8idx2charh, @function
_Z8idx2charh:
.LFB29:
.LM20:
.LVL24:
/* prologue: function */
/* frame size = 0 */
.LBB335:
.LM21:
	cpi r24,lo8(40)
	brlo .L18
	ldi r24,lo8(32)
.LVL25:
	ret
.LVL26:
.L18:
.LBB336:
	mov r30,r24
	ldi r31,lo8(0)
.LVL27:
	subi r30,lo8(-(_ZL9s_charTab))
	sbci r31,hi8(-(_ZL9s_charTab))
.LVL28:
/* #APP */
 ;  880 "../src/menus.cpp" 1
	lpm r24, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE336:
.LBE335:
.LM22:
	ret
.LFE29:
	.size	_Z8idx2charh, .-_Z8idx2charh
.global	_Z5timerh
	.type	_Z5timerh, @function
_Z5timerh:
.LFB39:
.LM23:
.LVL29:
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
.LBB337:
.LM24:
	lds r28,_ZZ5timerhE5s_cnt
	lds r29,(_ZZ5timerhE5s_cnt)+1
	adiw r28,1
	sts (_ZZ5timerhE5s_cnt)+1,r29
	sts _ZZ5timerhE5s_cnt,r28
.LM25:
	lds r30,_ZZ5timerhE5s_sum
	lds r31,(_ZZ5timerhE5s_sum)+1
	add r30,r24
	adc r31,__zero_reg__
	sts (_ZZ5timerhE5s_sum)+1,r31
	sts _ZZ5timerhE5s_sum,r30
.LM26:
	lds r24,g_tmr10ms
	lds r25,(g_tmr10ms)+1
.LVL30:
	lds r18,_ZZ5timerhE6s_time
	lds r19,(_ZZ5timerhE6s_time)+1
	sub r24,r18
	sbc r25,r19
	cpi r24,100
	cpc r25,__zero_reg__
	brsh .+2
	rjmp .L34
.LM27:
	subi r18,lo8(-(100))
	sbci r19,hi8(-(100))
	sts (_ZZ5timerhE6s_time)+1,r19
	sts _ZZ5timerhE6s_time,r18
.LM28:
	movw r24,r30
	movw r22,r28
	call __udivmodhi4
.LM29:
	mov r24,r22
.LVL31:
	ldi r25,lo8(0)
.LVL32:
	movw r18,r24
	mul r18,r28
	movw r24,r0
	mul r18,r29
	add r25,r0
	mul r19,r28
	add r25,r0
	clr r1
	sub r30,r24
	sbc r31,r25
	sts (_ZZ5timerhE5s_sum)+1,r31
	sts _ZZ5timerhE5s_sum,r30
.LM30:
	sts (_ZZ5timerhE5s_cnt)+1,__zero_reg__
	sts _ZZ5timerhE5s_cnt,__zero_reg__
.LM31:
	lds r24,s_timeCumTot
	lds r25,(s_timeCumTot)+1
	adiw r24,1
	sts (s_timeCumTot)+1,r25
	sts s_timeCumTot,r24
.LM32:
	lds r18,s_timeCumAbs
	lds r19,(s_timeCumAbs)+1
	subi r18,lo8(-(1))
	sbci r19,hi8(-(1))
	sts (s_timeCumAbs)+1,r19
	sts s_timeCumAbs,r18
.LM33:
	tst r22
	breq .L23
	lds r24,s_timeCumThr
	lds r25,(s_timeCumThr)+1
	adiw r24,1
	sts (s_timeCumThr)+1,r25
	sts s_timeCumThr,r24
.L23:
.LM34:
	lsr r22
	lds r24,s_timeCum16ThrP
	lds r25,(s_timeCum16ThrP)+1
	add r24,r22
	adc r25,__zero_reg__
	sts (s_timeCum16ThrP)+1,r25
	sts s_timeCum16ThrP,r24
.LM35:
	lds r20,g_model+12
	lds r21,(g_model+12)+1
	sts (s_timerVal)+1,r21
	sts s_timerVal,r20
.LM36:
	lds r22,g_model+11
.LVL33:
	cpi r22,lo8(1)
	breq .L26
	cpi r22,lo8(1)
	brlo .L25
	cpi r22,lo8(2)
	breq .L27
	cpi r22,lo8(3)
	brne .L24
	rjmp .L39
.L25:
.LM37:
	sts s_timerState,__zero_reg__
	rjmp .L34
.L39:
.LM38:
	ldi r23,4
1:	lsr r25
	ror r24
	dec r23
	brne 1b
	rjmp .L38
.L27:
.LM39:
	lds r24,s_timeCumThr
	lds r25,(s_timeCumThr)+1
.L38:
	movw r18,r20
	sub r18,r24
	sbc r19,r25
	movw r24,r18
	rjmp .L35
.L26:
.LM40:
	movw r24,r20
	sub r24,r18
	sbc r25,r19
.L35:
	sts (s_timerVal)+1,r25
	sts s_timerVal,r24
.L24:
.LM41:
	lds r24,s_timerState
	cpi r24,lo8(1)
	breq .L31
	cpi r24,lo8(1)
	brlo .L30
	cpi r24,lo8(2)
	brne .L29
	rjmp .L40
.L30:
.LM42:
	tst r22
	breq .L29
	rjmp .L36
.L31:
.LM43:
	lds r24,s_timerVal
	lds r25,(s_timerVal)+1
	cp __zero_reg__,r24
	cpc __zero_reg__,r25
	brlt .L29
	or r20,r21
	breq .L29
	ldi r24,lo8(2)
	rjmp .L37
.L40:
.LM44:
	lds r24,s_timerVal
	lds r25,(s_timerVal)+1
	subi r24,lo8(-59)
	sbci r25,hi8(-59)
	brge .L33
	ldi r24,lo8(3)
	sts s_timerState,r24
.L33:
.LM45:
	or r20,r21
	brne .L29
.L36:
	ldi r24,lo8(1)
.L37:
	sts s_timerState,r24
.L29:
.LM46:
	lds r24,s_timerState
	cpi r24,lo8(2)
	brne .L34
.LBB338:
.LM47:
	lds r18,s_timerVal
	lds r19,(s_timerVal)+1
	lds r24,_ZZ5timerhE8last_tmr
	lds r25,(_ZZ5timerhE8last_tmr)+1
	cp r24,r18
	cpc r25,r19
	breq .L34
.LM48:
	sts (_ZZ5timerhE8last_tmr)+1,r19
	sts _ZZ5timerhE8last_tmr,r18
.LBB339:
.LBB340:
.LM49:
	lds r24,g_beepVal+1
	sts g_beepCnt,r24
.L34:
/* epilogue start */
.LBE340:
.LBE339:
.LBE338:
.LBE337:
.LM50:
	pop r29
	pop r28
	ret
.LFE39:
	.size	_Z5timerh, .-_Z5timerh
.global	_Z5traceh
	.type	_Z5traceh, @function
_Z5traceh:
.LFB40:
.LM51:
.LVL34:
	push r17
/* prologue: function */
/* frame size = 0 */
	mov r17,r24
.LBB341:
.LM52:
	call _Z5timerh
.LVL35:
.LM53:
	lds r22,_ZZ5tracehE5s_cnt
	lds r23,(_ZZ5tracehE5s_cnt)+1
	subi r22,lo8(-(1))
	sbci r23,hi8(-(1))
	sts (_ZZ5tracehE5s_cnt)+1,r23
	sts _ZZ5tracehE5s_cnt,r22
.LM54:
	lds r20,_ZZ5tracehE5s_sum
	lds r21,(_ZZ5tracehE5s_sum)+1
	add r20,r17
	adc r21,__zero_reg__
	sts (_ZZ5tracehE5s_sum)+1,r21
	sts _ZZ5tracehE5s_sum,r20
.LM55:
	lds r24,g_tmr10ms
	lds r25,(g_tmr10ms)+1
	lds r18,_ZZ5tracehE6s_time
	lds r19,(_ZZ5tracehE6s_time)+1
	sub r24,r18
	sbc r25,r19
	subi r24,lo8(1000)
	sbci r25,hi8(1000)
	brlo .L43
.LM56:
	lds r24,g_tmr10ms
	lds r25,(g_tmr10ms)+1
	sts (_ZZ5tracehE6s_time)+1,r25
	sts _ZZ5tracehE6s_time,r24
.LM57:
	sts (_ZZ5tracehE5s_sum)+1,__zero_reg__
	sts _ZZ5tracehE5s_sum,__zero_reg__
.LM58:
	sts (_ZZ5tracehE5s_cnt)+1,__zero_reg__
	sts _ZZ5tracehE5s_cnt,__zero_reg__
.LM59:
	lds r24,s_traceCnt
	lds r25,(s_traceCnt)+1
	adiw r24,1
	sts (s_traceCnt)+1,r25
	sts s_traceCnt,r24
.LM60:
	lds r18,s_traceWr
	lds r19,(s_traceWr)+1
	movw r30,r18
	subi r30,lo8(-(s_traceBuf))
	sbci r31,hi8(-(s_traceBuf))
	movw r24,r20
	call __udivmodhi4
	st Z,r22
	subi r18,lo8(-(1))
	sbci r19,hi8(-(1))
	sts (s_traceWr)+1,r19
	sts s_traceWr,r18
.LM61:
	cpi r18,120
	cpc r19,__zero_reg__
	brlo .L43
	sts (s_traceWr)+1,__zero_reg__
	sts s_traceWr,__zero_reg__
.L43:
/* epilogue start */
.LBE341:
.LM62:
	pop r17
.LVL36:
	ret
.LFE40:
	.size	_Z5traceh, .-_Z5traceh
.global	_Z14calcLimitCachev
	.type	_Z14calcLimitCachev, @function
_Z14calcLimitCachev:
.LFB44:
.LM63:
/* prologue: function */
/* frame size = 0 */
.LBB342:
.LM64:
	lds r24,_ZL14s_limitCacheOk
	tst r24
	brne .L47
.LM65:
	ldi r24,lo8(1)
	sts _ZL14s_limitCacheOk,r24
	ldi r26,lo8(g_model+183)
	ldi r27,hi8(g_model+183)
	ldi r18,lo8(0)
	ldi r19,hi8(0)
.L46:
.LBB343:
.LBB344:
.LM66:
	movw r30,r18
	subi r30,lo8(-(_ZL16s_cacheLimitsMin))
	sbci r31,hi8(-(_ZL16s_cacheLimitsMin))
	ld r24,X
	clr r25
	sbrc r24,7
	com r25
	subi r24,lo8(-(-100))
	sbci r25,hi8(-(-100))
	std Z+1,r25
	st Z,r24
.LM67:
	movw r30,r18
	subi r30,lo8(-(_ZL16s_cacheLimitsMax))
	sbci r31,hi8(-(_ZL16s_cacheLimitsMax))
	adiw r26,1
	ld r24,X
	sbiw r26,1
	clr r25
	sbrc r24,7
	com r25
	subi r24,lo8(-(100))
	sbci r25,hi8(-(100))
	std Z+1,r25
	st Z,r24
	adiw r26,5
	subi r18,lo8(-(2))
	sbci r19,hi8(-(2))
.LBE344:
.LM68:
	ldi r24,hi8(g_model+263)
	cpi r26,lo8(g_model+263)
	cpc r27,r24
	brne .L46
.L47:
	ret
.LBE343:
.LBE342:
.LFE44:
	.size	_Z14calcLimitCachev, .-_Z14calcLimitCachev
.global	_Z6intpolih
	.type	_Z6intpolih, @function
_Z6intpolih:
.LFB45:
.LM69:
.LVL37:
/* prologue: function */
/* frame size = 0 */
	movw r20,r24
.LBB345:
.LM70:
	ldi r18,lo8(0)
.LVL38:
	cpi r22,lo8(8)
	brlo .L50
.LVL39:
	ldi r18,lo8(1)
.L50:
	ldi r23,lo8(0)
.LM71:
	tst r18
	breq .L51
	movw r24,r22
.LVL40:
	sbiw r24,8
	movw r30,r24
	ldi r27,3
1:	lsl r30
	rol r31
	dec r27
	brne 1b
	add r30,r24
	adc r31,r25
	movw r26,r30
.LVL41:
	subi r26,lo8(-(g_model+323))
	sbci r27,hi8(-(g_model+323))
	rjmp .L61
.LVL42:
.L51:
	movw r30,r22
.LVL43:
	lsl r30
	rol r31
	lsl r30
	rol r31
	add r30,r22
	adc r31,r23
	movw r26,r30
.LVL44:
	subi r26,lo8(-(g_model+283))
	sbci r27,hi8(-(g_model+283))
.L61:
	movw r30,r26
	ld r30,Z
.LM72:
	movw r24,r20
	subi r24,lo8(-(512))
	sbci r25,hi8(-(512))
.LM73:
	sbrs r25,7
	rjmp .L53
.LM74:
	mov r24,r30
	clr r25
	sbrc r24,7
	com r25
	rjmp .L62
.L53:
.LM75:
	ldi r19,hi8(1024)
	cpi r24,lo8(1024)
	cpc r25,r19
	brlt .L55
.LM76:
	tst r18
	brne .L56
	ldi r24,lo8(4)
	ldi r25,hi8(4)
	rjmp .L57
.L56:
	ldi r24,lo8(8)
	ldi r25,hi8(8)
.L57:
	add r26,r24
	adc r27,r25
	ld r24,X
	clr r25
	sbrc r24,7
	com r25
.L62:
	mov r23,r24
	clr r22
.LVL45:
	rjmp .L54
.LVL46:
.L55:
.LBB346:
.LM77:
	tst r18
	breq .L58
.LM78:
	movw r30,r24
.LVL47:
	lsl r30
	mov r30,r31
	rol r30
	sbc r31,r31
	neg r31
.LVL48:
.LM79:
	movw r20,r24
.LVL49:
	andi r20,lo8(127)
	andi r21,hi8(127)
	lsl r20
	rol r21
	rjmp .L59
.LVL50:
.L58:
.LM80:
	mov r30,r25
	clr r31
.LVL51:
.LM81:
	movw r20,r24
.LVL52:
	andi r21,hi8(255)
.L59:
.LM82:
	add r30,r26
	adc r31,r27
.LVL53:
	ldd r24,Z+1
	clr r25
	sbrc r24,7
	com r25
	mul r24,r20
	movw r22,r0
	mul r24,r21
	add r23,r0
	mul r25,r20
	add r23,r0
	clr r1
.LVL54:
	ld r18,Z
.LVL55:
	clr r19
	sbrc r18,7
	com r19
	ldi r24,lo8(256)
	ldi r25,hi8(256)
	sub r24,r20
	sbc r25,r21
	movw r20,r24
.LVL56:
	mul r18,r20
	movw r24,r0
	mul r18,r21
	add r25,r0
	mul r19,r20
	add r25,r0
	clr r1
	add r22,r24
	adc r23,r25
.LVL57:
.L54:
	movw r24,r22
	ldi r22,lo8(50)
	ldi r23,hi8(50)
.LVL58:
	call __divmodhi4
.LVL59:
	movw r24,r22
/* epilogue start */
.LBE346:
.LBE345:
.LM83:
	ret
.LFE45:
	.size	_Z6intpolih, .-_Z6intpolih
.global	_Z14setupPulsesPPMv
	.type	_Z14setupPulsesPPMv, @function
_Z14setupPulsesPPMv:
.LFB49:
.LM84:
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
.LBB347:
.LM85:
	lds r20,g_model+15
.LVL60:
	lsl r20
	subi r20,lo8(-(8))
	ldi r16,lo8(g_chans512)
	ldi r17,hi8(g_chans512)
	ldi r28,lo8(pulses2MHz)
	ldi r29,hi8(pulses2MHz)
	ldi r21,lo8(-20536)
	mov r14,r21
	ldi r21,hi8(-20536)
	mov r15,r21
.LVL61:
.LBB348:
.LM86:
	mov r30,r20
	ldi r31,lo8(0)
	lsl r30
	rol r31
	add r30,r16
	adc r31,r17
.LBB349:
.LM87:
	ldi r18,lo8(600)
	mov r12,r18
	ldi r18,hi8(600)
	mov r13,r18
	rjmp .L64
.LVL62:
.L65:
.LM88:
	movw r26,r16
	ld r18,X+
	ld r19,X+
	movw r16,r26
.LM89:
	movw r24,r18
	ldi r22,lo8(-21)
	ldi r23,hi8(-21)
	call __divmodhi4
	lsl r18
	rol r19
	add r22,r18
	adc r23,r19
.LM90:
	subi r22,lo8(-(2400))
	sbci r23,hi8(-(2400))
	sub r14,r22
	sbc r15,r23
.LM91:
	std Y+1,r13
	st Y,r12
.LM92:
	std Y+3,r23
	std Y+2,r22
	adiw r28,4
.L64:
.LBE349:
.LM93:
	cp r16,r30
	cpc r17,r31
	brne .L65
	mov r26,r20
.LVL63:
	lsl r26
.LBE348:
.LM94:
	mov r30,r26
	ldi r31,lo8(0)
.LVL64:
	lsl r30
	rol r31
.LVL65:
	subi r30,lo8(-(pulses2MHz))
	sbci r31,hi8(-(pulses2MHz))
.LVL66:
	ldi r24,lo8(600)
	ldi r25,hi8(600)
	std Z+1,r25
	st Z,r24
	subi r26,lo8(-(1))
.LVL67:
.LM95:
	mov r30,r26
	ldi r31,lo8(0)
.LVL68:
	lsl r30
	rol r31
.LVL69:
	subi r30,lo8(-(pulses2MHz))
	sbci r31,hi8(-(pulses2MHz))
.LVL70:
	std Z+1,r15
	st Z,r14
.LM96:
	subi r26,lo8(-(1))
.LVL71:
	ldi r27,lo8(0)
	lsl r26
	rol r27
.LVL72:
	subi r26,lo8(-(pulses2MHz))
	sbci r27,hi8(-(pulses2MHz))
	st X+,__zero_reg__
	st X,__zero_reg__
/* epilogue start */
.LBE347:
.LM97:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
.LVL73:
	pop r13
	pop r12
	ret
.LFE49:
	.size	_Z14setupPulsesPPMv, .-_Z14setupPulsesPPMv
.global	_Z10_send_hilojj
	.type	_Z10_send_hilojj, @function
_Z10_send_hilojj:
.LFB50:
.LM98:
.LVL74:
/* prologue: function */
/* frame size = 0 */
.LM99:
	lds r26,pulses2MHzPtr
	lds r27,(pulses2MHzPtr)+1
	movw r30,r26
	st Z+,r24
	st Z+,r25
	adiw r26,2+1
	st X,r23
	st -X,r22
	sbiw r26,2
	adiw r30,2
	sts (pulses2MHzPtr)+1,r31
	sts pulses2MHzPtr,r30
/* epilogue start */
.LM100:
	ret
.LFE50:
	.size	_Z10_send_hilojj, .-_Z10_send_hilojj
.global	_Z11sendBitSilvh
	.type	_Z11sendBitSilvh, @function
_Z11sendBitSilvh:
.LFB51:
.LM101:
.LVL75:
/* prologue: function */
/* frame size = 0 */
.LM102:
	tst r24
	breq .L70
	ldi r18,lo8(2400)
	ldi r19,hi8(2400)
	ldi r24,lo8(2400)
	ldi r25,hi8(2400)
.LVL76:
	rjmp .L71
.LVL77:
.L70:
	ldi r18,lo8(1200)
	ldi r19,hi8(1200)
	ldi r24,lo8(1200)
	ldi r25,hi8(1200)
.LVL78:
.L71:
.LBB350:
.LBB351:
.LM103:
	lds r26,pulses2MHzPtr
	lds r27,(pulses2MHzPtr)+1
	movw r30,r26
	st Z+,r24
	st Z+,r25
	adiw r26,2+1
	st X,r19
	st -X,r18
	sbiw r26,2
	adiw r30,2
	sts (pulses2MHzPtr)+1,r31
	sts pulses2MHzPtr,r30
/* epilogue start */
.LBE351:
.LBE350:
.LM104:
	ret
.LFE51:
	.size	_Z11sendBitSilvh, .-_Z11sendBitSilvh
.global	_Z13send2BitsSilvh
	.type	_Z13send2BitsSilvh, @function
_Z13send2BitsSilvh:
.LFB52:
.LM105:
.LVL79:
/* prologue: function */
/* frame size = 0 */
.LBB352:
.LBB353:
.LM106:
	sbrc r24,1
	rjmp .L74
	ldi r20,lo8(1200)
	ldi r21,hi8(1200)
	ldi r18,lo8(1200)
	ldi r19,hi8(1200)
	rjmp .L75
.L74:
	ldi r20,lo8(2400)
	ldi r21,hi8(2400)
	ldi r18,lo8(2400)
	ldi r19,hi8(2400)
.L75:
.LBB354:
.LBB355:
.LM107:
	lds r30,pulses2MHzPtr
	lds r31,(pulses2MHzPtr)+1
	movw r26,r30
	st X+,r18
	st X+,r19
	std Z+3,r21
	std Z+2,r20
	movw r30,r26
	adiw r30,2
.LBE355:
.LBE354:
.LBE353:
.LBE352:
.LBB356:
.LBB357:
.LM108:
	sbrc r24,0
	rjmp .L76
	ldi r18,lo8(1200)
	ldi r19,hi8(1200)
	ldi r24,lo8(1200)
	ldi r25,hi8(1200)
.LVL80:
	rjmp .L77
.LVL81:
.L76:
	ldi r18,lo8(2400)
	ldi r19,hi8(2400)
	ldi r24,lo8(2400)
	ldi r25,hi8(2400)
.LVL82:
.L77:
.LBB358:
.LBB359:
.LM109:
	adiw r26,2+1
	st X,r25
	st -X,r24
	sbiw r26,2
	std Z+3,r19
	std Z+2,r18
	adiw r30,4
	sts (pulses2MHzPtr)+1,r31
	sts pulses2MHzPtr,r30
/* epilogue start */
.LBE359:
.LBE358:
.LBE357:
.LBE356:
.LM110:
	ret
.LFE52:
	.size	_Z13send2BitsSilvh, .-_Z13send2BitsSilvh
.global	_Z17setupPulsesSilverv
	.type	_Z17setupPulsesSilverv, @function
_Z17setupPulsesSilverv:
.LFB53:
.LM111:
	push r10
	push r11
	push r13
	push r14
	push r15
	push r16
	push r17
	push r29
	push r28
	rcall .
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 2 */
.LBB360:
.LM112:
	lds r24,g_model+14
	cpi r24,lo8(1)
	breq .L81
	cpi r24,lo8(2)
	brne .L91
	rjmp .L92
.L81:
	ldi r17,lo8(0)
.LVL83:
	rjmp .L83
.LVL84:
.L91:
	ldi r17,lo8(1)
.LVL85:
	rjmp .L83
.LVL86:
.L92:
	ldi r17,lo8(2)
.LVL87:
.L83:
.LM113:
	lds r18,g_chans512
	lds r19,(g_chans512)+1
	subi r18,lo8(-(512))
	sbci r19,hi8(-(512))
	lsl r18
	rol r19
	lsl r18
	rol r19
.LM114:
	lds r24,g_chans512+2
	lds r25,(g_chans512+2)+1
	subi r24,lo8(-(512))
	sbci r25,hi8(-(512))
	lsl r24
	rol r25
	lsl r24
	rol r25
	mov r24,r25
.LVL88:
	mov r18,r19
.LVL89:
	sbrc r19,7
	ldi r18,lo8(0)
.L84:
	sbrc r24,7
	ldi r24,lo8(0)
.LVL90:
.L85:
	mov r16,r18
	cpi r18,lo8(16)
	brlt .L86
	ldi r16,lo8(15)
.LVL91:
.L86:
	mov r13,r24
	ldi r24,lo8(15)
.LVL92:
	cp r24,r13
	brge .L87
	ldi r26,lo8(15)
	mov r13,r26
.L87:
.LM115:
	mov r18,r13
	clr r19
	sbrc r18,7
	com r19
	mov r24,r16
	clr r25
	sbrc r24,7
	com r25
.LVL93:
	adiw r24,9
.LVL94:
	cp r24,r18
	cpc r25,r19
	brge .L88
	mov r16,r13
.LVL95:
	subi r16,lo8(-(-9))
.LVL96:
.L88:
.LM116:
	mov r10,r16
	clr r11
	sbrc r10,7
	com r11
	subi r18,lo8(-(9))
	sbci r19,hi8(-(9))
	cp r18,r10
	cpc r19,r11
	brge .L89
.LVL97:
	ldi r31,lo8(-9)
	mov r13,r31
	add r13,r16
.L89:
.LBB361:
.LBB362:
.LM117:
	ldi r24,lo8(6000)
	ldi r25,hi8(6000)
	sts (pulses2MHz)+1,r25
	sts pulses2MHz,r24
	ldi r30,lo8(1200)
	mov r14,r30
	ldi r30,hi8(1200)
	mov r15,r30
	sts (pulses2MHz+2)+1,r15
	sts pulses2MHz+2,r14
	ldi r24,lo8(pulses2MHz+4)
	ldi r25,hi8(pulses2MHz+4)
	sts (pulses2MHzPtr)+1,r25
	sts pulses2MHzPtr,r24
.LBE362:
.LBE361:
.LM118:
	ldi r24,lo8(0)
	call _Z13send2BitsSilvh
.LBB363:
.LBB364:
.LM119:
	lds r26,pulses2MHzPtr
	lds r27,(pulses2MHzPtr)+1
	ldi r24,lo8(2400)
	ldi r25,hi8(2400)
	movw r30,r26
	st Z+,r24
	st Z+,r25
	adiw r26,2+1
	st X,r15
	st -X,r14
	sbiw r26,2
	movw r26,r30
	adiw r26,2
.LBE364:
.LBE363:
.LBB365:
.LBB366:
	std Z+3,r25
	std Z+2,r24
	adiw r26,2+1
	st X,r15
	st -X,r14
	sbiw r26,2
	adiw r26,4
	sts (pulses2MHzPtr)+1,r27
	sts pulses2MHzPtr,r26
.LBE366:
.LBE365:
.LM120:
	mov r24,r17
	call _Z13send2BitsSilvh
.LM121:
	neg r17
.LM122:
	movw r24,r10
	asr r25
	ror r24
	asr r25
	ror r24
	std Y+2,r24
	call _Z13send2BitsSilvh
.LM123:
	ldd r30,Y+2
	sub r17,r30
.LM124:
	mov r24,r16
	call _Z13send2BitsSilvh
.LM125:
	sub r17,r16
.LM126:
	mov r24,r13
	clr r25
	sbrc r24,7
	com r25
	asr r25
	ror r24
	asr r25
	ror r24
	std Y+1,r24
	call _Z13send2BitsSilvh
.LM127:
	ldd r31,Y+1
	sub r17,r31
.LM128:
	mov r24,r13
	call _Z13send2BitsSilvh
.LM129:
	mov r24,r17
	sub r24,r13
	call _Z13send2BitsSilvh
.LBB367:
.LBB368:
.LBB369:
.LBB370:
.LM130:
	lds r26,pulses2MHzPtr
	lds r27,(pulses2MHzPtr)+1
	movw r30,r26
	st Z+,r14
	st Z+,r15
.LBE370:
.LBE369:
.LBE368:
.LBE367:
.LBB371:
.LBB372:
	ldi r24,lo8(-5536)
	ldi r25,hi8(-5536)
	adiw r26,2+1
	st X,r25
	st -X,r24
	sbiw r26,2
	std Z+3,__zero_reg__
	std Z+2,__zero_reg__
	adiw r30,4
	sts (pulses2MHzPtr)+1,r31
	sts pulses2MHzPtr,r30
/* epilogue start */
.LBE372:
.LBE371:
.LBE360:
.LM131:
	pop __tmp_reg__
	pop __tmp_reg__
	pop r28
	pop r29
	pop r17
.LVL98:
	pop r16
.LVL99:
	pop r15
	pop r14
	pop r13
.LVL100:
	pop r11
	pop r10
	ret
.LFE53:
	.size	_Z17setupPulsesSilverv, .-_Z17setupPulsesSilverv
.global	_Z10sendBitTrah
	.type	_Z10sendBitTrah, @function
_Z10sendBitTrah:
.LFB54:
.LM132:
.LVL101:
/* prologue: function */
/* frame size = 0 */
	lds r26,pulses2MHzPtr
	lds r27,(pulses2MHzPtr)+1
.LM133:
	tst r24
	breq .L94
.LBB373:
.LBB374:
.LM134:
	movw r30,r26
	ldi r24,lo8(800)
	ldi r25,hi8(800)
.LVL102:
	st Z+,r24
	st Z+,r25
	ldi r24,lo8(1600)
	ldi r25,hi8(1600)
	rjmp .L97
.LVL103:
.L94:
.LBE374:
.LBE373:
.LBB375:
.LBB376:
	movw r30,r26
	ldi r24,lo8(1600)
	ldi r25,hi8(1600)
.LVL104:
	st Z+,r24
	st Z+,r25
	ldi r24,lo8(800)
	ldi r25,hi8(800)
.L97:
	adiw r26,2+1
	st X,r25
	st -X,r24
	sbiw r26,2
	adiw r30,2
	sts (pulses2MHzPtr)+1,r31
	sts pulses2MHzPtr,r30
	ret
.LBE376:
.LBE375:
.LFE54:
	.size	_Z10sendBitTrah, .-_Z10sendBitTrah
.global	_Z11sendByteTrah
	.type	_Z11sendByteTrah, @function
_Z11sendByteTrah:
.LFB55:
.LM135:
.LVL105:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
	mov r16,r24
.LM136:
	ldi r17,lo8(0)
.LVL106:
.L99:
.LBB377:
.LM137:
	mov r24,r16
	andi r24,lo8(1)
	call _Z10sendBitTrah
	subi r17,lo8(-(1))
	lsr r16
	cpi r17,lo8(8)
	brne .L99
/* epilogue start */
.LBE377:
.LM138:
	pop r17
.LVL107:
	pop r16
.LVL108:
	ret
.LFE55:
	.size	_Z11sendByteTrah, .-_Z11sendByteTrah
.global	_Z24setupPulsesTracerCtp1009v
	.type	_Z24setupPulsesTracerCtp1009v, @function
_Z24setupPulsesTracerCtp1009v:
.LFB56:
.LM139:
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
.LBB378:
.LM140:
	ldi r24,lo8(pulses2MHz)
	ldi r25,hi8(pulses2MHz)
	sts (pulses2MHzPtr)+1,r25
	sts pulses2MHzPtr,r24
.LM141:
	lds r24,_ZZ24setupPulsesTracerCtp1009vE5phase
	ldi r25,lo8(1)
	eor r24,r25
	sts _ZZ24setupPulsesTracerCtp1009vE5phase,r24
	tst r24
	brne .+2
	rjmp .L103
.LBB379:
.LM142:
	lds r24,g_chans512
	lds r25,(g_chans512)+1
.LVL109:
	subi r24,lo8(-(516))
	sbci r25,hi8(-(516))
	ldi r30,3
1:	lsr r25
	ror r24
	dec r30
	brne 1b
	cpi r24,128
	cpc r25,__zero_reg__
	brlo .L104
	ldi r24,lo8(127)
	ldi r25,hi8(127)
.L104:
	mov r17,r24
.LVL110:
.LM143:
	lds r18,g_chans512+2
	lds r19,(g_chans512+2)+1
	sbrc r19,7
	rjmp .L105
.LM144:
	movw r24,r18
.LVL111:
	adiw r24,8
	ldi r23,4
1:	lsr r25
	ror r24
	dec r23
	brne 1b
	cpi r24,64
	cpc r25,__zero_reg__
	brlo .L106
	ldi r24,lo8(63)
	ldi r25,hi8(63)
.L106:
	mov r16,r24
.LVL112:
	ori r16,lo8(64)
	rjmp .L107
.LVL113:
.L105:
.LM145:
	ldi r24,lo8(8)
	ldi r25,hi8(8)
.LVL114:
	sub r24,r18
	sbc r25,r19
	ldi r22,4
1:	lsr r25
	ror r24
	dec r22
	brne 1b
	cpi r24,64
	cpc r25,__zero_reg__
	brlo .L108
	ldi r24,lo8(63)
	ldi r25,hi8(63)
.L108:
	mov r16,r24
.LVL115:
.L107:
.LM146:
	mov r24,r17
.LVL116:
	call _Z11sendByteTrah
.LM147:
	mov r24,r16
	call _Z11sendByteTrah
.LM148:
	eor r16,r17
	mov r24,r16
	ldi r25,lo8(0)
	movw r18,r24
	ldi r21,4
1:	asr r19
	ror r18
	dec r21
	brne 1b
	ldi r20,4
1:	lsl r24
	rol r25
	dec r20
	brne 1b
	or r24,r18
	call _Z11sendByteTrah
.LBB380:
.LBB381:
.LM149:
	lds r26,pulses2MHzPtr
	lds r27,(pulses2MHzPtr)+1
	movw r30,r26
	ldi r24,lo8(10000)
	ldi r25,hi8(10000)
	rjmp .L113
.LVL117:
.L103:
.LBE381:
.LBE380:
.LBE379:
.LBB382:
.LM150:
	lds r24,g_chans512+4
	lds r25,(g_chans512+4)+1
.LVL118:
	subi r24,lo8(-(512))
	sbci r25,hi8(-(512))
	ldi r19,3
1:	lsr r25
	ror r24
	dec r19
	brne 1b
	cpi r24,128
	cpc r25,__zero_reg__
	brlo .L110
	ldi r24,lo8(127)
	ldi r25,hi8(127)
.L110:
	mov r16,r24
.LVL119:
	ori r16,lo8(-128)
.LM151:
	mov r24,r16
	call _Z11sendByteTrah
.LM152:
	ldi r24,lo8(-114)
	call _Z11sendByteTrah
.LM153:
	ldi r24,lo8(-114)
	eor r16,r24
	ldi r17,lo8(0)
	movw r24,r16
.LVL120:
	ldi r18,4
1:	asr r25
	ror r24
	dec r18
	brne 1b
	ldi r25,4
1:	lsl r16
	rol r17
	dec r25
	brne 1b
	or r24,r16
	call _Z11sendByteTrah
.LBB383:
.LBB384:
.LM154:
	lds r26,pulses2MHzPtr
	lds r27,(pulses2MHzPtr)+1
	movw r30,r26
	ldi r24,lo8(14000)
	ldi r25,hi8(14000)
.LVL121:
.L113:
	st Z+,r24
	st Z+,r25
	ldi r24,lo8(4000)
	ldi r25,hi8(4000)
	adiw r26,2+1
	st X,r25
	st -X,r24
	sbiw r26,2
	adiw r30,2
	sts (pulses2MHzPtr)+1,r31
	sts pulses2MHzPtr,r30
.LBE384:
.LBE383:
.LBE382:
.LM155:
	lds r30,pulses2MHzPtr
	lds r31,(pulses2MHzPtr)+1
	st Z+,__zero_reg__
	st Z+,__zero_reg__
	sts (pulses2MHzPtr)+1,r31
	sts pulses2MHzPtr,r30
.LM156:
	subi r30,lo8(pulses2MHz)
	sbci r31,hi8(pulses2MHz)
	cpi r30,120
	cpc r31,__zero_reg__
	brlt .L112
	ldi r24,lo8(_ZZ24setupPulsesTracerCtp1009vE3__c)
	ldi r25,hi8(_ZZ24setupPulsesTracerCtp1009vE3__c)
	call _Z5alertPKc
.L112:
/* epilogue start */
.LBE378:
.LM157:
	pop r17
.LVL122:
	pop r16
.LVL123:
	ret
.LFE56:
	.size	_Z24setupPulsesTracerCtp1009v, .-_Z24setupPulsesTracerCtp1009v
.global	_Z11setupPulsesv
	.type	_Z11setupPulsesv, @function
_Z11setupPulsesv:
.LFB48:
.LM158:
/* prologue: function */
/* frame size = 0 */
.LM159:
	lds r24,g_model+14
	cpi r24,lo8(4)
	brsh .L119
	cpi r24,lo8(1)
	brsh .L117
	rjmp .L122
.L119:
	cpi r24,lo8(4)
	brne .L120
	rjmp .L123
.L122:
.LM160:
	call _Z14setupPulsesPPMv
	ret
.L117:
.LM161:
	call _Z17setupPulsesSilverv
	ret
.L123:
.LM162:
	call _Z24setupPulsesTracerCtp1009v
.L120:
	ret
.LFE48:
	.size	_Z11setupPulsesv, .-_Z11setupPulsesv
.global	_Z20get_calibrated_stickh
	.type	_Z20get_calibrated_stickh, @function
_Z20get_calibrated_stickh:
.LFB46:
.LM163:
.LVL124:
	push r17
/* prologue: function */
/* frame size = 0 */
	mov r17,r24
.LBB385:
.LM164:
	call _Z5anaInh
.LVL125:
	movw r18,r24
.LM165:
	mov r30,r17
	ldi r31,lo8(0)
	lsl r30
	rol r31
	subi r30,lo8(-(g_eeGeneral))
	sbci r31,hi8(-(g_eeGeneral))
	ldd r24,Z+1
	ldd r25,Z+2
	sub r18,r24
	sbc r19,r25
.LVL126:
.LM166:
	cp __zero_reg__,r18
	cpc __zero_reg__,r19
	brge .L125
	ldd __tmp_reg__,Z+17
	ldd r31,Z+18
	mov r30,__tmp_reg__
.LVL127:
	rjmp .L126
.LVL128:
.L125:
	ldd __tmp_reg__,Z+9
	ldd r31,Z+10
	mov r30,__tmp_reg__
.LVL129:
.L126:
.LBB386:
.LBB387:
.LM167:
	cpi r30,100
	cpc r31,__zero_reg__
	brge .L127
	ldi r30,lo8(100)
	ldi r31,hi8(100)
.L127:
.LBE387:
.LBE386:
.LM168:
	movw r22,r18
	clr r24
	sbrc r23,7
	com r24
	mov r25,r24
.LVL130:
	ldi r26,9
1:	lsl r22
	rol r23
	rol r24
	rol r25
	dec r26
	brne 1b
.LVL131:
	movw r18,r30
	clr r20
	sbrc r19,7
	com r20
	mov r21,r20
.LVL132:
	call __divmodsi4
.LVL133:
.LM169:
	ldi r24,hi8(-511)
	cpi r18,lo8(-511)
	cpc r19,r24
.LVL134:
	brge .L128
	ldi r18,lo8(-512)
	ldi r19,hi8(-512)
	rjmp .L129
.L128:
.LM170:
	ldi r24,hi8(512)
	cpi r18,lo8(512)
	cpc r19,r24
	brlt .L129
	ldi r18,lo8(512)
	ldi r19,hi8(512)
.L129:
.LBE385:
.LM171:
	movw r24,r18
.LVL135:
/* epilogue start */
	pop r17
.LVL136:
	ret
.LFE46:
	.size	_Z20get_calibrated_stickh, .-_Z20get_calibrated_stickh
.global	_Z6perOutPi
	.type	_Z6perOutPi, @function
_Z6perOutPi:
.LFB47:
.LM172:
.LVL137:
	push r2
	push r3
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
	std Y+10,r25
	std Y+9,r24
.LM173:
	ldi r20,lo8(g_model+171)
	mov r4,r20
	ldi r20,hi8(g_model+171)
	mov r5,r20
	ldi r19,lo8(g_model+263)
	mov r8,r19
	ldi r19,hi8(g_model+263)
	mov r9,r19
	clr r10
	clr r11
	clr r6
	clr r7
.LBB388:
.LBB389:
.LBB390:
.LM174:
	movw r2,r28
	sec
	adc r2,__zero_reg__
	adc r3,__zero_reg__
.LVL138:
.L143:
.LM175:
	mov r24,r10
	call _Z20get_calibrated_stickh
	movw r16,r24
.LVL139:
.LM176:
	movw r30,r6
	subi r30,lo8(-(_ZL8anaCalib))
	sbci r31,hi8(-(_ZL8anaCalib))
	std Z+1,r25
	st Z,r24
.LM177:
	movw r26,r8
	adiw r26,2
	ld r24,X
	ldi r22,lo8(0)
	call _Z9getSwitchab
	tst r24
	breq .L132
	movw r30,r8
	ldd r15,Z+1
	rjmp .L133
.L132:
	movw r26,r8
	ld r15,X
.L133:
.LM178:
	movw r30,r8
	ldd r24,Z+2
	ldi r22,lo8(0)
	call _Z9getSwitchab
	tst r24
	breq .L134
	movw r26,r8
	adiw r26,4
	ld r24,X
	rjmp .L194
.L134:
	movw r26,r8
	adiw r26,3
	ld r24,X
.L194:
	mov r12,r24
	clr r13
	sbrc r12,7
	com r13
	ldi r30,lo8(100)
	ldi r31,hi8(100)
	add r12,r30
	adc r13,r31
.LM179:
	mov r22,r15
	clr r23
	sbrc r22,7
	com r23
	movw r24,r16
	call _Z4expoii
.LM180:
	movw r14,r12
	clr r16
	sbrc r15,7
	com r16
	mov r17,r16
	movw r18,r24
	clr r20
	sbrc r19,7
	com r20
	mov r21,r20
.LVL140:
	movw r24,r16
	movw r22,r14
	call __mulsi3
.LVL141:
	ldi r18,lo8(100)
	ldi r19,hi8(100)
	ldi r20,hlo8(100)
	ldi r21,hhi8(100)
	call __divmodsi4
.LM181:
	movw r16,r18
.LVL142:
.LM182:
	movw r12,r10
	lsl r12
	rol r13
.LVL143:
	ldi r18,lo8(g_eeGeneral+40)
	ldi r19,hi8(g_eeGeneral+40)
	add r12,r18
	adc r13,r19
	movw r26,r12
	adiw r26,1
	ld r24,X
	sbiw r26,1
	andi r24,lo8(-64)
	brne .+2
	rjmp .L136
	ld r24,X
	asr r24
	asr r24
	asr r24
	ldi r22,lo8(1)
	call _Z9getSwitchab
	tst r24
	breq .L136
.LBB391:
.LM183:
	movw r26,r12
	ld r30,X
	andi r30,lo8(7)
	ldi r31,lo8(0)
	lsl r30
	rol r31
	movw r26,r30
	subi r26,lo8(-(g_eeGeneral+32))
	sbci r27,hi8(-(g_eeGeneral+32))
	subi r30,lo8(-(g_ppmIns))
	sbci r31,hi8(-(g_ppmIns))
	ld r18,Z
	ldd r19,Z+1
	ld r24,X+
	ld r25,X
	sub r18,r24
	sbc r19,r25
	movw r30,r10
	lsl r30
	rol r31
	subi r30,lo8(-(g_eeGeneral+41))
	sbci r31,hi8(-(g_eeGeneral+41))
	ld r20,Z
	mov r24,r20
	lsl r24
	lsl r24
	asr r24
	asr r24
	clr r25
	sbrc r24,7
	com r25
	movw r30,r24
	mul r18,r30
	movw r24,r0
	mul r18,r31
	add r25,r0
	mul r19,r30
	add r25,r0
	clr r1
	ldi r22,lo8(31)
	ldi r23,hi8(31)
	call __divmodhi4
.LM184:
	swap r20
	lsr r20
	lsr r20
	andi r20,0x3
	ldi r21,lo8(0)
	cpi r20,1
	cpc r21,__zero_reg__
	breq .L137
	cpi r20,2
	cpc r21,__zero_reg__
	brne .L136
	movw r16,r22
.LVL144:
	rjmp .L136
.LVL145:
.L137:
.LM185:
	add r16,r22
	adc r17,r23
.LVL146:
.L136:
.LBE391:
.LM186:
	lds r24,g_eeGeneral+50
	ldi r25,lo8(0)
	andi r24,lo8(1)
	andi r25,hi8(1)
	ldi r18,lo8(2)
	ldi r19,hi8(2)
	sub r18,r24
	sbc r19,r25
	cp r18,r10
	cpc r19,r11
	brne .L139
.LM187:
	movw r24,r16
	subi r24,lo8(-(512))
	sbci r25,hi8(-(512))
	ldi r22,lo8(32)
	ldi r23,hi8(32)
.LVL147:
	call __divmodhi4
	mov r24,r22
	call _Z5traceh
.LM188:
	lds r24,g_model+18
	cpi r24,lo8(1)
	brne .L139
	ldi r22,lo8(512)
	ldi r23,hi8(512)
	sub r22,r16
	sbc r23,r17
	clr r24
	sbrc r23,7
	com r24
	mov r25,r24
	movw r30,r10
	lsl r30
	rol r31
	add r30,r10
	adc r31,r11
	subi r30,lo8(-(g_model+171))
	sbci r31,hi8(-(g_model+171))
	ld r18,Z
	clr r19
	sbrc r18,7
	com r19
	mov r20,r19
	mov r21,r19
	call __mulsi3
	ldi r18,lo8(1024)
	ldi r19,hi8(1024)
	ldi r20,hlo8(1024)
	ldi r21,hhi8(1024)
	call __divmodsi4
	movw r24,r18
	movw r26,r20
.LM189:
	cpi r24,lo8(1024)
	ldi r19,hi8(1024)
	cpc r25,r19
	ldi r19,hlo8(1024)
	cpc r26,r19
	ldi r19,hhi8(1024)
	cpc r27,r19
.LVL148:
	brne .L140
.LVL149:
.L139:
	movw r26,r4
	ld r24,X
.LVL150:
	mov r18,r24
	clr r19
	sbrc r18,7
	com r19
	rjmp .L141
.LVL151:
.L140:
	movw r18,r24
.LVL152:
.L141:
.LM190:
	movw r30,r2
	add r30,r6
	adc r31,r7
	movw r26,r4
	adiw r26,1
	ld r24,X+
	ld r25,X
	sbiw r26,1+1
.LVL153:
	add r18,r24
	adc r19,r25
	std Z+1,r19
	st Z,r18
.LM191:
	lds r24,g_model+20
	ldi r22,lo8(0)
.LVL154:
	call _Z9getSwitchab
	tst r24
	breq .L142
	lds r24,g_eeGeneral+50
	ldi r25,lo8(0)
	andi r24,lo8(1)
	andi r25,hi8(1)
	ldi r30,lo8(2)
	ldi r31,hi8(2)
	sub r30,r24
	sbc r31,r25
	cp r30,r10
	cpc r31,r11
	brne .L142
.LM192:
	movw r30,r10
	lsl r30
	rol r31
	add r30,r2
	adc r31,r3
	ldi r18,lo8(-125)
	ldi r19,hi8(-125)
	std Z+1,r19
	st Z,r18
	ldi r16,lo8(-512)
	ldi r17,hi8(-512)
.L142:
.LM193:
	movw r30,r6
	subi r30,lo8(-(_ZZ6perOutPiE4anas))
	sbci r31,hi8(-(_ZZ6perOutPiE4anas))
	std Z+1,r17
	st Z,r16
	sec
	adc r10,__zero_reg__
	adc r11,__zero_reg__
	ldi r22,lo8(2)
	ldi r23,hi8(2)
	add r6,r22
	adc r7,r23
	ldi r24,lo8(3)
	ldi r25,hi8(3)
	add r4,r24
	adc r5,r25
	ldi r26,lo8(5)
	ldi r27,hi8(5)
	add r8,r26
	adc r9,r27
.LBE390:
.LM194:
	ldi r27,lo8(4)
	cp r10,r27
	cpc r11,__zero_reg__
	breq .+2
	rjmp .L143
.LBE389:
.LBB392:
.LBB393:
.LM195:
	ldi r24,lo8(4)
	call _Z5anaInh
.LM196:
	subi r24,lo8(-(-512))
	sbci r25,hi8(-(-512))
	sts (_ZZ6perOutPiE4anas+8)+1,r25
	sts _ZZ6perOutPiE4anas+8,r24
.LM197:
	ldi r24,lo8(5)
	call _Z5anaInh
.LM198:
	subi r24,lo8(-(-512))
	sbci r25,hi8(-(-512))
	sts (_ZZ6perOutPiE4anas+10)+1,r25
	sts _ZZ6perOutPiE4anas+10,r24
.LM199:
	ldi r24,lo8(6)
	call _Z5anaInh
.LM200:
	subi r24,lo8(-(-512))
	sbci r25,hi8(-(-512))
	sts (_ZZ6perOutPiE4anas+12)+1,r25
	sts _ZZ6perOutPiE4anas+12,r24
.LBE393:
.LBE392:
.LM201:
	ldi r24,lo8(512)
	ldi r25,hi8(512)
	sts (_ZZ6perOutPiE4anas+14)+1,r25
	sts _ZZ6perOutPiE4anas+14,r24
.LM202:
	sts (_ZZ6perOutPiE4anas+16)+1,r25
	sts _ZZ6perOutPiE4anas+16,r24
	ldi r20,lo8(_ZZ6perOutPiE5chans)
	mov r6,r20
	ldi r20,hi8(_ZZ6perOutPiE5chans)
	mov r7,r20
	ldi r26,lo8(_ZZ6perOutPiE4anas+18)
	ldi r27,hi8(_ZZ6perOutPiE4anas+18)
	movw r30,r6
.L144:
.LBB394:
.LM203:
	ld r24,Z
	ldd r25,Z+1
	st X+,r24
	st X+,r25
	adiw r30,4
	ldi r18,hi8(_ZZ6perOutPiE5chans+64)
	cpi r30,lo8(_ZZ6perOutPiE5chans+64)
	cpc r31,r18
	brne .L144
.LBE394:
.LM204:
	ldi r24,lo8(64)
	ldi r30,lo8(_ZZ6perOutPiE5chans)
	ldi r31,hi8(_ZZ6perOutPiE5chans)
	movw r26,r30
	st X+,__zero_reg__
        dec r24
	brne .-6
	ldi r19,lo8(g_model+21)
	mov r14,r19
	ldi r19,hi8(g_model+21)
	mov r15,r19
	ldi r18,lo8(_ZZ6perOutPiE3act)
	mov r8,r18
	ldi r18,hi8(_ZZ6perOutPiE3act)
	mov r9,r18
	ldi r25,lo8(_ZZ6perOutPiE5timer)
	mov r10,r25
	ldi r25,hi8(_ZZ6perOutPiE5timer)
	mov r11,r25
	ldi r16,lo8(0)
	ldi r17,hi8(0)
.LVL155:
.LBB395:
.LBB396:
.LM205:
	movw r4,r28
	sec
	adc r4,__zero_reg__
	adc r5,__zero_reg__
.LVL156:
.L172:
.LM206:
	movw r30,r14
	ld r24,Z
	subi r24,lo8(-(-1))
	cpi r24,lo8(16)
	brlo .+2
	rjmp .L145
.LM207:
	ldd r24,Z+3
	ldi r22,lo8(1)
	call _Z9getSwitchab
.LVL157:
	tst r24
	breq .+2
	rjmp .L146
	movw r30,r16
	lsl r30
	rol r31
	add r30,r16
	adc r31,r17
	lsl r30
	rol r31
	subi r30,lo8(-(g_model+21))
	sbci r31,hi8(-(g_model+21))
	ldd r24,Z+1
	andi r24,lo8(127)
	cpi r24,lo8(8)
	brne .+2
	rjmp .L146
	cpi r24,lo8(9)
	breq .+2
	rjmp .L147
	rjmp .L146
.L183:
.LM208:
	add r30,r16
	adc r31,r17
	lsl r30
	rol r31
	subi r30,lo8(-(g_model+21))
	sbci r31,hi8(-(g_model+21))
	ldd r24,Z+1
	andi r24,lo8(127)
	cpi r24,lo8(9)
	breq .L148
	ldi r26,lo8(0)
	ldi r27,hi8(0)
.LVL158:
	rjmp .L149
.LVL159:
.L148:
	ldi r26,lo8(-512)
	ldi r27,hi8(-512)
.LVL160:
	rjmp .L149
.LVL161:
.L201:
	add r30,r16
	adc r31,r17
	lsl r30
	rol r31
	subi r30,lo8(-(g_model+22))
	sbci r31,hi8(-(g_model+22))
	ld r30,Z
	andi r30,lo8(127)
	ldi r31,lo8(0)
	lsl r30
	rol r31
	subi r30,lo8(-(_ZZ6perOutPiE4anas-2))
	sbci r31,hi8(-(_ZZ6perOutPiE4anas-2))
	ld r26,Z
	ldd r27,Z+1
.LVL162:
.L149:
.LM209:
	movw r18,r16
	lsl r18
	rol r19
	add r18,r16
	adc r19,r17
	lsl r18
	rol r19
	movw r30,r18
	subi r30,lo8(-(g_model+21))
	sbci r31,hi8(-(g_model+21))
	ldd r24,Z+5
	tst r24
	brne .+2
	rjmp .L150
.LBB399:
.LM210:
	movw r30,r8
	ld r24,Z
	ldd r25,Z+1
	movw r20,r26
.LVL163:
	sub r20,r24
	sbc r21,r25
.LM211:
	brne .+2
	rjmp .L151
.LBB400:
.LM212:
	cp __zero_reg__,r20
	cpc __zero_reg__,r21
	brge .L152
	movw r30,r18
	subi r30,lo8(-(g_model+26))
	sbci r31,hi8(-(g_model+26))
	ld r30,Z
.LVL164:
	andi r30,lo8(15)
	rjmp .L153
.LVL165:
.L152:
	movw r30,r18
	subi r30,lo8(-(g_model+26))
	sbci r31,hi8(-(g_model+26))
	ld r30,Z
.LVL166:
	swap r30
	andi r30,0x0f
.L153:
.LM213:
	tst r30
	breq .L154
.LBB401:
.LBB402:
.LM214:
	mov r18,r30
	ldi r19,lo8(0)
	subi r18,lo8(-(-1))
	sbci r19,hi8(-(-1))
	movw r24,r18
	subi r24,lo8(-(_ZZ6perOutPiE5tmr_t))
	sbci r25,hi8(-(_ZZ6perOutPiE5tmr_t))
	movw r30,r24
.LVL167:
/* #APP */
 ;  1883 "../src/menus.cpp" 1
	lpm r22, Z
	
 ;  0 "" 2
.LVL168:
/* #NOAPP */
.LBE402:
.LBB403:
.LM215:
	subi r18,lo8(-(_ZZ6perOutPiE5dlt_t))
	sbci r19,hi8(-(_ZZ6perOutPiE5dlt_t))
	movw r30,r18
/* #APP */
 ;  1884 "../src/menus.cpp" 1
	lpm r24, Z
	
 ;  0 "" 2
.LVL169:
/* #NOAPP */
.LBE403:
.LM216:
	mov r30,r24
	clr r31
	sbrc r30,7
	com r31
.LVL170:
.LBB404:
.LBB405:
.LM217:
	movw r24,r20
.LVL171:
	sbrs r21,7
	rjmp .L155
	clr r24
	clr r25
	sub r24,r20
	sbc r25,r21
.L155:
.LBE405:
.LBE404:
.LM218:
	movw r18,r30
	cp r24,r30
	cpc r25,r31
	brge .L156
	movw r18,r24
.L156:
.LM219:
	sbrc r21,7
	neg r18
.LVL172:
.L157:
.LM220:
	movw r26,r10
.LVL173:
	ld r24,X
.LVL174:
	subi r24,lo8(-(-1))
	st X,r24
	tst r24
	breq .L158
.LM221:
	cp r22,r24
	brsh .L151
	rjmp .L195
.L158:
.LM222:
	clr r19
	sbrc r18,7
	com r19
.LVL175:
	movw r30,r8
.LVL176:
	ld r24,Z
	ldd r25,Z+1
	add r24,r18
	adc r25,r19
	std Z+1,r25
	st Z,r24
.LM223:
	movw r26,r10
.LVL177:
.L195:
	st X,r22
	rjmp .L151
.LVL178:
.L154:
.LBE401:
.LM224:
	movw r30,r8
.LVL179:
	std Z+1,r27
	st Z,r26
.LM225:
	movw r26,r10
.LVL180:
	st X,__zero_reg__
.LVL181:
.L151:
.LBE400:
.LM226:
	movw r30,r8
.LVL182:
	ld r26,Z
	ldd r27,Z+1
.L150:
.LBE399:
.LM227:
	movw r30,r14
	ldd r22,Z+4
.LVL183:
	cpi r22,lo8(1)
	breq .L161
	cpi r22,lo8(1)
	brsh .+2
	rjmp .L160
	cpi r22,lo8(2)
	breq .L162
	cpi r22,lo8(3)
	brne .L191
	rjmp .L199
.L161:
.LM228:
	movw r30,r16
	lsl r30
	rol r31
	add r30,r16
	adc r31,r17
	lsl r30
	rol r31
.LVL184:
	subi r30,lo8(-(g_model+21))
	sbci r31,hi8(-(g_model+21))
	ldd r24,Z+1
	andi r24,lo8(127)
	cpi r24,lo8(9)
	brne .L164
.LM229:
	sbrs r27,7
	rjmp .L165
	ldi r26,lo8(-512)
	ldi r27,hi8(-512)
	rjmp .L160
.L165:
.LM230:
	subi r26,lo8(-(-256))
	sbci r27,hi8(-(-256))
	rjmp .L196
.L164:
	sbrs r27,7
	rjmp .L160
	rjmp .L197
.LVL185:
.L162:
.LM231:
	movw r30,r16
	lsl r30
	rol r31
	add r30,r16
	adc r31,r17
	lsl r30
	rol r31
	subi r30,lo8(-(g_model+21))
	sbci r31,hi8(-(g_model+21))
	ldd r24,Z+1
	andi r24,lo8(127)
	cpi r24,lo8(9)
	brne .L167
.LM232:
	cp __zero_reg__,r26
	cpc __zero_reg__,r27
	brge .L168
	ldi r26,lo8(512)
	ldi r27,hi8(512)
	rjmp .L160
.L168:
.LM233:
	subi r26,lo8(-(256))
	sbci r27,hi8(-(256))
.L196:
	lsl r26
	rol r27
	rjmp .L160
.L167:
	cp __zero_reg__,r26
	cpc __zero_reg__,r27
	brge .L160
.L197:
	ldi r26,lo8(0)
	ldi r27,hi8(0)
	rjmp .L160
.L199:
.LBB397:
.LBB398:
.LM234:
	sbrs r27,7
	rjmp .L160
	com r27
	neg r26
	sbci r27,lo8(-1)
	rjmp .L160
.L191:
.LBE398:
.LBE397:
.LM235:
	subi r22,lo8(-(-4))
	movw r24,r26
	call _Z6intpolih
.LVL186:
	movw r26,r24
.LVL187:
.L160:
.LM236:
	movw r18,r16
.LVL188:
	lsl r18
	rol r19
	add r18,r16
	adc r19,r17
	lsl r18
	rol r19
	movw r30,r18
	subi r30,lo8(-(g_model+21))
	sbci r31,hi8(-(g_model+21))
	ldd r24,Z+1
	sbrc r24,7
	rjmp .L171
	movw r30,r18
	subi r30,lo8(-(g_model+22))
	sbci r31,hi8(-(g_model+22))
	ld r24,Z
	andi r24,lo8(127)
	mov r30,r24
	ldi r31,lo8(0)
	sbiw r30,0
	breq .L171
	cpi r30,5
	cpc r31,__zero_reg__
	brge .L171
	sbiw r30,1
	lsl r30
	rol r31
.LVL189:
	add r30,r4
	adc r31,r5
	ld r24,Z
	ldd r25,Z+1
	add r26,r24
	adc r27,r25
.LVL190:
.L171:
.LM237:
	movw r30,r14
	ld r18,Z
	mov r12,r18
	clr r13
	lsl r12
	rol r13
	lsl r12
	rol r13
	ldi r18,lo8(_ZZ6perOutPiE5chans-4)
	ldi r19,hi8(_ZZ6perOutPiE5chans-4)
	add r12,r18
	adc r13,r19
	movw r22,r26
	clr r24
	sbrc r23,7
	com r24
	mov r25,r24
.LVL191:
	ldd r18,Z+2
	clr r19
	sbrc r18,7
	com r19
	mov r20,r19
	mov r21,r19
	call __mulsi3
.LVL192:
	movw r26,r12
	ld r18,X+
	ld r19,X+
	ld r20,X+
	ld r21,X
	add r18,r22
	adc r19,r23
	adc r20,r24
	adc r21,r25
	movw r30,r12
	st Z,r18
	std Z+1,r19
	std Z+2,r20
	std Z+3,r21
.L147:
	subi r16,lo8(-(1))
	sbci r17,hi8(-(1))
	ldi r18,lo8(6)
	ldi r19,hi8(6)
	add r14,r18
	adc r15,r19
	ldi r22,lo8(2)
	ldi r23,hi8(2)
	add r8,r22
	adc r9,r23
	sec
	adc r10,__zero_reg__
	adc r11,__zero_reg__
.LBE396:
.LM238:
	cpi r16,25
	cpc r17,__zero_reg__
	breq .+2
	rjmp .L172
.L145:
.LBE395:
.LBB407:
.LBB408:
.LBB409:
.LM239:
	lds r24,_ZL14s_limitCacheOk
	tst r24
	brne .L173
.LM240:
	ldi r24,lo8(1)
	sts _ZL14s_limitCacheOk,r24
	ldi r26,lo8(g_model+183)
	ldi r27,hi8(g_model+183)
	ldi r18,lo8(0)
	ldi r19,hi8(0)
.L174:
.LBB410:
.LBB411:
.LM241:
	movw r30,r18
	subi r30,lo8(-(_ZL16s_cacheLimitsMin))
	sbci r31,hi8(-(_ZL16s_cacheLimitsMin))
	ld r24,X
	clr r25
	sbrc r24,7
	com r25
	subi r24,lo8(-(-100))
	sbci r25,hi8(-(-100))
	std Z+1,r25
	st Z,r24
.LM242:
	movw r30,r18
	subi r30,lo8(-(_ZL16s_cacheLimitsMax))
	sbci r31,hi8(-(_ZL16s_cacheLimitsMax))
	adiw r26,1
	ld r24,X
	sbiw r26,1
	clr r25
	sbrc r24,7
	com r25
	subi r24,lo8(-(100))
	sbci r25,hi8(-(100))
	std Z+1,r25
	st Z,r24
	adiw r26,5
	subi r18,lo8(-(2))
	sbci r19,hi8(-(2))
.LBE411:
.LM243:
	ldi r23,hi8(g_model+263)
	cpi r26,lo8(g_model+263)
	cpc r27,r23
	brne .L174
.L173:
	ldi r18,lo8(g_model+185)
	mov r8,r18
	ldi r18,hi8(g_model+185)
	mov r9,r18
	clr r10
	clr r11
.L182:
.LBE410:
.LBE409:
.LBE408:
.LBE407:
.LBB412:
.LBB413:
.LM244:
	movw r26,r6
	ld r14,X+
	ld r15,X+
	ld r16,X+
	ld r17,X
	cp r14,__zero_reg__
	cpc r15,__zero_reg__
	cpc r16,__zero_reg__
	cpc r17,__zero_reg__
	brne .L175
	clr r12
	clr r13
.LVL193:
	rjmp .L176
.LVL194:
.L175:
.LM245:
	cp __zero_reg__,r14
	cpc __zero_reg__,r15
	cpc __zero_reg__,r16
	cpc __zero_reg__,r17
	brge .L177
	movw r30,r10
	subi r30,lo8(-(_ZL16s_cacheLimitsMax))
	sbci r31,hi8(-(_ZL16s_cacheLimitsMax))
	ld r22,Z
	ldd r23,Z+1
	clr r24
	sbrc r23,7
	com r24
	mov r25,r24
	movw r20,r16
	movw r18,r14
	rjmp .L198
.L177:
	movw r30,r10
	subi r30,lo8(-(_ZL16s_cacheLimitsMin))
	sbci r31,hi8(-(_ZL16s_cacheLimitsMin))
	ld r22,Z
	ldd r23,Z+1
	clr r24
	sbrc r23,7
	com r24
	mov r25,r24
	clr r18
	clr r19
	movw r20,r18
	sub r18,r14
	sbc r19,r15
	sbc r20,r16
	sbc r21,r17
.L198:
	call __mulsi3
	ldi r18,lo8(10000)
	ldi r19,hi8(10000)
	ldi r20,hlo8(10000)
	ldi r21,hhi8(10000)
	call __divmodsi4
	movw r12,r18
.LVL195:
.LM246:
	movw r24,r16
	movw r22,r14
	ldi r18,lo8(100)
	ldi r19,hi8(100)
	ldi r20,hlo8(100)
	ldi r21,hhi8(100)
	call __divmodsi4
	movw r30,r6
	st Z,r18
	std Z+1,r19
	std Z+2,r20
	std Z+3,r21
.L176:
.LM247:
	movw r26,r8
	adiw r26,1
	ld r18,X+
	ld r19,X
	sbiw r26,1+1
.LVL196:
	add r18,r12
	adc r19,r13
.LM248:
	ld r24,X
	tst r24
	breq .L179
	com r19
	neg r18
	sbci r19,lo8(-1)
.L179:
.LM249:
	ldi r27,hi8(641)
	cpi r18,lo8(641)
	cpc r19,r27
	brlt .L180
	ldi r18,lo8(640)
	ldi r19,hi8(640)
	rjmp .L181
.L180:
.LM250:
	ldi r30,hi8(-640)
	cpi r18,lo8(-640)
	cpc r19,r30
	brge .L181
	ldi r18,lo8(-640)
	ldi r19,hi8(-640)
.L181:
.LM251:
/* #APP */
 ;  1960 "../src/menus.cpp" 1
	cli
 ;  0 "" 2
.LM252:
/* #NOAPP */
	ldd r30,Y+9
	ldd r31,Y+10
	add r30,r10
	adc r31,r11
	std Z+1,r19
	st Z,r18
.LM253:
/* #APP */
 ;  1962 "../src/menus.cpp" 1
	sei
 ;  0 "" 2
/* #NOAPP */
	ldi r18,lo8(4)
	ldi r19,hi8(4)
.LVL197:
	add r6,r18
	adc r7,r19
	ldi r22,lo8(2)
	ldi r23,hi8(2)
	add r10,r22
	adc r11,r23
	ldi r24,lo8(5)
	ldi r25,hi8(5)
	add r8,r24
	adc r9,r25
.LBE413:
.LM254:
	ldi r25,lo8(_ZZ6perOutPiE5chans+64)
	cp r6,r25
	ldi r25,hi8(_ZZ6perOutPiE5chans+64)
	cpc r7,r25
	breq .+2
	rjmp .L182
	rjmp .L200
.LVL198:
.L146:
.LBE412:
.LBB414:
.LBB406:
.LM255:
	movw r26,r14
	adiw r26,3
	ld r24,X
	ldi r22,lo8(1)
	call _Z9getSwitchab
	movw r30,r16
	lsl r30
	rol r31
	tst r24
	brne .+2
	rjmp .L183
	rjmp .L201
.LVL199:
.L200:
/* epilogue start */
.LBE406:
.LBE414:
.LBE388:
.LM256:
	adiw r28,10
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r28
	pop r29
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	ret
.LFE47:
	.size	_Z6perOutPi, .-_Z6perOutPi
.global	_Z9genMixTabv
	.type	_Z9genMixTabv, @function
_Z9genMixTabv:
.LFB20:
.LM257:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
.LBB415:
.LM258:
	ldi r24,lo8(-4)
	ldi r30,lo8(s_mixTab)
	ldi r31,hi8(s_mixTab)
	movw r26,r30
	st X+,__zero_reg__
        dec r24
	brne .-6
	lds r25,s_mixMaxSel
	ldi r28,lo8(g_model+21)
	ldi r29,hi8(g_model+21)
	ldi r16,lo8(0)
.LVL200:
	ldi r17,lo8(0)
.LVL201:
	ldi r21,lo8(1)
.LVL202:
	ldi r22,lo8(0)
.LVL203:
.L211:
.LBB416:
.LBB417:
.LM259:
	ld r20,Y
.LM260:
	tst r20
	brne .L203
	ldi r20,lo8(16)
.L203:
.LM261:
	cp r16,r20
	brsh .L204
	mov r18,r16
	mov r23,r17
	mov r19,r21
.LVL204:
.L205:
.LM262:
	subi r18,lo8(-(1))
.LM263:
	mov r24,r23
	ldi r25,lo8(0)
	movw r30,r24
	lsl r30
	rol r31
	add r30,r24
	adc r31,r25
	lsl r30
	rol r31
	movw r26,r30
	subi r26,lo8(-(s_mixTab))
	sbci r27,hi8(-(s_mixTab))
	adiw r26,1
	st X,r18
	sbiw r26,1
.LM264:
	ld r24,X
	ori r24,lo8(1)
	st X,r24
.LM265:
	subi r30,lo8(-(s_mixTab+2))
	sbci r31,hi8(-(s_mixTab+2))
	st Z,r19
	subi r19,lo8(-(1))
.LM266:
	adiw r26,4
	st X,r22
.LM267:
	subi r23,lo8(-(1))
.LM268:
	cp r18,r20
	brlo .L205
.LM269:
	mov r24,r16
	com r24
	mov r16,r20
.LVL205:
	mov r25,r21
	subi r25,lo8(-(1))
	add r25,r24
	add r17,r24
.LVL206:
.LM270:
	add r17,r20
.LM271:
	add r25,r20
.LM272:
	mov r21,r25
.LVL207:
	subi r21,lo8(-(-1))
.L204:
.LM273:
	ld r23,Y
	tst r23
	breq .L206
.LM274:
	mov r24,r17
	ldi r25,lo8(0)
	movw r18,r24
	lsl r18
	rol r19
	add r18,r24
	adc r19,r25
	movw r26,r18
	lsl r26
	rol r27
	subi r26,lo8(-(s_mixTab))
	sbci r27,hi8(-(s_mixTab))
	adiw r26,1
	st X,r20
	sbiw r26,1
.LM275:
	adiw r26,5
	st X,r22
	sbiw r26,5
.LM276:
	ld r24,X
	ori r24,lo8(2)
	st X,r24
.LM277:
	adiw r26,3
	st X,r21
	sbiw r26,3
	subi r21,lo8(-(1))
.LM278:
	ldd r24,Y+6
	movw r30,r18
	adiw r30,1
	cp r23,r24
	brne .L207
.LM279:
	lsl r30
	rol r31
	subi r30,lo8(-(s_mixTab))
	sbci r31,hi8(-(s_mixTab))
	st Z,__zero_reg__
.LM280:
	adiw r26,4
	st X,__zero_reg__
	rjmp .L208
.L207:
.LM281:
	lsl r30
	rol r31
	subi r30,lo8(-(s_mixTab))
	sbci r31,hi8(-(s_mixTab))
	st Z,r21
	subi r21,lo8(-(1))
.LM282:
	subi r22,lo8(-(1))
	adiw r26,4
	st X,r22
	subi r22,lo8(-(-1))
.L208:
.LM283:
	mov r25,r21
.LBE417:
.LM284:
	subi r22,lo8(-(1))
	adiw r28,6
	cpi r22,lo8(25)
	brne .L209
	sts s_mixMaxSel,r21
	rjmp .L212
.L209:
.LBB418:
.LM285:
	subi r17,lo8(-(1))
	rjmp .L211
.L206:
	sts s_mixMaxSel,r25
.L212:
/* epilogue start */
.LBE418:
.LBE416:
.LBE415:
.LM286:
	pop r29
	pop r28
	pop r17
.LVL208:
	pop r16
.LVL209:
	ret
.LFE20:
	.size	_Z9genMixTabv, .-_Z9genMixTabv
.global	_Z17menuProcStatistich
	.type	_Z17menuProcStatistich, @function
_Z17menuProcStatistich:
.LFB42:
.LM287:
.LVL210:
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	mov r16,r24
.LBB419:
.LM288:
	ldi r24,lo8(0)
.LVL211:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ17menuProcStatistichE3__c)
	ldi r21,hi8(_ZZ17menuProcStatistichE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM289:
	cpi r16,lo8(97)
	brlo .L215
	cpi r16,lo8(99)
	brlo .L216
	cpi r16,lo8(99)
	brne .L215
.LM290:
	ldi r24,lo8(gs(_Z18menuProcStatistic2h))
	ldi r25,hi8(gs(_Z18menuProcStatistic2h))
	rjmp .L227
.L216:
.LM291:
	ldi r24,lo8(gs(_Z9menuProc0h))
	ldi r25,hi8(gs(_Z9menuProc0h))
.L227:
	call _Z9chainMenuPFvhE
.L215:
.LM292:
	ldi r24,lo8(6)
	ldi r22,lo8(8)
	ldi r20,lo8(_ZZ17menuProcStatistichE3__c_0)
	ldi r21,hi8(_ZZ17menuProcStatistichE3__c_0)
	call _Z10lcd_puts_PhhPKc
.LM293:
	lds r20,s_timeCumAbs
	lds r21,(s_timeCumAbs)+1
	ldi r24,lo8(24)
	ldi r22,lo8(8)
	ldi r18,lo8(0)
	ldi r16,lo8(0)
.LVL212:
	call _Z8putsTimehhihh
.LM294:
	ldi r24,lo8(102)
	ldi r22,lo8(8)
	ldi r20,lo8(_ZZ17menuProcStatistichE3__c_1)
	ldi r21,hi8(_ZZ17menuProcStatistichE3__c_1)
	call _Z10lcd_puts_PhhPKc
.LM295:
	lds r20,s_timeCumTot
	lds r21,(s_timeCumTot)+1
	ldi r24,lo8(60)
	ldi r22,lo8(8)
	ldi r18,lo8(0)
	call _Z8putsTimehhihh
.LM296:
	ldi r24,lo8(6)
	ldi r22,lo8(16)
	ldi r20,lo8(_ZZ17menuProcStatistichE3__c_2)
	ldi r21,hi8(_ZZ17menuProcStatistichE3__c_2)
	call _Z10lcd_puts_PhhPKc
.LM297:
	lds r20,s_timeCumThr
	lds r21,(s_timeCumThr)+1
	ldi r24,lo8(24)
	ldi r22,lo8(16)
	ldi r18,lo8(0)
	call _Z8putsTimehhihh
.LM298:
	ldi r24,lo8(102)
	ldi r22,lo8(16)
	ldi r20,lo8(_ZZ17menuProcStatistichE3__c_3)
	ldi r21,hi8(_ZZ17menuProcStatistichE3__c_3)
	call _Z10lcd_puts_PhhPKc
.LM299:
	lds r20,s_timeCum16ThrP
	lds r21,(s_timeCum16ThrP)+1
	ldi r27,4
1:	lsr r21
	ror r20
	dec r27
	brne 1b
	ldi r24,lo8(60)
	ldi r22,lo8(16)
	ldi r18,lo8(0)
	call _Z8putsTimehhihh
.LM300:
	lds r24,s_traceCnt
	lds r25,(s_traceCnt)+1
	cpi r24,121
	cpc r25,__zero_reg__
	brsh .L218
	ldi r28,lo8(0)
	ldi r29,hi8(0)
.LVL213:
	rjmp .L219
.LVL214:
.L218:
	lds r28,s_traceWr
	lds r29,(s_traceWr)+1
.LVL215:
.L219:
.LM301:
	ldi r24,lo8(2)
	ldi r22,lo8(60)
	ldi r20,lo8(126)
	call _Z9lcd_hlinehha
.LM302:
	ldi r24,lo8(5)
	ldi r22,lo8(28)
	ldi r20,lo8(35)
	call _Z9lcd_vlinehha
	ldi r16,lo8(11)
.L220:
.LBB420:
.LM303:
	mov r24,r16
	ldi r22,lo8(59)
	ldi r20,lo8(3)
	call _Z9lcd_vlinehha
	subi r16,lo8(-(6))
.LM304:
	cpi r16,lo8(-125)
	brne .L220
	ldi r16,lo8(6)
.LBE420:
.LBB421:
.LM305:
	ldi r17,lo8(60)
.L223:
	movw r30,r28
	subi r30,lo8(-(s_traceBuf))
	sbci r31,hi8(-(s_traceBuf))
	ld r20,Z
	mov r22,r17
	sub r22,r20
	mov r24,r16
	call _Z9lcd_vlinehha
.LM306:
	adiw r28,1
.LM307:
	cpi r28,120
	cpc r29,__zero_reg__
	brlo .L221
	ldi r28,lo8(0)
	ldi r29,hi8(0)
.L221:
.LM308:
	lds r24,s_traceWr
	lds r25,(s_traceWr)+1
	cp r28,r24
	cpc r29,r25
	breq .L224
	subi r16,lo8(-(1))
.LM309:
	cpi r16,lo8(126)
	brne .L223
.L224:
/* epilogue start */
.LBE421:
.LBE419:
.LM310:
	pop r29
	pop r28
.LVL216:
	pop r17
	pop r16
	ret
.LFE42:
	.size	_Z17menuProcStatistich, .-_Z17menuProcStatistich
.global	_Z9menuProc0h
	.type	_Z9menuProc0h, @function
_Z9menuProc0h:
.LFB43:
.LM311:
.LVL217:
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
	push r17
	push r29
	push r28
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
.LBB422:
.LM312:
	cpi r24,lo8(-127)
	brne .+2
	rjmp .L236
	cpi r24,lo8(-126)
	brsh .L243
	cpi r24,lo8(97)
	brne .+2
	rjmp .L232
	cpi r24,lo8(98)
	brsh .L244
	cpi r24,lo8(34)
	brne .+2
	rjmp .L230
	cpi r24,lo8(35)
	breq .+2
	rjmp .L229
	rjmp .L288
.L244:
	cpi r24,lo8(101)
	brne .+2
	rjmp .L234
	cpi r24,lo8(-128)
	breq .L235
	cpi r24,lo8(100)
	breq .+2
	rjmp .L229
	rjmp .L289
.L243:
	cpi r24,lo8(-124)
	breq .L239
	cpi r24,lo8(-123)
	brsh .L245
	cpi r24,lo8(-126)
	brne .+2
	rjmp .L237
	cpi r24,lo8(-125)
	breq .+2
	rjmp .L229
	rjmp .L290
.L245:
	cpi r24,lo8(-66)
	brne .+2
	rjmp .L241
	cpi r24,lo8(-65)
	brne .+2
	rjmp .L242
	cpi r24,lo8(-123)
	breq .+2
	rjmp .L229
	rjmp .L291
.L235:
.LM313:
	lds r24,_ZZ9menuProc0hE3sub
.LVL218:
	tst r24
	breq .L247
	cpi r24,lo8(1)
	brne .L246
	rjmp .L292
.L247:
.LM314:
	ldi r24,lo8(gs(_Z14menuProcSetup0h))
	ldi r25,hi8(gs(_Z14menuProcSetup0h))
	rjmp .L283
.L292:
.LM315:
	ldi r24,lo8(gs(_Z19menuProcModelSelecth))
	ldi r25,hi8(gs(_Z19menuProcModelSelecth))
.L283:
	call _Z8pushMenuPFvhE
.L246:
.LM316:
	ldi r24,lo8(-128)
	rjmp .L284
.LVL219:
.L289:
.LM317:
	ldi r24,lo8(100)
.LVL220:
	call _Z11getEventDblh
	cpi r24,lo8(2)
	breq .+2
	rjmp .L249
	lds r24,_ZZ9menuProc0hE13s_lastPopMenu+2
	lds r25,(_ZZ9menuProc0hE13s_lastPopMenu+2)+1
	sbiw r24,0
	brne .L285
	rjmp .L249
.L277:
.LM318:
	ldi r24,lo8(1)
	rjmp .L286
.LVL221:
.L239:
.LM319:
	ldi r24,lo8(gs(_Z19menuProcModelSelecth))
	ldi r25,hi8(gs(_Z19menuProcModelSelecth))
.LVL222:
	call _Z8pushMenuPFvhE
.LM320:
	ldi r24,lo8(-124)
	rjmp .L284
.LVL223:
.L234:
.LM321:
	ldi r24,lo8(101)
.LVL224:
	call _Z11getEventDblh
	cpi r24,lo8(2)
	breq .+2
	rjmp .L250
	lds r24,_ZZ9menuProc0hE13s_lastPopMenu
	lds r25,(_ZZ9menuProc0hE13s_lastPopMenu)+1
	sbiw r24,0
	brne .+2
	rjmp .L250
.L285:
.LM322:
	call _Z8pushMenuPFvhE
	rjmp .L229
.L278:
.LM323:
	subi r24,lo8(-(-1))
.L286:
	sts _ZZ9menuProc0hE3sub,r24
.LVL225:
.L287:
.LBB423:
.LBB424:
.LM324:
	lds r24,g_beepVal
.LVL226:
	sts g_beepCnt,r24
	rjmp .L229
.LVL227:
.L291:
.LBE424:
.LBE423:
.LM325:
	ldi r24,lo8(gs(_Z14menuProcSetup0h))
	ldi r25,hi8(gs(_Z14menuProcSetup0h))
.LVL228:
	call _Z8pushMenuPFvhE
.LM326:
	ldi r24,lo8(-123)
	rjmp .L284
.LVL229:
.L288:
.LM327:
	lds r24,g_eeGeneral+48
.LVL230:
	subi r24,lo8(-(2))
	sts g_eeGeneral+48,r24
.LVL231:
.L230:
.LM328:
	lds r24,g_eeGeneral+48
.LVL232:
	subi r24,lo8(-(1))
	andi r24,lo8(1)
	sts g_eeGeneral+48,r24
.LM329:
	ldi r24,lo8(1)
	call _Z7eeDirtyh
	rjmp .L287
.LVL233:
.L290:
.LM330:
	ldi r24,lo8(gs(_Z17menuProcStatistich))
	ldi r25,hi8(gs(_Z17menuProcStatistich))
.LVL234:
	call _Z9chainMenuPFvhE
.LM331:
	ldi r24,lo8(-125)
	rjmp .L284
.LVL235:
.L237:
.LM332:
	ldi r24,lo8(gs(_Z18menuProcStatistic2h))
	ldi r25,hi8(gs(_Z18menuProcStatistic2h))
.LVL236:
	call _Z9chainMenuPFvhE
.LM333:
	ldi r24,lo8(-126)
	rjmp .L284
.LVL237:
.L232:
.LM334:
	lds r24,s_timerState
.LVL238:
	cpi r24,lo8(2)
	brne .L229
.LM335:
	ldi r24,lo8(3)
	sts s_timerState,r24
	rjmp .L287
.LVL239:
.L236:
.LM336:
	sts s_timerState,__zero_reg__
.LM337:
	sts (s_timeCumAbs)+1,__zero_reg__
	sts s_timeCumAbs,__zero_reg__
.LM338:
	sts (s_timeCumThr)+1,__zero_reg__
	sts s_timeCumThr,__zero_reg__
.LM339:
	sts (s_timeCum16ThrP)+1,__zero_reg__
	sts s_timeCum16ThrP,__zero_reg__
	rjmp .L287
.L241:
.LM340:
	lds r24,_ZZ9menuProc0hE3sub
.LVL240:
	mov r16,r24
	ldi r17,lo8(0)
	call _Z11lastPopMenuv
	lsl r16
	rol r17
	subi r16,lo8(-(_ZZ9menuProc0hE13s_lastPopMenu))
	sbci r17,hi8(-(_ZZ9menuProc0hE13s_lastPopMenu))
	movw r26,r16
	st X+,r24
	st X,r25
.LVL241:
.L242:
.LM341:
	ldi r24,lo8(1)
.LVL242:
	call _Z10killEventsh
.LM342:
	ldi r24,lo8(3)
	call _Z10killEventsh
.LM343:
	ldi r24,lo8(2)
.L284:
	call _Z10killEventsh
.LVL243:
.L229:
.LM344:
	ldi r18,lo8(0)
	lds r24,_ZZ9menuProc0hE3sub
.LVL244:
	tst r24
	brne .L251
	ldi r18,lo8(1)
.L251:
	ldi r24,lo8(12)
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ9menuProc0hE3__c)
	ldi r21,hi8(_ZZ9menuProc0hE3__c)
	call _Z11lcd_putsAtthhPKch
.LM345:
	lds r20,g_model+19
	clr r21
	sbrc r20,7
	com r21
	lsl r20
	rol r21
	lsl r20
	rol r21
	subi r20,lo8(-(_ZZ9menuProc0hE3__c_0))
	sbci r21,hi8(-(_ZZ9menuProc0hE3__c_0))
	ldi r24,lo8(12)
	ldi r22,lo8(8)
	ldi r18,lo8(4)
	ldi r16,lo8(0)
	call _Z12lcd_putsnAtthhPKchh
.LM346:
	lds r20,g_model+18
	clr r21
	sbrc r20,7
	com r21
	lsl r20
	rol r21
	lsl r20
	rol r21
	subi r20,lo8(-(_ZZ9menuProc0hE3__c_1))
	sbci r21,hi8(-(_ZZ9menuProc0hE3__c_1))
	ldi r24,lo8(12)
	ldi r22,lo8(16)
	ldi r18,lo8(4)
	call _Z12lcd_putsnAtthhPKchh
.LM347:
	lds r24,_ZZ9menuProc0hE3sub
	cpi r24,lo8(1)
	breq .L252
	ldi r16,lo8(16)
	rjmp .L253
.L252:
	ldi r16,lo8(17)
.L253:
	ldi r24,lo8(42)
	ldi r22,lo8(0)
	ldi r20,lo8(g_model)
	ldi r21,hi8(g_model)
	ldi r18,lo8(10)
	call _Z12lcd_putsnAtthhPKchh
.LM348:
	ldi r24,lo8(42)
	ldi r22,lo8(8)
	ldi r20,lo8(_ZZ9menuProc0hE3__c_2)
	ldi r21,hi8(_ZZ9menuProc0hE3__c_2)
	call _Z10lcd_puts_PhhPKc
.LM349:
	lds r25,g_vbat100mV
	lds r24,g_eeGeneral+29
	cp r25,r24
	brlo .L254
	ldi r20,lo8(0)
	rjmp .L255
.L254:
	ldi r20,lo8(2)
.L255:
	ldi r24,lo8(60)
	ldi r22,lo8(8)
	call _Z8putsVBathhh
.LM350:
	lds r24,s_timerState
	tst r24
	breq .L256
.LBB425:
.LM351:
	cpi r24,lo8(2)
	breq .L257
	ldi r16,lo8(-128)
.LVL245:
	rjmp .L258
.LVL246:
.L257:
	ldi r16,lo8(-126)
.LVL247:
.L258:
.LM352:
	lds r20,s_timerVal
	lds r21,(s_timerVal)+1
	ldi r24,lo8(60)
	ldi r22,lo8(16)
	mov r18,r16
	call _Z8putsTimehhihh
.LM353:
	lds r20,g_model+11
	ldi r21,lo8(0)
	lsl r20
	rol r21
	lsl r20
	rol r21
	subi r20,lo8(-(_ZZ9menuProc0hE3__c_3-4))
	sbci r21,hi8(-(_ZZ9menuProc0hE3__c_3-4))
	ldi r24,lo8(42)
	ldi r22,lo8(16)
	ldi r18,lo8(4)
	ldi r16,lo8(0)
.LVL248:
	call _Z12lcd_putsnAtthhPKchh
.L256:
	ldi r27,lo8(g_model+171)
	mov r12,r27
	ldi r27,hi8(g_model+171)
	mov r13,r27
	clr r8
	clr r9
.LBE425:
.LBB426:
.LBB427:
.LM354:
	ldi r26,lo8(31)
	mov r11,r26
.LVL249:
.L266:
.LM355:
	movw r30,r8
	subi r30,lo8(-(_ZZ9menuProc0hE1x))
	sbci r31,hi8(-(_ZZ9menuProc0hE1x))
	ld r14,Z
.LM356:
	movw r30,r12
	ld r24,Z
	sbrc r24,7
	subi r24,lo8(-(3))
.L259:
	asr r24
	asr r24
.LVL250:
	cpi r24,lo8(-28)
	brge .L260
	ldi r24,lo8(-28)
.L260:
	mov r16,r24
	cpi r24,lo8(29)
	brlt .L261
	ldi r16,lo8(28)
.LVL251:
.L261:
.LM357:
	movw r30,r8
	subi r30,lo8(-(_ZZ9menuProc0hE4vert))
	sbci r31,hi8(-(_ZZ9menuProc0hE4vert))
	ld r24,Z
	tst r24
	breq .L262
.LM358:
	mov r24,r14
	ldi r22,lo8(4)
	ldi r20,lo8(54)
	call _Z9lcd_vlinehha
.LM359:
	lds r24,g_eeGeneral+50
	ldi r25,lo8(0)
	eor r24,r8
	eor r25,r9
	sbrc r24,0
	rjmp .L263
	lds r24,g_model+18
	cpi r24,lo8(1)
	breq .L264
.L263:
.LM360:
	mov r24,r14
	subi r24,lo8(-(-1))
	ldi r22,lo8(30)
	ldi r20,lo8(3)
	call _Z9lcd_vlinehha
.LM361:
	mov r24,r14
	subi r24,lo8(-(1))
	ldi r22,lo8(30)
	ldi r20,lo8(3)
	call _Z9lcd_vlinehha
.L264:
.LM362:
	mov r25,r11
.LVL252:
	sub r25,r16
	rjmp .L265
.LVL253:
.L262:
.LM363:
	mov r24,r14
	subi r24,lo8(-(-27))
	ldi r22,lo8(60)
	ldi r20,lo8(54)
	call _Z9lcd_hlinehha
.LM364:
	mov r17,r14
	subi r17,lo8(-(-1))
	mov r24,r17
	ldi r22,lo8(59)
	ldi r20,lo8(3)
	call _Z9lcd_hlinehha
.LM365:
	mov r24,r17
	ldi r22,lo8(61)
	ldi r20,lo8(3)
	call _Z9lcd_hlinehha
.LM366:
	add r14,r16
	ldi r25,lo8(60)
.LVL254:
.L265:
.LM367:
	mov r17,r14
	subi r17,lo8(-(-3))
	mov r16,r25
.LVL255:
	subi r16,lo8(-(-3))
	mov r24,r17
	mov r22,r16
	ldi r20,lo8(7)
	std Y+1,r25
.LVL256:
	call _Z9lcd_vlinehha
.LM368:
	ldd r25,Y+1
	subi r25,lo8(-(3))
.LVL257:
	mov r24,r17
	mov r22,r25
	ldi r20,lo8(7)
	call _Z9lcd_hlinehha
.LVL258:
.LM369:
	mov r24,r14
	subi r24,lo8(-(3))
	mov r22,r16
	ldi r20,lo8(7)
	call _Z9lcd_vlinehha
.LM370:
	mov r24,r17
	mov r22,r16
	ldi r20,lo8(7)
	call _Z9lcd_hlinehha
	sec
	adc r8,__zero_reg__
	adc r9,__zero_reg__
	ldi r24,lo8(3)
	ldi r25,hi8(3)
	add r12,r24
	adc r13,r25
.LBE427:
.LM371:
	ldi r25,lo8(4)
	cp r8,r25
	cpc r9,__zero_reg__
	breq .+2
	rjmp .L266
	ldi r31,lo8(g_chans512)
	mov r12,r31
	ldi r31,hi8(g_chans512)
	mov r13,r31
	clr r6
	clr r7
.LBE426:
.LBB428:
.LBB429:
.LBB430:
.LM372:
	ldi r30,lo8(27)
	mov r8,r30
	mov r9,__zero_reg__
.LM373:
	ldi r23,lo8(25)
	mov r10,r23
	mov r11,__zero_reg__
.LVL259:
.L276:
.LBE430:
.LBE429:
.LBE428:
.LBB433:
.LM374:
	mov r30,r6
.LVL260:
.LBE433:
.LBB434:
.LBB432:
.LM375:
	lds r24,g_eeGeneral+48
	tst r24
	breq .L268
	cpi r24,lo8(1)
	breq .+2
	rjmp .L267
	rjmp .L293
.L268:
.LBB431:
.LM376:
	movw r26,r12
	ld r16,X+
	ld r17,X
.LVL261:
	movw r24,r6
	andi r24,lo8(3)
	andi r25,hi8(3)
	mul r24,r8
	movw r14,r0
	mul r24,r9
	add r15,r0
	mul r25,r8
	add r15,r0
	clr r1
.LVL262:
	lsr r30
	lsr r30
	ldi r31,lo8(0)
	adiw r30,5
.LVL263:
	ldi r22,3
1:	lsl r30
	rol r31
	dec r22
	brne 1b
	movw r24,r16
	ldi r22,lo8(16)
	ldi r23,hi8(16)
	call __divmodhi4
	movw r18,r16
	lsl r18
	rol r19
	sub r18,r22
	sbc r19,r23
	movw r24,r16
	ldi r22,lo8(64)
	ldi r23,hi8(64)
	call __divmodhi4
	add r18,r22
	adc r19,r23
	mov r24,r14
	subi r24,lo8(-(33))
	mov r22,r30
	movw r20,r18
	ldi r18,lo8(32)
	call _Z13lcd_outdezAtthhih
	rjmp .L267
.LVL264:
.L293:
.LM377:
	cpi r30,lo8(4)
	brsh .L270
	ldi r17,lo8(36)
.LVL265:
	rjmp .L271
.L270:
	ldi r17,lo8(92)
.LVL266:
.L271:
.LM378:
	movw r18,r6
	andi r18,lo8(3)
	andi r19,hi8(3)
	movw r24,r18
	lsl r24
	rol r25
	lsl r24
	rol r25
	add r24,r18
	adc r25,r19
	mov r16,r24
	subi r16,lo8(-(38))
.LM379:
	movw r30,r12
.LVL267:
	ld r18,Z
	ldd r19,Z+1
	movw r24,r18
	ldi r22,lo8(128)
	ldi r23,hi8(128)
	call __divmodhi4
	movw r30,r22
	movw r24,r18
	ldi r22,lo8(32)
	ldi r23,hi8(32)
	call __divmodhi4
	sub r30,r22
	sbc r31,r23
	movw r24,r18
	ldi r22,lo8(2)
	ldi r23,hi8(2)
	call __divmodhi4
	lsl r22
	rol r23
	add r30,r22
	adc r31,r23
	sbrs r31,7
	rjmp .L272
	com r31
	neg r30
	sbci r31,lo8(-1)
.L272:
	mul r30,r10
	movw r24,r0
	mul r30,r11
	add r25,r0
	mul r31,r10
	add r25,r0
	clr r1
	subi r24,lo8(-(300))
	sbci r25,hi8(-(300))
	mov r24,r25
	lsl r25
	sbc r25,r25
	asr r24
	mov r14,r24
.LVL268:
	ldi r31,lo8(25)
	cp r31,r24
	brge .L273
.LVL269:
	ldi r24,lo8(25)
	mov r14,r24
.LVL270:
.L273:
.LM380:
	mov r24,r17
	subi r24,lo8(-(-25))
	mov r22,r16
	ldi r20,lo8(51)
	ldi r18,lo8(85)
	call _Z13lcd_hlineStiphhah
.LM381:
	mov r22,r16
	subi r22,lo8(-(-2))
	mov r24,r17
	ldi r20,lo8(5)
	call _Z9lcd_vlinehha
.LM382:
	movw r26,r12
	ld r24,X+
	ld r25,X
	cp __zero_reg__,r24
	cpc __zero_reg__,r25
	brge .L274
.LM383:
	subi r17,lo8(-(1))
.LVL271:
	rjmp .L275
.L274:
.LM384:
	sub r17,r14
.LVL272:
.L275:
.LM385:
	subi r16,lo8(-(1))
	mov r24,r17
	mov r22,r16
	mov r20,r14
	call _Z9lcd_hlinehha
.LM386:
	subi r16,lo8(-(-2))
	mov r24,r17
	mov r22,r16
	mov r20,r14
	call _Z9lcd_hlinehha
.LVL273:
.L267:
	sec
	adc r6,__zero_reg__
	adc r7,__zero_reg__
	ldi r30,lo8(2)
	ldi r31,hi8(2)
.LVL274:
	add r12,r30
	adc r13,r31
.LBE431:
.LBE432:
.LM387:
	ldi r31,lo8(8)
	cp r6,r31
	cpc r7,__zero_reg__
	breq .+2
	rjmp .L276
	rjmp .L294
.LVL275:
.L249:
.LBE434:
.LM388:
	lds r24,_ZZ9menuProc0hE3sub
	tst r24
	brne .+2
	rjmp .L277
	rjmp .L229
.L250:
.LM389:
	lds r24,_ZZ9menuProc0hE3sub
	tst r24
	breq .+2
	rjmp .L278
	rjmp .L229
.LVL276:
.L294:
/* epilogue start */
.LBE422:
.LM390:
	pop __tmp_reg__
	pop r28
	pop r29
	pop r17
.LVL277:
	pop r16
.LVL278:
	pop r15
	pop r14
.LVL279:
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	ret
.LFE43:
	.size	_Z9menuProc0h, .-_Z9menuProc0h
.global	_Z18menuProcStatistic2h
	.type	_Z18menuProcStatistic2h, @function
_Z18menuProcStatistic2h:
.LFB41:
.LM391:
.LVL280:
	push r17
/* prologue: function */
/* frame size = 0 */
	mov r17,r24
.LBB435:
.LM392:
	ldi r24,lo8(0)
.LVL281:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ18menuProcStatistic2hE3__c)
	ldi r21,hi8(_ZZ18menuProcStatistic2hE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM393:
	cpi r17,lo8(98)
	breq .L299
	cpi r17,lo8(99)
	brsh .L300
	cpi r17,lo8(96)
	breq .L297
	cpi r17,lo8(97)
	brne .L296
	rjmp .L298
.L300:
	cpi r17,lo8(99)
	brne .L296
	rjmp .L298
.L297:
.LM394:
	ldi r24,lo8(2047)
	ldi r25,hi8(2047)
	sts (g_tmr1Latency_min)+1,r25
	sts g_tmr1Latency_min,r24
.LM395:
	sts (g_tmr1Latency_max)+1,__zero_reg__
	sts g_tmr1Latency_max,__zero_reg__
.LM396:
	sts (g_timeMain)+1,__zero_reg__
	sts g_timeMain,__zero_reg__
.LBB436:
.LBB437:
.LM397:
	lds r24,g_beepVal
	sts g_beepCnt,r24
	rjmp .L296
.L299:
.LBE437:
.LBE436:
.LM398:
	ldi r24,lo8(gs(_Z17menuProcStatistich))
	ldi r25,hi8(gs(_Z17menuProcStatistich))
	rjmp .L302
.L298:
.LM399:
	ldi r24,lo8(gs(_Z9menuProc0h))
	ldi r25,hi8(gs(_Z9menuProc0h))
.L302:
	call _Z9chainMenuPFvhE
.L296:
.LM400:
	ldi r24,lo8(0)
	ldi r22,lo8(8)
	ldi r20,lo8(_ZZ18menuProcStatistic2hE3__c_0)
	ldi r21,hi8(_ZZ18menuProcStatistic2hE3__c_0)
	call _Z10lcd_puts_PhhPKc
.LM401:
	lds r20,g_tmr1Latency_max
	lds r21,(g_tmr1Latency_max)+1
	lsr r21
	ror r20
	ldi r24,lo8(84)
	ldi r22,lo8(8)
	call _Z10lcd_outdezhhi
.LM402:
	ldi r24,lo8(0)
	ldi r22,lo8(16)
	ldi r20,lo8(_ZZ18menuProcStatistic2hE3__c_1)
	ldi r21,hi8(_ZZ18menuProcStatistic2hE3__c_1)
	call _Z10lcd_puts_PhhPKc
.LM403:
	lds r20,g_tmr1Latency_min
	lds r21,(g_tmr1Latency_min)+1
	lsr r21
	ror r20
	ldi r24,lo8(84)
	ldi r22,lo8(16)
	call _Z10lcd_outdezhhi
.LM404:
	ldi r24,lo8(0)
	ldi r22,lo8(24)
	ldi r20,lo8(_ZZ18menuProcStatistic2hE3__c_2)
	ldi r21,hi8(_ZZ18menuProcStatistic2hE3__c_2)
	call _Z10lcd_puts_PhhPKc
.LM405:
	lds r20,g_tmr1Latency_max
	lds r21,(g_tmr1Latency_max)+1
	lds r24,g_tmr1Latency_min
	lds r25,(g_tmr1Latency_min)+1
	sub r20,r24
	sbc r21,r25
	lsr r21
	ror r20
	ldi r24,lo8(84)
	ldi r22,lo8(24)
	call _Z10lcd_outdezhhi
.LM406:
	ldi r24,lo8(0)
	ldi r22,lo8(32)
	ldi r20,lo8(_ZZ18menuProcStatistic2hE3__c_3)
	ldi r21,hi8(_ZZ18menuProcStatistic2hE3__c_3)
	call _Z10lcd_puts_PhhPKc
.LM407:
	lds r20,g_timeMain
	lds r21,(g_timeMain)+1
	ldi r19,4
1:	lsr r21
	ror r20
	dec r19
	brne 1b
	ldi r24,lo8(84)
	ldi r22,lo8(32)
	call _Z10lcd_outdezhhi
/* epilogue start */
.LBE435:
.LM408:
	pop r17
.LVL282:
	ret
.LFE41:
	.size	_Z18menuProcStatistic2h, .-_Z18menuProcStatistic2h
.global	_Z12editExpoValshhbhhh
	.type	_Z12editExpoValshhbhhh, @function
_Z12editExpoValshhbhhh:
.LFB25:
.LM409:
.LVL283:
	push r14
.LVL284:
	push r15
	push r16
.LVL285:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	mov r15,r24
	mov r17,r20
.LBB438:
.LM410:
	tst r20
	brne .L304
.LVL286:
	ldi r19,lo8(0)
.LVL287:
	rjmp .L305
.LVL288:
.L304:
	ldi r19,lo8(2)
.LVL289:
.L305:
.LM411:
	cpi r22,lo8(2)
	brne .+2
	rjmp .L309
	cpi r22,lo8(3)
	brsh .L312
	tst r22
	breq .L307
	cpi r22,lo8(1)
	breq .+2
	rjmp .L313
	rjmp .L317
.L312:
	cpi r22,lo8(3)
	brne .+2
	rjmp .L310
	cpi r22,lo8(4)
	breq .+2
	rjmp .L313
	rjmp .L318
.L307:
.LM412:
	mov r24,r14
.LVL290:
	ldi r25,lo8(0)
	movw r28,r24
	lsl r28
	rol r29
	lsl r28
	rol r29
	add r28,r24
	adc r29,r25
	movw r30,r28
	subi r30,lo8(-(g_model+263))
	sbci r31,hi8(-(g_model+263))
	ld r20,Z
.LVL291:
	clr r21
	sbrc r20,7
	com r21
	mov r24,r18
	mov r22,r16
.LVL292:
	mov r18,r19
.LVL293:
	call _Z13lcd_outdezAtthhih
.LVL294:
.LM413:
	tst r17
	brne .+2
	rjmp .L313
.LBB439:
.LBB440:
.LM414:
	movw r22,r28
	subi r22,lo8(-(g_model+263))
	sbci r23,hi8(-(g_model+263))
	rjmp .L315
.LVL295:
.L317:
.LBE440:
.LBE439:
.LM415:
	mov r24,r14
.LVL296:
	ldi r25,lo8(0)
	movw r28,r24
	lsl r28
	rol r29
	lsl r28
	rol r29
.LVL297:
	add r28,r24
	adc r29,r25
	movw r30,r28
	subi r30,lo8(-(g_model+266))
	sbci r31,hi8(-(g_model+266))
	ld r20,Z
	clr r21
	sbrc r20,7
	com r21
	subi r20,lo8(-(100))
	sbci r21,hi8(-(100))
	mov r24,r18
	mov r22,r16
.LVL298:
	mov r18,r19
.LVL299:
	call _Z13lcd_outdezAtthhih
.LVL300:
.LM416:
	tst r17
	brne .+2
	rjmp .L313
.LBB441:
.LBB442:
.LM417:
	movw r22,r28
	subi r22,lo8(-(g_model+266))
	sbci r23,hi8(-(g_model+266))
	rjmp .L316
.LVL301:
.L309:
.LBE442:
.LBE441:
.LM418:
	mov r24,r14
.LVL302:
	ldi r25,lo8(0)
	movw r28,r24
	lsl r28
	rol r29
	lsl r28
	rol r29
	add r28,r24
	adc r29,r25
	movw r30,r28
	subi r30,lo8(-(g_model+265))
	sbci r31,hi8(-(g_model+265))
	mov r24,r18
	mov r22,r16
.LVL303:
	ld r20,Z
.LVL304:
	mov r18,r19
.LVL305:
	call _Z14putsDrSwitcheshhah
.LVL306:
.LM419:
	tst r17
	brne .+2
	rjmp .L313
.LBB443:
.LBB444:
.LM420:
	movw r22,r28
	subi r22,lo8(-(g_model+265))
	sbci r23,hi8(-(g_model+265))
	mov r24,r15
	ldi r20,lo8(0)
	ldi r21,hi8(0)
	ldi r18,lo8(10)
	ldi r19,hi8(10)
	rjmp .L314
.LVL307:
.L310:
.LBE444:
.LBE443:
.LM421:
	mov r24,r14
.LVL308:
	ldi r25,lo8(0)
	movw r28,r24
	lsl r28
	rol r29
	lsl r28
	rol r29
	add r28,r24
	adc r29,r25
	movw r30,r28
	subi r30,lo8(-(g_model+264))
	sbci r31,hi8(-(g_model+264))
	ld r20,Z
.LVL309:
	clr r21
	sbrc r20,7
	com r21
	mov r24,r18
	mov r22,r16
.LVL310:
	mov r18,r19
.LVL311:
	call _Z13lcd_outdezAtthhih
.LVL312:
.LM422:
	tst r17
	breq .L313
.LBB445:
.LBB446:
.LM423:
	movw r22,r28
	subi r22,lo8(-(g_model+264))
	sbci r23,hi8(-(g_model+264))
.L315:
	mov r24,r15
	ldi r20,lo8(-100)
	ldi r21,hi8(-100)
	ldi r18,lo8(100)
	ldi r19,hi8(100)
	rjmp .L314
.LVL313:
.L318:
.LBE446:
.LBE445:
.LM424:
	mov r24,r14
.LVL314:
	ldi r25,lo8(0)
	movw r28,r24
	lsl r28
	rol r29
	lsl r28
	rol r29
	add r28,r24
	adc r29,r25
	movw r30,r28
	subi r30,lo8(-(g_model+267))
	sbci r31,hi8(-(g_model+267))
	ld r20,Z
.LVL315:
	clr r21
	sbrc r20,7
	com r21
	subi r20,lo8(-(100))
	sbci r21,hi8(-(100))
	mov r24,r18
	mov r22,r16
.LVL316:
	mov r18,r19
.LVL317:
	call _Z13lcd_outdezAtthhih
.LVL318:
.LM425:
	tst r17
	breq .L313
.LBB447:
.LBB448:
.LM426:
	movw r22,r28
	subi r22,lo8(-(g_model+267))
	sbci r23,hi8(-(g_model+267))
.L316:
	mov r24,r15
	ldi r20,lo8(-100)
	ldi r21,hi8(-100)
	ldi r18,lo8(0)
	ldi r19,hi8(0)
.L314:
	ldi r16,lo8(2)
.LVL319:
	call _Z15checkIncDecGen2hPviih
.LVL320:
.L313:
/* epilogue start */
.LBE448:
.LBE447:
.LBE438:
.LM427:
	pop r29
	pop r28
	pop r17
.LVL321:
	pop r16
.LVL322:
	pop r15
.LVL323:
	pop r14
.LVL324:
	ret
.LFE25:
	.size	_Z12editExpoValshhbhhh, .-_Z12editExpoValshhbhhh
.global	_ZN7MState25checkEhhPPFvhEhPhhh
	.type	_ZN7MState25checkEhhPPFvhEhPhhh, @function
_ZN7MState25checkEhhPPFvhEhPhhh:
.LFB15:
.LM428:
.LVL325:
	push r8
	push r9
	push r10
.LVL326:
	push r11
	push r12
.LVL327:
	push r13
	push r14
.LVL328:
	push r15
	push r16
.LVL329:
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	movw r28,r24
	mov r17,r22
	movw r8,r18
	mov r11,r16
.LVL330:
.LBB449:
.LM429:
	cp r18,__zero_reg__
	cpc r19,__zero_reg__
	brne .+2
	rjmp .L320
.LVL331:
.LBB450:
.LM430:
	mov r13,r20
	dec r13
.LVL332:
.LM431:
	ld r24,Y
	tst r24
	breq .L321
	ldi r16,lo8(1)
.LVL333:
	rjmp .L322
.LVL334:
.L321:
.LM432:
	cpi r22,lo8(100)
	breq .L324
.LVL335:
	cpi r22,lo8(101)
	brne .L323
.LM433:
	tst r13
	breq .L323
.LBB451:
.LM434:
	mov r30,r13
.LVL336:
	ldi r31,lo8(0)
.LVL337:
	sbiw r30,1
.LVL338:
	lsl r30
	rol r31
	add r30,r18
	adc r31,r19
.LBE451:
/* #APP */
 ;  85 "../src/menus.cpp" 1
	lpm r24, Z+
	lpm r25, Z
	
 ;  0 "" 2
/* #NOAPP */
	rjmp .L362
.LVL339:
.L324:
.LM435:
	mov r18,r13
.LVL340:
	ldi r19,lo8(0)
.LVL341:
	mov r24,r16
	ldi r25,lo8(0)
.LVL342:
	sbiw r24,1
.LVL343:
	cp r18,r24
	cpc r19,r25
	brge .L323
.LVL344:
.LBB452:
.LM436:
	movw r30,r18
.LVL345:
	adiw r30,1
	lsl r30
	rol r31
.LVL346:
	add r30,r8
	adc r31,r9
.LBE452:
/* #APP */
 ;  90 "../src/menus.cpp" 1
	lpm r24, Z+
	lpm r25, Z
	
 ;  0 "" 2
.LVL347:
/* #NOAPP */
.L362:
	call _Z9chainMenuPFvhE
.LVL348:
.L323:
	ldi r16,lo8(2)
.LVL349:
.L322:
.LM437:
	ldi r24,lo8(48)
	add r11,r24
	ldi r24,lo8(122)
	ldi r22,lo8(0)
	mov r20,r11
	mov r18,r16
	call _Z11lcd_putcAtthhch
.LVL350:
.LM438:
	ldi r24,lo8(116)
	ldi r22,lo8(0)
	ldi r20,lo8(47)
	mov r18,r16
	call _Z11lcd_putcAtthhch
.LM439:
	ldi r24,lo8(49)
	add r13,r24
	ldi r24,lo8(110)
	ldi r22,lo8(0)
	mov r20,r13
	mov r18,r16
	call _Z11lcd_putcAtthhch
.LVL351:
.L320:
.LBE450:
.LM440:
	cp r14,__zero_reg__
	cpc r15,__zero_reg__
.LVL352:
	brne .L326
	ldi r16,lo8(0)
.LVL353:
	rjmp .L327
.LVL354:
.L326:
.LBB453:
	ld r24,Y
.LVL355:
	cp r24,r12
	brsh .L328
	mov r12,r24
.L328:
	movw r30,r14
	add r30,r12
	adc r31,__zero_reg__
/* #APP */
 ;  103 "../src/menus.cpp" 1
	lpm r16, Z
	
 ;  0 "" 2
.LVL356:
/* #NOAPP */
.LBE453:
	subi r16,lo8(-(-1))
.LVL357:
.L327:
.LM441:
	cpi r17,lo8(98)
	brne .+2
	rjmp .L335
	cpi r17,lo8(99)
	brsh .L341
	cpi r17,lo8(35)
	brne .+2
	rjmp .L332
	cpi r17,lo8(36)
	brsh .L342
	cpi r17,lo8(33)
	breq .L330
	cpi r17,lo8(34)
	breq .+2
	rjmp .L360
	rjmp .L367
.L342:
	cpi r17,lo8(66)
	brne .+2
	rjmp .L333
	cpi r17,lo8(67)
	breq .+2
	rjmp .L360
	rjmp .L368
.L341:
	cpi r17,lo8(-126)
	breq .L338
	cpi r17,lo8(-125)
	brsh .L343
	cpi r17,lo8(99)
	brne .+2
	rjmp .L336
	cpi r17,lo8(-127)
	breq .+2
	rjmp .L360
	rjmp .L369
.L343:
	cpi r17,lo8(-125)
	brne .+2
	rjmp .L339
	cpi r17,lo8(-65)
	breq .+2
	rjmp .L360
.LM442:
	st Y,__zero_reg__
	rjmp .L360
.L369:
.LM443:
	ldi r24,lo8(1)
	rjmp .L361
.LVL358:
.L330:
.LM444:
	ld r24,Y
	tst r24
	breq .L344
	or r8,r9
	brne .L345
.L344:
.LM445:
	ldi r24,lo8(0)
.L361:
	call _Z7popMenub
.LVL359:
	rjmp .L360
.LVL360:
.L345:
.LBB454:
.LBB455:
.LM446:
	lds r24,g_beepVal
	sts g_beepCnt,r24
.LBE455:
.LBE454:
.LBB456:
.LBB457:
.LM447:
	std Y+1,__zero_reg__
	rjmp .L351
.LVL361:
.L367:
.LBE457:
.LBE456:
.LM448:
	or r14,r15
	brne .+2
	rjmp .L360
.LM449:
	ld r24,Y
	cp r24,r10
.LVL362:
	brsh .L346
	subi r24,lo8(-(1))
	rjmp .L366
.L346:
	st Y,__zero_reg__
	rjmp .L354
.LVL363:
.L338:
.LM450:
	or r14,r15
	brne .+2
	rjmp .L360
.LM451:
	ldi r24,lo8(-126)
	call _Z10killEventsh
.LVL364:
.LM452:
	ldd r24,Y+1
	cp r24,r16
	brsh .L349
	subi r24,lo8(-(1))
	rjmp .L364
.L349:
	std Y+1,__zero_reg__
	rjmp .L359
.LVL365:
.L333:
.LM453:
	ld r24,Y
	cp r24,r10
.LVL366:
	breq .L360
.LVL367:
.L335:
.LM454:
	or r14,r15
	brne .L360
.LM455:
	ld r24,Y
	cp r24,r10
	brsh .L351
	subi r24,lo8(-(1))
	rjmp .L363
.L351:
	st Y,__zero_reg__
	rjmp .L359
.LVL368:
.L332:
.LM456:
	or r14,r15
	breq .L360
.LM457:
	ld r24,Y
	tst r24
	breq .L353
	subi r24,lo8(-(-1))
.LVL369:
.L366:
	st Y,r24
	rjmp .L354
.LVL370:
.L353:
	st Y,r10
.LVL371:
.L354:
.LM458:
	ldd r24,Y+1
.LVL372:
	mov r12,r16
.LVL373:
	cp r24,r16
	brsh .L355
	mov r12,r24
.L355:
	std Y+1,r12
	rjmp .L359
.LVL374:
.L339:
.LM459:
	or r14,r15
	breq .L360
.LM460:
	ldi r24,lo8(-125)
	call _Z10killEventsh
.LVL375:
.LM461:
	ldd r24,Y+1
	tst r24
	breq .L356
	subi r24,lo8(-(-1))
.L364:
	std Y+1,r24
	rjmp .L359
.L356:
	std Y+1,r16
	rjmp .L359
.LVL376:
.L368:
.LM462:
	ld r24,Y
	tst r24
	breq .L360
.LVL377:
.L336:
.LM463:
	or r14,r15
	brne .L360
.LM464:
	ld r24,Y
	tst r24
	breq .L358
	subi r24,lo8(-(-1))
.LVL378:
.L363:
	st Y,r24
	rjmp .L359
.LVL379:
.L358:
	st Y,r10
.LVL380:
.L359:
.LM465:
	ldi r24,lo8(96)
	sts g_blinkTmr10ms,r24
.LVL381:
.L360:
/* epilogue start */
.LBE449:
.LM466:
	pop r29
	pop r28
.LVL382:
	pop r17
.LVL383:
	pop r16
.LVL384:
	pop r15
	pop r14
.LVL385:
	pop r13
.LVL386:
	pop r12
.LVL387:
	pop r11
.LVL388:
	pop r10
.LVL389:
	pop r9
	pop r8
.LVL390:
	ret
.LFE15:
	.size	_ZN7MState25checkEhhPPFvhEhPhhh, .-_ZN7MState25checkEhhPPFvhEhPhhh
.global	_Z15menuProcTrainerh
	.type	_Z15menuProcTrainerh, @function
_Z15menuProcTrainerh:
.LFB36:
.LM467:
.LVL391:
	push r10
	push r11
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
	mov r11,r24
.LBB458:
.LM468:
	ldi r24,lo8(0)
.LVL392:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ15menuProcTrainerhE3__c)
	ldi r21,hi8(_ZZ15menuProcTrainerhE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM469:
	ldi r24,lo8(_ZZ15menuProcTrainerhE7mstate2)
	ldi r25,hi8(_ZZ15menuProcTrainerhE7mstate2)
	mov r22,r11
	ldi r20,lo8(3)
	ldi r18,lo8(menuTabDiag)
	ldi r19,hi8(menuTabDiag)
	ldi r16,lo8(7)
	ldi r21,lo8(_ZZ15menuProcTrainerhE10mstate_tab)
	mov r14,r21
	ldi r21,hi8(_ZZ15menuProcTrainerhE10mstate_tab)
	mov r15,r21
	clr r12
	inc r12
	ldi r17,lo8(5)
	mov r10,r17
	call _ZN7MState25checkEhhPPFvhEhPhhh
.LM470:
	lds r10,_ZZ15menuProcTrainerhE7mstate2
.LVL393:
	dec r10
.LM471:
	lds r14,_ZZ15menuProcTrainerhE7mstate2+1
.LVL394:
	inc r14
.LM472:
	ldi r24,lo8(18)
	ldi r22,lo8(8)
	ldi r20,lo8(_ZZ15menuProcTrainerhE3__c_0)
	ldi r21,hi8(_ZZ15menuProcTrainerhE3__c_0)
	call _Z10lcd_puts_PhhPKc
	ldi r28,lo8(0)
	ldi r29,hi8(0)
	ldi r27,lo8(16)
	mov r15,r27
.LBB459:
.LBB460:
.LM473:
	mov r12,r10
	clr r13
	sbrc r12,7
	com r13
.LVL395:
.L398:
.LBE460:
.LBE459:
.LM474:
	movw r24,r28
	subi r24,lo8(-(1))
	mov r20,r24
.LVL396:
.LBB462:
.LBB461:
.LM475:
	cp r12,r28
	cpc r13,r29
	breq .L371
	ldi r18,lo8(0)
	rjmp .L372
.L371:
	tst r14
	breq .L373
	ldi r18,lo8(1)
	rjmp .L372
.L373:
	ldi r18,lo8(2)
.L372:
	ldi r24,lo8(0)
	mov r22,r15
	call _Z10putsChnRawhhhh
.LVL397:
.LM476:
	cp r12,r28
	cpc r13,r29
	breq .L374
	ldi r17,lo8(0)
.LVL398:
	rjmp .L375
.LVL399:
.L374:
	ldi r17,lo8(0)
.LVL400:
	ldi r25,lo8(1)
	cp r14,r25
	brne .L375
	ldi r17,lo8(1)
.L375:
.LM477:
	movw r30,r28
	lsl r30
	rol r31
	subi r30,lo8(-(g_eeGeneral+41))
	sbci r31,hi8(-(g_eeGeneral+41))
	ld r24,Z
	swap r24
	lsr r24
	lsr r24
	andi r24,0x3
	tst r17
	brne .L377
	ldi r16,lo8(0)
	rjmp .L378
.L377:
	ldi r16,lo8(2)
.L378:
.LM478:
	ldi r25,lo8(0)
	movw r20,r24
	lsl r20
	rol r21
	add r20,r24
	adc r21,r25
	subi r20,lo8(-(_ZZ15menuProcTrainerhE3__c_1))
	sbci r21,hi8(-(_ZZ15menuProcTrainerhE3__c_1))
	ldi r24,lo8(24)
	mov r22,r15
	ldi r18,lo8(3)
	call _Z12lcd_putsnAtthhPKchh
.LM479:
	tst r17
	breq .L379
	movw r16,r28
	lsl r16
	rol r17
	subi r16,lo8(-(g_eeGeneral+41))
	sbci r17,hi8(-(g_eeGeneral+41))
	movw r30,r16
	ld r22,Z
	swap r22
	lsr r22
	lsr r22
	andi r22,0x3
	mov r24,r11
	ldi r20,lo8(0)
	ldi r18,lo8(2)
	call _Z14checkIncDec_hghaaa
	swap r24
	lsl r24
	lsl r24
	andi r24,0xc0
	movw r30,r16
	ld r25,Z
	andi r25,lo8(63)
	or r25,r24
	st Z,r25
.L379:
.LM480:
	cp r12,r28
	cpc r13,r29
	breq .L380
	ldi r17,lo8(0)
.LVL401:
	rjmp .L381
.L380:
	ldi r17,lo8(0)
.LVL402:
	ldi r31,lo8(2)
	cp r14,r31
	brne .L381
	ldi r17,lo8(1)
.L381:
.LM481:
	movw r30,r28
	lsl r30
	rol r31
	subi r30,lo8(-(g_eeGeneral+41))
	sbci r31,hi8(-(g_eeGeneral+41))
	ld r30,Z
	lsl r30
	lsl r30
	asr r30
	asr r30
	tst r17
	brne .L383
	ldi r18,lo8(0)
	rjmp .L384
.L383:
	ldi r18,lo8(2)
.L384:
	ldi r19,lo8(13)
	muls r30,r19
	movw r24,r0
	clr r1
	ldi r22,lo8(4)
	ldi r23,hi8(4)
	call __divmodhi4
	movw r20,r22
	ldi r24,lo8(66)
	mov r22,r15
	call _Z13lcd_outdezAtthhih
.LM482:
	tst r17
	breq .L385
	movw r16,r28
	lsl r16
	rol r17
	subi r16,lo8(-(g_eeGeneral+41))
	sbci r17,hi8(-(g_eeGeneral+41))
	movw r30,r16
	ld r22,Z
	lsl r22
	lsl r22
	asr r22
	asr r22
	mov r24,r11
	ldi r20,lo8(-31)
	ldi r18,lo8(31)
	call _Z14checkIncDec_hghaaa
	andi r24,lo8(63)
	movw r30,r16
	ld r25,Z
	andi r25,lo8(-64)
	or r25,r24
	st Z,r25
.L385:
.LM483:
	cp r12,r28
	cpc r13,r29
	breq .L386
	ldi r17,lo8(0)
.LVL403:
	rjmp .L387
.L386:
	ldi r17,lo8(0)
.LVL404:
	ldi r31,lo8(3)
	cp r14,r31
	brne .L387
	ldi r17,lo8(1)
.L387:
.LM484:
	movw r30,r28
	lsl r30
	rol r31
	subi r30,lo8(-(g_eeGeneral+40))
	sbci r31,hi8(-(g_eeGeneral+40))
	ld r24,Z
	andi r24,lo8(7)
	tst r17
	brne .L389
	ldi r16,lo8(0)
	rjmp .L390
.L389:
	ldi r16,lo8(2)
.L390:
	ldi r25,lo8(0)
	movw r20,r24
	lsl r20
	rol r21
	add r20,r24
	adc r21,r25
	subi r20,lo8(-(_ZZ15menuProcTrainerhE3__c_2))
	sbci r21,hi8(-(_ZZ15menuProcTrainerhE3__c_2))
	ldi r24,lo8(72)
	mov r22,r15
	ldi r18,lo8(3)
	call _Z12lcd_putsnAtthhPKchh
.LM485:
	tst r17
	breq .L391
	movw r16,r28
	lsl r16
	rol r17
	subi r16,lo8(-(g_eeGeneral+40))
	sbci r17,hi8(-(g_eeGeneral+40))
	movw r30,r16
	ld r22,Z
	andi r22,lo8(7)
	mov r24,r11
	ldi r20,lo8(0)
	ldi r18,lo8(3)
	call _Z14checkIncDec_hghaaa
	andi r24,lo8(7)
	movw r30,r16
	ld r25,Z
	andi r25,lo8(-8)
	or r25,r24
	st Z,r25
.L391:
.LM486:
	cp r12,r28
	cpc r13,r29
	breq .L392
	ldi r16,lo8(0)
.LVL405:
	rjmp .L393
.LVL406:
.L392:
	ldi r16,lo8(0)
.LVL407:
	ldi r31,lo8(4)
	cp r14,r31
	brne .L393
	ldi r16,lo8(1)
.L393:
.LM487:
	movw r30,r28
	lsl r30
	rol r31
	subi r30,lo8(-(g_eeGeneral+40))
	sbci r31,hi8(-(g_eeGeneral+40))
	ld r20,Z
	asr r20
	asr r20
	asr r20
	tst r16
	brne .L395
	ldi r18,lo8(0)
	rjmp .L396
.L395:
	ldi r18,lo8(2)
.L396:
	ldi r24,lo8(90)
	mov r22,r15
	call _Z14putsDrSwitcheshhah
.LM488:
	tst r16
	breq .L397
	movw r16,r28
.LVL408:
	lsl r16
	rol r17
	subi r16,lo8(-(g_eeGeneral+40))
	sbci r17,hi8(-(g_eeGeneral+40))
	movw r30,r16
	ld r22,Z
	asr r22
	asr r22
	asr r22
	mov r24,r11
	ldi r20,lo8(-10)
	ldi r18,lo8(10)
	call _Z14checkIncDec_hghaaa
	lsl r24
	lsl r24
	lsl r24
	movw r30,r16
	ld r25,Z
	andi r25,lo8(7)
	or r25,r24
	st Z,r25
.LVL409:
.L397:
	adiw r28,1
	ldi r31,lo8(8)
	add r15,r31
.LBE461:
.LM489:
	ldi r19,lo8(48)
	cp r15,r19
	breq .+2
	rjmp .L398
.LBE462:
.LM490:
	ldi r24,lo8(4)
	cp r10,r24
	breq .L399
	ldi r16,lo8(0)
.LVL410:
	rjmp .L400
.LVL411:
.L399:
	ldi r16,lo8(2)
.LVL412:
.L400:
	ldi r24,lo8(0)
	ldi r22,lo8(56)
	ldi r20,lo8(_ZZ15menuProcTrainerhE3__c_3)
	ldi r21,hi8(_ZZ15menuProcTrainerhE3__c_3)
	ldi r18,lo8(3)
	call _Z12lcd_putsnAtthhPKchh
	ldi r31,lo8(g_ppmIns)
	mov r14,r31
	ldi r31,hi8(g_ppmIns)
	mov r15,r31
.LVL413:
	ldi r28,lo8(g_eeGeneral+32)
	ldi r29,hi8(g_eeGeneral+32)
	ldi r16,lo8(48)
.L401:
.LBB463:
.LBB464:
.LM491:
	movw r30,r14
	ld r20,Z+
	ld r21,Z+
	movw r14,r30
	ld r24,Y+
	ld r25,Y+
	sub r20,r24
	sbc r21,r25
	lsl r20
	rol r21
	mov r24,r16
	ldi r22,lo8(56)
	ldi r18,lo8(32)
	call _Z13lcd_outdezAtthhih
	subi r16,lo8(-(24))
.LBE464:
.LM492:
	cpi r16,lo8(-112)
	brne .L401
.LBE463:
.LM493:
	ldi r31,lo8(4)
	cp r10,r31
	brne .L404
.LM494:
	ldi r19,lo8(96)
	cp r11,r19
	brne .L404
.LM495:
	ldi r26,lo8(g_eeGeneral+32)
	ldi r27,hi8(g_eeGeneral+32)
	ldi r30,lo8(g_ppmIns)
	ldi r31,hi8(g_ppmIns)
	ldi r24,lo8(8)
.L403:
	ld r0,Z+
	st X+,r0
	subi r24,lo8(-(-1))
	brne .L403
.LM496:
	ldi r24,lo8(1)
	call _Z7eeDirtyh
.LBB465:
.LBB466:
.LM497:
	lds r24,g_beepVal
	sts g_beepCnt,r24
.L404:
/* epilogue start */
.LBE466:
.LBE465:
.LBE458:
.LM498:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
.LVL414:
	pop r10
.LVL415:
	ret
.LFE36:
	.size	_Z15menuProcTrainerh, .-_Z15menuProcTrainerh
.global	_Z13menuProcModelh
	.type	_Z13menuProcModelh, @function
_Z13menuProcModelh:
.LFB30:
.LM499:
.LVL416:
	push r10
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
	mov r13,r24
.LBB467:
.LM500:
	ldi r24,lo8(0)
.LVL417:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ13menuProcModelhE3__c)
	ldi r21,hi8(_ZZ13menuProcModelhE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM501:
	lds r20,g_eeGeneral+27
	ldi r21,lo8(0)
	subi r20,lo8(-(1))
	sbci r21,hi8(-(1))
	subi r24,lo8(-(12))
	ldi r22,lo8(0)
	ldi r18,lo8(5)
	ldi r16,lo8(2)
	call _Z14lcd_outdezNAtthhihh
.LM502:
	ldi r24,lo8(_ZZ13menuProcModelhE7mstate2)
	ldi r25,hi8(_ZZ13menuProcModelhE7mstate2)
	mov r22,r13
	ldi r20,lo8(2)
	ldi r18,lo8(menuTabModel)
	ldi r19,hi8(menuTabModel)
	ldi r16,lo8(7)
	ldi r17,lo8(_ZZ13menuProcModelhE10mstate_tab)
	mov r14,r17
	ldi r17,hi8(_ZZ13menuProcModelhE10mstate_tab)
	mov r15,r17
	ldi r27,lo8(7)
	mov r12,r27
	ldi r26,lo8(7)
	mov r10,r26
	call _ZN7MState25checkEhhPPFvhEhPhhh
.LM503:
	lds r17,_ZZ13menuProcModelhE7mstate2
.LVL418:
.LM504:
	lds r15,_ZZ13menuProcModelhE7mstate2+1
.LVL419:
	inc r15
.LM505:
	cpi r17,lo8(1)
	brne .L409
	tst r15
	brne .L409
	ldi r18,lo8(2)
	rjmp .L410
.L409:
	ldi r18,lo8(0)
.L410:
	ldi r24,lo8(0)
	ldi r22,lo8(8)
	ldi r20,lo8(_ZZ13menuProcModelhE3__c_0)
	ldi r21,hi8(_ZZ13menuProcModelhE3__c_0)
	call _Z11lcd_putsAtthhPKch
.LM506:
	ldi r24,lo8(60)
	ldi r22,lo8(8)
	ldi r20,lo8(g_model)
	ldi r21,hi8(g_model)
	ldi r18,lo8(10)
	ldi r16,lo8(16)
	call _Z12lcd_putsnAtthhPKchh
.LM507:
	ldi r24,lo8(0)
	ldi r22,lo8(16)
	ldi r20,lo8(_ZZ13menuProcModelhE3__c_1)
	ldi r21,hi8(_ZZ13menuProcModelhE3__c_1)
	ldi r18,lo8(0)
	call _Z11lcd_putsAtthhPKch
.LM508:
	lds r24,g_model+14
	cpi r17,lo8(2)
	brne .L411
	ldi r25,lo8(1)
	cp r15,r25
	brne .L411
	ldi r16,lo8(2)
	rjmp .L412
.L411:
	ldi r16,lo8(0)
.L412:
.LM509:
	ldi r20,lo8(6)
	mul r24,r20
	movw r20,r0
	clr r1
	subi r20,lo8(-(_ZZ13menuProcModelhE3__c_2))
	sbci r21,hi8(-(_ZZ13menuProcModelhE3__c_2))
	ldi r24,lo8(60)
	ldi r22,lo8(16)
	ldi r18,lo8(6)
	call _Z12lcd_putsnAtthhPKchh
.LM510:
	lds r24,g_model+14
	tst r24
	brne .L413
.LM511:
	lds r20,g_model+15
	cpi r17,lo8(2)
	brne .L414
	ldi r24,lo8(2)
	cp r15,r24
	brne .L414
	ldi r16,lo8(2)
	rjmp .L415
.L414:
	ldi r16,lo8(0)
.L415:
	ldi r21,lo8(0)
	lsl r20
	rol r21
	lsl r20
	rol r21
	subi r20,lo8(-(_ZZ13menuProcModelhE3__c_3))
	sbci r21,hi8(-(_ZZ13menuProcModelhE3__c_3))
	ldi r24,lo8(84)
	ldi r22,lo8(16)
	ldi r18,lo8(4)
	call _Z12lcd_putsnAtthhPKchh
.L413:
.LM512:
	cpi r17,lo8(3)
	brne .L416
	tst r15
	brne .L416
	ldi r18,lo8(2)
	rjmp .L417
.L416:
	ldi r18,lo8(0)
.L417:
	ldi r24,lo8(0)
	ldi r22,lo8(24)
	ldi r20,lo8(_ZZ13menuProcModelhE3__c_4)
	ldi r21,hi8(_ZZ13menuProcModelhE3__c_4)
	call _Z11lcd_putsAtthhPKch
.LM513:
	lds r20,g_model+12
	lds r21,(g_model+12)+1
	cpi r17,lo8(3)
	brne .L418
	ldi r25,lo8(1)
	cp r15,r25
	brne .L419
	ldi r16,lo8(0)
	ldi r18,lo8(2)
	rjmp .L420
.L419:
	ldi r24,lo8(2)
	cp r15,r24
	brne .L418
	ldi r16,lo8(2)
	rjmp .L452
.L418:
	ldi r16,lo8(0)
.L452:
	ldi r18,lo8(0)
.L420:
	ldi r24,lo8(54)
	ldi r22,lo8(24)
	call _Z8putsTimehhihh
.LM514:
	lds r20,g_model+11
	cpi r17,lo8(3)
	brne .L421
	ldi r25,lo8(3)
	cp r15,r25
	brne .L421
	ldi r16,lo8(2)
	rjmp .L422
.L421:
	ldi r16,lo8(0)
.L422:
	ldi r21,lo8(0)
	lsl r20
	rol r21
	lsl r20
	rol r21
	subi r20,lo8(-(_ZZ13menuProcModelhE3__c_5))
	sbci r21,hi8(-(_ZZ13menuProcModelhE3__c_5))
	ldi r24,lo8(96)
	ldi r22,lo8(24)
	ldi r18,lo8(4)
	call _Z12lcd_putsnAtthhPKchh
.LM515:
	ldi r24,lo8(0)
	ldi r22,lo8(32)
	ldi r20,lo8(_ZZ13menuProcModelhE3__c_6)
	ldi r21,hi8(_ZZ13menuProcModelhE3__c_6)
	ldi r18,lo8(0)
	call _Z11lcd_putsAtthhPKch
.LM516:
	lds r24,g_model+18
	cpi r17,lo8(4)
	breq .L423
	ldi r16,lo8(0)
	rjmp .L424
.L423:
	ldi r16,lo8(2)
.L424:
	ldi r20,lo8(3)
	muls r24,r20
	movw r20,r0
	clr r1
	subi r20,lo8(-(_ZZ13menuProcModelhE3__c_7))
	sbci r21,hi8(-(_ZZ13menuProcModelhE3__c_7))
	ldi r24,lo8(60)
	ldi r22,lo8(32)
	ldi r18,lo8(3)
	call _Z12lcd_putsnAtthhPKchh
.LM517:
	ldi r24,lo8(0)
	ldi r22,lo8(40)
	ldi r20,lo8(_ZZ13menuProcModelhE3__c_8)
	ldi r21,hi8(_ZZ13menuProcModelhE3__c_8)
	ldi r18,lo8(0)
	call _Z11lcd_putsAtthhPKch
.LM518:
	lds r24,g_model+19
	cpi r17,lo8(5)
	breq .L425
	ldi r16,lo8(0)
	rjmp .L426
.L425:
	ldi r16,lo8(2)
.L426:
	ldi r20,lo8(6)
	muls r24,r20
	movw r20,r0
	clr r1
	subi r20,lo8(-(_ZZ13menuProcModelhE3__c_9))
	sbci r21,hi8(-(_ZZ13menuProcModelhE3__c_9))
	ldi r24,lo8(60)
	ldi r22,lo8(40)
	ldi r18,lo8(6)
	call _Z12lcd_putsnAtthhPKchh
.LM519:
	ldi r24,lo8(0)
	ldi r22,lo8(48)
	ldi r20,lo8(_ZZ13menuProcModelhE3__c_10)
	ldi r21,hi8(_ZZ13menuProcModelhE3__c_10)
	ldi r18,lo8(0)
	call _Z11lcd_putsAtthhPKch
.LM520:
	lds r20,g_model+20
	cpi r17,lo8(6)
	breq .L427
	ldi r18,lo8(0)
	rjmp .L428
.L427:
	ldi r18,lo8(2)
.L428:
	ldi r24,lo8(54)
	ldi r22,lo8(48)
	call _Z14putsDrSwitcheshhah
.LM521:
	cpi r17,lo8(7)
	breq .L429
	ldi r18,lo8(0)
	rjmp .L430
.L429:
	ldi r18,lo8(2)
.L430:
	ldi r24,lo8(0)
	ldi r22,lo8(56)
	ldi r20,lo8(_ZZ13menuProcModelhE3__c_11)
	ldi r21,hi8(_ZZ13menuProcModelhE3__c_11)
	call _Z11lcd_putsAtthhPKch
.LM522:
	ldi r24,lo8(36)
	ldi r22,lo8(56)
	ldi r20,lo8(_ZZ13menuProcModelhE3__c_12)
	ldi r21,hi8(_ZZ13menuProcModelhE3__c_12)
	call _Z10lcd_puts_PhhPKc
.LM523:
	cpi r17,lo8(4)
	brne .+2
	rjmp .L435
	cpi r17,lo8(5)
	brge .L439
	cpi r17,lo8(2)
	brne .+2
	rjmp .L433
	cpi r17,lo8(3)
	brlt .+2
	rjmp .L434
	cpi r17,lo8(1)
	breq .+2
	rjmp .L451
	rjmp .L455
.L439:
	cpi r17,lo8(6)
	brne .+2
	rjmp .L437
	cpi r17,lo8(6)
	brge .+2
	rjmp .L436
	cpi r17,lo8(7)
	breq .+2
	rjmp .L451
	rjmp .L456
.L455:
.LM524:
	tst r15
	brne .+2
	rjmp .L451
.LBB468:
.LM525:
	mov r14,r15
	clr r15
.LVL420:
	movw r28,r14
	sbiw r28,1
	movw r30,r28
	subi r30,lo8(-(g_model))
	sbci r31,hi8(-(g_model))
	ld r25,Z
	ldi r30,lo8(_ZL9s_charTab)
	ldi r31,hi8(_ZL9s_charTab)
	ldi r22,lo8(0)
.LVL421:
.L443:
.LBB469:
.LBB470:
.LBB471:
.LBB472:
.LBB473:
.LM526:
/* #APP */
 ;  873 "../src/menus.cpp" 1
	lpm r24, Z
	
 ;  0 "" 2
/* #NOAPP */
.LBE473:
.LM527:
	cp r24,r25
	breq .L441
	adiw r30,1
.LM528:
	tst r24
	breq .L442
.LBE472:
.LM529:
	subi r22,lo8(-(1))
	rjmp .L443
.L442:
	ldi r22,lo8(0)
.LVL422:
.L441:
.LBE471:
.LBE470:
.LBE469:
.LM530:
	mov r24,r13
.LVL423:
	ldi r20,lo8(0)
	ldi r18,lo8(39)
	call _Z14checkIncDec_hmhaaa
.LVL424:
.LBB474:
.LBB475:
.LBB476:
.LM531:
	cpi r24,lo8(40)
.LVL425:
	brlo .L444
	ldi r20,lo8(32)
.LVL426:
	rjmp .L445
.LVL427:
.L444:
.LBB477:
	mov r30,r24
	ldi r31,lo8(0)
	subi r30,lo8(-(_ZL9s_charTab))
	sbci r31,hi8(-(_ZL9s_charTab))
/* #APP */
 ;  880 "../src/menus.cpp" 1
	lpm r20, Z
	
 ;  0 "" 2
.LVL428:
/* #NOAPP */
.L445:
.LBE477:
.LBE476:
.LBE475:
.LBE474:
.LM532:
	subi r28,lo8(-(g_model))
	sbci r29,hi8(-(g_model))
	st Y,r20
.LM533:
	movw r24,r14
	lsl r24
	rol r25
	add r24,r14
	adc r25,r15
	lsl r24
	rol r25
	subi r24,lo8(-(54))
	ldi r22,lo8(8)
	ldi r18,lo8(2)
	call _Z11lcd_putcAtthhch
.LVL429:
	rjmp .L451
.LVL430:
.L433:
.LBE468:
.LM534:
	ldi r24,lo8(1)
	cp r15,r24
	breq .L446
	ldi r25,lo8(2)
	cp r15,r25
	breq .+2
	rjmp .L451
	rjmp .L457
.L446:
.LBB478:
.LBB479:
.LM535:
	mov r24,r13
	ldi r22,lo8(g_model+14)
	ldi r23,hi8(g_model+14)
	rjmp .L453
.L457:
.LBE479:
.LBE478:
.LBB480:
.LBB481:
.LM536:
	mov r24,r13
	ldi r22,lo8(g_model+15)
	ldi r23,hi8(g_model+15)
.L453:
	ldi r20,lo8(0)
	ldi r21,hi8(0)
	ldi r18,lo8(4)
	ldi r19,hi8(4)
.L454:
	ldi r16,lo8(2)
	call _Z15checkIncDecGen2hPviih
	rjmp .L451
.L434:
.LBE481:
.LBE480:
.LM537:
	ldi r24,lo8(2)
	cp r15,r24
	breq .L449
	ldi r25,lo8(3)
	cp r15,r25
	brne .+2
	rjmp .L450
	ldi r24,lo8(1)
	cp r15,r24
	breq .+2
	rjmp .L451
.LBB482:
.LM538:
	lds r24,g_model+12
	lds r25,(g_model+12)+1
	ldi r22,lo8(60)
	ldi r23,hi8(60)
	call __udivmodhi4
.LM539:
	mov r24,r13
	ldi r20,lo8(0)
	ldi r18,lo8(59)
	call _Z14checkIncDec_hmhaaa
	mov r18,r24
.LVL431:
.LM540:
	ldi r24,lo8(60)
	muls r18,r24
	movw r18,r0
	clr r1
.LVL432:
	lds r24,g_model+12
	lds r25,(g_model+12)+1
	ldi r22,lo8(60)
	ldi r23,hi8(60)
	call __udivmodhi4
	add r18,r24
	adc r19,r25
	sts (g_model+12)+1,r19
	sts g_model+12,r18
	rjmp .L451
.L449:
.LBE482:
.LBB483:
.LM541:
	lds r24,g_model+12
	lds r25,(g_model+12)+1
	ldi r22,lo8(60)
	ldi r23,hi8(60)
	call __udivmodhi4
	mov r16,r24
	subi r16,lo8(-(2))
	mov r24,r13
	mov r22,r16
	ldi r20,lo8(1)
	ldi r18,lo8(62)
	call _Z14checkIncDec_hmhaaa
.LM542:
	sub r16,r24
	clr r17
	sbrc r16,7
	com r17
	lds r24,g_model+12
	lds r25,(g_model+12)+1
	sub r24,r16
	sbc r25,r17
	sts (g_model+12)+1,r25
	sts g_model+12,r24
.LM543:
	sbrs r25,7
	rjmp .L451
	sts (g_model+12)+1,__zero_reg__
	sts g_model+12,__zero_reg__
	rjmp .L451
.L450:
.LBE483:
.LM544:
	mov r24,r13
	lds r22,g_model+11
	ldi r20,lo8(0)
	ldi r18,lo8(3)
	call _Z14checkIncDec_hmhaaa
	sts g_model+11,r24
	rjmp .L451
.L435:
.LBB484:
.LBB485:
.LM545:
	mov r24,r13
	ldi r22,lo8(g_model+18)
	ldi r23,hi8(g_model+18)
	ldi r20,lo8(0)
	ldi r21,hi8(0)
	ldi r18,lo8(1)
	ldi r19,hi8(1)
	rjmp .L454
.L436:
.LBE485:
.LBE484:
.LBB486:
.LBB487:
.LM546:
	mov r24,r13
	ldi r22,lo8(g_model+19)
	ldi r23,hi8(g_model+19)
	rjmp .L453
.L437:
.LBE487:
.LBE486:
.LBB488:
.LBB489:
.LM547:
	mov r24,r13
	ldi r22,lo8(g_model+20)
	ldi r23,hi8(g_model+20)
	ldi r20,lo8(-10)
	ldi r21,hi8(-10)
	ldi r18,lo8(10)
	ldi r19,hi8(10)
	rjmp .L454
.L456:
.LBE489:
.LBE488:
.LM548:
	ldi r25,lo8(-128)
	cp r13,r25
	brne .L451
.LM549:
	ldi r24,lo8(-128)
	call _Z10killEventsh
.LM550:
	lds r24,g_eeGeneral+27
	subi r24,lo8(-(1))
	call _ZN5EFile2rmEh
.LM551:
	lds r24,g_eeGeneral+27
	call _Z11eeLoadModelh
.LM552:
	ldi r24,lo8(gs(_Z19menuProcModelSelecth))
	ldi r25,hi8(gs(_Z19menuProcModelSelecth))
	call _Z9chainMenuPFvhE
.L451:
/* epilogue start */
.LBE467:
.LM553:
	pop r29
	pop r28
	pop r17
.LVL433:
	pop r16
	pop r15
.LVL434:
	pop r14
	pop r13
.LVL435:
	pop r12
	pop r10
	ret
.LFE30:
	.size	_Z13menuProcModelh, .-_Z13menuProcModelh
.global	_Z15menuProcExpoAllh
	.type	_Z15menuProcExpoAllh, @function
_Z15menuProcExpoAllh:
.LFB27:
.LM554:
.LVL436:
	push r8
	push r9
	push r10
	push r11
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
	mov r11,r24
.LBB490:
.LM555:
	ldi r24,lo8(0)
.LVL437:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ15menuProcExpoAllhE3__c)
	ldi r21,hi8(_ZZ15menuProcExpoAllhE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM556:
	ldi r24,lo8(_ZZ15menuProcExpoAllhE7mstate2)
	ldi r25,hi8(_ZZ15menuProcExpoAllhE7mstate2)
	mov r22,r11
	ldi r20,lo8(3)
	ldi r18,lo8(menuTabModel)
	ldi r19,hi8(menuTabModel)
	ldi r16,lo8(7)
	ldi r23,lo8(_ZZ15menuProcExpoAllhE10mstate_tab)
	mov r14,r23
	ldi r23,hi8(_ZZ15menuProcExpoAllhE10mstate_tab)
	mov r15,r23
	clr r12
	inc r12
	ldi r21,lo8(4)
	mov r10,r21
	call _ZN7MState25checkEhhPPFvhEhPhhh
.LM557:
	lds r16,_ZZ15menuProcExpoAllhE7mstate2
.LVL438:
	subi r16,lo8(-(-1))
.LM558:
	lds r10,_ZZ15menuProcExpoAllhE7mstate2+1
.LVL439:
.LM559:
	ldi r24,lo8(96)
	cp r11,r24
	brne .L459
.LM560:
	sbrc r16,7
	rjmp .L459
.LM561:
	sts _ZL10s_expoChan,r16
.LM562:
	ldi r24,lo8(gs(_Z15menuProcExpoOneh))
	ldi r25,hi8(gs(_Z15menuProcExpoOneh))
	call _Z8pushMenuPFvhE
.L459:
.LM563:
	ldi r24,lo8(24)
	ldi r22,lo8(8)
	ldi r20,lo8(_ZZ15menuProcExpoAllhE3__c_0)
	ldi r21,hi8(_ZZ15menuProcExpoAllhE3__c_0)
	call _Z10lcd_puts_PhhPKc
	ldi r24,lo8(g_model+265)
	mov r8,r24
	ldi r24,hi8(g_model+265)
	mov r9,r24
	ldi r28,lo8(0)
	ldi r29,hi8(0)
	ldi r17,lo8(16)
.LBB491:
.LBB492:
.LM564:
	mov r12,r16
	clr r13
	sbrc r12,7
	com r13
.LVL440:
.L478:
.LBE492:
.LBE491:
.LM565:
	mov r15,r28
.LBB494:
.LBB493:
.LM566:
	mov r20,r28
	subi r20,lo8(-(1))
	ldi r24,lo8(0)
	mov r22,r17
	ldi r18,lo8(0)
	call _Z10putsChnRawhhhh
.LM567:
	cp r12,r28
	cpc r13,r29
	breq .L461
	ldi r20,lo8(0)
	rjmp .L462
.L461:
	ldi r20,lo8(0)
	tst r10
	brne .L462
	ldi r20,lo8(1)
.L462:
	mov r24,r11
	ldi r22,lo8(0)
	ldi r18,lo8(36)
	mov r16,r17
.LVL441:
	mov r14,r15
	call _Z12editExpoValshhbhhh
.LM568:
	cp r12,r28
	cpc r13,r29
	breq .L464
	ldi r20,lo8(0)
	rjmp .L465
.L464:
	ldi r20,lo8(0)
	ldi r25,lo8(1)
	cp r10,r25
	brne .L465
	ldi r20,lo8(1)
.L465:
	mov r24,r11
	ldi r22,lo8(1)
	ldi r18,lo8(60)
	mov r16,r17
	mov r14,r15
	call _Z12editExpoValshhbhhh
.LM569:
	cp r12,r28
	cpc r13,r29
	breq .L467
	ldi r20,lo8(0)
	rjmp .L468
.L467:
	ldi r20,lo8(0)
	ldi r30,lo8(2)
	cp r10,r30
	brne .L468
	ldi r20,lo8(1)
.L468:
	mov r24,r11
	ldi r22,lo8(2)
	ldi r18,lo8(60)
	mov r16,r17
	mov r14,r15
	call _Z12editExpoValshhbhhh
.LM570:
	movw r30,r8
	ld r24,Z
	tst r24
	breq .L470
.LM571:
	cp r12,r28
	cpc r13,r29
	breq .L471
	ldi r20,lo8(0)
	rjmp .L472
.L471:
	ldi r20,lo8(0)
	ldi r31,lo8(3)
	cp r10,r31
	brne .L472
	ldi r20,lo8(1)
.L472:
	mov r24,r11
	ldi r22,lo8(3)
	ldi r18,lo8(102)
	mov r16,r17
	mov r14,r15
	call _Z12editExpoValshhbhhh
.LM572:
	cp r12,r28
	cpc r13,r29
	breq .L474
	ldi r20,lo8(0)
	rjmp .L475
.L474:
	ldi r20,lo8(0)
	ldi r24,lo8(4)
	cp r10,r24
	brne .L475
	ldi r20,lo8(1)
.L475:
	mov r24,r11
	ldi r22,lo8(4)
	ldi r18,lo8(126)
	mov r16,r17
	mov r14,r15
	call _Z12editExpoValshhbhhh
	rjmp .L477
.L470:
.LM573:
	cp r12,r28
	cpc r13,r29
	brne .L477
	ldi r25,lo8(2)
	cp r25,r10
	brge .L477
	ldi r24,lo8(2)
	sts _ZZ15menuProcExpoAllhE7mstate2+1,r24
.L477:
	adiw r28,1
	subi r17,lo8(-(8))
	ldi r30,lo8(5)
	ldi r31,hi8(5)
	add r8,r30
	adc r9,r31
.LBE493:
.LM574:
	cpi r17,lo8(48)
	breq .+2
	rjmp .L478
/* epilogue start */
.LBE494:
.LBE490:
.LM575:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
.LVL442:
	pop r14
	pop r13
	pop r12
	pop r11
.LVL443:
	pop r10
.LVL444:
	pop r9
	pop r8
	ret
.LFE27:
	.size	_Z15menuProcExpoAllh, .-_Z15menuProcExpoAllh
.global	_Z14menuProcLimitsh
	.type	_Z14menuProcLimitsh, @function
_Z14menuProcLimitsh:
.LFB18:
.LM576:
.LVL445:
	push r2
	push r3
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
	push r17
	push r29
	push r28
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,14
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 14 */
	mov r3,r24
.LBB495:
.LM577:
	ldi r24,lo8(0)
.LVL446:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ14menuProcLimitshE3__c)
	ldi r21,hi8(_ZZ14menuProcLimitshE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM578:
	lds r30,g_model+15
	ldi r31,lo8(0)
	adiw r30,4
	lsl r30
	rol r31
	ldi r24,lo8(_ZZ14menuProcLimitshE7mstate2)
	ldi r25,hi8(_ZZ14menuProcLimitshE7mstate2)
	mov r22,r3
	ldi r20,lo8(6)
	ldi r18,lo8(menuTabModel)
	ldi r19,hi8(menuTabModel)
	ldi r16,lo8(7)
	ldi r27,lo8(_ZZ14menuProcLimitshE10mstate_tab)
	mov r14,r27
	ldi r27,hi8(_ZZ14menuProcLimitshE10mstate_tab)
	mov r15,r27
	clr r12
	inc r12
	mov r10,r30
	call _ZN7MState25checkEhhPPFvhEhPhhh
.LM579:
	lds r25,_ZZ14menuProcLimitshE7mstate2
	mov r17,r25
.LVL447:
	subi r17,lo8(-(-1))
.LM580:
	lds r2,_ZZ14menuProcLimitshE7mstate2+1
.LVL448:
	inc r2
.LM581:
	cp __zero_reg__,r17
	brlt .L482
	sts _ZZ14menuProcLimitshE7s_pgOfs,__zero_reg__
	rjmp .L483
.L482:
.LM582:
	mov r18,r17
	clr r19
	sbrc r18,7
	com r19
	lds r24,_ZZ14menuProcLimitshE7s_pgOfs
	sub r18,r24
	sbc r19,__zero_reg__
	cpi r18,6
	cpc r19,__zero_reg__
	brlt .L484
	subi r25,lo8(-(-6))
	sts _ZZ14menuProcLimitshE7s_pgOfs,r25
	rjmp .L483
.L484:
.LM583:
	sbrs r19,7
	rjmp .L483
	sts _ZZ14menuProcLimitshE7s_pgOfs,r17
.L483:
.LM584:
	ldi r18,lo8(96)
	cp r3,r18
	breq .L486
	ldi r19,lo8(-65)
	cp r3,r19
	brne .L485
.LBB496:
.LM585:
	sts _ZZ14menuProcLimitshE7s_pgOfs,__zero_reg__
	rjmp .L485
.L486:
.LM586:
	mov r18,r17
	clr r19
	sbrc r18,7
	com r19
	lds r24,_ZZ14menuProcLimitshE7s_pgOfs
	sub r18,r24
	sbc r19,__zero_reg__
	movw r30,r18
	lsl r30
	rol r31
	subi r30,lo8(-(g_chans512))
	sbci r31,hi8(-(g_chans512))
	ld r20,Z
	ldd r21,Z+1
.LVL449:
.LM587:
	ldi r24,lo8(1)
	cp r2,r24
	brne .L485
.LM588:
	movw r30,r18
	lsl r30
	rol r31
	lsl r30
	rol r31
	add r30,r18
	adc r31,r19
	subi r30,lo8(-(g_model+185))
	sbci r31,hi8(-(g_model+185))
	ld r24,Z
	tst r24
	breq .L489
	com r21
	neg r20
	sbci r21,lo8(-1)
.L489:
	movw r30,r18
	lsl r30
	rol r31
	lsl r30
	rol r31
	add r30,r18
	adc r31,r19
	subi r30,lo8(-(g_model+186))
	sbci r31,hi8(-(g_model+186))
	std Z+1,r21
	st Z,r20
.LM589:
	sts _ZL14s_limitCacheOk,__zero_reg__
.L485:
.LBE496:
.LM590:
	ldi r24,lo8(24)
	ldi r22,lo8(8)
	ldi r20,lo8(_ZZ14menuProcLimitshE3__c_0)
	ldi r21,hi8(_ZZ14menuProcLimitshE3__c_0)
.LVL450:
	call _Z10lcd_puts_PhhPKc
	std Y+1,__zero_reg__
.LVL451:
	ldi r20,lo8(16)
	mov r14,r20
.LBB497:
.LBB498:
.LBB499:
.LBB500:
.LM591:
	mov r30,r17
	clr r31
	sbrc r30,7
	com r31
	std Y+12,r31
	std Y+11,r30
.LVL452:
.L510:
.LBE500:
.LBE499:
.LM592:
	lds r18,_ZZ14menuProcLimitshE7s_pgOfs
.LVL453:
	ldd r31,Y+1
	add r18,r31
.LM593:
	mov r20,r18
	ldi r21,lo8(0)
	std Y+14,r21
	std Y+13,r20
.LBB505:
.LBB504:
.LM594:
	movw r24,r20
	lsl r24
	rol r25
	lsl r24
	rol r25
	add r24,r20
	adc r25,r21
	movw r30,r24
	subi r30,lo8(-(g_model+186))
	sbci r31,hi8(-(g_model+186))
	std Y+7,r31
	std Y+6,r30
.LM595:
	movw r20,r24
	subi r20,lo8(-(g_model+183))
	sbci r21,hi8(-(g_model+183))
	std Y+5,r21
	std Y+4,r20
.LM596:
	movw r30,r24
	subi r30,lo8(-(g_model+184))
	sbci r31,hi8(-(g_model+184))
	std Y+3,r31
	std Y+2,r30
	clr r15
.LM597:
	subi r24,lo8(-(g_model))
	sbci r25,hi8(-(g_model))
	ldi r16,lo8(185)
	mov r8,r16
	mov r9,__zero_reg__
	add r8,r24
	adc r9,r25
	ldi r17,lo8(186)
	mov r6,r17
	mov r7,__zero_reg__
.LVL454:
	add r6,r24
	adc r7,r25
.LM598:
	ldd r4,Y+13
	ldd r5,Y+14
	lsl r4
	rol r5
	ldi r20,lo8(g_chans512)
	ldi r21,hi8(g_chans512)
	add r4,r20
	adc r5,r21
	ldd r30,Y+13
	ldd r31,Y+14
	subi r30,lo8(-(_ZZ14menuProcLimitshE5swVal))
	sbci r31,hi8(-(_ZZ14menuProcLimitshE5swVal))
	std Y+9,r31
	std Y+8,r30
.LM599:
	ldi r26,lo8(183)
	mov r10,r26
	mov r11,__zero_reg__
	add r10,r24
	adc r11,r25
.LM600:
	ldi r31,lo8(184)
	mov r12,r31
	mov r13,__zero_reg__
	add r12,r24
	adc r13,r25
.LM601:
	subi r18,lo8(-(1))
	std Y+10,r18
.LVL455:
.L509:
.LM602:
	ldd r18,Y+11
	ldd r19,Y+12
.LVL456:
	ldd r20,Y+13
	ldd r21,Y+14
	cp r18,r20
	cpc r19,r21
	brne .L490
	cp r2,r15
	brne .L490
	ldi r17,lo8(2)
	rjmp .L491
.L490:
	ldi r17,lo8(0)
.L491:
.LM603:
	movw r30,r8
	ld r20,Z
	tst r20
	breq .L492
	movw r30,r6
	ld r24,Z
	ldd r25,Z+1
	clr r18
	clr r19
	sub r18,r24
	sbc r19,r25
.LVL457:
	rjmp .L493
.LVL458:
.L492:
	movw r30,r6
	ld r18,Z
	ldd r19,Z+1
.LVL459:
.L493:
.LM604:
	movw r30,r4
	ld r24,Z
	ldd r25,Z+1
	sub r24,r18
	sbc r25,r19
	cpi r24,26
	cpc r25,__zero_reg__
	brlt .L494
	ldd r30,Y+8
	ldd r31,Y+9
	st Z,r20
.L494:
.LM605:
	subi r24,lo8(-25)
	sbci r25,hi8(-25)
	brge .L495
	ldi r24,lo8(1)
	eor r24,r20
	ldd r30,Y+8
	ldd r31,Y+9
	st Z,r24
.L495:
.LM606:
	ldi r31,lo8(2)
	cp r15,r31
	brne .+2
	rjmp .L499
	cp r31,r15
	brlo .L502
	tst r15
	breq .L497
	ldi r18,lo8(1)
.LVL460:
	cp r15,r18
	breq .+2
	rjmp .L496
	rjmp .L515
.LVL461:
.L502:
	ldi r19,lo8(3)
	cp r15,r19
	brne .+2
	rjmp .L500
	ldi r21,lo8(4)
	cp r15,r21
	breq .+2
	rjmp .L496
	rjmp .L516
.L497:
.LM607:
	ldd r24,Y+11
	ldd r25,Y+12
	ldd r30,Y+13
	ldd r31,Y+14
	cp r24,r30
	cpc r25,r31
	breq .L503
	ldi r18,lo8(0)
.LVL462:
	rjmp .L504
.LVL463:
.L503:
	mov r18,r2
.LVL464:
	cpse r2,__zero_reg__
	ldi r18,lo8(1)
.LVL465:
.L505:
	ldi r31,lo8(1)
	eor r18,r31
.LVL466:
.L504:
	ldi r24,lo8(0)
	mov r22,r14
	ldd r20,Y+10
	call _Z7putsChnhhhh
	rjmp .L496
.L515:
.LM608:
	movw r30,r6
	ld r20,Z
	ldd r21,Z+1
	ldi r24,lo8(42)
	mov r22,r14
	mov r18,r17
	call _Z13lcd_outdezAtthhih
.LM609:
	tst r17
	brne .+2
	rjmp .L496
.LBB501:
.LM610:
	mov r24,r3
	ldd r22,Y+6
	ldd r23,Y+7
	ldi r20,lo8(-500)
	ldi r21,hi8(-500)
	ldi r18,lo8(500)
	ldi r19,hi8(500)
	ldi r16,lo8(6)
	call _Z15checkIncDecGen2hPviih
.LBE501:
.LM611:
	tst r24
	brne .+2
	rjmp .L496
	sts _ZL14s_limitCacheOk,__zero_reg__
	rjmp .L496
.LVL467:
.L499:
.LM612:
	movw r30,r10
	ld r20,Z
	subi r20,lo8(-(-100))
	clr r21
	sbrc r20,7
	com r21
	ldi r24,lo8(72)
	mov r22,r14
	mov r18,r17
.LVL468:
	call _Z13lcd_outdezAtthhih
.LM613:
	tst r17
	brne .+2
	rjmp .L496
.LM614:
	movw r30,r10
	ld r24,Z
	subi r24,lo8(-(-100))
	st Z,r24
.LBB502:
.LM615:
	mov r24,r3
	ldd r22,Y+4
	ldd r23,Y+5
	ldi r20,lo8(-125)
	ldi r21,hi8(-125)
	ldi r18,lo8(125)
	ldi r19,hi8(125)
	ldi r16,lo8(2)
	call _Z15checkIncDecGen2hPviih
.LBE502:
.LM616:
	tst r24
	breq .L506
	sts _ZL14s_limitCacheOk,__zero_reg__
.L506:
.LM617:
	movw r30,r10
	ld r24,Z
	subi r24,lo8(-(100))
	rjmp .L514
.LVL469:
.L500:
.LM618:
	movw r30,r12
	ld r20,Z
	subi r20,lo8(-(100))
	clr r21
	sbrc r20,7
	com r21
	ldi r24,lo8(102)
	mov r22,r14
	mov r18,r17
.LVL470:
	call _Z13lcd_outdezAtthhih
.LM619:
	tst r17
	breq .L496
.LM620:
	movw r30,r12
	ld r24,Z
	subi r24,lo8(-(100))
	st Z,r24
.LBB503:
.LM621:
	mov r24,r3
	ldd r22,Y+2
	ldd r23,Y+3
	ldi r20,lo8(-125)
	ldi r21,hi8(-125)
	ldi r18,lo8(125)
	ldi r19,hi8(125)
	ldi r16,lo8(2)
	call _Z15checkIncDecGen2hPviih
.LBE503:
.LM622:
	tst r24
	breq .L507
	sts _ZL14s_limitCacheOk,__zero_reg__
.L507:
.LM623:
	movw r30,r12
	ld r24,Z
	subi r24,lo8(-(-100))
.L514:
	st Z,r24
	rjmp .L496
.LVL471:
.L516:
.LM624:
	mov r24,r20
	ldi r25,lo8(0)
	movw r20,r24
	lsl r20
	rol r21
	add r20,r24
	adc r21,r25
	subi r20,lo8(-(_ZZ14menuProcLimitshE3__c_1))
	sbci r21,hi8(-(_ZZ14menuProcLimitshE3__c_1))
	ldi r24,lo8(108)
	mov r22,r14
	ldi r18,lo8(3)
.LVL472:
	mov r16,r17
	call _Z12lcd_putsnAtthhPKchh
.LM625:
	tst r17
	breq .L496
.LM626:
	mov r24,r3
	movw r30,r8
	ld r22,Z
	ldi r20,lo8(0)
	ldi r18,lo8(1)
	call _Z14checkIncDec_hmhaaa
	movw r30,r8
	st Z,__zero_reg__
	tst r24
	breq .L496
	ldi r18,lo8(1)
	st Z,r18
.LVL473:
.L496:
.LBE504:
.LM627:
	inc r15
	ldi r19,lo8(5)
	cp r15,r19
	breq .+2
	rjmp .L509
.LBE505:
.LBE498:
.LM628:
	ldd r20,Y+1
	subi r20,lo8(-(1))
	std Y+1,r20
.LVL474:
	ldi r21,lo8(8)
	add r14,r21
	cpi r20,lo8(6)
	breq .+2
	rjmp .L510
/* epilogue start */
.LBE497:
.LBE495:
.LM629:
	adiw r28,14
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r28
	pop r29
	pop r17
.LVL475:
	pop r16
	pop r15
.LVL476:
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
.LVL477:
	pop r2
.LVL478:
	ret
.LFE18:
	.size	_Z14menuProcLimitsh, .-_Z14menuProcLimitsh
.global	_ZN7MState27check_vEhhPPFvhEhh
	.type	_ZN7MState27check_vEhhPPFvhEhh, @function
_ZN7MState27check_vEhhPPFvhEhh:
.LFB14:
.LM630:
.LVL479:
	push r10
	push r12
	push r14
.LVL480:
	push r15
	push r16
.LVL481:
/* prologue: function */
/* frame size = 0 */
	mov r10,r14
.LVL482:
.LM631:
	clr r14
	clr r15
.LVL483:
	clr r12
	call _ZN7MState25checkEhhPPFvhEhPhhh
.LVL484:
/* epilogue start */
.LM632:
	pop r16
	pop r15
	pop r14
	pop r12
	pop r10
.LVL485:
	ret
.LFE14:
	.size	_ZN7MState27check_vEhhPPFvhEhh, .-_ZN7MState27check_vEhhPPFvhEhh
.global	_Z14menuProcSetup0h
	.type	_Z14menuProcSetup0h, @function
_Z14menuProcSetup0h:
.LFB38:
.LM633:
.LVL486:
	push r13
	push r14
	push r15
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
	mov r13,r24
.LBB506:
.LM634:
	ldi r24,lo8(0)
.LVL487:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ14menuProcSetup0hE3__c)
	ldi r21,hi8(_ZZ14menuProcSetup0hE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM635:
	ldi r24,lo8(_ZZ14menuProcSetup0hE7mstate2)
	ldi r25,hi8(_ZZ14menuProcSetup0hE7mstate2)
	mov r22,r13
	ldi r20,lo8(1)
	ldi r18,lo8(menuTabDiag)
	ldi r19,hi8(menuTabDiag)
	ldi r16,lo8(7)
	ldi r21,lo8(4)
	mov r14,r21
	call _ZN7MState27check_vEhhPPFvhEhh
.LM636:
	lds r15,_ZZ14menuProcSetup0hE7mstate2
.LVL488:
	dec r15
.LM637:
	lds r20,g_eeGeneral+28
	tst r15
	breq .L520
	ldi r18,lo8(0)
	rjmp .L521
.L520:
	ldi r18,lo8(2)
.L521:
	ldi r24,lo8(24)
	ldi r22,lo8(16)
	ldi r21,lo8(0)
	call _Z13lcd_outdezAtthhih
.LM638:
	tst r15
	brne .L522
.LBB507:
.LBB508:
.LM639:
	mov r24,r13
	ldi r22,lo8(g_eeGeneral+28)
	ldi r23,hi8(g_eeGeneral+28)
	ldi r20,lo8(20)
	ldi r21,hi8(20)
	ldi r18,lo8(45)
	ldi r19,hi8(45)
	ldi r16,lo8(1)
	call _Z15checkIncDecGen2hPviih
.LBE508:
.LBE507:
.LM640:
	lds r24,g_eeGeneral+28
	call _Z13lcdSetRefVolth
.L522:
.LM641:
	ldi r24,lo8(36)
	ldi r22,lo8(16)
	ldi r20,lo8(_ZZ14menuProcSetup0hE3__c_0)
	ldi r21,hi8(_ZZ14menuProcSetup0hE3__c_0)
	call _Z10lcd_puts_PhhPKc
.LM642:
	lds r20,g_eeGeneral+29
	ldi r24,lo8(1)
	cp r15,r24
	breq .L523
	ldi r18,lo8(32)
	rjmp .L524
.L523:
	ldi r18,lo8(34)
.L524:
	ldi r24,lo8(24)
	ldi r22,lo8(24)
	ldi r21,lo8(0)
	call _Z13lcd_outdezAtthhih
.LM643:
	ldi r24,lo8(1)
	cp r15,r24
	brne .L525
.LBB509:
.LBB510:
.LM644:
	mov r24,r13
	ldi r22,lo8(g_eeGeneral+29)
	ldi r23,hi8(g_eeGeneral+29)
	ldi r20,lo8(50)
	ldi r21,hi8(50)
	ldi r18,lo8(100)
	ldi r19,hi8(100)
	ldi r16,lo8(1)
	call _Z15checkIncDecGen2hPviih
.L525:
.LBE510:
.LBE509:
.LM645:
	ldi r24,lo8(24)
	ldi r22,lo8(24)
	ldi r20,lo8(_ZZ14menuProcSetup0hE3__c_1)
	ldi r21,hi8(_ZZ14menuProcSetup0hE3__c_1)
	call _Z10lcd_puts_PhhPKc
.LM646:
	lds r20,g_eeGeneral+31
	ldi r24,lo8(2)
	cp r15,r24
	breq .L526
	ldi r18,lo8(0)
	rjmp .L527
.L526:
	ldi r18,lo8(2)
.L527:
	ldi r24,lo8(0)
	ldi r22,lo8(32)
	call _Z14putsDrSwitcheshhah
.LM647:
	ldi r24,lo8(2)
	cp r15,r24
	brne .L528
.LBB511:
.LBB512:
.LM648:
	mov r24,r13
	ldi r22,lo8(g_eeGeneral+31)
	ldi r23,hi8(g_eeGeneral+31)
	ldi r20,lo8(-10)
	ldi r21,hi8(-10)
	ldi r18,lo8(10)
	ldi r19,hi8(10)
	ldi r16,lo8(1)
	call _Z15checkIncDecGen2hPviih
.L528:
.LBE512:
.LBE511:
.LM649:
	ldi r24,lo8(36)
	ldi r22,lo8(32)
	ldi r20,lo8(_ZZ14menuProcSetup0hE3__c_2)
	ldi r21,hi8(_ZZ14menuProcSetup0hE3__c_2)
	call _Z10lcd_puts_PhhPKc
.LM650:
	ldi r24,lo8(6)
	ldi r22,lo8(48)
	ldi r20,lo8(_ZZ14menuProcSetup0hE3__c_3)
	ldi r21,hi8(_ZZ14menuProcSetup0hE3__c_3)
	ldi r18,lo8(0)
	call _Z11lcd_putsAtthhPKch
.LM651:
	lds r20,g_eeGeneral+50
	ldi r24,lo8(3)
	cp r15,r24
	breq .L529
	ldi r18,lo8(0)
	rjmp .L530
.L529:
	ldi r18,lo8(2)
.L530:
	subi r20,lo8(-(49))
	ldi r24,lo8(18)
	ldi r22,lo8(56)
	call _Z11lcd_putcAtthhch
	ldi r17,lo8(0)
.LVL489:
	ldi r16,lo8(36)
	mov r14,r16
.L531:
.LBB513:
.LM652:
	mov r24,r14
	ldi r22,lo8(48)
	ldi r20,lo8(sticks)
	ldi r21,hi8(sticks)
	mov r18,r17
	ldi r16,lo8(0)
	call _Z7lcd_imghhPKhhh
.LM653:
	subi r17,lo8(-(1))
	mov r24,r14
	ldi r22,lo8(56)
	mov r20,r17
	ldi r18,lo8(0)
	call _Z10putsChnRawhhhh
	ldi r24,lo8(24)
	add r14,r24
.LM654:
	cpi r17,lo8(4)
	brne .L531
.LBE513:
.LM655:
	ldi r24,lo8(3)
	cp r15,r24
	brne .L533
.LBB514:
.LBB515:
.LM656:
	mov r24,r13
	ldi r22,lo8(g_eeGeneral+50)
	ldi r23,hi8(g_eeGeneral+50)
	ldi r20,lo8(0)
	ldi r21,hi8(0)
	ldi r18,lo8(3)
	ldi r19,hi8(3)
	ldi r16,lo8(1)
	call _Z15checkIncDecGen2hPviih
.L533:
/* epilogue start */
.LBE515:
.LBE514:
.LBE506:
.LM657:
	pop r17
.LVL490:
	pop r16
	pop r15
.LVL491:
	pop r14
	pop r13
.LVL492:
	ret
.LFE38:
	.size	_Z14menuProcSetup0h, .-_Z14menuProcSetup0h
.global	_Z14menuProcSetup1h
	.type	_Z14menuProcSetup1h, @function
_Z14menuProcSetup1h:
.LFB37:
.LM658:
.LVL493:
	push r2
	push r3
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
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	mov r8,r24
.LBB516:
.LM659:
	ldi r24,lo8(0)
.LVL494:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ14menuProcSetup1hE3__c)
	ldi r21,hi8(_ZZ14menuProcSetup1hE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM660:
	ldi r24,lo8(_ZZ14menuProcSetup1hE7mstate2)
	ldi r25,hi8(_ZZ14menuProcSetup1hE7mstate2)
	mov r22,r8
	ldi r20,lo8(2)
	ldi r18,lo8(menuTabDiag)
	ldi r19,hi8(menuTabDiag)
	ldi r16,lo8(7)
	ldi r17,lo8(4)
	mov r14,r17
	call _ZN7MState27check_vEhhPPFvhEhh
.LM661:
	lds r24,_ZZ14menuProcSetup1hE7mstate2
	subi r24,lo8(-(-1))
.LM662:
	ldi r27,lo8(_ZZ14menuProcSetup1hE3__c_0)
	mov r10,r27
	ldi r27,hi8(_ZZ14menuProcSetup1hE3__c_0)
	mov r11,r27
	clr r12
	clr r13
	ldi r26,lo8(16)
	mov r9,r26
.LBB517:
.LBB518:
.LM663:
	mov r6,r24
	clr r7
	sbrc r6,7
	com r7
.LVL495:
.LBB519:
.LBB520:
.LM664:
	ldi r31,lo8(1)
	mov r2,r31
	mov r3,__zero_reg__
.LBE520:
.LM665:
	ldi r30,lo8(3)
	mov r4,r30
	mov r5,__zero_reg__
.LVL496:
.L547:
.LBE519:
.LBE518:
.LBE517:
.LM666:
	mov r17,r12
.LVL497:
.LBB524:
.LBB523:
.LM667:
	cp r6,r12
	cpc r7,r13
	brne .L536
	ldi r23,lo8(2)
	mov r15,r23
	rjmp .L537
.L536:
	clr r15
.L537:
.LM668:
	ldi r24,lo8(42)
	mov r22,r9
	movw r20,r10
	ldi r18,lo8(8)
	ldi r16,lo8(0)
.LVL498:
	call _Z12lcd_putsnAtthhPKchh
.LM669:
	cpi r17,lo8(3)
	brlo .L539
	cpi r17,lo8(3)
	breq .+2
	rjmp .L538
	rjmp .L552
.L539:
.LBB522:
.LBB521:
.LM670:
	movw r24,r2
	mov r0,r12
	rjmp 2f
1:	lsl r24
	rol r25
2:	dec r0
	brpl 1b
	mov r16,r24
.LVL499:
.LM671:
	ldi r17,lo8(0)
.LVL500:
	mov r18,r24
	ldi r19,lo8(0)
.LVL501:
	lds r24,g_eeGeneral+49
	ldi r25,lo8(0)
	and r18,r24
	and r19,r25
.LVL502:
	or r18,r19
	brne .L549
	ldi r17,lo8(1)
.LM672:
	ldi r20,lo8(_ZZ14menuProcSetup1hE3__c_1)
	ldi r21,hi8(_ZZ14menuProcSetup1hE3__c_1)
	rjmp .L543
.L549:
	ldi r20,lo8(_ZZ14menuProcSetup1hE3__c_2)
	ldi r21,hi8(_ZZ14menuProcSetup1hE3__c_2)
.L543:
	ldi r24,lo8(18)
	mov r22,r9
	mov r18,r15
.LVL503:
	call _Z11lcd_putsAtthhPKch
.LVL504:
.LM673:
	tst r15
	breq .L544
	mov r24,r8
	mov r22,r17
	ldi r20,lo8(0)
	ldi r18,lo8(1)
	call _Z14checkIncDec_hghaaa
	mov r22,r24
	cpse r24,__zero_reg__
	ldi r22,lo8(1)
.L545:
	mov r17,r22
.L544:
.LM674:
	lds r24,g_eeGeneral+49
	or r24,r16
.LVL505:
	sts g_eeGeneral+49,r24
.LM675:
	tst r17
	breq .L538
	com r16
	and r16,r24
	rjmp .L551
.LVL506:
.L552:
.LBE521:
.LM676:
	movw r24,r4
	mov r0,r12
	rjmp 2f
1:	lsl r24
	rol r25
2:	dec r0
	brpl 1b
	mov r16,r24
.LVL507:
.LM677:
	mov r28,r24
	ldi r29,lo8(0)
	lds r24,g_eeGeneral+49
	ldi r25,lo8(0)
	and r28,r24
	and r29,r25
	ldi r22,3
1:	asr r29
	ror r28
	dec r22
	brne 1b
	mov r14,r28
.LM678:
	ldi r24,lo8(24)
	mov r22,r9
	mov r20,r28
	ldi r21,lo8(0)
	mov r18,r15
	call _Z13lcd_outdezAtthhih
.LM679:
	tst r15
	breq .L546
	mov r24,r8
	mov r22,r28
	ldi r20,lo8(0)
	ldi r18,lo8(3)
	call _Z14checkIncDec_hghaaa
	mov r14,r24
.L546:
.LM680:
	lsl r14
	lsl r14
	lsl r14
	com r16
	lds r24,g_eeGeneral+49
	and r16,r24
	or r16,r14
.LVL508:
.L551:
	sts g_eeGeneral+49,r16
.L538:
	sec
	adc r12,__zero_reg__
	adc r13,__zero_reg__
	ldi r24,lo8(8)
	add r9,r24
	ldi r24,lo8(8)
	ldi r25,hi8(8)
	add r10,r24
	adc r11,r25
.LBE522:
.LBE523:
.LM681:
	ldi r25,lo8(48)
	cp r9,r25
	breq .+2
	rjmp .L547
/* epilogue start */
.LBE524:
.LBE516:
.LM682:
	pop r29
	pop r28
	pop r17
.LVL509:
	pop r16
.LVL510:
	pop r15
.LVL511:
	pop r14
.LVL512:
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
.LVL513:
	pop r7
	pop r6
.LVL514:
	pop r5
	pop r4
	pop r3
	pop r2
	ret
.LFE37:
	.size	_Z14menuProcSetup1h, .-_Z14menuProcSetup1h
.global	_Z16menuProcDiagVersh
	.type	_Z16menuProcDiagVersh, @function
_Z16menuProcDiagVersh:
.LFB35:
.LM683:
.LVL515:
	push r14
	push r16
	push r17
/* prologue: function */
/* frame size = 0 */
	mov r17,r24
.LBB525:
.LM684:
	ldi r24,lo8(0)
.LVL516:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ16menuProcDiagVershE3__c)
	ldi r21,hi8(_ZZ16menuProcDiagVershE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM685:
	ldi r24,lo8(_ZZ16menuProcDiagVershE7mstate2)
	ldi r25,hi8(_ZZ16menuProcDiagVershE7mstate2)
	mov r22,r17
	ldi r20,lo8(4)
	ldi r18,lo8(menuTabDiag)
	ldi r19,hi8(menuTabDiag)
	ldi r16,lo8(7)
	clr r14
	call _ZN7MState27check_vEhhPPFvhEhh
.LM686:
	ldi r24,lo8(0)
	ldi r22,lo8(16)
	ldi r20,lo8(stamp4)
	ldi r21,hi8(stamp4)
	call _Z10lcd_puts_PhhPKc
.LM687:
	ldi r24,lo8(0)
	ldi r22,lo8(24)
	ldi r20,lo8(stamp1)
	ldi r21,hi8(stamp1)
	call _Z10lcd_puts_PhhPKc
.LM688:
	ldi r24,lo8(0)
	ldi r22,lo8(32)
	ldi r20,lo8(stamp2)
	ldi r21,hi8(stamp2)
	call _Z10lcd_puts_PhhPKc
.LM689:
	ldi r24,lo8(0)
	ldi r22,lo8(40)
	ldi r20,lo8(stamp3)
	ldi r21,hi8(stamp3)
	call _Z10lcd_puts_PhhPKc
/* epilogue start */
.LBE525:
.LM690:
	pop r17
.LVL517:
	pop r16
	pop r14
	ret
.LFE35:
	.size	_Z16menuProcDiagVersh, .-_Z16menuProcDiagVersh
.global	_Z16menuProcDiagKeysh
	.type	_Z16menuProcDiagKeysh, @function
_Z16menuProcDiagKeysh:
.LFB34:
.LM691:
.LVL518:
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	mov r17,r24
.LBB526:
.LM692:
	ldi r24,lo8(0)
.LVL519:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ16menuProcDiagKeyshE3__c)
	ldi r21,hi8(_ZZ16menuProcDiagKeyshE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM693:
	ldi r24,lo8(_ZZ16menuProcDiagKeyshE7mstate2)
	ldi r25,hi8(_ZZ16menuProcDiagKeyshE7mstate2)
	mov r22,r17
	ldi r20,lo8(5)
	ldi r18,lo8(menuTabDiag)
	ldi r19,hi8(menuTabDiag)
	ldi r16,lo8(7)
	clr r14
	call _ZN7MState27check_vEhhPPFvhEhh
	clr r15
.LVL520:
	ldi r28,lo8(14)
	ldi r29,hi8(14)
.LVL521:
.L558:
.LBB527:
.LBB528:
.LM694:
	ldi r24,lo8(3)
	cp r24,r14
	brlo .L556
	mov r16,r15
	rjmp .L557
.LVL522:
.L556:
	mov r16,r15
	subi r16,lo8(-(-8))
.LVL523:
.L557:
.LM695:
	movw r24,r28
	call _Z8keyState8EnumKeys
	mov r17,r24
.LVL524:
.LM696:
	inc r14
	ldi r24,lo8(42)
	mov r22,r16
	mov r20,r14
	ldi r18,lo8(0)
	call _Z14putsDrSwitcheshhah
.LM697:
	mov r20,r17
	subi r20,lo8(-(48))
	ldi r24,lo8(68)
	mov r22,r16
	mov r18,r17
	call _Z11lcd_putcAtthhch
	ldi r24,lo8(8)
	add r15,r24
.LVL525:
	adiw r28,1
.LBE528:
.LM698:
	ldi r24,lo8(9)
	cp r14,r24
	brne .L558
.LM699:
	ldi r28,lo8(_ZZ16menuProcDiagKeyshE3__c_0)
	ldi r29,hi8(_ZZ16menuProcDiagKeyshE3__c_0)
	clr r14
.LVL526:
	ldi r16,lo8(56)
.L559:
.LBE527:
.LBB529:
.LBB530:
.LM700:
	mov r24,r14
	ldi r25,lo8(0)
	call _Z8keyState8EnumKeys
	mov r17,r24
.LVL527:
.LM701:
	ldi r24,lo8(0)
	mov r22,r16
	movw r20,r28
	ldi r18,lo8(5)
	call _Z11lcd_putsn_PhhPKch
.LM702:
	mov r20,r17
	subi r20,lo8(-(48))
	ldi r24,lo8(32)
	mov r22,r16
	mov r18,r17
	call _Z11lcd_putcAtthhch
.LBE530:
.LM703:
	inc r14
	subi r16,lo8(-(-8))
	adiw r28,5
	ldi r24,lo8(6)
	cp r14,r24
	brne .L559
.LBE529:
.LM704:
	ldi r24,lo8(84)
	ldi r22,lo8(24)
	ldi r20,lo8(_ZZ16menuProcDiagKeyshE3__c_1)
	ldi r21,hi8(_ZZ16menuProcDiagKeyshE3__c_1)
	ldi r18,lo8(7)
	call _Z11lcd_putsn_PhhPKch
	clr r15
.LVL528:
	ldi r16,lo8(32)
	mov r14,r16
.LVL529:
	ldi r28,lo8(6)
	ldi r29,hi8(6)
.L560:
.LBB531:
.LBB532:
.LM705:
	ldi r24,lo8(84)
	mov r22,r14
	ldi r20,lo8(sticks)
	ldi r21,hi8(sticks)
	mov r18,r15
	ldi r16,lo8(0)
	call _Z7lcd_imghhPKhhh
.LM706:
	movw r24,r28
	call _Z8keyState8EnumKeys
	mov r17,r24
.LVL530:
.LM707:
	movw r24,r28
	adiw r24,1
	call _Z8keyState8EnumKeys
	mov r16,r24
.LVL531:
.LM708:
	mov r20,r17
	subi r20,lo8(-(48))
	ldi r24,lo8(108)
	mov r22,r14
	mov r18,r17
	call _Z11lcd_putcAtthhch
.LM709:
	mov r20,r16
	subi r20,lo8(-(48))
	ldi r24,lo8(120)
	mov r22,r14
	mov r18,r16
	call _Z11lcd_putcAtthhch
.LBE532:
.LM710:
	inc r15
	ldi r24,lo8(8)
	add r14,r24
	adiw r28,2
	ldi r24,lo8(4)
	cp r15,r24
	brne .L560
/* epilogue start */
.LBE531:
.LBE526:
.LM711:
	pop r29
	pop r28
	pop r17
.LVL532:
	pop r16
.LVL533:
	pop r15
.LVL534:
	pop r14
	ret
.LFE34:
	.size	_Z16menuProcDiagKeysh, .-_Z16menuProcDiagKeysh
.global	_Z15menuProcDiagAnah
	.type	_Z15menuProcDiagAnah, @function
_Z15menuProcDiagAnah:
.LFB33:
.LM712:
.LVL535:
	push r10
	push r11
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
	mov r12,r24
.LBB533:
.LM713:
	ldi r24,lo8(0)
.LVL536:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ15menuProcDiagAnahE3__c)
	ldi r21,hi8(_ZZ15menuProcDiagAnahE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM714:
	ldi r24,lo8(_ZZ15menuProcDiagAnahE7mstate2)
	ldi r25,hi8(_ZZ15menuProcDiagAnahE7mstate2)
	mov r22,r12
	ldi r20,lo8(6)
	ldi r18,lo8(menuTabDiag)
	ldi r19,hi8(menuTabDiag)
	ldi r16,lo8(7)
	clr r14
	inc r14
	call _ZN7MState27check_vEhhPPFvhEhh
.LM715:
	lds r13,_ZZ15menuProcDiagAnahE7mstate2
.LVL537:
.LM716:
	ldi r25,lo8(_ZZ15menuProcDiagAnahE3__c_0)
	mov r14,r25
	ldi r25,hi8(_ZZ15menuProcDiagAnahE3__c_0)
	mov r15,r25
	ldi r28,lo8(g_eeGeneral+1)
	ldi r29,hi8(g_eeGeneral+1)
	ldi r16,lo8(0)
.LVL538:
	ldi r17,lo8(0)
.LBB534:
.LBB535:
.LBB536:
.LM717:
	ldi r24,lo8(50)
	mov r10,r24
	mov r11,__zero_reg__
.L573:
.LBE536:
.LM718:
	ldi r24,lo8(24)
	mov r22,r17
	movw r20,r14
	ldi r18,lo8(2)
	call _Z11lcd_putsn_PhhPKch
.LM719:
	mov r24,r16
	call _Z5anaInh
	movw r20,r24
	ldi r24,lo8(48)
	mov r22,r17
	call _Z11lcd_outhex4hhj
.LM720:
	cpi r16,lo8(4)
	brsh .L566
.LBB539:
.LM721:
	mov r24,r16
	call _Z5anaInh
	ld r18,Y
	ldd r19,Y+1
	movw r30,r24
.LVL539:
	sub r30,r18
	sbc r31,r19
.LM722:
	cp __zero_reg__,r30
	cpc __zero_reg__,r31
	brge .L567
	ldd r24,Y+16
	ldd r25,Y+17
	rjmp .L577
.L567:
	ldd r24,Y+8
	ldd r25,Y+9
.L577:
	ldi r22,lo8(2)
	ldi r23,hi8(2)
	call __divmodhi4
.LBB537:
.LBB538:
.LM723:
	cp __zero_reg__,r22
	cpc __zero_reg__,r23
.LVL540:
	brlt .L569
	ldi r22,lo8(1)
	ldi r23,hi8(1)
.L569:
.LBE538:
.LBE537:
.LM724:
	mul r30,r10
	movw r24,r0
	mul r30,r11
	add r25,r0
	mul r31,r10
	add r25,r0
	clr r1
	call __divmodhi4
.LVL541:
	movw r20,r22
	ldi r24,lo8(102)
	mov r22,r17
	call _Z10lcd_outdezhhi
.LVL542:
	rjmp .L570
.L566:
.LBE539:
.LM725:
	cpi r16,lo8(7)
	brne .L570
.LM726:
	ldi r24,lo8(1)
	cp r13,r24
	breq .L571
	ldi r20,lo8(0)
	rjmp .L572
.L571:
	ldi r20,lo8(2)
.L572:
	ldi r24,lo8(78)
	mov r22,r17
	call _Z8putsVBathhh
.L570:
.LBE535:
.LM727:
	subi r16,lo8(-(1))
	subi r17,lo8(-(8))
	ldi r24,lo8(2)
	ldi r25,hi8(2)
	add r14,r24
	adc r15,r25
	adiw r28,2
	cpi r16,lo8(8)
	breq .+2
	rjmp .L573
.LBE534:
.LM728:
	ldi r25,lo8(1)
	cp r13,r25
	brne .L575
.LBB540:
.LBB541:
.LM729:
	mov r24,r12
	ldi r22,lo8(g_eeGeneral+30)
	ldi r23,hi8(g_eeGeneral+30)
	ldi r20,lo8(-127)
	ldi r21,hi8(-127)
	ldi r18,lo8(127)
	ldi r19,hi8(127)
	ldi r16,lo8(1)
.LVL543:
	call _Z15checkIncDecGen2hPviih
.LVL544:
.L575:
/* epilogue start */
.LBE541:
.LBE540:
.LBE533:
.LM730:
	pop r29
	pop r28
	pop r17
	pop r16
.LVL545:
	pop r15
	pop r14
	pop r13
.LVL546:
	pop r12
.LVL547:
	pop r11
	pop r10
	ret
.LFE33:
	.size	_Z15menuProcDiagAnah, .-_Z15menuProcDiagAnah
.global	_Z17menuProcDiagCalibh
	.type	_Z17menuProcDiagCalibh, @function
_Z17menuProcDiagCalibh:
.LFB32:
.LM731:
.LVL548:
	push r10
	push r11
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
	mov r17,r24
.LBB542:
.LM732:
	ldi r24,lo8(0)
.LVL549:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ17menuProcDiagCalibhE3__c)
	ldi r21,hi8(_ZZ17menuProcDiagCalibhE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM733:
	ldi r24,lo8(_ZZ17menuProcDiagCalibhE7mstate2)
	ldi r25,hi8(_ZZ17menuProcDiagCalibhE7mstate2)
	mov r22,r17
	ldi r20,lo8(7)
	ldi r18,lo8(menuTabDiag)
	ldi r19,hi8(menuTabDiag)
	ldi r16,lo8(7)
	ldi r30,lo8(4)
	mov r14,r30
	call _ZN7MState27check_vEhhPPFvhEhh
.LM734:
	lds r12,_ZZ17menuProcDiagCalibhE7mstate2
.LVL550:
.LM735:
	cpi r17,lo8(34)
	breq .+2
	rjmp .L579
.LM736:
	ldi r24,lo8(3)
	cp r12,r24
	breq .L582
	ldi r25,lo8(4)
	cp r12,r25
	breq .L583
	ldi r30,lo8(2)
	cp r12,r30
	breq .+2
	rjmp .L579
.LBB543:
.LBB544:
.LM737:
	ldi r24,lo8(0)
	call _Z5anaInh
	sts (_ZZ17menuProcDiagCalibhE7midVals)+1,r25
	sts _ZZ17menuProcDiagCalibhE7midVals,r24
	ldi r24,lo8(1)
	call _Z5anaInh
	sts (_ZZ17menuProcDiagCalibhE7midVals+2)+1,r25
	sts _ZZ17menuProcDiagCalibhE7midVals+2,r24
	ldi r24,lo8(2)
	call _Z5anaInh
	sts (_ZZ17menuProcDiagCalibhE7midVals+4)+1,r25
	sts _ZZ17menuProcDiagCalibhE7midVals+4,r24
	ldi r24,lo8(3)
	call _Z5anaInh
	sts (_ZZ17menuProcDiagCalibhE7midVals+6)+1,r25
	sts _ZZ17menuProcDiagCalibhE7midVals+6,r24
	rjmp .L595
.L582:
.LBE544:
.LBB545:
.LM738:
	ldi r24,lo8(0)
	call _Z5anaInh
	sts (_ZZ17menuProcDiagCalibhE7lowVals)+1,r25
	sts _ZZ17menuProcDiagCalibhE7lowVals,r24
	ldi r24,lo8(1)
	call _Z5anaInh
	sts (_ZZ17menuProcDiagCalibhE7lowVals+2)+1,r25
	sts _ZZ17menuProcDiagCalibhE7lowVals+2,r24
	ldi r24,lo8(2)
	call _Z5anaInh
	sts (_ZZ17menuProcDiagCalibhE7lowVals+4)+1,r25
	sts _ZZ17menuProcDiagCalibhE7lowVals+4,r24
	ldi r24,lo8(3)
	call _Z5anaInh
	sts (_ZZ17menuProcDiagCalibhE7lowVals+6)+1,r25
	sts _ZZ17menuProcDiagCalibhE7lowVals+6,r24
	rjmp .L595
.L583:
.LBE545:
.LBB546:
.LBB547:
.LM739:
	ldi r23,lo8(_ZZ17menuProcDiagCalibhE7midVals)
	mov r14,r23
	ldi r23,hi8(_ZZ17menuProcDiagCalibhE7midVals)
	mov r15,r23
	ldi r16,lo8(g_eeGeneral+1)
	ldi r17,hi8(g_eeGeneral+1)
	ldi r22,lo8(_ZZ17menuProcDiagCalibhE7lowVals)
	mov r10,r22
	ldi r22,hi8(_ZZ17menuProcDiagCalibhE7lowVals)
	mov r11,r22
	movw r28,r16
	clr r13
.LVL551:
.L584:
.LBE547:
.LBE546:
.LBB548:
.LBB549:
.LM740:
	movw r30,r14
	ld r24,Z
	ldd r25,Z+1
	std Y+1,r25
	st Y,r24
.LM741:
	movw r30,r10
	ld r18,Z+
	ld r19,Z+
	movw r10,r30
	sub r24,r18
	sbc r25,r19
.LVL552:
.LM742:
	movw r18,r24
	ldi r21,6
1:	lsr r19
	ror r18
	dec r21
	brne 1b
	sub r24,r18
	sbc r25,r19
	std Y+9,r25
	std Y+8,r24
.LM743:
	mov r24,r13
.LVL553:
	call _Z5anaInh
	movw r30,r14
	ld r18,Z+
	ld r19,Z+
	movw r14,r30
	sub r24,r18
	sbc r25,r19
.LVL554:
.LM744:
	movw r18,r24
	ldi r20,6
1:	lsr r19
	ror r18
	dec r20
	brne 1b
	sub r24,r18
	sbc r25,r19
	std Y+17,r25
	std Y+16,r24
.LBE549:
.LM745:
	inc r13
	adiw r28,2
	ldi r31,lo8(4)
	cp r13,r31
	brne .L584
	ldi r18,lo8(0)
	ldi r19,hi8(0)
.LVL555:
.L585:
.LBE548:
.LBB550:
.LM746:
	movw r30,r16
	ld r24,Z+
	ld r25,Z+
.LVL556:
	movw r16,r30
	add r18,r24
	adc r19,r25
	ldi r31,hi8(g_eeGeneral+25)
	cpi r16,lo8(g_eeGeneral+25)
	cpc r17,r31
	brne .L585
.LBE550:
.LM747:
	movw r30,r16
	std Z+1,r19
	st Z,r18
.LM748:
	ldi r24,lo8(1)
	call _Z7eeDirtyh
.LVL557:
.L595:
.LBB551:
.LBB552:
.LM749:
	lds r24,g_beepVal
	sts g_beepCnt,r24
.L579:
.LM750:
	ldi r19,lo8(_ZZ17menuProcDiagCalibhE3__c_0)
	mov r14,r19
	ldi r19,hi8(_ZZ17menuProcDiagCalibhE3__c_0)
	mov r15,r19
	ldi r28,lo8(1)
	ldi r29,hi8(1)
	ldi r17,lo8(16)
.LVL558:
.LBE552:
.LBE551:
.LBE543:
.LBB553:
.LBB554:
.LM751:
	mov r10,r12
	clr r11
	sbrc r10,7
	com r11
.LVL559:
.L588:
	cp r10,r28
	cpc r11,r29
	breq .L586
	ldi r16,lo8(0)
	rjmp .L587
.L586:
	ldi r16,lo8(2)
.L587:
	ldi r24,lo8(0)
	mov r22,r17
	movw r20,r14
	ldi r18,lo8(7)
	call _Z12lcd_putsnAtthhPKchh
	adiw r28,1
	subi r17,lo8(-(8))
	ldi r24,lo8(7)
	ldi r25,hi8(7)
	add r14,r24
	adc r15,r25
.LBE554:
.LM752:
	cpi r17,lo8(48)
	brne .L588
.LM753:
	ldi r18,lo8(_ZZ17menuProcDiagCalibhE3__c_1)
	mov r14,r18
	ldi r18,hi8(_ZZ17menuProcDiagCalibhE3__c_1)
	mov r15,r18
	ldi r28,lo8(g_eeGeneral+1)
	ldi r29,hi8(g_eeGeneral+1)
	clr r13
.LVL560:
	ldi r16,lo8(0)
.L589:
.LBE553:
.LBB555:
.LBB556:
	ldi r24,lo8(48)
	mov r22,r16
	movw r20,r14
	ldi r18,lo8(2)
	call _Z11lcd_putsn_PhhPKch
.LM754:
	mov r24,r13
	call _Z5anaInh
	movw r20,r24
	ldi r24,lo8(72)
	mov r22,r16
	call _Z11lcd_outhex4hhj
	mov r17,r16
	subi r17,lo8(-(32))
.LM755:
	ldi r24,lo8(66)
	mov r22,r17
	ldi r20,lo8(_ZZ17menuProcDiagCalibhE3__c_2)
	ldi r21,hi8(_ZZ17menuProcDiagCalibhE3__c_2)
	call _Z10lcd_puts_PhhPKc
.LM756:
	ldd r20,Y+8
	ldd r21,Y+9
	ldi r24,lo8(45)
	mov r22,r17
	call _Z11lcd_outhex4hhj
.LM757:
	ld r20,Y
	ldd r21,Y+1
	ldi r24,lo8(72)
	mov r22,r17
	call _Z11lcd_outhex4hhj
.LM758:
	ldd r20,Y+16
	ldd r21,Y+17
	ldi r24,lo8(102)
	mov r22,r17
	call _Z11lcd_outhex4hhj
.LBE556:
.LM759:
	inc r13
	subi r16,lo8(-(8))
	ldi r30,lo8(2)
	ldi r31,hi8(2)
	add r14,r30
	adc r15,r31
	adiw r28,2
	ldi r31,lo8(4)
	cp r13,r31
	brne .L589
/* epilogue start */
.LBE555:
.LBE542:
.LM760:
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
.LVL561:
	pop r12
	pop r11
	pop r10
.LVL562:
	ret
.LFE32:
	.size	_Z17menuProcDiagCalibh, .-_Z17menuProcDiagCalibh
.global	_Z19menuProcModelSelecth
	.type	_Z19menuProcModelSelecth, @function
_Z19menuProcModelSelecth:
.LFB31:
.LM761:
.LVL563:
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
	mov r17,r24
.LBB557:
.LM762:
	ldi r24,lo8(0)
.LVL564:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ19menuProcModelSelecthE3__c)
	ldi r21,hi8(_ZZ19menuProcModelSelecthE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM763:
	ldi r24,lo8(60)
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ19menuProcModelSelecthE3__c_0)
	ldi r21,hi8(_ZZ19menuProcModelSelecthE3__c_0)
	call _Z10lcd_puts_PhhPKc
.LM764:
	call _Z11EeFsGetFreev
	movw r20,r24
	ldi r24,lo8(108)
	ldi r22,lo8(0)
	ldi r18,lo8(0)
	call _Z13lcd_outdezAtthhih
.LM765:
	ldi r24,lo8(110)
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ19menuProcModelSelecthE3__c_1)
	ldi r21,hi8(_ZZ19menuProcModelSelecthE3__c_1)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM766:
	lds r15,_ZZ19menuProcModelSelecthE7mstate2
.LM767:
	ldi r24,lo8(_ZZ19menuProcModelSelecthE7mstate2)
	ldi r25,hi8(_ZZ19menuProcModelSelecthE7mstate2)
	mov r22,r17
	ldi r20,lo8(0)
	ldi r18,lo8(0)
	ldi r19,hi8(0)
	ldi r16,lo8(0)
	ldi r26,lo8(15)
	mov r14,r26
	call _ZN7MState27check_vEhhPPFvhEhh
.LM768:
	lds r16,_ZZ19menuProcModelSelecthE7mstate2
.LM769:
	cpi r17,lo8(100)
	breq .L600
	cpi r17,lo8(101)
	brsh .L603
	cpi r17,lo8(96)
	breq .L598
	cpi r17,lo8(97)
	breq .+2
	rjmp .L597
	rjmp .L620
.L603:
	cpi r17,lo8(-128)
	breq .L601
	cpi r17,lo8(-65)
	breq .+2
	rjmp .L597
	rjmp .L621
.L620:
.LM770:
	lds r24,_ZZ19menuProcModelSelecthE10s_editMode
	tst r24
	breq .L600
.LM771:
	sts _ZZ19menuProcModelSelecthE10s_editMode,__zero_reg__
.LBB558:
.LBB559:
.LM772:
	lds r24,g_beepVal
	sts g_beepCnt,r24
.LBE559:
.LBE558:
.LM773:
	ldi r24,lo8(97)
	call _Z10killEventsh
	rjmp .L597
.L600:
.LM774:
	lds r24,g_eeGeneral+27
	cp r24,r16
	breq .L604
.LM775:
	sts g_eeGeneral+27,r16
	mov r24,r16
	call _Z11eeLoadModelh
.LM776:
	ldi r24,lo8(1)
	call _Z7eeDirtyh
.LM777:
	sts _ZL14s_limitCacheOk,__zero_reg__
.LBB560:
.LBB561:
.LM778:
	lds r24,g_beepVal
	sts g_beepCnt,r24
.L604:
.LBE561:
.LBE560:
.LM779:
	cpi r17,lo8(100)
	brne .L597
	ldi r24,lo8(gs(_Z13menuProcModelh))
	ldi r25,hi8(gs(_Z13menuProcModelh))
	call _Z9chainMenuPFvhE
	rjmp .L597
.L598:
.LM780:
	ldi r24,lo8(1)
	sts _ZZ19menuProcModelSelecthE10s_editMode,r24
.LBB562:
.LBB563:
.LM781:
	lds r24,g_beepVal
	rjmp .L619
.L601:
.LBE563:
.LBE562:
.LM782:
	lds r24,_ZZ19menuProcModelSelecthE10s_editMode
	tst r24
	breq .L597
.LM783:
	mov r24,r16
	call _Z16eeDuplicateModelh
	tst r24
	breq .L605
.LBB564:
.LBB565:
.LM784:
	lds r24,g_beepVal
	sts g_beepCnt,r24
.LBE565:
.LBE564:
.LM785:
	sts _ZZ19menuProcModelSelecthE10s_editMode,__zero_reg__
	rjmp .L597
.L605:
.LBB566:
.LBB567:
.LM786:
	lds r24,g_beepVal+2
.L619:
	sts g_beepCnt,r24
	rjmp .L597
.L621:
.LBE567:
.LBE566:
.LM787:
	sts _ZZ19menuProcModelSelecthE10s_editMode,__zero_reg__
.LM788:
	lds r24,g_eeGeneral+27
	sts _ZZ19menuProcModelSelecthE7mstate2,r24
.LM789:
	ldi r24,lo8(1)
	call _Z7eeCheckb
.L597:
.LM790:
	lds r24,_ZZ19menuProcModelSelecthE10s_editMode
	tst r24
	breq .L606
	cp r15,r16
	breq .L606
.LM791:
	mov r22,r16
	subi r22,lo8(-(1))
	mov r24,r15
	subi r24,lo8(-(1))
	call _ZN5EFile4swapEhh
.L606:
.LM792:
	mov r14,r16
	clr r15
	sbrc r14,7
	com r15
	lds r24,_ZZ19menuProcModelSelecthE7s_pgOfs
	movw r18,r14
	sub r18,r24
	sbc r19,__zero_reg__
	cp __zero_reg__,r18
	cpc __zero_reg__,r19
	brlt .L607
	movw r24,r14
.LVL565:
	sbiw r24,1
	sbrs r25,7
	rjmp .L608
	ldi r24,lo8(0)
	ldi r25,hi8(0)
.LVL566:
.L608:
	sts _ZZ19menuProcModelSelecthE7s_pgOfs,r24
.L610:
	clr r12
.LVL567:
	ldi r31,lo8(16)
	mov r13,r31
	rjmp .L609
.LVL568:
.L607:
.LM793:
	cpi r18,5
	cpc r19,__zero_reg__
	brlt .L610
	movw r24,r14
.LVL569:
	sbiw r24,4
	cpi r24,11
	cpc r25,__zero_reg__
	brlt .L608
	ldi r24,lo8(10)
	ldi r25,hi8(10)
	rjmp .L608
.LVL570:
.L609:
.LBB568:
.LBB569:
.LM794:
	lds r17,_ZZ19menuProcModelSelecthE7s_pgOfs
.LVL571:
	add r17,r12
.LM795:
	mov r28,r17
	ldi r29,lo8(0)
	cp r14,r28
	cpc r15,r29
	breq .L612
	ldi r18,lo8(4)
	rjmp .L613
.L612:
	lds r24,_ZZ19menuProcModelSelecthE10s_editMode
.LVL572:
	tst r24
	brne .L614
	ldi r18,lo8(6)
	rjmp .L613
.L614:
	ldi r18,lo8(5)
.LVL573:
.L613:
	movw r20,r28
	subi r20,lo8(-(1))
	sbci r21,hi8(-(1))
	ldi r24,lo8(12)
.LVL574:
	mov r22,r13
	ldi r16,lo8(2)
	call _Z14lcd_outdezNAtthhihh
.LM796:
	mov r24,r17
	ldi r22,lo8(_ZZ19menuProcModelSelecthE3buf)
	ldi r23,hi8(_ZZ19menuProcModelSelecthE3buf)
	ldi r20,lo8(15)
	call _Z15eeLoadModelNamehPch
.LM797:
	cp r14,r28
	cpc r15,r29
	brne .L615
	lds r24,_ZZ19menuProcModelSelecthE10s_editMode
	tst r24
	breq .L615
	ldi r16,lo8(18)
	rjmp .L616
.L615:
	ldi r16,lo8(16)
.L616:
	ldi r24,lo8(18)
	mov r22,r13
	ldi r20,lo8(_ZZ19menuProcModelSelecthE3buf)
	ldi r21,hi8(_ZZ19menuProcModelSelecthE3buf)
	ldi r18,lo8(15)
	call _Z12lcd_putsnAtthhPKchh
.LBE569:
.LM798:
	inc r12
	ldi r19,lo8(8)
	add r13,r19
	ldi r24,lo8(6)
	cp r12,r24
	brne .L609
/* epilogue start */
.LBE568:
.LBE557:
.LM799:
	pop r29
	pop r28
	pop r17
.LVL575:
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
.LVL576:
	ret
.LFE31:
	.size	_Z19menuProcModelSelecth, .-_Z19menuProcModelSelecth
.global	_Z15menuProcExpoOneh
	.type	_Z15menuProcExpoOneh, @function
_Z15menuProcExpoOneh:
.LFB26:
.LM800:
.LVL577:
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
	push r17
	push r29
	push r28
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
	mov r15,r24
.LBB570:
.LM801:
	ldi r24,lo8(0)
.LVL578:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ15menuProcExpoOnehE3__c)
	ldi r21,hi8(_ZZ15menuProcExpoOnehE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM802:
	lds r20,_ZL10s_expoChan
	subi r20,lo8(-(1))
	ldi r22,lo8(0)
	ldi r18,lo8(0)
	call _Z10putsChnRawhhhh
.LM803:
	ldi r24,lo8(_ZZ15menuProcExpoOnehE7mstate2)
	ldi r25,hi8(_ZZ15menuProcExpoOnehE7mstate2)
	mov r22,r15
	ldi r20,lo8(0)
	ldi r18,lo8(0)
	ldi r19,hi8(0)
	ldi r16,lo8(0)
	ldi r21,lo8(4)
	mov r14,r21
	call _ZN7MState27check_vEhhPPFvhEhh
.LM804:
	lds r17,_ZZ15menuProcExpoOnehE7mstate2
.LVL579:
.LM805:
	ldi r24,lo8(0)
	ldi r22,lo8(16)
	ldi r20,lo8(_ZZ15menuProcExpoOnehE3__c_0)
	ldi r21,hi8(_ZZ15menuProcExpoOnehE3__c_0)
	call _Z10lcd_puts_PhhPKc
.LM806:
	ldi r20,lo8(0)
	tst r17
	brne .L623
	ldi r20,lo8(1)
.L623:
	mov r24,r15
	ldi r22,lo8(0)
	ldi r18,lo8(54)
	ldi r16,lo8(16)
	lds r14,_ZL10s_expoChan
	call _Z12editExpoValshhbhhh
.LM807:
	ldi r24,lo8(0)
	ldi r22,lo8(24)
	ldi r20,lo8(_ZZ15menuProcExpoOnehE3__c_1)
	ldi r21,hi8(_ZZ15menuProcExpoOnehE3__c_1)
	call _Z10lcd_puts_PhhPKc
.LM808:
	ldi r20,lo8(0)
	cpi r17,lo8(1)
	brne .L624
	ldi r20,lo8(1)
.L624:
	mov r24,r15
	ldi r22,lo8(1)
	ldi r18,lo8(54)
	ldi r16,lo8(24)
	lds r14,_ZL10s_expoChan
	call _Z12editExpoValshhbhhh
.LM809:
	ldi r24,lo8(0)
	ldi r22,lo8(40)
	ldi r20,lo8(_ZZ15menuProcExpoOnehE3__c_2)
	ldi r21,hi8(_ZZ15menuProcExpoOnehE3__c_2)
	call _Z10lcd_puts_PhhPKc
.LM810:
	ldi r20,lo8(0)
	cpi r17,lo8(2)
	brne .L625
	ldi r20,lo8(1)
.L625:
	mov r24,r15
	ldi r22,lo8(2)
	ldi r18,lo8(30)
	ldi r16,lo8(40)
	lds r14,_ZL10s_expoChan
	call _Z12editExpoValshhbhhh
.LM811:
	ldi r24,lo8(0)
	ldi r22,lo8(48)
	ldi r20,lo8(_ZZ15menuProcExpoOnehE3__c_3)
	ldi r21,hi8(_ZZ15menuProcExpoOnehE3__c_3)
	call _Z10lcd_puts_PhhPKc
.LM812:
	ldi r20,lo8(0)
	cpi r17,lo8(3)
	brne .L626
	ldi r20,lo8(1)
.L626:
	mov r24,r15
	ldi r22,lo8(3)
	ldi r18,lo8(54)
	ldi r16,lo8(48)
	lds r14,_ZL10s_expoChan
	call _Z12editExpoValshhbhhh
.LM813:
	ldi r24,lo8(0)
	ldi r22,lo8(56)
	ldi r20,lo8(_ZZ15menuProcExpoOnehE3__c_4)
	ldi r21,hi8(_ZZ15menuProcExpoOnehE3__c_4)
	call _Z10lcd_puts_PhhPKc
.LM814:
	ldi r20,lo8(0)
	cpi r17,lo8(4)
	brne .L627
	ldi r20,lo8(1)
.L627:
	mov r24,r15
	ldi r22,lo8(4)
	ldi r18,lo8(54)
	ldi r16,lo8(56)
	lds r14,_ZL10s_expoChan
	call _Z12editExpoValshhbhhh
.LM815:
	cpi r17,lo8(2)
	brge .L628
.LM816:
	lds r24,_ZL10s_expoChan
	ldi r25,lo8(0)
	movw r30,r24
	lsl r30
	rol r31
	lsl r30
	rol r31
.LVL580:
	add r30,r24
	adc r31,r25
	subi r30,lo8(-(g_model))
	sbci r31,hi8(-(g_model))
	subi r30,lo8(-(263))
	sbci r31,hi8(-(263))
	rjmp .L638
.LVL581:
.L628:
.LM817:
	cpi r17,lo8(4)
	brlt .L630
	ldi r22,lo8(0)
.LVL582:
	ldi r16,lo8(0)
.LVL583:
	rjmp .L629
.LVL584:
.L630:
.LM818:
	lds r24,_ZL10s_expoChan
	ldi r25,lo8(0)
	movw r30,r24
	lsl r30
	rol r31
	lsl r30
	rol r31
	add r30,r24
	adc r31,r25
	subi r30,lo8(-(g_model))
	sbci r31,hi8(-(g_model))
	subi r30,lo8(-(264))
	sbci r31,hi8(-(264))
.L638:
	ld r22,Z
.LVL585:
.LM819:
	adiw r30,3
	ld r16,Z
.LVL586:
	subi r16,lo8(-(100))
.L629:
	clr r4
	clr r5
	ldi r26,lo8(32)
	mov r13,r26
	clr r14
	clr r15
.LBB571:
.LBB572:
.LM820:
	mov r10,r22
	clr r11
	sbrc r10,7
	com r11
.LM821:
	mov r6,r16
	clr r7
	sbrc r6,7
	com r7
.LVL587:
.LM822:
	ldi r31,lo8(32)
	mov r8,r31
.L632:
.LM823:
	movw r24,r14
	movw r22,r10
.LVL588:
	call _Z4expoii
.LM824:
	ldi r30,4
1:	lsr r25
	ror r24
	dec r30
	brne 1b
.LM825:
	mov r17,r4
.LVL589:
	ldi r23,lo8(94)
	mov r9,r23
	add r9,r4
.LM826:
	movw r18,r24
	mul r6,r18
	movw r24,r0
	mul r6,r19
	add r25,r0
	mul r7,r18
	add r25,r0
	clr r1
	ldi r22,lo8(100)
	ldi r23,hi8(100)
	call __udivmodhi4
	std Y+1,r22
	mov r22,r8
	ldd r19,Y+1
	sub r22,r19
	mov r24,r9
	call _Z8lcd_plothh
	ldi r22,lo8(62)
	mov r12,r22
	add r12,r13
.LM827:
	ldd r20,Y+1
	subi r20,lo8(-(32))
	std Y+1,r20
	mov r24,r12
	mov r22,r20
	call _Z8lcd_plothh
.LM828:
	movw r24,r4
	andi r24,lo8(3)
	andi r25,hi8(3)
	or r24,r25
	brne .L631
.LM829:
	mov r24,r9
	ldi r22,lo8(32)
	call _Z8lcd_plothh
.LM830:
	mov r24,r12
	ldi r22,lo8(32)
	call _Z8lcd_plothh
.LM831:
	subi r17,lo8(-(32))
	ldi r24,lo8(94)
	mov r22,r17
	call _Z8lcd_plothh
.LM832:
	ldi r24,lo8(94)
	mov r22,r13
	call _Z8lcd_plothh
.L631:
	sec
	adc r4,__zero_reg__
	adc r5,__zero_reg__
	dec r13
	ldi r24,lo8(16)
	ldi r25,hi8(16)
	add r14,r24
	adc r15,r25
.LBE572:
.LM833:
	tst r13
	breq .+2
	rjmp .L632
.LBE571:
.LM834:
	lds r30,_ZL10s_expoChan
	ldi r31,lo8(0)
	lsl r30
	rol r31
	subi r30,lo8(-(_ZL8anaCalib))
	sbci r31,hi8(-(_ZL8anaCalib))
	ld r14,Z
	ldd r15,Z+1
.LVL590:
.LM835:
	movw r24,r14
	movw r22,r10
	call _Z4expoii
	movw r18,r24
.LVL591:
.LM836:
	mov r24,r16
	sbrc r16,7
.LVL592:
	subi r24,lo8(-(3))
.LVL593:
.L633:
	asr r24
	asr r24
	clr r25
	sbrc r24,7
	com r25
.LVL594:
	ldi r20,lo8(25)
	mov r12,r20
	mov r13,__zero_reg__
	movw r30,r24
	mul r30,r18
	movw r24,r0
	mul r30,r19
	add r25,r0
	mul r31,r18
	add r25,r0
	clr r1
	ldi r22,lo8(25)
	ldi r23,hi8(25)
	call __divmodhi4
	movw r8,r22
.LM837:
	movw r24,r14
	ldi r16,4
1:	lsr r25
	ror r24
	dec r16
	brne 1b
	subi r24,lo8(-(94))
	ldi r22,lo8(0)
	ldi r20,lo8(64)
	call _Z9lcd_vlinehha
.LVL595:
.LM838:
	movw r24,r8
.LVL596:
	ldi r17,4
1:	lsr r25
	ror r24
	dec r17
	brne 1b
	ldi r22,lo8(32)
	sub r22,r24
	ldi r24,lo8(62)
	ldi r20,lo8(64)
	call _Z9lcd_hlinehha
.LM839:
	mul r14,r12
	movw r24,r0
	mul r14,r13
	add r25,r0
	mul r15,r12
	add r25,r0
	clr r1
	ldi r22,lo8(128)
	ldi r23,hi8(128)
	call __divmodhi4
	movw r20,r22
	ldi r24,lo8(114)
	ldi r22,lo8(48)
	ldi r18,lo8(0)
	call _Z13lcd_outdezAtthhih
.LM840:
	mul r8,r12
	movw r24,r0
	mul r8,r13
	add r25,r0
	mul r9,r12
	add r25,r0
	clr r1
	ldi r22,lo8(128)
	ldi r23,hi8(128)
	call __divmodhi4
	movw r20,r22
	ldi r24,lo8(84)
	ldi r22,lo8(8)
	ldi r18,lo8(0)
	call _Z13lcd_outdezAtthhih
.LM841:
	cp __zero_reg__,r14
	cpc __zero_reg__,r15
	brge .L634
	movw r24,r14
	sbiw r24,20
	movw r22,r10
	call _Z4expoii
	movw r22,r8
.LVL597:
	sub r22,r24
	sbc r23,r25
	rjmp .L635
.LVL598:
.L634:
	movw r24,r14
	adiw r24,20
	movw r22,r10
	call _Z4expoii
	movw r22,r24
.LVL599:
	sub r22,r8
	sbc r23,r9
.L635:
.LM842:
	movw r20,r22
	lsl r20
	rol r21
	lsl r20
	rol r21
	add r20,r22
	adc r21,r23
	ldi r24,lo8(84)
	ldi r22,lo8(16)
.LVL600:
	ldi r18,lo8(68)
	ldi r16,lo8(3)
	call _Z14lcd_outdezNAtthhihh
/* epilogue start */
.LBE570:
.LM843:
	pop __tmp_reg__
	pop r28
	pop r29
	pop r17
	pop r16
	pop r15
.LVL601:
	pop r14
.LVL602:
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
.LVL603:
	pop r7
	pop r6
	pop r5
	pop r4
	ret
.LFE26:
	.size	_Z15menuProcExpoOneh, .-_Z15menuProcExpoOneh
.global	_Z12menuProcTrimh
	.type	_Z12menuProcTrimh, @function
_Z12menuProcTrimh:
.LFB22:
.LM844:
.LVL604:
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
	mov r17,r24
.LBB573:
.LM845:
	ldi r24,lo8(0)
.LVL605:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ12menuProcTrimhE3__c)
	ldi r21,hi8(_ZZ12menuProcTrimhE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM846:
	ldi r24,lo8(_ZZ12menuProcTrimhE7mstate2)
	ldi r25,hi8(_ZZ12menuProcTrimhE7mstate2)
	mov r22,r17
	ldi r20,lo8(5)
	ldi r18,lo8(menuTabModel)
	ldi r19,hi8(menuTabModel)
	ldi r16,lo8(7)
	ldi r21,lo8(4)
	mov r14,r21
	call _ZN7MState27check_vEhhPPFvhEhh
.LM847:
	lds r15,_ZZ12menuProcTrimhE7mstate2
.LVL606:
	dec r15
.LM848:
	cpi r17,lo8(69)
	breq .L642
	cpi r17,lo8(70)
	brsh .L643
	cpi r17,lo8(68)
	breq .+2
	rjmp .L640
	rjmp .L641
.L643:
	cpi r17,lo8(100)
	breq .L641
	cpi r17,lo8(101)
	breq .+2
	rjmp .L640
.L642:
.LM849:
	sbrc r15,7
	rjmp .L640
.LM850:
	mov r24,r15
	clr r25
	sbrc r24,7
	com r25
.LVL607:
	movw r30,r24
	lsl r30
	rol r31
.LVL608:
	add r30,r24
	adc r31,r25
	subi r30,lo8(-(g_model+172))
	sbci r31,hi8(-(g_model+172))
	std Z+1,__zero_reg__
	st Z,__zero_reg__
	rjmp .L651
.LVL609:
.L641:
.LM851:
	sbrc r15,7
	rjmp .L640
.LBB574:
.LM852:
	mov r20,r15
	clr r21
	sbrc r20,7
	com r21
	movw r30,r20
	lsl r30
	rol r31
	add r30,r20
	adc r31,r21
	subi r30,lo8(-(g_model))
	sbci r31,hi8(-(g_model))
	subi r30,lo8(-(171))
	sbci r31,hi8(-(171))
	ld r24,Z+
	mov r18,r24
	clr r19
	sbrc r18,7
	com r19
.LVL610:
	ld r24,Z
	ldd r25,Z+1
	add r18,r24
	adc r19,r25
.LM853:
	ldi r24,hi8(513)
	cpi r18,lo8(513)
	cpc r19,r24
	brlt .L644
	ldi r18,lo8(512)
	ldi r19,hi8(512)
	rjmp .L645
.L644:
.LM854:
	ldi r24,hi8(-512)
	cpi r18,lo8(-512)
	cpc r19,r24
	brge .L645
	ldi r18,lo8(-512)
	ldi r19,hi8(-512)
.L645:
.LM855:
	movw r30,r20
	lsl r30
	rol r31
	add r30,r20
	adc r31,r21
	subi r30,lo8(-(g_model))
	sbci r31,hi8(-(g_model))
	subi r30,lo8(-(172))
	sbci r31,hi8(-(172))
	std Z+1,r19
	st Z,r18
.LM856:
	st -Z,__zero_reg__
.LVL611:
.L651:
.LM857:
	ldi r24,lo8(2)
	call _Z7eeDirtyh
.LVL612:
.LBB575:
.LBB576:
.LM858:
	lds r24,g_beepVal
	sts g_beepCnt,r24
.L640:
.LBE576:
.LBE575:
.LBE574:
.LM859:
	ldi r24,lo8(36)
	ldi r22,lo8(8)
	ldi r20,lo8(_ZZ12menuProcTrimhE3__c_0)
	ldi r21,hi8(_ZZ12menuProcTrimhE3__c_0)
	call _Z10lcd_puts_PhhPKc
	ldi r28,lo8(g_model+171)
	ldi r29,hi8(g_model+171)
	ldi r16,lo8(0)
	ldi r17,hi8(0)
	ldi r23,lo8(16)
	mov r14,r23
.LBB577:
.LBB578:
.LM860:
	mov r12,r15
	clr r13
	sbrc r12,7
	com r13
.LVL613:
.L648:
	cp r12,r16
	cpc r13,r17
	brne .L646
	ldi r22,lo8(2)
	mov r15,r22
	rjmp .L647
.L646:
	clr r15
.L647:
.LM861:
	mov r20,r16
	subi r20,lo8(-(1))
	ldi r24,lo8(0)
	mov r22,r14
	ldi r18,lo8(0)
	call _Z10putsChnRawhhhh
.LM862:
	ld r20,Y
	clr r21
	sbrc r20,7
	com r21
	ldi r24,lo8(48)
	mov r22,r14
	mov r18,r15
	call _Z13lcd_outdezAtthhih
.LM863:
	ldd r20,Y+1
	ldd r21,Y+2
	ldi r24,lo8(84)
	mov r22,r14
	mov r18,r15
	call _Z13lcd_outdezAtthhih
	subi r16,lo8(-(1))
	sbci r17,hi8(-(1))
	ldi r24,lo8(8)
	add r14,r24
	adiw r28,3
.LBE578:
.LM864:
	ldi r24,lo8(48)
	cp r14,r24
	brne .L648
.LBE577:
.LM865:
	ldi r24,lo8(0)
	ldi r22,lo8(56)
	ldi r20,lo8(_ZZ12menuProcTrimhE3__c_1)
	ldi r21,hi8(_ZZ12menuProcTrimhE3__c_1)
	call _Z10lcd_puts_PhhPKc
/* epilogue start */
.LBE573:
.LM866:
	pop r29
	pop r28
	pop r17
.LVL614:
	pop r16
	pop r15
.LVL615:
	pop r14
	pop r13
	pop r12
.LVL616:
	ret
.LFE22:
	.size	_Z12menuProcTrimh, .-_Z12menuProcTrimh
.global	_Z11menuProcMixh
	.type	_Z11menuProcMixh, @function
_Z11menuProcMixh:
.LFB21:
.LM867:
.LVL617:
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
	push r17
	push r28
	push r29
/* prologue: function */
/* frame size = 0 */
	mov r7,r24
.LBB579:
.LM868:
	ldi r24,lo8(0)
.LVL618:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ11menuProcMixhE3__c)
	ldi r21,hi8(_ZZ11menuProcMixhE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM869:
	lds r14,s_mixMaxSel
	dec r14
	ldi r24,lo8(_ZZ11menuProcMixhE7mstate2)
	ldi r25,hi8(_ZZ11menuProcMixhE7mstate2)
	mov r22,r7
	ldi r20,lo8(4)
	ldi r18,lo8(menuTabModel)
	ldi r19,hi8(menuTabModel)
	ldi r16,lo8(7)
	call _ZN7MState27check_vEhhPPFvhEhh
.LM870:
	lds r10,_ZZ11menuProcMixhE7mstate2
.LVL619:
.LM871:
	ldi r18,lo8(-66)
	cp r7,r18
	breq .L655
	ldi r24,lo8(-65)
	cp r7,r24
	breq .L656
	ldi r25,lo8(96)
	cp r7,r25
	breq .+2
	rjmp .L653
	rjmp .L686
.L656:
.LM872:
	sts _ZZ11menuProcMixhE7s_pgOfs,__zero_reg__
.L655:
.LM873:
	call _Z9genMixTabv
	rjmp .L653
.L686:
.LM874:
	cp __zero_reg__,r10
	brlt .+2
	rjmp .L653
.LM875:
	lds r24,_ZL16s_currMixInsMode
	tst r24
	brne .+2
	rjmp .L657
.LM876:
	lds r18,_ZL12s_currMixIdx
	clr r19
	sbrc r18,7
	com r19
	movw r20,r18
	subi r20,lo8(-(1))
	sbci r21,hi8(-(1))
	movw r24,r20
	lsl r24
	rol r25
	add r24,r20
	adc r25,r21
	lsl r24
	rol r25
	movw r22,r18
	lsl r22
	rol r23
	add r22,r18
	adc r23,r19
	lsl r22
	rol r23
	subi r22,lo8(-(g_model+21))
	sbci r23,hi8(-(g_model+21))
	com r18
	com r19
	subi r18,lo8(-(25))
	sbci r19,hi8(-(25))
	movw r20,r18
	lsl r20
	rol r21
	add r20,r18
	adc r21,r19
	lsl r20
	rol r21
	subi r24,lo8(-(g_model+21))
	sbci r25,hi8(-(g_model+21))
	call memmove
.LM877:
	lds r30,_ZL12s_currMixIdx
	ldi r24,lo8(6)
	muls r30,r24
	movw r30,r0
	clr r1
	subi r30,lo8(-(g_model+21))
	sbci r31,hi8(-(g_model+21))
	lds r25,_ZL12s_currDestCh
	st Z,r25
.LM878:
	andi r25,lo8(127)
	ldd r24,Z+1
	andi r24,lo8(-128)
	or r24,r25
	std Z+1,r24
.LM879:
	ldi r24,lo8(100)
	std Z+2,r24
.LM880:
	std Z+3,__zero_reg__
.LM881:
	std Z+4,__zero_reg__
.LM882:
	std Z+5,__zero_reg__
.LM883:
	ldi r24,lo8(2)
	call _Z7eeDirtyh
.L657:
.LM884:
	ldi r24,lo8(gs(_Z14menuProcMixOneh))
	ldi r25,hi8(gs(_Z14menuProcMixOneh))
	call _Z8pushMenuPFvhE
.L653:
.LM885:
	ldi r24,lo8(36)
	ldi r22,lo8(8)
	ldi r20,lo8(_ZZ11menuProcMixhE3__c_0)
	ldi r21,hi8(_ZZ11menuProcMixhE3__c_0)
	call _Z10lcd_puts_PhhPKc
	clr r9
	dec r9
.LVL620:
	clr r11
.LVL621:
	ldi r24,lo8(99)
	mov r8,r24
.LVL622:
	clr r13
	dec r13
.LVL623:
	ldi r17,lo8(16)
.LBB580:
.LM886:
	clr r5
	inc r5
.LBB581:
.LM887:
	ldi r16,lo8(3)
	mov r6,r16
.LVL624:
.L675:
.LBE581:
.LM888:
	lds r24,_ZZ11menuProcMixhE7s_pgOfs
	add r24,r11
	mov r14,r24
	clr r15
	movw r30,r14
	lsl r30
	rol r31
	add r30,r14
	adc r31,r15
	lsl r30
	rol r31
	subi r30,lo8(-(s_mixTab))
	sbci r31,hi8(-(s_mixTab))
	ld r24,Z
	sbrc r24,0
	rjmp .L658
	sbrc r24,1
	rjmp .L660
	rjmp .L659
.L658:
.LM889:
	ldi r24,lo8(0)
	mov r22,r17
	ldd r20,Z+1
	ldi r18,lo8(0)
	call _Z7putsChnhhhh
.L660:
.LM890:
	cp __zero_reg__,r10
	brge .L661
	movw r30,r14
	lsl r30
	rol r31
	add r30,r14
	adc r31,r15
	lsl r30
	rol r31
	subi r30,lo8(-(s_mixTab+2))
	sbci r31,hi8(-(s_mixTab+2))
	ld r24,Z
	cp r10,r24
	brne .L661
.LM891:
	lds r24,g_blinkTmr10ms
	sbrs r24,6
	rjmp .L662
	mov r22,r17
	subi r22,lo8(-(7))
	ldi r24,lo8(0)
	ldi r20,lo8(24)
	call _Z9lcd_hlinehha
.L662:
.LM892:
	movw r30,r14
	lsl r30
	rol r31
	add r30,r14
	adc r31,r15
	lsl r30
	rol r31
	subi r30,lo8(-(s_mixTab))
	sbci r31,hi8(-(s_mixTab))
	ldd r24,Z+4
	sts _ZL12s_currMixIdx,r24
.LM893:
	ldd r24,Z+1
	sts _ZL12s_currDestCh,r24
.LM894:
	sts _ZL16s_currMixInsMode,r5
	mov r9,r11
.L661:
.LM895:
	movw r30,r14
	lsl r30
	rol r31
	add r30,r14
	adc r31,r15
	lsl r30
	rol r31
	subi r30,lo8(-(s_mixTab))
	sbci r31,hi8(-(s_mixTab))
	ld r24,Z
	sbrs r24,1
	rjmp .L663
.LBB584:
.LM896:
	ldd r24,Z+5
	ldi r18,lo8(6)
	muls r24,r18
	movw r28,r0
	clr r1
	subi r28,lo8(-(g_model+21))
	sbci r29,hi8(-(g_model+21))
.LM897:
	ldd r24,Z+3
	cp r10,r24
	breq .L664
	clr r12
	rjmp .L665
.L664:
	ldi r25,lo8(2)
	mov r12,r25
.L665:
.LM898:
	ldd r20,Y+2
	clr r21
	sbrc r20,7
	com r21
	ldi r24,lo8(45)
	mov r22,r17
	mov r18,r12
	call _Z13lcd_outdezAtthhih
.LM899:
	ldi r24,lo8(45)
	mov r22,r17
	ldi r20,lo8(37)
	ldi r18,lo8(0)
	call _Z11lcd_putcAtthhch
.LM900:
	ldd r20,Y+1
	andi r20,lo8(127)
	ldi r24,lo8(54)
	mov r22,r17
	ldi r18,lo8(0)
	call _Z10putsChnRawhhhh
.LM901:
	ldd r20,Y+3
	tst r20
	breq .L666
	ldi r24,lo8(78)
	mov r22,r17
	ldi r18,lo8(0)
	call _Z14putsDrSwitcheshhah
.L666:
.LM902:
	ldd r24,Y+4
	tst r24
	breq .L667
	mul r24,r6
	movw r20,r0
	clr r1
	subi r20,lo8(-(_ZZ11menuProcMixhE3__c_1))
	sbci r21,hi8(-(_ZZ11menuProcMixhE3__c_1))
	ldi r24,lo8(102)
	mov r22,r17
	ldi r18,lo8(3)
	ldi r16,lo8(0)
	call _Z12lcd_putsnAtthhPKchh
.L667:
.LM903:
	ldd r24,Y+5
	tst r24
	breq .L668
	ldi r24,lo8(121)
	mov r22,r17
	ldi r20,lo8(115)
	ldi r18,lo8(0)
	call _Z11lcd_putcAtthhch
.L668:
.LM904:
	ldi r24,lo8(2)
	cp r12,r24
	brne .L663
.LBB582:
.LBB583:
.LM905:
	movw r22,r28
	subi r22,lo8(-(2))
	sbci r23,hi8(-(2))
	mov r24,r7
	ldi r20,lo8(-125)
	ldi r21,hi8(-125)
	ldi r18,lo8(125)
	ldi r19,hi8(125)
	ldi r16,lo8(2)
	call _Z15checkIncDecGen2hPviih
.LBE583:
.LBE582:
.LM906:
	movw r30,r14
	lsl r30
	rol r31
	add r30,r14
	adc r31,r15
	lsl r30
	rol r31
	subi r30,lo8(-(s_mixTab))
	sbci r31,hi8(-(s_mixTab))
	ldd r24,Z+5
	sts _ZL12s_currMixIdx,r24
.LM907:
	ldd r24,Z+1
	sts _ZL12s_currDestCh,r24
.LM908:
	sts _ZL16s_currMixInsMode,__zero_reg__
	mov r9,r11
.L663:
.LBE584:
.LM909:
	movw r30,r14
	lsl r30
	rol r31
	add r30,r14
	adc r31,r15
	lsl r30
	rol r31
	subi r30,lo8(-(s_mixTab+2))
	sbci r31,hi8(-(s_mixTab+2))
	ld r24,Z
.LVL625:
	tst r24
	breq .L669
	cp r24,r8
	brge .L670
	mov r8,r24
.L670:
.LBB585:
.LBB586:
.LM910:
	cp r24,r13
	brge .L671
.L669:
	mov r24,r13
.L671:
.LBE586:
.LBE585:
.LM911:
	movw r30,r14
	lsl r30
	rol r31
	add r30,r14
	adc r31,r15
	lsl r30
	rol r31
	subi r30,lo8(-(s_mixTab))
	sbci r31,hi8(-(s_mixTab))
	ldd r13,Z+3
.LVL626:
	tst r13
	breq .L672
	cp r13,r8
	brge .L673
	mov r8,r13
.L673:
.LBB587:
.LBB588:
.LM912:
	cp r13,r24
	brge .L674
.L672:
	mov r13,r24
.L674:
.LBE588:
.LBE587:
.LBE580:
.LM913:
	inc r11
	subi r17,lo8(-(8))
	ldi r25,lo8(6)
	cp r11,r25
	breq .+2
	rjmp .L675
.L659:
.LM914:
	tst r10
	breq .L676
	ldi r18,lo8(-1)
	cp r9,r18
	brne .L676
.LM915:
	cp r10,r8
	brge .L677
	lds r24,_ZZ11menuProcMixhE7s_pgOfs
	ldi r25,lo8(0)
.LVL627:
	sbiw r24,1
.LVL628:
.LBB589:
.LBB590:
.LM916:
	ldi r18,hi8(-1)
	cpi r24,lo8(-1)
	cpc r25,r18
	brne .L678
	ldi r24,lo8(0)
	ldi r25,hi8(0)
.L678:
.LBE590:
.LBE589:
.LM917:
	sts _ZZ11menuProcMixhE7s_pgOfs,r24
.LVL629:
.L677:
.LM918:
	cp r13,r10
	brge .L682
	rjmp .L684
.LVL630:
.L676:
.LM919:
	ldi r24,lo8(1)
	cp r24,r9
	brlt .L680
	lds r24,_ZZ11menuProcMixhE7s_pgOfs
	ldi r25,lo8(0)
.LVL631:
	sbiw r24,1
.LVL632:
.LBB591:
.LBB592:
.LM920:
	ldi r18,hi8(-1)
	cpi r24,lo8(-1)
	cpc r25,r18
	brne .L685
	ldi r24,lo8(0)
	ldi r25,hi8(0)
	rjmp .L685
.LVL633:
.L680:
.LBE592:
.LBE591:
.LM921:
	ldi r24,lo8(4)
	cp r24,r9
	brge .L682
	ldi r25,lo8(6)
	cp r25,r11
	brsh .L682
.LVL634:
.L684:
	lds r24,_ZZ11menuProcMixhE7s_pgOfs
.LVL635:
	subi r24,lo8(-(1))
.LVL636:
.L685:
	sts _ZZ11menuProcMixhE7s_pgOfs,r24
.LVL637:
.L682:
/* epilogue start */
.LBE579:
.LM922:
	pop r29
	pop r28
.LVL638:
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
.LVL639:
	pop r12
.LVL640:
	pop r11
.LVL641:
	pop r10
.LVL642:
	pop r9
.LVL643:
	pop r8
.LVL644:
	pop r7
.LVL645:
	pop r6
	pop r5
	ret
.LFE21:
	.size	_Z11menuProcMixh, .-_Z11menuProcMixh
.global	_Z13menuProcCurveh
	.type	_Z13menuProcCurveh, @function
_Z13menuProcCurveh:
.LFB17:
.LM923:
.LVL646:
	push r6
	push r7
	push r9
	push r10
	push r11
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
	mov r17,r24
.LBB593:
.LM924:
	ldi r24,lo8(0)
.LVL647:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ13menuProcCurvehE3__c)
	ldi r21,hi8(_ZZ13menuProcCurvehE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM925:
	ldi r24,lo8(_ZZ13menuProcCurvehE7mstate2)
	ldi r25,hi8(_ZZ13menuProcCurvehE7mstate2)
	mov r22,r17
	ldi r20,lo8(7)
	ldi r18,lo8(menuTabModel)
	ldi r19,hi8(menuTabModel)
	ldi r16,lo8(7)
	ldi r23,lo8(16)
	mov r14,r23
	call _ZN7MState27check_vEhhPPFvhEhh
.LM926:
	lds r25,_ZZ13menuProcCurvehE7mstate2
	mov r16,r25
	subi r16,lo8(-(-1))
.LM927:
	cp __zero_reg__,r16
	brlt .L688
	sts _ZZ13menuProcCurvehE7s_pgOfs,__zero_reg__
	rjmp .L689
.L688:
.LM928:
	mov r18,r16
	clr r19
	sbrc r18,7
	com r19
	lds r24,_ZZ13menuProcCurvehE7s_pgOfs
	sub r18,r24
	sbc r19,__zero_reg__
	cpi r18,7
	cpc r19,__zero_reg__
	brlt .L690
	subi r25,lo8(-(-7))
	sts _ZZ13menuProcCurvehE7s_pgOfs,r25
	rjmp .L689
.L690:
.LM929:
	sbrs r19,7
	rjmp .L689
	sts _ZZ13menuProcCurvehE7s_pgOfs,r16
.L689:
.LM930:
	cpi r17,lo8(96)
	breq .L692
	cpi r17,lo8(-65)
	brne .L691
.LM931:
	sts _ZZ13menuProcCurvehE7s_pgOfs,__zero_reg__
	rjmp .L691
.L692:
.LM932:
	sbrc r16,7
	rjmp .L691
.LM933:
	sts _ZL11s_curveChan,r16
.LM934:
	ldi r24,lo8(gs(_Z16menuProcCurveOneh))
	ldi r25,hi8(gs(_Z16menuProcCurveOneh))
	call _Z8pushMenuPFvhE
.L691:
	ldi r21,lo8(8)
	mov r13,r21
.LVL648:
	clr r12
	inc r12
.LVL649:
	clr r9
.LVL650:
	clr r10
.LVL651:
.LBB594:
.LBB595:
.LM935:
	mov r6,r16
	clr r7
	sbrc r6,7
	com r7
.LVL652:
.L708:
.LM936:
	lds r16,_ZZ13menuProcCurvehE7s_pgOfs
.LVL653:
	add r16,r10
.LM937:
	mov r28,r16
	ldi r29,lo8(0)
	cp r6,r28
	cpc r7,r29
	breq .L694
	ldi r17,lo8(0)
.LVL654:
	rjmp .L695
.LVL655:
.L694:
	ldi r17,lo8(2)
.LVL656:
.L695:
.LM938:
	clr r11
	cpi r16,lo8(8)
	brlo .L697
	clr r11
	inc r11
.LM939:
	ldi r24,lo8(6)
	cp r24,r12
	brsh .L699
	rjmp .L698
.L697:
.LM940:
	ldi r30,lo8(7)
	cp r30,r12
	brsh .+2
	rjmp .L698
.L699:
.LM941:
	tst r9
	brne .L700
	mov r9,r17
.L700:
.LM942:
	ldi r24,lo8(0)
	mov r22,r13
	ldi r20,lo8(_ZZ13menuProcCurvehE3__c_0)
	ldi r21,hi8(_ZZ13menuProcCurvehE3__c_0)
	mov r18,r17
	call _Z11lcd_putsAtthhPKch
.LM943:
	cpi r16,lo8(9)
	brlo .L701
	ldi r24,lo8(23)
	rjmp .L702
.L701:
	ldi r24,lo8(18)
.L702:
	movw r20,r28
	subi r20,lo8(-(1))
	sbci r21,hi8(-(1))
	mov r22,r13
	mov r18,r17
	call _Z13lcd_outdezAtthhih
.LM944:
	tst r11
	breq .L703
	movw r24,r28
	sbiw r24,8
	movw r18,r24
.LVL657:
	ldi r20,3
1:	lsl r18
	rol r19
	dec r20
	brne 1b
	add r18,r24
	adc r19,r25
	subi r18,lo8(-(g_model+323))
	sbci r19,hi8(-(g_model+323))
	rjmp .L704
.LVL658:
.L703:
	movw r18,r28
.LVL659:
	lsl r18
	rol r19
	lsl r18
	rol r19
.LVL660:
	add r18,r28
	adc r19,r29
	subi r18,lo8(-(g_model+283))
	sbci r19,hi8(-(g_model+283))
.LVL661:
.L704:
	movw r28,r18
	movw r14,r18
.LVL662:
	ldi r16,lo8(42)
.LVL663:
.L705:
.LBB596:
.LM945:
	movw r30,r14
	ld r20,Z+
	movw r14,r30
	clr r21
	sbrc r20,7
	com r21
	mov r24,r16
	mov r22,r13
	ldi r18,lo8(0)
	call _Z13lcd_outdezAtthhih
	subi r16,lo8(-(21))
.LM946:
	cpi r16,lo8(-109)
	brne .L705
.LBE596:
.LM947:
	ldi r31,lo8(8)
	add r13,r31
	inc r12
.LM948:
	tst r11
	breq .L706
	ldi r16,lo8(42)
.L707:
.LBB597:
.LM949:
	ldd r20,Y+5
	clr r21
	sbrc r20,7
	com r21
	mov r24,r16
	mov r22,r13
	ldi r18,lo8(0)
	call _Z13lcd_outdezAtthhih
	adiw r28,1
	subi r16,lo8(-(21))
.LM950:
	cpi r16,lo8(126)
	brne .L707
.LBE597:
.LM951:
	ldi r24,lo8(8)
	add r13,r24
	inc r12
.L706:
.LBE595:
.LM952:
	inc r10
	ldi r30,lo8(7)
	cp r10,r30
	breq .+2
	rjmp .L708
.LVL664:
.L698:
.LBE594:
.LM953:
	tst r9
	brne .L710
	lds r24,_ZZ13menuProcCurvehE7s_pgOfs
	subi r24,lo8(-(1))
	sts _ZZ13menuProcCurvehE7s_pgOfs,r24
.L710:
/* epilogue start */
.LBE593:
.LM954:
	pop r29
	pop r28
	pop r17
.LVL665:
	pop r16
.LVL666:
	pop r15
	pop r14
	pop r13
.LVL667:
	pop r12
.LVL668:
	pop r11
.LVL669:
	pop r10
.LVL670:
	pop r9
.LVL671:
	pop r7
	pop r6
.LVL672:
	ret
.LFE17:
	.size	_Z13menuProcCurveh, .-_Z13menuProcCurveh
.global	_Z16menuProcCurveOneh
	.type	_Z16menuProcCurveOneh, @function
_Z16menuProcCurveOneh:
.LFB16:
.LM955:
.LVL673:
	push r8
	push r9
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r29
	push r28
	push __tmp_reg__
	in r28,__SP_L__
	in r29,__SP_H__
/* prologue: function */
/* frame size = 1 */
	mov r12,r24
.LBB598:
.LM956:
	ldi r24,lo8(0)
.LVL674:
	ldi r22,lo8(0)
	ldi r20,lo8(_ZZ16menuProcCurveOnehE3__c)
	ldi r21,hi8(_ZZ16menuProcCurveOnehE3__c)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM957:
	lds r20,_ZL11s_curveChan
	ldi r21,lo8(0)
	subi r20,lo8(-(1))
	sbci r21,hi8(-(1))
	ldi r22,lo8(0)
	ldi r18,lo8(1)
	call _Z13lcd_outdezAtthhih
.LM958:
	clr r13
.LVL675:
	lds r24,_ZL11s_curveChan
	cpi r24,lo8(8)
	brlo .L742
	clr r13
	inc r13
.LM959:
	ldi r21,lo8(9)
	rjmp .L717
.L742:
	ldi r21,lo8(5)
.L717:
	ldi r24,lo8(_ZZ16menuProcCurveOnehE7mstate2)
	ldi r25,hi8(_ZZ16menuProcCurveOnehE7mstate2)
	mov r22,r12
	ldi r20,lo8(0)
	ldi r18,lo8(0)
	ldi r19,hi8(0)
	ldi r16,lo8(0)
	mov r14,r21
	call _ZN7MState27check_vEhhPPFvhEhh
.LM960:
	lds r11,_ZZ16menuProcCurveOnehE7mstate2
.LVL676:
	lds r22,_ZL11s_curveChan
.LM961:
	tst r13
	breq .L718
	mov r24,r22
	ldi r25,lo8(0)
	sbiw r24,8
	movw r8,r24
.LVL677:
	ldi r27,3
1:	lsl r8
	rol r9
	dec r27
	brne 1b
	add r8,r24
	adc r9,r25
	ldi r20,lo8(g_model+323)
	ldi r21,hi8(g_model+323)
	add r8,r20
	adc r9,r21
	rjmp .L719
.LVL678:
.L718:
	ldi r24,lo8(5)
	mul r22,r24
	movw r8,r0
	clr r1
.LVL679:
	ldi r24,lo8(g_model+283)
	ldi r25,hi8(g_model+283)
	add r8,r24
	adc r9,r25
.L719:
	ldi r16,lo8(0)
	ldi r17,hi8(0)
	ldi r25,lo8(16)
.LBB609:
.LBB610:
.LM962:
	mov r14,r11
	clr r15
	sbrc r14,7
	com r15
.L722:
	cp r14,r16
	cpc r15,r17
	breq .L720
	ldi r18,lo8(0)
.LVL680:
	rjmp .L721
.LVL681:
.L720:
	ldi r18,lo8(2)
.LVL682:
.L721:
.LM963:
	movw r30,r8
	add r30,r16
	adc r31,r17
	ld r20,Z
	clr r21
	sbrc r20,7
	com r21
	ldi r24,lo8(24)
	mov r22,r25
	std Y+1,r25
	call _Z13lcd_outdezAtthhih
.LVL683:
	subi r16,lo8(-(1))
	sbci r17,hi8(-(1))
	ldd r25,Y+1
	subi r25,lo8(-(8))
.LBE610:
.LM964:
	cpi r25,lo8(56)
	brne .L722
.LBE609:
.LM965:
	tst r13
	breq .L723
	ldi r16,lo8(5)
	ldi r17,hi8(5)
	ldi r25,lo8(16)
.L726:
.LBB607:
.LBB608:
.LM966:
	cp r14,r16
	cpc r15,r17
	breq .L724
	ldi r18,lo8(0)
.LVL684:
	rjmp .L725
.LVL685:
.L724:
	ldi r18,lo8(2)
.LVL686:
.L725:
.LM967:
	movw r30,r8
	add r30,r16
	adc r31,r17
	ld r20,Z
	clr r21
	sbrc r20,7
	com r21
	ldi r24,lo8(48)
	mov r22,r25
	std Y+1,r25
	call _Z13lcd_outdezAtthhih
.LVL687:
	subi r16,lo8(-(1))
	sbci r17,hi8(-(1))
	ldd r25,Y+1
	subi r25,lo8(-(8))
.LBE608:
.LM968:
	cpi r25,lo8(48)
	brne .L726
	rjmp .L749
.L723:
	ldi r24,lo8(5)
	ldi r25,hi8(5)
.L740:
.LBE607:
.LM969:
	cp r14,r24
	cpc r15,r25
	breq .L728
	ldi r18,lo8(0)
	rjmp .L729
.L728:
	ldi r18,lo8(2)
.L729:
	ldi r24,lo8(12)
	ldi r22,lo8(56)
	ldi r20,lo8(_ZZ16menuProcCurveOnehE3__c_0)
	ldi r21,hi8(_ZZ16menuProcCurveOnehE3__c_0)
	call _Z11lcd_putsAtthhPKch
.LM970:
	tst r13
	brne .L730
	ldi r24,lo8(5)
	ldi r25,hi8(5)
	rjmp .L731
.L730:
	ldi r24,lo8(9)
	ldi r25,hi8(9)
.L731:
	cp r14,r24
	cpc r15,r25
	brge .L732
.LBB605:
.LBB606:
.LM971:
	mov r24,r11
	clr r25
	sbrc r24,7
	com r25
.LVL688:
	add r8,r24
	adc r9,r25
	mov r24,r12
.LVL689:
	movw r22,r8
	ldi r20,lo8(-100)
	ldi r21,hi8(-100)
	ldi r18,lo8(100)
	ldi r19,hi8(100)
	ldi r16,lo8(2)
	call _Z15checkIncDecGen2hPviih
.LVL690:
.L734:
	clr r12
	clr r13
.LVL691:
	ldi r16,lo8(-512)
	ldi r17,hi8(-512)
.LBE606:
.LBE605:
.LBB602:
.LBB603:
.LM972:
	ldi r26,lo8(32)
	mov r14,r26
	rjmp .L733
.LVL692:
.L732:
.LBE603:
.LBE602:
.LM973:
	mov r24,r12
	ldi r22,lo8(_ZZ16menuProcCurveOnehE7dfltCrv)
	ldi r23,hi8(_ZZ16menuProcCurveOnehE7dfltCrv)
	ldi r20,lo8(-4)
	ldi r21,hi8(-4)
	ldi r18,lo8(4)
	ldi r19,hi8(4)
	ldi r16,lo8(0)
	call _Z15checkIncDecGen2hPviih
	tst r24
	breq .L734
.LM974:
	tst r13
	breq .L735
	movw r30,r8
	ldi r18,lo8(-400)
	ldi r19,hi8(-400)
.L736:
.LBB601:
	lds r24,_ZZ16menuProcCurveOnehE7dfltCrv
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
	ldi r22,lo8(16)
	ldi r23,hi8(16)
	call __divmodhi4
	st Z+,r22
	subi r18,lo8(-(100))
	sbci r19,hi8(-(100))
	ldi r21,hi8(500)
	cpi r18,lo8(500)
	cpc r19,r21
	brne .L736
	rjmp .L737
.L735:
	movw r30,r8
	ldi r18,lo8(-200)
	ldi r19,hi8(-200)
.L738:
.LBE601:
.LBB600:
.LM975:
	lds r24,_ZZ16menuProcCurveOnehE7dfltCrv
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
	ldi r22,lo8(8)
	ldi r23,hi8(8)
	call __divmodhi4
	st Z+,r22
	subi r18,lo8(-(100))
	sbci r19,hi8(-(100))
	ldi r21,hi8(300)
	cpi r18,lo8(300)
	cpc r19,r21
	brne .L738
.L737:
.LBE600:
.LM976:
	ldi r24,lo8(2)
	call _Z7eeDirtyh
	rjmp .L734
.LVL693:
.L733:
.LBB599:
.LBB604:
.LM977:
	movw r24,r16
	lds r22,_ZL11s_curveChan
	call _Z6intpolih
	ldi r31,lo8(62)
	mov r15,r31
	add r15,r12
.LM978:
	ldi r30,4
1:	lsr r25
	ror r24
	dec r30
	brne 1b
	mov r22,r14
	sub r22,r24
	mov r24,r15
	call _Z8lcd_plothh
.LM979:
	movw r24,r12
	andi r24,lo8(3)
	andi r25,hi8(3)
	or r24,r25
	brne .L739
.LM980:
	mov r24,r15
	ldi r22,lo8(32)
	call _Z8lcd_plothh
.L739:
	sec
	adc r12,__zero_reg__
	adc r13,__zero_reg__
	subi r16,lo8(-(16))
	sbci r17,hi8(-(16))
.LBE604:
.LM981:
	ldi r24,lo8(64)
	cp r12,r24
	cpc r13,__zero_reg__
	brne .L733
.LBE599:
.LM982:
	ldi r24,lo8(94)
	ldi r22,lo8(0)
	ldi r20,lo8(64)
	call _Z9lcd_vlinehha
/* epilogue start */
.LBE598:
.LM983:
	pop __tmp_reg__
	pop r28
	pop r29
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
.LVL694:
	pop r12
	pop r11
.LVL695:
	pop r9
	pop r8
.LVL696:
	ret
.LVL697:
.L749:
.LBB611:
	ldi r24,lo8(9)
	ldi r25,hi8(9)
	rjmp .L740
.LBE611:
.LFE16:
	.size	_Z16menuProcCurveOneh, .-_Z16menuProcCurveOneh
.global	_Z14menuProcMixOneh
	.type	_Z14menuProcMixOneh, @function
_Z14menuProcMixOneh:
.LFB19:
.LM984:
.LVL698:
	push r2
	push r3
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
	push r17
	push r29
	push r28
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,12
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 12 */
	mov r15,r24
.LBB612:
.LM985:
	lds r24,_ZL16s_currMixInsMode
.LVL699:
	tst r24
	brne .L751
	ldi r20,lo8(_ZZ14menuProcMixOnehE3__c_0)
	ldi r21,hi8(_ZZ14menuProcMixOnehE3__c_0)
	rjmp .L752
.L751:
	ldi r20,lo8(_ZZ14menuProcMixOnehE3__c)
	ldi r21,hi8(_ZZ14menuProcMixOnehE3__c)
.L752:
	ldi r24,lo8(0)
	ldi r22,lo8(0)
	ldi r18,lo8(1)
	call _Z11lcd_putsAtthhPKch
.LM986:
	lds r18,_ZL12s_currMixIdx
	clr r19
	sbrc r18,7
	com r19
.LM987:
	movw r12,r18
	lsl r12
	rol r13
	add r12,r18
	adc r13,r19
	movw r10,r12
	lsl r10
	rol r11
	ldi r22,lo8(g_model)
	mov r8,r22
	ldi r22,hi8(g_model)
	mov r9,r22
	add r8,r10
	adc r9,r11
	subi r24,lo8(-(6))
	ldi r22,lo8(0)
	movw r30,r8
	ldd r20,Z+21
	ldi r18,lo8(0)
	call _Z7putsChnhhhh
.LM988:
	ldi r24,lo8(_ZZ14menuProcMixOnehE7mstate2)
	ldi r25,hi8(_ZZ14menuProcMixOnehE7mstate2)
	mov r22,r15
	ldi r20,lo8(0)
	ldi r18,lo8(0)
	ldi r19,hi8(0)
	ldi r16,lo8(0)
	ldi r21,lo8(7)
	mov r14,r21
	call _ZN7MState27check_vEhhPPFvhEhh
.LM989:
	lds r24,_ZZ14menuProcMixOnehE7mstate2
.LVL700:
.LBB613:
.LBB614:
.LM990:
	sec
	adc r12,__zero_reg__
	adc r13,__zero_reg__
	lsl r12
	rol r13
	movw r18,r12
	subi r18,lo8(-(g_model+21))
	sbci r19,hi8(-(g_model+21))
	std Y+6,r19
	std Y+5,r18
.LM991:
	movw r30,r10
	subi r30,lo8(-(g_model+25))
	sbci r31,hi8(-(g_model+25))
	std Y+4,r31
	std Y+3,r30
.LM992:
	movw r18,r10
	subi r18,lo8(-(g_model+24))
	sbci r19,hi8(-(g_model+24))
	std Y+2,r19
	std Y+1,r18
.LM993:
	ldi r25,lo8(_ZZ14menuProcMixOnehE3__c_1)
	mov r2,r25
	ldi r25,hi8(_ZZ14menuProcMixOnehE3__c_1)
	mov r3,r25
	clr r4
	clr r5
	clr r14
.LVL701:
.LM994:
	mov r30,r24
	clr r31
	sbrc r30,7
	com r31
	std Y+8,r31
	std Y+7,r30
.LM995:
	movw r18,r8
	subi r18,lo8(-(25))
	sbci r19,hi8(-(25))
	std Y+10,r19
	std Y+9,r18
.LM996:
	ldi r24,lo8(g_model+26)
	mov r6,r24
	ldi r24,hi8(g_model+26)
	mov r7,r24
.LVL702:
	add r6,r10
	adc r7,r11
.LM997:
	movw r24,r8
	adiw r24,24
	std Y+12,r25
	std Y+11,r24
.LM998:
	ldi r16,lo8(g_model+21)
	mov r8,r16
	ldi r16,hi8(g_model+21)
	mov r9,r16
	add r8,r12
	adc r9,r13
.LM999:
	ldi r30,lo8(g_model+22)
	ldi r31,hi8(g_model+22)
	add r10,r30
	adc r11,r31
.LVL703:
.L766:
.LM1000:
	mov r16,r4
	ldi r17,lo8(8)
	mov r12,r17
.LVL704:
	add r12,r14
.LM1001:
	ldd r18,Y+7
	ldd r19,Y+8
	cp r18,r4
	cpc r19,r5
	brne .L753
	ldi r17,lo8(2)
.LVL705:
	rjmp .L754
.LVL706:
.L753:
	ldi r17,lo8(0)
.LVL707:
.L754:
.LM1002:
	ldi r24,lo8(12)
	mov r22,r12
	movw r20,r2
	ldi r18,lo8(6)
	call _Z11lcd_putsn_PhhPKch
.LM1003:
	cpi r16,lo8(3)
	brne .+2
	rjmp .L759
	cpi r16,lo8(4)
	brsh .L764
	cpi r16,lo8(1)
	breq .L757
	cpi r16,lo8(2)
	brsh .L758
	rjmp .L771
.L764:
	cpi r16,lo8(5)
	brne .+2
	rjmp .L761
	cpi r16,lo8(5)
	brsh .+2
	rjmp .L760
	cpi r16,lo8(6)
	brne .+2
	rjmp .L762
	cpi r16,lo8(7)
	breq .+2
	rjmp .L755
	rjmp .L772
.L771:
.LM1004:
	movw r30,r10
	ld r20,Z
	andi r20,lo8(127)
	ldi r24,lo8(54)
	mov r22,r12
	mov r18,r17
	call _Z10putsChnRawhhhh
.LM1005:
	tst r17
	brne .+2
	rjmp .L755
	movw r30,r10
	ld r22,Z
	andi r22,lo8(127)
	mov r24,r15
	ldi r20,lo8(1)
	ldi r18,lo8(25)
	call _Z14checkIncDec_hmhaaa
	andi r24,lo8(127)
	movw r30,r10
	ld r25,Z
	andi r25,lo8(-128)
	rjmp .L769
.L757:
.LM1006:
	movw r30,r8
	ld r20,Z
	clr r21
	sbrc r20,7
	com r21
	ldi r24,lo8(69)
	mov r22,r12
	mov r18,r17
	call _Z13lcd_outdezAtthhih
.LM1007:
	tst r17
	brne .+2
	rjmp .L755
.LBB615:
.LBB616:
.LM1008:
	mov r24,r15
	ldd r22,Y+5
	ldd r23,Y+6
	ldi r20,lo8(-125)
	ldi r21,hi8(-125)
	ldi r18,lo8(125)
	ldi r19,hi8(125)
	rjmp .L770
.L758:
.LBE616:
.LBE615:
.LM1009:
	movw r30,r10
	ld r24,Z
	rol r24
	clr r24
	rol r24
	ldi r25,lo8(0)
	movw r20,r24
	lsl r20
	rol r21
	add r20,r24
	adc r21,r25
	subi r20,lo8(-(_ZZ14menuProcMixOnehE3__c_2))
	sbci r21,hi8(-(_ZZ14menuProcMixOnehE3__c_2))
	ldi r24,lo8(54)
	mov r22,r12
	ldi r18,lo8(3)
	mov r16,r17
.LVL708:
	call _Z12lcd_putsnAtthhPKchh
.LM1010:
	tst r17
	brne .+2
	rjmp .L755
	movw r30,r10
	ld r22,Z
	rol r22
	clr r22
	rol r22
	mov r24,r15
	ldi r20,lo8(0)
	ldi r18,lo8(1)
	call _Z14checkIncDec_hmhaaa
	ror r24
	clr r24
	ror r24
	movw r30,r10
	ld r25,Z
	andi r25,lo8(127)
	rjmp .L769
.LVL709:
.L759:
.LM1011:
	ldd r30,Y+9
	ldd r31,Y+10
	ld r20,Z
	mul r20,r16
	movw r20,r0
	clr r1
	subi r20,lo8(-(_ZZ14menuProcMixOnehE3__c_3))
	sbci r21,hi8(-(_ZZ14menuProcMixOnehE3__c_3))
	ldi r24,lo8(54)
	mov r22,r12
	ldi r18,lo8(3)
	mov r16,r17
.LVL710:
	call _Z12lcd_putsnAtthhPKchh
.LM1012:
	tst r17
	brne .+2
	rjmp .L755
.LBB617:
.LBB618:
.LM1013:
	mov r24,r15
	ldd r22,Y+3
	ldd r23,Y+4
	ldi r20,lo8(0)
	ldi r21,hi8(0)
	ldi r18,lo8(19)
	ldi r19,hi8(19)
	ldi r16,lo8(2)
	call _Z15checkIncDecGen2hPviih
.LBE618:
.LBE617:
.LM1014:
	ldd r30,Y+9
	ldd r31,Y+10
	ld r24,Z
	cpi r24,lo8(4)
	brsh .+2
	rjmp .L755
	ldi r31,lo8(96)
	cp r15,r31
	breq .+2
	rjmp .L755
.LM1015:
	subi r24,lo8(-(-4))
	sts _ZL11s_curveChan,r24
.LM1016:
	ldi r24,lo8(gs(_Z16menuProcCurveOneh))
	ldi r25,hi8(gs(_Z16menuProcCurveOneh))
	call _Z8pushMenuPFvhE
	rjmp .L755
.LVL711:
.L760:
.LM1017:
	ldi r24,lo8(48)
	mov r22,r12
	ldd r30,Y+11
	ldd r31,Y+12
	ld r20,Z
	mov r18,r17
	call _Z14putsDrSwitcheshhah
.LM1018:
	tst r17
	brne .+2
	rjmp .L755
.LBB619:
.LBB620:
.LM1019:
	mov r24,r15
	ldd r22,Y+1
	ldd r23,Y+2
	ldi r20,lo8(-10)
	ldi r21,hi8(-10)
	ldi r18,lo8(10)
	ldi r19,hi8(10)
.L770:
	ldi r16,lo8(2)
.LVL712:
	call _Z15checkIncDecGen2hPviih
	rjmp .L755
.LVL713:
.L761:
.LBE620:
.LBE619:
.LM1020:
	ldi r24,lo8(54)
	mov r22,r12
	ldi r20,lo8(60)
	ldi r18,lo8(0)
	call _Z11lcd_putcAtthhch
.LM1021:
	movw r30,r6
	ld r20,Z
	swap r20
	andi r20,0x0f
	ldi r24,lo8(72)
	mov r22,r12
	ldi r21,lo8(0)
	mov r18,r17
	call _Z13lcd_outdezAtthhih
.LM1022:
	tst r17
	brne .+2
	rjmp .L755
	movw r30,r6
	ld r22,Z
	swap r22
	andi r22,0x0f
	mov r24,r15
	ldi r20,lo8(0)
	ldi r18,lo8(15)
	call _Z14checkIncDec_hmhaaa
	swap r24
	andi r24,0xf0
	movw r30,r6
	ld r25,Z
	andi r25,lo8(15)
.LVL714:
.L769:
	or r25,r24
	st Z,r25
	rjmp .L755
.LVL715:
.L762:
.LM1023:
	ldi r24,lo8(78)
	mov r22,r14
	ldi r20,lo8(62)
	ldi r18,lo8(0)
	call _Z11lcd_putcAtthhch
.LM1024:
	movw r30,r6
	ld r20,Z
	andi r20,lo8(15)
	ldi r24,lo8(96)
	mov r22,r14
	ldi r21,lo8(0)
	mov r18,r17
	call _Z13lcd_outdezAtthhih
.LM1025:
	tst r17
	brne .+2
	rjmp .L755
.LVL716:
	movw r30,r6
	ld r22,Z
	andi r22,lo8(15)
	mov r24,r15
	ldi r20,lo8(0)
	ldi r18,lo8(15)
	call _Z14checkIncDec_hmhaaa
	andi r24,lo8(15)
	movw r30,r6
	ld r25,Z
	andi r25,lo8(-16)
	rjmp .L769
.LVL717:
.L772:
.LM1026:
	ldi r24,lo8(18)
	mov r22,r14
	ldi r20,lo8(_ZZ14menuProcMixOnehE3__c_4)
	ldi r21,hi8(_ZZ14menuProcMixOnehE3__c_4)
	mov r18,r17
	call _Z11lcd_putsAtthhPKch
.LM1027:
	ldi r24,lo8(36)
	mov r22,r14
	ldi r20,lo8(_ZZ14menuProcMixOnehE3__c_5)
	ldi r21,hi8(_ZZ14menuProcMixOnehE3__c_5)
	call _Z10lcd_puts_PhhPKc
.LM1028:
	tst r17
	breq .L755
.LVL718:
	ldi r31,lo8(96)
	cp r15,r31
	brne .L755
.LM1029:
	lds r18,_ZL12s_currMixIdx
	clr r19
	sbrc r18,7
	com r19
	movw r24,r18
	lsl r24
	rol r25
	add r24,r18
	adc r25,r19
	lsl r24
	rol r25
	movw r20,r18
	subi r20,lo8(-(1))
	sbci r21,hi8(-(1))
	movw r22,r20
	lsl r22
	rol r23
	add r22,r20
	adc r23,r21
	lsl r22
	rol r23
	subi r22,lo8(-(g_model+21))
	sbci r23,hi8(-(g_model+21))
	com r18
	com r19
	subi r18,lo8(-(25))
	sbci r19,hi8(-(25))
	movw r20,r18
	lsl r20
	rol r21
.LVL719:
	add r20,r18
	adc r21,r19
	lsl r20
	rol r21
.LVL720:
	subi r24,lo8(-(g_model+21))
	sbci r25,hi8(-(g_model+21))
	call memmove
.LM1030:
	ldi r24,lo8(6)
	ldi r30,lo8(g_model+165)
	ldi r31,hi8(g_model+165)
	st Z+,__zero_reg__
        dec r24
	brne .-6
.LM1031:
	ldi r24,lo8(2)
	call _Z7eeDirtyh
.LM1032:
	ldi r24,lo8(0)
	call _Z7popMenub
.LVL721:
.L755:
	sec
	adc r4,__zero_reg__
	adc r5,__zero_reg__
	ldi r18,lo8(6)
	ldi r19,hi8(6)
	add r2,r18
	adc r3,r19
.LBE614:
.LM1033:
	ldi r19,lo8(64)
	cp r12,r19
	breq .L767
	mov r14,r12
	rjmp .L766
.L767:
/* epilogue start */
.LBE613:
.LBE612:
.LM1034:
	adiw r28,12
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r28
	pop r29
	pop r17
.LVL722:
	pop r16
.LVL723:
	pop r15
.LVL724:
	pop r14
	pop r13
	pop r12
.LVL725:
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	pop r3
	pop r2
	ret
.LFE19:
	.size	_Z14menuProcMixOneh, .-_Z14menuProcMixOneh
.global	g_chans512
.global	g_chans512
	.section .bss
	.type	g_chans512, @object
	.size	g_chans512, 32
g_chans512:
	.skip 32,0
.global	sticks
	.section	.progmem.data,"a",@progbits
	.type	sticks, @object
	.size	sticks, 75
sticks:
	.byte	18
	.byte	8
	.byte	18
	.byte	0
	.byte	8
	.byte	28
	.byte	8
	.byte	8
	.byte	8
	.byte	28
	.byte	8
	.byte	0
	.byte	0
	.byte	8
	.byte	34
	.byte	0
	.byte	73
	.byte	0
	.byte	34
	.byte	8
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	34
	.byte	127
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	8
	.byte	34
	.byte	0
	.byte	73
	.byte	0
	.byte	34
	.byte	8
	.byte	0
	.byte	0
	.byte	8
	.byte	34
	.byte	0
	.byte	73
	.byte	0
	.byte	34
	.byte	8
	.byte	0
	.byte	0
	.byte	0
	.byte	34
	.byte	127
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	8
	.byte	34
	.byte	0
	.byte	73
	.byte	0
	.byte	34
	.byte	8
	.byte	0
	.byte	0
	.byte	8
	.byte	28
	.byte	8
	.byte	8
	.byte	8
	.byte	28
	.byte	8
	.byte	0
.global	menuTabModel
	.type	menuTabModel, @object
	.size	menuTabModel, 14
menuTabModel:
	.word	gs(_Z19menuProcModelSelecth)
	.word	gs(_Z13menuProcModelh)
	.word	gs(_Z15menuProcExpoAllh)
	.word	gs(_Z11menuProcMixh)
	.word	gs(_Z12menuProcTrimh)
	.word	gs(_Z14menuProcLimitsh)
	.word	gs(_Z13menuProcCurveh)
.global	menuTabDiag
	.type	menuTabDiag, @object
	.size	menuTabDiag, 14
menuTabDiag:
	.word	gs(_Z14menuProcSetup0h)
	.word	gs(_Z14menuProcSetup1h)
	.word	gs(_Z15menuProcTrainerh)
	.word	gs(_Z16menuProcDiagVersh)
	.word	gs(_Z16menuProcDiagKeysh)
	.word	gs(_Z15menuProcDiagAnah)
	.word	gs(_Z17menuProcDiagCalibh)
.global	s_mixTab
.global	s_mixTab
	.section .bss
	.type	s_mixTab, @object
	.size	s_mixTab, 252
s_mixTab:
	.skip 252,0
.global	s_mixMaxSel
.global	s_mixMaxSel
	.type	s_mixMaxSel, @object
	.size	s_mixMaxSel, 1
s_mixMaxSel:
	.skip 1,0
.global	s_timeCumTot
.global	s_timeCumTot
	.type	s_timeCumTot, @object
	.size	s_timeCumTot, 2
s_timeCumTot:
	.skip 2,0
.global	s_timeCumAbs
.global	s_timeCumAbs
	.type	s_timeCumAbs, @object
	.size	s_timeCumAbs, 2
s_timeCumAbs:
	.skip 2,0
.global	s_timeCumThr
.global	s_timeCumThr
	.type	s_timeCumThr, @object
	.size	s_timeCumThr, 2
s_timeCumThr:
	.skip 2,0
.global	s_timeCum16ThrP
.global	s_timeCum16ThrP
	.type	s_timeCum16ThrP, @object
	.size	s_timeCum16ThrP, 2
s_timeCum16ThrP:
	.skip 2,0
.global	s_timerState
.global	s_timerState
	.type	s_timerState, @object
	.size	s_timerState, 1
s_timerState:
	.skip 1,0
.global	s_timerVal
.global	s_timerVal
	.type	s_timerVal, @object
	.size	s_timerVal, 2
s_timerVal:
	.skip 2,0
.global	s_traceBuf
.global	s_traceBuf
	.type	s_traceBuf, @object
	.size	s_traceBuf, 120
s_traceBuf:
	.skip 120,0
.global	s_traceWr
.global	s_traceWr
	.type	s_traceWr, @object
	.size	s_traceWr, 2
s_traceWr:
	.skip 2,0
.global	s_traceCnt
.global	s_traceCnt
	.type	s_traceCnt, @object
	.size	s_traceCnt, 2
s_traceCnt:
	.skip 2,0
.global	g_tmr1Latency_max
.global	g_tmr1Latency_max
	.type	g_tmr1Latency_max, @object
	.size	g_tmr1Latency_max, 2
g_tmr1Latency_max:
	.skip 2,0
.global	g_tmr1Latency_min
	.data
	.type	g_tmr1Latency_min, @object
	.size	g_tmr1Latency_min, 2
g_tmr1Latency_min:
	.word	2047
.global	g_timeMain
.global	g_timeMain
	.section .bss
	.type	g_timeMain, @object
	.size	g_timeMain, 2
g_timeMain:
	.skip 2,0
.global	pulses2MHz
.global	pulses2MHz
	.type	pulses2MHz, @object
	.size	pulses2MHz, 120
pulses2MHz:
	.skip 120,0
.global	pulses2MHzPtr
.global	pulses2MHzPtr
	.type	pulses2MHzPtr, @object
	.size	pulses2MHzPtr, 2
pulses2MHzPtr:
	.skip 2,0
	.section	.progmem.data
	.type	_ZZ24setupPulsesTracerCtp1009vE3__c, @object
	.size	_ZZ24setupPulsesTracerCtp1009vE3__c, 19
_ZZ24setupPulsesTracerCtp1009vE3__c:
	.string	"pulse tab overflow"
	.lcomm _ZZ24setupPulsesTracerCtp1009vE5phase,1
	.lcomm _ZL8anaCalib,8
	.lcomm _ZL16s_cacheLimitsMax,32
	.lcomm _ZL16s_cacheLimitsMin,32
	.type	_ZZ6perOutPiE5tmr_t, @object
	.size	_ZZ6perOutPiE5tmr_t, 15
_ZZ6perOutPiE5tmr_t:
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	2
	.byte	1
	.byte	3
	.byte	2
	.byte	3
	.byte	4
	.byte	6
	.byte	9
	.type	_ZZ6perOutPiE5dlt_t, @object
	.size	_ZZ6perOutPiE5dlt_t, 15
_ZZ6perOutPiE5dlt_t:
	.byte	18
	.byte	13
	.byte	9
	.byte	6
	.byte	4
	.byte	3
	.byte	2
	.byte	3
	.byte	1
	.byte	2
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.lcomm _ZZ6perOutPiE3act,50
	.lcomm _ZZ6perOutPiE5timer,25
	.lcomm _ZZ6perOutPiE5chans,64
	.lcomm _ZZ6perOutPiE4anas,50
	.lcomm _ZL14s_limitCacheOk,1
	.data
	.type	_ZZ9menuProc0hE4vert, @object
	.size	_ZZ9menuProc0hE4vert, 4
_ZZ9menuProc0hE4vert:
	.byte	0
	.byte	1
	.byte	1
	.byte	0
	.type	_ZZ9menuProc0hE1x, @object
	.size	_ZZ9menuProc0hE1x, 4
_ZZ9menuProc0hE1x:
	.byte	34
	.byte	4
	.byte	124
	.byte	94
	.section	.progmem.data
	.type	_ZZ9menuProc0hE3__c_3, @object
	.size	_ZZ9menuProc0hE3__c_3, 13
_ZZ9menuProc0hE3__c_3:
	.string	"TME THR THR%"
	.type	_ZZ9menuProc0hE3__c_2, @object
	.size	_ZZ9menuProc0hE3__c_2, 4
_ZZ9menuProc0hE3__c_2:
	.string	"BAT"
	.type	_ZZ9menuProc0hE3__c_1, @object
	.size	_ZZ9menuProc0hE3__c_1, 9
_ZZ9menuProc0hE3__c_1:
	.string	"    TTrm"
	.type	_ZZ9menuProc0hE3__c_0, @object
	.size	_ZZ9menuProc0hE3__c_0, 22
_ZZ9menuProc0hE3__c_0:
	.string	"Exp ExF Fine Med Crse"
	.type	_ZZ9menuProc0hE3__c, @object
	.size	_ZZ9menuProc0hE3__c, 5
_ZZ9menuProc0hE3__c:
	.string	"ER9x"
	.lcomm _ZZ9menuProc0hE13s_lastPopMenu,4
	.lcomm _ZZ9menuProc0hE3sub,1
	.type	_ZZ17menuProcStatistichE3__c_3, @object
	.size	_ZZ17menuProcStatistichE3__c_3, 5
_ZZ17menuProcStatistichE3__c_3:
	.string	"THR%"
	.type	_ZZ17menuProcStatistichE3__c_2, @object
	.size	_ZZ17menuProcStatistichE3__c_2, 4
_ZZ17menuProcStatistichE3__c_2:
	.string	"THR"
	.type	_ZZ17menuProcStatistichE3__c_1, @object
	.size	_ZZ17menuProcStatistichE3__c_1, 4
_ZZ17menuProcStatistichE3__c_1:
	.string	"TOT"
	.type	_ZZ17menuProcStatistichE3__c_0, @object
	.size	_ZZ17menuProcStatistichE3__c_0, 4
_ZZ17menuProcStatistichE3__c_0:
	.string	"TME"
	.type	_ZZ17menuProcStatistichE3__c, @object
	.size	_ZZ17menuProcStatistichE3__c, 5
_ZZ17menuProcStatistichE3__c:
	.string	"STAT"
	.type	_ZZ18menuProcStatistic2hE3__c_3, @object
	.size	_ZZ18menuProcStatistic2hE3__c_3, 18
_ZZ18menuProcStatistic2hE3__c_3:
	.string	"tmain          ms"
	.type	_ZZ18menuProcStatistic2hE3__c_2, @object
	.size	_ZZ18menuProcStatistic2hE3__c_2, 18
_ZZ18menuProcStatistic2hE3__c_2:
	.string	"tmr1 Jitter    us"
	.type	_ZZ18menuProcStatistic2hE3__c_1, @object
	.size	_ZZ18menuProcStatistic2hE3__c_1, 18
_ZZ18menuProcStatistic2hE3__c_1:
	.string	"tmr1Lat min    us"
	.type	_ZZ18menuProcStatistic2hE3__c_0, @object
	.size	_ZZ18menuProcStatistic2hE3__c_0, 18
_ZZ18menuProcStatistic2hE3__c_0:
	.string	"tmr1Lat max    us"
	.type	_ZZ18menuProcStatistic2hE3__c, @object
	.size	_ZZ18menuProcStatistic2hE3__c, 6
_ZZ18menuProcStatistic2hE3__c:
	.string	"STAT2"
	.lcomm _ZZ5tracehE5s_sum,2
	.lcomm _ZZ5tracehE5s_cnt,2
	.lcomm _ZZ5tracehE6s_time,2
	.lcomm _ZZ5timerhE8last_tmr,2
	.lcomm _ZZ5timerhE5s_sum,2
	.lcomm _ZZ5timerhE5s_cnt,2
	.lcomm _ZZ5timerhE6s_time,2
	.type	_ZZ14menuProcSetup0hE3__c_3, @object
	.size	_ZZ14menuProcSetup0hE3__c_3, 5
_ZZ14menuProcSetup0hE3__c_3:
	.string	"Mode"
	.type	_ZZ14menuProcSetup0hE3__c_2, @object
	.size	_ZZ14menuProcSetup0hE3__c_2, 6
_ZZ14menuProcSetup0hE3__c_2:
	.string	"LIGHT"
	.type	_ZZ14menuProcSetup0hE3__c_1, @object
	.size	_ZZ14menuProcSetup0hE3__c_1, 14
_ZZ14menuProcSetup0hE3__c_1:
	.string	"V BAT WARNING"
	.type	_ZZ14menuProcSetup0hE3__c_0, @object
	.size	_ZZ14menuProcSetup0hE3__c_0, 9
_ZZ14menuProcSetup0hE3__c_0:
	.string	"CONTRAST"
	.type	_ZZ14menuProcSetup0hE3__c, @object
	.size	_ZZ14menuProcSetup0hE3__c, 12
_ZZ14menuProcSetup0hE3__c:
	.string	"SETUP BASIC"
	.lcomm _ZZ14menuProcSetup0hE7mstate2,4
	.type	_ZZ14menuProcSetup1hE3__c_2, @object
	.size	_ZZ14menuProcSetup1hE3__c_2, 4
_ZZ14menuProcSetup1hE3__c_2:
	.string	"OFF"
	.type	_ZZ14menuProcSetup1hE3__c_1, @object
	.size	_ZZ14menuProcSetup1hE3__c_1, 3
_ZZ14menuProcSetup1hE3__c_1:
	.string	"ON"
	.type	_ZZ14menuProcSetup1hE3__c_0, @object
	.size	_ZZ14menuProcSetup1hE3__c_0, 33
_ZZ14menuProcSetup1hE3__c_0:
	.string	"THR WarnSW  WarnMem WarnBeeper  "
	.type	_ZZ14menuProcSetup1hE3__c, @object
	.size	_ZZ14menuProcSetup1hE3__c, 11
_ZZ14menuProcSetup1hE3__c:
	.string	"SETUP OPTS"
	.lcomm _ZZ14menuProcSetup1hE7mstate2,4
	.type	_ZZ15menuProcTrainerhE3__c_3, @object
	.size	_ZZ15menuProcTrainerhE3__c_3, 4
_ZZ15menuProcTrainerhE3__c_3:
	.string	"Cal"
	.type	_ZZ15menuProcTrainerhE3__c_2, @object
	.size	_ZZ15menuProcTrainerhE3__c_2, 13
_ZZ15menuProcTrainerhE3__c_2:
	.string	"ch1ch2ch3ch4"
	.type	_ZZ15menuProcTrainerhE3__c_1, @object
	.size	_ZZ15menuProcTrainerhE3__c_1, 10
_ZZ15menuProcTrainerhE3__c_1:
	.string	"off += :="
	.type	_ZZ15menuProcTrainerhE3__c_0, @object
	.size	_ZZ15menuProcTrainerhE3__c_0, 17
_ZZ15menuProcTrainerhE3__c_0:
	.string	"mode prc src swt"
	.type	_ZZ15menuProcTrainerhE3__c, @object
	.size	_ZZ15menuProcTrainerhE3__c, 8
_ZZ15menuProcTrainerhE3__c:
	.string	"TRAINER"
	.type	_ZZ15menuProcTrainerhE10mstate_tab, @object
	.size	_ZZ15menuProcTrainerhE10mstate_tab, 2
_ZZ15menuProcTrainerhE10mstate_tab:
	.byte	4
	.byte	4
	.lcomm _ZZ15menuProcTrainerhE7mstate2,4
	.type	_ZZ16menuProcDiagVershE3__c, @object
	.size	_ZZ16menuProcDiagVershE3__c, 8
_ZZ16menuProcDiagVershE3__c:
	.string	"VERSION"
	.lcomm _ZZ16menuProcDiagVershE7mstate2,4
	.type	_ZZ16menuProcDiagKeyshE3__c_1, @object
	.size	_ZZ16menuProcDiagKeyshE3__c_1, 8
_ZZ16menuProcDiagKeyshE3__c_1:
	.string	"Trim- +"
	.type	_ZZ16menuProcDiagKeyshE3__c_0, @object
	.size	_ZZ16menuProcDiagKeyshE3__c_0, 31
_ZZ16menuProcDiagKeyshE3__c_0:
	.string	" Menu Exit Down   UpRight Left"
	.type	_ZZ16menuProcDiagKeyshE3__c, @object
	.size	_ZZ16menuProcDiagKeyshE3__c, 5
_ZZ16menuProcDiagKeyshE3__c:
	.string	"DIAG"
	.lcomm _ZZ16menuProcDiagKeyshE7mstate2,4
	.type	_ZZ15menuProcDiagAnahE3__c_0, @object
	.size	_ZZ15menuProcDiagAnahE3__c_0, 17
_ZZ15menuProcDiagAnahE3__c_0:
	.string	"A1A2A3A4A5A6A7A8"
	.type	_ZZ15menuProcDiagAnahE3__c, @object
	.size	_ZZ15menuProcDiagAnahE3__c, 4
_ZZ15menuProcDiagAnahE3__c:
	.string	"ANA"
	.lcomm _ZZ15menuProcDiagAnahE7mstate2,4
	.type	_ZZ17menuProcDiagCalibhE3__c_2, @object
	.size	_ZZ17menuProcDiagCalibhE3__c_2, 7
_ZZ17menuProcDiagCalibhE3__c_2:
	.string	"<    >"
	.type	_ZZ17menuProcDiagCalibhE3__c_1, @object
	.size	_ZZ17menuProcDiagCalibhE3__c_1, 9
_ZZ17menuProcDiagCalibhE3__c_1:
	.string	"A1A2A3A4"
	.type	_ZZ17menuProcDiagCalibhE3__c_0, @object
	.size	_ZZ17menuProcDiagCalibhE3__c_0, 29
_ZZ17menuProcDiagCalibhE3__c_0:
	.string	"SetMid SetLow SetHighReady  "
	.type	_ZZ17menuProcDiagCalibhE3__c, @object
	.size	_ZZ17menuProcDiagCalibhE3__c, 6
_ZZ17menuProcDiagCalibhE3__c:
	.string	"CALIB"
	.lcomm _ZZ17menuProcDiagCalibhE7lowVals,8
	.lcomm _ZZ17menuProcDiagCalibhE7midVals,8
	.lcomm _ZZ17menuProcDiagCalibhE7mstate2,4
	.lcomm _ZZ19menuProcModelSelecthE3buf,15
	.type	_ZZ19menuProcModelSelecthE3__c_1, @object
	.size	_ZZ19menuProcModelSelecthE3__c_1, 4
_ZZ19menuProcModelSelecthE3__c_1:
	.string	"1/7"
	.type	_ZZ19menuProcModelSelecthE3__c_0, @object
	.size	_ZZ19menuProcModelSelecthE3__c_0, 5
_ZZ19menuProcModelSelecthE3__c_0:
	.string	"free"
	.type	_ZZ19menuProcModelSelecthE3__c, @object
	.size	_ZZ19menuProcModelSelecthE3__c, 9
_ZZ19menuProcModelSelecthE3__c:
	.string	"MODELSEL"
	.lcomm _ZZ19menuProcModelSelecthE7s_pgOfs,1
	.lcomm _ZZ19menuProcModelSelecthE7mstate2,4
	.lcomm _ZZ19menuProcModelSelecthE10s_editMode,1
	.type	_ZZ13menuProcModelhE3__c_12, @object
	.size	_ZZ13menuProcModelhE3__c_12, 14
_ZZ13menuProcModelhE3__c_12:
	.string	"remove [MENU]"
	.type	_ZZ13menuProcModelhE3__c_11, @object
	.size	_ZZ13menuProcModelhE3__c_11, 3
_ZZ13menuProcModelhE3__c_11:
	.string	"RM"
	.type	_ZZ13menuProcModelhE3__c_10, @object
	.size	_ZZ13menuProcModelhE3__c_10, 8
_ZZ13menuProcModelhE3__c_10:
	.string	"TCut SW"
	.type	_ZZ13menuProcModelhE3__c_9, @object
	.size	_ZZ13menuProcModelhE3__c_9, 31
_ZZ13menuProcModelhE3__c_9:
	.string	"Exp   ExFineFine  MediumCoarse"
	.type	_ZZ13menuProcModelhE3__c_8, @object
	.size	_ZZ13menuProcModelhE3__c_8, 9
_ZZ13menuProcModelhE3__c_8:
	.string	"Trim Inc"
	.type	_ZZ13menuProcModelhE3__c_7, @object
	.size	_ZZ13menuProcModelhE3__c_7, 7
_ZZ13menuProcModelhE3__c_7:
	.string	"OFFON "
	.type	_ZZ13menuProcModelhE3__c_6, @object
	.size	_ZZ13menuProcModelhE3__c_6, 7
_ZZ13menuProcModelhE3__c_6:
	.string	"T-Trim"
	.type	_ZZ13menuProcModelhE3__c_5, @object
	.size	_ZZ13menuProcModelhE3__c_5, 17
_ZZ13menuProcModelhE3__c_5:
	.string	"OFF ABS THR THR%"
	.type	_ZZ13menuProcModelhE3__c_4, @object
	.size	_ZZ13menuProcModelhE3__c_4, 6
_ZZ13menuProcModelhE3__c_4:
	.string	"Timer"
	.type	_ZZ13menuProcModelhE3__c_3, @object
	.size	_ZZ13menuProcModelhE3__c_3, 21
_ZZ13menuProcModelhE3__c_3:
	.string	"8CH 10CH12CH14CH16CH"
	.type	_ZZ13menuProcModelhE3__c_2, @object
	.size	_ZZ13menuProcModelhE3__c_2, 31
_ZZ13menuProcModelhE3__c_2:
	.string	"PPM   SILV_ASILV_BSILV_CTRAC09"
	.type	_ZZ13menuProcModelhE3__c_1, @object
	.size	_ZZ13menuProcModelhE3__c_1, 6
_ZZ13menuProcModelhE3__c_1:
	.string	"Proto"
	.type	_ZZ13menuProcModelhE3__c_0, @object
	.size	_ZZ13menuProcModelhE3__c_0, 5
_ZZ13menuProcModelhE3__c_0:
	.string	"Name"
	.type	_ZZ13menuProcModelhE3__c, @object
	.size	_ZZ13menuProcModelhE3__c, 7
_ZZ13menuProcModelhE3__c:
	.string	"SETUP "
	.type	_ZZ13menuProcModelhE10mstate_tab, @object
	.size	_ZZ13menuProcModelhE10mstate_tab, 8
_ZZ13menuProcModelhE10mstate_tab:
	.byte	1
	.byte	10
	.byte	2
	.byte	3
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.lcomm _ZZ13menuProcModelhE7mstate2,4
	.type	_ZL9s_charTab, @object
	.size	_ZL9s_charTab, 41
_ZL9s_charTab:
	.string	" ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-."
	.lcomm _ZL10s_expoChan,1
	.type	_ZZ15menuProcExpoAllhE3__c_0, @object
	.size	_ZZ15menuProcExpoAllhE3__c_0, 18
_ZZ15menuProcExpoAllhE3__c_0:
	.string	"exp  % sw  exp  %"
	.type	_ZZ15menuProcExpoAllhE3__c, @object
	.size	_ZZ15menuProcExpoAllhE3__c, 8
_ZZ15menuProcExpoAllhE3__c:
	.string	"EXPO/DR"
	.type	_ZZ15menuProcExpoAllhE10mstate_tab, @object
	.size	_ZZ15menuProcExpoAllhE10mstate_tab, 2
_ZZ15menuProcExpoAllhE10mstate_tab:
	.byte	5
	.byte	5
	.lcomm _ZZ15menuProcExpoAllhE7mstate2,4
	.type	_ZZ15menuProcExpoOnehE3__c_4, @object
	.size	_ZZ15menuProcExpoOnehE3__c_4, 7
_ZZ15menuProcExpoOnehE3__c_4:
	.string	"Weight"
	.type	_ZZ15menuProcExpoOnehE3__c_3, @object
	.size	_ZZ15menuProcExpoOnehE3__c_3, 6
_ZZ15menuProcExpoOnehE3__c_3:
	.string	"DrExp"
	.type	_ZZ15menuProcExpoOnehE3__c_2, @object
	.size	_ZZ15menuProcExpoOnehE3__c_2, 5
_ZZ15menuProcExpoOnehE3__c_2:
	.string	"DrSw"
	.type	_ZZ15menuProcExpoOnehE3__c_1, @object
	.size	_ZZ15menuProcExpoOnehE3__c_1, 7
_ZZ15menuProcExpoOnehE3__c_1:
	.string	"Weight"
	.type	_ZZ15menuProcExpoOnehE3__c_0, @object
	.size	_ZZ15menuProcExpoOnehE3__c_0, 5
_ZZ15menuProcExpoOnehE3__c_0:
	.string	"Expo"
	.type	_ZZ15menuProcExpoOnehE3__c, @object
	.size	_ZZ15menuProcExpoOnehE3__c, 9
_ZZ15menuProcExpoOnehE3__c:
	.string	"EXPO/DR "
	.lcomm _ZZ15menuProcExpoOnehE7mstate2,4
	.type	_ZZ12menuProcTrimhE3__c_1, @object
	.size	_ZZ12menuProcTrimhE3__c_1, 20
_ZZ12menuProcTrimhE3__c_1:
	.string	" -> Balance  <- Clr"
	.type	_ZZ12menuProcTrimhE3__c_0, @object
	.size	_ZZ12menuProcTrimhE3__c_0, 11
_ZZ12menuProcTrimhE3__c_0:
	.string	"Trim  Base"
	.type	_ZZ12menuProcTrimhE3__c, @object
	.size	_ZZ12menuProcTrimhE3__c, 5
_ZZ12menuProcTrimhE3__c:
	.string	"TRIM"
	.lcomm _ZZ12menuProcTrimhE7mstate2,4
	.lcomm _ZL16s_currMixInsMode,1
	.lcomm _ZL12s_currMixIdx,1
	.lcomm _ZL12s_currDestCh,1
	.type	_ZZ11menuProcMixhE3__c_1, @object
	.size	_ZZ11menuProcMixhE3__c_1, 70
_ZZ11menuProcMixhE3__c_1:
	.ascii	" - x>"
	.string	"0x<0|x|c1 c2 c3 c4 c5 c6 c7 c8 c9 c10c11c12c13c14c15c16c18c19c20"
	.type	_ZZ11menuProcMixhE3__c_0, @object
	.size	_ZZ11menuProcMixhE3__c_0, 15
_ZZ11menuProcMixhE3__c_0:
	.string	"wt src  sw crv"
	.type	_ZZ11menuProcMixhE3__c, @object
	.size	_ZZ11menuProcMixhE3__c, 6
_ZZ11menuProcMixhE3__c:
	.string	"MIXER"
	.lcomm _ZZ11menuProcMixhE7s_pgOfs,1
	.lcomm _ZZ11menuProcMixhE7mstate2,4
	.lcomm _ZL11s_curveChan,1
	.type	_ZZ14menuProcMixOnehE3__c_5, @object
	.size	_ZZ14menuProcMixOnehE3__c_5, 14
_ZZ14menuProcMixOnehE3__c_5:
	.string	"remove [Menu]"
	.type	_ZZ14menuProcMixOnehE3__c_4, @object
	.size	_ZZ14menuProcMixOnehE3__c_4, 3
_ZZ14menuProcMixOnehE3__c_4:
	.string	"RM"
	.type	_ZZ14menuProcMixOnehE3__c_3, @object
	.size	_ZZ14menuProcMixOnehE3__c_3, 70
_ZZ14menuProcMixOnehE3__c_3:
	.ascii	" - x>"
	.string	"0x<0|x|c1 c2 c3 c4 c5 c6 c7 c8 c9 c10c11c12c13c14c15c16c18c19c20"
	.type	_ZZ14menuProcMixOnehE3__c_2, @object
	.size	_ZZ14menuProcMixOnehE3__c_2, 7
_ZZ14menuProcMixOnehE3__c_2:
	.string	"ON OFF"
	.type	_ZZ14menuProcMixOnehE3__c_1, @object
	.size	_ZZ14menuProcMixOnehE3__c_1, 47
_ZZ14menuProcMixOnehE3__c_1:
	.string	"SourceWeightTrim  CurvesSwitchFade            "
	.type	_ZZ14menuProcMixOnehE3__c_0, @object
	.size	_ZZ14menuProcMixOnehE3__c_0, 10
_ZZ14menuProcMixOnehE3__c_0:
	.string	"EDIT MIX "
	.type	_ZZ14menuProcMixOnehE3__c, @object
	.size	_ZZ14menuProcMixOnehE3__c, 12
_ZZ14menuProcMixOnehE3__c:
	.string	"INSERT MIX "
	.lcomm _ZZ14menuProcMixOnehE7mstate2,4
	.type	_ZZ14menuProcLimitshE3__c_1, @object
	.size	_ZZ14menuProcLimitshE3__c_1, 7
_ZZ14menuProcLimitshE3__c_1:
	.string	" - INV"
	.type	_ZZ14menuProcLimitshE3__c_0, @object
	.size	_ZZ14menuProcLimitshE3__c_0, 18
_ZZ14menuProcLimitshE3__c_0:
	.string	"subT min  max inv"
	.type	_ZZ14menuProcLimitshE3__c, @object
	.size	_ZZ14menuProcLimitshE3__c, 7
_ZZ14menuProcLimitshE3__c:
	.string	"LIMITS"
	.lcomm _ZZ14menuProcLimitshE7s_pgOfs,1
	.type	_ZZ14menuProcLimitshE10mstate_tab, @object
	.size	_ZZ14menuProcLimitshE10mstate_tab, 2
_ZZ14menuProcLimitshE10mstate_tab:
	.byte	4
	.byte	4
	.lcomm _ZZ14menuProcLimitshE5swVal,16
	.lcomm _ZZ14menuProcLimitshE7mstate2,4
	.type	_ZZ13menuProcCurvehE3__c_0, @object
	.size	_ZZ13menuProcCurvehE3__c_0, 3
_ZZ13menuProcCurvehE3__c_0:
	.string	"CV"
	.type	_ZZ13menuProcCurvehE3__c, @object
	.size	_ZZ13menuProcCurvehE3__c, 6
_ZZ13menuProcCurvehE3__c:
	.string	"CURVE"
	.lcomm _ZZ13menuProcCurvehE7s_pgOfs,1
	.lcomm _ZZ13menuProcCurvehE7mstate2,4
	.type	_ZZ16menuProcCurveOnehE3__c_0, @object
	.size	_ZZ16menuProcCurveOnehE3__c_0, 7
_ZZ16menuProcCurveOnehE3__c_0:
	.string	"PRESET"
	.type	_ZZ16menuProcCurveOnehE3__c, @object
	.size	_ZZ16menuProcCurveOnehE3__c, 7
_ZZ16menuProcCurveOnehE3__c:
	.string	"CURVE "
	.lcomm _ZZ16menuProcCurveOnehE7dfltCrv,1
	.lcomm _ZZ16menuProcCurveOnehE7mstate2,4
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
	.long	.LFB23
	.long	.LFE23-.LFB23
	.p2align	2
.LEFDE0:
.LSFDE2:
	.long	.LEFDE2-.LASFDE2
.LASFDE2:
	.long	.Lframe0
	.long	.LFB24
	.long	.LFE24-.LFB24
	.p2align	2
.LEFDE2:
.LSFDE4:
	.long	.LEFDE4-.LASFDE4
.LASFDE4:
	.long	.Lframe0
	.long	.LFB28
	.long	.LFE28-.LFB28
	.p2align	2
.LEFDE4:
.LSFDE6:
	.long	.LEFDE6-.LASFDE6
.LASFDE6:
	.long	.Lframe0
	.long	.LFB29
	.long	.LFE29-.LFB29
	.p2align	2
.LEFDE6:
.LSFDE8:
	.long	.LEFDE8-.LASFDE8
.LASFDE8:
	.long	.Lframe0
	.long	.LFB39
	.long	.LFE39-.LFB39
	.p2align	2
.LEFDE8:
.LSFDE10:
	.long	.LEFDE10-.LASFDE10
.LASFDE10:
	.long	.Lframe0
	.long	.LFB40
	.long	.LFE40-.LFB40
	.p2align	2
.LEFDE10:
.LSFDE12:
	.long	.LEFDE12-.LASFDE12
.LASFDE12:
	.long	.Lframe0
	.long	.LFB44
	.long	.LFE44-.LFB44
	.p2align	2
.LEFDE12:
.LSFDE14:
	.long	.LEFDE14-.LASFDE14
.LASFDE14:
	.long	.Lframe0
	.long	.LFB45
	.long	.LFE45-.LFB45
	.p2align	2
.LEFDE14:
.LSFDE16:
	.long	.LEFDE16-.LASFDE16
.LASFDE16:
	.long	.Lframe0
	.long	.LFB49
	.long	.LFE49-.LFB49
	.p2align	2
.LEFDE16:
.LSFDE18:
	.long	.LEFDE18-.LASFDE18
.LASFDE18:
	.long	.Lframe0
	.long	.LFB50
	.long	.LFE50-.LFB50
	.p2align	2
.LEFDE18:
.LSFDE20:
	.long	.LEFDE20-.LASFDE20
.LASFDE20:
	.long	.Lframe0
	.long	.LFB51
	.long	.LFE51-.LFB51
	.p2align	2
.LEFDE20:
.LSFDE22:
	.long	.LEFDE22-.LASFDE22
.LASFDE22:
	.long	.Lframe0
	.long	.LFB52
	.long	.LFE52-.LFB52
	.p2align	2
.LEFDE22:
.LSFDE24:
	.long	.LEFDE24-.LASFDE24
.LASFDE24:
	.long	.Lframe0
	.long	.LFB53
	.long	.LFE53-.LFB53
	.p2align	2
.LEFDE24:
.LSFDE26:
	.long	.LEFDE26-.LASFDE26
.LASFDE26:
	.long	.Lframe0
	.long	.LFB54
	.long	.LFE54-.LFB54
	.p2align	2
.LEFDE26:
.LSFDE28:
	.long	.LEFDE28-.LASFDE28
.LASFDE28:
	.long	.Lframe0
	.long	.LFB55
	.long	.LFE55-.LFB55
	.p2align	2
.LEFDE28:
.LSFDE30:
	.long	.LEFDE30-.LASFDE30
.LASFDE30:
	.long	.Lframe0
	.long	.LFB56
	.long	.LFE56-.LFB56
	.p2align	2
.LEFDE30:
.LSFDE32:
	.long	.LEFDE32-.LASFDE32
.LASFDE32:
	.long	.Lframe0
	.long	.LFB48
	.long	.LFE48-.LFB48
	.p2align	2
.LEFDE32:
.LSFDE34:
	.long	.LEFDE34-.LASFDE34
.LASFDE34:
	.long	.Lframe0
	.long	.LFB46
	.long	.LFE46-.LFB46
	.p2align	2
.LEFDE34:
.LSFDE36:
	.long	.LEFDE36-.LASFDE36
.LASFDE36:
	.long	.Lframe0
	.long	.LFB47
	.long	.LFE47-.LFB47
	.p2align	2
.LEFDE36:
.LSFDE38:
	.long	.LEFDE38-.LASFDE38
.LASFDE38:
	.long	.Lframe0
	.long	.LFB20
	.long	.LFE20-.LFB20
	.p2align	2
.LEFDE38:
.LSFDE40:
	.long	.LEFDE40-.LASFDE40
.LASFDE40:
	.long	.Lframe0
	.long	.LFB42
	.long	.LFE42-.LFB42
	.p2align	2
.LEFDE40:
.LSFDE42:
	.long	.LEFDE42-.LASFDE42
.LASFDE42:
	.long	.Lframe0
	.long	.LFB43
	.long	.LFE43-.LFB43
	.p2align	2
.LEFDE42:
.LSFDE44:
	.long	.LEFDE44-.LASFDE44
.LASFDE44:
	.long	.Lframe0
	.long	.LFB41
	.long	.LFE41-.LFB41
	.p2align	2
.LEFDE44:
.LSFDE46:
	.long	.LEFDE46-.LASFDE46
.LASFDE46:
	.long	.Lframe0
	.long	.LFB25
	.long	.LFE25-.LFB25
	.p2align	2
.LEFDE46:
.LSFDE48:
	.long	.LEFDE48-.LASFDE48
.LASFDE48:
	.long	.Lframe0
	.long	.LFB15
	.long	.LFE15-.LFB15
	.p2align	2
.LEFDE48:
.LSFDE50:
	.long	.LEFDE50-.LASFDE50
.LASFDE50:
	.long	.Lframe0
	.long	.LFB36
	.long	.LFE36-.LFB36
	.p2align	2
.LEFDE50:
.LSFDE52:
	.long	.LEFDE52-.LASFDE52
.LASFDE52:
	.long	.Lframe0
	.long	.LFB30
	.long	.LFE30-.LFB30
	.p2align	2
.LEFDE52:
.LSFDE54:
	.long	.LEFDE54-.LASFDE54
.LASFDE54:
	.long	.Lframe0
	.long	.LFB27
	.long	.LFE27-.LFB27
	.p2align	2
.LEFDE54:
.LSFDE56:
	.long	.LEFDE56-.LASFDE56
.LASFDE56:
	.long	.Lframe0
	.long	.LFB18
	.long	.LFE18-.LFB18
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
	.long	.LFB38
	.long	.LFE38-.LFB38
	.p2align	2
.LEFDE60:
.LSFDE62:
	.long	.LEFDE62-.LASFDE62
.LASFDE62:
	.long	.Lframe0
	.long	.LFB37
	.long	.LFE37-.LFB37
	.p2align	2
.LEFDE62:
.LSFDE64:
	.long	.LEFDE64-.LASFDE64
.LASFDE64:
	.long	.Lframe0
	.long	.LFB35
	.long	.LFE35-.LFB35
	.p2align	2
.LEFDE64:
.LSFDE66:
	.long	.LEFDE66-.LASFDE66
.LASFDE66:
	.long	.Lframe0
	.long	.LFB34
	.long	.LFE34-.LFB34
	.p2align	2
.LEFDE66:
.LSFDE68:
	.long	.LEFDE68-.LASFDE68
.LASFDE68:
	.long	.Lframe0
	.long	.LFB33
	.long	.LFE33-.LFB33
	.p2align	2
.LEFDE68:
.LSFDE70:
	.long	.LEFDE70-.LASFDE70
.LASFDE70:
	.long	.Lframe0
	.long	.LFB32
	.long	.LFE32-.LFB32
	.p2align	2
.LEFDE70:
.LSFDE72:
	.long	.LEFDE72-.LASFDE72
.LASFDE72:
	.long	.Lframe0
	.long	.LFB31
	.long	.LFE31-.LFB31
	.p2align	2
.LEFDE72:
.LSFDE74:
	.long	.LEFDE74-.LASFDE74
.LASFDE74:
	.long	.Lframe0
	.long	.LFB26
	.long	.LFE26-.LFB26
	.p2align	2
.LEFDE74:
.LSFDE76:
	.long	.LEFDE76-.LASFDE76
.LASFDE76:
	.long	.Lframe0
	.long	.LFB22
	.long	.LFE22-.LFB22
	.p2align	2
.LEFDE76:
.LSFDE78:
	.long	.LEFDE78-.LASFDE78
.LASFDE78:
	.long	.Lframe0
	.long	.LFB21
	.long	.LFE21-.LFB21
	.p2align	2
.LEFDE78:
.LSFDE80:
	.long	.LEFDE80-.LASFDE80
.LASFDE80:
	.long	.Lframe0
	.long	.LFB17
	.long	.LFE17-.LFB17
	.p2align	2
.LEFDE80:
.LSFDE82:
	.long	.LEFDE82-.LASFDE82
.LASFDE82:
	.long	.Lframe0
	.long	.LFB16
	.long	.LFE16-.LFB16
	.p2align	2
.LEFDE82:
.LSFDE84:
	.long	.LEFDE84-.LASFDE84
.LASFDE84:
	.long	.Lframe0
	.long	.LFB19
	.long	.LFE19-.LFB19
	.p2align	2
.LEFDE84:
	.text
.Letext0:
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST1:
	.long	.LVL0-.Ltext0
	.long	.LVL3-.Ltext0
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
	.long	.LVL0-.Ltext0
	.long	.LVL1-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL1-.Ltext0
	.long	.LVL2-.Ltext0
	.word	0x6
	.byte	0x56
	.byte	0x93
	.uleb128 0x1
	.byte	0x57
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST4:
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
	.long	.LVL7-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL7-.Ltext0
	.long	.LVL8-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL8-.Ltext0
	.long	.LVL10-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL12-.Ltext0
	.long	.LVL13-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL15-.Ltext0
	.long	.LVL16-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL17-.Ltext0
	.long	.LVL18-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL18-.Ltext0
	.long	.LFE24-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST5:
	.long	.LVL4-.Ltext0
	.long	.LVL9-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL9-.Ltext0
	.long	.LVL10-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL12-.Ltext0
	.long	.LVL13-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL17-.Ltext0
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
.LLST6:
	.long	.LVL11-.Ltext0
	.long	.LVL12-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL14-.Ltext0
	.long	.LVL18-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST7:
	.long	.LVL6-.Ltext0
	.long	.LVL19-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST9:
	.long	.LVL20-.Ltext0
	.long	.LVL21-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL21-.Ltext0
	.long	.LFE28-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST10:
	.long	.LVL21-.Ltext0
	.long	.LVL22-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL22-.Ltext0
	.long	.LVL23-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST12:
	.long	.LVL24-.Ltext0
	.long	.LVL25-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL26-.Ltext0
	.long	.LVL27-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL27-.Ltext0
	.long	.LFE29-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST14:
	.long	.LVL29-.Ltext0
	.long	.LVL30-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL31-.Ltext0
	.long	.LVL32-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL32-.Ltext0
	.long	.LVL33-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST16:
	.long	.LVL34-.Ltext0
	.long	.LVL35-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL35-.Ltext0
	.long	.LVL36-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST19:
	.long	.LVL37-.Ltext0
	.long	.LVL39-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL39-.Ltext0
	.long	.LVL49-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL50-.Ltext0
	.long	.LVL52-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL57-.Ltext0
	.long	.LFE45-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST20:
	.long	.LVL37-.Ltext0
	.long	.LVL40-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL42-.Ltext0
	.long	.LVL43-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST21:
	.long	.LVL38-.Ltext0
	.long	.LVL48-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL50-.Ltext0
	.long	.LVL55-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL57-.Ltext0
	.long	.LFE45-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST22:
	.long	.LVL41-.Ltext0
	.long	.LVL42-.Ltext0
	.word	0x6
	.byte	0x6a
	.byte	0x93
	.uleb128 0x1
	.byte	0x6b
	.byte	0x93
	.uleb128 0x1
	.long	.LVL44-.Ltext0
	.long	.LVL59-.Ltext0
	.word	0x6
	.byte	0x6a
	.byte	0x93
	.uleb128 0x1
	.byte	0x6b
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST23:
	.long	.LVL45-.Ltext0
	.long	.LVL46-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL54-.Ltext0
	.long	.LVL58-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST24:
	.long	.LVL47-.Ltext0
	.long	.LVL50-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL51-.Ltext0
	.long	.LVL53-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST25:
	.long	.LVL49-.Ltext0
	.long	.LVL50-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL52-.Ltext0
	.long	.LVL56-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST27:
	.long	.LVL61-.Ltext0
	.long	.LVL73-.Ltext0
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST28:
	.long	.LVL63-.Ltext0
	.long	.LVL64-.Ltext0
	.word	0x1
	.byte	0x6a
	.long	.LVL64-.Ltext0
	.long	.LVL67-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL67-.Ltext0
	.long	.LVL68-.Ltext0
	.word	0x6
	.byte	0x6a
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL68-.Ltext0
	.long	.LVL71-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL71-.Ltext0
	.long	.LVL72-.Ltext0
	.word	0x6
	.byte	0x6a
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST31:
	.long	.LVL75-.Ltext0
	.long	.LVL76-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL77-.Ltext0
	.long	.LVL78-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST33:
	.long	.LVL79-.Ltext0
	.long	.LVL80-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL81-.Ltext0
	.long	.LVL82-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST35:
	.long	.LVL83-.Ltext0
	.long	.LVL84-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL85-.Ltext0
	.long	.LVL86-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL87-.Ltext0
	.long	.LVL98-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST36:
	.long	.LVL89-.Ltext0
	.long	.LVL91-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL91-.Ltext0
	.long	.LVL93-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL93-.Ltext0
	.long	.LVL95-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL95-.Ltext0
	.long	.LVL96-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL96-.Ltext0
	.long	.LVL97-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL97-.Ltext0
	.long	.LVL99-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST37:
	.long	.LVL88-.Ltext0
	.long	.LVL92-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL92-.Ltext0
	.long	.LVL100-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	0x0
	.long	0x0
.LLST39:
	.long	.LVL101-.Ltext0
	.long	.LVL102-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL103-.Ltext0
	.long	.LVL104-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST41:
	.long	.LVL105-.Ltext0
	.long	.LVL106-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL106-.Ltext0
	.long	.LVL108-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST42:
	.long	.LVL106-.Ltext0
	.long	.LVL107-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST44:
	.long	.LVL110-.Ltext0
	.long	.LVL117-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL121-.Ltext0
	.long	.LVL122-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST45:
	.long	.LVL112-.Ltext0
	.long	.LVL113-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL115-.Ltext0
	.long	.LVL117-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL121-.Ltext0
	.long	.LVL123-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST46:
	.long	.LVL119-.Ltext0
	.long	.LVL120-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST49:
	.long	.LVL124-.Ltext0
	.long	.LVL125-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL125-.Ltext0
	.long	.LVL136-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST50:
	.long	.LVL126-.Ltext0
	.long	.LVL130-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL130-.Ltext0
	.long	.LVL133-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL134-.Ltext0
	.long	.LVL135-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST51:
	.long	.LVL127-.Ltext0
	.long	.LVL128-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL129-.Ltext0
	.long	.LVL132-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL132-.Ltext0
	.long	.LVL133-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST53:
	.long	.LVL137-.Ltext0
	.long	.LVL138-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL138-.Ltext0
	.long	.LFE47-.Ltext0
	.word	0x2
	.byte	0x8c
	.sleb128 9
	.long	0x0
	.long	0x0
.LLST54:
	.long	.LVL138-.Ltext0
	.long	.LVL140-.Ltext0
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	.LVL140-.Ltext0
	.long	.LVL141-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL142-.Ltext0
	.long	.LVL143-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL143-.Ltext0
	.long	.LVL155-.Ltext0
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST55:
	.long	.LVL148-.Ltext0
	.long	.LVL150-.Ltext0
	.word	0xc
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x6a
	.byte	0x93
	.uleb128 0x1
	.byte	0x6b
	.byte	0x93
	.uleb128 0x1
	.long	.LVL151-.Ltext0
	.long	.LVL153-.Ltext0
	.word	0xc
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x6a
	.byte	0x93
	.uleb128 0x1
	.byte	0x6b
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST56:
	.long	.LVL144-.Ltext0
	.long	.LVL145-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL146-.Ltext0
	.long	.LVL147-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL149-.Ltext0
	.long	.LVL151-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL152-.Ltext0
	.long	.LVL154-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST57:
	.long	.LVL158-.Ltext0
	.long	.LVL159-.Ltext0
	.word	0x6
	.byte	0x6a
	.byte	0x93
	.uleb128 0x1
	.byte	0x6b
	.byte	0x93
	.uleb128 0x1
	.long	.LVL160-.Ltext0
	.long	.LVL161-.Ltext0
	.word	0x6
	.byte	0x6a
	.byte	0x93
	.uleb128 0x1
	.byte	0x6b
	.byte	0x93
	.uleb128 0x1
	.long	.LVL162-.Ltext0
	.long	.LVL173-.Ltext0
	.word	0x6
	.byte	0x6a
	.byte	0x93
	.uleb128 0x1
	.byte	0x6b
	.byte	0x93
	.uleb128 0x1
	.long	.LVL178-.Ltext0
	.long	.LVL180-.Ltext0
	.word	0x6
	.byte	0x6a
	.byte	0x93
	.uleb128 0x1
	.byte	0x6b
	.byte	0x93
	.uleb128 0x1
	.long	.LVL181-.Ltext0
	.long	.LVL186-.Ltext0
	.word	0x6
	.byte	0x6a
	.byte	0x93
	.uleb128 0x1
	.byte	0x6b
	.byte	0x93
	.uleb128 0x1
	.long	.LVL187-.Ltext0
	.long	.LVL191-.Ltext0
	.word	0x6
	.byte	0x6a
	.byte	0x93
	.uleb128 0x1
	.byte	0x6b
	.byte	0x93
	.uleb128 0x1
	.long	.LVL191-.Ltext0
	.long	.LVL192-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST58:
	.long	.LVL156-.Ltext0
	.long	.LVL157-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL163-.Ltext0
	.long	.LVL186-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL187-.Ltext0
	.long	.LVL189-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL190-.Ltext0
	.long	.LVL198-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	.LVL199-.Ltext0
	.long	.LFE47-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST59:
	.long	.LVL164-.Ltext0
	.long	.LVL165-.Ltext0
	.word	0x1
	.byte	0x6e
	.long	.LVL166-.Ltext0
	.long	.LVL167-.Ltext0
	.word	0x1
	.byte	0x6e
	.long	.LVL178-.Ltext0
	.long	.LVL179-.Ltext0
	.word	0x1
	.byte	0x6e
	.long	0x0
	.long	0x0
.LLST60:
	.long	.LVL172-.Ltext0
	.long	.LVL178-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL181-.Ltext0
	.long	.LVL184-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL185-.Ltext0
	.long	.LVL186-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL187-.Ltext0
	.long	.LVL188-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST61:
	.long	.LVL168-.Ltext0
	.long	.LVL178-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL181-.Ltext0
	.long	.LVL183-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST62:
	.long	.LVL169-.Ltext0
	.long	.LVL171-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST63:
	.long	.LVL193-.Ltext0
	.long	.LVL194-.Ltext0
	.word	0x6
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL195-.Ltext0
	.long	.LVL196-.Ltext0
	.word	0x6
	.byte	0x5c
	.byte	0x93
	.uleb128 0x1
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL196-.Ltext0
	.long	.LVL197-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST65:
	.long	.LVL200-.Ltext0
	.long	.LVL204-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL204-.Ltext0
	.long	.LVL205-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL205-.Ltext0
	.long	.LVL209-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST66:
	.long	.LVL201-.Ltext0
	.long	.LVL204-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL204-.Ltext0
	.long	.LVL206-.Ltext0
	.word	0x1
	.byte	0x67
	.long	.LVL206-.Ltext0
	.long	.LVL208-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST67:
	.long	.LVL202-.Ltext0
	.long	.LVL204-.Ltext0
	.word	0x1
	.byte	0x65
	.long	.LVL204-.Ltext0
	.long	.LVL207-.Ltext0
	.word	0x1
	.byte	0x63
	.long	.LVL207-.Ltext0
	.long	.LFE20-.Ltext0
	.word	0x1
	.byte	0x65
	.long	0x0
	.long	0x0
.LLST69:
	.long	.LVL210-.Ltext0
	.long	.LVL211-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL211-.Ltext0
	.long	.LVL212-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST70:
	.long	.LVL213-.Ltext0
	.long	.LVL214-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL215-.Ltext0
	.long	.LVL216-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST72:
	.long	.LVL217-.Ltext0
	.long	.LVL218-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL219-.Ltext0
	.long	.LVL220-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL221-.Ltext0
	.long	.LVL222-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL223-.Ltext0
	.long	.LVL224-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL225-.Ltext0
	.long	.LVL226-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL227-.Ltext0
	.long	.LVL228-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL229-.Ltext0
	.long	.LVL230-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL231-.Ltext0
	.long	.LVL232-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL233-.Ltext0
	.long	.LVL234-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL235-.Ltext0
	.long	.LVL236-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL237-.Ltext0
	.long	.LVL238-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL239-.Ltext0
	.long	.LVL240-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL241-.Ltext0
	.long	.LVL242-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL243-.Ltext0
	.long	.LVL244-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST73:
	.long	.LVL245-.Ltext0
	.long	.LVL246-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL247-.Ltext0
	.long	.LVL248-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST74:
	.long	.LVL249-.Ltext0
	.long	.LVL262-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL264-.Ltext0
	.long	.LVL268-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL273-.Ltext0
	.long	.LVL275-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL276-.Ltext0
	.long	.LVL279-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	0x0
	.long	0x0
.LLST75:
	.long	.LVL252-.Ltext0
	.long	.LVL253-.Ltext0
	.word	0x1
	.byte	0x69
	.long	.LVL254-.Ltext0
	.long	.LVL256-.Ltext0
	.word	0x1
	.byte	0x69
	.long	.LVL257-.Ltext0
	.long	.LVL258-.Ltext0
	.word	0x1
	.byte	0x69
	.long	0x0
	.long	0x0
.LLST76:
	.long	.LVL250-.Ltext0
	.long	.LVL251-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL251-.Ltext0
	.long	.LVL255-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST77:
	.long	.LVL260-.Ltext0
	.long	.LVL263-.Ltext0
	.word	0x1
	.byte	0x6e
	.long	.LVL264-.Ltext0
	.long	.LVL267-.Ltext0
	.word	0x1
	.byte	0x6e
	.long	.LVL273-.Ltext0
	.long	.LVL274-.Ltext0
	.word	0x1
	.byte	0x6e
	.long	0x0
	.long	0x0
.LLST78:
	.long	.LVL259-.Ltext0
	.long	.LVL275-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL276-.Ltext0
	.long	.LVL277-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST79:
	.long	.LVL259-.Ltext0
	.long	.LVL261-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL264-.Ltext0
	.long	.LVL275-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL276-.Ltext0
	.long	.LVL278-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST80:
	.long	.LVL259-.Ltext0
	.long	.LVL262-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL264-.Ltext0
	.long	.LVL269-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL269-.Ltext0
	.long	.LVL270-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL270-.Ltext0
	.long	.LVL275-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL276-.Ltext0
	.long	.LVL279-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	0x0
	.long	0x0
.LLST82:
	.long	.LVL280-.Ltext0
	.long	.LVL281-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL281-.Ltext0
	.long	.LVL282-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST84:
	.long	.LVL283-.Ltext0
	.long	.LVL286-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL286-.Ltext0
	.long	.LVL323-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	.LVL323-.Ltext0
	.long	.LFE25-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST85:
	.long	.LVL283-.Ltext0
	.long	.LVL292-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL295-.Ltext0
	.long	.LVL298-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL301-.Ltext0
	.long	.LVL303-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL307-.Ltext0
	.long	.LVL310-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL313-.Ltext0
	.long	.LVL316-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL320-.Ltext0
	.long	.LFE25-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST86:
	.long	.LVL283-.Ltext0
	.long	.LVL291-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL291-.Ltext0
	.long	.LVL295-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL295-.Ltext0
	.long	.LVL297-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL297-.Ltext0
	.long	.LVL301-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL301-.Ltext0
	.long	.LVL304-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL304-.Ltext0
	.long	.LVL307-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL307-.Ltext0
	.long	.LVL309-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL309-.Ltext0
	.long	.LVL313-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL313-.Ltext0
	.long	.LVL315-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL315-.Ltext0
	.long	.LVL321-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL321-.Ltext0
	.long	.LFE25-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST87:
	.long	.LVL283-.Ltext0
	.long	.LVL293-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL295-.Ltext0
	.long	.LVL299-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL301-.Ltext0
	.long	.LVL305-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL307-.Ltext0
	.long	.LVL311-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL313-.Ltext0
	.long	.LVL317-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL320-.Ltext0
	.long	.LFE25-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST88:
	.long	.LVL283-.Ltext0
	.long	.LVL285-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL292-.Ltext0
	.long	.LVL295-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL298-.Ltext0
	.long	.LVL301-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL303-.Ltext0
	.long	.LVL307-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL310-.Ltext0
	.long	.LVL313-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL316-.Ltext0
	.long	.LVL319-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL320-.Ltext0
	.long	.LVL322-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST89:
	.long	.LVL283-.Ltext0
	.long	.LVL284-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL290-.Ltext0
	.long	.LVL295-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL296-.Ltext0
	.long	.LVL301-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL302-.Ltext0
	.long	.LVL307-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL308-.Ltext0
	.long	.LVL313-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL314-.Ltext0
	.long	.LVL324-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	0x0
	.long	0x0
.LLST90:
	.long	.LVL287-.Ltext0
	.long	.LVL288-.Ltext0
	.word	0x1
	.byte	0x63
	.long	.LVL289-.Ltext0
	.long	.LVL294-.Ltext0
	.word	0x1
	.byte	0x63
	.long	.LVL295-.Ltext0
	.long	.LVL300-.Ltext0
	.word	0x1
	.byte	0x63
	.long	.LVL301-.Ltext0
	.long	.LVL306-.Ltext0
	.word	0x1
	.byte	0x63
	.long	.LVL307-.Ltext0
	.long	.LVL312-.Ltext0
	.word	0x1
	.byte	0x63
	.long	.LVL313-.Ltext0
	.long	.LVL318-.Ltext0
	.word	0x1
	.byte	0x63
	.long	.LVL320-.Ltext0
	.long	.LFE25-.Ltext0
	.word	0x1
	.byte	0x63
	.long	0x0
	.long	0x0
.LLST92:
	.long	.LVL325-.Ltext0
	.long	.LVL331-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL331-.Ltext0
	.long	.LVL382-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	.LVL382-.Ltext0
	.long	.LFE15-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST93:
	.long	.LVL325-.Ltext0
	.long	.LVL331-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL331-.Ltext0
	.long	.LVL335-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL335-.Ltext0
	.long	.LVL346-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL346-.Ltext0
	.long	.LVL383-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL383-.Ltext0
	.long	.LFE15-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST94:
	.long	.LVL325-.Ltext0
	.long	.LVL332-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL332-.Ltext0
	.long	.LVL341-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	.LVL341-.Ltext0
	.long	.LVL347-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL347-.Ltext0
	.long	.LVL348-.Ltext0
	.word	0x6
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL348-.Ltext0
	.long	.LVL350-.Ltext0
	.word	0x6
	.byte	0x5d
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL350-.Ltext0
	.long	.LVL351-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	.LVL351-.Ltext0
	.long	.LVL359-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL359-.Ltext0
	.long	.LVL360-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	.LVL360-.Ltext0
	.long	.LVL364-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL364-.Ltext0
	.long	.LVL365-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	.LVL365-.Ltext0
	.long	.LVL375-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL375-.Ltext0
	.long	.LVL376-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	.LVL376-.Ltext0
	.long	.LVL380-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL380-.Ltext0
	.long	.LVL386-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	.LVL386-.Ltext0
	.long	.LFE15-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST95:
	.long	.LVL325-.Ltext0
	.long	.LVL340-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL340-.Ltext0
	.long	.LVL390-.Ltext0
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	.LVL390-.Ltext0
	.long	.LFE15-.Ltext0
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
	.long	.LVL325-.Ltext0
	.long	.LVL329-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL330-.Ltext0
	.long	.LVL331-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL331-.Ltext0
	.long	.LVL342-.Ltext0
	.word	0x1
	.byte	0x5b
	.long	.LVL342-.Ltext0
	.long	.LVL347-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL347-.Ltext0
	.long	.LVL348-.Ltext0
	.word	0x6
	.byte	0x5b
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL348-.Ltext0
	.long	.LVL350-.Ltext0
	.word	0x6
	.byte	0x5b
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL350-.Ltext0
	.long	.LVL388-.Ltext0
	.word	0x1
	.byte	0x5b
	.long	0x0
	.long	0x0
.LLST97:
	.long	.LVL325-.Ltext0
	.long	.LVL328-.Ltext0
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL352-.Ltext0
	.long	.LVL385-.Ltext0
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST98:
	.long	.LVL325-.Ltext0
	.long	.LVL327-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	.LVL355-.Ltext0
	.long	.LVL357-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL357-.Ltext0
	.long	.LVL373-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	.LVL374-.Ltext0
	.long	.LVL387-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	.LVL387-.Ltext0
	.long	.LFE15-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST99:
	.long	.LVL325-.Ltext0
	.long	.LVL326-.Ltext0
	.word	0x1
	.byte	0x5a
	.long	.LVL362-.Ltext0
	.long	.LVL363-.Ltext0
	.word	0x1
	.byte	0x5a
	.long	.LVL366-.Ltext0
	.long	.LVL368-.Ltext0
	.word	0x1
	.byte	0x5a
	.long	.LVL369-.Ltext0
	.long	.LVL370-.Ltext0
	.word	0x1
	.byte	0x5a
	.long	.LVL371-.Ltext0
	.long	.LVL374-.Ltext0
	.word	0x1
	.byte	0x5a
	.long	.LVL378-.Ltext0
	.long	.LVL379-.Ltext0
	.word	0x1
	.byte	0x5a
	.long	.LVL380-.Ltext0
	.long	.LVL389-.Ltext0
	.word	0x1
	.byte	0x5a
	.long	0x0
	.long	0x0
.LLST100:
	.long	.LVL353-.Ltext0
	.long	.LVL354-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL356-.Ltext0
	.long	.LVL372-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL372-.Ltext0
	.long	.LVL374-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL374-.Ltext0
	.long	.LVL384-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL384-.Ltext0
	.long	.LVL387-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	0x0
	.long	0x0
.LLST101:
	.long	.LVL333-.Ltext0
	.long	.LVL334-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL349-.Ltext0
	.long	.LVL353-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL354-.Ltext0
	.long	.LVL356-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST102:
	.long	.LVL337-.Ltext0
	.long	.LVL339-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL347-.Ltext0
	.long	.LVL348-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST103:
	.long	.LVL345-.Ltext0
	.long	.LVL348-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST105:
	.long	.LVL391-.Ltext0
	.long	.LVL392-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL392-.Ltext0
	.long	.LVL414-.Ltext0
	.word	0x1
	.byte	0x5b
	.long	0x0
	.long	0x0
.LLST106:
	.long	.LVL393-.Ltext0
	.long	.LVL415-.Ltext0
	.word	0x1
	.byte	0x5a
	.long	0x0
	.long	0x0
.LLST107:
	.long	.LVL394-.Ltext0
	.long	.LVL413-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	0x0
	.long	0x0
.LLST108:
	.long	.LVL395-.Ltext0
	.long	.LVL398-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL398-.Ltext0
	.long	.LVL399-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL399-.Ltext0
	.long	.LVL400-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL400-.Ltext0
	.long	.LVL405-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL405-.Ltext0
	.long	.LVL406-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL406-.Ltext0
	.long	.LVL407-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL407-.Ltext0
	.long	.LVL408-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL409-.Ltext0
	.long	.LVL410-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL411-.Ltext0
	.long	.LVL412-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST109:
	.long	.LVL396-.Ltext0
	.long	.LVL397-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST111:
	.long	.LVL416-.Ltext0
	.long	.LVL417-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL417-.Ltext0
	.long	.LVL435-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	0x0
	.long	0x0
.LLST112:
	.long	.LVL418-.Ltext0
	.long	.LVL433-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST113:
	.long	.LVL419-.Ltext0
	.long	.LVL420-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	.LVL430-.Ltext0
	.long	.LVL434-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST114:
	.long	.LVL425-.Ltext0
	.long	.LVL426-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL426-.Ltext0
	.long	.LVL427-.Ltext0
	.word	0x1
	.byte	0x64
	.long	.LVL427-.Ltext0
	.long	.LVL428-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL428-.Ltext0
	.long	.LVL429-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST115:
	.long	.LVL421-.Ltext0
	.long	.LVL422-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL422-.Ltext0
	.long	.LVL424-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST116:
	.long	.LVL421-.Ltext0
	.long	.LVL423-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST117:
	.long	.LVL431-.Ltext0
	.long	.LVL432-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST119:
	.long	.LVL436-.Ltext0
	.long	.LVL437-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL437-.Ltext0
	.long	.LVL443-.Ltext0
	.word	0x1
	.byte	0x5b
	.long	0x0
	.long	0x0
.LLST120:
	.long	.LVL438-.Ltext0
	.long	.LVL441-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST121:
	.long	.LVL439-.Ltext0
	.long	.LVL444-.Ltext0
	.word	0x1
	.byte	0x5a
	.long	0x0
	.long	0x0
.LLST122:
	.long	.LVL440-.Ltext0
	.long	.LVL442-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST124:
	.long	.LVL445-.Ltext0
	.long	.LVL446-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL446-.Ltext0
	.long	.LVL477-.Ltext0
	.word	0x1
	.byte	0x53
	.long	0x0
	.long	0x0
.LLST125:
	.long	.LVL447-.Ltext0
	.long	.LVL454-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST126:
	.long	.LVL448-.Ltext0
	.long	.LVL465-.Ltext0
	.word	0x1
	.byte	0x52
	.long	.LVL465-.Ltext0
	.long	.LVL466-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL466-.Ltext0
	.long	.LVL478-.Ltext0
	.word	0x1
	.byte	0x52
	.long	0x0
	.long	0x0
.LLST127:
	.long	.LVL449-.Ltext0
	.long	.LVL450-.Ltext0
	.word	0x6
	.byte	0x64
	.byte	0x93
	.uleb128 0x1
	.byte	0x65
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST128:
	.long	.LVL453-.Ltext0
	.long	.LVL456-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST129:
	.long	.LVL452-.Ltext0
	.long	.LVL476-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST130:
	.long	.LVL452-.Ltext0
	.long	.LVL454-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL455-.Ltext0
	.long	.LVL475-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST131:
	.long	.LVL452-.Ltext0
	.long	.LVL453-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL455-.Ltext0
	.long	.LVL456-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL457-.Ltext0
	.long	.LVL458-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL459-.Ltext0
	.long	.LVL460-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL461-.Ltext0
	.long	.LVL462-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL463-.Ltext0
	.long	.LVL464-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL467-.Ltext0
	.long	.LVL468-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL469-.Ltext0
	.long	.LVL470-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL471-.Ltext0
	.long	.LVL472-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL473-.Ltext0
	.long	.LFE18-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST133:
	.long	.LVL479-.Ltext0
	.long	.LVL484-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST134:
	.long	.LVL479-.Ltext0
	.long	.LVL484-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST135:
	.long	.LVL479-.Ltext0
	.long	.LVL484-.Ltext0
	.word	0x1
	.byte	0x64
	.long	0x0
	.long	0x0
.LLST136:
	.long	.LVL479-.Ltext0
	.long	.LVL484-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST137:
	.long	.LVL479-.Ltext0
	.long	.LVL481-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST138:
	.long	.LVL479-.Ltext0
	.long	.LVL480-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL482-.Ltext0
	.long	.LVL483-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL483-.Ltext0
	.long	.LVL485-.Ltext0
	.word	0x1
	.byte	0x5a
	.long	0x0
	.long	0x0
.LLST140:
	.long	.LVL486-.Ltext0
	.long	.LVL487-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL487-.Ltext0
	.long	.LVL492-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	0x0
	.long	0x0
.LLST141:
	.long	.LVL488-.Ltext0
	.long	.LVL491-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST142:
	.long	.LVL489-.Ltext0
	.long	.LVL490-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST144:
	.long	.LVL493-.Ltext0
	.long	.LVL494-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL494-.Ltext0
	.long	.LVL513-.Ltext0
	.word	0x1
	.byte	0x58
	.long	0x0
	.long	0x0
.LLST145:
	.long	.LVL495-.Ltext0
	.long	.LVL514-.Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST146:
	.long	.LVL496-.Ltext0
	.long	.LVL500-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL506-.Ltext0
	.long	.LVL509-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST147:
	.long	.LVL496-.Ltext0
	.long	.LVL511-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST148:
	.long	.LVL496-.Ltext0
	.long	.LVL498-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL507-.Ltext0
	.long	.LVL510-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST149:
	.long	.LVL496-.Ltext0
	.long	.LVL512-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	0x0
	.long	0x0
.LLST150:
	.long	.LVL496-.Ltext0
	.long	.LVL498-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL499-.Ltext0
	.long	.LVL501-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL501-.Ltext0
	.long	.LVL503-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL505-.Ltext0
	.long	.LVL506-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL508-.Ltext0
	.long	.LVL510-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST151:
	.long	.LVL496-.Ltext0
	.long	.LVL497-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL500-.Ltext0
	.long	.LVL506-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL508-.Ltext0
	.long	.LVL509-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST153:
	.long	.LVL515-.Ltext0
	.long	.LVL516-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL516-.Ltext0
	.long	.LVL517-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST155:
	.long	.LVL518-.Ltext0
	.long	.LVL519-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL519-.Ltext0
	.long	.LVL524-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST156:
	.long	.LVL521-.Ltext0
	.long	.LVL526-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	0x0
	.long	0x0
.LLST157:
	.long	.LVL520-.Ltext0
	.long	.LVL523-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	.LVL523-.Ltext0
	.long	.LVL525-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL525-.Ltext0
	.long	.LVL528-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST158:
	.long	.LVL521-.Ltext0
	.long	.LVL527-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST159:
	.long	.LVL526-.Ltext0
	.long	.LVL529-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	0x0
	.long	0x0
.LLST160:
	.long	.LVL527-.Ltext0
	.long	.LVL530-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST161:
	.long	.LVL528-.Ltext0
	.long	.LVL534-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST162:
	.long	.LVL530-.Ltext0
	.long	.LVL532-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST163:
	.long	.LVL531-.Ltext0
	.long	.LVL533-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST165:
	.long	.LVL535-.Ltext0
	.long	.LVL536-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL536-.Ltext0
	.long	.LVL547-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	0x0
	.long	0x0
.LLST166:
	.long	.LVL537-.Ltext0
	.long	.LVL546-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	0x0
	.long	0x0
.LLST167:
	.long	.LVL538-.Ltext0
	.long	.LVL543-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL544-.Ltext0
	.long	.LVL545-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST168:
	.long	.LVL539-.Ltext0
	.long	.LVL542-.Ltext0
	.word	0x6
	.byte	0x6e
	.byte	0x93
	.uleb128 0x1
	.byte	0x6f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST169:
	.long	.LVL540-.Ltext0
	.long	.LVL541-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST171:
	.long	.LVL548-.Ltext0
	.long	.LVL549-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL549-.Ltext0
	.long	.LVL558-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST172:
	.long	.LVL550-.Ltext0
	.long	.LVL559-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	.LVL559-.Ltext0
	.long	.LVL562-.Ltext0
	.word	0x1
	.byte	0x5a
	.long	0x0
	.long	0x0
.LLST173:
	.long	.LVL555-.Ltext0
	.long	.LVL557-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST174:
	.long	.LVL551-.Ltext0
	.long	.LVL560-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	0x0
	.long	0x0
.LLST175:
	.long	.LVL552-.Ltext0
	.long	.LVL553-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL554-.Ltext0
	.long	.LVL556-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST176:
	.long	.LVL560-.Ltext0
	.long	.LVL561-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	0x0
	.long	0x0
.LLST178:
	.long	.LVL563-.Ltext0
	.long	.LVL564-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL564-.Ltext0
	.long	.LVL571-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST179:
	.long	.LVL567-.Ltext0
	.long	.LVL568-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	.LVL570-.Ltext0
	.long	.LVL576-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	0x0
	.long	0x0
.LLST180:
	.long	.LVL570-.Ltext0
	.long	.LVL575-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST182:
	.long	.LVL577-.Ltext0
	.long	.LVL578-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL578-.Ltext0
	.long	.LVL601-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST183:
	.long	.LVL579-.Ltext0
	.long	.LVL580-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL581-.Ltext0
	.long	.LVL589-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST184:
	.long	.LVL582-.Ltext0
	.long	.LVL584-.Ltext0
	.word	0x1
	.byte	0x66
	.long	.LVL585-.Ltext0
	.long	.LVL588-.Ltext0
	.word	0x1
	.byte	0x66
	.long	0x0
	.long	0x0
.LLST185:
	.long	.LVL583-.Ltext0
	.long	.LVL584-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL586-.Ltext0
	.long	.LVL587-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL587-.Ltext0
	.long	.LVL592-.Ltext0
	.word	0x1
	.byte	0x56
	.long	.LVL592-.Ltext0
	.long	.LVL593-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL593-.Ltext0
	.long	.LVL594-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST186:
	.long	.LVL590-.Ltext0
	.long	.LVL602-.Ltext0
	.word	0x6
	.byte	0x5e
	.byte	0x93
	.uleb128 0x1
	.byte	0x5f
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST187:
	.long	.LVL591-.Ltext0
	.long	.LVL595-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL596-.Ltext0
	.long	.LVL603-.Ltext0
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST188:
	.long	.LVL597-.Ltext0
	.long	.LVL598-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL599-.Ltext0
	.long	.LVL600-.Ltext0
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST190:
	.long	.LVL604-.Ltext0
	.long	.LVL605-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL605-.Ltext0
	.long	.LVL608-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL609-.Ltext0
	.long	.LVL614-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST191:
	.long	.LVL606-.Ltext0
	.long	.LVL607-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	.LVL607-.Ltext0
	.long	.LVL609-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL609-.Ltext0
	.long	.LVL613-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	.LVL613-.Ltext0
	.long	.LVL616-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	0x0
	.long	0x0
.LLST192:
	.long	.LVL610-.Ltext0
	.long	.LVL612-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST193:
	.long	.LVL613-.Ltext0
	.long	.LVL615-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST195:
	.long	.LVL617-.Ltext0
	.long	.LVL618-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL618-.Ltext0
	.long	.LVL645-.Ltext0
	.word	0x1
	.byte	0x57
	.long	0x0
	.long	0x0
.LLST196:
	.long	.LVL619-.Ltext0
	.long	.LVL642-.Ltext0
	.word	0x1
	.byte	0x5a
	.long	0x0
	.long	0x0
.LLST197:
	.long	.LVL620-.Ltext0
	.long	.LVL643-.Ltext0
	.word	0x1
	.byte	0x59
	.long	0x0
	.long	0x0
.LLST198:
	.long	.LVL621-.Ltext0
	.long	.LVL641-.Ltext0
	.word	0x1
	.byte	0x5b
	.long	0x0
	.long	0x0
.LLST199:
	.long	.LVL622-.Ltext0
	.long	.LVL644-.Ltext0
	.word	0x1
	.byte	0x58
	.long	0x0
	.long	0x0
.LLST200:
	.long	.LVL623-.Ltext0
	.long	.LVL625-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	.LVL625-.Ltext0
	.long	.LVL626-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL626-.Ltext0
	.long	.LVL639-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	.LVL639-.Ltext0
	.long	.LFE21-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST201:
	.long	.LVL624-.Ltext0
	.long	.LVL638-.Ltext0
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST202:
	.long	.LVL624-.Ltext0
	.long	.LVL640-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	0x0
	.long	0x0
.LLST203:
	.long	.LVL628-.Ltext0
	.long	.LVL630-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL634-.Ltext0
	.long	.LVL635-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL637-.Ltext0
	.long	.LFE21-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST204:
	.long	.LVL632-.Ltext0
	.long	.LVL633-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL636-.Ltext0
	.long	.LVL637-.Ltext0
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST206:
	.long	.LVL646-.Ltext0
	.long	.LVL647-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL647-.Ltext0
	.long	.LVL654-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL655-.Ltext0
	.long	.LVL656-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST207:
	.long	.LVL652-.Ltext0
	.long	.LVL672-.Ltext0
	.word	0x1
	.byte	0x56
	.long	0x0
	.long	0x0
.LLST208:
	.long	.LVL648-.Ltext0
	.long	.LVL667-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	0x0
	.long	0x0
.LLST209:
	.long	.LVL649-.Ltext0
	.long	.LVL668-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	0x0
	.long	0x0
.LLST210:
	.long	.LVL650-.Ltext0
	.long	.LVL671-.Ltext0
	.word	0x1
	.byte	0x59
	.long	0x0
	.long	0x0
.LLST211:
	.long	.LVL651-.Ltext0
	.long	.LVL670-.Ltext0
	.word	0x1
	.byte	0x5a
	.long	0x0
	.long	0x0
.LLST212:
	.long	.LVL653-.Ltext0
	.long	.LVL660-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL661-.Ltext0
	.long	.LVL663-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL664-.Ltext0
	.long	.LVL666-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST213:
	.long	.LVL652-.Ltext0
	.long	.LVL665-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
.LLST214:
	.long	.LVL652-.Ltext0
	.long	.LVL669-.Ltext0
	.word	0x1
	.byte	0x5b
	.long	0x0
	.long	0x0
.LLST215:
	.long	.LVL657-.Ltext0
	.long	.LVL658-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL659-.Ltext0
	.long	.LVL662-.Ltext0
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST217:
	.long	.LVL673-.Ltext0
	.long	.LVL674-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL674-.Ltext0
	.long	.LVL691-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	.LVL692-.Ltext0
	.long	.LVL693-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	.LVL697-.Ltext0
	.long	.LFE16-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	0x0
	.long	0x0
.LLST218:
	.long	.LVL675-.Ltext0
	.long	.LVL694-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	.LVL697-.Ltext0
	.long	.LFE16-.Ltext0
	.word	0x1
	.byte	0x5d
	.long	0x0
	.long	0x0
.LLST219:
	.long	.LVL676-.Ltext0
	.long	.LVL688-.Ltext0
	.word	0x1
	.byte	0x5b
	.long	.LVL688-.Ltext0
	.long	.LVL689-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL690-.Ltext0
	.long	.LVL695-.Ltext0
	.word	0x1
	.byte	0x5b
	.long	.LVL697-.Ltext0
	.long	.LFE16-.Ltext0
	.word	0x1
	.byte	0x5b
	.long	0x0
	.long	0x0
.LLST220:
	.long	.LVL677-.Ltext0
	.long	.LVL678-.Ltext0
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	.LVL679-.Ltext0
	.long	.LVL696-.Ltext0
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	.LVL697-.Ltext0
	.long	.LFE16-.Ltext0
	.word	0x6
	.byte	0x58
	.byte	0x93
	.uleb128 0x1
	.byte	0x59
	.byte	0x93
	.uleb128 0x1
	.long	0x0
	.long	0x0
.LLST221:
	.long	.LVL684-.Ltext0
	.long	.LVL685-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL686-.Ltext0
	.long	.LVL687-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST222:
	.long	.LVL680-.Ltext0
	.long	.LVL681-.Ltext0
	.word	0x1
	.byte	0x62
	.long	.LVL682-.Ltext0
	.long	.LVL683-.Ltext0
	.word	0x1
	.byte	0x62
	.long	0x0
	.long	0x0
.LLST224:
	.long	.LVL698-.Ltext0
	.long	.LVL699-.Ltext0
	.word	0x1
	.byte	0x68
	.long	.LVL699-.Ltext0
	.long	.LVL724-.Ltext0
	.word	0x1
	.byte	0x5f
	.long	0x0
	.long	0x0
.LLST225:
	.long	.LVL700-.Ltext0
	.long	.LVL702-.Ltext0
	.word	0x1
	.byte	0x68
	.long	0x0
	.long	0x0
.LLST226:
	.long	.LVL703-.Ltext0
	.long	.LVL708-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL709-.Ltext0
	.long	.LVL710-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL711-.Ltext0
	.long	.LVL712-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL713-.Ltext0
	.long	.LVL719-.Ltext0
	.word	0x1
	.byte	0x60
	.long	.LVL721-.Ltext0
	.long	.LVL723-.Ltext0
	.word	0x1
	.byte	0x60
	.long	0x0
	.long	0x0
.LLST227:
	.long	.LVL701-.Ltext0
	.long	.LVL704-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL704-.Ltext0
	.long	.LVL716-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	.LVL716-.Ltext0
	.long	.LVL717-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL717-.Ltext0
	.long	.LVL718-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	.LVL718-.Ltext0
	.long	.LVL721-.Ltext0
	.word	0x1
	.byte	0x5e
	.long	.LVL721-.Ltext0
	.long	.LVL725-.Ltext0
	.word	0x1
	.byte	0x5c
	.long	0x0
	.long	0x0
.LLST228:
	.long	.LVL703-.Ltext0
	.long	.LVL704-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL705-.Ltext0
	.long	.LVL706-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL707-.Ltext0
	.long	.LVL720-.Ltext0
	.word	0x1
	.byte	0x61
	.long	.LVL721-.Ltext0
	.long	.LVL722-.Ltext0
	.word	0x1
	.byte	0x61
	.long	0x0
	.long	0x0
	.section	.debug_info
	.long	0x3bf6
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF323
	.byte	0x4
	.long	.LASF324
	.long	.LASF325
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
	.uleb128 0x2
	.long	.LASF7
	.byte	0x3
	.byte	0x7d
	.long	0x78
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.long	.LASF8
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF9
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF10
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x2
	.long	.LASF12
	.byte	0x4
	.byte	0xd4
	.long	0x9f
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.uleb128 0x2
	.long	.LASF13
	.byte	0x4
	.byte	0xd5
	.long	0xad
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.uleb128 0x2
	.long	.LASF14
	.byte	0x4
	.byte	0xd8
	.long	0xad
	.uleb128 0x3
	.byte	0x1
	.byte	0x2
	.long	.LASF15
	.uleb128 0x6
	.long	.LASF326
	.byte	0x2
	.byte	0x2
	.byte	0x8f
	.long	0x159
	.uleb128 0x7
	.long	.LASF16
	.sleb128 0
	.uleb128 0x7
	.long	.LASF17
	.sleb128 1
	.uleb128 0x7
	.long	.LASF18
	.sleb128 2
	.uleb128 0x7
	.long	.LASF19
	.sleb128 3
	.uleb128 0x7
	.long	.LASF20
	.sleb128 4
	.uleb128 0x7
	.long	.LASF21
	.sleb128 5
	.uleb128 0x7
	.long	.LASF22
	.sleb128 6
	.uleb128 0x7
	.long	.LASF23
	.sleb128 7
	.uleb128 0x7
	.long	.LASF24
	.sleb128 8
	.uleb128 0x7
	.long	.LASF25
	.sleb128 9
	.uleb128 0x7
	.long	.LASF26
	.sleb128 10
	.uleb128 0x7
	.long	.LASF27
	.sleb128 11
	.uleb128 0x7
	.long	.LASF28
	.sleb128 12
	.uleb128 0x7
	.long	.LASF29
	.sleb128 13
	.uleb128 0x7
	.long	.LASF30
	.sleb128 14
	.uleb128 0x7
	.long	.LASF31
	.sleb128 15
	.uleb128 0x7
	.long	.LASF32
	.sleb128 16
	.uleb128 0x7
	.long	.LASF33
	.sleb128 17
	.uleb128 0x7
	.long	.LASF34
	.sleb128 18
	.uleb128 0x7
	.long	.LASF35
	.sleb128 19
	.uleb128 0x7
	.long	.LASF36
	.sleb128 20
	.uleb128 0x7
	.long	.LASF37
	.sleb128 21
	.uleb128 0x7
	.long	.LASF38
	.sleb128 22
	.byte	0x0
	.uleb128 0x2
	.long	.LASF39
	.byte	0x2
	.byte	0xd2
	.long	0x164
	.uleb128 0x8
	.byte	0x2
	.long	0x16a
	.uleb128 0x9
	.long	0x175
	.uleb128 0xa
	.long	0x37
	.byte	0x0
	.uleb128 0xb
	.long	.LASF45
	.byte	0x2
	.byte	0x5
	.byte	0x1d
	.long	0x1c6
	.uleb128 0xc
	.long	.LASF40
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
	.long	.LASF41
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
	.long	.LASF42
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
	.long	.LASF43
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
	.long	.LASF44
	.byte	0x5
	.byte	0x22
	.long	0x175
	.uleb128 0xb
	.long	.LASF46
	.byte	0x10
	.byte	0x5
	.byte	0x24
	.long	0x1fa
	.uleb128 0xd
	.long	.LASF47
	.byte	0x5
	.byte	0x25
	.long	0x1fa
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.long	.LASF48
	.byte	0x5
	.byte	0x26
	.long	0x20d
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0x0
	.uleb128 0xe
	.long	0x49
	.long	0x20a
	.uleb128 0xf
	.long	0x20a
	.byte	0x3
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.uleb128 0xe
	.long	0x1c6
	.long	0x21d
	.uleb128 0xf
	.long	0x20a
	.byte	0x3
	.byte	0x0
	.uleb128 0x2
	.long	.LASF49
	.byte	0x5
	.byte	0x27
	.long	0x1d1
	.uleb128 0xb
	.long	.LASF50
	.byte	0x33
	.byte	0x5
	.byte	0x2a
	.long	0x2f9
	.uleb128 0xd
	.long	.LASF51
	.byte	0x5
	.byte	0x2b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.long	.LASF52
	.byte	0x5
	.byte	0x2c
	.long	0x1fa
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xd
	.long	.LASF53
	.byte	0x5
	.byte	0x2d
	.long	0x1fa
	.byte	0x2
	.byte	0x23
	.uleb128 0x9
	.uleb128 0xd
	.long	.LASF54
	.byte	0x5
	.byte	0x2e
	.long	0x1fa
	.byte	0x2
	.byte	0x23
	.uleb128 0x11
	.uleb128 0xd
	.long	.LASF55
	.byte	0x5
	.byte	0x2f
	.long	0x5b
	.byte	0x2
	.byte	0x23
	.uleb128 0x19
	.uleb128 0xd
	.long	.LASF56
	.byte	0x5
	.byte	0x30
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1b
	.uleb128 0xd
	.long	.LASF57
	.byte	0x5
	.byte	0x31
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1c
	.uleb128 0xd
	.long	.LASF58
	.byte	0x5
	.byte	0x32
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1d
	.uleb128 0xd
	.long	.LASF59
	.byte	0x5
	.byte	0x33
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1e
	.uleb128 0xd
	.long	.LASF60
	.byte	0x5
	.byte	0x34
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1f
	.uleb128 0xd
	.long	.LASF61
	.byte	0x5
	.byte	0x35
	.long	0x21d
	.byte	0x2
	.byte	0x23
	.uleb128 0x20
	.uleb128 0xd
	.long	.LASF62
	.byte	0x5
	.byte	0x36
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x30
	.uleb128 0xd
	.long	.LASF63
	.byte	0x5
	.byte	0x3b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x31
	.uleb128 0xd
	.long	.LASF64
	.byte	0x5
	.byte	0x3c
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x32
	.byte	0x0
	.uleb128 0x2
	.long	.LASF65
	.byte	0x5
	.byte	0x3d
	.long	0x228
	.uleb128 0xb
	.long	.LASF66
	.byte	0x5
	.byte	0x5
	.byte	0x47
	.long	0x357
	.uleb128 0xd
	.long	.LASF67
	.byte	0x5
	.byte	0x48
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.long	.LASF68
	.byte	0x5
	.byte	0x49
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xd
	.long	.LASF69
	.byte	0x5
	.byte	0x4a
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xd
	.long	.LASF70
	.byte	0x5
	.byte	0x4b
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xd
	.long	.LASF71
	.byte	0x5
	.byte	0x4c
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.byte	0x0
	.uleb128 0x2
	.long	.LASF72
	.byte	0x5
	.byte	0x4d
	.long	0x304
	.uleb128 0xb
	.long	.LASF73
	.byte	0x3
	.byte	0x5
	.byte	0x4f
	.long	0x38b
	.uleb128 0xd
	.long	.LASF74
	.byte	0x5
	.byte	0x50
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.long	.LASF75
	.byte	0x5
	.byte	0x51
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.byte	0x0
	.uleb128 0x2
	.long	.LASF76
	.byte	0x5
	.byte	0x52
	.long	0x362
	.uleb128 0xb
	.long	.LASF77
	.byte	0x5
	.byte	0x5
	.byte	0x54
	.long	0x3db
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
	.long	.LASF78
	.byte	0x5
	.byte	0x57
	.long	0xbb
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xd
	.long	.LASF79
	.byte	0x5
	.byte	0x58
	.long	0x49
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.byte	0x0
	.uleb128 0x2
	.long	.LASF80
	.byte	0x5
	.byte	0x59
	.long	0x396
	.uleb128 0xb
	.long	.LASF81
	.byte	0x6
	.byte	0x5
	.byte	0x5c
	.long	0x46f
	.uleb128 0xd
	.long	.LASF82
	.byte	0x5
	.byte	0x5d
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xc
	.long	.LASF83
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
	.long	.LASF84
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
	.long	.LASF85
	.byte	0x5
	.byte	0x60
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0xd
	.long	.LASF41
	.byte	0x5
	.byte	0x61
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0xd
	.long	.LASF86
	.byte	0x5
	.byte	0x62
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0xc
	.long	.LASF87
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
	.long	.LASF88
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
	.long	.LASF89
	.byte	0x5
	.byte	0x65
	.long	0x3e6
	.uleb128 0x11
	.long	.LASF90
	.word	0x18b
	.byte	0x5
	.byte	0x68
	.long	0x56d
	.uleb128 0xd
	.long	.LASF91
	.byte	0x5
	.byte	0x69
	.long	0x56d
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.long	.LASF92
	.byte	0x5
	.byte	0x6a
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xa
	.uleb128 0xd
	.long	.LASF93
	.byte	0x5
	.byte	0x6b
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xb
	.uleb128 0xd
	.long	.LASF94
	.byte	0x5
	.byte	0x6c
	.long	0x5b
	.byte	0x2
	.byte	0x23
	.uleb128 0xc
	.uleb128 0xd
	.long	.LASF95
	.byte	0x5
	.byte	0x6d
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0xe
	.uleb128 0xd
	.long	.LASF96
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
	.long	0x584
	.byte	0x2
	.byte	0x23
	.uleb128 0x10
	.uleb128 0xd
	.long	.LASF97
	.byte	0x5
	.byte	0x70
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x12
	.uleb128 0xd
	.long	.LASF98
	.byte	0x5
	.byte	0x71
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x13
	.uleb128 0xd
	.long	.LASF99
	.byte	0x5
	.byte	0x72
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x14
	.uleb128 0xd
	.long	.LASF100
	.byte	0x5
	.byte	0x73
	.long	0x594
	.byte	0x2
	.byte	0x23
	.uleb128 0x15
	.uleb128 0xd
	.long	.LASF101
	.byte	0x5
	.byte	0x74
	.long	0x5a4
	.byte	0x3
	.byte	0x23
	.uleb128 0xab
	.uleb128 0xd
	.long	.LASF102
	.byte	0x5
	.byte	0x75
	.long	0x5b4
	.byte	0x3
	.byte	0x23
	.uleb128 0xb7
	.uleb128 0xd
	.long	.LASF103
	.byte	0x5
	.byte	0x76
	.long	0x5c4
	.byte	0x3
	.byte	0x23
	.uleb128 0x107
	.uleb128 0xd
	.long	.LASF104
	.byte	0x5
	.byte	0x77
	.long	0x5d4
	.byte	0x3
	.byte	0x23
	.uleb128 0x11b
	.uleb128 0xd
	.long	.LASF105
	.byte	0x5
	.byte	0x78
	.long	0x5ea
	.byte	0x3
	.byte	0x23
	.uleb128 0x143
	.byte	0x0
	.uleb128 0xe
	.long	0x57d
	.long	0x57d
	.uleb128 0xf
	.long	0x20a
	.byte	0x9
	.byte	0x0
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF106
	.uleb128 0xe
	.long	0x57d
	.long	0x594
	.uleb128 0xf
	.long	0x20a
	.byte	0x1
	.byte	0x0
	.uleb128 0xe
	.long	0x46f
	.long	0x5a4
	.uleb128 0xf
	.long	0x20a
	.byte	0x18
	.byte	0x0
	.uleb128 0xe
	.long	0x38b
	.long	0x5b4
	.uleb128 0xf
	.long	0x20a
	.byte	0x3
	.byte	0x0
	.uleb128 0xe
	.long	0x3db
	.long	0x5c4
	.uleb128 0xf
	.long	0x20a
	.byte	0xf
	.byte	0x0
	.uleb128 0xe
	.long	0x357
	.long	0x5d4
	.uleb128 0xf
	.long	0x20a
	.byte	0x3
	.byte	0x0
	.uleb128 0xe
	.long	0x25
	.long	0x5ea
	.uleb128 0xf
	.long	0x20a
	.byte	0x7
	.uleb128 0xf
	.long	0x20a
	.byte	0x4
	.byte	0x0
	.uleb128 0xe
	.long	0x25
	.long	0x600
	.uleb128 0xf
	.long	0x20a
	.byte	0x7
	.uleb128 0xf
	.long	0x20a
	.byte	0x8
	.byte	0x0
	.uleb128 0x2
	.long	.LASF107
	.byte	0x5
	.byte	0x7c
	.long	0x47a
	.uleb128 0x2
	.long	.LASF108
	.byte	0x1
	.byte	0x1d
	.long	0x616
	.uleb128 0x8
	.byte	0x2
	.long	0x16a
	.uleb128 0xb
	.long	.LASF109
	.byte	0x4
	.byte	0x1
	.byte	0x35
	.long	0x6e4
	.uleb128 0xd
	.long	.LASF110
	.byte	0x1
	.byte	0x36
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0xd
	.long	.LASF111
	.byte	0x1
	.byte	0x37
	.long	0x37
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0xd
	.long	.LASF112
	.byte	0x1
	.byte	0x39
	.long	0x6e4
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x12
	.long	.LASF137
	.byte	0x1
	.byte	0x3a
	.long	.LASF327
	.long	0x37
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.byte	0x1
	.long	.LASF113
	.byte	0x1
	.byte	0x38
	.long	.LASF115
	.byte	0x1
	.long	0x67b
	.uleb128 0x14
	.long	0x6ea
	.byte	0x1
	.byte	0x0
	.uleb128 0x13
	.byte	0x1
	.long	.LASF114
	.byte	0x1
	.byte	0x3b
	.long	.LASF116
	.byte	0x1
	.long	0x6ac
	.uleb128 0x14
	.long	0x6ea
	.byte	0x1
	.uleb128 0xa
	.long	0x37
	.uleb128 0xa
	.long	0x37
	.uleb128 0xa
	.long	0x6f0
	.uleb128 0xa
	.long	0x37
	.uleb128 0xa
	.long	0x37
	.byte	0x0
	.uleb128 0x15
	.byte	0x1
	.long	.LASF125
	.byte	0x1
	.byte	0x3c
	.long	.LASF328
	.byte	0x1
	.uleb128 0x14
	.long	0x6ea
	.byte	0x1
	.uleb128 0xa
	.long	0x37
	.uleb128 0xa
	.long	0x37
	.uleb128 0xa
	.long	0x6f0
	.uleb128 0xa
	.long	0x37
	.uleb128 0xa
	.long	0x6e4
	.uleb128 0xa
	.long	0x37
	.uleb128 0xa
	.long	0x37
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.long	0xb0
	.uleb128 0x8
	.byte	0x2
	.long	0x61c
	.uleb128 0x8
	.byte	0x2
	.long	0x159
	.uleb128 0x16
	.long	.LASF117
	.byte	0x6
	.byte	0x1
	.word	0x1d1
	.long	0x773
	.uleb128 0x17
	.long	.LASF118
	.byte	0x1
	.word	0x1d2
	.long	0xbb
	.byte	0x1
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x17
	.long	.LASF119
	.byte	0x1
	.word	0x1d3
	.long	0xbb
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0x0
	.uleb128 0x18
	.long	.LASF120
	.byte	0x1
	.word	0x1d4
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x1
	.uleb128 0x18
	.long	.LASF121
	.byte	0x1
	.word	0x1d5
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x18
	.long	.LASF122
	.byte	0x1
	.word	0x1d6
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x3
	.uleb128 0x18
	.long	.LASF123
	.byte	0x1
	.word	0x1d7
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x18
	.long	.LASF124
	.byte	0x1
	.word	0x1d8
	.long	0x25
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF126
	.byte	0x2
	.word	0x1b2
	.byte	0x3
	.long	0x78c
	.uleb128 0x1a
	.string	"b"
	.byte	0x2
	.word	0x1b2
	.long	0x37
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF127
	.byte	0x1
	.word	0x7e2
	.byte	0x1
	.long	0x7b1
	.uleb128 0x1a
	.string	"hi"
	.byte	0x1
	.word	0x7e2
	.long	0x5b
	.uleb128 0x1a
	.string	"lo"
	.byte	0x1
	.word	0x7e2
	.long	0x5b
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF128
	.byte	0x1
	.word	0x7e8
	.byte	0x1
	.long	0x7d8
	.uleb128 0x1a
	.string	"val"
	.byte	0x1
	.word	0x7e8
	.long	0x37
	.uleb128 0x1b
	.uleb128 0x1c
	.long	0x7a5
	.uleb128 0x1c
	.long	0x79a
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF129
	.byte	0x2
	.word	0x14e
	.long	0x66
	.byte	0x3
	.long	0x7ff
	.uleb128 0x1a
	.string	"a"
	.byte	0x2
	.word	0x14e
	.long	0x66
	.uleb128 0x1a
	.string	"b"
	.byte	0x2
	.word	0x14e
	.long	0x66
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF130
	.byte	0x2
	.word	0x150
	.long	0x54
	.byte	0x3
	.long	0x826
	.uleb128 0x1a
	.string	"a"
	.byte	0x2
	.word	0x150
	.long	0x54
	.uleb128 0x1a
	.string	"b"
	.byte	0x2
	.word	0x150
	.long	0x54
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF131
	.byte	0x2
	.word	0x14c
	.long	0x54
	.byte	0x3
	.long	0x843
	.uleb128 0x1a
	.string	"a"
	.byte	0x2
	.word	0x14c
	.long	0x54
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF132
	.byte	0x2
	.word	0x14e
	.long	0x54
	.byte	0x3
	.long	0x86a
	.uleb128 0x1a
	.string	"a"
	.byte	0x2
	.word	0x14e
	.long	0x54
	.uleb128 0x1a
	.string	"b"
	.byte	0x2
	.word	0x14e
	.long	0x54
	.byte	0x0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF133
	.byte	0x1
	.word	0x6aa
	.byte	0x1
	.long	0x891
	.uleb128 0x1b
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.word	0x6b1
	.long	0x37
	.uleb128 0x1b
	.uleb128 0x1e
	.string	"v"
	.byte	0x1
	.word	0x6b2
	.long	0x49
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF134
	.byte	0x2
	.word	0x14e
	.long	0x30
	.byte	0x3
	.long	0x8b8
	.uleb128 0x1a
	.string	"a"
	.byte	0x2
	.word	0x14e
	.long	0x30
	.uleb128 0x1a
	.string	"b"
	.byte	0x2
	.word	0x14e
	.long	0x30
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF135
	.byte	0x2
	.word	0x150
	.long	0x30
	.byte	0x3
	.long	0x8df
	.uleb128 0x1a
	.string	"a"
	.byte	0x2
	.word	0x150
	.long	0x30
	.uleb128 0x1a
	.string	"b"
	.byte	0x2
	.word	0x150
	.long	0x30
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF136
	.byte	0x2
	.word	0x119
	.long	0xbb
	.byte	0x1
	.long	0x914
	.uleb128 0x1f
	.long	.LASF137
	.byte	0x2
	.word	0x119
	.long	0x37
	.uleb128 0x1a
	.string	"p"
	.byte	0x2
	.word	0x119
	.long	0x914
	.uleb128 0x1f
	.long	.LASF138
	.byte	0x2
	.word	0x119
	.long	0x37
	.byte	0x0
	.uleb128 0x20
	.byte	0x2
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF139
	.byte	0x2
	.word	0x119
	.long	0xbb
	.byte	0x1
	.long	0x94b
	.uleb128 0x1f
	.long	.LASF137
	.byte	0x2
	.word	0x119
	.long	0x37
	.uleb128 0x1a
	.string	"p"
	.byte	0x2
	.word	0x119
	.long	0x914
	.uleb128 0x1f
	.long	.LASF138
	.byte	0x2
	.word	0x119
	.long	0x37
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF140
	.byte	0x2
	.word	0x119
	.long	0xbb
	.byte	0x1
	.long	0x980
	.uleb128 0x1f
	.long	.LASF137
	.byte	0x2
	.word	0x119
	.long	0x37
	.uleb128 0x1a
	.string	"p"
	.byte	0x2
	.word	0x119
	.long	0x914
	.uleb128 0x1f
	.long	.LASF138
	.byte	0x2
	.word	0x119
	.long	0x37
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF141
	.byte	0x2
	.word	0x14e
	.long	0x42
	.byte	0x3
	.long	0x9a7
	.uleb128 0x1a
	.string	"a"
	.byte	0x2
	.word	0x14e
	.long	0x42
	.uleb128 0x1a
	.string	"b"
	.byte	0x2
	.word	0x14e
	.long	0x42
	.byte	0x0
	.uleb128 0x21
	.long	0x663
	.byte	0x3
	.long	0x9bc
	.uleb128 0x22
	.long	.LASF218
	.long	0x9bc
	.byte	0x1
	.byte	0x0
	.uleb128 0x23
	.long	0x6ea
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF142
	.byte	0x1
	.word	0x365
	.long	0x37
	.byte	0x1
	.long	0xa11
	.uleb128 0x1a
	.string	"c"
	.byte	0x1
	.word	0x365
	.long	0x57d
	.uleb128 0x1e
	.string	"ret"
	.byte	0x1
	.word	0x367
	.long	0x25
	.uleb128 0x1b
	.uleb128 0x1e
	.string	"cc"
	.byte	0x1
	.word	0x369
	.long	0x57d
	.uleb128 0x1b
	.uleb128 0x24
	.long	.LASF143
	.byte	0x1
	.word	0x369
	.long	0x5b
	.uleb128 0x24
	.long	.LASF144
	.byte	0x1
	.word	0x369
	.long	0x37
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF145
	.byte	0x1
	.word	0x36e
	.long	0x57d
	.byte	0x1
	.long	0xa4a
	.uleb128 0x1a
	.string	"idx"
	.byte	0x1
	.word	0x36e
	.long	0x37
	.uleb128 0x1b
	.uleb128 0x24
	.long	.LASF143
	.byte	0x1
	.word	0x370
	.long	0x5b
	.uleb128 0x24
	.long	.LASF144
	.byte	0x1
	.word	0x370
	.long	0x37
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF146
	.byte	0x2
	.word	0x119
	.long	0xbb
	.byte	0x1
	.long	0xa7f
	.uleb128 0x1f
	.long	.LASF137
	.byte	0x2
	.word	0x119
	.long	0x37
	.uleb128 0x1a
	.string	"p"
	.byte	0x2
	.word	0x119
	.long	0x914
	.uleb128 0x1f
	.long	.LASF138
	.byte	0x2
	.word	0x119
	.long	0x37
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF147
	.byte	0x2
	.word	0x119
	.long	0xbb
	.byte	0x1
	.long	0xab4
	.uleb128 0x1f
	.long	.LASF137
	.byte	0x2
	.word	0x119
	.long	0x37
	.uleb128 0x1a
	.string	"p"
	.byte	0x2
	.word	0x119
	.long	0x914
	.uleb128 0x1f
	.long	.LASF138
	.byte	0x2
	.word	0x119
	.long	0x37
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF148
	.byte	0x2
	.word	0x119
	.long	0xbb
	.byte	0x1
	.long	0xae9
	.uleb128 0x1f
	.long	.LASF137
	.byte	0x2
	.word	0x119
	.long	0x37
	.uleb128 0x1a
	.string	"p"
	.byte	0x2
	.word	0x119
	.long	0x914
	.uleb128 0x1f
	.long	.LASF138
	.byte	0x2
	.word	0x119
	.long	0x37
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF149
	.byte	0x2
	.word	0x119
	.long	0xbb
	.byte	0x1
	.long	0xb1e
	.uleb128 0x1f
	.long	.LASF137
	.byte	0x2
	.word	0x119
	.long	0x37
	.uleb128 0x1a
	.string	"p"
	.byte	0x2
	.word	0x119
	.long	0x914
	.uleb128 0x1f
	.long	.LASF138
	.byte	0x2
	.word	0x119
	.long	0x37
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF150
	.byte	0x2
	.word	0x119
	.long	0xbb
	.byte	0x1
	.long	0xb53
	.uleb128 0x1f
	.long	.LASF137
	.byte	0x2
	.word	0x119
	.long	0x37
	.uleb128 0x1a
	.string	"p"
	.byte	0x2
	.word	0x119
	.long	0x914
	.uleb128 0x1f
	.long	.LASF138
	.byte	0x2
	.word	0x119
	.long	0x37
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF151
	.byte	0x2
	.word	0x119
	.long	0xbb
	.byte	0x1
	.long	0xb88
	.uleb128 0x1f
	.long	.LASF137
	.byte	0x2
	.word	0x119
	.long	0x37
	.uleb128 0x1a
	.string	"p"
	.byte	0x2
	.word	0x119
	.long	0x914
	.uleb128 0x1f
	.long	.LASF138
	.byte	0x2
	.word	0x119
	.long	0x37
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF152
	.byte	0x2
	.word	0x119
	.long	0xbb
	.byte	0x1
	.long	0xbbd
	.uleb128 0x1f
	.long	.LASF137
	.byte	0x2
	.word	0x119
	.long	0x37
	.uleb128 0x1a
	.string	"p"
	.byte	0x2
	.word	0x119
	.long	0x914
	.uleb128 0x1f
	.long	.LASF138
	.byte	0x2
	.word	0x119
	.long	0x37
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF153
	.byte	0x2
	.word	0x119
	.long	0xbb
	.byte	0x1
	.long	0xbf2
	.uleb128 0x1f
	.long	.LASF137
	.byte	0x2
	.word	0x119
	.long	0x37
	.uleb128 0x1a
	.string	"p"
	.byte	0x2
	.word	0x119
	.long	0x914
	.uleb128 0x1f
	.long	.LASF138
	.byte	0x2
	.word	0x119
	.long	0x37
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF154
	.byte	0x2
	.word	0x119
	.long	0xbb
	.byte	0x1
	.long	0xc27
	.uleb128 0x1f
	.long	.LASF137
	.byte	0x2
	.word	0x119
	.long	0x37
	.uleb128 0x1a
	.string	"p"
	.byte	0x2
	.word	0x119
	.long	0x914
	.uleb128 0x1f
	.long	.LASF138
	.byte	0x2
	.word	0x119
	.long	0x37
	.byte	0x0
	.uleb128 0x1d
	.byte	0x1
	.long	.LASF155
	.byte	0x2
	.word	0x119
	.long	0xbb
	.byte	0x1
	.long	0xc5c
	.uleb128 0x1f
	.long	.LASF137
	.byte	0x2
	.word	0x119
	.long	0x37
	.uleb128 0x1a
	.string	"p"
	.byte	0x2
	.word	0x119
	.long	0x914
	.uleb128 0x1f
	.long	.LASF138
	.byte	0x2
	.word	0x119
	.long	0x37
	.byte	0x0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF156
	.byte	0x1
	.word	0x294
	.long	.LASF158
	.long	0x5b
	.long	.LFB23
	.long	.LFE23
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xc99
	.uleb128 0x26
	.string	"x"
	.byte	0x1
	.word	0x294
	.long	0x5b
	.long	.LLST1
	.uleb128 0x26
	.string	"k"
	.byte	0x1
	.word	0x294
	.long	0x5b
	.long	.LLST2
	.byte	0x0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF157
	.byte	0x1
	.word	0x2a1
	.long	.LASF159
	.long	0x49
	.long	.LFB24
	.long	.LFE24
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xcf4
	.uleb128 0x26
	.string	"x"
	.byte	0x1
	.word	0x2a1
	.long	0x49
	.long	.LLST4
	.uleb128 0x26
	.string	"k"
	.byte	0x1
	.word	0x2a1
	.long	0x49
	.long	.LLST5
	.uleb128 0x27
	.string	"y"
	.byte	0x1
	.word	0x2a4
	.long	0x49
	.long	.LLST6
	.uleb128 0x27
	.string	"neg"
	.byte	0x1
	.word	0x2a5
	.long	0xbb
	.long	.LLST7
	.byte	0x0
	.uleb128 0x28
	.long	0x9c1
	.long	.LFB28
	.long	.LFE28
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xd40
	.uleb128 0x29
	.long	0x9d3
	.long	.LLST9
	.uleb128 0x2a
	.long	0x9dd
	.long	.LLST10
	.uleb128 0x2b
	.long	.LBB333
	.long	.LBE333
	.uleb128 0x2c
	.long	0x9ea
	.uleb128 0x2b
	.long	.LBB334
	.long	.LBE334
	.uleb128 0x2c
	.long	0x9f6
	.uleb128 0x2d
	.long	0xa02
	.byte	0x1
	.byte	0x69
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.long	0xa11
	.long	.LFB29
	.long	.LFE29
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xd72
	.uleb128 0x29
	.long	0xa23
	.long	.LLST12
	.uleb128 0x2b
	.long	.LBB336
	.long	.LBE336
	.uleb128 0x2c
	.long	0xa30
	.uleb128 0x2c
	.long	0xa3c
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF164
	.byte	0x1
	.word	0x54b
	.long	.LASF166
	.long	.LFB39
	.long	.LFE39
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xe05
	.uleb128 0x26
	.string	"val"
	.byte	0x1
	.word	0x54b
	.long	0x37
	.long	.LLST14
	.uleb128 0x2f
	.long	.LBB338
	.long	.LBE338
	.long	0xdbc
	.uleb128 0x30
	.long	0x773
	.long	.LBB339
	.long	.LBE339
	.byte	0x1
	.word	0x585
	.byte	0x0
	.uleb128 0x31
	.long	.LASF160
	.byte	0x1
	.word	0x54d
	.long	0x5b
	.byte	0x5
	.byte	0x3
	.long	_ZZ5timerhE6s_time
	.uleb128 0x31
	.long	.LASF161
	.byte	0x1
	.word	0x54e
	.long	0x5b
	.byte	0x5
	.byte	0x3
	.long	_ZZ5timerhE5s_cnt
	.uleb128 0x31
	.long	.LASF162
	.byte	0x1
	.word	0x54f
	.long	0x5b
	.byte	0x5
	.byte	0x3
	.long	_ZZ5timerhE5s_sum
	.uleb128 0x31
	.long	.LASF163
	.byte	0x1
	.word	0x582
	.long	0x49
	.byte	0x5
	.byte	0x3
	.long	_ZZ5timerhE8last_tmr
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF165
	.byte	0x1
	.word	0x58f
	.long	.LASF167
	.long	.LFB40
	.long	.LFE40
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xe68
	.uleb128 0x26
	.string	"val"
	.byte	0x1
	.word	0x58f
	.long	0x37
	.long	.LLST16
	.uleb128 0x31
	.long	.LASF160
	.byte	0x1
	.word	0x592
	.long	0x5b
	.byte	0x5
	.byte	0x3
	.long	_ZZ5tracehE6s_time
	.uleb128 0x31
	.long	.LASF161
	.byte	0x1
	.word	0x593
	.long	0x5b
	.byte	0x5
	.byte	0x3
	.long	_ZZ5tracehE5s_cnt
	.uleb128 0x31
	.long	.LASF162
	.byte	0x1
	.word	0x594
	.long	0x5b
	.byte	0x5
	.byte	0x3
	.long	_ZZ5tracehE5s_sum
	.byte	0x0
	.uleb128 0x28
	.long	0x86a
	.long	.LFB44
	.long	.LFE44
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xe9b
	.uleb128 0x2b
	.long	.LBB343
	.long	.LBE343
	.uleb128 0x2c
	.long	0x879
	.uleb128 0x2b
	.long	.LBB344
	.long	.LBE344
	.uleb128 0x2c
	.long	0x884
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x25
	.byte	0x1
	.long	.LASF168
	.byte	0x1
	.word	0x6bc
	.long	.LASF169
	.long	0x49
	.long	.LFB45
	.long	.LFE45
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xf31
	.uleb128 0x26
	.string	"x"
	.byte	0x1
	.word	0x6bc
	.long	0x49
	.long	.LLST19
	.uleb128 0x26
	.string	"idx"
	.byte	0x1
	.word	0x6bc
	.long	0x37
	.long	.LLST20
	.uleb128 0x27
	.string	"cv9"
	.byte	0x1
	.word	0x6c0
	.long	0xbb
	.long	.LLST21
	.uleb128 0x27
	.string	"crv"
	.byte	0x1
	.word	0x6c1
	.long	0xf31
	.long	.LLST22
	.uleb128 0x27
	.string	"erg"
	.byte	0x1
	.word	0x6c2
	.long	0x49
	.long	.LLST23
	.uleb128 0x2b
	.long	.LBB346
	.long	.LBE346
	.uleb128 0x27
	.string	"a"
	.byte	0x1
	.word	0x6ca
	.long	0x49
	.long	.LLST24
	.uleb128 0x27
	.string	"dx"
	.byte	0x1
	.word	0x6ca
	.long	0x49
	.long	.LLST25
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.long	0x25
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF170
	.byte	0x1
	.word	0x7ca
	.long	.LASF171
	.long	.LFB49
	.long	.LFE49
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xfad
	.uleb128 0x32
	.long	.LASF172
	.byte	0x1
	.word	0x7cf
	.long	0x5b
	.long	.LLST27
	.uleb128 0x27
	.string	"j"
	.byte	0x1
	.word	0x7d0
	.long	0x37
	.long	.LLST28
	.uleb128 0x33
	.string	"p"
	.byte	0x1
	.word	0x7d1
	.long	0x37
	.byte	0x1
	.byte	0x64
	.uleb128 0x2b
	.long	.LBB348
	.long	.LBE348
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.word	0x7d2
	.long	0x37
	.uleb128 0x2b
	.long	.LBB349
	.long	.LBE349
	.uleb128 0x33
	.string	"v"
	.byte	0x1
	.word	0x7d3
	.long	0x49
	.byte	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x28
	.long	0x78c
	.long	.LFB50
	.long	.LFE50
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0xfda
	.uleb128 0x34
	.long	0x79a
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.uleb128 0x34
	.long	0x7a5
	.byte	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.byte	0x0
	.uleb128 0x28
	.long	0x7b1
	.long	.LFB51
	.long	.LFE51
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x1013
	.uleb128 0x29
	.long	0x7bf
	.long	.LLST31
	.uleb128 0x35
	.long	0x78c
	.long	.LBB350
	.long	.LBE350
	.byte	0x1
	.word	0x7ea
	.uleb128 0x1c
	.long	0xfcd
	.uleb128 0x1c
	.long	0xfc1
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF173
	.byte	0x1
	.word	0x7ec
	.long	.LASF174
	.long	.LFB52
	.long	.LFE52
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x10a6
	.uleb128 0x26
	.string	"val"
	.byte	0x1
	.word	0x7ec
	.long	0x37
	.long	.LLST33
	.uleb128 0x36
	.long	0x7b1
	.long	.LBB352
	.long	.LBE352
	.byte	0x1
	.word	0x7ee
	.long	0x1074
	.uleb128 0x1c
	.long	0xfee
	.uleb128 0x35
	.long	0x78c
	.long	.LBB354
	.long	.LBE354
	.byte	0x1
	.word	0x7ea
	.uleb128 0x1c
	.long	0xfcd
	.uleb128 0x1c
	.long	0xfc1
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.long	0x7b1
	.long	.LBB356
	.long	.LBE356
	.byte	0x1
	.word	0x7ee
	.uleb128 0x1c
	.long	0xfee
	.uleb128 0x35
	.long	0x78c
	.long	.LBB358
	.long	.LBE358
	.byte	0x1
	.word	0x7ea
	.uleb128 0x1c
	.long	0xfcd
	.uleb128 0x1c
	.long	0xfc1
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF175
	.byte	0x1
	.word	0x7fc
	.long	.LASF176
	.long	.LFB53
	.long	.LFE53
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x1196
	.uleb128 0x32
	.long	.LASF177
	.byte	0x1
	.word	0x7fe
	.long	0x25
	.long	.LLST35
	.uleb128 0x27
	.string	"m1"
	.byte	0x1
	.word	0x807
	.long	0x25
	.long	.LLST36
	.uleb128 0x27
	.string	"m2"
	.byte	0x1
	.word	0x808
	.long	0x25
	.long	.LLST37
	.uleb128 0x1e
	.string	"sum"
	.byte	0x1
	.word	0x817
	.long	0x37
	.uleb128 0x30
	.long	0x78c
	.long	.LBB361
	.long	.LBE361
	.byte	0x1
	.word	0x811
	.uleb128 0x36
	.long	0x78c
	.long	.LBB363
	.long	.LBE363
	.byte	0x1
	.word	0x813
	.long	0x112b
	.uleb128 0x1c
	.long	0xfcd
	.uleb128 0x1c
	.long	0xfc1
	.byte	0x0
	.uleb128 0x36
	.long	0x78c
	.long	.LBB365
	.long	.LBE365
	.byte	0x1
	.word	0x814
	.long	0x114a
	.uleb128 0x1c
	.long	0xfcd
	.uleb128 0x1c
	.long	0xfc1
	.byte	0x0
	.uleb128 0x36
	.long	0x7b1
	.long	.LBB367
	.long	.LBE367
	.byte	0x1
	.word	0x825
	.long	0x117a
	.uleb128 0x35
	.long	0x78c
	.long	.LBB369
	.long	.LBE369
	.byte	0x1
	.word	0x7ea
	.uleb128 0x1c
	.long	0xfcd
	.uleb128 0x1c
	.long	0xfc1
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.long	0x78c
	.long	.LBB371
	.long	.LBE371
	.byte	0x1
	.word	0x827
	.uleb128 0x1c
	.long	0xfcd
	.uleb128 0x1c
	.long	0xfc1
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF178
	.byte	0x1
	.word	0x851
	.long	.LASF179
	.long	.LFB54
	.long	.LFE54
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x11fd
	.uleb128 0x26
	.string	"val"
	.byte	0x1
	.word	0x851
	.long	0x37
	.long	.LLST39
	.uleb128 0x36
	.long	0x78c
	.long	.LBB373
	.long	.LBE373
	.byte	0x1
	.word	0x853
	.long	0x11e1
	.uleb128 0x1c
	.long	0xfcd
	.uleb128 0x1c
	.long	0xfc1
	.byte	0x0
	.uleb128 0x35
	.long	0x78c
	.long	.LBB375
	.long	.LBE375
	.byte	0x1
	.word	0x854
	.uleb128 0x1c
	.long	0xfcd
	.uleb128 0x1c
	.long	0xfc1
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF180
	.byte	0x1
	.word	0x856
	.long	.LASF181
	.long	.LFB55
	.long	.LFE55
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x1238
	.uleb128 0x26
	.string	"val"
	.byte	0x1
	.word	0x856
	.long	0x37
	.long	.LLST41
	.uleb128 0x27
	.string	"i"
	.byte	0x1
	.word	0x858
	.long	0x37
	.long	.LLST42
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF182
	.byte	0x1
	.word	0x85a
	.long	.LASF183
	.long	.LFB56
	.long	.LFE56
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x1313
	.uleb128 0x2f
	.long	.LBB379
	.long	.LBE379
	.long	0x12a9
	.uleb128 0x27
	.string	"thr"
	.byte	0x1
	.word	0x85f
	.long	0x37
	.long	.LLST44
	.uleb128 0x27
	.string	"rot"
	.byte	0x1
	.word	0x860
	.long	0x37
	.long	.LLST45
	.uleb128 0x1e
	.string	"chk"
	.byte	0x1
	.word	0x86c
	.long	0x37
	.uleb128 0x35
	.long	0x78c
	.long	.LBB380
	.long	.LBE380
	.byte	0x1
	.word	0x86e
	.uleb128 0x1c
	.long	0xfcd
	.uleb128 0x1c
	.long	0xfc1
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB382
	.long	.LBE382
	.long	0x12ee
	.uleb128 0x27
	.string	"fwd"
	.byte	0x1
	.word	0x870
	.long	0x37
	.long	.LLST46
	.uleb128 0x1e
	.string	"chk"
	.byte	0x1
	.word	0x876
	.long	0x37
	.uleb128 0x35
	.long	0x78c
	.long	.LBB383
	.long	.LBE383
	.byte	0x1
	.word	0x878
	.uleb128 0x1c
	.long	0xfcd
	.uleb128 0x1c
	.long	0xfc1
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.long	.LASF184
	.byte	0x1
	.word	0x85d
	.long	0xbb
	.byte	0x5
	.byte	0x3
	.long	_ZZ24setupPulsesTracerCtp1009vE5phase
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x87b
	.long	0x3867
	.byte	0x5
	.byte	0x3
	.long	_ZZ24setupPulsesTracerCtp1009vE3__c
	.byte	0x0
	.uleb128 0x37
	.byte	0x1
	.long	.LASF329
	.byte	0x1
	.word	0x7b8
	.long	.LASF330
	.long	.LFB48
	.long	.LFE48
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.uleb128 0x25
	.byte	0x1
	.long	.LASF185
	.byte	0x1
	.word	0x6d7
	.long	.LASF186
	.long	0x49
	.long	.LFB46
	.long	.LFE46
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x1387
	.uleb128 0x26
	.string	"i"
	.byte	0x1
	.word	0x6d7
	.long	0x37
	.long	.LLST49
	.uleb128 0x27
	.string	"v"
	.byte	0x1
	.word	0x6d9
	.long	0x49
	.long	.LLST50
	.uleb128 0x35
	.long	0x7ff
	.long	.LBB386
	.long	.LBE386
	.byte	0x1
	.word	0x6de
	.uleb128 0x1c
	.long	0x81b
	.uleb128 0x29
	.long	0x811
	.long	.LLST51
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF187
	.byte	0x1
	.word	0x6e8
	.long	.LASF188
	.long	.LFB47
	.long	.LFE47
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x166c
	.uleb128 0x38
	.long	.LASF189
	.byte	0x1
	.word	0x6e8
	.long	0x166c
	.long	.LLST53
	.uleb128 0x31
	.long	.LASF190
	.byte	0x1
	.word	0x6ed
	.long	0x1fa
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.uleb128 0x2f
	.long	.LBB389
	.long	.LBE389
	.long	0x143c
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.word	0x6ef
	.long	0x37
	.uleb128 0x2b
	.long	.LBB390
	.long	.LBE390
	.uleb128 0x27
	.string	"v"
	.byte	0x1
	.word	0x6f3
	.long	0x49
	.long	.LLST54
	.uleb128 0x1e
	.string	"x"
	.byte	0x1
	.word	0x6fb
	.long	0x6d
	.uleb128 0x1e
	.string	"td"
	.byte	0x1
	.word	0x700
	.long	0x1672
	.uleb128 0x27
	.string	"vv"
	.byte	0x1
	.word	0x70d
	.long	0x6d
	.long	.LLST55
	.uleb128 0x2b
	.long	.LBB391
	.long	.LBE391
	.uleb128 0x24
	.long	.LASF191
	.byte	0x1
	.word	0x702
	.long	0x37
	.uleb128 0x32
	.long	.LASF192
	.byte	0x1
	.word	0x703
	.long	0x49
	.long	.LLST56
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB392
	.long	.LBE392
	.long	0x1468
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.word	0x71f
	.long	0x37
	.uleb128 0x2b
	.long	.LBB393
	.long	.LBE393
	.uleb128 0x1e
	.string	"v"
	.byte	0x1
	.word	0x720
	.long	0x49
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB394
	.long	.LBE394
	.long	0x1480
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.word	0x725
	.long	0x37
	.byte	0x0
	.uleb128 0x39
	.long	.Ldebug_ranges0+0x0
	.long	0x159c
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.word	0x72b
	.long	0x37
	.uleb128 0x3a
	.long	.Ldebug_ranges0+0x18
	.uleb128 0x1e
	.string	"md"
	.byte	0x1
	.word	0x72c
	.long	0x1678
	.uleb128 0x27
	.string	"v"
	.byte	0x1
	.word	0x73b
	.long	0x49
	.long	.LLST57
	.uleb128 0x1e
	.string	"dv"
	.byte	0x1
	.word	0x78c
	.long	0x6d
	.uleb128 0x36
	.long	0x826
	.long	.LBB397
	.long	.LBE397
	.byte	0x1
	.word	0x785
	.long	0x14d6
	.uleb128 0x1c
	.long	0x838
	.byte	0x0
	.uleb128 0x2b
	.long	.LBB399
	.long	.LBE399
	.uleb128 0x32
	.long	.LASF193
	.byte	0x1
	.word	0x757
	.long	0x49
	.long	.LLST58
	.uleb128 0x2b
	.long	.LBB400
	.long	.LBE400
	.uleb128 0x32
	.long	.LASF194
	.byte	0x1
	.word	0x759
	.long	0x37
	.long	.LLST59
	.uleb128 0x2b
	.long	.LBB401
	.long	.LBE401
	.uleb128 0x24
	.long	.LASF195
	.byte	0x1
	.word	0x75b
	.long	0x37
	.uleb128 0x27
	.string	"dlt"
	.byte	0x1
	.word	0x75c
	.long	0x25
	.long	.LLST60
	.uleb128 0x2f
	.long	.LBB402
	.long	.LBE402
	.long	0x1557
	.uleb128 0x24
	.long	.LASF143
	.byte	0x1
	.word	0x75b
	.long	0x5b
	.uleb128 0x32
	.long	.LASF144
	.byte	0x1
	.word	0x75b
	.long	0x37
	.long	.LLST61
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB403
	.long	.LBE403
	.long	0x1581
	.uleb128 0x24
	.long	.LASF143
	.byte	0x1
	.word	0x75c
	.long	0x5b
	.uleb128 0x32
	.long	.LASF144
	.byte	0x1
	.word	0x75c
	.long	0x37
	.long	.LLST62
	.byte	0x0
	.uleb128 0x35
	.long	0x826
	.long	.LBB404
	.long	.LBE404
	.byte	0x1
	.word	0x75d
	.uleb128 0x1c
	.long	0x838
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.long	0x86a
	.long	.LBB407
	.long	.LBE407
	.byte	0x1
	.word	0x792
	.long	0x15cf
	.uleb128 0x2b
	.long	.LBB410
	.long	.LBE410
	.uleb128 0x2c
	.long	0x879
	.uleb128 0x2b
	.long	.LBB411
	.long	.LBE411
	.uleb128 0x2c
	.long	0x884
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB412
	.long	.LBE412
	.long	0x15ff
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.word	0x793
	.long	0x37
	.uleb128 0x2b
	.long	.LBB413
	.long	.LBE413
	.uleb128 0x27
	.string	"v"
	.byte	0x1
	.word	0x79a
	.long	0x49
	.long	.LLST63
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.long	.LASF196
	.byte	0x1
	.word	0x6ea
	.long	0x380d
	.byte	0x5
	.byte	0x3
	.long	_ZZ6perOutPiE4anas
	.uleb128 0x31
	.long	.LASF197
	.byte	0x1
	.word	0x6eb
	.long	0x381d
	.byte	0x5
	.byte	0x3
	.long	_ZZ6perOutPiE5chans
	.uleb128 0x31
	.long	.LASF164
	.byte	0x1
	.word	0x72e
	.long	0x382d
	.byte	0x5
	.byte	0x3
	.long	_ZZ6perOutPiE5timer
	.uleb128 0x33
	.string	"act"
	.byte	0x1
	.word	0x72f
	.long	0x380d
	.byte	0x5
	.byte	0x3
	.long	_ZZ6perOutPiE3act
	.uleb128 0x31
	.long	.LASF198
	.byte	0x1
	.word	0x755
	.long	0x384d
	.byte	0x5
	.byte	0x3
	.long	_ZZ6perOutPiE5dlt_t
	.uleb128 0x31
	.long	.LASF199
	.byte	0x1
	.word	0x756
	.long	0x3852
	.byte	0x5
	.byte	0x3
	.long	_ZZ6perOutPiE5tmr_t
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.long	0x49
	.uleb128 0x8
	.byte	0x2
	.long	0x1c6
	.uleb128 0x23
	.long	0x167d
	.uleb128 0x3b
	.byte	0x2
	.long	0x46f
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF200
	.byte	0x1
	.word	0x1dc
	.long	.LASF201
	.long	.LFB20
	.long	.LFE20
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x1705
	.uleb128 0x32
	.long	.LASF202
	.byte	0x1
	.word	0x1de
	.long	0x37
	.long	.LLST65
	.uleb128 0x32
	.long	.LASF203
	.byte	0x1
	.word	0x1df
	.long	0x37
	.long	.LLST66
	.uleb128 0x27
	.string	"sel"
	.byte	0x1
	.word	0x1e0
	.long	0x37
	.long	.LLST67
	.uleb128 0x1e
	.string	"md"
	.byte	0x1
	.word	0x1e3
	.long	0x1705
	.uleb128 0x2b
	.long	.LBB416
	.long	.LBE416
	.uleb128 0x33
	.string	"i"
	.byte	0x1
	.word	0x1e5
	.long	0x37
	.byte	0x1
	.byte	0x66
	.uleb128 0x3a
	.long	.Ldebug_ranges0+0x30
	.uleb128 0x31
	.long	.LASF82
	.byte	0x1
	.word	0x1e7
	.long	0x37
	.byte	0x1
	.byte	0x64
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.long	0x46f
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF204
	.byte	0x1
	.word	0x5c5
	.long	.LASF205
	.long	.LFB42
	.long	.LFE42
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x17e6
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x5c5
	.long	0x37
	.long	.LLST69
	.uleb128 0x32
	.long	.LASF206
	.byte	0x1
	.word	0x5de
	.long	0x5b
	.long	.LLST70
	.uleb128 0x1e
	.string	"x"
	.byte	0x1
	.word	0x5df
	.long	0x37
	.uleb128 0x1e
	.string	"y"
	.byte	0x1
	.word	0x5e0
	.long	0x37
	.uleb128 0x2f
	.long	.LBB420
	.long	.LBE420
	.long	0x1773
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.word	0x5e4
	.long	0x37
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB421
	.long	.LBE421
	.long	0x178b
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.word	0x5e8
	.long	0x37
	.byte	0x0
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x5c7
	.long	0x37a1
	.byte	0x5
	.byte	0x3
	.long	_ZZ17menuProcStatistichE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x5d3
	.long	0x37a6
	.byte	0x5
	.byte	0x3
	.long	_ZZ17menuProcStatistichE3__c_0
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x5d5
	.long	0x37ab
	.byte	0x5
	.byte	0x3
	.long	_ZZ17menuProcStatistichE3__c_1
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x5d8
	.long	0x37b0
	.byte	0x5
	.byte	0x3
	.long	_ZZ17menuProcStatistichE3__c_2
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x5da
	.long	0x37b5
	.byte	0x5
	.byte	0x3
	.long	_ZZ17menuProcStatistichE3__c_3
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF207
	.byte	0x1
	.word	0x5f5
	.long	.LASF208
	.long	.LFB43
	.long	.LFE43
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x1987
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x5f5
	.long	0x37
	.long	.LLST72
	.uleb128 0x1e
	.string	"x"
	.byte	0x1
	.word	0x64e
	.long	0x37
	.uleb128 0x30
	.long	0x773
	.long	.LBB423
	.long	.LBE423
	.byte	0x1
	.word	0x61f
	.uleb128 0x2f
	.long	.LBB425
	.long	.LBE425
	.long	0x184a
	.uleb128 0x27
	.string	"att"
	.byte	0x1
	.word	0x65b
	.long	0x37
	.long	.LLST73
	.byte	0x0
	.uleb128 0x39
	.long	.Ldebug_ranges0+0x48
	.long	0x1896
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.word	0x661
	.long	0x37
	.uleb128 0x2b
	.long	.LBB427
	.long	.LBE427
	.uleb128 0x27
	.string	"xm"
	.byte	0x1
	.word	0x667
	.long	0x37
	.long	.LLST74
	.uleb128 0x27
	.string	"ym"
	.byte	0x1
	.word	0x667
	.long	0x37
	.long	.LLST75
	.uleb128 0x27
	.string	"val"
	.byte	0x1
	.word	0x669
	.long	0x25
	.long	.LLST76
	.byte	0x0
	.byte	0x0
	.uleb128 0x39
	.long	.Ldebug_ranges0+0x60
	.long	0x18e6
	.uleb128 0x27
	.string	"i"
	.byte	0x1
	.word	0x684
	.long	0x37
	.long	.LLST77
	.uleb128 0x3a
	.long	.Ldebug_ranges0+0x78
	.uleb128 0x27
	.string	"x0"
	.byte	0x1
	.word	0x686
	.long	0x37
	.long	.LLST78
	.uleb128 0x27
	.string	"y0"
	.byte	0x1
	.word	0x686
	.long	0x37
	.long	.LLST79
	.uleb128 0x3a
	.long	.Ldebug_ranges0+0x90
	.uleb128 0x27
	.string	"l"
	.byte	0x1
	.word	0x695
	.long	0x25
	.long	.LLST80
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x33
	.string	"sub"
	.byte	0x1
	.word	0x5fa
	.long	0x37
	.byte	0x5
	.byte	0x3
	.long	_ZZ9menuProc0hE3sub
	.uleb128 0x31
	.long	.LASF209
	.byte	0x1
	.word	0x5fb
	.long	0x37ba
	.byte	0x5
	.byte	0x3
	.long	_ZZ9menuProc0hE13s_lastPopMenu
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x64f
	.long	0x37ca
	.byte	0x5
	.byte	0x3
	.long	_ZZ9menuProc0hE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x650
	.long	0x37df
	.byte	0x5
	.byte	0x3
	.long	_ZZ9menuProc0hE3__c_0
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x651
	.long	0x37e4
	.byte	0x5
	.byte	0x3
	.long	_ZZ9menuProc0hE3__c_1
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x655
	.long	0x37e9
	.byte	0x5
	.byte	0x3
	.long	_ZZ9menuProc0hE3__c_2
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x65e
	.long	0x37ee
	.byte	0x5
	.byte	0x3
	.long	_ZZ9menuProc0hE3__c_3
	.uleb128 0x33
	.string	"x"
	.byte	0x1
	.word	0x665
	.long	0x3803
	.byte	0x5
	.byte	0x3
	.long	_ZZ9menuProc0hE1x
	.uleb128 0x31
	.long	.LASF210
	.byte	0x1
	.word	0x666
	.long	0x3808
	.byte	0x5
	.byte	0x3
	.long	_ZZ9menuProc0hE4vert
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF211
	.byte	0x1
	.word	0x5a8
	.long	.LASF212
	.long	.LFB41
	.long	.LFE41
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x1a1e
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x5a8
	.long	0x37
	.long	.LLST82
	.uleb128 0x30
	.long	0x773
	.long	.LBB436
	.long	.LBE436
	.byte	0x1
	.word	0x5b1
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x5aa
	.long	0x3788
	.byte	0x5
	.byte	0x3
	.long	_ZZ18menuProcStatistic2hE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x5bb
	.long	0x378d
	.byte	0x5
	.byte	0x3
	.long	_ZZ18menuProcStatistic2hE3__c_0
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x5bd
	.long	0x3792
	.byte	0x5
	.byte	0x3
	.long	_ZZ18menuProcStatistic2hE3__c_1
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x5bf
	.long	0x3797
	.byte	0x5
	.byte	0x3
	.long	_ZZ18menuProcStatistic2hE3__c_2
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x5c1
	.long	0x379c
	.byte	0x5
	.byte	0x3
	.long	_ZZ18menuProcStatistic2hE3__c_3
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF213
	.byte	0x1
	.word	0x2d6
	.long	.LASF214
	.long	.LFB25
	.long	.LFE25
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x1b57
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x2d6
	.long	0x37
	.long	.LLST84
	.uleb128 0x38
	.long	.LASF215
	.byte	0x1
	.word	0x2d6
	.long	0x37
	.long	.LLST85
	.uleb128 0x38
	.long	.LASF216
	.byte	0x1
	.word	0x2d6
	.long	0xbb
	.long	.LLST86
	.uleb128 0x26
	.string	"x"
	.byte	0x1
	.word	0x2d6
	.long	0x37
	.long	.LLST87
	.uleb128 0x26
	.string	"y"
	.byte	0x1
	.word	0x2d6
	.long	0x37
	.long	.LLST88
	.uleb128 0x26
	.string	"chn"
	.byte	0x1
	.word	0x2d6
	.long	0x37
	.long	.LLST89
	.uleb128 0x32
	.long	.LASF217
	.byte	0x1
	.word	0x2d8
	.long	0x37
	.long	.LLST90
	.uleb128 0x36
	.long	0x8df
	.long	.LBB439
	.long	.LBE439
	.byte	0x1
	.word	0x2dd
	.long	0x1aca
	.uleb128 0x1c
	.long	0x907
	.uleb128 0x1c
	.long	0x8fd
	.uleb128 0x1c
	.long	0x8f1
	.byte	0x0
	.uleb128 0x36
	.long	0x916
	.long	.LBB441
	.long	.LBE441
	.byte	0x1
	.word	0x2e1
	.long	0x1aee
	.uleb128 0x1c
	.long	0x93e
	.uleb128 0x1c
	.long	0x934
	.uleb128 0x1c
	.long	0x928
	.byte	0x0
	.uleb128 0x36
	.long	0x94b
	.long	.LBB443
	.long	.LBE443
	.byte	0x1
	.word	0x2e5
	.long	0x1b12
	.uleb128 0x1c
	.long	0x973
	.uleb128 0x1c
	.long	0x969
	.uleb128 0x1c
	.long	0x95d
	.byte	0x0
	.uleb128 0x36
	.long	0x8df
	.long	.LBB445
	.long	.LBE445
	.byte	0x1
	.word	0x2e9
	.long	0x1b36
	.uleb128 0x1c
	.long	0x907
	.uleb128 0x1c
	.long	0x8fd
	.uleb128 0x1c
	.long	0x8f1
	.byte	0x0
	.uleb128 0x35
	.long	0x916
	.long	.LBB447
	.long	.LBE447
	.byte	0x1
	.word	0x2ed
	.uleb128 0x1c
	.long	0x93e
	.uleb128 0x1c
	.long	0x934
	.uleb128 0x1c
	.long	0x928
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
	.long	0x6ac
	.byte	0x49
	.long	.LFB15
	.long	.LFE15
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x1ca4
	.uleb128 0x3d
	.long	.LASF218
	.long	0x9bc
	.byte	0x1
	.long	.LLST92
	.uleb128 0x3e
	.long	.LASF137
	.byte	0x1
	.byte	0x49
	.long	0x37
	.long	.LLST93
	.uleb128 0x3e
	.long	.LASF219
	.byte	0x1
	.byte	0x49
	.long	0x37
	.long	.LLST94
	.uleb128 0x3e
	.long	.LASF220
	.byte	0x1
	.byte	0x49
	.long	0x6f0
	.long	.LLST95
	.uleb128 0x3e
	.long	.LASF221
	.byte	0x1
	.byte	0x49
	.long	0x37
	.long	.LLST96
	.uleb128 0x3e
	.long	.LASF222
	.byte	0x1
	.byte	0x49
	.long	0x6e4
	.long	.LLST97
	.uleb128 0x3e
	.long	.LASF223
	.byte	0x1
	.byte	0x49
	.long	0x37
	.long	.LLST98
	.uleb128 0x3e
	.long	.LASF224
	.byte	0x1
	.byte	0x49
	.long	0x37
	.long	.LLST99
	.uleb128 0x3f
	.long	.LASF225
	.byte	0x1
	.byte	0x67
	.long	0x37
	.long	.LLST100
	.uleb128 0x2f
	.long	.LBB450
	.long	.LBE450
	.long	0x1c5b
	.uleb128 0x3f
	.long	.LASF226
	.byte	0x1
	.byte	0x4c
	.long	0x37
	.long	.LLST101
	.uleb128 0x2f
	.long	.LBB451
	.long	.LBE451
	.long	0x1c36
	.uleb128 0x3f
	.long	.LASF143
	.byte	0x1
	.byte	0x55
	.long	0x5b
	.long	.LLST102
	.uleb128 0x40
	.long	.LASF144
	.byte	0x1
	.byte	0x55
	.long	0x5b
	.byte	0x0
	.uleb128 0x2b
	.long	.LBB452
	.long	.LBE452
	.uleb128 0x3f
	.long	.LASF143
	.byte	0x1
	.byte	0x5a
	.long	0x5b
	.long	.LLST103
	.uleb128 0x40
	.long	.LASF144
	.byte	0x1
	.byte	0x5a
	.long	0x5b
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB453
	.long	.LBE453
	.long	0x1c7f
	.uleb128 0x40
	.long	.LASF143
	.byte	0x1
	.byte	0x67
	.long	0x5b
	.uleb128 0x40
	.long	.LASF144
	.byte	0x1
	.byte	0x67
	.long	0x37
	.byte	0x0
	.uleb128 0x41
	.long	0x773
	.long	.LBB454
	.long	.LBE454
	.byte	0x1
	.byte	0x76
	.uleb128 0x42
	.long	0x9a7
	.long	.LBB456
	.long	.LBE456
	.byte	0x1
	.byte	0x77
	.uleb128 0x1c
	.long	0x9b1
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF227
	.byte	0x1
	.word	0x4bc
	.long	.LASF228
	.long	.LFB36
	.long	.LFE36
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x1dee
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x4bc
	.long	0x37
	.long	.LLST105
	.uleb128 0x27
	.string	"sub"
	.byte	0x1
	.word	0x4c2
	.long	0x25
	.long	.LLST106
	.uleb128 0x32
	.long	.LASF229
	.byte	0x1
	.word	0x4c3
	.long	0x37
	.long	.LLST107
	.uleb128 0x1e
	.string	"y"
	.byte	0x1
	.word	0x4c4
	.long	0x37
	.uleb128 0x32
	.long	.LASF216
	.byte	0x1
	.word	0x4c5
	.long	0xbb
	.long	.LLST108
	.uleb128 0x39
	.long	.Ldebug_ranges0+0xa8
	.long	0x1d33
	.uleb128 0x27
	.string	"i"
	.byte	0x1
	.word	0x4c8
	.long	0x37
	.long	.LLST109
	.uleb128 0x3a
	.long	.Ldebug_ranges0+0xc0
	.uleb128 0x1e
	.string	"td"
	.byte	0x1
	.word	0x4ca
	.long	0x1672
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB463
	.long	.LBE463
	.long	0x1d5f
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.word	0x4e4
	.long	0x37
	.uleb128 0x2b
	.long	.LBB464
	.long	.LBE464
	.uleb128 0x1e
	.string	"x"
	.byte	0x1
	.word	0x4e6
	.long	0x37
	.byte	0x0
	.byte	0x0
	.uleb128 0x30
	.long	0x773
	.long	.LBB465
	.long	.LBE465
	.byte	0x1
	.word	0x4ee
	.uleb128 0x31
	.long	.LASF230
	.byte	0x1
	.word	0x4be
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcTrainerhE7mstate2
	.uleb128 0x31
	.long	.LASF231
	.byte	0x1
	.word	0x4c0
	.long	0x371d
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcTrainerhE10mstate_tab
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x4bf
	.long	0x3722
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcTrainerhE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x4c7
	.long	0x3727
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcTrainerhE3__c_0
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x4ce
	.long	0x372c
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcTrainerhE3__c_1
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x4d8
	.long	0x3741
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcTrainerhE3__c_2
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x4e3
	.long	0x3746
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcTrainerhE3__c_3
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF232
	.byte	0x1
	.word	0x374
	.long	.LASF233
	.long	.LFB30
	.long	.LFE30
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x20e1
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x374
	.long	0x37
	.long	.LLST111
	.uleb128 0x1e
	.string	"x"
	.byte	0x1
	.word	0x377
	.long	0x37
	.uleb128 0x27
	.string	"sub"
	.byte	0x1
	.word	0x37b
	.long	0x25
	.long	.LLST112
	.uleb128 0x32
	.long	.LASF229
	.byte	0x1
	.word	0x37d
	.long	0x37
	.long	.LLST113
	.uleb128 0x2f
	.long	.LBB468
	.long	.LBE468
	.long	0x1ed4
	.uleb128 0x27
	.string	"v"
	.byte	0x1
	.word	0x39d
	.long	0x57d
	.long	.LLST114
	.uleb128 0x36
	.long	0x9c1
	.long	.LBB469
	.long	.LBE469
	.byte	0x1
	.word	0x39d
	.long	0x1ea9
	.uleb128 0x1c
	.long	0xd08
	.uleb128 0x2a
	.long	0x9dd
	.long	.LLST115
	.uleb128 0x2b
	.long	.LBB472
	.long	.LBE472
	.uleb128 0x2c
	.long	0x9ea
	.uleb128 0x2b
	.long	.LBB473
	.long	.LBE473
	.uleb128 0x2c
	.long	0x9f6
	.uleb128 0x2a
	.long	0xa02
	.long	.LLST116
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
	.long	0xa11
	.long	.LBB474
	.long	.LBE474
	.byte	0x1
	.word	0x39f
	.uleb128 0x1c
	.long	0xd54
	.uleb128 0x2b
	.long	.LBB477
	.long	.LBE477
	.uleb128 0x2c
	.long	0xa30
	.uleb128 0x2c
	.long	0xa3c
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.long	0xa4a
	.long	.LBB478
	.long	.LBE478
	.byte	0x1
	.word	0x3a8
	.long	0x1ef8
	.uleb128 0x1c
	.long	0xa72
	.uleb128 0x1c
	.long	0xa68
	.uleb128 0x1c
	.long	0xa5c
	.byte	0x0
	.uleb128 0x36
	.long	0xa4a
	.long	.LBB480
	.long	.LBE480
	.byte	0x1
	.word	0x3ab
	.long	0x1f1c
	.uleb128 0x1c
	.long	0xa72
	.uleb128 0x1c
	.long	0xa68
	.uleb128 0x1c
	.long	0xa5c
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB482
	.long	.LBE482
	.long	0x1f3a
	.uleb128 0x27
	.string	"min"
	.byte	0x1
	.word	0x3b4
	.long	0x25
	.long	.LLST117
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB483
	.long	.LBE483
	.long	0x1f54
	.uleb128 0x1e
	.string	"sec"
	.byte	0x1
	.word	0x3bb
	.long	0x25
	.byte	0x0
	.uleb128 0x36
	.long	0xa7f
	.long	.LBB484
	.long	.LBE484
	.byte	0x1
	.word	0x3c8
	.long	0x1f78
	.uleb128 0x1c
	.long	0xaa7
	.uleb128 0x1c
	.long	0xa9d
	.uleb128 0x1c
	.long	0xa91
	.byte	0x0
	.uleb128 0x36
	.long	0xa4a
	.long	.LBB486
	.long	.LBE486
	.byte	0x1
	.word	0x3cb
	.long	0x1f9c
	.uleb128 0x1c
	.long	0xa72
	.uleb128 0x1c
	.long	0xa68
	.uleb128 0x1c
	.long	0xa5c
	.byte	0x0
	.uleb128 0x36
	.long	0xab4
	.long	.LBB488
	.long	.LBE488
	.byte	0x1
	.word	0x3ce
	.long	0x1fc0
	.uleb128 0x1c
	.long	0xadc
	.uleb128 0x1c
	.long	0xad2
	.uleb128 0x1c
	.long	0xac6
	.byte	0x0
	.uleb128 0x31
	.long	.LASF230
	.byte	0x1
	.word	0x376
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcModelhE7mstate2
	.uleb128 0x31
	.long	.LASF231
	.byte	0x1
	.word	0x379
	.long	0x3631
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcModelhE10mstate_tab
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x377
	.long	0x3636
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcModelhE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x37f
	.long	0x363b
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcModelhE3__c_0
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x382
	.long	0x3640
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcModelhE3__c_1
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x383
	.long	0x3655
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcModelhE3__c_2
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x386
	.long	0x366a
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcModelhE3__c_3
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x388
	.long	0x366f
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcModelhE3__c_4
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x38b
	.long	0x3684
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcModelhE3__c_5
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x38d
	.long	0x3689
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcModelhE3__c_6
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x38e
	.long	0x368e
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcModelhE3__c_7
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x390
	.long	0x3693
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcModelhE3__c_8
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x391
	.long	0x3698
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcModelhE3__c_9
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x393
	.long	0x369d
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcModelhE3__c_10
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x396
	.long	0x36a2
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcModelhE3__c_11
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x397
	.long	0x36a7
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcModelhE3__c_12
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF234
	.byte	0x1
	.word	0x33f
	.long	.LASF235
	.long	.LFB27
	.long	.LFE27
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x219e
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x33f
	.long	0x37
	.long	.LLST119
	.uleb128 0x27
	.string	"sub"
	.byte	0x1
	.word	0x345
	.long	0x25
	.long	.LLST120
	.uleb128 0x32
	.long	.LASF236
	.byte	0x1
	.word	0x346
	.long	0x25
	.long	.LLST121
	.uleb128 0x39
	.long	.Ldebug_ranges0+0xd8
	.long	0x2155
	.uleb128 0x27
	.string	"i"
	.byte	0x1
	.word	0x353
	.long	0x37
	.long	.LLST122
	.uleb128 0x3a
	.long	.Ldebug_ranges0+0xf0
	.uleb128 0x1e
	.string	"y"
	.byte	0x1
	.word	0x355
	.long	0x37
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.long	.LASF230
	.byte	0x1
	.word	0x341
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcExpoAllhE7mstate2
	.uleb128 0x31
	.long	.LASF231
	.byte	0x1
	.word	0x343
	.long	0x3602
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcExpoAllhE10mstate_tab
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x342
	.long	0x3617
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcExpoAllhE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x352
	.long	0x361c
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcExpoAllhE3__c_0
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF237
	.byte	0x1
	.word	0x126
	.long	.LASF238
	.long	.LFB18
	.long	.LFE18
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x2378
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x126
	.long	0x37
	.long	.LLST124
	.uleb128 0x27
	.string	"sub"
	.byte	0x1
	.word	0x12e
	.long	0x25
	.long	.LLST125
	.uleb128 0x32
	.long	.LASF229
	.byte	0x1
	.word	0x12f
	.long	0x37
	.long	.LLST126
	.uleb128 0x2f
	.long	.LBB496
	.long	.LBE496
	.long	0x2211
	.uleb128 0x27
	.string	"v"
	.byte	0x1
	.word	0x13f
	.long	0x49
	.long	.LLST127
	.uleb128 0x1e
	.string	"ld"
	.byte	0x1
	.word	0x140
	.long	0x2378
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB497
	.long	.LBE497
	.long	0x22f9
	.uleb128 0x33
	.string	"i"
	.byte	0x1
	.word	0x150
	.long	0x37
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.uleb128 0x2b
	.long	.LBB498
	.long	.LBE498
	.uleb128 0x1e
	.string	"y"
	.byte	0x1
	.word	0x151
	.long	0x37
	.uleb128 0x27
	.string	"k"
	.byte	0x1
	.word	0x152
	.long	0x37
	.long	.LLST128
	.uleb128 0x1e
	.string	"ld"
	.byte	0x1
	.word	0x154
	.long	0x2378
	.uleb128 0x3a
	.long	.Ldebug_ranges0+0x108
	.uleb128 0x27
	.string	"j"
	.byte	0x1
	.word	0x155
	.long	0x37
	.long	.LLST129
	.uleb128 0x3a
	.long	.Ldebug_ranges0+0x120
	.uleb128 0x32
	.long	.LASF226
	.byte	0x1
	.word	0x156
	.long	0x37
	.long	.LLST130
	.uleb128 0x27
	.string	"v"
	.byte	0x1
	.word	0x158
	.long	0x49
	.long	.LLST131
	.uleb128 0x36
	.long	0xae9
	.long	.LBB501
	.long	.LBE501
	.byte	0x1
	.word	0x165
	.long	0x22b1
	.uleb128 0x1c
	.long	0xb11
	.uleb128 0x1c
	.long	0xb07
	.uleb128 0x1c
	.long	0xafb
	.byte	0x0
	.uleb128 0x36
	.long	0xb1e
	.long	.LBB502
	.long	.LBE502
	.byte	0x1
	.word	0x16c
	.long	0x22d5
	.uleb128 0x1c
	.long	0xb46
	.uleb128 0x1c
	.long	0xb3c
	.uleb128 0x1c
	.long	0xb30
	.byte	0x0
	.uleb128 0x35
	.long	0xb1e
	.long	.LBB503
	.long	.LBE503
	.byte	0x1
	.word	0x174
	.uleb128 0x1c
	.long	0xb46
	.uleb128 0x1c
	.long	0xb3c
	.uleb128 0x1c
	.long	0xb30
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.long	.LASF230
	.byte	0x1
	.word	0x128
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcLimitshE7mstate2
	.uleb128 0x31
	.long	.LASF239
	.byte	0x1
	.word	0x129
	.long	0x34bf
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcLimitshE5swVal
	.uleb128 0x31
	.long	.LASF231
	.byte	0x1
	.word	0x12b
	.long	0x34df
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcLimitshE10mstate_tab
	.uleb128 0x31
	.long	.LASF240
	.byte	0x1
	.word	0x130
	.long	0x37
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcLimitshE7s_pgOfs
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x12a
	.long	0x34e4
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcLimitshE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x14f
	.long	0x34f9
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcLimitshE3__c_0
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x179
	.long	0x34fe
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcLimitshE3__c_1
	.byte	0x0
	.uleb128 0x8
	.byte	0x2
	.long	0x3db
	.uleb128 0x3c
	.long	0x67b
	.byte	0x45
	.long	.LFB14
	.long	.LFE14
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x23ed
	.uleb128 0x3d
	.long	.LASF218
	.long	0x9bc
	.byte	0x1
	.long	.LLST133
	.uleb128 0x3e
	.long	.LASF137
	.byte	0x1
	.byte	0x45
	.long	0x37
	.long	.LLST134
	.uleb128 0x3e
	.long	.LASF219
	.byte	0x1
	.byte	0x45
	.long	0x37
	.long	.LLST135
	.uleb128 0x3e
	.long	.LASF220
	.byte	0x1
	.byte	0x45
	.long	0x6f0
	.long	.LLST136
	.uleb128 0x3e
	.long	.LASF221
	.byte	0x1
	.byte	0x45
	.long	0x37
	.long	.LLST137
	.uleb128 0x3e
	.long	.LASF224
	.byte	0x1
	.byte	0x45
	.long	0x37
	.long	.LLST138
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF241
	.byte	0x1
	.word	0x517
	.long	.LASF242
	.long	.LFB38
	.long	.LFE38
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x254c
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x517
	.long	0x37
	.long	.LLST140
	.uleb128 0x27
	.string	"sub"
	.byte	0x1
	.word	0x51c
	.long	0x25
	.long	.LLST141
	.uleb128 0x1e
	.string	"y"
	.byte	0x1
	.word	0x51d
	.long	0x37
	.uleb128 0x36
	.long	0xb53
	.long	.LBB507
	.long	.LBE507
	.byte	0x1
	.word	0x520
	.long	0x2457
	.uleb128 0x1c
	.long	0xb7b
	.uleb128 0x1c
	.long	0xb71
	.uleb128 0x1c
	.long	0xb65
	.byte	0x0
	.uleb128 0x36
	.long	0xb88
	.long	.LBB509
	.long	.LBE509
	.byte	0x1
	.word	0x528
	.long	0x247b
	.uleb128 0x1c
	.long	0xbb0
	.uleb128 0x1c
	.long	0xba6
	.uleb128 0x1c
	.long	0xb9a
	.byte	0x0
	.uleb128 0x36
	.long	0xab4
	.long	.LBB511
	.long	.LBE511
	.byte	0x1
	.word	0x52f
	.long	0x249f
	.uleb128 0x1c
	.long	0xadc
	.uleb128 0x1c
	.long	0xad2
	.uleb128 0x1c
	.long	0xac6
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB513
	.long	.LBE513
	.long	0x24bb
	.uleb128 0x27
	.string	"i"
	.byte	0x1
	.word	0x537
	.long	0x37
	.long	.LLST142
	.byte	0x0
	.uleb128 0x36
	.long	0xbbd
	.long	.LBB514
	.long	.LBE514
	.byte	0x1
	.word	0x53d
	.long	0x24df
	.uleb128 0x1c
	.long	0xbe5
	.uleb128 0x1c
	.long	0xbdb
	.uleb128 0x1c
	.long	0xbcf
	.byte	0x0
	.uleb128 0x31
	.long	.LASF230
	.byte	0x1
	.word	0x519
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcSetup0hE7mstate2
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x51a
	.long	0x376f
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcSetup0hE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x523
	.long	0x3774
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcSetup0hE3__c_0
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x52a
	.long	0x3779
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcSetup0hE3__c_1
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x531
	.long	0x377e
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcSetup0hE3__c_2
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x535
	.long	0x3783
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcSetup0hE3__c_3
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF243
	.byte	0x1
	.word	0x4f3
	.long	.LASF244
	.long	.LFB37
	.long	.LFE37
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x2667
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x4f3
	.long	0x37
	.long	.LLST144
	.uleb128 0x27
	.string	"sub"
	.byte	0x1
	.word	0x4f8
	.long	0x25
	.long	.LLST145
	.uleb128 0x39
	.long	.Ldebug_ranges0+0x138
	.long	0x260c
	.uleb128 0x27
	.string	"i"
	.byte	0x1
	.word	0x4f9
	.long	0x37
	.long	.LLST146
	.uleb128 0x3a
	.long	.Ldebug_ranges0+0x150
	.uleb128 0x1e
	.string	"y"
	.byte	0x1
	.word	0x4fa
	.long	0x37
	.uleb128 0x32
	.long	.LASF226
	.byte	0x1
	.word	0x4fb
	.long	0x37
	.long	.LLST147
	.uleb128 0x3a
	.long	.Ldebug_ranges0+0x168
	.uleb128 0x32
	.long	.LASF245
	.byte	0x1
	.word	0x50e
	.long	0x37
	.long	.LLST148
	.uleb128 0x27
	.string	"val"
	.byte	0x1
	.word	0x50f
	.long	0x37
	.long	.LLST149
	.uleb128 0x3a
	.long	.Ldebug_ranges0+0x180
	.uleb128 0x27
	.string	"bit"
	.byte	0x1
	.word	0x505
	.long	0x37
	.long	.LLST150
	.uleb128 0x27
	.string	"val"
	.byte	0x1
	.word	0x506
	.long	0xbb
	.long	.LLST151
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.long	.LASF230
	.byte	0x1
	.word	0x4f5
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcSetup1hE7mstate2
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x4f6
	.long	0x374b
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcSetup1hE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x4fc
	.long	0x3760
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcSetup1hE3__c_0
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x507
	.long	0x3765
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcSetup1hE3__c_1
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x507
	.long	0x376a
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcSetup1hE3__c_2
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF246
	.byte	0x1
	.word	0x4b0
	.long	.LASF247
	.long	.LFB35
	.long	.LFE35
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x26b8
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x4b0
	.long	0x37
	.long	.LLST153
	.uleb128 0x31
	.long	.LASF230
	.byte	0x1
	.word	0x4b2
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ16menuProcDiagVershE7mstate2
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x4b3
	.long	0x3718
	.byte	0x5
	.byte	0x3
	.long	_ZZ16menuProcDiagVershE3__c
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF248
	.byte	0x1
	.word	0x487
	.long	.LASF249
	.long	.LFB34
	.long	.LFE34
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x2805
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x487
	.long	0x37
	.long	.LLST155
	.uleb128 0x1e
	.string	"x"
	.byte	0x1
	.word	0x48d
	.long	0x37
	.uleb128 0x2f
	.long	.LBB527
	.long	.LBE527
	.long	0x2730
	.uleb128 0x27
	.string	"i"
	.byte	0x1
	.word	0x490
	.long	0x37
	.long	.LLST156
	.uleb128 0x2b
	.long	.LBB528
	.long	.LBE528
	.uleb128 0x27
	.string	"y"
	.byte	0x1
	.word	0x492
	.long	0x37
	.long	.LLST157
	.uleb128 0x27
	.string	"t"
	.byte	0x1
	.word	0x494
	.long	0xbb
	.long	.LLST158
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB529
	.long	.LBE529
	.long	0x276e
	.uleb128 0x27
	.string	"i"
	.byte	0x1
	.word	0x49a
	.long	0x37
	.long	.LLST159
	.uleb128 0x2b
	.long	.LBB530
	.long	.LBE530
	.uleb128 0x1e
	.string	"y"
	.byte	0x1
	.word	0x49c
	.long	0x37
	.uleb128 0x27
	.string	"t"
	.byte	0x1
	.word	0x49d
	.long	0xbb
	.long	.LLST160
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB531
	.long	.LBE531
	.long	0x27bc
	.uleb128 0x27
	.string	"i"
	.byte	0x1
	.word	0x4a5
	.long	0x37
	.long	.LLST161
	.uleb128 0x2b
	.long	.LBB532
	.long	.LBE532
	.uleb128 0x1e
	.string	"y"
	.byte	0x1
	.word	0x4a7
	.long	0x37
	.uleb128 0x27
	.string	"tm"
	.byte	0x1
	.word	0x4aa
	.long	0xbb
	.long	.LLST162
	.uleb128 0x27
	.string	"tp"
	.byte	0x1
	.word	0x4ab
	.long	0xbb
	.long	.LLST163
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.long	.LASF230
	.byte	0x1
	.word	0x489
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ16menuProcDiagKeyshE7mstate2
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x48a
	.long	0x3709
	.byte	0x5
	.byte	0x3
	.long	_ZZ16menuProcDiagKeyshE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x49e
	.long	0x370e
	.byte	0x5
	.byte	0x3
	.long	_ZZ16menuProcDiagKeyshE3__c_0
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x4a4
	.long	0x3713
	.byte	0x5
	.byte	0x3
	.long	_ZZ16menuProcDiagKeyshE3__c_1
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF250
	.byte	0x1
	.word	0x469
	.long	.LASF251
	.long	.LFB33
	.long	.LFE33
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x28ff
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x469
	.long	0x37
	.long	.LLST165
	.uleb128 0x27
	.string	"sub"
	.byte	0x1
	.word	0x46e
	.long	0x25
	.long	.LLST166
	.uleb128 0x2f
	.long	.LBB534
	.long	.LBE534
	.long	0x28a4
	.uleb128 0x27
	.string	"i"
	.byte	0x1
	.word	0x470
	.long	0x37
	.long	.LLST167
	.uleb128 0x2b
	.long	.LBB535
	.long	.LBE535
	.uleb128 0x1e
	.string	"y"
	.byte	0x1
	.word	0x472
	.long	0x37
	.uleb128 0x3a
	.long	.Ldebug_ranges0+0x198
	.uleb128 0x27
	.string	"v"
	.byte	0x1
	.word	0x478
	.long	0x49
	.long	.LLST168
	.uleb128 0x35
	.long	0x7ff
	.long	.LBB537
	.long	.LBE537
	.byte	0x1
	.word	0x479
	.uleb128 0x1c
	.long	0x81b
	.uleb128 0x29
	.long	0x811
	.long	.LLST169
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.long	0xbf2
	.long	.LBB540
	.long	.LBE540
	.byte	0x1
	.word	0x482
	.long	0x28c8
	.uleb128 0x1c
	.long	0xc1a
	.uleb128 0x1c
	.long	0xc10
	.uleb128 0x1c
	.long	0xc04
	.byte	0x0
	.uleb128 0x31
	.long	.LASF230
	.byte	0x1
	.word	0x46b
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcDiagAnahE7mstate2
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x46c
	.long	0x36ff
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcDiagAnahE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x473
	.long	0x3704
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcDiagAnahE3__c_0
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF252
	.byte	0x1
	.word	0x424
	.long	.LASF253
	.long	.LFB32
	.long	.LFE32
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x2ad0
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x424
	.long	0x37
	.long	.LLST171
	.uleb128 0x27
	.string	"sub"
	.byte	0x1
	.word	0x429
	.long	0x25
	.long	.LLST172
	.uleb128 0x2f
	.long	.LBB543
	.long	.LBE543
	.long	0x29f5
	.uleb128 0x27
	.string	"sum"
	.byte	0x1
	.word	0x44a
	.long	0x49
	.long	.LLST173
	.uleb128 0x2f
	.long	.LBB544
	.long	.LBE544
	.long	0x2970
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.word	0x433
	.long	0x37
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB545
	.long	.LBE545
	.long	0x2988
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.word	0x438
	.long	0x37
	.byte	0x0
	.uleb128 0x30
	.long	0x773
	.long	.LBB546
	.long	.LBE546
	.byte	0x1
	.word	0x439
	.uleb128 0x2f
	.long	.LBB548
	.long	.LBE548
	.long	0x29cc
	.uleb128 0x27
	.string	"i"
	.byte	0x1
	.word	0x43f
	.long	0x37
	.long	.LLST174
	.uleb128 0x2b
	.long	.LBB549
	.long	.LBE549
	.uleb128 0x27
	.string	"v"
	.byte	0x1
	.word	0x444
	.long	0x5b
	.long	.LLST175
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB550
	.long	.LBE550
	.long	0x29e4
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.word	0x44b
	.long	0x37
	.byte	0x0
	.uleb128 0x30
	.long	0x773
	.long	.LBB551
	.long	.LBE551
	.byte	0x1
	.word	0x44e
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB553
	.long	.LBE553
	.long	0x2a21
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.word	0x453
	.long	0x37
	.uleb128 0x2b
	.long	.LBB554
	.long	.LBE554
	.uleb128 0x1e
	.string	"y"
	.byte	0x1
	.word	0x455
	.long	0x37
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB555
	.long	.LBE555
	.long	0x2a51
	.uleb128 0x27
	.string	"i"
	.byte	0x1
	.word	0x459
	.long	0x37
	.long	.LLST176
	.uleb128 0x2b
	.long	.LBB556
	.long	.LBE556
	.uleb128 0x1e
	.string	"y"
	.byte	0x1
	.word	0x45b
	.long	0x37
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.long	.LASF230
	.byte	0x1
	.word	0x426
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ17menuProcDiagCalibhE7mstate2
	.uleb128 0x31
	.long	.LASF254
	.byte	0x1
	.word	0x42a
	.long	0x1fa
	.byte	0x5
	.byte	0x3
	.long	_ZZ17menuProcDiagCalibhE7midVals
	.uleb128 0x31
	.long	.LASF255
	.byte	0x1
	.word	0x42b
	.long	0x1fa
	.byte	0x5
	.byte	0x3
	.long	_ZZ17menuProcDiagCalibhE7lowVals
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x427
	.long	0x36db
	.byte	0x5
	.byte	0x3
	.long	_ZZ17menuProcDiagCalibhE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x456
	.long	0x36f0
	.byte	0x5
	.byte	0x3
	.long	_ZZ17menuProcDiagCalibhE3__c_0
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x45c
	.long	0x36f5
	.byte	0x5
	.byte	0x3
	.long	_ZZ17menuProcDiagCalibhE3__c_1
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x462
	.long	0x36fa
	.byte	0x5
	.byte	0x3
	.long	_ZZ17menuProcDiagCalibhE3__c_2
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF256
	.byte	0x1
	.word	0x3da
	.long	.LASF257
	.long	.LFB31
	.long	.LFE31
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x2c21
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x3da
	.long	0x37
	.long	.LLST178
	.uleb128 0x24
	.long	.LASF258
	.byte	0x1
	.word	0x3e2
	.long	0x25
	.uleb128 0x1e
	.string	"sub"
	.byte	0x1
	.word	0x3e4
	.long	0x25
	.uleb128 0x30
	.long	0x773
	.long	.LBB558
	.long	.LBE558
	.byte	0x1
	.word	0x3ec
	.uleb128 0x30
	.long	0x773
	.long	.LBB560
	.long	.LBE560
	.byte	0x1
	.word	0x3f7
	.uleb128 0x30
	.long	0x773
	.long	.LBB562
	.long	.LBE562
	.byte	0x1
	.word	0x3fe
	.uleb128 0x30
	.long	0x773
	.long	.LBB564
	.long	.LBE564
	.byte	0x1
	.word	0x403
	.uleb128 0x30
	.long	0x773
	.long	.LBB566
	.long	.LBE566
	.byte	0x1
	.word	0x406
	.uleb128 0x2f
	.long	.LBB568
	.long	.LBE568
	.long	0x2ba2
	.uleb128 0x27
	.string	"i"
	.byte	0x1
	.word	0x417
	.long	0x37
	.long	.LLST179
	.uleb128 0x2b
	.long	.LBB569
	.long	.LBE569
	.uleb128 0x1e
	.string	"y"
	.byte	0x1
	.word	0x418
	.long	0x37
	.uleb128 0x27
	.string	"k"
	.byte	0x1
	.word	0x419
	.long	0x37
	.long	.LLST180
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.long	.LASF259
	.byte	0x1
	.word	0x3dc
	.long	0x37
	.byte	0x5
	.byte	0x3
	.long	_ZZ19menuProcModelSelecthE10s_editMode
	.uleb128 0x31
	.long	.LASF230
	.byte	0x1
	.word	0x3dd
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ19menuProcModelSelecthE7mstate2
	.uleb128 0x31
	.long	.LASF240
	.byte	0x1
	.word	0x3e5
	.long	0x37
	.byte	0x5
	.byte	0x3
	.long	_ZZ19menuProcModelSelecthE7s_pgOfs
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x3de
	.long	0x36ac
	.byte	0x5
	.byte	0x3
	.long	_ZZ19menuProcModelSelecthE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x3df
	.long	0x36b1
	.byte	0x5
	.byte	0x3
	.long	_ZZ19menuProcModelSelecthE3__c_0
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x3e1
	.long	0x36c6
	.byte	0x5
	.byte	0x3
	.long	_ZZ19menuProcModelSelecthE3__c_1
	.uleb128 0x33
	.string	"buf"
	.byte	0x1
	.word	0x41b
	.long	0x36cb
	.byte	0x5
	.byte	0x3
	.long	_ZZ19menuProcModelSelecthE3buf
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF260
	.byte	0x1
	.word	0x2f2
	.long	.LASF261
	.long	.LFB26
	.long	.LFE26
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x2d6d
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x2f2
	.long	0x37
	.long	.LLST182
	.uleb128 0x1e
	.string	"x"
	.byte	0x1
	.word	0x2f5
	.long	0x37
	.uleb128 0x27
	.string	"sub"
	.byte	0x1
	.word	0x2f8
	.long	0x25
	.long	.LLST183
	.uleb128 0x1e
	.string	"y"
	.byte	0x1
	.word	0x2fb
	.long	0x37
	.uleb128 0x32
	.long	.LASF262
	.byte	0x1
	.word	0x314
	.long	0x25
	.long	.LLST184
	.uleb128 0x32
	.long	.LASF263
	.byte	0x1
	.word	0x315
	.long	0x25
	.long	.LLST185
	.uleb128 0x32
	.long	.LASF264
	.byte	0x1
	.word	0x332
	.long	0x49
	.long	.LLST186
	.uleb128 0x32
	.long	.LASF265
	.byte	0x1
	.word	0x333
	.long	0x49
	.long	.LLST187
	.uleb128 0x27
	.string	"dy"
	.byte	0x1
	.word	0x33c
	.long	0x49
	.long	.LLST188
	.uleb128 0x2f
	.long	.LBB571
	.long	.LBE571
	.long	0x2cee
	.uleb128 0x1e
	.string	"xv"
	.byte	0x1
	.word	0x325
	.long	0x37
	.uleb128 0x2b
	.long	.LBB572
	.long	.LBE572
	.uleb128 0x1e
	.string	"yv"
	.byte	0x1
	.word	0x327
	.long	0x5b
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.long	.LASF230
	.byte	0x1
	.word	0x2f4
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcExpoOnehE7mstate2
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x2f5
	.long	0x35e4
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcExpoOnehE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x2fe
	.long	0x35e9
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcExpoOnehE3__c_0
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x302
	.long	0x35ee
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcExpoOnehE3__c_1
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x307
	.long	0x35f3
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcExpoOnehE3__c_2
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x30b
	.long	0x35f8
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcExpoOnehE3__c_3
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x30f
	.long	0x35fd
	.byte	0x5
	.byte	0x3
	.long	_ZZ15menuProcExpoOnehE3__c_4
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF266
	.byte	0x1
	.word	0x267
	.long	.LASF267
	.long	.LFB22
	.long	.LFE22
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x2e5a
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x267
	.long	0x37
	.long	.LLST190
	.uleb128 0x27
	.string	"sub"
	.byte	0x1
	.word	0x26c
	.long	0x25
	.long	.LLST191
	.uleb128 0x2f
	.long	.LBB574
	.long	.LBE574
	.long	0x2dd5
	.uleb128 0x27
	.string	"x"
	.byte	0x1
	.word	0x27d
	.long	0x49
	.long	.LLST192
	.uleb128 0x30
	.long	0x773
	.long	.LBB575
	.long	.LBE575
	.byte	0x1
	.word	0x283
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB577
	.long	.LBE577
	.long	0x2e11
	.uleb128 0x1e
	.string	"i"
	.byte	0x1
	.word	0x288
	.long	0x37
	.uleb128 0x2b
	.long	.LBB578
	.long	.LBE578
	.uleb128 0x1e
	.string	"y"
	.byte	0x1
	.word	0x28a
	.long	0x37
	.uleb128 0x32
	.long	.LASF226
	.byte	0x1
	.word	0x28b
	.long	0x37
	.long	.LLST193
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.long	.LASF230
	.byte	0x1
	.word	0x269
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ12menuProcTrimhE7mstate2
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x26a
	.long	0x35a5
	.byte	0x5
	.byte	0x3
	.long	_ZZ12menuProcTrimhE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x287
	.long	0x35ba
	.byte	0x5
	.byte	0x3
	.long	_ZZ12menuProcTrimhE3__c_0
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x290
	.long	0x35cf
	.byte	0x5
	.byte	0x3
	.long	_ZZ12menuProcTrimhE3__c_1
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF268
	.byte	0x1
	.word	0x208
	.long	.LASF269
	.long	.LFB21
	.long	.LFE21
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x3026
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x208
	.long	0x37
	.long	.LLST195
	.uleb128 0x27
	.string	"sub"
	.byte	0x1
	.word	0x20d
	.long	0x25
	.long	.LLST196
	.uleb128 0x1e
	.string	"md"
	.byte	0x1
	.word	0x210
	.long	0x1705
	.uleb128 0x32
	.long	.LASF270
	.byte	0x1
	.word	0x22b
	.long	0x25
	.long	.LLST197
	.uleb128 0x27
	.string	"i"
	.byte	0x1
	.word	0x22c
	.long	0x37
	.long	.LLST198
	.uleb128 0x32
	.long	.LASF271
	.byte	0x1
	.word	0x22d
	.long	0x25
	.long	.LLST199
	.uleb128 0x32
	.long	.LASF272
	.byte	0x1
	.word	0x22e
	.long	0x25
	.long	.LLST200
	.uleb128 0x2f
	.long	.LBB580
	.long	.LBE580
	.long	0x2f85
	.uleb128 0x1e
	.string	"y"
	.byte	0x1
	.word	0x231
	.long	0x37
	.uleb128 0x1e
	.string	"k"
	.byte	0x1
	.word	0x232
	.long	0x37
	.uleb128 0x39
	.long	.Ldebug_ranges0+0x1b0
	.long	0x2f4a
	.uleb128 0x27
	.string	"md2"
	.byte	0x1
	.word	0x240
	.long	0x1705
	.long	.LLST201
	.uleb128 0x32
	.long	.LASF226
	.byte	0x1
	.word	0x241
	.long	0x37
	.long	.LLST202
	.uleb128 0x35
	.long	0xb1e
	.long	.LBB582
	.long	.LBE582
	.byte	0x1
	.word	0x24a
	.uleb128 0x1c
	.long	0xb46
	.uleb128 0x1c
	.long	0xb3c
	.uleb128 0x1c
	.long	0xb30
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.long	0x8b8
	.long	.LBB585
	.long	.LBE585
	.byte	0x1
	.word	0x255
	.long	0x2f69
	.uleb128 0x1c
	.long	0x8d4
	.uleb128 0x1c
	.long	0x8ca
	.byte	0x0
	.uleb128 0x35
	.long	0x8b8
	.long	.LBB587
	.long	.LBE587
	.byte	0x1
	.word	0x259
	.uleb128 0x1c
	.long	0x8d4
	.uleb128 0x1c
	.long	0x8ca
	.byte	0x0
	.byte	0x0
	.uleb128 0x36
	.long	0x7ff
	.long	.LBB589
	.long	.LBE589
	.byte	0x1
	.word	0x25e
	.long	0x2fa8
	.uleb128 0x1c
	.long	0x81b
	.uleb128 0x29
	.long	0x811
	.long	.LLST203
	.byte	0x0
	.uleb128 0x36
	.long	0x7ff
	.long	.LBB591
	.long	.LBE591
	.byte	0x1
	.word	0x261
	.long	0x2fcb
	.uleb128 0x1c
	.long	0x81b
	.uleb128 0x29
	.long	0x811
	.long	.LLST204
	.byte	0x0
	.uleb128 0x31
	.long	.LASF230
	.byte	0x1
	.word	0x20a
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ11menuProcMixhE7mstate2
	.uleb128 0x31
	.long	.LASF240
	.byte	0x1
	.word	0x20f
	.long	0x37
	.byte	0x5
	.byte	0x3
	.long	_ZZ11menuProcMixhE7s_pgOfs
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x20b
	.long	0x3576
	.byte	0x5
	.byte	0x3
	.long	_ZZ11menuProcMixhE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x22f
	.long	0x358b
	.byte	0x5
	.byte	0x3
	.long	_ZZ11menuProcMixhE3__c_0
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x247
	.long	0x3590
	.byte	0x5
	.byte	0x3
	.long	_ZZ11menuProcMixhE3__c_1
	.byte	0x0
	.uleb128 0x43
	.byte	0x1
	.long	.LASF273
	.byte	0x1
	.byte	0xeb
	.long	.LASF275
	.long	.LFB17
	.long	.LFE17
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x3160
	.uleb128 0x3e
	.long	.LASF137
	.byte	0x1
	.byte	0xeb
	.long	0x37
	.long	.LLST206
	.uleb128 0x44
	.string	"sub"
	.byte	0x1
	.byte	0xef
	.long	0x25
	.long	.LLST207
	.uleb128 0x27
	.string	"y"
	.byte	0x1
	.word	0x103
	.long	0x37
	.long	.LLST208
	.uleb128 0x27
	.string	"yd"
	.byte	0x1
	.word	0x104
	.long	0x37
	.long	.LLST209
	.uleb128 0x27
	.string	"m"
	.byte	0x1
	.word	0x105
	.long	0x37
	.long	.LLST210
	.uleb128 0x2f
	.long	.LBB594
	.long	.LBE594
	.long	0x311a
	.uleb128 0x27
	.string	"i"
	.byte	0x1
	.word	0x106
	.long	0x37
	.long	.LLST211
	.uleb128 0x2b
	.long	.LBB595
	.long	.LBE595
	.uleb128 0x27
	.string	"k"
	.byte	0x1
	.word	0x107
	.long	0x37
	.long	.LLST212
	.uleb128 0x32
	.long	.LASF226
	.byte	0x1
	.word	0x108
	.long	0x37
	.long	.LLST213
	.uleb128 0x27
	.string	"cv9"
	.byte	0x1
	.word	0x109
	.long	0xbb
	.long	.LLST214
	.uleb128 0x27
	.string	"crv"
	.byte	0x1
	.word	0x111
	.long	0xf31
	.long	.LLST215
	.uleb128 0x2f
	.long	.LBB596
	.long	.LBE596
	.long	0x3104
	.uleb128 0x1e
	.string	"j"
	.byte	0x1
	.word	0x112
	.long	0x37
	.byte	0x0
	.uleb128 0x2b
	.long	.LBB597
	.long	.LBE597
	.uleb128 0x1e
	.string	"j"
	.byte	0x1
	.word	0x117
	.long	0x37
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x45
	.long	.LASF230
	.byte	0x1
	.byte	0xec
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcCurvehE7mstate2
	.uleb128 0x45
	.long	.LASF240
	.byte	0x1
	.byte	0xf1
	.long	0x37
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcCurvehE7s_pgOfs
	.uleb128 0x46
	.string	"__c"
	.byte	0x1
	.byte	0xed
	.long	0x34a5
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcCurvehE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x10e
	.long	0x34ba
	.byte	0x5
	.byte	0x3
	.long	_ZZ13menuProcCurvehE3__c_0
	.byte	0x0
	.uleb128 0x43
	.byte	0x1
	.long	.LASF274
	.byte	0x1
	.byte	0xb5
	.long	.LASF276
	.long	.LFB16
	.long	.LFE16
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x32ec
	.uleb128 0x3e
	.long	.LASF137
	.byte	0x1
	.byte	0xb5
	.long	0x37
	.long	.LLST217
	.uleb128 0x47
	.string	"x"
	.byte	0x1
	.byte	0xb7
	.long	0x37
	.uleb128 0x44
	.string	"cv9"
	.byte	0x1
	.byte	0xba
	.long	0xbb
	.long	.LLST218
	.uleb128 0x44
	.string	"sub"
	.byte	0x1
	.byte	0xbc
	.long	0x25
	.long	.LLST219
	.uleb128 0x44
	.string	"crv"
	.byte	0x1
	.byte	0xbe
	.long	0xf31
	.long	.LLST220
	.uleb128 0x2f
	.long	.LBB600
	.long	.LBE600
	.long	0x31d7
	.uleb128 0x47
	.string	"i"
	.byte	0x1
	.byte	0xd2
	.long	0x37
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB601
	.long	.LBE601
	.long	0x31ee
	.uleb128 0x47
	.string	"i"
	.byte	0x1
	.byte	0xd1
	.long	0x37
	.byte	0x0
	.uleb128 0x39
	.long	.Ldebug_ranges0+0x1c8
	.long	0x3212
	.uleb128 0x47
	.string	"xv"
	.byte	0x1
	.byte	0xe0
	.long	0x37
	.uleb128 0x3a
	.long	.Ldebug_ranges0+0x1e0
	.uleb128 0x47
	.string	"yv"
	.byte	0x1
	.byte	0xe1
	.long	0x5b
	.byte	0x0
	.byte	0x0
	.uleb128 0x48
	.long	0x8df
	.long	.LBB605
	.long	.LBE605
	.byte	0x1
	.byte	0xce
	.long	0x3235
	.uleb128 0x1c
	.long	0x907
	.uleb128 0x1c
	.long	0x8fd
	.uleb128 0x1c
	.long	0x8f1
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB607
	.long	.LBE607
	.long	0x326e
	.uleb128 0x47
	.string	"i"
	.byte	0x1
	.byte	0xc6
	.long	0x37
	.uleb128 0x2b
	.long	.LBB608
	.long	.LBE608
	.uleb128 0x47
	.string	"y"
	.byte	0x1
	.byte	0xc7
	.long	0x37
	.uleb128 0x3f
	.long	.LASF226
	.byte	0x1
	.byte	0xc8
	.long	0x37
	.long	.LLST221
	.byte	0x0
	.byte	0x0
	.uleb128 0x2f
	.long	.LBB609
	.long	.LBE609
	.long	0x32a7
	.uleb128 0x47
	.string	"i"
	.byte	0x1
	.byte	0xc0
	.long	0x37
	.uleb128 0x2b
	.long	.LBB610
	.long	.LBE610
	.uleb128 0x47
	.string	"y"
	.byte	0x1
	.byte	0xc1
	.long	0x37
	.uleb128 0x3f
	.long	.LASF226
	.byte	0x1
	.byte	0xc2
	.long	0x37
	.long	.LLST222
	.byte	0x0
	.byte	0x0
	.uleb128 0x45
	.long	.LASF230
	.byte	0x1
	.byte	0xb6
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ16menuProcCurveOnehE7mstate2
	.uleb128 0x45
	.long	.LASF277
	.byte	0x1
	.byte	0xcd
	.long	0x25
	.byte	0x5
	.byte	0x3
	.long	_ZZ16menuProcCurveOnehE7dfltCrv
	.uleb128 0x46
	.string	"__c"
	.byte	0x1
	.byte	0xb7
	.long	0x348b
	.byte	0x5
	.byte	0x3
	.long	_ZZ16menuProcCurveOnehE3__c
	.uleb128 0x46
	.string	"__c"
	.byte	0x1
	.byte	0xcb
	.long	0x3490
	.byte	0x5
	.byte	0x3
	.long	_ZZ16menuProcCurveOnehE3__c_0
	.byte	0x0
	.uleb128 0x2e
	.byte	0x1
	.long	.LASF278
	.byte	0x1
	.word	0x188
	.long	.LASF279
	.long	.LFB19
	.long	.LFE19
	.byte	0x2
	.byte	0x90
	.uleb128 0x20
	.long	0x347b
	.uleb128 0x38
	.long	.LASF137
	.byte	0x1
	.word	0x188
	.long	0x37
	.long	.LLST224
	.uleb128 0x1e
	.string	"x"
	.byte	0x1
	.word	0x18b
	.long	0x37
	.uleb128 0x1e
	.string	"md2"
	.byte	0x1
	.word	0x18c
	.long	0x1705
	.uleb128 0x27
	.string	"sub"
	.byte	0x1
	.word	0x190
	.long	0x25
	.long	.LLST225
	.uleb128 0x2f
	.long	.LBB613
	.long	.LBE613
	.long	0x33ea
	.uleb128 0x27
	.string	"i"
	.byte	0x1
	.word	0x194
	.long	0x37
	.long	.LLST226
	.uleb128 0x2b
	.long	.LBB614
	.long	.LBE614
	.uleb128 0x27
	.string	"y"
	.byte	0x1
	.word	0x196
	.long	0x37
	.long	.LLST227
	.uleb128 0x32
	.long	.LASF226
	.byte	0x1
	.word	0x197
	.long	0x37
	.long	.LLST228
	.uleb128 0x36
	.long	0xb1e
	.long	.LBB615
	.long	.LBE615
	.byte	0x1
	.word	0x19f
	.long	0x33a4
	.uleb128 0x1c
	.long	0xb46
	.uleb128 0x1c
	.long	0xb3c
	.uleb128 0x1c
	.long	0xb30
	.byte	0x0
	.uleb128 0x36
	.long	0xc27
	.long	.LBB617
	.long	.LBE617
	.byte	0x1
	.word	0x1a6
	.long	0x33c8
	.uleb128 0x1c
	.long	0xc4f
	.uleb128 0x1c
	.long	0xc45
	.uleb128 0x1c
	.long	0xc39
	.byte	0x0
	.uleb128 0x35
	.long	0xab4
	.long	.LBB619
	.long	.LBE619
	.byte	0x1
	.word	0x1ad
	.uleb128 0x1c
	.long	0xadc
	.uleb128 0x1c
	.long	0xad2
	.uleb128 0x1c
	.long	0xac6
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x31
	.long	.LASF230
	.byte	0x1
	.word	0x18a
	.long	0x61c
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcMixOnehE7mstate2
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x18b
	.long	0x3513
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcMixOnehE3__c
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x18b
	.long	0x3528
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcMixOnehE3__c_0
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x198
	.long	0x353d
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcMixOnehE3__c_1
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x1a2
	.long	0x3542
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcMixOnehE3__c_2
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x1a5
	.long	0x3557
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcMixOnehE3__c_3
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x1b7
	.long	0x355c
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcMixOnehE3__c_4
	.uleb128 0x33
	.string	"__c"
	.byte	0x1
	.word	0x1b8
	.long	0x3571
	.byte	0x5
	.byte	0x3
	.long	_ZZ14menuProcMixOnehE3__c_5
	.byte	0x0
	.uleb128 0xe
	.long	0x94
	.long	0x348b
	.uleb128 0xf
	.long	0x20a
	.byte	0x6
	.byte	0x0
	.uleb128 0x23
	.long	0x347b
	.uleb128 0x23
	.long	0x347b
	.uleb128 0xe
	.long	0x94
	.long	0x34a5
	.uleb128 0xf
	.long	0x20a
	.byte	0x5
	.byte	0x0
	.uleb128 0x23
	.long	0x3495
	.uleb128 0xe
	.long	0x94
	.long	0x34ba
	.uleb128 0xf
	.long	0x20a
	.byte	0x2
	.byte	0x0
	.uleb128 0x23
	.long	0x34aa
	.uleb128 0xe
	.long	0xbb
	.long	0x34cf
	.uleb128 0xf
	.long	0x20a
	.byte	0xf
	.byte	0x0
	.uleb128 0xe
	.long	0xb0
	.long	0x34df
	.uleb128 0xf
	.long	0x20a
	.byte	0x1
	.byte	0x0
	.uleb128 0x23
	.long	0x34cf
	.uleb128 0x23
	.long	0x347b
	.uleb128 0xe
	.long	0x94
	.long	0x34f9
	.uleb128 0xf
	.long	0x20a
	.byte	0x11
	.byte	0x0
	.uleb128 0x23
	.long	0x34e9
	.uleb128 0x23
	.long	0x347b
	.uleb128 0xe
	.long	0x94
	.long	0x3513
	.uleb128 0xf
	.long	0x20a
	.byte	0xb
	.byte	0x0
	.uleb128 0x23
	.long	0x3503
	.uleb128 0xe
	.long	0x94
	.long	0x3528
	.uleb128 0xf
	.long	0x20a
	.byte	0x9
	.byte	0x0
	.uleb128 0x23
	.long	0x3518
	.uleb128 0xe
	.long	0x94
	.long	0x353d
	.uleb128 0xf
	.long	0x20a
	.byte	0x2e
	.byte	0x0
	.uleb128 0x23
	.long	0x352d
	.uleb128 0x23
	.long	0x347b
	.uleb128 0xe
	.long	0x94
	.long	0x3557
	.uleb128 0xf
	.long	0x20a
	.byte	0x45
	.byte	0x0
	.uleb128 0x23
	.long	0x3547
	.uleb128 0x23
	.long	0x34aa
	.uleb128 0xe
	.long	0x94
	.long	0x3571
	.uleb128 0xf
	.long	0x20a
	.byte	0xd
	.byte	0x0
	.uleb128 0x23
	.long	0x3561
	.uleb128 0x23
	.long	0x3495
	.uleb128 0xe
	.long	0x94
	.long	0x358b
	.uleb128 0xf
	.long	0x20a
	.byte	0xe
	.byte	0x0
	.uleb128 0x23
	.long	0x357b
	.uleb128 0x23
	.long	0x3547
	.uleb128 0xe
	.long	0x94
	.long	0x35a5
	.uleb128 0xf
	.long	0x20a
	.byte	0x4
	.byte	0x0
	.uleb128 0x23
	.long	0x3595
	.uleb128 0xe
	.long	0x94
	.long	0x35ba
	.uleb128 0xf
	.long	0x20a
	.byte	0xa
	.byte	0x0
	.uleb128 0x23
	.long	0x35aa
	.uleb128 0xe
	.long	0x94
	.long	0x35cf
	.uleb128 0xf
	.long	0x20a
	.byte	0x13
	.byte	0x0
	.uleb128 0x23
	.long	0x35bf
	.uleb128 0xe
	.long	0x94
	.long	0x35e4
	.uleb128 0xf
	.long	0x20a
	.byte	0x8
	.byte	0x0
	.uleb128 0x23
	.long	0x35d4
	.uleb128 0x23
	.long	0x3595
	.uleb128 0x23
	.long	0x347b
	.uleb128 0x23
	.long	0x3595
	.uleb128 0x23
	.long	0x3495
	.uleb128 0x23
	.long	0x347b
	.uleb128 0x23
	.long	0x34cf
	.uleb128 0xe
	.long	0x94
	.long	0x3617
	.uleb128 0xf
	.long	0x20a
	.byte	0x7
	.byte	0x0
	.uleb128 0x23
	.long	0x3607
	.uleb128 0x23
	.long	0x34e9
	.uleb128 0xe
	.long	0xb0
	.long	0x3631
	.uleb128 0xf
	.long	0x20a
	.byte	0x7
	.byte	0x0
	.uleb128 0x23
	.long	0x3621
	.uleb128 0x23
	.long	0x347b
	.uleb128 0x23
	.long	0x3595
	.uleb128 0x23
	.long	0x3495
	.uleb128 0xe
	.long	0x94
	.long	0x3655
	.uleb128 0xf
	.long	0x20a
	.byte	0x1e
	.byte	0x0
	.uleb128 0x23
	.long	0x3645
	.uleb128 0xe
	.long	0x94
	.long	0x366a
	.uleb128 0xf
	.long	0x20a
	.byte	0x14
	.byte	0x0
	.uleb128 0x23
	.long	0x365a
	.uleb128 0x23
	.long	0x3495
	.uleb128 0xe
	.long	0x94
	.long	0x3684
	.uleb128 0xf
	.long	0x20a
	.byte	0x10
	.byte	0x0
	.uleb128 0x23
	.long	0x3674
	.uleb128 0x23
	.long	0x347b
	.uleb128 0x23
	.long	0x347b
	.uleb128 0x23
	.long	0x35d4
	.uleb128 0x23
	.long	0x3645
	.uleb128 0x23
	.long	0x3607
	.uleb128 0x23
	.long	0x34aa
	.uleb128 0x23
	.long	0x3561
	.uleb128 0x23
	.long	0x35d4
	.uleb128 0x23
	.long	0x3595
	.uleb128 0xe
	.long	0x94
	.long	0x36c6
	.uleb128 0xf
	.long	0x20a
	.byte	0x3
	.byte	0x0
	.uleb128 0x23
	.long	0x36b6
	.uleb128 0xe
	.long	0x57d
	.long	0x36db
	.uleb128 0xf
	.long	0x20a
	.byte	0xe
	.byte	0x0
	.uleb128 0x23
	.long	0x3495
	.uleb128 0xe
	.long	0x94
	.long	0x36f0
	.uleb128 0xf
	.long	0x20a
	.byte	0x1c
	.byte	0x0
	.uleb128 0x23
	.long	0x36e0
	.uleb128 0x23
	.long	0x35d4
	.uleb128 0x23
	.long	0x347b
	.uleb128 0x23
	.long	0x36b6
	.uleb128 0x23
	.long	0x3674
	.uleb128 0x23
	.long	0x3595
	.uleb128 0x23
	.long	0x3645
	.uleb128 0x23
	.long	0x3607
	.uleb128 0x23
	.long	0x3607
	.uleb128 0x23
	.long	0x34cf
	.uleb128 0x23
	.long	0x3607
	.uleb128 0x23
	.long	0x3674
	.uleb128 0x23
	.long	0x3518
	.uleb128 0xe
	.long	0x94
	.long	0x3741
	.uleb128 0xf
	.long	0x20a
	.byte	0xc
	.byte	0x0
	.uleb128 0x23
	.long	0x3731
	.uleb128 0x23
	.long	0x36b6
	.uleb128 0x23
	.long	0x35aa
	.uleb128 0xe
	.long	0x94
	.long	0x3760
	.uleb128 0xf
	.long	0x20a
	.byte	0x20
	.byte	0x0
	.uleb128 0x23
	.long	0x3750
	.uleb128 0x23
	.long	0x34aa
	.uleb128 0x23
	.long	0x36b6
	.uleb128 0x23
	.long	0x3503
	.uleb128 0x23
	.long	0x35d4
	.uleb128 0x23
	.long	0x3561
	.uleb128 0x23
	.long	0x3495
	.uleb128 0x23
	.long	0x3595
	.uleb128 0x23
	.long	0x3495
	.uleb128 0x23
	.long	0x34e9
	.uleb128 0x23
	.long	0x34e9
	.uleb128 0x23
	.long	0x34e9
	.uleb128 0x23
	.long	0x34e9
	.uleb128 0x23
	.long	0x3595
	.uleb128 0x23
	.long	0x36b6
	.uleb128 0x23
	.long	0x36b6
	.uleb128 0x23
	.long	0x36b6
	.uleb128 0x23
	.long	0x3595
	.uleb128 0xe
	.long	0x159
	.long	0x37ca
	.uleb128 0xf
	.long	0x20a
	.byte	0x1
	.byte	0x0
	.uleb128 0x23
	.long	0x3595
	.uleb128 0xe
	.long	0x94
	.long	0x37df
	.uleb128 0xf
	.long	0x20a
	.byte	0x15
	.byte	0x0
	.uleb128 0x23
	.long	0x37cf
	.uleb128 0x23
	.long	0x35d4
	.uleb128 0x23
	.long	0x36b6
	.uleb128 0x23
	.long	0x3731
	.uleb128 0xe
	.long	0x37
	.long	0x3803
	.uleb128 0xf
	.long	0x20a
	.byte	0x3
	.byte	0x0
	.uleb128 0x23
	.long	0x37f3
	.uleb128 0x23
	.long	0x37f3
	.uleb128 0xe
	.long	0x49
	.long	0x381d
	.uleb128 0xf
	.long	0x20a
	.byte	0x18
	.byte	0x0
	.uleb128 0xe
	.long	0x6d
	.long	0x382d
	.uleb128 0xf
	.long	0x20a
	.byte	0xf
	.byte	0x0
	.uleb128 0xe
	.long	0x37
	.long	0x383d
	.uleb128 0xf
	.long	0x20a
	.byte	0x18
	.byte	0x0
	.uleb128 0xe
	.long	0xb0
	.long	0x384d
	.uleb128 0xf
	.long	0x20a
	.byte	0xe
	.byte	0x0
	.uleb128 0x23
	.long	0x383d
	.uleb128 0x23
	.long	0x383d
	.uleb128 0xe
	.long	0x94
	.long	0x3867
	.uleb128 0xf
	.long	0x20a
	.byte	0x12
	.byte	0x0
	.uleb128 0x23
	.long	0x3857
	.uleb128 0x49
	.long	.LASF280
	.byte	0x2
	.word	0x128
	.long	0xbb
	.byte	0x1
	.byte	0x1
	.uleb128 0x49
	.long	.LASF281
	.byte	0x2
	.word	0x19f
	.long	0x37
	.byte	0x1
	.byte	0x1
	.uleb128 0x49
	.long	.LASF282
	.byte	0x2
	.word	0x1a0
	.long	0x3896
	.byte	0x1
	.byte	0x1
	.uleb128 0x4a
	.long	0x5b
	.uleb128 0x49
	.long	.LASF283
	.byte	0x2
	.word	0x1a1
	.long	0x38a9
	.byte	0x1
	.byte	0x1
	.uleb128 0x4a
	.long	0x37
	.uleb128 0x49
	.long	.LASF284
	.byte	0x2
	.word	0x1a2
	.long	0x37
	.byte	0x1
	.byte	0x1
	.uleb128 0x49
	.long	.LASF285
	.byte	0x2
	.word	0x1a3
	.long	0x37f3
	.byte	0x1
	.byte	0x1
	.uleb128 0xe
	.long	0x5b
	.long	0x38da
	.uleb128 0xf
	.long	0x20a
	.byte	0x3b
	.byte	0x0
	.uleb128 0x4b
	.long	.LASF286
	.byte	0x1
	.word	0x6e5
	.long	0x38ca
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	pulses2MHz
	.uleb128 0xe
	.long	0x49
	.long	0x38fd
	.uleb128 0xf
	.long	0x20a
	.byte	0x7
	.byte	0x0
	.uleb128 0x49
	.long	.LASF287
	.byte	0x2
	.word	0x1a7
	.long	0x38ed
	.byte	0x1
	.byte	0x1
	.uleb128 0xe
	.long	0x49
	.long	0x391b
	.uleb128 0xf
	.long	0x20a
	.byte	0xf
	.byte	0x0
	.uleb128 0x4c
	.long	.LASF288
	.byte	0x1
	.byte	0x18
	.long	0x390b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	g_chans512
	.uleb128 0xe
	.long	0x57d
	.long	0x3938
	.uleb128 0x4d
	.byte	0x0
	.uleb128 0x49
	.long	.LASF289
	.byte	0x2
	.word	0x1ab
	.long	0x392d
	.byte	0x1
	.byte	0x1
	.uleb128 0x49
	.long	.LASF290
	.byte	0x2
	.word	0x1ac
	.long	0x392d
	.byte	0x1
	.byte	0x1
	.uleb128 0x49
	.long	.LASF291
	.byte	0x2
	.word	0x1ad
	.long	0x392d
	.byte	0x1
	.byte	0x1
	.uleb128 0x49
	.long	.LASF292
	.byte	0x2
	.word	0x1ae
	.long	0x392d
	.byte	0x1
	.byte	0x1
	.uleb128 0x4e
	.long	.LASF293
	.byte	0x5
	.byte	0x82
	.long	0x2f9
	.byte	0x1
	.byte	0x1
	.uleb128 0x4e
	.long	.LASF294
	.byte	0x5
	.byte	0x83
	.long	0x600
	.byte	0x1
	.byte	0x1
	.uleb128 0x45
	.long	.LASF295
	.byte	0x1
	.byte	0x17
	.long	0x1fa
	.byte	0x5
	.byte	0x3
	.long	_ZL8anaCalib
	.uleb128 0xe
	.long	0xa2
	.long	0x39ab
	.uleb128 0xf
	.long	0x20a
	.byte	0x4a
	.byte	0x0
	.uleb128 0x4c
	.long	.LASF296
	.byte	0x6
	.byte	0x1
	.long	0x39bd
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	sticks
	.uleb128 0x23
	.long	0x399b
	.uleb128 0xe
	.long	0x60b
	.long	0x39d2
	.uleb128 0xf
	.long	0x20a
	.byte	0x6
	.byte	0x0
	.uleb128 0x4c
	.long	.LASF297
	.byte	0x1
	.byte	0x1f
	.long	0x39e4
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	menuTabModel
	.uleb128 0x23
	.long	0x39c2
	.uleb128 0x4c
	.long	.LASF298
	.byte	0x1
	.byte	0x29
	.long	0x39fb
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	menuTabDiag
	.uleb128 0x23
	.long	0x39c2
	.uleb128 0x45
	.long	.LASF299
	.byte	0x1
	.byte	0xb3
	.long	0x37
	.byte	0x5
	.byte	0x3
	.long	_ZL11s_curveChan
	.uleb128 0x31
	.long	.LASF300
	.byte	0x1
	.word	0x123
	.long	0xbb
	.byte	0x5
	.byte	0x3
	.long	_ZL14s_limitCacheOk
	.uleb128 0x31
	.long	.LASF301
	.byte	0x1
	.word	0x185
	.long	0x25
	.byte	0x5
	.byte	0x3
	.long	_ZL12s_currMixIdx
	.uleb128 0x31
	.long	.LASF302
	.byte	0x1
	.word	0x186
	.long	0x25
	.byte	0x5
	.byte	0x3
	.long	_ZL12s_currDestCh
	.uleb128 0x31
	.long	.LASF303
	.byte	0x1
	.word	0x187
	.long	0xbb
	.byte	0x5
	.byte	0x3
	.long	_ZL16s_currMixInsMode
	.uleb128 0xe
	.long	0x6f6
	.long	0x3a69
	.uleb128 0xf
	.long	0x20a
	.byte	0x29
	.byte	0x0
	.uleb128 0x4b
	.long	.LASF304
	.byte	0x1
	.word	0x1d9
	.long	0x3a59
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	s_mixTab
	.uleb128 0x4b
	.long	.LASF305
	.byte	0x1
	.word	0x1da
	.long	0x25
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	s_mixMaxSel
	.uleb128 0x31
	.long	.LASF306
	.byte	0x1
	.word	0x2d4
	.long	0x37
	.byte	0x5
	.byte	0x3
	.long	_ZL10s_expoChan
	.uleb128 0xe
	.long	0x94
	.long	0x3ab1
	.uleb128 0xf
	.long	0x20a
	.byte	0x28
	.byte	0x0
	.uleb128 0x31
	.long	.LASF307
	.byte	0x1
	.word	0x362
	.long	0x3ac3
	.byte	0x5
	.byte	0x3
	.long	_ZL9s_charTab
	.uleb128 0x23
	.long	0x3aa1
	.uleb128 0x4b
	.long	.LASF308
	.byte	0x1
	.word	0x541
	.long	0x5b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	s_timeCumTot
	.uleb128 0x4b
	.long	.LASF309
	.byte	0x1
	.word	0x542
	.long	0x5b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	s_timeCumAbs
	.uleb128 0x4b
	.long	.LASF310
	.byte	0x1
	.word	0x543
	.long	0x5b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	s_timeCumThr
	.uleb128 0x4b
	.long	.LASF311
	.byte	0x1
	.word	0x544
	.long	0x5b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	s_timeCum16ThrP
	.uleb128 0x4b
	.long	.LASF312
	.byte	0x1
	.word	0x545
	.long	0x37
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	s_timerState
	.uleb128 0x4b
	.long	.LASF313
	.byte	0x1
	.word	0x54a
	.long	0x49
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	s_timerVal
	.uleb128 0xe
	.long	0x37
	.long	0x3b4a
	.uleb128 0xf
	.long	0x20a
	.byte	0x77
	.byte	0x0
	.uleb128 0x4b
	.long	.LASF314
	.byte	0x1
	.word	0x58c
	.long	0x3b3a
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	s_traceBuf
	.uleb128 0x4b
	.long	.LASF315
	.byte	0x1
	.word	0x58d
	.long	0x5b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	s_traceWr
	.uleb128 0x4b
	.long	.LASF316
	.byte	0x1
	.word	0x58e
	.long	0x5b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	s_traceCnt
	.uleb128 0x4b
	.long	.LASF317
	.byte	0x1
	.word	0x5a5
	.long	0x5b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	g_tmr1Latency_max
	.uleb128 0x4b
	.long	.LASF318
	.byte	0x1
	.word	0x5a6
	.long	0x5b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	g_tmr1Latency_min
	.uleb128 0x4b
	.long	.LASF319
	.byte	0x1
	.word	0x5a7
	.long	0x5b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	g_timeMain
	.uleb128 0x31
	.long	.LASF320
	.byte	0x1
	.word	0x6a8
	.long	0x390b
	.byte	0x5
	.byte	0x3
	.long	_ZL16s_cacheLimitsMin
	.uleb128 0x31
	.long	.LASF321
	.byte	0x1
	.word	0x6a9
	.long	0x390b
	.byte	0x5
	.byte	0x3
	.long	_ZL16s_cacheLimitsMax
	.uleb128 0x4b
	.long	.LASF322
	.byte	0x1
	.word	0x7e0
	.long	0x3bf3
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	pulses2MHzPtr
	.uleb128 0x8
	.byte	0x2
	.long	0x5b
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
	.uleb128 0x34
	.byte	0x0
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
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
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0xc
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
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x16
	.uleb128 0x13
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
	.uleb128 0x17
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
	.uleb128 0x18
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
	.uleb128 0x5
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
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x1c
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x1d
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
	.uleb128 0x20
	.uleb128 0xf
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x0
	.byte	0x0
	.uleb128 0x21
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
	.uleb128 0x22
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
	.uleb128 0x23
	.uleb128 0x26
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
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
	.uleb128 0x27
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
	.uleb128 0x28
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
	.uleb128 0x29
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2a
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x2b
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0x0
	.byte	0x0
	.uleb128 0x2c
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x2d
	.uleb128 0x34
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x2e
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
	.uleb128 0x2f
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
	.uleb128 0x30
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
	.uleb128 0x33
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
	.uleb128 0x34
	.uleb128 0x5
	.byte	0x0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x35
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
	.uleb128 0x36
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
	.uleb128 0x37
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
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x38
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
	.uleb128 0x39
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x1
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3a
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0x0
	.byte	0x0
	.uleb128 0x3b
	.uleb128 0x10
	.byte	0x0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0x0
	.byte	0x0
	.uleb128 0x3c
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
	.uleb128 0x3d
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
	.uleb128 0x3e
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
	.uleb128 0x3f
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
	.uleb128 0x40
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
	.uleb128 0x41
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
	.uleb128 0x42
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
	.uleb128 0x43
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
	.uleb128 0x44
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
	.uleb128 0x45
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
	.uleb128 0x46
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
	.uleb128 0x47
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
	.uleb128 0x1
	.uleb128 0x13
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
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0x0
	.byte	0x0
	.uleb128 0x4a
	.uleb128 0x35
	.byte	0x0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x2
	.uleb128 0xa
	.byte	0x0
	.byte	0x0
	.uleb128 0x4c
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
	.uleb128 0x4d
	.uleb128 0x21
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.uleb128 0x4e
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
	.long	0x44e
	.word	0x2
	.long	.Ldebug_info0
	.long	0x3bfa
	.long	0xc5c
	.string	"expou"
	.long	0xc99
	.string	"expo"
	.long	0xcf4
	.string	"char2idx"
	.long	0xd40
	.string	"idx2char"
	.long	0xd72
	.string	"timer"
	.long	0xe05
	.string	"trace"
	.long	0xe68
	.string	"calcLimitCache"
	.long	0xe9b
	.string	"intpol"
	.long	0xf37
	.string	"setupPulsesPPM"
	.long	0xfad
	.string	"_send_hilo"
	.long	0xfda
	.string	"sendBitSilv"
	.long	0x1013
	.string	"send2BitsSilv"
	.long	0x10a6
	.string	"setupPulsesSilver"
	.long	0x1196
	.string	"sendBitTra"
	.long	0x11fd
	.string	"sendByteTra"
	.long	0x1238
	.string	"setupPulsesTracerCtp1009"
	.long	0x1313
	.string	"setupPulses"
	.long	0x132b
	.string	"get_calibrated_stick"
	.long	0x1387
	.string	"perOut"
	.long	0x1683
	.string	"genMixTab"
	.long	0x170b
	.string	"menuProcStatistic"
	.long	0x17e6
	.string	"menuProc0"
	.long	0x1987
	.string	"menuProcStatistic2"
	.long	0x1a1e
	.string	"editExpoVals"
	.long	0x1b57
	.string	"MState2::check"
	.long	0x1ca4
	.string	"menuProcTrainer"
	.long	0x1dee
	.string	"menuProcModel"
	.long	0x20e1
	.string	"menuProcExpoAll"
	.long	0x219e
	.string	"menuProcLimits"
	.long	0x237e
	.string	"MState2::check_v"
	.long	0x23ed
	.string	"menuProcSetup0"
	.long	0x254c
	.string	"menuProcSetup1"
	.long	0x2667
	.string	"menuProcDiagVers"
	.long	0x26b8
	.string	"menuProcDiagKeys"
	.long	0x2805
	.string	"menuProcDiagAna"
	.long	0x28ff
	.string	"menuProcDiagCalib"
	.long	0x2ad0
	.string	"menuProcModelSelect"
	.long	0x2c21
	.string	"menuProcExpoOne"
	.long	0x2d6d
	.string	"menuProcTrim"
	.long	0x2e5a
	.string	"menuProcMix"
	.long	0x3026
	.string	"menuProcCurve"
	.long	0x3160
	.string	"menuProcCurveOne"
	.long	0x32ec
	.string	"menuProcMixOne"
	.long	0x38da
	.string	"pulses2MHz"
	.long	0x391b
	.string	"g_chans512"
	.long	0x39ab
	.string	"sticks"
	.long	0x39d2
	.string	"menuTabModel"
	.long	0x39e9
	.string	"menuTabDiag"
	.long	0x3a69
	.string	"s_mixTab"
	.long	0x3a7c
	.string	"s_mixMaxSel"
	.long	0x3ac8
	.string	"s_timeCumTot"
	.long	0x3adb
	.string	"s_timeCumAbs"
	.long	0x3aee
	.string	"s_timeCumThr"
	.long	0x3b01
	.string	"s_timeCum16ThrP"
	.long	0x3b14
	.string	"s_timerState"
	.long	0x3b27
	.string	"s_timerVal"
	.long	0x3b4a
	.string	"s_traceBuf"
	.long	0x3b5d
	.string	"s_traceWr"
	.long	0x3b70
	.string	"s_traceCnt"
	.long	0x3b83
	.string	"g_tmr1Latency_max"
	.long	0x3b96
	.string	"g_tmr1Latency_min"
	.long	0x3ba9
	.string	"g_timeMain"
	.long	0x3be0
	.string	"pulses2MHzPtr"
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
	.long	.LBB395-.Ltext0
	.long	.LBE395-.Ltext0
	.long	.LBB414-.Ltext0
	.long	.LBE414-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB396-.Ltext0
	.long	.LBE396-.Ltext0
	.long	.LBB406-.Ltext0
	.long	.LBE406-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB417-.Ltext0
	.long	.LBE417-.Ltext0
	.long	.LBB418-.Ltext0
	.long	.LBE418-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB426-.Ltext0
	.long	.LBE426-.Ltext0
	.long	.LBB433-.Ltext0
	.long	.LBE433-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB428-.Ltext0
	.long	.LBE428-.Ltext0
	.long	.LBB434-.Ltext0
	.long	.LBE434-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB429-.Ltext0
	.long	.LBE429-.Ltext0
	.long	.LBB432-.Ltext0
	.long	.LBE432-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB430-.Ltext0
	.long	.LBE430-.Ltext0
	.long	.LBB431-.Ltext0
	.long	.LBE431-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB459-.Ltext0
	.long	.LBE459-.Ltext0
	.long	.LBB462-.Ltext0
	.long	.LBE462-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB460-.Ltext0
	.long	.LBE460-.Ltext0
	.long	.LBB461-.Ltext0
	.long	.LBE461-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB491-.Ltext0
	.long	.LBE491-.Ltext0
	.long	.LBB494-.Ltext0
	.long	.LBE494-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB492-.Ltext0
	.long	.LBE492-.Ltext0
	.long	.LBB493-.Ltext0
	.long	.LBE493-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB499-.Ltext0
	.long	.LBE499-.Ltext0
	.long	.LBB505-.Ltext0
	.long	.LBE505-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB500-.Ltext0
	.long	.LBE500-.Ltext0
	.long	.LBB504-.Ltext0
	.long	.LBE504-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB517-.Ltext0
	.long	.LBE517-.Ltext0
	.long	.LBB524-.Ltext0
	.long	.LBE524-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB518-.Ltext0
	.long	.LBE518-.Ltext0
	.long	.LBB523-.Ltext0
	.long	.LBE523-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB519-.Ltext0
	.long	.LBE519-.Ltext0
	.long	.LBB522-.Ltext0
	.long	.LBE522-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB520-.Ltext0
	.long	.LBE520-.Ltext0
	.long	.LBB521-.Ltext0
	.long	.LBE521-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB536-.Ltext0
	.long	.LBE536-.Ltext0
	.long	.LBB539-.Ltext0
	.long	.LBE539-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB581-.Ltext0
	.long	.LBE581-.Ltext0
	.long	.LBB584-.Ltext0
	.long	.LBE584-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB602-.Ltext0
	.long	.LBE602-.Ltext0
	.long	.LBB599-.Ltext0
	.long	.LBE599-.Ltext0
	.long	0x0
	.long	0x0
	.long	.LBB603-.Ltext0
	.long	.LBE603-.Ltext0
	.long	.LBB604-.Ltext0
	.long	.LBE604-.Ltext0
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
	.string	"menus.cpp"
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
	.string	"sticks.lbm"
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
	.sleb128 659
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM2
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM3
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM4
	.byte	0x1d
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM5
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM6
	.byte	0x16
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
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM10
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM11
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM12
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM13
	.byte	0xcc
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM14
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM15
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM16
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM17
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM18
	.byte	0x10
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM19
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM20
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM21
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM22
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM23
	.byte	0x3
	.sleb128 473
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM24
	.byte	0x19
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
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM28
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM29
	.byte	0x15
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
	.byte	0x15
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
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM37
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM38
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM39
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM40
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM41
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM42
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM43
	.byte	0x17
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
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM47
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM48
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM49
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -977
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM50
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 981
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM51
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM52
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM53
	.byte	0x18
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
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM57
	.byte	0x16
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
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM62
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM63
	.byte	0x3
	.sleb128 264
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM64
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM65
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM66
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM67
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM68
	.byte	0x10
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM69
	.byte	0x1f
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM70
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM71
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM72
	.byte	0x17
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
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM76
	.byte	0x15
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
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM83
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM84
	.byte	0x3
	.sleb128 245
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM85
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM86
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM87
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM88
	.byte	0x11
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
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM93
	.byte	0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM94
	.byte	0x1b
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
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM98
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM99
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM100
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM101
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM102
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM103
	.byte	0xe
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM104
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM105
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM106
	.byte	0x12
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM107
	.byte	0xe
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM108
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM109
	.byte	0xe
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM110
	.byte	0x1f
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM111
	.byte	0x21
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM112
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM113
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM114
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM115
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM116
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM117
	.byte	0x3
	.sleb128 -42
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM118
	.byte	0x42
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM119
	.byte	0x3
	.sleb128 -46
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM120
	.byte	0x46
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM121
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM122
	.byte	0x16
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
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM126
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM127
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM128
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM129
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM130
	.byte	0x3
	.sleb128 -63
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM131
	.byte	0x5a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM132
	.byte	0x3b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM133
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM134
	.byte	0x3
	.sleb128 -111
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM135
	.byte	0x86
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM136
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM137
	.byte	0x16
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
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM146
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM147
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM148
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM149
	.byte	0x3
	.sleb128 -137
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM150
	.byte	0xa0
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM151
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM152
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM153
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM154
	.byte	0x3
	.sleb128 -147
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM155
	.byte	0xaa
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM156
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM157
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM158
	.byte	0x3
	.sleb128 -196
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM159
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM160
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM161
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM162
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM163
	.byte	0x3
	.sleb128 -238
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM164
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM165
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM166
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM167
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -1422
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM168
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 1422
	.byte	0x1
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
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM173
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM174
	.byte	0x44
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM175
	.byte	0x3
	.sleb128 -37
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM176
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM177
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM178
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM179
	.byte	0x11
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM180
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM181
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM182
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM183
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM184
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM185
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM186
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM187
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM188
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM189
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM190
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM191
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM192
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM193
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM194
	.byte	0x3
	.sleb128 -46
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM195
	.byte	0x45
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM196
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM197
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM198
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM199
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM200
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM201
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM202
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM203
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM204
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM205
	.byte	0x78
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM206
	.byte	0x3
	.sleb128 -90
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM207
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM208
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM209
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM210
	.byte	0x2d
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM211
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM212
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM213
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM214
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM215
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM216
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM217
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -1553
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM218
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 1553
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM219
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM220
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM221
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM222
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM223
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM224
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM225
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM226
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM227
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM228
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM229
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM230
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM231
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM232
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM233
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM234
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -1588
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM235
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 1596
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM236
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM237
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM238
	.byte	0x3
	.sleb128 -98
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM239
	.byte	0x3
	.sleb128 -127
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM240
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM241
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM242
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM243
	.byte	0x10
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM244
	.byte	0x3
	.sleb128 234
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM245
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM246
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM247
	.byte	0x18
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
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM251
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM252
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM253
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM254
	.byte	0x3
	.sleb128 -23
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM255
	.byte	0x3
	.sleb128 -87
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM256
	.byte	0x86
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM257
	.byte	0x3
	.sleb128 -1490
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM258
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM259
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM260
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM261
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM262
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM263
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM264
	.byte	0x15
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
	.byte	0xe
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM269
	.byte	0x3
	.sleb128 -14
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM270
	.byte	0x2a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM271
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM272
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM273
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM274
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM275
	.byte	0x15
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
	.byte	0x15
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
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM282
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM283
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM284
	.byte	0x3
	.sleb128 -30
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM285
	.byte	0x33
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM286
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM287
	.byte	0x3
	.sleb128 959
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM288
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM289
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM290
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM291
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM292
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM293
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM294
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM295
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM296
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM297
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM298
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM299
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM300
	.byte	0x17
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
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM304
	.byte	0x12
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM305
	.byte	0x1a
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
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM309
	.byte	0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM310
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM311
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM312
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM313
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM314
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM315
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM316
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM317
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM318
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM319
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM320
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM321
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM322
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM323
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM324
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -1131
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM325
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 1136
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM326
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM327
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM328
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM329
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM330
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM331
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM332
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM333
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM334
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM335
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM336
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM337
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM338
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM339
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM340
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM341
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM342
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM343
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM344
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM345
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM346
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM347
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM348
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM349
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM350
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM351
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM352
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM353
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM354
	.byte	0x29
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM355
	.byte	0x3
	.sleb128 -11
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM356
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM357
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM358
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM359
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM360
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM361
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM362
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM363
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM364
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM365
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM366
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM367
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM368
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM369
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM370
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM371
	.byte	0x3
	.sleb128 -33
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM372
	.byte	0x41
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM373
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM374
	.byte	0x3
	.sleb128 -52
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM375
	.byte	0x3a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM376
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM377
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM378
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM379
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM380
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM381
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM382
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM383
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM384
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM385
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM386
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM387
	.byte	0x3
	.sleb128 -28
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM388
	.byte	0x3
	.sleb128 -117
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM389
	.byte	0x22
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM390
	.byte	0x9c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM391
	.byte	0x3
	.sleb128 -253
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM392
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM393
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM394
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM395
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM396
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM397
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -1021
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM398
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 1025
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM399
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM400
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM401
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM402
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM403
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM404
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM405
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM406
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM407
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM408
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM409
	.byte	0x3
	.sleb128 -749
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM410
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM411
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM412
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM413
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM414
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -450
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM415
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 453
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM416
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM417
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -454
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM418
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 457
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM419
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM420
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -458
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM421
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 461
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM422
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM423
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -462
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM424
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 465
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM425
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM426
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -466
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM427
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 469
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM428
	.byte	0x3
	.sleb128 -679
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM429
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM430
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM431
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM432
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM433
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM434
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM435
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM436
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM437
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM438
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM439
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM440
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM441
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM442
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM443
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM444
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM445
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM446
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 319
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM447
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -379
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM448
	.byte	0x57
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM449
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM450
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM451
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM452
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM453
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM454
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM455
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM456
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM457
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM458
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM459
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM460
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM461
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM462
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM463
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM464
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM465
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM466
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM467
	.byte	0x3
	.sleb128 1047
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM468
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM469
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM470
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM471
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM472
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM473
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM474
	.byte	0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM475
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM476
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM477
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM478
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM479
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM480
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM481
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM482
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM483
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM484
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM485
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM486
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM487
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM488
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM489
	.byte	0x3
	.sleb128 -21
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM490
	.byte	0x2f
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM491
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM492
	.byte	0x11
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM493
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM494
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM495
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM496
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM497
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -826
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM498
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 831
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM499
	.byte	0x3
	.sleb128 -382
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM500
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM501
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM502
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM503
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM504
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM505
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM506
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM507
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM508
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM509
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM510
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM511
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM512
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM513
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM514
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM515
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM516
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM517
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM518
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM519
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM520
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM521
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM522
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM523
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM524
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM525
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM526
	.byte	0x3
	.sleb128 -52
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM527
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM528
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM529
	.byte	0x10
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM530
	.byte	0x4b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM531
	.byte	0x3
	.sleb128 -46
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM532
	.byte	0x44
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM533
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM534
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM535
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -650
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM536
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 654
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM537
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM538
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM539
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM540
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM541
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM542
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM543
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM544
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM545
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -679
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM546
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 686
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM547
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -686
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM548
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 694
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM549
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM550
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM551
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM552
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM553
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM554
	.byte	0x3
	.sleb128 -154
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM555
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM556
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM557
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM558
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM559
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM560
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM561
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM562
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM563
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM564
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM565
	.byte	0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM566
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM567
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM568
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM569
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM570
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM571
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM572
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM573
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM574
	.byte	0x3
	.sleb128 -11
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM575
	.byte	0x22
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM576
	.byte	0x3
	.sleb128 -571
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM577
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM578
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM579
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM580
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM581
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM582
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM583
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM584
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM585
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM586
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM587
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM588
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM589
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM590
	.byte	0x1e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM591
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM592
	.byte	0x10
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM593
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM594
	.byte	0x25
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM595
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM596
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM597
	.byte	0x3
	.sleb128 -28
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM598
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM599
	.byte	0x24
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM600
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM601
	.byte	0x3
	.sleb128 -17
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM602
	.byte	0xa
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM603
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM604
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM605
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM606
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM607
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM608
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM609
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM610
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -73
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM611
	.byte	0x4
	.uleb128 0x1
	.byte	0x5e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM612
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM613
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM614
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM615
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -80
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM616
	.byte	0x4
	.uleb128 0x1
	.byte	0x65
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM617
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM618
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM619
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM620
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM621
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -88
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM622
	.byte	0x4
	.uleb128 0x1
	.byte	0x6d
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM623
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM624
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM625
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM626
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM627
	.byte	0x3
	.sleb128 -38
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM628
	.byte	0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM629
	.byte	0x45
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM630
	.byte	0x3
	.sleb128 -316
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM631
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM632
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM633
	.byte	0x3
	.sleb128 1231
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM634
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM635
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM636
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM637
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM638
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM639
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -1028
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM640
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 1030
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM641
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM642
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM643
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM644
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -1036
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM645
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 1039
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM646
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM647
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM648
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -1043
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM649
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 1046
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM650
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM651
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM652
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM653
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM654
	.byte	0x11
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM655
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM656
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -1057
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM657
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 1060
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM658
	.byte	0x3
	.sleb128 -76
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM659
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM660
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM661
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM662
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM663
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM664
	.byte	0x1e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM665
	.byte	0x1d
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM666
	.byte	0x3
	.sleb128 -18
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM667
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM668
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM669
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM670
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM671
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM672
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM673
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM674
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM675
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM676
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM677
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM678
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM679
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM680
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM681
	.byte	0x3
	.sleb128 -25
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM682
	.byte	0x31
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM683
	.byte	0x3
	.sleb128 -102
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM684
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM685
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM686
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM687
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM688
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM689
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM690
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM691
	.byte	0x3
	.sleb128 -51
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM692
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM693
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM694
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM695
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM696
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM697
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM698
	.byte	0xe
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM699
	.byte	0x22
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM700
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM701
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM702
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM703
	.byte	0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM704
	.byte	0x1e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM705
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM706
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM707
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM708
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM709
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM710
	.byte	0xc
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM711
	.byte	0x1e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM712
	.byte	0x3
	.sleb128 -70
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM713
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM714
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM715
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM716
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM717
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM718
	.byte	0xe
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM719
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM720
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM721
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM722
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM723
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -809
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM724
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 810
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM725
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM726
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM727
	.byte	0x3
	.sleb128 -14
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM728
	.byte	0x25
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM729
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -870
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM730
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 874
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM731
	.byte	0x3
	.sleb128 -97
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM732
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM733
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM734
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM735
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM736
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM737
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM738
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM739
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -645
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM740
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 653
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM741
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM742
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM743
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM744
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM745
	.byte	0xb
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM746
	.byte	0x20
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM747
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM748
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM749
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -666
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM750
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 675
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM751
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM752
	.byte	0x10
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM753
	.byte	0x1d
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM754
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM755
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM756
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM757
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM758
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM759
	.byte	0x3
	.sleb128 -12
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM760
	.byte	0x23
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM761
	.byte	0x3
	.sleb128 -142
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM762
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM763
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM764
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM765
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM766
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM767
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM768
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM769
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM770
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM771
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM772
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -568
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM773
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 570
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM774
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM775
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM776
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM777
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM778
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -579
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM779
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 583
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM780
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM781
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -586
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM782
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 590
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM783
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM784
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -591
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM785
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 593
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM786
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -593
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM787
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 600
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM788
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM789
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM790
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM791
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM792
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM793
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM794
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM795
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM796
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM797
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM798
	.byte	0xe
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM799
	.byte	0x1d
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM800
	.byte	0x3
	.sleb128 -302
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM801
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM802
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM803
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM804
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM805
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM806
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM807
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM808
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM809
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM810
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM811
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM812
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM813
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM814
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM815
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM816
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM817
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM818
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM819
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM820
	.byte	0x1d
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM821
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM822
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM823
	.byte	0x12
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM824
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM825
	.byte	0x3
	.sleb128 -54
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM826
	.byte	0x4b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM827
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM828
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM829
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM830
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM831
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM832
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM833
	.byte	0xa
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM834
	.byte	0x21
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM835
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM836
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM837
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM838
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM839
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM840
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM841
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM842
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM843
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM844
	.byte	0x3
	.sleb128 -215
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM845
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM846
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM847
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM848
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM849
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM850
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM851
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM852
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM853
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM854
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM855
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM856
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM857
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM858
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -207
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM859
	.byte	0x4
	.uleb128 0x1
	.byte	0xe8
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM860
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM861
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM862
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM863
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM864
	.byte	0xe
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM865
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM866
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM867
	.byte	0x3
	.sleb128 -137
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM868
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM869
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM870
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM871
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM872
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM873
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM874
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM875
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM876
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM877
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM878
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM879
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM880
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM881
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM882
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM883
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM884
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM885
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM886
	.byte	0x21
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM887
	.byte	0x1f
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM888
	.byte	0x3
	.sleb128 -20
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM889
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM890
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM891
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM892
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM893
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM894
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM895
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM896
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM897
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM898
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM899
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM900
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM901
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM902
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM903
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM904
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM905
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -302
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM906
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 304
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM907
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM908
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM909
	.byte	0x1a
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM910
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -259
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM911
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 263
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM912
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -263
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM913
	.byte	0x4
	.uleb128 0x1
	.byte	0xf4
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM914
	.byte	0x41
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM915
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM916
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -270
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM917
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 270
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM918
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM919
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM920
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -273
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM921
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 274
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM922
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM923
	.byte	0x3
	.sleb128 -377
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM924
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM925
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM926
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM927
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM928
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM929
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM930
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM931
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM932
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM933
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM934
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM935
	.byte	0x1e
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM936
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM937
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM938
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM939
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM940
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM941
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM942
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM943
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM944
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM945
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM946
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM947
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM948
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM949
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM950
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM951
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM952
	.byte	0x3
	.sleb128 -20
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM953
	.byte	0x2c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM954
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM955
	.byte	0x3
	.sleb128 -106
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM956
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM957
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM958
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM959
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM960
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM961
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM962
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM963
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM964
	.byte	0x11
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM965
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM966
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM967
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM968
	.byte	0x11
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM969
	.byte	0x19
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM970
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM971
	.byte	0x4
	.uleb128 0x2
	.byte	0x61
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM972
	.byte	0x4
	.uleb128 0x1
	.byte	0x3
	.sleb128 -56
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM973
	.byte	0x3
	.sleb128 -19
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM974
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM975
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM976
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM977
	.byte	0x23
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM978
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM979
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM980
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM981
	.byte	0xf
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM982
	.byte	0x1c
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM983
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM984
	.byte	0xb3
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM985
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM986
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM987
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM988
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM989
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM990
	.byte	0x23
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM991
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM992
	.byte	0x1b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM993
	.byte	0x3
	.sleb128 -21
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM994
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM995
	.byte	0x22
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM996
	.byte	0x1f
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM997
	.byte	0x10
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM998
	.byte	0x3
	.sleb128 -14
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM999
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1000
	.byte	0xa
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1001
	.byte	0x13
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1002
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1003
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1004
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1005
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1006
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1007
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1008
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -132
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1009
	.byte	0x4
	.uleb128 0x1
	.byte	0x9b
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1010
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1011
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1012
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1013
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -139
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1014
	.byte	0x4
	.uleb128 0x1
	.byte	0xa0
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1015
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1016
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1017
	.byte	0x17
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1018
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1019
	.byte	0x4
	.uleb128 0x2
	.byte	0x3
	.sleb128 -146
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1020
	.byte	0x4
	.uleb128 0x1
	.byte	0xa8
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1021
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1022
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1023
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1024
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1025
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1026
	.byte	0x16
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1027
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1028
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1029
	.byte	0x18
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1030
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1031
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1032
	.byte	0x15
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1033
	.byte	0x3
	.sleb128 -44
	.byte	0x1
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.LM1034
	.byte	0x45
	.byte	0x0
	.uleb128 0x5
	.byte	0x2
	.long	.Letext0
	.byte	0x0
	.uleb128 0x1
	.byte	0x1
.LELT0:
	.section	.debug_str,"MS",@progbits,1
.LASF143:
	.string	"__addr16"
.LASF86:
	.string	"curve"
.LASF40:
	.string	"srcChn"
.LASF14:
	.string	"prog_uint8_t"
.LASF78:
	.string	"revert"
.LASF136:
	.string	"checkIncDecModVar<-0x00000000000000064, 100>"
.LASF67:
	.string	"expNorm"
.LASF177:
	.string	"chan"
.LASF242:
	.string	"_Z14menuProcSetup0h"
.LASF41:
	.string	"swtch"
.LASF44:
	.string	"TrainerData1"
.LASF330:
	.string	"_Z11setupPulsesv"
.LASF184:
	.string	"phase"
.LASF286:
	.string	"pulses2MHz"
.LASF69:
	.string	"drSw"
.LASF30:
	.string	"SW_ThrCt"
.LASF153:
	.string	"checkIncDecModVar<0, 3>"
.LASF37:
	.string	"SW_Gear"
.LASF97:
	.string	"thrTrim"
.LASF138:
	.string	"flags"
.LASF195:
	.string	"timerend"
.LASF235:
	.string	"_Z15menuProcExpoAllh"
.LASF107:
	.string	"ModelData"
.LASF272:
	.string	"maxSel"
.LASF6:
	.string	"unsigned int"
.LASF297:
	.string	"menuTabModel"
.LASF232:
	.string	"menuProcModel"
.LASF325:
	.string	"/home/erez/Desktop/er9x/er9x/OBJS"
.LASF324:
	.string	"../src/menus.cpp"
.LASF230:
	.string	"mstate2"
.LASF63:
	.string	"warnOpts"
.LASF127:
	.string	"_send_hilo"
.LASF73:
	.string	"t_TrimData"
.LASF141:
	.string	"min<unsigned char>"
.LASF36:
	.string	"SW_AileDR"
.LASF125:
	.string	"check"
.LASF146:
	.string	"checkIncDecModVar<0, 4>"
.LASF45:
	.string	"t_TrainerData1"
.LASF94:
	.string	"tmrVal"
.LASF326:
	.string	"EnumKeys"
.LASF95:
	.string	"protocol"
.LASF134:
	.string	"min<signed char>"
.LASF227:
	.string	"menuProcTrainer"
.LASF31:
	.string	"SW_RuddDR"
.LASF22:
	.string	"TRM_LH_DWN"
.LASF237:
	.string	"menuProcLimits"
.LASF43:
	.string	"mode"
.LASF251:
	.string	"_Z15menuProcDiagAnah"
.LASF214:
	.string	"_Z12editExpoValshhbhhh"
.LASF295:
	.string	"anaCalib"
.LASF151:
	.string	"checkIncDecModVar<20, 45>"
.LASF165:
	.string	"trace"
.LASF284:
	.string	"g_beepCnt"
.LASF217:
	.string	"invBlk"
.LASF75:
	.string	"trimDef"
.LASF194:
	.string	"speed"
.LASF101:
	.string	"trimData"
.LASF319:
	.string	"g_timeMain"
.LASF161:
	.string	"s_cnt"
.LASF210:
	.string	"vert"
.LASF126:
	.string	"_beep"
.LASF52:
	.string	"calibMid"
.LASF0:
	.string	"int8_t"
.LASF193:
	.string	"diff"
.LASF327:
	.string	"_ZN7MState25eventE"
.LASF281:
	.string	"g_vbat100mV"
.LASF132:
	.string	"min<int>"
.LASF32:
	.string	"SW_ElevDR"
.LASF137:
	.string	"event"
.LASF197:
	.string	"chans"
.LASF234:
	.string	"menuProcExpoAll"
.LASF71:
	.string	"expSwWeight"
.LASF4:
	.string	"int16_t"
.LASF254:
	.string	"midVals"
.LASF47:
	.string	"calib"
.LASF112:
	.string	"m_tab"
.LASF247:
	.string	"_Z16menuProcDiagVersh"
.LASF11:
	.string	"long long unsigned int"
.LASF65:
	.string	"EEGeneral"
.LASF148:
	.string	"checkIncDecModVar<-0x0000000000000000a, 10>"
.LASF60:
	.string	"lightSw"
.LASF24:
	.string	"TRM_LV_DWN"
.LASF226:
	.string	"attr"
.LASF124:
	.string	"editIdx"
.LASF80:
	.string	"LimitData"
.LASF211:
	.string	"menuProcStatistic2"
.LASF18:
	.string	"KEY_DOWN"
.LASF222:
	.string	"horTab"
.LASF150:
	.string	"checkIncDecModVar<-0x0000000000000007d, 125>"
.LASF118:
	.string	"showCh"
.LASF20:
	.string	"KEY_RIGHT"
.LASF289:
	.string	"stamp1"
.LASF290:
	.string	"stamp2"
.LASF291:
	.string	"stamp3"
.LASF292:
	.string	"stamp4"
.LASF54:
	.string	"calibSpanPos"
.LASF39:
	.string	"MenuFuncP"
.LASF99:
	.string	"tcutSW"
.LASF246:
	.string	"menuProcDiagVers"
.LASF268:
	.string	"menuProcMix"
.LASF110:
	.string	"m_posVert"
.LASF61:
	.string	"trainer"
.LASF212:
	.string	"_Z18menuProcStatistic2h"
.LASF79:
	.string	"offset"
.LASF147:
	.string	"checkIncDecModVar<0, 1>"
.LASF114:
	.string	"check_v"
.LASF57:
	.string	"contrast"
.LASF216:
	.string	"edit"
.LASF274:
	.string	"menuProcCurveOne"
.LASF90:
	.string	"t_ModelData"
.LASF158:
	.string	"_Z5expoujj"
.LASF267:
	.string	"_Z12menuProcTrimh"
.LASF250:
	.string	"menuProcDiagAna"
.LASF322:
	.string	"pulses2MHzPtr"
.LASF70:
	.string	"expNormWeight"
.LASF205:
	.string	"_Z17menuProcStatistich"
.LASF121:
	.string	"selCh"
.LASF269:
	.string	"_Z11menuProcMixh"
.LASF223:
	.string	"horTabMax"
.LASF320:
	.string	"s_cacheLimitsMin"
.LASF49:
	.string	"TrainerData"
.LASF263:
	.string	"wView"
.LASF317:
	.string	"g_tmr1Latency_max"
.LASF196:
	.string	"anas"
.LASF100:
	.string	"mixData"
.LASF135:
	.string	"max<signed char>"
.LASF192:
	.string	"vStud"
.LASF220:
	.string	"menuTab"
.LASF329:
	.string	"setupPulses"
.LASF307:
	.string	"s_charTab"
.LASF178:
	.string	"sendBitTra"
.LASF189:
	.string	"chanOut"
.LASF119:
	.string	"hasDat"
.LASF145:
	.string	"idx2char"
.LASF252:
	.string	"menuProcDiagCalib"
.LASF106:
	.string	"char"
.LASF128:
	.string	"sendBitSilv"
.LASF208:
	.string	"_Z9menuProc0h"
.LASF249:
	.string	"_Z16menuProcDiagKeysh"
.LASF248:
	.string	"menuProcDiagKeys"
.LASF305:
	.string	"s_mixMaxSel"
.LASF187:
	.string	"perOut"
.LASF64:
	.string	"stickMode"
.LASF303:
	.string	"s_currMixInsMode"
.LASF233:
	.string	"_Z13menuProcModelh"
.LASF38:
	.string	"SW_Trainer"
.LASF204:
	.string	"menuProcStatistic"
.LASF155:
	.string	"checkIncDecModVar<0, 19>"
.LASF102:
	.string	"limitData"
.LASF168:
	.string	"intpol"
.LASF1:
	.string	"uint8_t"
.LASF140:
	.string	"checkIncDecModVar<0, 10>"
.LASF88:
	.string	"speedDown"
.LASF277:
	.string	"dfltCrv"
.LASF299:
	.string	"s_curveChan"
.LASF261:
	.string	"_Z15menuProcExpoOneh"
.LASF245:
	.string	"bits"
.LASF76:
	.string	"TrimData"
.LASF163:
	.string	"last_tmr"
.LASF10:
	.string	"long long int"
.LASF256:
	.string	"menuProcModelSelect"
.LASF104:
	.string	"curves5"
.LASF17:
	.string	"KEY_EXIT"
.LASF111:
	.string	"m_posHorz"
.LASF105:
	.string	"curves9"
.LASF83:
	.string	"srcRaw"
.LASF309:
	.string	"s_timeCumAbs"
.LASF203:
	.string	"mtIdx"
.LASF50:
	.string	"t_EEGeneral"
.LASF15:
	.string	"bool"
.LASF66:
	.string	"t_ExpoData"
.LASF152:
	.string	"checkIncDecModVar<50, 100>"
.LASF180:
	.string	"sendByteTra"
.LASF115:
	.string	"_ZN7MState24initEv"
.LASF209:
	.string	"s_lastPopMenu"
.LASF154:
	.string	"checkIncDecModVar<-0x0000000000000007f, 127>"
.LASF117:
	.string	"MixTab"
.LASF293:
	.string	"g_eeGeneral"
.LASF77:
	.string	"t_LimitData"
.LASF89:
	.string	"MixData"
.LASF224:
	.string	"maxrow"
.LASF257:
	.string	"_Z19menuProcModelSelecth"
.LASF265:
	.string	"y512"
.LASF313:
	.string	"s_timerVal"
.LASF202:
	.string	"maxDst"
.LASF96:
	.string	"ppmNCH"
.LASF201:
	.string	"_Z9genMixTabv"
.LASF93:
	.string	"tmrMode"
.LASF229:
	.string	"subSub"
.LASF12:
	.string	"prog_char"
.LASF200:
	.string	"genMixTab"
.LASF188:
	.string	"_Z6perOutPi"
.LASF258:
	.string	"subOld"
.LASF225:
	.string	"maxcol"
.LASF142:
	.string	"char2idx"
.LASF103:
	.string	"expoData"
.LASF244:
	.string	"_Z14menuProcSetup1h"
.LASF19:
	.string	"KEY_UP"
.LASF74:
	.string	"trim"
.LASF51:
	.string	"myVers"
.LASF53:
	.string	"calibSpanNeg"
.LASF231:
	.string	"mstate_tab"
.LASF262:
	.string	"kView"
.LASF59:
	.string	"vBatCalib"
.LASF215:
	.string	"which"
.LASF266:
	.string	"menuProcTrim"
.LASF304:
	.string	"s_mixTab"
.LASF46:
	.string	"t_TrainerData"
.LASF55:
	.string	"chkSum"
.LASF207:
	.string	"menuProc0"
.LASF5:
	.string	"uint16_t"
.LASF199:
	.string	"tmr_t"
.LASF238:
	.string	"_Z14menuProcLimitsh"
.LASF218:
	.string	"this"
.LASF240:
	.string	"s_pgOfs"
.LASF275:
	.string	"_Z13menuProcCurveh"
.LASF133:
	.string	"calcLimitCache"
.LASF144:
	.string	"__result"
.LASF241:
	.string	"menuProcSetup0"
.LASF243:
	.string	"menuProcSetup1"
.LASF171:
	.string	"_Z14setupPulsesPPMv"
.LASF58:
	.string	"vBatWarn"
.LASF29:
	.string	"TRM_RH_UP"
.LASF259:
	.string	"s_editMode"
.LASF255:
	.string	"lowVals"
.LASF296:
	.string	"sticks"
.LASF298:
	.string	"menuTabDiag"
.LASF282:
	.string	"g_tmr10ms"
.LASF122:
	.string	"selDat"
.LASF315:
	.string	"s_traceWr"
.LASF219:
	.string	"curr"
.LASF8:
	.string	"long int"
.LASF166:
	.string	"_Z5timerh"
.LASF273:
	.string	"menuProcCurve"
.LASF123:
	.string	"insIdx"
.LASF312:
	.string	"s_timerState"
.LASF33:
	.string	"SW_ID0"
.LASF34:
	.string	"SW_ID1"
.LASF35:
	.string	"SW_ID2"
.LASF169:
	.string	"_Z6intpolih"
.LASF228:
	.string	"_Z15menuProcTrainerh"
.LASF56:
	.string	"currModel"
.LASF170:
	.string	"setupPulsesPPM"
.LASF167:
	.string	"_Z5traceh"
.LASF82:
	.string	"destCh"
.LASF98:
	.string	"trimInc"
.LASF27:
	.string	"TRM_RV_UP"
.LASF323:
	.string	"GNU C++ 4.3.4"
.LASF84:
	.string	"carryTrim"
.LASF328:
	.string	"_ZN7MState25checkEhhPPFvhEhPhhh"
.LASF175:
	.string	"setupPulsesSilver"
.LASF287:
	.string	"g_ppmIns"
.LASF23:
	.string	"TRM_LH_UP"
.LASF91:
	.string	"name"
.LASF28:
	.string	"TRM_RH_DWN"
.LASF72:
	.string	"ExpoData"
.LASF276:
	.string	"_Z16menuProcCurveOneh"
.LASF130:
	.string	"max<int>"
.LASF198:
	.string	"dlt_t"
.LASF113:
	.string	"init"
.LASF182:
	.string	"setupPulsesTracerCtp1009"
.LASF9:
	.string	"long unsigned int"
.LASF278:
	.string	"menuProcMixOne"
.LASF7:
	.string	"int32_t"
.LASF156:
	.string	"expou"
.LASF316:
	.string	"s_traceCnt"
.LASF21:
	.string	"KEY_LEFT"
.LASF190:
	.string	"trimA"
.LASF120:
	.string	"chId"
.LASF13:
	.string	"prog_uchar"
.LASF311:
	.string	"s_timeCum16ThrP"
.LASF310:
	.string	"s_timeCumThr"
.LASF48:
	.string	"chanMix"
.LASF25:
	.string	"TRM_LV_UP"
.LASF3:
	.string	"unsigned char"
.LASF236:
	.string	"subHor"
.LASF160:
	.string	"s_time"
.LASF116:
	.string	"_ZN7MState27check_vEhhPPFvhEhh"
.LASF42:
	.string	"studWeight"
.LASF306:
	.string	"s_expoChan"
.LASF176:
	.string	"_Z17setupPulsesSilverv"
.LASF314:
	.string	"s_traceBuf"
.LASF321:
	.string	"s_cacheLimitsMax"
.LASF191:
	.string	"chStud"
.LASF87:
	.string	"speedUp"
.LASF129:
	.string	"min<unsigned int>"
.LASF181:
	.string	"_Z11sendByteTrah"
.LASF81:
	.string	"t_MixData"
.LASF109:
	.string	"MState2"
.LASF174:
	.string	"_Z13send2BitsSilvh"
.LASF26:
	.string	"TRM_RV_DWN"
.LASF302:
	.string	"s_currDestCh"
.LASF179:
	.string	"_Z10sendBitTrah"
.LASF285:
	.string	"g_beepVal"
.LASF157:
	.string	"expo"
.LASF318:
	.string	"g_tmr1Latency_min"
.LASF288:
	.string	"g_chans512"
.LASF294:
	.string	"g_model"
.LASF213:
	.string	"editExpoVals"
.LASF260:
	.string	"menuProcExpoOne"
.LASF2:
	.string	"signed char"
.LASF16:
	.string	"KEY_MENU"
.LASF108:
	.string	"MenuFuncP_PROGMEM"
.LASF301:
	.string	"s_currMixIdx"
.LASF92:
	.string	"mdVers"
.LASF185:
	.string	"get_calibrated_stick"
.LASF183:
	.string	"_Z24setupPulsesTracerCtp1009v"
.LASF85:
	.string	"weight"
.LASF62:
	.string	"view"
.LASF308:
	.string	"s_timeCumTot"
.LASF280:
	.string	"checkIncDec_Ret"
.LASF186:
	.string	"_Z20get_calibrated_stickh"
.LASF271:
	.string	"minSel"
.LASF300:
	.string	"s_limitCacheOk"
.LASF159:
	.string	"_Z4expoii"
.LASF172:
	.string	"rest"
.LASF131:
	.string	"abs<int>"
.LASF253:
	.string	"_Z17menuProcDiagCalibh"
.LASF279:
	.string	"_Z14menuProcMixOneh"
.LASF164:
	.string	"timer"
.LASF221:
	.string	"menuTabSize"
.LASF162:
	.string	"s_sum"
.LASF139:
	.string	"checkIncDecModVar<-0x00000000000000064, 0>"
.LASF264:
	.string	"x512"
.LASF270:
	.string	"markedIdx"
.LASF206:
	.string	"traceRd"
.LASF68:
	.string	"expDr"
.LASF173:
	.string	"send2BitsSilv"
.LASF149:
	.string	"checkIncDecModVar<-0x000000000000001f4, 500>"
.LASF283:
	.string	"g_blinkTmr10ms"
.LASF239:
	.string	"swVal"

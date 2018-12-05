	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	r0, #16
	mov	lr, #70
	mov	r1, #20
	mov	ip, #3
	ldr	r3, .L4
	str	lr, [r3]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	ip, [r3, #40]
	str	r1, [r3, #8]
	str	r1, [r3, #4]
	str	r2, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #28]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L34
	ldr	r3, [r2, #28]
	cmp	r3, #4
	ldr	r1, [r2, #24]
	push	{r4, r5, lr}
	strne	r3, [r2, #32]
	ldr	r3, .L34+4
	smull	r4, r5, r1, r3
	asr	r3, r1, #31
	rsb	r3, r3, r5, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r1, r3, lsl #2
	bne	.L8
	ldr	r0, [r2, #36]
	cmp	r0, #0
	moveq	r3, #1
	streq	r3, [r2, #36]
	bne	.L32
.L8:
	ldr	r3, .L34+8
	ldrh	r0, [r3]
	ldr	ip, .L34+12
	tst	r0, #64
	ldr	r3, [ip]
	beq	.L11
	ldr	lr, .L34+16
	ldrh	lr, [lr]
	tst	lr, #64
	bne	.L11
	ldr	lr, [r2]
	cmp	lr, #70
	ble	.L11
	mvn	ip, #19
	mov	r4, #1
	add	lr, lr, ip
	str	lr, [r2]
	str	r4, [r2, #28]
	str	ip, [r2, #8]
	b	.L12
.L11:
	tst	r0, #128
	bne	.L33
.L13:
	mov	r4, #2
	mov	lr, #3
	add	r3, r3, #1
	str	r3, [ip]
	str	r4, [r2, #28]
	str	lr, [r2, #12]
.L12:
	tst	r0, #1
	beq	.L14
	ldr	ip, .L34+16
	ldrh	ip, [ip]
	tst	ip, #1
	moveq	lr, #1
	ldreq	ip, .L34+20
	streq	lr, [ip]
.L14:
	tst	r0, #2
	beq	.L15
	ldr	r0, .L34+16
	ldrh	r0, [r0]
	tst	r0, #2
	moveq	ip, #1
	ldreq	r0, .L34+24
	streq	ip, [r0]
.L15:
	mov	ip, #67108864
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	lsl	r0, r3, #17
	add	r1, r1, #1
	lsr	r0, r0, #16
	str	r1, [r2, #24]
	pop	{r4, r5, lr}
	strh	r0, [ip, #20]	@ movhi
	strh	r3, [ip, #16]	@ movhi
	bx	lr
.L33:
	ldr	lr, .L34+16
	ldrh	lr, [lr]
	ands	lr, lr, #128
	bne	.L13
	ldr	r4, [r2]
	cmp	r4, #129
	bgt	.L13
	mov	ip, #20
	add	r4, r4, ip
	str	r4, [r2]
	str	lr, [r2, #28]
	str	ip, [r2, #8]
	b	.L12
.L32:
	cmp	r0, #1
	moveq	r3, #2
	streq	r3, [r2, #36]
	beq	.L8
	cmp	r0, #2
	streq	r3, [r2, #36]
	b	.L8
.L35:
	.align	2
.L34:
	.word	player
	.word	1717986919
	.word	oldButtons
	.word	hOff
	.word	buttons
	.word	cheat
	.word	sauce
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L41
	ldr	r3, [r3]
	cmp	r3, #0
	str	lr, [sp, #-4]!
	bne	.L37
	ldr	r1, .L41+4
	ldr	r0, [r1, #36]
	ldr	r2, [r1, #28]
	ldr	ip, [r1, #4]
	add	r2, r2, r0, lsl #5
	ldr	lr, [r1]
	ldr	r0, .L41+8
	lsl	r2, r2, #1
	orr	r1, ip, #16384
	strh	r2, [r0, #4]	@ movhi
	strh	lr, [r0]	@ movhi
	strh	r1, [r0, #2]	@ movhi
.L37:
	ldr	r2, .L41+12
	ldr	r2, [r2]
	cmp	r2, #1
	bne	.L38
	ldr	r1, .L41+4
	ldr	r0, [r1, #36]
	ldr	r2, [r1, #28]
	ldr	ip, [r1, #4]
	add	r2, r2, r0, lsl #5
	ldr	lr, [r1]
	ldr	r0, .L41+8
	lsl	r2, r2, #1
	orr	r1, ip, #16384
	strh	r2, [r0, #4]	@ movhi
	strh	lr, [r0]	@ movhi
	strh	r1, [r0, #2]	@ movhi
.L38:
	cmp	r3, #1
	bne	.L36
	ldr	r0, .L41+4
	ldr	r3, [r0, #36]
	ldr	r1, [r0, #4]
	ldr	r2, .L41+8
	lsl	r3, r3, #6
	ldr	r0, [r0]
	add	r3, r3, #8
	orr	r1, r1, #16384
	strh	r3, [r2, #4]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #2]	@ movhi
.L36:
	ldr	lr, [sp], #4
	bx	lr
.L42:
	.align	2
.L41:
	.word	cheat
	.word	player
	.word	shadowOAM
	.word	sauce
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initSnakes
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSnakes, %function
initSnakes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #70
	mov	lr, #240
	mov	r0, #16
	mov	r1, #1
	ldr	r3, .L47
	add	ip, r3, #260
.L44:
	str	r2, [r3, #48]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r1, [r3, #40]
	str	r1, [r3, #12]
	str	r2, [r3, #44]
	stm	r3, {r4, lr}
	add	r3, r3, #52
	cmp	r3, ip
	bne	.L44
	pop	{r4, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	snakes
	.size	initSnakes, .-initSnakes
	.align	2
	.global	spawnSnakes
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnSnakes, %function
spawnSnakes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	add	r5, r0, r0, lsl #1
	ldr	r4, .L67
	add	r0, r0, r5, lsl #2
	ldr	r6, .L67+4
	ldr	r8, .L67+8
	ldr	r7, .L67+12
	add	r5, r4, r0, lsl #2
.L55:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L51
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L52
.L51:
	mov	lr, pc
	bx	r6
	smull	fp, ip, r0, r8
	asr	r2, r0, #31
	rsb	r3, r2, ip, asr #1
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3
	add	r0, r0, r0, lsl #2
	lsl	r0, r0, #2
	add	r0, r0, #70
	cmp	r0, #130
	movgt	r3, #70
	strle	r0, [r4]
	strgt	r3, [r4]
	mov	lr, pc
	bx	r6
	mov	r1, #0
	mov	ip, #1
	smull	r10, fp, r0, r7
	asr	r2, r0, #31
	add	r3, r0, fp
	rsb	r3, r2, r3, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	add	r0, r0, #240
	str	r0, [r4, #4]
	str	ip, [r4, #48]
	str	r1, [r4, #44]
	str	r1, [r4, #36]
	str	r1, [r4, #24]
.L52:
	add	r4, r4, #52
	cmp	r4, r5
	bne	.L55
	pop	{r4, r5, r6, r7, r8, r10, fp, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	snakes
	.word	rand
	.word	1717986919
	.word	-2004318071
	.size	spawnSnakes, .-spawnSnakes
	.align	2
	.global	updateSnakes
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSnakes, %function
updateSnakes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	mov	r6, #5
	ldr	r4, .L104
	ldr	r8, .L104+4
	ldr	r10, .L104+8
	ldr	r9, .L104+12
	ldr	fp, .L104+16
	sub	sp, sp, #20
.L84:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L70
	ldr	r3, [r4, #24]
	smull	r0, r1, r3, r8
	asr	r2, r3, #31
	rsb	r1, r2, r1, asr #1
	add	r1, r1, r1, lsl #2
	cmp	r3, r1
	ldrne	r1, [r4, #4]
	ldrne	r0, [r4, #12]
	subne	r1, r1, r0
	strne	r1, [r4, #4]
	smull	r0, r1, r3, r8
	rsb	r2, r2, r1, asr #3
	add	r2, r2, r2, lsl #2
	subs	r2, r3, r2, lsl #2
	bne	.L73
	ldr	r1, [r4, #28]
	adds	r1, r1, #1
	moveq	r2, #1
	streq	r2, [r4, #28]
	beq	.L73
	cmp	r1, #4
	moveq	r1, r2
	str	r1, [r4, #28]
.L73:
	ldr	r7, [r10]
	cmp	r7, #0
	beq	.L100
	cmp	r7, #1
	beq	.L101
	ldr	r2, [r4, #48]
	cmp	r2, #0
	beq	.L70
.L83:
	add	r5, r5, #1
	add	r3, r3, #1
	cmp	r5, r6
	str	r3, [r4, #24]
	add	r4, r4, #52
	blt	.L84
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L101:
	add	ip, r9, #16
	ldm	ip, {ip, lr}
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r9, #4]
	ldr	ip, [r9]
	ldm	r4, {r0, r1}
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	beq	.L82
	mov	r3, #0
	str	r7, [r4, #44]
	str	r3, [r4, #48]
	sub	r6, r6, #1
.L70:
	mov	r0, r6
	bl	spawnSnakes
.L99:
	ldr	r3, [r4, #24]
	b	.L83
.L100:
	add	ip, r9, #16
	ldm	ip, {ip, lr}
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r9, #4]
	ldr	ip, [r9]
	ldm	r4, {r0, r1}
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	bne	.L102
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L103
.L79:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L70
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L99
	b	.L70
.L102:
	mov	lr, #1
	ldr	r3, .L104+20
	ldr	ip, [r3]
	str	r7, [r4, #48]
	mov	r3, r7
	ldr	r7, .L104+20
	sub	ip, ip, #1
	str	ip, [r7]
	ldr	r2, .L104+24
	ldr	r1, .L104+28
	ldr	r0, .L104+32
	ldr	r7, .L104+36
	str	lr, [r4, #44]
	sub	r6, r6, #1
	mov	lr, pc
	bx	r7
	b	.L79
.L103:
	mov	r3, #1
	str	r0, [r4, #48]
	sub	r6, r6, #1
	str	r3, [r4, #44]
	b	.L70
.L82:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	strle	r7, [r4, #44]
	strle	r0, [r4, #48]
	suble	r6, r6, #1
	bgt	.L79
	b	.L70
.L105:
	.align	2
.L104:
	.word	snakes
	.word	1717986919
	.word	cheat
	.word	player
	.word	collision
	.word	lives
	.word	44100
	.word	81232
	.word	hiss
	.word	playSoundB
	.size	updateSnakes, .-updateSnakes
	.align	2
	.global	drawSnakes
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSnakes, %function
drawSnakes:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #512
	ldr	r3, .L112
	ldr	r2, .L112+4
	add	ip, r3, #260
.L109:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	strhne	r4, [r2, #80]	@ movhi
	bne	.L108
	ldr	r1, [r3, #28]
	ldr	r0, [r3, #4]
	add	r1, r1, #96
	lsl	r1, r1, #1
	ldr	lr, [r3]
	orr	r1, r1, #8192
	orr	r0, r0, #16384
	strh	r1, [r2, #84]	@ movhi
	strh	r0, [r2, #82]	@ movhi
	strh	lr, [r2, #80]	@ movhi
.L108:
	add	r3, r3, #52
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L109
	pop	{r4, lr}
	bx	lr
.L113:
	.align	2
.L112:
	.word	snakes
	.word	shadowOAM
	.size	drawSnakes, .-drawSnakes
	.align	2
	.global	initRockets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRockets, %function
initRockets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r1, #16
	mov	r4, #70
	mov	lr, #240
	mov	ip, #1
	mov	r0, #3
	ldr	r3, .L116
	str	r4, [r3]
	str	r4, [r3, #52]
	str	lr, [r3, #4]
	str	lr, [r3, #56]
	str	r2, [r3, #48]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r2, [r3, #44]
	str	r2, [r3, #100]
	str	r2, [r3, #76]
	str	r2, [r3, #88]
	str	r2, [r3, #96]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	str	r1, [r3, #68]
	str	r1, [r3, #72]
	str	ip, [r3, #40]
	str	ip, [r3, #92]
	str	r0, [r3, #12]
	str	r0, [r3, #64]
	pop	{r4, lr}
	bx	lr
.L117:
	.align	2
.L116:
	.word	rockets
	.size	initRockets, .-initRockets
	.align	2
	.global	spawnRockets
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnRockets, %function
spawnRockets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	subs	r8, r0, #0
	ble	.L118
	mov	r5, #0
	mov	fp, #1
	mov	r7, r5
	ldr	r4, .L131
	ldr	r6, .L131+4
	ldr	r10, .L131+8
	ldr	r9, .L131+12
.L122:
	ldr	r2, [r4, #48]
	cmp	r2, #0
	add	r5, r5, #1
	beq	.L120
	ldr	r2, [r4, #44]
	cmp	r2, #0
	beq	.L121
.L120:
	mov	lr, pc
	bx	r6
	smull	r2, r3, r0, r10
	asr	r1, r0, #31
	rsb	r2, r1, r3, asr #1
	add	r2, r2, r2, lsl #2
	sub	r0, r0, r2
	add	r0, r0, r0, lsl #2
	lsl	r0, r0, #2
	add	r0, r0, #70
	str	r0, [r4]
	mov	lr, pc
	bx	r6
	smull	r2, r3, r0, r9
	asr	r1, r0, #31
	add	r2, r0, r3
	rsb	r2, r1, r2, asr #7
	rsb	r2, r2, r2, lsl #4
	sub	r0, r0, r2, lsl #4
	add	r0, r0, #240
	str	fp, [r4, #48]
	str	r7, [r4, #44]
	str	r7, [r4, #36]
	str	r7, [r4, #24]
	str	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	ldr	r1, .L131+16
	smull	r2, r3, r0, r1
	sub	r2, r3, r0, asr #31
	add	r2, r2, r2, lsl #1
	sub	r0, r0, r2
	str	r0, [r4, #28]
.L121:
	cmp	r8, r5
	add	r4, r4, #52
	bne	.L122
.L118:
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L132:
	.align	2
.L131:
	.word	rockets
	.word	rand
	.word	1717986919
	.word	-2004318071
	.word	1431655766
	.size	spawnRockets, .-spawnRockets
	.align	2
	.global	updateRockets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateRockets, %function
updateRockets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	ldr	r4, .L161
	ldr	r9, .L161+4
	ldr	r7, .L161+8
	ldr	r8, .L161+12
	ldr	r10, .L161+16
	sub	sp, sp, #20
.L142:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L143
	ldr	r2, [r4, #24]
	smull	r0, r1, r2, r9
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #1
	add	r3, r3, r3, lsl #2
	cmp	r2, r3
	ldrne	r3, [r4, #12]
	ldr	r1, [r4, #4]
	ldr	fp, [r8]
	add	r0, r7, #16
	ldm	r0, {r0, r2}
	subne	r1, r1, r3
	ldm	r7, {ip, lr}
	strne	r1, [r4, #4]
	cmp	fp, #0
	str	r2, [sp, #12]
	str	r0, [sp, #8]
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #16]
	ldr	r0, [r4]
	stm	sp, {ip, lr}
	bne	.L136
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	bne	.L160
.L140:
	ldr	r3, [r4, #4]
	cmp	r3, #0
	movle	r3, #1
	strle	r0, [r4, #48]
	strle	r3, [r4, #44]
	ble	.L139
	mov	r6, #2
.L138:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L134
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L141
	b	.L134
.L143:
	mov	r6, #2
.L134:
	mov	r0, r6
	bl	spawnRockets
.L141:
	ldr	r3, [r4, #24]
	add	r5, r5, #1
	cmp	r5, r6
	add	r3, r3, #1
	str	r3, [r4, #24]
	mov	r5, #1
	add	r4, r4, #52
	blt	.L142
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L136:
	mov	lr, pc
	bx	r10
	cmp	r0, #0
	beq	.L140
	mov	r2, #1
	mov	r3, #0
	str	r2, [r4, #44]
	str	r3, [r4, #48]
.L139:
	mov	r6, #1
	b	.L134
.L160:
	mov	r6, #1
	ldr	lr, .L161+20
	ldr	ip, [lr]
	mov	r3, fp
	sub	ip, ip, #1
	str	fp, [r4, #48]
	ldr	r2, .L161+24
	ldr	r1, .L161+28
	ldr	r0, .L161+32
	ldr	fp, .L161+36
	str	r6, [r4, #44]
	str	ip, [lr]
	mov	lr, pc
	bx	fp
	b	.L138
.L162:
	.align	2
.L161:
	.word	rockets
	.word	1717986919
	.word	player
	.word	cheat
	.word	collision
	.word	lives
	.word	11025
	.word	1889
	.word	thud
	.word	playSoundB
	.size	updateRockets, .-updateRockets
	.align	2
	.global	drawRockets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawRockets, %function
drawRockets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L169
	ldr	r2, [r3, #44]
	cmp	r2, #0
	beq	.L164
	mov	r1, #512
	ldr	r2, .L169+4
	strh	r1, [r2, #160]	@ movhi
	ldr	r1, [r3, #96]
	cmp	r1, #0
	bne	.L168
.L166:
	ldr	r1, [r3, #80]
	ldr	r0, [r3, #56]
	add	r1, r1, #128
	lsl	r1, r1, #1
	ldr	ip, [r3, #52]
	orr	r3, r1, #4096
	orr	r1, r0, #16384
	strh	r3, [r2, #172]	@ movhi
	strh	r1, [r2, #170]	@ movhi
	strh	ip, [r2, #168]	@ movhi
	bx	lr
.L168:
	mov	r3, #512
	strh	r3, [r2, #168]	@ movhi
	bx	lr
.L164:
	ldr	r1, [r3, #28]
	add	r1, r1, #128
	ldr	r2, .L169+4
	lsl	r1, r1, #1
	orr	r1, r1, #4096
	ldr	r0, [r3, #4]
	strh	r1, [r2, #164]	@ movhi
	ldr	r1, [r3, #96]
	ldr	ip, [r3]
	orr	r0, r0, #16384
	cmp	r1, #0
	strh	ip, [r2, #160]	@ movhi
	strh	r0, [r2, #162]	@ movhi
	beq	.L166
	b	.L168
.L170:
	.align	2
.L169:
	.word	rockets
	.word	shadowOAM
	.size	drawRockets, .-drawRockets
	.align	2
	.global	initCoins
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCoins, %function
initCoins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #70
	mov	lr, #240
	mov	r0, #16
	mov	r1, #1
	ldr	r3, .L175
	add	ip, r3, #260
.L172:
	str	r2, [r3, #48]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	r1, [r3, #40]
	str	r1, [r3, #12]
	str	r2, [r3, #44]
	stm	r3, {r4, lr}
	add	r3, r3, #52
	cmp	r3, ip
	bne	.L172
	pop	{r4, lr}
	bx	lr
.L176:
	.align	2
.L175:
	.word	coins
	.size	initCoins, .-initCoins
	.align	2
	.global	spawnCoins
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnCoins, %function
spawnCoins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r0, #0
	bxle	lr
	push	{r4, r5, r6, r7, r8, r10, fp, lr}
	add	r5, r0, r0, lsl #1
	ldr	r4, .L193
	add	r0, r0, r5, lsl #2
	ldr	r6, .L193+4
	ldr	r8, .L193+8
	ldr	r7, .L193+12
	add	r5, r4, r0, lsl #2
.L181:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L179
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L180
.L179:
	mov	lr, pc
	bx	r6
	smull	fp, ip, r0, r8
	asr	r2, r0, #31
	rsb	r3, r2, ip, asr #1
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3
	add	r0, r0, r0, lsl #2
	lsl	r0, r0, #2
	add	r0, r0, #70
	str	r0, [r4]
	mov	lr, pc
	bx	r6
	mov	r1, #0
	mov	ip, #1
	smull	r10, fp, r0, r7
	asr	r2, r0, #31
	add	r3, r0, fp
	rsb	r3, r2, r3, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r0, r0, r3, lsl #4
	add	r0, r0, #240
	str	r0, [r4, #4]
	str	ip, [r4, #48]
	str	r1, [r4, #44]
	str	r1, [r4, #36]
	str	r1, [r4, #24]
.L180:
	add	r4, r4, #52
	cmp	r4, r5
	bne	.L181
	pop	{r4, r5, r6, r7, r8, r10, fp, lr}
	bx	lr
.L194:
	.align	2
.L193:
	.word	coins
	.word	rand
	.word	1717986919
	.word	-2004318071
	.size	spawnCoins, .-spawnCoins
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r4, #16
	mov	r8, #70
	mov	r1, #0
	mov	r0, #20
	mov	r5, #3
	mov	r9, #100
	mov	ip, r4
	mov	r7, r8
	mov	r6, #240
	mov	lr, #1
	ldr	r3, .L201
	str	r1, [r3]
	ldr	r3, .L201+4
	str	r1, [r3]
	ldr	r3, .L201+8
	mov	r2, r1
	str	r1, [r3, #12]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	r1, [r3, #28]
	str	r8, [r3]
	ldr	r1, .L201+12
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r0, [r3, #8]
	str	r0, [r3, #4]
	str	r5, [r3, #40]
	ldr	r3, .L201+16
	str	r0, [r1]
	str	r5, [r3]
	ldr	r1, .L201+20
	ldr	r3, .L201+24
	str	r9, [r1]
	add	r1, r3, #260
.L196:
	str	r7, [r3]
	str	r6, [r3, #4]
	str	r2, [r3, #48]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	str	lr, [r3, #40]
	str	lr, [r3, #12]
	str	r2, [r3, #44]
	add	r3, r3, #52
	cmp	r3, r1
	bne	.L196
	mov	r3, #3
	mov	r9, #70
	mov	r8, #240
	mov	r1, #0
	mov	r5, #16
	mov	r4, #1
	ldr	r0, .L201+28
	str	r3, [r0, #12]
	str	r3, [r0, #64]
	ldr	r3, .L201+32
	str	r7, [r0]
	str	r6, [r0, #4]
	str	ip, [r0, #16]
	str	ip, [r0, #20]
	str	lr, [r0, #40]
	str	r7, [r0, #52]
	str	r6, [r0, #56]
	str	ip, [r0, #68]
	str	ip, [r0, #72]
	str	lr, [r0, #92]
	str	r2, [r0, #48]
	str	r2, [r0, #24]
	str	r2, [r0, #36]
	str	r2, [r0, #44]
	str	r2, [r0, #100]
	str	r2, [r0, #76]
	str	r2, [r0, #88]
	str	r2, [r0, #96]
	add	r2, r3, #260
.L197:
	str	r9, [r3]
	str	r8, [r3, #4]
	str	r1, [r3, #48]
	str	r5, [r3, #16]
	str	r5, [r3, #20]
	str	r1, [r3, #24]
	str	r1, [r3, #36]
	str	r4, [r3, #40]
	str	r4, [r3, #12]
	str	r1, [r3, #44]
	add	r3, r3, #52
	cmp	r2, r3
	bne	.L197
	mov	r0, #5
	bl	spawnSnakes
	mov	r0, #2
	bl	spawnRockets
	mov	r0, #5
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	spawnCoins
.L202:
	.align	2
.L201:
	.word	cheat
	.word	sauce
	.word	player
	.word	hOff
	.word	lives
	.word	vOff
	.word	snakes
	.word	rockets
	.word	coins
	.size	initGame, .-initGame
	.align	2
	.global	updateCoins
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCoins, %function
updateCoins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r5, #0
	mov	r7, #5
	ldr	r4, .L229
	ldr	r8, .L229+4
	ldr	r6, .L229+8
	ldr	r9, .L229+12
	ldr	r10, .L229+16
	ldr	fp, .L229+20
	sub	sp, sp, #20
.L215:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L204
	ldr	r0, [r4, #24]
	smull	r2, r3, r0, r8
	asr	ip, r0, #31
	rsb	r3, ip, r3, asr #1
	add	r3, r3, r3, lsl #2
	cmp	r0, r3
	ldrne	r3, [r4, #12]
	ldr	r1, [r4, #4]
	subne	r1, r1, r3
	smull	r2, r3, r0, r8
	rsb	r3, ip, r3, asr #3
	add	r3, r3, r3, lsl #2
	strne	r1, [r4, #4]
	subs	r3, r0, r3, lsl #2
	bne	.L207
	ldr	r0, [r4, #28]
	adds	r0, r0, #1
	moveq	r3, #1
	streq	r3, [r4, #28]
	beq	.L207
	cmp	r0, #7
	moveq	r0, r3
	str	r0, [r4, #28]
.L207:
	add	ip, r6, #16
	ldm	ip, {ip, lr}
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r6, #4]
	ldr	ip, [r6]
	ldr	r0, [r4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L227
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L228
.L212:
	ldr	r3, [r4, #48]
	cmp	r3, #0
	beq	.L213
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L214
.L213:
	mov	r0, r7
	bl	spawnCoins
.L214:
	ldr	r3, [r4, #24]
	add	r3, r3, #1
	str	r3, [r4, #24]
.L204:
	add	r5, r5, #1
	cmp	r7, r5
	add	r4, r4, #52
	bgt	.L215
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L227:
	mov	ip, #1
	mov	r0, #0
	ldr	r1, [r10]
	add	r1, r1, ip
	mov	r3, r0
	str	r1, [r10]
	str	r0, [r4, #48]
	str	ip, [r4, #44]
	ldr	r2, .L229+24
	ldr	r1, .L229+28
	mov	r0, fp
	ldr	ip, .L229+32
	sub	r7, r7, #1
	mov	lr, pc
	bx	ip
	b	.L212
.L228:
	mov	r3, #1
	str	r0, [r4, #48]
	sub	r7, r7, #1
	str	r3, [r4, #44]
	b	.L213
.L230:
	.align	2
.L229:
	.word	coins
	.word	1717986919
	.word	player
	.word	collision
	.word	score
	.word	rupee
	.word	11025
	.word	3316
	.word	playSoundB
	.size	updateCoins, .-updateCoins
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	updatePlayer
	ldr	r4, .L233
	bl	updateSnakes
	bl	updateRockets
	bl	updateCoins
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L233+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L234:
	.align	2
.L233:
	.word	DMANow
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.align	2
	.global	drawCoins
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCoins, %function
drawCoins:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #512
	ldr	r3, .L241
	ldr	r2, .L241+4
	add	ip, r3, #260
.L238:
	ldr	r1, [r3, #44]
	cmp	r1, #0
	strhne	r4, [r2, #240]	@ movhi
	bne	.L237
	ldr	r1, [r3, #28]
	ldr	r0, [r3, #4]
	add	r1, r1, #160
	lsl	r1, r1, #1
	ldr	lr, [r3]
	orr	r1, r1, #12288
	orr	r0, r0, #16384
	strh	r1, [r2, #244]	@ movhi
	strh	r0, [r2, #242]	@ movhi
	strh	lr, [r2, #240]	@ movhi
.L237:
	add	r3, r3, #52
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L238
	pop	{r4, lr}
	bx	lr
.L242:
	.align	2
.L241:
	.word	coins
	.word	shadowOAM
	.size	drawCoins, .-drawCoins
	.global	__aeabi_idivmod
	.global	__aeabi_idiv
	.align	2
	.global	drawScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawScore, %function
drawScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L256
	ldr	r4, [r3]
	cmp	r4, #9
	sub	sp, sp, #8
	bgt	.L244
	mov	r1, #2
	ldr	r3, .L256+4
	smull	r6, r7, r4, r3
	asr	r3, r4, #31
	rsb	r3, r3, r7, asr r1
	add	r3, r3, r3, lsl r1
	sub	r4, r4, r3, lsl #1
	add	r4, r4, #192
	ldr	r3, .L256+8
	ldr	r2, .L256+12
	lsl	r4, r4, #1
	strh	r4, [r3, #4]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
.L243:
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L244:
	cmp	r4, #99
	ble	.L253
	cmp	r4, #1000
	blt	.L254
	ldr	r3, .L256+16
	cmp	r4, r3
	ble	.L255
	mov	ip, #2
	ldr	r3, .L256+4
	smull	r0, r1, r4, r3
	asr	r3, r4, #31
	rsb	r2, r3, r1, asr ip
	ldr	r0, .L256+12
	ldr	r1, .L256+8
	strh	r0, [r1, #2]	@ movhi
	mov	r0, #5
	add	r2, r2, r2, lsl ip
	sub	r2, r4, r2, lsl #1
	add	r2, r2, #192
	lsl	r2, r2, #1
	strh	r2, [r1, #4]	@ movhi
	strh	ip, [r1]	@ movhi
.L248:
	mov	ip, #2
	ldr	r1, .L256+4
	ldr	r2, .L256+20
	smull	r8, r9, r4, r1
	smull	r6, r7, r4, r2
	ldr	r2, .L256+24
	mov	r5, r2
	rsb	r10, r3, r9, asr ip
	rsb	lr, r3, r7, asr #5
	smull	r6, r7, r10, r1
	smull	r8, r9, lr, r1
	stm	sp, {r6-r7}
	ldr	r7, [sp, #4]
	asr	r6, r10, #31
	rsb	r6, r6, r7, asr ip
	add	r6, r6, r6, lsl ip
	sub	r10, r10, r6, lsl #1
	asr	r6, lr, #31
	rsb	r6, r6, r9, asr ip
	add	r6, r6, r6, lsl ip
	sub	lr, lr, r6, lsl #1
	add	r10, r10, #192
	add	lr, lr, #192
	strh	ip, [r5, #8]!	@ movhi
	ldr	r7, .L256+28
	ldr	r6, .L256+32
	lsl	r10, r10, #1
	lsl	lr, lr, #1
	cmp	r0, #3
	strh	r10, [r2, #4]	@ movhi
	strh	r7, [r2, #2]	@ movhi
	strh	lr, [r2, #12]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r6, [r5, #2]	@ movhi
	beq	.L243
	ldr	lr, .L256+36
	smull	r6, r7, r4, lr
	mov	r5, r2
	rsb	lr, r3, r7, asr #6
	smull	r7, r8, lr, r1
	asr	r6, lr, #31
	rsb	r6, r6, r8, asr #2
	add	r6, r6, r6, lsl #2
	sub	lr, lr, r6, lsl #1
	add	lr, lr, #192
	strh	ip, [r5, #16]!	@ movhi
	ldr	r6, .L256+40
	lsl	lr, lr, #1
	cmp	r0, #5
	strh	lr, [r2, #20]	@ movhi
	strh	r6, [r5, #2]	@ movhi
	bne	.L243
	ldr	r0, .L256+44
	smull	r6, r7, r4, r0
	mov	r0, r2
	rsb	r3, r3, r7, asr #12
	smull	r4, r5, r3, r1
	asr	r1, r3, #31
	rsb	r1, r1, r5, asr #2
	add	r1, r1, r1, lsl #2
	sub	r3, r3, r1, lsl #1
	strh	ip, [r0, #24]!	@ movhi
	ldr	r1, .L256+48
	add	r3, r3, #192
	lsl	r3, r3, #1
	strh	r3, [r2, #28]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	add	sp, sp, #8
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L253:
	mov	r6, #2
	ldr	r5, .L256+8
	ldr	r2, .L256+12
	ldr	r3, .L256+52
	strh	r2, [r5, #2]	@ movhi
	mov	r1, #10
	mov	r0, r4
	strh	r6, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, r5
	ldr	lr, .L256+28
	strh	r6, [r2, #8]!	@ movhi
	add	r3, r1, #192
	lsl	r3, r3, #1
	strh	lr, [r2, #2]	@ movhi
	strh	r3, [r5, #4]	@ movhi
	mov	r0, r4
	ldr	r2, .L256+56
	mov	r1, #10
	mov	lr, pc
	bx	r2
	add	r3, r0, #192
	lsl	r3, r3, #1
	strh	r3, [r5, #12]	@ movhi
	b	.L243
.L255:
	mov	r0, #2
	ldr	r3, .L256+8
	ldr	ip, .L256+12
	strh	r0, [r3]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	ldr	r2, .L256+52
	mov	r1, #10
	mov	r0, r4
	add	r5, r3, #4
	mov	lr, pc
	bx	r2
	add	r3, r1, #192
	lsl	r3, r3, #1
	strh	r3, [r5]	@ movhi
	mov	r0, #4
	asr	r3, r4, #31
	b	.L248
.L254:
	mov	r0, #2
	ldr	r3, .L256+8
	ldr	ip, .L256+12
	strh	r0, [r3]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	ldr	r2, .L256+52
	mov	r1, #10
	mov	r0, r4
	add	r5, r3, #4
	mov	lr, pc
	bx	r2
	add	r3, r1, #192
	lsl	r3, r3, #1
	strh	r3, [r5]	@ movhi
	mov	r0, #3
	asr	r3, r4, #31
	b	.L248
.L257:
	.align	2
.L256:
	.word	score
	.word	1717986919
	.word	shadowOAM+320
	.word	16604
	.word	9999
	.word	1374389535
	.word	shadowOAM+328
	.word	16594
	.word	16584
	.word	274877907
	.word	16574
	.word	1759218605
	.word	16564
	.word	__aeabi_idivmod
	.word	__aeabi_idiv
	.size	drawScore, .-drawScore
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L265
	push	{r4, lr}
	ldr	r4, [r3]
	cmp	r4, #0
	ble	.L259
	mov	lr, #2
	ldr	r2, .L265+4
	lsl	r3, r4, #16
	ldr	ip, .L265+8
	add	r0, r2, r4, lsl #3
	lsr	r3, r3, #16
.L260:
	orr	r1, r3, #16384
	strh	lr, [r2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	strh	r1, [r2, #2]	@ movhi
	add	r3, r3, #20
	add	r2, r2, #8
	lsl	r3, r3, #16
	cmp	r2, r0
	lsr	r3, r3, #16
	bne	.L260
	cmp	r4, #2
	beq	.L264
.L259:
	cmp	r4, #1
	moveq	r2, #512
	ldreq	r3, .L265+12
	pop	{r4, lr}
	strheq	r2, [r3]	@ movhi
	bx	lr
.L264:
	mov	r2, #512
	ldr	r3, .L265+16
	pop	{r4, lr}
	strh	r2, [r3]	@ movhi
	bx	lr
.L266:
	.align	2
.L265:
	.word	lives
	.word	shadowOAM+360
	.word	16832
	.word	shadowOAM+368
	.word	shadowOAM+376
	.size	drawLives, .-drawLives
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	drawPlayer
	bl	drawSnakes
	bl	drawRockets
	bl	drawCoins
	bl	drawScore
	pop	{r4, lr}
	b	drawLives
	.size	drawGame, .-drawGame
	.comm	sauce,4,4
	.comm	cheat,4,4
	.comm	lives,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	score,4,4
	.comm	coins,260,4
	.comm	rockets,104,4
	.comm	snakes,260,4
	.comm	shadowOAM,1024,4
	.comm	player,52,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"

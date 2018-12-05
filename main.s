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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, #16384
	ldr	r6, .L4
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r6
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r6
	mov	r5, #67108864
	mov	r3, #256
	mov	r4, #0
	strh	r3, [r5]	@ movhi
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	ldr	r7, .L4+24
	ldr	r2, .L4+28
	ldr	r1, .L4+32
	ldr	r0, .L4+36
	mov	r3, #1
	mov	lr, pc
	bx	r7
	strh	r4, [r5, #16]	@ movhi
	ldr	r3, .L4+40
	strh	r4, [r5, #18]	@ movhi
	strh	r4, [r5, #20]	@ movhi
	strh	r4, [r5, #22]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+44
	mov	lr, pc
	bx	r3
	mov	r3, #480
	mov	r2, #117440512
	ldr	r1, .L4+48
	mov	r0, #3
	mov	lr, pc
	bx	r6
	ldr	r2, .L4+52
	ldr	r3, .L4+56
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	100696064
	.word	startTiles
	.word	100724736
	.word	startMap
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	673344
	.word	bg
	.word	waitForVBlank
	.word	hideSprites
	.word	shadowOAM
	.word	seed
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	mov	r4, #67108864
	mov	r2, #4864
	mov	r3, #256
	strh	r2, [r4]	@ movhi
	ldr	r1, .L8+8
	mov	r2, #83886080
	mov	r0, #3
	ldr	r5, .L8+12
	mov	lr, pc
	bx	r5
	mov	r3, #23808
	mov	r2, #0
	ldr	r1, .L8+16
	strh	r3, [r4, #10]	@ movhi
	strh	r1, [r4, #8]	@ movhi
	ldr	r3, .L8+20
	ldr	r1, .L8+24
	ldrh	r0, [r3, #48]
	ldr	r3, .L8+28
	pop	{r4, r5, r6, lr}
	strh	r0, [r1]	@ movhi
	str	r2, [r3]
	b	goToStart
.L9:
	.align	2
.L8:
	.word	setupSounds
	.word	setupInterrupts
	.word	startPal
	.word	DMANow
	.word	24072
	.word	67109120
	.word	buttons
	.word	.LANCHOR0
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	ip, #0
	mov	r4, #67108864
	ldr	r5, .L12
	strh	ip, [r4, #16]	@ movhi
	mov	r3, #16384
	strh	ip, [r4, #18]	@ movhi
	ldr	r2, .L12+4
	strh	ip, [r4, #20]	@ movhi
	ldr	r1, .L12+8
	strh	ip, [r4, #22]	@ movhi
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #2048
	ldr	r2, .L12+12
	ldr	r1, .L12+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r1, #4352
	mov	r2, #2
	ldr	r3, .L12+20
	strh	r1, [r4]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	100696064
	.word	instructionsTiles
	.word	100724736
	.word	instructionsMap
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #32768
	ldr	r4, .L16
	mov	r2, #100663296
	ldr	r1, .L16+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L16+8
	ldr	r1, .L16+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #32768
	ldr	r2, .L16+16
	ldr	r1, .L16+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L16+24
	ldr	r1, .L16+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L16+32
	ldr	r1, .L16+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #16384
	ldr	r2, .L16+40
	ldr	r1, .L16+44
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r1, #4864
	ldr	r3, .L16+48
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L16+52
	mov	lr, pc
	bx	r3
	mov	r3, #480
	mov	r2, #117440512
	ldr	r1, .L16+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L16+60
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	DMANow
	.word	backgroundTiles
	.word	100722688
	.word	backgroundMap
	.word	100696064
	.word	foregroundTiles
	.word	100724736
	.word	foregroundMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	waitForVBlank
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L30
	ldr	r3, [r4]
	ldr	r5, .L30+4
	add	r3, r3, #1
	ldr	r2, .L30+8
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L19
	ldr	r2, .L30+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L28
.L19:
	tst	r3, #4
	beq	.L18
	ldr	r3, .L30+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L29
.L18:
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L28:
	ldr	r0, [r4]
	ldr	r3, .L30+16
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L30+20
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	b	.L19
.L31:
	.align	2
.L30:
	.word	seed
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L39
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L32
	ldr	r3, .L39+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L38
.L32:
	pop	{r4, lr}
	bx	lr
.L38:
	bl	goToGame
	ldr	r3, .L39+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	instructions, .-instructions
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	mov	r1, #4352
	push	{r4, lr}
	strh	r2, [r3, #16]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r1, .L43
	strh	r2, [r3, #20]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	mov	lr, pc
	bx	r1
	ldr	r3, .L43+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L43+8
	mov	r3, #16384
	ldr	r2, .L43+12
	ldr	r1, .L43+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L43+20
	ldr	r1, .L43+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L43+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L44:
	.align	2
.L43:
	.word	waitForVBlank
	.word	hideSprites
	.word	DMANow
	.word	100696064
	.word	pauseTiles
	.word	100724736
	.word	pauseMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L55
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L46
	ldr	r2, .L55+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L54
.L46:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L55+4
	ldrh	r3, [r3]
	tst	r3, #4
	bxne	lr
	b	goToStart
.L54:
	b	goToGame
.L56:
	.align	2
.L55:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #0
	mov	r0, #67108864
	mov	r3, #4352
	push	{r4, lr}
	ldr	r2, .L59
	strh	ip, [r0, #16]	@ movhi
	strh	r3, [r0]	@ movhi
	strh	ip, [r0, #18]	@ movhi
	ldr	r4, .L59+4
	strh	ip, [r0, #20]	@ movhi
	mov	r3, #16384
	strh	ip, [r0, #22]	@ movhi
	ldr	r1, .L59+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L59+12
	ldr	r1, .L59+16
	mov	r0, #3
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L59+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L59+24
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L59+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L60:
	.align	2
.L59:
	.word	100696064
	.word	DMANow
	.word	loseTiles
	.word	100724736
	.word	loseMap
	.word	waitForVBlank
	.word	hideSprites
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L69
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L69+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L62
	ldr	r3, .L69+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L68
.L62:
	ldr	r3, .L69+20
	ldr	r3, [r3]
	cmp	r3, #0
	bleq	goToLose
.L63:
	ldr	r4, .L69+24
	mov	r3, #480
	mov	r2, #117440512
	ldr	r1, .L69+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L68:
	bl	goToPause
	b	.L62
.L70:
	.align	2
.L69:
	.word	drawGame
	.word	waitForVBlank
	.word	updateGame
	.word	oldButtons
	.word	buttons
	.word	lives
	.word	DMANow
	.word	shadowOAM
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L85
	mov	lr, pc
	bx	r3
	ldr	r4, .L85+4
	ldr	r9, .L85+8
	ldr	r8, .L85+12
	ldr	fp, .L85+16
	ldr	r10, .L85+20
	ldr	r6, .L85+24
	ldr	r7, .L85+28
	ldr	r5, .L85+32
.L79:
	ldrh	r1, [r4]
	strh	r1, [r9]	@ movhi
	ldr	r2, [r8]
	ldrh	r3, [r7, #48]
	strh	r3, [r4]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L72
.L74:
	.word	.L73
	.word	.L75
	.word	.L76
	.word	.L77
	.word	.L78
.L78:
	tst	r1, #8
	bne	.L84
.L72:
	mov	r3, #512
	mov	r2, #117440512
	mov	r1, r5
	mov	r0, #3
	mov	lr, pc
	bx	r6
	b	.L79
.L77:
	ldr	r3, .L85+36
	mov	lr, pc
	bx	r3
	b	.L72
.L76:
	mov	lr, pc
	bx	r10
	b	.L72
.L73:
	mov	lr, pc
	bx	fp
	b	.L72
.L75:
	ldr	r3, .L85+40
	mov	lr, pc
	bx	r3
	b	.L72
.L84:
	tst	r3, #8
	bne	.L72
	ldr	r3, .L85+44
	mov	lr, pc
	bx	r3
	b	.L72
.L86:
	.align	2
.L85:
	.word	initialize
	.word	buttons
	.word	oldButtons
	.word	state
	.word	start
	.word	instructions
	.word	DMANow
	.word	67109120
	.word	shadowOAM
	.word	pause
	.word	game
	.word	goToStart
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L92
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L92+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L93:
	.align	2
.L92:
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	shadowOAM,1024,4
	.global	vOff
	.global	hOff
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 47) 7.1.0"

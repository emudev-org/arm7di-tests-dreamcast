@ STM: STMIA!

.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000

.align 3
var64:		.word 0x11223344,0x55667788

rdVal:		.word 0
rnVal:		.word 0
memVal:		.word 0

.align 2
exceptionFlag: .word 0

romvar:  	.byte 0x80,0,0,0
romvar2: 	.byte 0x00,0x8f,0,0xff
romvar3: 	.byte 0x80,0x7f,0,0

.global start
start:
	mov 	r1,#0
	ldr 	r3,=(VARBASE+0x200)
	mov 	r4,#5
	stmia 	r3!,{r3,r4,r5}
	ldr 	r0,=(VARBASE+0x20C)
	cmp 	r3,r0
	orrne 	r1,r1,#BAD_Rn
	ldrne 	r5,=rnVal
	strne 	r3,[r5]
	sub 	r0,r0,#0xC
	ldr 	r2,[r0]
	cmp 	r2,r0
	orrne 	r1,r1,#0x80
	ldrne	r4,=memVal
	strne	r0,[r4] @r2,[r4]
	ldr 	r3,=(VARBASE+0x200)
	mov 	r4,#5
	stmia 	r3!,{r2,r3,r4}
	ldr 	r0,=(VARBASE+0x20C)
	cmp 	r3,r0
	orrne 	r1,r1,#BAD_Rn
	ldrne 	r5,=rnVal
	strne 	r3,[r5]
	ldr 	r0,=(VARBASE+0x208)
	ldr	r2,[r0]
	cmp	r4,r2
	@orrne	r1,r1,#0x80
	@ldrne	r0,=memVal
	@strne	r2,[r0]
	@ldr 	r0,=(VARBASE+0x204)
	@ldr 	r2,[r0]
	@ldr	r3,=(VARBASE+0x20C)
	@cmp 	r3,r2
	@orrne 	r1,r1,#0x80
	@ldrne	r0,=memVal
	@strne	r2,[r0]
	mov 	r2,#1
	orr 	r1,r1,#0x40000000

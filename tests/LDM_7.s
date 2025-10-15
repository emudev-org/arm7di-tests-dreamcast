@ LDM: LDMDBS!

.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000
	mov	r0, #0xd2	@ Switch to IRQ mode (XXX: keep irqs disabled)
	msr	cpsr, r0
	mov	r1,#0
	mov	r14,#123
	ldr	r0,=var64+8
	ldmdb	r0!,{r3,r14}^
	ldr	r2,=var64
	cmp	r0,r2
	orrne	r1,r1,#BAD_Rn
	ldrne 	r5,=rnVal
	strne 	r0,[r5]
	ldr	r2,[r2]
	cmp	r2,r3
	orrne	r1,r1,#BAD_Rd
	cmp	r14,#123
	orrne	r1,r1,#BAD_Rd
	mov 	r2,#6
	mov	r0, #0xd3	@ Switch to supervisor mode (XXX was system mode)
	msr	cpsr, r0
	orr 	r1,r1,#0x40000000
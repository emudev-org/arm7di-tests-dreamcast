@ LDM: LDMIB!

.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000
	mov 	r1,#0
	ldr 	r3,=var64
	sub 	r3,r3,#4
	ldmib 	r3!,{r4,r5}
	ldr 	r0,=var64+4
	cmp 	r3,r0
	orrne 	r1,r1,#BAD_Rn
	mov 	r4,#5
	@ Test writeback for when the base register is included in the
	@ register list.
	ldr 	r3,=var64
	sub 	r3,r3,#4
	ldmib 	r3!,{r2,r3}
	ldr 	r0,=var64+4
	mov 	r5,r2
	ldr 	r2,[r0]
	cmp 	r3,r2
	orrne 	r1,r1,#BAD_Rn
	ldrne 	r2,=rnVal
	strne 	r3,[r2]
	ldr 	r3,=var64
	sub 	r3,r3,#4
	ldmib 	r3!,{r3,r5}
	ldr 	r2,=var64+4
	ldr r2, [r2, #-4]
	cmp 	r3,r2
	orrne 	r1,r1,#BAD_Rn
	ldrne 	r2,=rnVal
	strne 	r3,[r2]
	ldr 	r2,[r0]
	cmp 	r5,r2
	orrne 	r1,r1,#BAD_Rd
	cmp 	r4,#5
	orrne 	r1,r1,#BAD_Rd
	mov 	r2,#0
	orr 	r1,r1,#0x40000000
@ LDRB: +#]!

.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000
	mov 	r1,#0
	ldr 	r0,=romvar2
	add 	r3,r0,#2
	sub 	r2,r0,#3
	ldrb 	r0,[r0,#3]!
	cmp 	r0,#0xff
	orrne 	r1,r1,#BAD_Rd
	ldrb 	r0,[r2,#5]!
	cmp 	r0,#0
	orrne 	r1,r1,#BAD_Rd
	cmp 	r2,r3
	orrne 	r1,r1,#BAD_Rn
	mov 	r2,#2
	orr 	r1,r1,#0x80000000
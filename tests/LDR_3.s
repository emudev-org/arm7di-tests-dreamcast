@ LDR: +#]!

.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000
	mov 	r1,#0
	ldr 	r0,=romvar
	sub 	r2,r0,#3
	mov 	r3,r0
	ldr 	r0,[r0,#0]!
	cmp 	r0,#0x80
	orrne 	r1,r1,#BAD_Rd
	ldr 	r0,[r2,#3]!
	cmp 	r0,#0x80
	orrne 	r1,r1,#BAD_Rd
	cmp 	r2,r3
	orrne 	r1,r1,#BAD_Rn
	@ Test non word-aligned load
	ldr 	r0,=romvar2
	ldr 	r0,[r0,#2]!
	ldr 	r2,=0x8f00ff00
	cmp 	r0,r2
	orrne 	r1,r1,#BAD_Rd
	mov 	r2,#2
	orr 	r1,r1,#0x80000000
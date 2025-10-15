@ LDR: -#]

.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000
	mov 	r1,#0
	ldr 	r0,=romvar
	mov 	r2,r0
	mov 	r3,r2
	add 	r0,r0,#206
	ldr 	r0,[r0,#-206]
	cmp 	r0,#0x80
	orrne 	r1,r1,#BAD_Rd
	ldr 	r0,[r2,#-0]
	cmp 	r0,#0x80
	orrne 	r1,r1,#BAD_Rd
	cmp 	r2,r3
	orrne 	r1,r1,#BAD_Rn
	@ Test non word-aligned load
	ldr 	r0,=romvar2+4
	ldr 	r0,[r0,#-2]
	ldr 	r2,=0x8f00ff00
	cmp 	r0,r2
	orrne 	r1,r1,#BAD_Rd
	mov 	r2,#1
	orr 	r1,r1,#0x80000000
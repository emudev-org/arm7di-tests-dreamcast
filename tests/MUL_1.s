@ MUL

.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000
	mov 	r1,#0
	ldr 	r2,=0xFFFFFFF6
	mov 	r3,#0x14
	ldr 	r4,=0xFFFFFF38
	muls 	r2,r3,r2
	orrpl 	r1,r1,#2
	orreq 	r1,r1,#8
	cmp 	r2,r4
	orrne 	r1,r1,#16
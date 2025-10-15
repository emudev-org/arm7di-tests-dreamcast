@ CMN

.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000
	mov 	r1,#0
	adds 	r9,r9,r9 @ clear carry
	ldr 	r2,=0x7FFFFFFF
	ldr 	r3,=0x70000000
	cmns 	r2,r3
	orrcs 	r1,r1,#1
	orrpl 	r1,r1,#2
	orrvc 	r1,r1,#4
	orreq 	r1,r1,#8
	ldr 	r3,=0x7FFFFFFF
	cmp 	r2,r3
	orrne 	r1,r1,#16
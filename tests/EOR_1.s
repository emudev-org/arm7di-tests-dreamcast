@ EOR

.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000
	mov 	r1,#0
	mov 	r2,#1
	mov 	r3,#3
	eors 	r2,r2,r3,lsl#31
	eors 	r2,r2,r3,lsl#0
	orrcc 	r1,r1,#1
	orrpl 	r1,r1,#2
	orreq 	r1,r1,#8
	ldr 	r4,=0x80000002
	cmp 	r4,r2
	orrne 	r1,r1,#BAD_Rd
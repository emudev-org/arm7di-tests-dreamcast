@ SBC

.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000
	mov 	r1,#0
	ldr 	r2,=0xFFFFFFFF
	adds 	r3,r2,r2	@ set carry
	sbcs 	r2,r2,r2
	orrcc 	r1,r1,#1
	orrmi 	r1,r1,#2
	orrne 	r1,r1,#8
	adds 	r9,r9,r9	@ clear carry
	sbcs 	r2,r2,#0
	orreq 	r1,r1,#8
	orrcs 	r1,r1,#1
	orrpl 	r1,r1,#2
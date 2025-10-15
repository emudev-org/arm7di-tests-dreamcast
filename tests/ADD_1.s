@ ADD

.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000
	mov 	r1,#0
	ldr 	r2,=0xFFFFFFFE
	mov 	r3,#1
	adds 	r2,r2,r3
	orrcs 	r1,r1,#1
	orrpl 	r1,r1,#2
	orrvs 	r1,r1,#4
	orreq 	r1,r1,#8
	adds 	r2,r2,r3	
	orrcc 	r1,r1,#1
	orrmi 	r1,r1,#2
	orrvs 	r1,r1,#4
	orrne 	r1,r1,#8
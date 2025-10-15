@ ORR

.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000
	mov 	r1,#0
	mov 	r2,#2
	mov 	r3,#3
	movs 	r4,r3,lsr#1	@ set carry 
	orrs 	r3,r3,r2,rrx
	orrcs 	r1,r1,#1
	orrpl 	r1,r1,#2
	orreq 	r1,r1,#8
	ldr 	r4,=0x80000003
	cmp 	r4,r3
	orrne 	r1,r1,#BAD_Rd
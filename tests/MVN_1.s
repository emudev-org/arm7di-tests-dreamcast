@ MVN

.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000
	mov 	r1,#0
	ldr 	r2,=labelthree	
	ldr 	r3,=0xFFFFFFFF
	eor 	r2,r2,r3
	mvn 	r3,r15
	cmp 	r3,r2
labelthree:	
	orrne 	r1,r1,#BAD_Rd
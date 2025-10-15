@ SWP

.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000
	mov 	r1,#0
	adds 	r1,r1,#1		@ Clear C,N,V,Z
	mov 	r1,#0
	ldr 	r5,=(VARBASE+0x100)
	str 	r1,[r5]
	mov 	r0,#0xC0000000
	swp 	r0,r0,[r5]
	orrcs 	r1,r1,#1
	orrmi 	r1,r1,#2
	orrvs 	r1,r1,#4
	orreq 	r1,r1,#8
	cmp 	r0,#0
	orrne 	r1,r1,#BAD_Rd
	ldr 	r0,[r5]
	cmp 	r0,#0xC0000000
	orrne 	r1,r1,#BAD_Rd
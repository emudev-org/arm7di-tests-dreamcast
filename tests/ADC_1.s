@ ADC

.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000
	mov 	r1,#0
	mov 	r2,#0x80000000
	mov 	r3,#0xF
	adds 	r9,r9,r9	@ clear carry
	adcs 	r2,r2,r3
	orrcs 	r1,r1,#1
	orrpl 	r1,r1,#2
	orrvs 	r1,r1,#4
	orreq 	r1,r1,#8
	adcs 	r2,r2,r2	
	orrcc 	r1,r1,#1
	orrmi 	r1,r1,#2
	adc 	r3,r3,r3
	cmp 	r3,#0x1F
	orrne 	r1,r1,#BAD_Rd
	adds 	r9,r9,r9	@ clear carry
	mov 	r0,#0
	mov 	r2,#1
	adc 	r0,r0,r2,lsr#1
	cmp 	r0,#1
	@orrne 	r1,r1,#BAD_Rd
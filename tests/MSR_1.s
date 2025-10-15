@ MSR

.equ BAD_Rd,	0x10
.equ BAD_Rn,	0x20
.equ VARBASE,	0x80000
	mov 	r1,#0
	movs 	r2,#0
	msr 	cpsr_flg,#0x90000000
	orrcs 	r1,r1,#1
	orrpl 	r1,r1,#2
	orrvc 	r1,r1,#4
	orreq 	r1,r1,#8
	mov 	r11,#1
	mrs 	r2,cpsr
	bic 	r2,r2,#0x1f
	orr 	r2,r2,#0x11	
	msr 	cpsr,r2		@ Set FIQ mode
	mov 	r11,#2
	orr 	r2,r2,#0x13
	msr 	cpsr,r2		@ Set supervisor mode (XXX was originally system mode)
	cmp 	r11,#1
	orrne 	r1,r1,#BAD_Rd
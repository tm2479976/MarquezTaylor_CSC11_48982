/*
	Taylor Marquez
	Div/Mod 1
*/
	.global _start

_start:
	MOV R1, #16	@Dividend
	MOV R2, #5	@Divisor

_mod:
	SUBS R1, R1, R2	@R1=R1-R2
	CMP R1, R2	@Checks if R1<R2
	BGT _mod	@Loops until R1<R2

_exit:
	MOV R0, R1
	MOV R7, #1
	SWI 0

/*
	Taylor Marquez
	Div/Mod 1
*/
	.global _start

_start:
	MOV R0, #0	@Initialize counter
	MOV R1, #16	@Dividend
	MOV R2, #5	@Divisor

_divide:
	SUBS R1, R1, R2 @R1=R1-R2
	ADD  R0, R0, #1 @R0++
	CMP  R1, #1	@Checks if R1 < 1
	BGT  _divide    @Loops until R1 < 1

_exit:
	MOV R7, #1
	SWI 0

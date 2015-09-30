/*
	Taylor Marquez
	DIV/MOD Shift
	MOD Shif
*/
	.global _start

_start:
	MOV R1, #45	@Dividend
	MOV R2, #6	@Divisor

_shftlt:
	LSL R2, #1	@shift divisor left
	CMP R1, R2	@checks if R1<=R2
	BGE _shftlt	@loops until R1<=R2
	LSR R2, #1	@shift divisor right

_shftrt:
	SUBS R1, R1, R2	@R1=R1-R2
	LSR R2, #1	@shift divisor right
	CMP R1, R2	@checks if R1<R2
	BGT _shftrt	@loops until R1<R2

_end:
	MOV R0, R1
	MOV R7, #1
	SWI 0

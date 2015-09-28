/*
	Taylor Marquez
	Division through shifted subtraction
*/
	.global _start

_start:
	MOV R0, #0	@counter
	MOV R1, #45	@dividend
	MOV R2, #6	@divisor
	MOV R3, #1	@scale

_shftlt:
	LSL R2, #1	@shifts divisor left
	LSL R3, #1	@shifts scale to match
	CMP R1, R2	@checks if R1<=R2
	BGE _shftlt	@loops until R1<=R2
	LSR R2, #1	@shift divisor right once
	LSR R3, #1	@shift scale to match

_shftrt:
	SUBS R1, R1, R2 @R1=R1-R2
	ADD  R0, R0, R3 @R0=R0+R3
	LSR R2, #1	@shift divisor right
	LSR R3, #1	@shift scale to match
	CMP  R1, R2	@checks if R1<R2
	BGT  _shftrt	@loops until R1<R2

_end:
	MOV R7, #1
	SWI 0

/*
	Taylor Marquez
	Chapter9-12
	LE: Less than of Equal to(signed)
*/
	.global _start

_start:
	MOV R1, #17
	MOV R2, #11
	MOV R5, #9

	CMP R5, #10	 @does R5 contain 0x0A?
	SUBLE R0, R1, R2 @if R5<=0x0A R0=R1-R2

_exit:
	MOV R7, #1
	SWI 0

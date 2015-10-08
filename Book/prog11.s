/*
	Taylor Marquez
	Chapter9-12
	Rotations
*/
	.global _start

_start:
	MOV R1, #128
	MOVS R0, R1, ROR #3

_exit:
	MOV R7, #1
	SWI 0

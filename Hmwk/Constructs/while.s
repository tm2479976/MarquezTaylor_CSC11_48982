/*
	Taylor Marquez
	while-loop
*/

	.global _start

_start:
	MOV R0, #0
	MOV R1, #1
	MOV R2, #10

_while_r1_le_r2:
	CMP R1, R2
	BGT _output
	ADD R0, R0, R1
	ADD R1, R1, #1
	BAL _while_r1_le_r2

_output:
	MOV R7, #1
	SWI 0

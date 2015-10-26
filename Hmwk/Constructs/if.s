/*
	Taylor Marquez
	if-branching
*/
	.global _start

_start:
	MOV R0, #0
	MOV R1, #3

_if1:
	CMP R1, #1
	BNE _if2
	MOV R0, #11

_if2:
	CMP R1, #2
	BNE _if3
	MOV R0, #5

_if3:
	CMP R1, #3
	BNE _if4
	MOV R0, #11

_if4:
	CMP R1, #4
	BNE _if5
	MOV R0, #5

_if5:
	CMP R1, #5
	BNE _output
	MOV R0, #1

 _output:
	MOV R7, #1
	SWI 0


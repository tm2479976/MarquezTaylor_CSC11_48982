/*
	Taylor Marquez
	if-branching
*/
	.global _start

_start:
	MOV R0, #0
	MOV R1, #3

_if_R1_eq_1:
	CMP R1, #1
	BNE _if_R1_eq_2
	MOV R0, #11

_if_R1_eq_2:
	CMP R1, #2
	BNE _if_R1_eq_3
	MOV R0, #5

_if_R1_eq_3:
	CMP R1, #3
	BNE _if_R1_eq_4
	MOV R0, #11

_if_R1_eq_4:
	CMP R1, #4
	BNE _if_R1_eq_5
	MOV R0, #5

_if_R1_eq_5:
	CMP R1, #5
	BNE _output
	MOV R0, #1

 _output:
	MOV R7, #1
	SWI 0


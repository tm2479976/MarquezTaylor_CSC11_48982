/*
	Taylor Marquez
	if-else-branching
*/
	.global _start

_start:
	MOV R1, #3

_if_R1_eq_1:
	CMP R1, #1
	BNE _elseif2
	MOV R0, #11
	BAL _output

_elseif2:
	CMP R1, #2
	BNE _elseif3
	MOV R0, #5
	BAL _output

_elseif3:
	CMP R1, #3
	BNE _elseif4
	MOV R0, #11
	BAL _output

_elseif4:
	CMP R1, #4
	BNE _elseif5
	MOV R0, #5
	BAL _output

_elseif5:
	CMP R1, #5
	BNE _else
	MOV R0, #1
	BAL _output

_else:
	MOV R0, #0
	BAL _output

_output:
	MOV R7, #1
	SWI 0

/*
	Taylor Marquez
	if-else-branching
*/
	.global _start

_start:
	MOV R1, #3

_case1:
	CMP R1, #1
	BNE _case2
	MOV R0, #11
	BAL _output

_case2:
	CMP R1, #2
	BNE _case3
	MOV R0, #5
	BAL _output

_case3:
	CMP R1, #3
	BNE _case4
	MOV R0, #11
	BAL _output

_case4:
	CMP R1, #4
	BNE _case5
	MOV R0, #5
	BAL _output

_case5:
	CMP R1, #5
	BNE _default
	MOV R0, #1
	BAL _output

_default:
	MOV R0, #0
	BAL _output

_output:
	MOV R7, #1
	SWI 0

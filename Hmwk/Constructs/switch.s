/*
	Taylor Marquez
	switch-branching
*/
	.global _start

_start:
	MOV R1, #3

_switchR1:
	CMP R1, #1 
	BEQ _case1
	
	CMP R1, #2
	BEQ _case2
	
	CMP R1, #3
	BEQ _case3
	
	CMP R1, #4
	BEQ _case4
	
	CMP R1, #5
	BEQ _case5
	
	BAL _default

_case1:
	MOV R0, #11
	BAL _output

_case2:
	MOV R0, #5
	BAL _output

_case3:
	MOV R0, #11
	BAL _output

_case4:
	MOV R0, #5
	BAL _output

_case5:
	MOV R0, #1
	BAL _output

_default:
	MOV R0, #0
	BAL _output

_output:
	MOV R7, #1
	SWI 0

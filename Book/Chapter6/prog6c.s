	.global _start

_start:
	MOV R1, #20
	MOV R2, #5
	MUL R0, R1, R2

	MOV R7, #1
	SWI 0

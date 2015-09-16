	.global _start
_start:
	MOV R0, #65
	MOV R1, #32
	ADD R0, R0, R1 @ R0=R0+R1
	MOV R7, #1
	SWI 0

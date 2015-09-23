/*
	Taylor Marquez
	Convert 6 Radius to Area
*/
	.global _start

_start:
	MOV R1, #6		@BP  0 WD  8
	LDR R2, =0x003243f6	@BP-20 WD 24
	MUL R3, R1, R1		@BP  0 WD  8 r^2
	MUL R0, R2, R3		@BP-20 WD 32
	LSR R0, #20		@BP  0 WD  8

	MOV R7, #1
	SWI 0

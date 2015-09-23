/*
	Taylor Marquez
	Convert 6.5 radius to area
*/
	.global _start

_start:
	LDR R1, =0x0068		@BP -4 WD 16
	LDR R2, =0x003243	@BP-16 WD 16
	MUL R3, R1, R1		@r^2
	MUL R0, R2, R3		@BP-20 WD 32
	LSR R0, #20		@BP  0 WD  8

	MOV R7, #1
	SWI 0

/*
	Taylor Marquez
	Convert 110 Area to Radius^2
*/
	.global _start

_start:
	MOV R1, #110		@BP  0 WD  8
	LDR R2, =0x00517CC1	@BP-24 WD 24 1/pi
	MUL R0, R1, R2		@BP-24 WD 32
	LSR R0, #24		@BP  0 WD  8

	MOV R7, #1
	SWI 0

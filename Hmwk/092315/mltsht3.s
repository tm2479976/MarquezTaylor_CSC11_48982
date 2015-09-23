/*
	Taylor Marquez
	Convert 113.4 Area to Radius^2
*/
	.global _start

_start:
	LDR R1, =0x7167		@BP -8 WD 16
	LDR R2, =0x00517C	@BP-16 WD 16 1/pi
	MUL R0, R1, R2		@BP-24 WD 32
	LSR R0, #24		@BP  0 WD  8

	MOV R7, #1
	SWI 0

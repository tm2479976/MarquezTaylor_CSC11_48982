/*
	Taylor Marquez
	Convert 88 months to years
*/
	.global _start
_start:
	MOV R1, #88		@BP  0 WD 8
	LDR R2, =0x00155556	@BP-24 WD 24
	MUL R0, R1, R2		@BP-24 WD 32
	LSR R0, #24		@BP  0 WD 8

	MOV R7, #1
	SWI 0

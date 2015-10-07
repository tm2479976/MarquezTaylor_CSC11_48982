/*
	Taylor Marquez
	do-while-loop
*/

	.global _start

_start:
	MOV R0=0;
	MOV R1=1;
	MOV R2=10;
	
_do_while_r1_le_r2:
	ADD R0, R0, R1
	ADD R1, R1, #1
	CMP R1, R2
	BLE _while_r1_le_r2
	
_output
	MOV R7, #1
	SWI 0
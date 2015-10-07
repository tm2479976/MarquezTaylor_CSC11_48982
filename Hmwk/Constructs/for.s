/*
	Taylor Marquez
	For-loop
*/

	.global _start

_start:
	MOV R0, #0		@sum
	MOV R1, #1		@intial value
	MOV R2, #1		@counter
	MOV R3, #10		@end condition
	
_for_R2eq1_R2_le_R3_R2plus:
	ADD R0, R0, R1					@R0=R0+R1
	ADD R1, R1, #1					@moves to next element	
	ADD R2, R2, #1					@R2++
	CMP R2, R3						@checks if R1<=R2
	BLE _for_R2eq1_R2_le_R3_R2plus  @loops until false
	
_output
	MOV R7, #1
	SWI 0
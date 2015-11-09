.text

	.global fibonacci

fibonacci:
	PUSH {R4, lr}       /* Push r4 and lr onto the stack */
	MOV R4, R0          /* Keep a copy of the initial value of r0 in r4 */

	CMP R0, #45
	BGT is_gt_45

	CMP R0, #2
	BGT is_positive

	CMP R0, #0
	BGT is_1_or_2

	MOV R0, #0
	B end

is_gt_45:
	MOV R1, #0
	B end

is_1_or_2:
	MOV R1, #1
	B end

is_positive:
	SUB R0, R0, #1
	BL fibonacci
	MOV R3, R2	@Fi-1=previousloop Fi-1
	MOV R2, R1	@Fi-1=previousloop Fi
	ADD R1, R2, R3  @Fi=Fi-1+Fi-2

end:
	POP {R4, lr}       /* Pop lr and r4 from the stack */
	BX lr              /* Leave factorial */

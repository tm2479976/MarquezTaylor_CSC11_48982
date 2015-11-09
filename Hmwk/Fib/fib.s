.text

	.global fibonacci

fibonacci:
	PUSH {R4, lr}       /* Push r4 and lr onto the stack */
    MOV R4, R0         /* Keep a copy of the initial value of r0 in r4 */
	
	CMP R0, #2	
	BGT positive
	
	CMP R0, #0
	BGT is_1_or_2
	
	MOV R0, #0
	B end

is_1_or_2:
	MOV R0, #1
	B end
	
is_positive:
	SUB R0, R0, #1
	BL fibonacci
	MOV R2, R1	@Fi-1=previousloop Fi
	MOV R3, R2	@Fi-2=previousloop Fi-1
	ADD R1, R2, R3  @Fi=Fi-1+Fi-2

end:
	POP {R4, lr}       /* Pop lr and r4 from the stack */
    BX lr              /* Leave factorial */

return4Addr: .word return4


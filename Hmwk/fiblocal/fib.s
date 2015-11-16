.text

	.global fibonacci

fibonacci:
	PUSH {R4, lr}       /* Push r4 and lr onto the stack */
	SUB sp, sp, #184    /* Make room for 46 four byte integers in the stack */
	MOV R1, sp          /* Keep a copy of the initial value of r1 in r4 */

	/*initialize term 1 and 2*/
	MOV R5, #1
	STR R5, [R1, +#4]
	STR R5, [R1, +#8]
	MOV R2, #2

	CMP R0, #45			/*Branch if R0>45*/
	BGT is_gt_45

	CMP R0, #2
	BGT loop

	CMP R0, #0			/*Branch if 0<R0<45*/
	BGT is_positive

	MOV R1, #0			/*return 0 for invalid input*/
	B end

loop:
	CMP R2, R0			/*branch when R2==R0*/
	BGT is_positive
	LDR R5, [R1]		/*R5=*R1*/
	LDR R6, [R1, +#4]	/*R5=*(R1+4)*/
	ADD R7, R5, R6		/*R7=R5+%6*/
	STR R7, [R1, +#8]	/*R5=*(R1+8)*/
	ADD R1, R1, #4		/*R1+=4*/
	ADD R2, R2, #1		/*R2+=1*/
	B loop

is_gt_45:
	MOV R1, #0			/*return 0 for invalid input*/
	B end

is_positive:
	LDR R1, [sp, +R0, LSL #2]

end:
	SUB sp, sp, #184    /* Make room for 46 four byte integers in the stack */
	POP {R4, lr}       /* Pop lr and r4 from the stack */
	BX lr              /* Leave factorial */


.text

	.global fibonacci

fibonacci:
	PUSH {R4, lr}		/* Push r4 and lr onto the stack */
	SUB sp, sp, #184	/* Make room for 46 four byte integers in the stack */
	MOV R1, sp 	        /* Keep a copy of the initial value of r1 in r4 */
	MOV R2, #0		/*memory offset Fi-2*/
	MOV R3, #4		/*memory offste Fi-1*/
	MOV R4, #8		/*memory offset Fi*/
	MOV R5, #1		/*Fi-2*/
	MOV R6, #1		/*Fi-1*/
	MOV R7, #1		/*Fi*/
	MOV R8, #2		/*loop counter*/

	/*initialize term 1 and 2*/
	STR R5, [R1, +#4]	/*set term 1*/
	STR R5, [R1, +#8]	/*set term 2*/

	CMP R0, #45		/*Branch if R0>45*/
	BGT is_gt_45

	CMP R0, #2		/*Branch if 3<=R0<=45*/
	BGT loop

	CMP R0, #0		/*Branch if R0==1||R0==2*/
	BGT is_positive

	MOV R1, #0		/*return 0 for invalid input*/
	B end

loop:
	CMP R8, R0		/*branch when R8==R0*/
	BGT is_positive
	ADD R2, R2, #4		/*R2+=4*/
	ADD R3, R3, #4		/*R3+=4*/
	ADD R4, R4, #4		/*R4+=4*/
	LDR R5, [R1, R2]	/*R5=*R1*/
	LDR R6, [R1, R3]	/*R6=*(R1+4)*/
	ADD R7, R5, R6		/*R7=R5+R6*/
	STR R7, [R1, R4]	/*R5=*(R1+R4)*/
	ADD R8, R8, #1		/*R8++*/
	B loop

is_gt_45:
	MOV R1, #0		/*return 0 for invalid input*/
	B end

is_positive:
	LDR R1, [sp, +R0, LSL #2]

end:
	ADD sp, sp, #184    /* Make room for 46 four byte integers in the stack */
	POP {R4, lr}       /* Pop lr and r4 from the stack */
	BX lr              /* Leave factorial */


.data

.balign
fib: .skip 46

.text

	.global fibonacci

fibonacci:
	PUSH {R4, lr}       /* Push r4 and lr onto the stack */
	LDR R1, fibAddr
	MOV R4, R1          /* Keep a copy of the initial value of r1 in r4 */
	SUB R8, R0, #2		/* R8=R0-2 */
	
	/*initialize term 1 and 2*/
	MOV R5, #1
	STR R5, [R1, +#4]
	STR R5, [R1, +#8]
	MOV R2, #0
	
	CMP R0, #45			/*Branch if R0>45*/
	BGT is_gt_45

	CMP R0, #0			/*Branch if 0<R0<45*/
	BGT loop

	MOV R1, #0			/*return 0 for invalid input*/
	B end

loop:
	CMP R2, R8			/*branch when R2==R8*/
	BEQ is_positive
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
	LDR R1, [R4, +R0, LSL #2]

end:
	POP {R4, lr}       /* Pop lr and r4 from the stack */
	BX lr              /* Leave factorial */

fibAddr: .word fib

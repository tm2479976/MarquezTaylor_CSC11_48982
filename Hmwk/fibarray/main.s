.data

message1: .asciz "Type a number: "
format:   .asciz "%d"
message2: .asciz "Term %d of the fibonacci sequence is %d\n"

.text

.globl main
main:
	STR lr, [sp,#-4]!           /* Push lr onto the top of the stack */
	SUB sp, sp, #4              /* Make room for one 4 byte integer in the stack */
	MOV R2, #1
	MOV R3, #1
                                /* In these 4 bytes we will keep the number */
                                /* entered by the user */
                                /* Note that after that the stack is 8-byte aligned */
	LDR R0, address_of_message1 /* Set &message1 as the first parameter of printf */
	BL printf                   /* Call printf */

	LDR R0, address_of_format   /* Set &format as the first parameter of scanf */
	MOV R1, sp                  /* Set the top of the stack as the second parameter */
                                /* of scanf */
	BL scanf                    /* Call scanf */

	LDR R0, [sp]                /* Load the integer read by scanf into r0 */
					/* So we set it as the first parameter of factorial */
	BL fibonacci                /* Call factorial */

	MOV R2, R1                  /* Get the result of factorial and move it to r2 */
                                /* So we set it as the third parameter of printf */
	LDR R1, [sp]                /* Load the integer read by scanf into r1 */
                                /* So we set it as the second parameter of printf */
	LDR R0, address_of_message2 /* Set &message2 as the first parameter of printf */
	BL printf                   /* Call printf */


	ADD sp, sp, #+4             /* Discard the integer read by scanf */
	LDR lr, [sp], #+4           /* Pop the top of the stack and put it in lr */
	BX lr                       /* Leave main */

address_of_message1: .word message1
address_of_message2: .word message2
address_of_format: .word format
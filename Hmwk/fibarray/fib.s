.data

.balign
fib: .skip 46

.text

	.global fibonacci

fibonacci:
	PUSH {R4, lr}       /* Push r4 and lr onto the stack */
	LDR R1, fibAddr
	MOV R4, R1          /* Keep a copy of the initial value of r1 in r4 */

	MOV R5, #0
	STR R5, [R1]
	MOV R5, #1
	STR R5, [R1, +#4]
	STR R5, [R1, +#8]
	MOV R2, #0

loop:
	CMP R2, #44
	BEQ check
	LDR R5, [R1]
	LDR R6, [R1, +#4]
	ADD R7, R5, R6
	STR R7, [R1, +#8]
	ADD R1, R1, #4
	ADD R2, R2, #1
	B loop

check:
	CMP R0, #45
	BGT is_gt_45

	CMP R0, #0
	BGT is_positive

	MOV R0, #0
	B end

is_gt_45:
	MOV R1, #0
	B end


is_positive:
	LDR R1, [R4, +R0, LSL #2]

end:
	POP {R4, lr}       /* Pop lr and r4 from the stack */
	BX lr              /* Leave factorial */

fibAddr: .word fib

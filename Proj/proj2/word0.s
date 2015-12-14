.data

.balign 4
scanPattern: .asciz " %c"

.balign 4
outLetter: .asciz "%c%c%c"

.balign 4
outLetter2: .asciz "%c%c%c "

.balign 4
inLetter: .word 0

.balign 4
outNotFound: .asciz "%c is not in word\n"

.balign 4
outChances: .asciz "%d chances remain\n"

.balign 4
outUsed: .asciz "%c has already been used\n"

.balign 4
outFailure: .asciz "You die, So sad. :(\nWho's that Pokemon?\n\nIt was Pidgey...\n"

.balign 4
outSuccess: .asciz "You're Winner!\nWho's that Pokemon?\n\nIts Pidgey!!\n"

.balign
unknown: .skip 24

.text

	.global word0

word0:
	PUSH {lr}
	SUB sp, sp, #24		@make room for 6 integers in the stack

	MOV R4, #6		@remaining chances
	MOV R5, #6		@unsolved letters
	LDR R6, =unknown	@'*' as placeholer for unsolved letters
	MOV R8, sp
	LDR R9, =words

	MOV R0, #8
	MUL R1, R1, R0
	LDR R3, =index
	LDR R10, [R3, +R0]

initun:
	/*initialize unknown*/
	MOV R7, #42
	STR R7, [R6]
	STR R7, [R6, +#4]
	STR R7, [R6, +#8]
	STR R7, [R6, +#12]
	STR R7, [R6, +#16]
	STR R7, [R6, +#20]

	/*set local array*/
	LDR R7, [R9, +R10]
	STR R7, [R8]
	ADD R10, R10, #4
	LDR R7, [R9, +R10]
	STR R7, [R8, +#4]
	ADD R10, R10, #4
	LDR R7, [R9, +R10]
	STR R7, [R8, +#8]
	ADD R10, R10, #4
	LDR R7, [R9, +R10]
	STR R7, [R8, +#12]
	ADD R10, R10, #4
	LDR R7, [R9, +R10]
	STR R7, [R8, +#16]
	ADD R10, R10, #4
	LDR R7, [R9, +R10]
	STR R7, [R8, +#20]

loop:
	/*Display in sets of three*/
	LDR R0, =outLetter
	LDR R1, [R6]		@first letter
	LDR R2, [R6, +#4]	@second letter
	LDR R3, [R6, +#8]	@third letter
	BL printf

	LDR R0, =outLetter2
	LDR R1, [R6, +#12]		@fourth letter
	LDR R2, [R6, +#16]		@fifth letter
	LDR R3, [R6, +#20]		@sixth letter
	BL printf

	LDR R0, =scanPattern
	LDR R1, =inLetter
	BL scanf
	LDR R1, =inLetter
	LDR R1, [R1]

	LDR R7, [R8]
	CMP R1, R7		@check if inLetter = 'p'
	BEQ letterp

	LDR R7, [R8, +#4]
	CMP R1, R7		@check if inLetter = 'i'
	BEQ letteri

	LDR R7, [R8, +#8]
	CMP R1, R7		@check if inLetter = 'd'
	BEQ letterd

	LDR R7, [R8, +#12]
	CMP R1, R7		@check if inLetter = 'g'
	BEQ letterg

	LDR R7, [R8, +#16]
	CMP R1, R7		@check if inLetter = 'e'
	BEQ lettere

	LDR R7, [R8, +#20]
	CMP R1, R7		@check if inLetter = 'y'
	BEQ lettery

	B notFound		@branch if none of the above

letterp:
	LDR R7, [R6]
	CMP R1, R7		@check if used already
	BEQ used
	MOV R7, R1
	STR R7, [R6]
	SUB R5, R5, #1
	B checkUnsolved

letteri:
	LDR R7, [R6, +#4]
	CMP R1, R7		@check if used already
	BEQ used
	MOV R7, R1
	STR R7, [R6, +#4]
	SUB R5, R5, #1
	B checkUnsolved

letterd:
	LDR R7, [R6, +#8]
	CMP R1, R7		@check if used already
	BEQ used
	MOV R7, R1
	STR R7, [R6, +#8]
	SUB R5, R5, #1
	B checkUnsolved

letterg:
	LDR R7, [R6, +#12]
	CMP R1, R7		@check if used already
	BEQ used
	MOV R7, R1
	STR R7, [R6, +#12]
	SUB R5, R5, #1
	B checkUnsolved

lettere:
	LDR R7, [R6, +#16]
	CMP R1, R7		@check if used already
	BEQ used
	MOV R7, R1
	STR R7, [R6, +#16]
	SUB R5, R5, #1
	B checkUnsolved

lettery:
	LDR R7, [R6, +#20]
	CMP R1, R7		@check if used already
	BEQ used
	MOV R7, R1
	STR R7, [R6, +#20]
	SUB R5, R5, #1
	B checkUnsolved

notFound:
	/*Display message for incorrect guesses*/
	LDR R0, =outNotFound
	BL printf

	SUB R4, R4, #1		@R4--
	CMP R4, #0		@check if any chances remain
	BLE failure

	/*Display message for remaining chances*/
	LDR R0, =outChances
	MOV R1, R4
	BL printf

	B loop			@return to loop if any chances remain

checkUnsolved:
	CMP R5, #0		@check if all letters solved
	BLE success
	B loop			@return to loop if not

used:
	/*Display message for repeat guesses*/
	LDR R0, =outUsed
	BL printf
	B loop

failure:
	/*Display message for failed game*/
	LDR R0, =outFailure
	BL printf

	B finish

success:
	/*Display message for successful game*/
	LDR R0, =outSuccess
	BL printf

	B finish

finish:
	/*return to main*/
	ADD sp, sp, #24
	POP {lr}
	BX lr

//inLetterAddr: .word inLetter

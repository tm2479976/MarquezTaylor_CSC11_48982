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
outUsed: .asciz "%c has already been used\n"

.balign 4
outFailure: .asciz "You die, So sad. :(\nWho's that Pokemon?\n\nIt was Meowth...\n"

.balign 4
outSuccess: .asciz "You're Winner!\nWho's that Pokemon?\n\nIts Meowth!!\n"

.text

	.global word2

word2:
	POP {lr}

	MOV R4, #6		@remaining chances
	MOV R5, #6		@unsolved letters
	MOV R6, #42		@'*' as placeholer for unsolved letters
	MOV R7, #42
	MOV R8, #42
	MOV R9, #42
	MOV R10, #42
	MOV R11, #42

loop:
	LDR R0, =outLetter
	MOV R1, R6		@first letter
	MOV R2, R7		@second letter
	MOV R3, R8		@third letter
	bl printf

	LDR R0, =outLetter2
	MOV R1, R9		@fourth letter
	MOV R2, R10		@fifth letter
	MOV R3, R11		@sixth letter
	BL printf

	LDR R0, =scanPattern
	LDR R1, =inLetter
	BL scanf
	LDR R1, inLetterAddr
	LDR R1, [R1]

	CMP R1, #109		@check if inLetter = 'm'
	BEQ letterm

	CMP R1, #101		@check if inLetter = 'e'
	BEQ lettere

	CMP R1, #111		@check if inLetter = 'o'
	BEQ lettero

	CMP R1, #119		@check if inLetter = 'w'
	BEQ letterw

	CMP R1, #116		@check if inLetter = 't'
	BEQ lettert

	CMP R1, #104		@check if inLetter = 'h'
	BEQ letterh

	B notFound		@branch if none of the above

letterm:
	CMP R6, R1		@check if used already
	BEQ used
	MOV R6, R1
	SUB R5, R5, #1
	B checkUnsolved

lettere:
	CMP R7, R1		@check if used already
	BEQ used
	MOV R7, R1
	SUB R5, R5, #1
	B checkUnsolved

lettero:
	CMP R8, R1		@check if used already
	BEQ used
	MOV R8, R1
	SUB R5, R5, #1
	B checkUnsolved

letterw:
	CMP R9, R1		@check if used already
	BEQ used
	MOV R9, R1
	SUB R5, R5, #1
	B checkUnsolved

lettert:
	CMP R10, R1		@check if used already
	BEQ used
	MOV R10, R1
	SUB R5, R5, #1
	B checkUnsolved

letterh:
	CMP R11, R1		@check if used already
	BEQ used
	MOV R11, R1
	SUB R5, R5, #1
	B checkUnsolved

notFound:
	/*Display message for incorrect guesses*/
	LDR R0, =outNotFound
	BL printf

	SUB R4, R4, #1		@R4--
	CMP R4, #0		@check if any chances remain
	BLE failure

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
	POP {lr}
	BX lr

inLetterAddr: .word inLetter

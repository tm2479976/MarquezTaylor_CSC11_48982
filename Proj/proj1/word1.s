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
outRepeat: .asciz "%c has already been used\n"

.balign 4
outFailure: .asciz "You die, So sad. :(\n"

.balign 4
outSuccess: .asciz "You're Winner!\n"

.balign 4
outWord: .asciz "Who's that Pokemon?\n\nIts Mewtwo!!\n"

.balign 4
return3: .word 0

.text

	.global word1

word1:
	LDR R2, return3Addr
	STR lr, [R2]

	MOV R5, #6	@remaining chances
	MOV R6, #6	@unsolved letters
	MOV R7, #42	@'*' as placeholer for unsolved letters
	MOV R8, #42
	MOV R9, #42
	MOV R10, #42
	MOV R11, #42
	MOV R4, #42

loop:
	LDR R0, =outLetter
	MOV R1, R7
	MOV R2, R8
	MOV R3, R9
	bl printf

	LDR R0, =outLetter2
	MOV R1, R10
	MOV R2, R11
	MOV R3, R4
	BL printf

	LDR R0, =scanPattern
	LDR R1, =inLetter
	BL scanf
	LDR R1, inLetterAddr
	LDR R1, [R1]

	CMP R1, #109
	BEQ letterm

	CMP R1, #101
	BEQ lettere

	CMP R1, #119
	BEQ letterw

	CMP R1, #116
	BEQ lettert

	CMP R1, #111
	BEQ lettero

	B notFound

letterm:
	CMP R7, R1
	BEQ used
	MOV R7, R1
	SUB R6, R6, #1
	B checkUnsolved

lettere:
	CMP R8, R1
	BEQ used
	MOV R8, R1
	SUB R6, R6, #1
	B checkUnsolved

letterw:
	CMP R9, R1
	BEQ used
	MOV R9, R1
	MOV R11, R1
	SUB R6, R6, #2
	B checkUnsolved

lettert:
	CMP R10, R1
	BEQ used
	MOV R10, R1
	SUB R6, R6, #1
	B checkUnsolved

lettero:
	CMP R10, R1
	BEQ used
	MOV R4, R1
	SUB R6, R6, #1
	B checkUnsolved

notFound:
	LDR R0, =outNotFound
	BL printf

	SUB R5, R5, #1
	CMP R5, #0
	BLE failure

	B loop

checkUnsolved:
	CMP R6, #0
	BLE success
	B loop

used:
	LDR R0, =outRepeat
	BL printf
	B loop

failure:
	LDR R0, =outFailure
	BL printf

	LDR R0, =outWord
	BL printf

	B finish

success:
	LDR R0, =outSuccess
	BL printf

	LDR R0, =outWord
	BL printf

	B finish

finish:
	LDR lr, return3Addr
	LDR lr, [lr]
	BX lr

return3Addr: .word return3
inLetterAddr: .word inLetter

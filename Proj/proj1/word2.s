.data

.balign 4
scanPattern: .asciz " %c"

.balign 4
outLetter: .asciz "%c%c%c"

.balign 4
inLetter: .word 0

.balign 4
outNotFound: .asciz "%c is not in word\n"

.balign 4
outRepeat: .asciz "%c has already been used\n"

.balign 4
outLose: .asciz "You die, So sad. :(\n"

.balign 4
outWin: .asciz "You're Winner!\n"

.balign 4
outWord: .asciz "Who's that Pokemon?\n\nIts Meowth!!\n"

.balign 4
return4: .word 0

.text

	.global word2

word2:
	LDR R2, return4Addr
	STR lr, [R2]

	MOV R5, #6	@remaining chances
	MOV R6, #6	@unsolved letters
	MOV R7, #42	@"*" as placeholer for unsolved letters
	MOV R8, #42
	MOV R9, #42
	MOV R10, #42
	MOV R11, #42
	MOV R12, #42

loop:
	LDR R0, =outLetter
	MOV R1, R7
	MOV R2, R8
	MOV R3, R9
	bl printf

	LDR R0, =outLetter
	MOV R1, 10
	MOV R2, 11
	MOV R3, 12
	BL printf

	LDR R0, scanPattern
	LDR R1, =inLetter
	BL scanf
	LDR R1, inWageAddr
	LDR R1, [R1]
	
	CMP R1, #109
	BEQ letterm

	CMP R1, #101
	BEQ lettere

	CMP R1, #111
	BEQ lettero

	CMP R1, #119
	BEQ letterw

	CMP R1, #116
	BEQ lettert

	CMP R1, #104
	BEQ letterh

	B notFound

letterm:
	MOV R1, R7
	SUB R6, R6, #1
	B checkUnsolved

lettere:
	MOV R1, R8
	SUB R6, R6, #1
	B checkUnsolved

lettero:
	MOV R1, R9
	SUB R6, R6, #1
	B checkUnsolved

letterw:
	MOV R1, R10
	SUB R6, R6, #1
	B checkUnsolved

lettert:
	MOV R1, R11
	SUB R6, R6, #1
	B checkUnsolved

letterh:
	MOV R1, R12
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
	B Loop 

repeat:
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
	LDR lr, return4Addr
	LDR lr, [lr]
	BX lr

return4Addr: .word return4

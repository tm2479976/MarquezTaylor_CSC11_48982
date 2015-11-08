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
outWord: .asciz "Who's that Pokemon?\n\nIts Gengar!!\n"

.balign 4
return5: .word 0

.text

	.global word3

word3:
	LDR R2, return5Addr
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
	
	CMP R1, #103
	BEQ letterg

	CMP R1, #101
	BEQ lettere

	CMP R1, #110
	BEQ lettern

	CMP R1, #97
	BEQ lettera

	CMP R1, #114
	BEQ letterr

	B notFound

letterg:
	MOV R1, R7
	MOV R1, R10
	SUB R6, R6, #2
	B checkUnsolved

letter3:
	MOV R1, R8
	SUB R6, R6, #1
	B checkUnsolved

lettern:
	MOV R1, R9
	SUB R6, R6, #1
	B checkUnsolved

lettera:
	MOV R1, R11
	SUB R6, R6, #1
	B checkUnsolved

letterr:
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
	LDR lr, return5Addr
	LDR lr, [lr]
	BX lr

return5Addr: .word return5

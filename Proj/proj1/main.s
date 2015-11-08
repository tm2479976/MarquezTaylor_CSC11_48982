.data


.balign 4
outstart1: .asciz "...Something Something Hangman!!\n"

.balign 4
outstart2: .asciz "You are allowed five errors\n"

.balign 4
rdnWord: .word 0

.text

	.global main

main:
	PUSH {lr}

	LDR R0, =outstart1
	BL printf

	LDR R0, =outstart2
	BL printf

	MOV R4, #4	@randomize later

	CMP R4, #0
	BEQ wrd0

	CMP R4, #1
	BEQ wrd1

	CMP R4, #2
	BEQ wrd2

	CMP R4, #3
	BEQ wrd3

	CMP R4, #4
	BEQ wrd4

wrd0:
	BL word0
	B exit

wrd1:
	BL word1
	B exit

wrd2:
	BL word2
	B exit

wrd3:
	BL word3
	B exit

wrd4:
	BL word4
	B exit

exit:
	POP {lr}
    	BX lr

.global scanf
.global printf
.global word0
.global word1
.global word2
.global word3
.global word4

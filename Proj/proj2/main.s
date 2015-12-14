.data

.balign 4
scanpattern: .asciz " %c"

.balign 4
outstart1: .asciz "Welcome to Hangman!\n"

.balign 4
outstart2: .asciz "Only lowercase letters are permitted\nYou are allowed six errors\n"

.balign 4
outReplay: .asciz "Would you like to play again? y/n\n"

.balign 4
inReplay: .word 0

.balign 4
rdnWord: .word 0

.balign
words: .skip 288

.balign
index: .skip 48

.text

	.global main

main:
	PUSH {r4,lr}

	BL initArray

	LDR R0, =outstart1
	BL printf

	LDR R0, =outstart2
	BL printf

randomize:
	/*Set random value*/
	MOV R0, #0
    	BL time
    	BL srand
    	BL rand
    	MOV R1, R0, ASR #1
    	MOV R2, #12
    	BL divMod
	BL word0

replay:
	LDR R0, =outReplay
	BL printf

	LDR R0, =scanpattern
	LDR R1, =inReplay
	BL scanf
	LDR R1, =inReplay
	LDR R1, [R1]

	CMP R1, #121
	BEQ randomize

	CMP R1, #110
	BEQ exit

exit:
	POP {r4,lr}	@leave main
    	BX lr

/*externals*/
.global scanf
.global printf
.global time
.global srand
.global rand
.global words
.global index

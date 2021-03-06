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

.text

	.global main

main:
	PUSH {r4,lr}

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
    	MOV R2, #5
    	BL divMod

	CMP R1, #0	@branch if random number was 0
	BEQ wrd0

	CMP R1, #1	@branch if random number was 1
	BEQ wrd1

	CMP R1, #2	@branch if random number was 2
	BEQ wrd2

	CMP R1, #3	@branch if random number was 3
	BEQ wrd3

	CMP R1, #4	@branch if random number was 4
	BEQ wrd4

wrd0:
	BL word0
	B replay

wrd1:
	BL word1
	B replay

wrd2:
	BL word2
	B replay

wrd3:
	BL word3
	B replay

wrd4:
	BL word4
	B replay

replay:
	LDR R0, =outReplay
	BL printf

	LDR R0, =scanpattern
	LDR R1, =inReplay
	BL scanf
	LDR R1, inReplayAddr
	LDR R1, [R1]

	CMP R1, #121
	BEQ randomize

	CMP R1, #110
	BEQ exit

exit:
	POP {r4,lr}	@leave main
    	BX lr

inReplayAddr: .word inReplay

/*external functions*/
.global scanf
.global printf
.global time
.global srand
.global rand

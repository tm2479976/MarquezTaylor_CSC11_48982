.data

.balign 4
scanPattern: .asciz " %c"

.balign 4
outLetter: .asciz "%c%c%c"

.balign 4
outLetter2: .asciz "%c%c%c "

.balign 4
outLetter3: .asciz "%c%c%c\n"

.balign 4
inLetter: .word 0

.balign 4
outNotFound: .asciz "%c is not in word\n"

.balign 4
outChances: .asciz "%d chances remain\n"

.balign 4
outUsed: .asciz "%c has already been used\n"

.balign 4
outFailure: .asciz "You died...\nThe word you were looking for was %c%c%c"

.balign 4
outSuccess: .asciz "Congratulations you figured it out!\nThe answer was %c%c%c"

.balign 4
outScore: .asciz "Your score for this round was %f \n"

.balign
unknown: .skip 24

.text

	.global word0

word0:
	PUSH {R4, lr}
	SUB sp, sp, #24		@make room for 6 integers in the stack

	MOV R4, #6		@remaining chances
	MOV R5, #6		@unsolved letters
	LDR R6, =unknown	@array for portion of mystery word solved
	MOV R8, sp		@array for mystery word
	LDR R9, =words		@master list of words to take mystery word from
	MOV R11, #0		@counter for number of guesses

	MOV R0, #4
	MUL R1, R1, R0
	LDR R3, =index
	LDR R10, [R3, +R1]

	/*initialize unknown*/
	MOV R7, #42		@use '*' as placeholder for user word
	STR R7, [R6]
	STR R7, [R6, +#4]
	STR R7, [R6, +#8]
	STR R7, [R6, +#12]
	STR R7, [R6, +#16]
	STR R7, [R6, +#20]

	/*set local array*/
	LDR R7, [R9, +R10]	@read from master list
	STR R7, [R8]		@place on stack
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
	ADD R11, R11, #1	@guess++
	MOV R9, #0		@counter to check if guessed letter is in mystery word

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
	CMP R1, R7		@check for letter
	ADDNE R9, R9, #1	@if (user's guess != letter) counter++
	BNE letter2
	LDR R7, [R6]
	CMP R1, R7		@check for repeat guess
	BEQ used
	MOV R7, R1		@reveal first letter
	STR R7, [R6]
	SUB R5, R5, #1		@unsolvedletters--

letter2:
	LDR R7, [R8, +#4]
	CMP R1, R7		@check for letter
	ADDNE R9, R9, #1	@if (user's guess != letter) counter++
	BNE letter3
	LDR R7, [R6, +#4]
	CMP R1, R7		@check for repeat guess
	BEQ used
	MOV R7, R1		@reveal letter
	STR R7, [R6, +#4]
	SUB R5, R5, #1		@unsolvedletters--

letter3:
	LDR R7, [R8, +#8]
	CMP R1, R7		@check for letter
	ADDNE R9, R9, #1	@if (user's guess != letter) counter++
	BNE letter4
	LDR R7, [R6, +#8]
	CMP R1, R7		@check for repeat guess
	BEQ used
	MOV R7, R1		@reveal letter
	STR R7, [R6, +#8]
	SUB R5, R5, #1		@unsolvedletters--

letter4:
	LDR R7, [R8, +#12]
	CMP R1, R7		@check for letter
	ADDNE R9, R9, #1	@if (user's guess != letter) counter++
	BNE letter5
	LDR R7, [R6, +#12]
	CMP R1, R7		@check for repeat guess
	BEQ used
	MOV R7, R1		@reveal letter
	STR R7, [R6, +#12]
	SUB R5, R5, #1		@unsolvedletters--

letter5:
	LDR R7, [R8, +#16]
	CMP R1, R7		@check for letter
	ADDNE R9, R9, #1	@if (user's guess != letter) counter++
	BNE letter6
	LDR R7, [R6, +#16]
	CMP R1, R7		@check for repeat guess
	BEQ used
	MOV R7, R1		@reveal letter
	STR R7, [R6, +#16]
	SUB R5, R5, #1		@unsolvedletters--

letter6:
	LDR R7, [R8, +#20]
	CMP R1, R7		@check for letter
	ADDNE R9, R9, #1	@if (user's guess != letter) counter++
	BNE notFound		@branch to check counter
	LDR R7, [R6, +#20]
	CMP R1, R7		@check for repeat guess
	BEQ used
	MOV R7, R1		@reveal letter
	STR R7, [R6, +#20]
	SUB R5, R5, #1		@unsolvedletters--
	B checkUnsolved

notFound:
	CMP R9, #6		@check if guess not found in word
	BLT checkUnsolved

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
	LDR R1, [R8]		@first letter
	LDR R2, [R8, +#4]	@second letter
	LDR R3, [R8, +#8]	@third letter
	BL printf

	LDR R0, =outLetter3
	LDR R1, [R8, +#12]		@fourth letter
	LDR R2, [R8, +#16]		@fifth letter
	LDR R3, [R8, +#20]		@sixth letter
	BL printf

	B score

success:
	/*Display message for successful game*/
	LDR R0, =outSuccess
	LDR R1, [R6]		@first letter
	LDR R2, [R6, +#4]	@second letter
	LDR R3, [R6, +#8]	@third letter
	BL printf

	LDR R0, =outLetter3
	LDR R1, [R6, +#12]		@fourth letter
	LDR R2, [R6, +#16]		@fifth letter
	LDR R3, [R6, +#20]		@sixth letter
	BL printf

	B score

score:
	/*initalize floating point registers*/
	MOV R6, #6
	MOV R7, #100
	VMOV S14, R6		@length of word=wl
	VMOV S16, R4		@chances remaining=cr
	VMOV S18, R5		@unsolved letters=ul
	VMOV S20, R11		@number of guesses=ng
	VMOV S22, R7		@score modifier=sm

	/*convert to F32*/
	VCVT.F32.U32 S14, S14
	VCVT.F32.U32 S16, S16
	VCVT.F32.U32 S18, S18
	VCVT.F32.U32 S20, S20
	VCVT.F32.U32 S22, S22
calc:
	/*calculations*/
	VDIV.F32 S16, S16, S14	@s1 = cr/wl
	VDIV.F32 S18, S18, S14	@s2 = ul/wl
	VDIV.F32 S20, S14, S20	@s3 = wl/ng
	VADD.F32 S16, S16, S18	@s4 = s1+s2
	VADD.F32 S20, S20, S16	@s5 = s3+s4
	VMUL.F32 S20, S20, S22  @final scoce = s5*sm
print:
	/*output*/
	LDR R0, =outScore
	VCVT.F64.F32 D0, S20	@convert score for output
	VMOV R2, R3, D0
	BL printf

finish:
	/*return to main*/
	ADD sp, sp, #24
	POP {R4, lr}
	BX lr

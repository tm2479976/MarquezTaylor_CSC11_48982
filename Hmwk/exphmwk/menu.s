.data
.balign 4
inMessage1: .asciz "Input beginning of temperature range: "

.balign 4
inMessage2: .asciz "Input end of temperature range: "

.balign 4
ScanPattern: .asciz "%d"

.balign 4
inBegin: .word 0

.balign 4
inEnd: .word 0

.balign 4
mnMessage: .asciz "If range is degree Centigrade input 1\nIf range is degree Fahrenheit input 2: "

.balign 4
mnInput: .word 0

.text

.global main
main:
	push {lr}

	LDR r0, =inMessage1
	BL printf

	LDR r0, =ScanPattern
	LDR r1, =inBegin
	BL scanf
	LDR r5, inBeginAddr
	LDR r5, [r5]

	LDR r0, =inMessage2
	BL printf

	LDR r0, =ScanPattern
	LDR r1, =inEnd
	BL scanf
	LDR r6, inEndAddr
	LDR r6, [r6]

	LDR r0, =mnMessage
	BL printf

	LDR r0, =ScanPattern
	LDR r1, =mnInput
	BL scanf

	LDR r2, mnInputAddr
	LDR r2, [r2]
	CMP r2, #1
	BEQ choice1

	CMP r2, #2
	BEQ choice2
	BNE exit

choice1:
	LDR R3, =inBegin
	LDR R4, =inEnd
	BL CentToFahr
	BAL exit

choice2:
	BL FahrToCent
	BAL exit

exit:
	POP {lr}
	BX lr
	MOV R7, #0
	SWI 0

inBeginAddr: .word inBegin
inEndAddr: .word inEnd
mnInputAddr: .word mnInput


.global scanf
.global printf
.global CentToFahr
.global FahrToCent

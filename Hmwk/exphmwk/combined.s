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

.balign 4
outMessage: .asciz "%d\t%d\n"

.balign 4
CFMessage: .asciz "C\tF\n"

.balign 4
FCMessage: .asciz "F\tC\n"

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
	BEQ CentToFahr

	CMP r2, #2
	BEQ FahrToCent
	BNE exit

CentToFahr:
	ldr r0, =CFMessage
	bl printf

centloop:
	ldr r4, =0x01CC 	@bp -8
	ldr r0, =outMessage
	mov r1, r5
	mul r2, r5, r4
	lsr r2, #8
	add r2, r2, #32
	bl printf
	add r5, r5, #1
	cmp r5, r6
	ble centloop
	bgt exit

FahrToCent:
	ldr r0, =FCMessage
	bl printf
fahrloop:
	ldr r4, =0x008E38 	@bp -16
	ldr r0, =outMessage
	mov r1, r5
	sub r2, r5, #32
	mul r2, r2, r4
	lsr r2, #16
	bl printf
	add r5, r5, #1
        cmp r5, r6
        ble fahrloop
        bgt exit

exit:
	pop {lr}
	bx lr

inBeginAddr: .word inBegin
inEndAddr: .word inEnd
mnInputAddr: .word mnInput


.global scanf
.global printf
.global CentToFahr
.global FahrToCent

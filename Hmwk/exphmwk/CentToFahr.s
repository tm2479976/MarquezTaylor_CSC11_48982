.data

.balign 4
outMessage: .asciz "%d\t%d\n"

.balign 4
CFMessage: .asciz "C\tF\n"

.text

	.global CentToFahr

CentToFahr:
	PUSH {lr}
	LDR r0, =CFMessage
	BL printf

centloop:
	LDR r4, =0x01CD 	@bp -8
	LDR r0, =outMessage
	MOV r1, r5
	MUL r2, r5, r4
	LSR r2, #8
	ADD r2, r2, #32
	BL printf
	ADD r5, r5, #1
	CMP r5, r6
	BLE centloop

	POP {lr}
	BX lr

.global printf

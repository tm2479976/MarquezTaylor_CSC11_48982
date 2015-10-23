.balign 4
outMessage: .asciz "%d\t%d\n"

.balign 4
CFMessage: .asciz "C\tF\n"

	.global CentToFahr

CentToFahr:
	push {lr}
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
	bx lr

.global printf
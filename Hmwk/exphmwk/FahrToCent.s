.balign 4
outMessage: .asciz "%d\t%d\n"

.balign 4
FCMessage: .asciz "F\tC\n"

	.global FahrToCent

FahrToCent:
	push {lr}
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
        bx lr

.global printf
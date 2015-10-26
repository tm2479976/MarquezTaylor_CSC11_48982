.data

.balign 4
outMessage: .asciz "%d\t%d\n"

.balign 4
FCMessage: .asciz "F\tC\n"

.text

	.global FahrToCent

FahrToCent:
	PUSH {lr}
	LDR r0, =FCMessage
	BL printf

fahrloop:
	LDR r4, =0x008E39 	@bp -16
	LDR r0, =outMessage
	MOV r1, r5
	SUB r2, r5, #32
	MUL r2, r2, r4
	LSR r2, #16
	BL printf
	ADD r5, r5, #1
        CMP r5, r6
        BLE fahrloop

	POP {lr}
	BX lr

.global printf

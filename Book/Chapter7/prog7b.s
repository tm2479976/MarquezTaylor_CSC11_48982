/*
	Taylor Marquez
	Program 7b
*/
	.global _start

_start:
_read:
			@read syscall
	MOV R7, #3	@Syscall number
	MOV R0, #1	@stdout number
	MOV R2, #5	@read first 5 characters
	LDR R1, =string @string placed at string:

_write:
			@write syscall
	MOV R7, #4	@syscall number
	MOV R0, #1	@stdout is monitor
	MOV R2, #19	@string is 19 chars long
	LDR R1, =string @string located at string
	SWI 0

_exit:
	MOV R7, #1
	SWI 0

.data
string:
.ascii "Hello World String\n"

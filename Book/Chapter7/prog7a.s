/*
	Taylor Marquez
	Program 7a
*/
	.global _start

_start:

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

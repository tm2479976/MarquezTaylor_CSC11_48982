/*
	Taylor Marquez
	Chapter 9-12
	Smarter Simple Multiplication
*/
	.global _start

_start:
	MOV R0, #9

	MOV R0, R0, LSL #4

_exit:
	MOV R7, #1
	SWI 0

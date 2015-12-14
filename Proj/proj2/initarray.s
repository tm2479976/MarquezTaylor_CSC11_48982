.text

	.global initArray

initArray:
	PUSH {R4, lr}
	LDR R1, wordsAddr
	LDR R2, indexAddr

	/*initialize 'pidgey'*/
	MOV R3, #113		@'p'
	STR R5, [R1]
	MOV R3, #105		@'i'
	STR R5, [R1, +#4]
	MOV R3, #100		@'d'
	STR R5, [R1, +#8]
	MOV R3, #103		@'g'
	STR R5, [R1, +#12]
	MOV R3, #101		@'e'
	STR R5, [R1, +#16]
	MOV R3, #121		@'y'
	STR R5, [R1, +#20]

	MOV R3, #0		@location in words
	STR R5, [R2]
	MOV R3, #6		@length of word
	STR R5, [R2, +#4]

	/*initialize 'mewtwo'*/
	MOV R3, #109		@'m'
	STR R5, [R1, +#24]
	MOV R3, #101		@'e'
	STR R5, [R1, +#28]
	MOV R3, #119		@'w'
	STR R5, [R1, +#32]
	MOV R3, #116		@'t'
	STR R5, [R1, +#36]
	MOV R3, #119		@'w'
	STR R5, [R1, +#40]
	MOV R3, #111		@'o'
	STR R5, [R1, +#44]

	MOV R3, #24		@location in words
	STR R5, [R2, +#8]
	MOV R3, #6		@length of word
	STR R5, [R2, +#12]

	/*initialize 'meowth'*/
	MOV R3, #109		@'m'
	STR R5, [R1, +#48]
	MOV R3, #101		@'e'
	STR R5, [R1, +#52]
	MOV R3, #111		@'o'
	STR R5, [R1, +#56]
	MOV R3, #119		@'w'
	STR R5, [R1, +#60]
	MOV R3, #116		@'t'
	STR R5, [R1, +#64]
	MOV R3, #104		@'h'
	STR R5, [R1, +#68]

	MOV R3, #48		@location in words
	STR R5, [R2, +#16]
	MOV R3, #6		@length of word
	STR R5, [R2, +#20]

	/*initialize 'gengar'*/
	MOV R3, #103		@'g'
	STR R5, [R1, +#72]
	MOV R3, #101		@'e'
	STR R5, [R1, +#76]
	MOV R3, #110		@'n'
	STR R5, [R1, +#80]
	MOV R3, #103		@'g'
	STR R5, [R1, +#84]
	MOV R3, #97		@'a'
	STR R5, [R1, +#88]
	MOV R3, #114		@'r'
	STR R5, [R1, +#92]

	MOV R3, #72		@location in words
	STR R5, [R2, +#24]
	MOV R3, #6		@length of word
	STR R5, [R2, +#28]

	/*initialize 'espurr'*/
	MOV R3, #101		@'e'
	STR R5, [R1, +#96]
	MOV R3, #115		@'s'
	STR R5, [R1, +#100]
	MOV R3, #112		@'p'
	STR R5, [R1, +#104]
	MOV R3, #117		@'u'
	STR R5, [R1, +#108]
	MOV R3, #114		@'r'
	STR R5, [R1, +#112]
	MOV R3, #114		@'r'
	STR R5, [R1, +#116]

	MOV R3, #96		@location in words
	STR R5, [R2, +#32]
	MOV R3, #6		@length of word
	STR R5, [R2, +#36]

	/*initialize 'skitty'*/
	MOV R3, #115		@'s'
	STR R5, [R1, +#120]
	MOV R3, #107		@'k'
	STR R5, [R1, +#124]
	MOV R3, #105		@'i'
	STR R5, [R1, +#128]
	MOV R3, #116		@'t'
	STR R5, [R1, +#132]
	MOV R3, #116		@'t'
	STR R5, [R1, +#136]
	MOV R3, #121		@'y'
	STR R5, [R1, +#140]

	MOV R3, #120		@location in words
	STR R5, [R2, +#40]
	MOV R3, #6		@length of word
	STR R5, [R2, +#44]

	POP {R4, lr}
	BX lr


wordsAddr: .word words
indexAddr: .word index

.text

	.global initArray

initArray:
	PUSH {R4, lr}
	LDR R1, =words
	LDR R2, =index

	/*initialize 'pidgey'*/
	MOV R5, #112		@'p'
	STR R5, [R1]
	MOV R5, #105		@'i'
	STR R5, [R1, +#4]
	MOV R5, #100		@'d'
	STR R5, [R1, +#8]
	MOV R5, #103		@'g'
	STR R5, [R1, +#12]
	MOV R5, #101		@'e'
	STR R5, [R1, +#16]
	MOV R5, #121		@'y'
	STR R5, [R1, +#20]

	MOV R5, #0		@location in words
	STR R5, [R2]

	/*initialize 'mewtwo'*/
	MOV R5, #109		@'m'
	STR R5, [R1, +#24]
	MOV R5, #101		@'e'
	STR R5, [R1, +#28]
	MOV R5, #119		@'w'
	STR R5, [R1, +#32]
	MOV R5, #116		@'t'
	STR R5, [R1, +#36]
	MOV R5, #119		@'w'
	STR R5, [R1, +#40]
	MOV R5, #111		@'o'
	STR R5, [R1, +#44]

	MOV R5, #24		@location in words
	STR R5, [R2, +#4]

	/*initialize 'meowth'*/
	MOV R5, #109		@'m'
	STR R5, [R1, +#48]
	MOV R5, #101		@'e'
	STR R5, [R1, +#52]
	MOV R5, #111		@'o'
	STR R5, [R1, +#56]
	MOV R5, #119		@'w'
	STR R5, [R1, +#60]
	MOV R5, #116		@'t'
	STR R5, [R1, +#64]
	MOV R5, #104		@'h'
	STR R5, [R1, +#68]

	MOV R5, #48		@location in words
	STR R5, [R2, +#8]

	/*initialize 'gengar'*/
	MOV R5, #103		@'g'
	STR R5, [R1, +#72]
	MOV R5, #101		@'e'
	STR R5, [R1, +#76]
	MOV R5, #110		@'n'
	STR R5, [R1, +#80]
	MOV R5, #103		@'g'
	STR R5, [R1, +#84]
	MOV R5, #97		@'a'
	STR R5, [R1, +#88]
	MOV R5, #114		@'r'
	STR R5, [R1, +#92]

	MOV R5, #72		@location in words
	STR R5, [R2, +#12]

	/*initialize 'espurr'*/
	MOV R5, #101		@'e'
	STR R5, [R1, +#96]
	MOV R5, #115		@'s'
	STR R5, [R1, +#100]
	MOV R5, #112		@'p'
	STR R5, [R1, +#104]
	MOV R5, #117		@'u'
	STR R5, [R1, +#108]
	MOV R5, #114		@'r'
	STR R5, [R1, +#112]
	MOV R5, #114		@'r'
	STR R5, [R1, +#116]

	MOV R5, #96		@location in words
	STR R5, [R2, +#16]

	/*initialize 'skitty'*/
	MOV R5, #115		@'s'
	STR R5, [R1, +#120]
	MOV R5, #107		@'k'
	STR R5, [R1, +#124]
	MOV R5, #105		@'i'
	STR R5, [R1, +#128]
	MOV R5, #116		@'t'
	STR R5, [R1, +#132]
	MOV R5, #116		@'t'
	STR R5, [R1, +#136]
	MOV R5, #121		@'y'
	STR R5, [R1, +#140]

	MOV R5, #120		@location in words
	STR R5, [R2, +#20]

	/*initialize 'vulpix'*/
	MOV R5, #118		@'v'
	STR R5, [R1, +#144]
	MOV R5, #117		@'u'
	STR R5, [R1, +#148]
	MOV R5, #108		@'l'
	STR R5, [R1, +#152]
	MOV R5, #112		@'p'
	STR R5, [R1, +#156]
	MOV R5, #105		@'i'
	STR R5, [R1, +#160]
	MOV R5, #120		@'x'
	STR R5, [R1, +#164]

	MOV R5, #144		@location in words
	STR R5, [R2, +#24]

	/*initialize 'oddish'*/
	MOV R5, #111		@'o'
	STR R5, [R1, +#168]
	MOV R5, #100		@'d'
	STR R5, [R1, +#172]
	MOV R5, #100		@'d'
	STR R5, [R1, +#176]
	MOV R5, #105		@'i'
	STR R5, [R1, +#180]
	MOV R5, #115		@'s'
	STR R5, [R1, +#184]
	MOV R5, #104		@'h'
	STR R5, [R1, +#188]

	MOV R5, #168		@location in words
	STR R5, [R2, +#28]

	/*initialize 'raichu*/
	MOV R5, #114		@'r'
	STR R5, [R1, +#192]
	MOV R5, #97		@'a'
	STR R5, [R1, +#196]
	MOV R5, #105		@'i'
	STR R5, [R1, +#200]
	MOV R5, #99		@'c'
	STR R5, [R1, +#204]
	MOV R5, #104		@'h'
	STR R5, [R1, +#208]
	MOV R5, #117		@'u'
	STR R5, [R1, +#212]

	MOV R5, #192		@location in words
	STR R5, [R2, +#32]

	/*initialize 'dodrio'*/
	MOV R5, #100		@'d'
	STR R5, [R1, +#216]
	MOV R5, #111		@'o'
	STR R5, [R1, +#220]
	MOV R5, #100		@'d'
	STR R5, [R1, +#224]
	MOV R5, #114		@'r'
	STR R5, [R1, +#228]
	MOV R5, #105		@'i'
	STR R5, [R1, +#232]
	MOV R5, #111		@'o'
	STR R5, [R1, +#236]

	MOV R5, #216		@location in words
	STR R5, [R2, +#36]

	/*initialize 'ponyta'*/
	MOV R5, #112		@'p'
	STR R5, [R1, +#240]
	MOV R5, #111		@'o'
	STR R5, [R1, +#244]
	MOV R5, #110		@'n'
	STR R5, [R1, +#248]
	MOV R5, #121		@'y'
	STR R5, [R1, +#252]
	MOV R5, #116		@'t'
	STR R5, [R1, +#256]
	MOV R5, #97		@'a'
	STR R5, [R1, +#260]

	MOV R5, #240		@location in words
	STR R5, [R2, +#40]

	/*initialize 'zapdos'*/
	MOV R5, #122		@'z'
	STR R5, [R1, +#264]
	MOV R5, #97		@'a'
	STR R5, [R1, +#268]
	MOV R5, #112		@'p'
	STR R5, [R1, +#272]
	MOV R5, #100		@'d'
	STR R5, [R1, +#276]
	MOV R5, #111		@'o'
	STR R5, [R1, +#280]
	MOV R5, #115		@'s'
	STR R5, [R1, +#284]

	MOV R5, #264		@location in words
	STR R5, [R2, +#44]

	POP {R4, lr}
	BX lr

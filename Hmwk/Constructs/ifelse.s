/*
		Taylor Marquez
		if-else-branching
	*/
		.global _start
	
	_start:
		MOV R1, #3
    
    _if_R1_eq_1:
		CMP R1, #1
		BNE _if_R1_eq_2
		MOV R1, #11
		BAL _output
		
    _if_R1_eq_2:
		CMP R1, #2
		BNE _if_R1_eq_3
		MOV R1, #5
		BAL _output
		
	_if_R1_eq_3:
		CMP R1, #3
		BNE _if_R1_eq_4
		MOV R1, #11
		BAL _output
		
    _if_R1_eq_4:
		CMP R1, #4
		BNE _if_R1_eq_5
		MOV R1, #5 
		BAL _output
		
	_if_R1_eq_5:
		CMP R1, #5
		BNE _else
		MOV R1, #1
		BAL _output
	
	_else
		MOV R0, #0
		BAL _output
		
    _output:
		MOV R7, #1
		SWI 0
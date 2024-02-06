// flips the value of RAM[0] and RAM[1]

//TEMP = R1
	@R1
	D = M
	@temp
	M = D

//R1 = R0
	@R0
	D = M
	@R1
	M = D

//R0 = TEMP
	@temp
	D = M
	@R0
	M = D

(END)
	@END
	0; JMP

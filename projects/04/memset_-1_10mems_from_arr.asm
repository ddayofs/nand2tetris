// int arr = 100;

// for (int i = 0; i < 10; i++)
// {
	// RAM[arr] = -1;
	// arr = arr + 1;

	// or

	// RAM[arr + i] = -1;
// }

//arr = 100
	@100
	D = A
	@arr
	M = D

	@i
	M = 0

(LOOP)
//if (i >= 10)-> END
	@i
	D = M
	@10
	D = D - A
	@END
	D; JGE

	@arr
	D = M
	@i
	A = D + M
	M = -1 
	@i
	M = M + 1
	
	@LOOP
	0; JMP
(END)
	@END
	0; JMP

// int i = 0;
// int n = RAM[0]
// while (i < n)
// {
// 	RAM[addr] = -1;
// 	addr += 32;
// 	i++;
// }

//addr = screen memory addr
	@SCREEN
	D = A

	@addr
	M = D
//n = RAM[0]
	@R0
	D = M
	@n
	M = D
//i = 0
	@i
	M = 0

(LOOP)
//if (i >= n) -> END
	@i
	D = M
	@n
	D = D - M
	@END
	D; JGE
// RAM[addr] = -1
	@addr
	A = M
	M = -1
//addr += 32
	@32
	D = A
	@addr
	M = M + D
// i++
	@i
	M = M + 1

	@LOOP
	0; JMP

(END)
	@END
	0; JMP
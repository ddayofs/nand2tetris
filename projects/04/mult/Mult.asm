// save the value of R0 * R1 in R2
// int	n = RAM[0];
// int sum = 0;
// for (int i = 0; i < RAM[1]; i++)
// {
// 	sum = sum + n;
// }
// RAM[2] = sum;

//n = RAM[0]
	@R0
	D = M
	@n
	M = D
//sum = 0
	@sum
	M = 0
//i = 0
	@i
	M = 0
(LOOP)
//if (i >= RAM[1]) stop
	@R1
	D = M
	@i
	D = M - D
	@STOP
	D; JGE
//sum = sum + n
	@n
	D = M
	@sum
	M = M + D
	@i
	M = M + 1
	@LOOP
	0; JMP
(STOP)
	@sum
	D = M
	@R2
	M = D
	@END
	0; JMP
(END)
	@END
	0; JMP

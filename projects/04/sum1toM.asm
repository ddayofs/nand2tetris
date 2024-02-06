// int i = 0;
// int n = R[0];
// int	sum = 0;

// while (i < n)
// {
// 	sum = sum + i;
// 	i++;
// }
//i = 0
	@i
	M = 0
//n = R[0]
	@R1
	D = M
	@n
	M = D
//sum = 0
	@sum
	M = 0

(LOOP)
	@i
	D = M
// D = i - n
	@n
	D = D - M
	@STOP
	D; JGE
//sum = sum + i
	@sum
	D = M
	@i
	D = D + M
	@sum
	M = D
//i++
	@i
	M = M + 1
	@LOOP
	0; JMP
(STOP)
	@sum
	D = M
	@R0
	M = D
	@END
	0; JMP

(END)
	@END
	0; JMP
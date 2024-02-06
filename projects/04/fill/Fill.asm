// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

//// Replace this comment with your code.

// // addr = screen_addr;
// // addr_tail = keyboard addr

// // start:
// // 	while (keycode !=0)
// // 		;
// // 	while (addr < keyboard_addr)
// // 	{
// // 		RAM[addr] = -1;
// // 		addr = addr + 1;
// // 	}
// // 	while (keycode == 0)
// // 		;
// // 	addr = screen_addr;
// // 	while (addr < keyboard_addr)
// // 	{
// // 		RAM[addr] = 0;
// // 		addr = addr + 16;
// // 	}
// // 	goto start;

// // RAM[KEYBOARD] = keyboard addr
// 	@24567
// 	D = A
// 	@KEYBOARD
// 	M = D
// (START)
// //addr = screen addr;
// 	@SCREEN
// 	D = A
// 	@addr
// 	M = D
// // waitng for keyboard input
// (INPUT_WAIT_LOOP)
// 	@KEYBOARD
// 	A = M
// 	D = M
// 	@BLACK
// 	D; JNE
// 	@INPUT_WAIT_LOOP
// 	0;JMP
// (BLACK)
// // if (addr >= addr_tail) goto NO_INPUT_WAIT_LOOP
// 	@addr
// 	D = M
// 	@KEYBOARD
// 	A = M
// 	D = M - D
// 	@NO_INPUT_WAIT_LOOP
// 	D;JLE
// //RAM[addr] = -1
// 	@addr
// 	A = M
// 	M = -1
// //addr = addr + 1\
// 	@addr
// 	M = M + 1
// //goto BLACK
// 	@BLACK
// 	0; JMP
// (NO_INPUT_WAIT_LOOP)
// //addr = screen addr;
// 	@SCREEN
// 	D = A
// 	@addr
// 	M = D
// // waiting for no input
// 	@KEYBOARD
// 	A = M
// 	D = M
// 	@WHITE
// 	D; JEQ
// //goto NO_INPUT_WAIT_LOOP
// 	@NO_INPUT_WAIT_LOOP
// 	0; JMP
// (WHITE)
// // if (addr >= addr_tail) goto START
// 	@addr
// 	D = M
// 	@KEYBOARD
// 	A = M
// 	D = M - D
// 	@START
// 	D;JLE
// //RAM[addr] = 0
// 	@addr
// 	A = M
// 	M = 0
// //addr = addr + 1\
// 	@addr
// 	M = M + 1
// //goto WHITE
// 	@WHITE
// 	0;JMP

(BEGIN)
	// Set keyboard to address for keyboard input value.
	@24576
	D=A
	@keyboard
	M=D
(CHECK_KEYBOARD)
	// Set current to last screen pixel map.
	@24575
	D=A
	@current
	M=D
	// If keyboard is pressed, fill the screen.
	@keyboard
	A=M
	D=M
	@fillvalue
	M=-1
	@DRAW
	D;JNE
	// Otherwise, clear the screen.
	@fillvalue
	M=0
(DRAW)
	// Fill or clear current pixel, depending on fillvalue.
	@fillvalue
	D=M
	@current
	A=M
	M=D
	// If current pixel map is first pixel map there is nothing left to draw, so
	//jump back to keyboard check.
	@current
	D=M
	@16384
	D=D-A
	@CHECK_KEYBOARD
	D;JLE
	// Decrement current pixel map.
	@current
	M=M-1
	// Continue drawing next pixel map.
	@DRAW
	0;JMP
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

addr = screen_addr;
addr_tail = keyboard addr

start:
	while (keycode !=0)
		;
	while (addr < keyboard_addr)
	{
		RAM[addr] = -1;
		addr = addr + 16;
	}
	while (keycode == 0)
		;
	addr = screen_addr;
	while (addr < keyboard_addr)
	{
		RAM[addr] = 0;
		addr = addr + 16;
	}
	goto start;


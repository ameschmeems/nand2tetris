// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

//// Replace this comment with your code.
// wait for key press
(INIT)
	@8192 // amount of 16bit chunks (32 * 256)
	D=A
	@chunk
	M=D

(KBD_WAIT)
	@KBD
	D=M
	@FILL_BLACK
	D;JNE
	@FILL_WHITE
	0;JMP

(FILL_BLACK)
	@SCREEN
	D=A
	@chunk
	A=D+M
	M=-1
	@chunk
	D=M
	@INIT
	D;JEQ
	@chunk
	M=M-1
	@KBD_WAIT
	0;JMP

(FILL_WHITE)
	@SCREEN
	D=A
	@chunk
	A=D+M
	M=0
	@chunk
	D=M
	@INIT
	D;JEQ
	@chunk
	M=M-1
	@KBD_WAIT
	0;JMP
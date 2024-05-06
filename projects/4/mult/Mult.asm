// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

// set x to r1, initialize r2 to 0
	@R1
	D=M
	@x
	M=D
	@R2
	M=0
(LOOP)
// If x==0, break
	@x
	D=M
	@END
	D;JEQ
	// r2 += r0
	@R0
	D=M
	@R2
	M=M+D
	// decrement x
	@x
	M=M-1
	// loop back
	@LOOP
	0;JMP
(END)
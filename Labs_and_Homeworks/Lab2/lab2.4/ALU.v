`timescale 1 ns / 1 ns

module ALU(A,B,C,D,S0,S1,NegOut,DivOut,ModOut,Fout);
	input A,B,C,D;
	input S0,S1;
	output Fout;
	reg Fout;
	
	

// Verilog Test Fixture Template

`timescale 1 ns / 1 ps

module Testhalfadder;
	reg A,B;
	wire SUM, COUT;
	
	HalfAdder Adder1 (
		.A(A),
		.B(B),
		.SUM(SUM),
		.COUT(COUT));
	
	initial begin
		A=0;B=0;
		#10 A=1;B=0;
		#10 A=0;B=1;
		#10 A=1;B=1;
		#100;
	end
endmodule

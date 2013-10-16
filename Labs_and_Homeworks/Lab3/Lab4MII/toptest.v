`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:16:02 03/20/2012
// Design Name:   Top
// Module Name:   X:/Desktop/EC 311/Lab3/Lab4MII/toptest.v
// Project Name:  Lab4MII
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module toptest;

	// Inputs
	reg A;
	reg B;
	reg C;
	reg clk_in;
	reg rst;

	// Outputs
	wire AN0;
	wire AN1;
	wire AN2;
	wire AN3;
	wire [6:0] LEDout;

	// Instantiate the Unit Under Test (UUT)
	Top uut (
		.A(A), 
		.B(B), 
		.C(C), 
		.clk_in(clk_in), 
		.rst(rst), 
		.AN0(AN0), 
		.AN1(AN1), 
		.AN2(AN2), 
		.AN3(AN3), 
		.LEDout(LEDout)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		C = 0;
		clk_in = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


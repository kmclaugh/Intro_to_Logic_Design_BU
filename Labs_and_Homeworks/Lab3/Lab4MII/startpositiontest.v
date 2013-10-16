`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:18:13 03/20/2012
// Design Name:   startposition
// Module Name:   X:/Desktop/EC 311/Lab3/Lab4MII/startpositiontest.v
// Project Name:  Lab4MII
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: startposition
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module startpositiontest;

	// Inputs
	reg A;
	reg B;
	reg rst;
	reg clk_in;

	// Outputs
	wire [3:0] CA;
	wire [3:0] CB;

	// Instantiate the Unit Under Test (UUT)
	startposition uut (
		.A(A), 
		.B(B), 
		.rst(rst), 
		.clk_in(clk_in), 
		.CA(CA), 
		.CB(CB)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		#10 A=1;B=0;
		#20 A=0;B=1;
		#30 A=1;B=0;
		#40 A=0;B=1;
		#60 A=1;B=0;
		#70 A=0;B=1;
		#80 A=0;B=0;
		rst = 0;
		clk_in = 0;

		clk_in=!clk_in;

		// Wait 100 ns for global reset to finish
		#100;
		// Add stimulus here

	end
      
endmodule


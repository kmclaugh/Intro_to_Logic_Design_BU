`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:14:07 04/12/2012
// Design Name:   BCD_to_7seg_4digit
// Module Name:   X:/My Documents/EC311/Project/test_BCD_to_7seg_4digit.v
// Project Name:  Project
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BCD_to_7seg_4digit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_BCD_to_7seg_4digit;

	// Inputs
	reg [3:0] in3;
	reg [3:0] in2;
	reg [3:0] in1;
	reg [3:0] in0;
	reg clk = 0;
	reg rst;

	// Outputs
	wire [6:0] seg;
	wire [3:0] an;

	// Instantiate the Unit Under Test (UUT)
	BCD_to_7seg_4digit uut (
		.in3(in3), 
		.in2(in2), 
		.in1(in1), 
		.in0(in0), 
		.clk(clk), 
		.rst(rst), 
		.seg(seg), 
		.an(an)
	);
	
	always #10 clk = ~clk;

	initial begin
		// Initialize Inputs
		in3 = 0;
		in2 = 0;
		in1 = 0;
		in0 = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		in3 = 4'hF;
		
		#1000;

	end
      
endmodule


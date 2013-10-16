`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:05:01 03/27/2012
// Design Name:   counter
// Module Name:   X:/Desktop/EC 311/Lab3/Lab4MII/counter_test.v
// Project Name:  Lab4MII
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module counter_test;

	// Inputs
	reg [3:0] CA;
	reg [3:0] CB;
	reg C;
	reg clk_in;
	reg rst;

	// Outputs
	wire statec;
	wire [7:0] countout;

	// Instantiate the Unit Under Test (UUT)
	counter uut (
		.CA(CA), 
		.CB(CB), 
		.C(C), 
		.clk_in(clk_in), 
		.rst(rst), 
		.statec(statec), 
		.countout(countout)
	);
	always begin
		clk_in = ~clk_in;
		end
		
	initial begin
		// Initialize Inputs
		CA = 0;
		CB = 0;
		C = 0;
		clk_in = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#10 CA = 4'b0010;
		#10 CB = 4'b0001;
		#20 C=1;
		#5  C=0;
        
		// Add stimulus here

	end
      
endmodule


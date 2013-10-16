`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:24:10 03/26/2012
// Design Name:   binbcd16
// Module Name:   X:/Desktop/EC 311/lab5MII/btobcdtest.v
// Project Name:  lab5MII
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: binbcd16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module btobcdtest;

	// Inputs
	reg [15:0] B;

	// Outputs
	wire [15:0] P;

	// Instantiate the Unit Under Test (UUT)
	binbcd16 uut (
		.B(B), 
		.P(P)
	);

	initial begin
		// Initialize Inputs
		B = 0;
		


		// Wait 100 ns for global reset to finish
		#100;
        
		# 150 B = 10;

	end
      
endmodule


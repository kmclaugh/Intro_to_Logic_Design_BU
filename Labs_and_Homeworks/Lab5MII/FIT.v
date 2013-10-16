`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:46:17 03/26/2012
// Design Name:   FIR
// Module Name:   X:/Desktop/EC 311/lab5MII/FIT.v
// Project Name:  lab5MII
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FIR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module FIT;

	// Inputs
	reg [7:0] in;
	reg go;
	reg rst;
	reg clk;

	// Outputs
	wire [15:0] y;

	// Instantiate the Unit Under Test (UUT)
	FIR uut (
		.in(in), 
		.go(go), 
		.rst(rst), 
		.clk(clk), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		go = 0;
		rst = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


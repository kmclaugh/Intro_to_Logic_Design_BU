`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:24:14 03/26/2012
// Design Name:   FIR
// Module Name:   X:/Desktop/EC 311/LAB5MIIII/FIR_test.v
// Project Name:  LAB5MIIII
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

module FIR_test;

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
      #10 rst = 1;
		#10 rst = 0;
		#10 in = 1'b1;
		#10 go = 1;
		#10 go = 0;
		#10 in = 2'b10;
		#10 go = 1;
		#10 go = 0;
		#100;
		

	end
      
endmodule


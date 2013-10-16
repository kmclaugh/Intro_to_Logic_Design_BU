`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:30:25 03/20/2012
// Design Name:   LEDImplement
// Module Name:   X:/Desktop/EC 311/Lab3/Lab4MII/LEDtest.v
// Project Name:  Lab4MII
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LEDImplement
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module LEDtest;

	// Inputs
	reg [3:0] SN0;
	reg [3:0] SN1;
	reg clk_in;
	reg rst;

	// Outputs
	wire AN0;
	wire AN1;
	wire AN2;
	wire AN3;
	wire [6:0] LEDout;

	// Instantiate the Unit Under Test (UUT)
	LEDImplement uut (
		.SN0(SN0), 
		.SN1(SN1), 
		.clk_in(clk_in), 
		.AN0(AN0), 
		.AN1(AN1), 
		.AN2(AN2), 
		.AN3(AN3), 
		.rst(rst), 
		.LEDout(LEDout)
	);

	initial begin
		// Initialize Inputs
		SN0 = 0;
		SN1 = 0;
		clk_in = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule


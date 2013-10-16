`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:24:31 03/26/2012
// Design Name:   BtoBCDmod
// Module Name:   X:/Desktop/EC 311/LAB5MIIII/BtoBCD_test.v
// Project Name:  LAB5MIIII
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: BtoBCDmod
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module BtoBCD_test;

	// Inputs
	reg [15:0] y;

	// Outputs
	wire [3:0] ones;
	wire [3:0] tens;
	wire [3:0] hundreds;
	wire [3:0] thousands;

	// Instantiate the Unit Under Test (UUT)
	BtoBCDmod uut (
		.y(y), 
		.ones(ones), 
		.tens(tens), 
		.hundreds(hundreds), 
		.thousands(thousands)
	);

	initial begin
		// Initialize Inputs
		y = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		#120 y = 16'b0000000000110111;
		#150 y = 1'b0;
        
		// Add stimulus here

	end
      
endmodule


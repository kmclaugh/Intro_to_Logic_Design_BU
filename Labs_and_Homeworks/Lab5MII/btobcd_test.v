`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:54:09 03/26/2012
// Design Name:   BtoBCDmod
// Module Name:   X:/Desktop/EC 311/lab5MII/btobcd_test.v
// Project Name:  lab5MII
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

module btobcd_test;

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
		
		y = 5'b10100;
        
		// Add stimulus here

	end
      
endmodule


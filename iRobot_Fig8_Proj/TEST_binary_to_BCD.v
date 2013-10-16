`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:22:11 03/06/2012
// Design Name:   binary_to_BCD
// Module Name:   X:/My Documents/EC311/Lab4/TEST_binary_to_BCD.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: binary_to_BCD
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TEST_binary_to_BCD;

	// Inputs
	reg [7:0] binary;

	// Outputs
	wire [3:0] tens;
	wire [3:0] ones;

	// Instantiate the Unit Under Test (UUT)
	binary_to_BCD uut (
		.binary(binary), 
		.tens(tens), 
		.ones(ones)
	);

	initial begin
		// Initialize Inputs
		binary = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		#10 binary = 43;
		
		#10 binary = 21;
		
		#10 binary = 30;
		
		#100;

	end
      
endmodule


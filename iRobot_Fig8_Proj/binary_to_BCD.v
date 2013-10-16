`timescale 1ns / 1ps

module binary_to_BCD(binary, bcd);
	input [13:0] binary;
	output [15:0] bcd;
	
	reg [29:0] shift;
	reg [15:0] bcd;
	
	always @(binary) begin
		shift = binary;
		
		repeat (14) begin
			// bump thousands
			if (shift[29:26] >= 5) shift[29:26] = shift[29:26] + 4'd3;
			// bump hundreds
			if (shift[25:22] >= 5) shift[25:22] = shift[25:22] + 4'd3;
			// bump tens
			if (shift[21:18] >= 5) shift[21:18] = shift[21:18] + 4'd3;
			// bump ones
			if (shift[17:14] >= 5) shift[17:14] = shift[17:14] + 4'd3;
			
			// left shift through all digits
			shift = shift << 1;
		end
		
		bcd = shift[29:14];
	end // always

endmodule

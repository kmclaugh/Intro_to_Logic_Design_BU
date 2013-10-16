`timescale 1ns / 1ps

module BCD_to_7seg(in, out);
   input [3:0] in;
   output [6:0] out;

	reg [6:0] out;
	
	always @(in) begin
		case (in)
			4'b0000: out = ~7'b0111111;
			4'b0001: out = ~7'b0000110;
			4'b0010: out = ~7'b1011011;
			4'b0011: out = ~7'b1001111;
			4'b0100: out = ~7'b1100110;
			4'b0101: out = ~7'b1101101;
			4'b0110: out = ~7'b1111101;
			4'b0111: out = ~7'b0000111;
			4'b1000: out = ~7'b1111111;
			4'b1001: out = ~7'b1101111;
			default: out = ~0;
		endcase
	end // always
endmodule

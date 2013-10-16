`timescale 1ns / 1ps

module BCD_to_7seg_4digit(in3, in2, in1, in0, clk, rst, seg, an);
   input [3:0] in3, in2, in1, in0;
	input clk, rst;
   output [6:0] seg;
   output [3:0] an;

	reg [6:0] seg;
	reg [3:0] an;
	
	wire [6:0] led0, led1, led2, led3;
	wire [1:0] clk_div;
	
	BCD_to_7seg i0(in0, led0);
	BCD_to_7seg i1(in1, led1);
	BCD_to_7seg i2(in2, led2);
	BCD_to_7seg i3(in3, led3);
	
	clock_divider #(
		.WIDTH(2),
		.FACTOR(2_000_000))
	c0(
		.clk_in(clk),
		.rst(rst),
		.clk_out(clk_div));
	
	always begin
		an[0] = ~(clk_div == 2'b00);
		an[1] = ~(clk_div == 2'b01);
		an[2] = ~(clk_div == 2'b10);
		an[3] = ~(clk_div == 2'b11);
	end
	
	always begin
		case (clk_div)
			2'b00: seg = led0;
			2'b01: seg = led1;
			2'b10: seg = led2;
			2'b11: seg = led3;
		endcase
	end // always

endmodule

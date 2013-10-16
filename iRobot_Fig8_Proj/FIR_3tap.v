`timescale 1ns / 1ps

module FIR_3tap(x, A, clk, rst, out, an0, an1, an2, an3);
	input [6:0] x;
	input A, clk, rst;
   output [6:0] out;
   output an0, an1, an2, an3;
	
	wire A_pressed;
	wire [15:0] sum_bcd;
	
	reg [6:0] x1, next_x1, x2, next_x2;
	reg [13:0] sum, next_sum;
	
	button_handler bhA(clk, rst, A, A_pressed);
	
	// calculate the next response
	always @(*) begin
		if (A_pressed) begin
			next_x2 = x1;
			next_x1 = x;
			next_sum = 20 * x + 15 * x1 + 10 * x2;
		end
		else begin
			next_x2 = x2;
			next_x1 = x1;
			next_sum = sum;
		end
	end // always
	
	always @(posedge clk or posedge rst) begin
		if (rst == 1) begin
			x2        <= 0;
			x1        <= 0;
			sum       <= 0;
		end
		else begin
			x2        <= next_x2;
			x1        <= next_x1;
			sum       <= next_sum;
		end
	end // always
	
	binary_to_BCD bin0(sum, sum_bcd);
	
	BCD_to_7seg_4digit b0(sum_bcd[3:0], sum_bcd[7:4], sum_bcd[11:8], sum_bcd[15:12], clk, rst, out, an0, an1, an2, an3);
endmodule

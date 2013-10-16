`timescale 1ns / 1ps

module edge_detect(clk, rst, x, x_edge);
	parameter RISING = 1'b1;
	
	input clk, rst, x;
	output x_edge;
	reg x_edge = 0;
	
	reg x_prev = RISING;
	
	always @(posedge clk or posedge rst) begin
		if (rst == 1) begin
			x_prev <= 0;
			x_edge <= 0;
		end else begin
			x_prev <= x;
			x_edge <= RISING ? (~x_prev && x) : (x_prev && ~x);
		end
	end
endmodule

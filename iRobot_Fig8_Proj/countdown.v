`timescale 1ns / 1ps

module countdown(A, B, C, clk, rst, out, an0, an1, an2, an3);
	input A, B, C, clk, rst;
   output [6:0] out;
   output an0, an1, an2, an3;
	
	wire clk_1Hz, clk_ticked;
	wire A_pressed, B_pressed, C_pressed;
	wire [3:0] tens, ones;
	
	reg [7:0] count, next_count;
	reg enabled;
	
	clock_divider c1(clk, rst, clk_1Hz);
	defparam c1.FACTOR = 100_000_000;
	edge_detect eclk(clk, rst, clk_1Hz, clk_ticked);
	
	button_handler bhA(clk, rst, A, A_pressed);
	button_handler bhB(clk, rst, B, B_pressed);
	button_handler bhC(clk, rst, C, C_pressed);
	
	// calculate the next count
	always @(*) begin
		if (enabled) begin
			next_count = count - clk_ticked;
		end
		else begin
			next_count = count;
			
			if (A_pressed) next_count = next_count + 8'd10;
			if (B_pressed) next_count = next_count + 8'd1;
			if (next_count > 99) next_count = next_count - 8'd100;
		end
	end // always
	
	always @(posedge clk or posedge rst) begin
		if (rst == 1) begin
			enabled <= 0;
			count   <= 0;
		end
		else begin
			enabled <= count != 0 && (enabled || C_pressed);
			count   <= next_count;
		end
	end // always
	
	// definitely borked, BCD handling is now 4 digits
	binary_to_BCD bin0(count, tens, ones);
	BCD_to_7seg_2digit b0(ones, tens, clk, rst, out, an0, an1, an2, an3);
endmodule

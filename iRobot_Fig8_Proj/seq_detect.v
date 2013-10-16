`timescale 1ns / 1ps

module seq_detect(x, A, clk, rst, out, an0, an1, an2, an3);
	input x, A, clk, rst;
   output [6:0] out;
   output an0, an1, an2, an3;
	
	wire [15:0] sum_bcd;
	wire A_pressed;
	
	reg [1:0] state, next_state;
	reg [15:0] out_bcd;
	
	button_handler bhA(clk, rst, A, A_pressed);
	
	// calculate the next response
	always @(*) begin
		if (A_pressed) begin
			if (x) begin
				next_state = (state == 3) ? 3 : state + 1;
			end else begin
				next_state = 0;
			end
		end else begin
			next_state = state;
		end
		
		out_bcd[15:12] = next_state[1];
		out_bcd[11:8] = next_state[0];
		out_bcd[7:4] = 4'hF;
		out_bcd[3:0] = (next_state == 3);
	end // always
	
	always @(posedge clk or posedge rst) begin
		if (rst == 1) begin
			state <= 0;
		end else begin
			state <= next_state;
		end
	end // always
	
	BCD_to_7seg_4digit b0(out_bcd[3:0], out_bcd[7:4], out_bcd[11:8], out_bcd[15:12], clk, rst, out, an0, an1, an2, an3);
endmodule

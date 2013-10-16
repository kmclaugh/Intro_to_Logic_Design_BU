`timescale 1ns / 1ps

module watch_rx(
	input clk,
	input rst,
	input data_present,
	input [7:0] data,
	output reg buffer_read,
	output reg [7:0] data_hold);
	
	always @(posedge clk or posedge rst) begin
		if (rst) begin
			buffer_read <= 0;
			data_hold <= 0;
		end else begin
			buffer_read <= data_present && (~buffer_read);
			data_hold <= (buffer_read ? data : data_hold);
		end
	end
	
endmodule

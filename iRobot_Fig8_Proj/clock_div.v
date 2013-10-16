`timescale 1ns / 1ps

module clock_divider(clk_in, rst, clk_out);
  parameter WIDTH = 1;
  parameter FACTOR = 1_000_000;
  input clk_in;
  input rst;
  output [WIDTH-1:0] clk_out;
  
  reg [WIDTH-1:0] clk_out = 0;
  reg [31:0] count = 0;
    
  always @(posedge clk_in or posedge rst) begin
    if (rst == 1) begin
		  count = 0;
		  clk_out = 0;
    end
	 else
	   if (count >= FACTOR / (2 ** WIDTH)) begin
		  clk_out = (clk_out + 1) % (2 ** WIDTH);
		  count = 0;
		end
		else begin
		  count = count + 1'd1;
		end
  end

endmodule

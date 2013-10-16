`timescale 1ns / 1ps

module pulsar(clk, rst, pulse);
  parameter FACTOR = 1_000_000;
  input clk;
  input rst;
  output pulse;
  
  reg pulse = 0;
  reg [31:0] count = 0;
    
  always @(posedge clk or posedge rst) begin
    if (rst == 1) begin
		count <= 1'b0;
		pulse <= 1'b0;
    end else begin
	   pulse <= (count == FACTOR);
		count <= (count >= FACTOR) ? 0 : count + 1'd1;
	 end
  end

endmodule

module FIR (in,go,rst,clk,y);

	input rst;
	input clk;
	input go;
	input [7:0] in;

	output [15:0] y;

	reg [15:0] y;
	reg [7:0] z;
	reg [7:0] m;
	reg [7:0] n;
	
	wire clk_1M;
	wire goclean;
	
	clock_divnew clock_divnew_1(clk, rst, clk_1M);
	debouncer debouncego(clk_1M, rst, go, goclean);
	
	always @ (posedge goclean or posedge rst) begin
		if (rst==1) begin
			y = 0;
			z = 0;
			m = 0;
			n = 0;
			end
		else if (goclean==1) begin
			z = m;
			m = n;
			n = in;
			y = (20*n+15*m+10*z);
			end
		end
		
endmodule

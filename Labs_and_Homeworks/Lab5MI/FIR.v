module FIR (in,go,rst,clk,y);

	input rst;
	input clk;
	input go;
	input [7:0] in;

	output [15:0] y;

	reg [15:0] y;
	reg [7:0] x0;
	reg [7:0] x1;
	reg [7:0] x2;
	
	wire clk_outd;
	wire goclean;

	parameter b0=20;
	parameter b1=15;
	parameter b2=10;
	
	clock_divnew clock_divd(clk, rst, clk_outd);
	debouncer debouncego(clk_outd, rst, go, goclean);
	
	
	always @ (posedge clk) begin
		if (rst) begin
			y = 0;
			x0 = 0;
			x1 = 0;
			x2 = 0;
			end
		else if (goclean) begin
			x2 = x1;
			x1 = x0;
			x0 = in;
			y = (b0*x0+b1*x1+b2*x2);
			end
		end
		
endmodule


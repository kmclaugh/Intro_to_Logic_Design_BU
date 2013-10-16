
module Top(in,rst,go,clk,AN0,AN1,AN2,AN3,LEDout);

	input [7:0] in;
	input rst;
	input go;
	input clk;

	output [6:0]LEDout;
	output AN0,AN1,AN2,AN3;
	
	wire [15:0]y;
	wire [7:0] ones,tens,hundreds,thousands;
	
	wire AN0,AN1,AN2,AN3;
	wire [6:0] LEDout;

	FIR FIR_1(in,go,rst,clk,y);
	maxmuxer maxmux_1(y,ones,tens,hundreds,thousands);
	LEDImplement LEDImplement_1(ones,tens,hundreds,thousands,clk,AN0,AN1,AN2,AN3,rst,LEDout);
	
	
endmodule

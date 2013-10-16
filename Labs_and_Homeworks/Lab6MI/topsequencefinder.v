module topsequencefinder(in,rst,clk,AN0,AN1,AN2,AN3,LEDout);

	input in;
	input clk;
	input rst;
	
	output [6:0]LEDout;
	output AN0,AN1,AN2,AN3;
	
	wire outs;
	wire [1:0]state;
	wire AN0,AN1,AN2,AN3;
	wire [6:0] LEDout;
	
	sequence sequence1(in,rst,clk,outs,state);
	LEDImplement LEDImplement_1(outs,state,clk,AN0,AN1,AN2,AN3,rst,LEDout);

endmodule

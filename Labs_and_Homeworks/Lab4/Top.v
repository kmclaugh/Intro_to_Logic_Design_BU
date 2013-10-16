`timescale 1ns / 1ns

module top(Add0,Add1,clk_in,out0,out1,AN0,AN1,,AN2,AN3,rst,LEDout);

	input Add0, Add1;
	
	input clk_in;
	input rst;
	output [6:0]LEDout;
	output [6:0]out0;
	output [6:0]out1;
	output AN0,AN1,AN2,AN3;
	wire AN0,AN1,AN2,AN3;
	reg [6:0] LEDout;
	
	
	wire [3:0] SD0,SD1;
	
	startsetting startsetting_1(Add0,Add1,SD0,SD1);
	LEDImplement LEDImplement_1(SN0,SN1,clk_in,out0,out1,AN0,AN1,AN2,AN3,rst,LEDout);
	
endmodule

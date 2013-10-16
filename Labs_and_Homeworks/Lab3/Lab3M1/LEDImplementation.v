`timescale 1ns / 1ns

module LEDImplement(SN0,SN1,clk_in,AN0,AN1,AN2,AN3,rst,LEDout);

	input clk_in;
	input rst;
	input [3:0] SN0,SN1;
	output [6:0]LEDout;
	output AN0,AN1,AN2,AN3;
	reg AN0,AN1,AN2,AN3;
	reg [6:0] LEDout;
	wire [6:0] out0;
	wire [6:0] out1;
	wire clk_outLD;
			
	
	LED_Logic_Block LED0(SN0,out0);
	LED_Logic_Block LED1(SN1,out1);
	
	 clkdivider  clkdivider_countLED (clk_in,rst,clk_outLD);
	
	always @(clk_outLD,out0,out1)
	begin
		if(clk_outLD==0)
			LEDout = out0;
		if(clk_outLD==1)
			LEDout = out1;
	end
	
	always @(clk_outLD)
	begin
		AN0 = clk_outLD;
		AN1 = ~clk_outLD;
		AN2 = 1;
		AN3 = 1;
	end
	
endmodule


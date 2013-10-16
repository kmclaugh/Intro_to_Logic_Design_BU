module LEDImplement(SN0,SN1,SN2,SN3,clk_in,AN0,AN1,AN2,AN3,rst,LEDout);

	input clk_in;
	input rst;
	input [3:0] SN0,SN1,SN2,SN3;
	output [6:0]LEDout;
	output AN0,AN1,AN2,AN3;
	reg AN0,AN1,AN2,AN3;
	reg [6:0] LEDout;
	wire [6:0] out0;
	wire [6:0] out1;
	wire [6:0] out2;
	wire [6:0] out3;
	wire clk_out0,clk_out1;
			
	
	LED_Logic_Block LED0(SN0,out0);
	LED_Logic_Block LED1(SN1,out1);
	LED_Logic_Block LED2(SN2,out2);
	LED_Logic_Block LED3(SN3,out3);
	
	clkdividera clkdividera_0(clk_in, rst, clk_out0);
	clkdividerb clkdividerb_1(clk_in, rst, clk_out1);
	
	always @(posedge clk_in)
		begin
			if(clk_out0==0 && clk_out1==1)begin
				LEDout <= out0;
				AN0 <= 0;
				AN1 <= 1;
				AN2 <= 1;
				AN3 <= 1;
				end
			else if(clk_out0==1 && clk_out1==1)begin
				LEDout <= out1;
				AN0 <= 1;
				AN1 <= 0;
				AN2 <= 1;
				AN3 <= 1;
				end
			else if (clk_out0==0 && clk_out1==0)begin
				LEDout <= out2;
				AN0 <= 1;
				AN1 <= 1;
				AN2 <= 0;
				AN3 <= 1;
				end
			else if (clk_out0==1 && clk_out1==0)begin
				LEDout <= out3;
				AN0 <= 1;
				AN1 <= 1;
				AN2 <= 1;
				AN3 <= 0;
				end
		end
	
	
endmodule
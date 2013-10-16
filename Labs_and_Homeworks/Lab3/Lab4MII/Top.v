

module Top(A,B,C,clk_in,rst,AN0,AN1,AN2,AN3,LEDout);
	input A,B,C;
	input clk_in;
	input rst;
	
	output [6:0]LEDout;
	output AN0,AN1,AN2,AN3;
	
	wire AN0,AN1,AN2,AN3;
	wire [6:0] LEDout;
	wire [3:0] CA;
	wire [3:0] CB;
	wire [3:0] ones;
	wire [3:0] tens;
	wire [3:0] SN0,SN1;
	wire [7:0] countout;
	wire statec;
	
	startposition startposition_a(A,rst,clk_in,CA);
	startposition startposition_b(B,rst,clk_in,CB);
	counter counter_1(CA,CB,C,clk_in,rst,statec,countout);
	BtoBCDmod BtoBCDmod_1(countout,ones,tens);
	LEDmuxer LEDmux_1(CA,CB,ones,tens,statec,clk_in,SN0,SN1);
	LEDImplement LEDImplement_1(SN0,SN1,clk_in,AN0,AN1,AN2,AN3,rst,LEDout);
	

endmodule

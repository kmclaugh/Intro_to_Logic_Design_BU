`timescale 1ns / 1ps

module test_mission_control;

	// Inputs
	reg clk = 0;
	reg [7:0] sw;
	reg btns;
	reg btnu;
	reg btnd;
	reg RxD;

	// Outputs
	wire TxD;
	wire [7:0] Led;
	//wire [6:0] seg;
	//wire [3:0] an;

	// Instantiate the Unit Under Test (UUT)
	mission_control uut (
		.clk(clk), 
		.sw(sw),
		.btns(btns),
		.btnu(btnu), 
		.btnd(btnd), 
		.RxD(RxD), 
		.TxD(TxD), 
		.Led(Led)
		//.seg(seg), 
		//.an(an)
	);
	
	always #5 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		sw = 0;
		btns = 0;
		btnu = 0;
		btnd = 0;
		RxD = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		btnu = 1'b1;
		#1000;
		btnu = 1'b0;
		#1000;
        
		sw = 8'h80;
		#100000;
		btns = 1'b1;
		#10000000;
		btns = 1'b0;
		#20000000;
		sw = 8'h00;

	end
      
endmodule


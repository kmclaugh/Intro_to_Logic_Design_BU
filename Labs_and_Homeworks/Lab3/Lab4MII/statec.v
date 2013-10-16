

module statec(C,clk_in,rst,statecout);

	input C;
	input clk_in;
	input rst;
	output [3:0] statecout;
	reg [3:0] statecout;
	wire cleanC;
	wire clk_outs;
	
	clock_divnew clocksc(clk_in, rst, clk_outsc);
	debouncer mydebounce(clk_outsc,rst,in,cleanC);
	
	always @ (posedge cleanC)begin
		if (rst == 1) begin
			statecout <= 0
			end
		else

endmodule

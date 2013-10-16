module downcount(decimalin,C,rst,clk_in,decimalout);

	input [7:0] decimalin;
	input clk_in;
	input C;
	input rst;
	output [7:0] decimalout;
	reg [7:0] decimalout;
	wire clk_outc;
	
	clockdivider1HZ clk_1HZ(clk_in, rst, clk_outc);
	

	
	always @(posedge clk_outc) begin
		if (decimalout != 0)begin
			decimalout = decimalout - 1;
			end
		else begin
			decimalout <= decimalout;
		end
		end

endmodule

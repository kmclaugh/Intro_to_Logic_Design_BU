
module startposition(in,rst,clk_in,out);

	input in;
	input clk_in;
	input rst;
	output [3:0] out;
	reg [3:0] out;
	wire clean;
	wire clk_outs;
	
	clock_divnew clocks(clk_in, rst, clk_outs);
	debouncer mydebounce(clk_outs,rst,in,clean);

	always @(posedge clean or posedge rst) begin
		if (rst) begin
			out <= 0;
			end
			else begin
				out <= out+1;
				end
		end


endmodule
			


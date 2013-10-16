module counter(CA,CB,C,clk_in,rst,statec,countout);

input clk_in;
input rst;
input C;
input [3:0] CA,CB;

output [7:0]countout;
output statec;

reg [7:0] countout;
reg statec;
wire clk_outc;
wire clk_outs;
wire cleanc;

	clockdivider1HZ clockdivider1HZ(clk_in, rst, clk_outc);
	clock_divnew clocks(clk_in, rst, clk_outs);
	debouncer mydebounce(clk_outs,rst,C,cleanc);

	
	always @ (posedge cleanc or posedge rst)begin
		if (rst)begin
			statec <= 0;
			end
		else begin
			statec <= 1;
			end
		end

		
			
	always @ (posedge clk_outc) begin
			if (statec == 0)begin
				countout <= CB*10+CA;
				end
			else if (countout != 0)begin
				countout <= countout-1;
				end
			end
			
			
			


endmodule

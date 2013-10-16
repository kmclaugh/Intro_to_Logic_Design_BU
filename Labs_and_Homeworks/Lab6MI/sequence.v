module sequence(in,rst,clk,OUT,state);
	input in;
	input clk;
	input rst;
	output OUT;
	output [1:0]state;

	reg [1:0]state;
	reg OUT;
	reg out;
	reg[1:0] nextstate;
	wire clk_out;
	
	clock_divider clock_divider_1(clk, rst, clk_out);
	
	always @ (posedge clk_out or posedge rst) begin
		if (rst)begin
			state <= 2'b00;
			OUT <= 0;
			end
		else begin
			state <= nextstate;
			OUT <= out;
			end
		end
	
	always @ (in or state) begin
		case (state)
			2'b00: if (in==1) begin
					out = 0;
					nextstate = 2'b01;
					end
				else begin
					out = 0;
					nextstate = 2'b00;
					end
			2'b01: if (in==1) begin
					out = 0;
					nextstate = 2'b10;
					end
				else begin
					out = 0;
					nextstate = 2'b00;
					end
			2'b10: if (in==1) begin
					out = 1;
					nextstate = 2'b10;
					end
				else begin
					out = 0;
					nextstate = 2'b00;
					end
		endcase
		end
endmodule 
					
			
			

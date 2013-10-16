module decimal(CA,CB,clk_in,decimal);

	input [3:0] CA;
	input [3:0] CB;
	input clk_in;

	output [7:0] decimal;

	reg [7:0] decimal;

	always @ (posedge clk_in)begin
		decimal = CB*10+CA;
		end
		
endmodule

	
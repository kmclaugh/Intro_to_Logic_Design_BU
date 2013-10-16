
module maxmuxer(y,ones,tens,hundreds,thousands);

	input [15:0] y;
	output [3:0] ones,tens,hundreds,thousands;
	
	reg [3:0] ones,tens,hundreds,thousands;
	
	wire [3:0] onesg,tensg,hundredsg,thousandsg;

	BtoBCDmod BtoBCD_1(y,onesg,tensg,hundredsg,thousandsg);

	always @ (y) begin
		if (y > 14'b10011100001111) begin
			ones <= 4'b1001;
			tens <= 4'b1001;
			hundreds <= 4'b1001;
			thousands <= 4'b1001;
			end
		else begin
			ones <= onesg;
			tens <= tensg;
			hundreds <= hundredsg;
			thousands <= thousandsg;
		end
		end
endmodule

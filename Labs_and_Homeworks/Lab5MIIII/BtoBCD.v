module BtoBCDmod (y,ones,tens,hundreds,thousands);

	input [15:0] y;

	
	output [3:0] ones,tens,hundreds,thousands;
	
	reg [3:0] ones,tens,hundreds,thousands;


	
	always @ (y) begin
	 ones = y % 10;
	 tens = ((y-ones) % 100)/10;
	 hundreds = ((y-ones-tens)% 1000)/100;
	 thousands = ((y-ones-tens-hundreds)%10000)/1000;
	end
	
	
endmodule
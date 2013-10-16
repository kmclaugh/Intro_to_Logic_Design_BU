module BtoBCDmod (y,ones,tens);

	input [8:0] y;
	
	output [3:0] ones,tens;
	
	reg [3:0] ones,tens;


	
	always @ (y) begin
			ones = y % 10;
			tens = ((y-ones) % 100)/10;
		end

endmodule

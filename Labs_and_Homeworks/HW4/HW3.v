`timescale 1 ns / 1 ns
num = 8'b1110_1010
module PRBS8(num,rannum);
	input [7:0] num;
	output[7:0] rannum;
	reg random
	
	always @(num);
	begin
		rannum = {num[0],num[1],1'b0,num[3],b4,num[5],num[6],num[2]^num[5]};
	end
endmodule

		
		

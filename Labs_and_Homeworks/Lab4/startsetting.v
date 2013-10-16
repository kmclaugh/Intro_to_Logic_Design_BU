module startsetting(Add0,Add1,SN0,SN1);

	input Add0,Add1;
	output [3:0]SN0,SN1;
	
	wire [3:0]SN0,SN1;
	reg [3:0] TSN0=0, TSN1=0;
	
	always @ (Add0,Add1)
	begin
		if (Add0 == 1) begin
			TSN0 = TSN0 + 1'b1;
			end
		if (Add1 == 1) begin
			TSN1 = TSN1 + 1'b1;
			end
		if (TSN0 == 4'b1010) begin
			TSN0 = 4'b0000;
			end
		if (TSN1 == 4'b1010) begin
			TSN1 = 4'b0000;
			end
	end
	
	assign SN0 = TSN0;
	assign SN1 = TSN1;
	
endmodule

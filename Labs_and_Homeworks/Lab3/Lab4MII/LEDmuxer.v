module LEDmuxer (CA,CB,ones,tens,statec,clk_in,SN0,SN1);
	input [3:0]CA,CB;
	input [3:0] tens,ones;
	input clk_in;
	input statec;
	
	output [3:0] SN0,SN1;
	reg [3:0]SN0;
	reg [3:0]SN1;
	
	always @ (posedge clk_in) begin
		if (statec != 1) begin
			SN0 <= CA;
			SN1 <= CB;
			end
		else begin
			SN0 <= ones;
			SN1 <= tens;
			end
		end

endmodule
		
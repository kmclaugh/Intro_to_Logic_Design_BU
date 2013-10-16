module muxy2_1 (I0,I1,Sel,Fout);

	input[6:0]I0;
	input [6:0]I1;
	input Sel;
	output[6:0]Fout;
	reg [6:0] Fout;
	
	always @(Sel,I0,I1)
	begin
		if(Sel==0)
			Fout <= I0;
		if (Sel==1)
			Fout <= I1;
	end
endmodule


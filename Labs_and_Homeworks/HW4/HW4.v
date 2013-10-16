`timescale 1 ns / 1 ns

module demux3:1(I,Sel0,Sel1,Sel2,A,B,C,D,E,F,G,H);
	input I;
	input Sel0, Sel1, Sel2;
	output A,B,C,D,E,F,G,H;
	reg A,B,C,D,E,F,G,H;
	
	always @(I,Sel0,Sel1,Sel2);
	begin
		if (Sel0==0 & Sel1==0 & Sel2==0)
			A <= I;
		else if (Sel0==0 & Sel1==0 & Sel2==1)
			B <= I;
		else if (Sel0==0 & Sel1==1 & Sel2==0)
			C <= I;
		else if (Sel0==0 & Sel1==1 & Sel2==1)
			D <= I;
		else if (Sel0==1 & Sel1==0 & Sel2==0)
			E <= I;
		else if (Sel0==1 & Sel1==0 & Sel2==1)
			F <= I;
		else if (Sel0==1 & Sel1==1 & Sel2==0)
			G <= I;
		else if (Sel0==1 & Sel1==1 & Sel2==1)
			H <= I;
	end
endmodule

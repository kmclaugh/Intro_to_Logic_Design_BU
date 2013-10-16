`timescale 1 ns / 1 ns

module ALU(A,B,C,D, S0,S1, FA, FB, FC, FAD);

	input A,B,C,D;
	input S0,S1;
	output FA, FB, FC, FAD;
	
	Negate Neg_1(A,B,C,D,NA,NB,NC,ND);
	Divide_By_Two Div_1(A,B,C,D,DA,DB,DC,DD);
	Modulo_3 Mod_1(A,B,C,D,MA,MB,MC,MD);
	
	mux mux_a(A,A,B,C,D,NA,DA,MA,S0,S1,FA);
	mux mux_b(B,A,B,C,D,NB,DB,MB,S0,S1,FB);
	mux mux_c(C,A,B,C,D,NC,DC,MC,S0,S1,FC);
	mux mux_d(D,A,B,C,D,ND,DD,MD,S0,S1,FAD);

	
endmodule

module Negate(A,B,C,D,NA,NB,NC,ND);

		input A, B, C, D;
		output NA, NB, NC, ND;
		reg NA, NB, NC, ND;
		
		always @(A, B, C, D) begin
			NA <= ~A&B&D || ~A&~B&C || ~A&C || ~A&D || ~A&B&~C&~D;
			NB <= ~A&~B&C || ~A&~B&D || ~A&B&~C || A&~B || A&B&~C&~D;
			NC <= ~A&~B&~C&D || ~A&~B&C&~D || ~A&~B&~C&D || ~A&B&C&~D || A&~B&~C || A&~B&C&~D || A&B&~C&D || A&B&C&~D;
			ND <= ~A&~B&D || B&D || A&~B&~C || A&~B&C&D;
		end
endmodule

module Divide_By_Two(A,B,C,D,DA,DB,DC,DD);
	
		input A, B, C, D;
		output DA, DB, DC, DD;
		reg DA, DB, DC, DD;
		
		always @(A, B, C, D) begin
			DA <= A&~B || A&~C || A&~D;
			DB <= A&~B || A&~C || A&~D;
			DC <= ~A&B || A&~B&C&D || A&B&~C || A&B&~D;
			DD <= ~A&C || A&C&~D || A&D&~C;
		end
endmodule

module Modulo_3(A,B,C,D,MA,MB,MC,MD);
	
		input A, B, C, D;
		output MA, MB, MC, MD;
		reg MA, MB, MC, MD;
		
		always @(A, B, C, D) begin
			MA <= 0;
			MB <= 0;
			MC <= ~A&~B&~D&C || ~A&~C&D&B || ~B&~C&A&D || ~C&~D&A&B || A&B&C&D;
			MD <= ~A&~B&~C&D || ~A&~C&~D&B || ~A&B&C&D || A&~B&~C&~D || A&~B&C&D || A&B&C&~D;
		end
endmodule
	
module mux(MainI,A,B,C,D,NO,DO,MO,S0,S1,FOut);
		input MainI,A,B,C,D,NO,DO,MO,S0,S1;
		output FOut;
		reg FOut;
	
		always @(A,B,C,D,S0,S1)
		begin
			if (S0==0 && S1==0)
				FOut<= MainI ;
			else if(S0==0 && S1==1)
				FOut <= NO;
			else if(S0==1 && S1==0)
				FOut <= DO;
			else if(S0==1 && S1==1)
				FOut <= MO;
		end
endmodule



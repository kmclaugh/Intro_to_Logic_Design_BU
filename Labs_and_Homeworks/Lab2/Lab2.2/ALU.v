// Verilog Lab2.2

`timescale 1 ns / 1 ns

module Negate(A,B,C,D,NA,NB,NC,ND);

	input A, B, C, D;
	output NA, NB, NC, ND;
	reg NA, NB, NC, ND;
		
	always @(A, B, C, D) begin
		NA <= ~A&B || ~A&C || ~A&D;
		NB <= ~A&B || ~A&~C&D || B&~C&~D;
		NC <= C&~D || ~B&~C&D || A&~C&D;
		ND <= ~D&A || ~D&B || ~D&C || A&B&C&D;
	end
endmodule


module Divide_By_Two(A,B,C,D,DA,DB,DC,DD);
	
	input A, B, C, D;
	output DA, DB, DC, DD;
	reg DA, DB, DC, DD;
		
	always @(A, B, C, D) begin
		DA <= A&~B || A&~C || A&~D;
		DB <= A&~B || A&~C || A&~D;
		DC <= ~A&B || A&~B || A&~C ||A&~D;
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

module muxA(A,B,C,D,NA,DA,MA,S0,S1,FA);
	input A, B, C, D, NA, DA, MA, S0, S1;
	output FA;
	reg FA;
	
	always @(A,B,C,D,S0,S1)
	begin
		if (S0==0 && S1==0)
		begin
			FA <= A;
		end
		else if(S0==0 && S1==1)
		begin
			FA <= NA;
		end
		else if(S0==1 && S1==0)
		begin
			FA <= DA;
		end
		else if(S0==1 && S1==1)
		begin
			FA <= MA;
		end
	end
endmodule

module muxB(A,B,C,D,NB,DB,MB,S0,S1,FB);
	input A, B, C, D, NB, DB, MB, S0, S1;
	output FB;
	reg FB;
	
	always @(A,B,C,D,S0,S1)
	begin
		if (S0==0 && S1==0)
		begin
			FB <= B;
		end
		else if(S0==0 && S1==1)
		begin
			FB <= NB;
		end
		else if(S0==1 && S1==0)
		begin
			FB <= DB;
		end
		else if(S0==1 && S1==1)
		begin
			FB <= MB;
		end
	end
endmodule

module muxC(A,B,C,D,NC,DC,MC,S0,S1,FC);
	input A, B, C, D, NC, DC, MC, S0, S1;
	output FC;
	reg FC;
	
	always @(A,B,C,D,S0,S1)
	begin
		if (S0==0 && S1==0)
		begin
			FC <= C;
		end
		else if(S0==0 && S1==1)
		begin
			FC <= NC;
		end
		else if(S0==1 && S1==0)
		begin
			FC <= DC;
		end
		else if(S0==1 && S1==1)
		begin
			FC <= MC;
		end
	end
endmodule

module muxD(A,B,C,D,ND,DD,MD,S0,S1,FAD);
	input A, B, C, D, ND, DD, MD, S0, S1;
	output FAD;
	reg FAD;
	
	always @(A,B,C,D,S0,S1)
	begin
		if (S0==0 && S1==0)
		begin
			FAD <= D;
		end
		else if(S0==0 && S1==1)
		begin
			FAD <= ND;
		end
		else if(S0==1 && S1==0)
		begin
			FAD <= DD;
		end
		else if(S0==1 && S1==1)
		begin
			FAD <= MD;
		end
	end
endmodule


module ALU(A,B,C,D, S0,S1, NA,DA,MA,FA, NB,DB,MB,FB, NC,DC,MC,FC, ND,DD,MD,FAD);

	input A,B,C,D;
	input NA,DA,MA, NB,DB,MB, NC,DC,MC, ND,DD,MD;
	input S0,S1;
	output FA, FB, FC, FAD;
	
	muxA(A,B,C,D,NA,DA,MA,S0,S1,FA);
	muxB(A,B,C,D,NB,DB,MB,S0,S1,FB);
	muxC(A,B,C,D,NC,DC,MC,S0,S1,FC);
	muxD(A,B,C,D,ND,DD,MD,S0,S1,FAD);
endmodule
	

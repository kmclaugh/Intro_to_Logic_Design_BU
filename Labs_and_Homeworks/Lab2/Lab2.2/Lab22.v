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

`timescale 1 ns / 1 ns

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

`timescale 1 ns / 1 ns

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

`timescale 1 ns / 1 ns

module muxA(A,NA,DA,MA,S0,S1);
	input A, NA, DA, MA, S0, S1;
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

`timescale 1 ns / 1 ns

module muxB(B,NB,DB,MB,S0,S1);
	input B, NB, DB, MB, S0, S1;
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

`timescale 1 ns / 1 ns

module muxC(C,NC,DC,MC,S0,S1);
	input C, NC, DC, MC, S0, S1;
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

`timescale 1 ns / 1 ns

module muxD(D,ND,DD,MD,S0,S1);
	input D, ND, DD, MD, S0, S1;
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



module LED_Logic_Block(in,outm);
	
	input [3:0] in;
	output [6:0] outm;
	
	wire [6:0]outm;
	reg a,b,c,d,e,f,g;
	reg w,x,y,z;
	
	always @ (in) begin
		w <= in[3];
		x <= in[2];
		y <= in[1];
		z <= in[0];
	end
	
	
	always @(w,x,y,z)
	begin
		a = ~w&~x&~y&z || x&~y&~z || w&x || w&y;
		b = x&y&~z || x&~y&z || w&x || w&y;
		c = ~w&~x&y&~z || w&x || w&y;
		d = ~w&~x&~y&z || x&y&z || w&x || w&y || x&~y&~z;
		e = z || x&~y&~z || w&x || w&y;
		f = w&x || y&z || ~x&y&~z || ~w&~x&~y&z;
		g = ~w&~x&~y || x&y&z || w&x || w&y;
	end
	assign outm = {a,b,c,d,e,f,g};

endmodule
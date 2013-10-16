module FSM(enables,rst,go,clk,state);
	input enables;
	input clk;
	input go;
	input rst;
	output [2:0]state;
	
	parameter STOP = 3'b00;
	parameter CLKWISE = 3'b01;
	parameter CNTCLKWISE = 3'b10;
	parameter INIT = 3'b11;
	parameter SONGINIT = 3'b100;
	
	reg [2:0] state = STOP, nextstate = STOP;
	
	always @ (posedge clk or posedge rst) begin
			if (rst) begin
				state <= STOP;
				end
			else begin
			state <= nextstate;
			end
		end
		
			
	always @ (*) begin
		case (state)
			STOP: nextstate = go ? INIT : STOP;
			INIT: nextstate = go ? SONGINIT : INIT;
			SONGINIT: nextstate = go ? CLKWISE : SONGINIT;
			CLKWISE: nextstate = enables ? CNTCLKWISE : CLKWISE;
			CNTCLKWISE: nextstate = enables ? STOP : CNTCLKWISE;
		endcase
		end
endmodule 

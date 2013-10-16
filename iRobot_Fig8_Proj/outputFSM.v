module outputFSM(clk,state,bytesout,enable);

	input clk;
	input [1:0] state;
	output [7:0] bytesout;
	output enable;
	
	reg [1:0] prev_state;
	reg [39:0] data, next_data;
	reg [5:0] count = 0, next_count = 0;
	
	reg [7:0] bytesout;
	reg enable;
	
	parameter STOP = 3'b00;
	parameter CLKWISE = 3'b01;
	parameter CNTCLKWISE = 3'b10;
	parameter INIT = 3'b11;
	parameter SONGINIT = 3'b100;
	
	parameter START = 8'd128;
	parameter SAFE = 8'd131;
	parameter DRIVE = 8'd137;
	parameter SPEEDHIGH = 8'h00; // 200 mm/s
	parameter SPEEDLOW = 8'hC8;
	parameter CLKWISEHIGH = 8'hFE; // -500 mm radius
	parameter CLKWISELOW = 8'h0C;
	parameter CNTCLKWISEHIGH = 8'h01; // 500 mm radius
	parameter CNTCLKWISELOW = 8'hF4;
	
	always @ (posedge clk) begin
		if (prev_state != state) begin
			count <= next_count;
			data <= next_data;
		end else begin
			count <= (count > 0) ? (count - 1) : 6'b0;
			data <= data >> 8;
		end
		
		prev_state <= state;
		bytesout <= data[7:0];
		enable <= count != 0;
	end
			
	always @(state) begin
		case (state)
			INIT: begin
				next_count = 6'd2;
				next_data = {
					SAFE,
					START};
			end
			
			SONGINIT: begin
				next_count = 6'd9;
				next_data = {
					8'd32, // half
					8'd79, //G
					8'd32, // half
					8'd76, // E
					8'd32, // half-second
					8'd72, // middle C
					8'd3, // length
					8'd1, //song number
					8'd140}; //init song};
			end
			
			CLKWISE: begin
				next_count = 6'd5;
				next_data = {
					CLKWISELOW,
					CLKWISEHIGH,
					SPEEDLOW,
					SPEEDHIGH,
					DRIVE};
			end
			CNTCLKWISE: begin
				next_count = 6'd5;
				next_data = {
					CNTCLKWISELOW,
					CNTCLKWISEHIGH,
					SPEEDLOW,
					SPEEDHIGH,
					DRIVE};
			end
			STOP: begin
				next_count = 6'd5;
				next_data = {
					8'b0,
					8'b0,
					8'b0,
					8'b0,
					DRIVE};
			end
		endcase
	end //always


endmodule


module clkdividerb(clk_in, rst, clk_out);
  parameter FINAL_COUNT = 200;
  input clk_in;
  input rst;
  output clk_out;
  
  reg clk_out;
  reg [30:0] count = 0; 
    
  always @(posedge clk_in or posedge rst) begin
    if (rst == 1) begin
		  count = 0;
		  clk_out = 0;
    end
	 else
	   if (count == FINAL_COUNT) begin
		  clk_out = ~clk_out;
		  count = 0;
		end
		else begin
		  count = count + 1;
		end
  end

endmodule

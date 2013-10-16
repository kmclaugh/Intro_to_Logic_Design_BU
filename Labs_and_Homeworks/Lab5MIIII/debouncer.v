module debouncer(clk_1M, rst, din, dout);
  input clk_1M;
  input rst;
  input din;
  output dout;
  
  reg dout;
  reg [21:0] count;
  
  reg sync0;  // first stage of synchronizer
  reg sync1;  // second stage of synchronizer

  reg prev;   // register for edge detection

  // synchronize input. (Synchronizers will be discussed in a future lab.)
  always @(posedge clk_1M or posedge rst) begin
    if (rst == 1) begin
      sync0 <= 0;
		sync1 <= 0;
    end
    else begin
      sync0 <= din;
		sync1 <= sync0;
    end
  end // always
  
  // perform an edge detect on the synchronized input.
  always @(posedge clk_1M or posedge rst) begin
    if (rst == 1) begin
	   prev <= 0;
	 end
	 else begin
		prev <= sync1;
	 end
  end // always
  
  // state machine/counter for timing the debouncing.
  always @(posedge clk_1M or posedge rst) begin
    if (rst == 1) begin
		count <= 0;
	 end
	 else begin
      if (count == 0) begin
		  if (sync1 == 1 && prev == 0) begin  // rising edge detect
			 count <= 22'd100000;  // 100,000 us = 100ms delay
		  end
		  dout <= 0;
		end
		else begin
		  count <= count - 22'd1;
		  dout <= 1;
		end
	 end
  end // always

endmodule
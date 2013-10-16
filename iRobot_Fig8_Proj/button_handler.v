`timescale 1ns / 1ps

// Handles all the debouncing and ugliness of physical buttons
// Ticks once for each button press
module button_handler(clk, rst, x, x_clean);
	input clk, rst, x;
	output x_clean;
	
	wire x_debounced;
	
	debouncer dx(clk, rst, x, x_debounced);
	edge_detect ex(clk, rst, x_debounced, x_clean);

endmodule

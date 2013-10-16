`timescale 1ns / 1ps

module mission_control(
	input clk,
	//input [7:0] sw,
	//input btns,
	input btnu,
	//input btnl,
	input btnd,
	//input btnr,
	input RxD,
	output TxD,
	output [7:0] Led);
	//output [6:0] seg,
	//output [3:0] an);
	
	wire rs232;
	wire btn_reset, btn_go;
	wire en_fsm, en_fsm_reset;
	wire en_16_x_baud;
	wire tx_buffer_data_present, tx_buffer_half_full, tx_buffer_full;
	wire rx_buffer_data_present, rx_buffer_half_full, rx_buffer_full;
	wire [7:0] rx_data_out;
	wire rx_buffer_read;
	wire [2:0] FSMstate;
	wire [7:0] bytesout;
	wire enablepulse;
	
	wire tx_serial;
	wire rx_serial;
	
	// top button drives reset, bottom button drives write
	button_handler bh_reset(
		.clk(clk),
		.rst(1'b0), // don't reset this button ever I guess
		.x(btnu),
		.x_clean(btn_reset));
		
	button_handler bh_go(
		.clk(clk),
		.rst(1'b0),
		.x(btnd),
		.x_clean(btn_go));
	
	// get a 57600 kHz signal, synced to clk
	pulsar #(
		.FACTOR(109)) // 100 MHz / (16 * 57600 Hz)
	pbaud(
		.clk(clk),
		.rst(1'b0),
		.pulse(en_16_x_baud));
		
	// get a 16 sec square enable signal for the FSM
	pulsar #(
		.FACTOR(1_600_000_000)) // 100 MHz * 16 s
	pfsm(
		.clk(clk),
		.rst(btn_go),
		.pulse(en_fsm) );

	//FSM
	FSM FSM_1(
		.clk(clk),
		.enables(en_fsm),
		.go(btn_go), 
		.rst(btn_reset),
		.state(FSMstate));
		
	//outputFSM
	outputFSM outFSM(
		.clk(clk),
		.state(FSMstate),
		.bytesout(bytesout),
		.enable(enablepulse) );

	// transmit
	uart_tx6 tx(
		.clk(clk),
		.data_in(bytesout),
		.buffer_write(enablepulse),
		.buffer_reset(btn_reset),
		.en_16_x_baud(en_16_x_baud),
		.serial_out(tx_serial),
		.buffer_data_present(tx_buffer_data_present),
		.buffer_half_full(tx_buffer_half_full),
		.buffer_full(tx_buffer_full) );
	
	assign TxD = ~tx_serial;
	
	// receive
	assign rx_serial = ~RxD;
	
	uart_rx6 rx(
		.clk(clk),
		.serial_in(rx_serial),
		.buffer_read(rx_buffer_read),
		.buffer_reset(btn_reset),
		.en_16_x_baud(en_16_x_baud),
		.data_out(rx_data_out),
		.buffer_data_present(rx_buffer_data_present),
		.buffer_half_full(rx_buffer_half_full),
		.buffer_full(rx_buffer_full) );
		
	watch_rx wrx(
		.clk(clk),
		.rst(btn_reset),
		.data_present(rx_buffer_data_present),
		.data(rx_data_out),
		.buffer_read(rx_buffer_read),
		.data_hold(Led) );
	/* breaks simulator
	// report buffer state via 7-seg display
	BCD_to_7seg_4digit bcd0(
		.in3(4'hF),
		.in2(4'hF),
		.in1({1'b0, tx_buffer_full, tx_buffer_half_full, tx_buffer_data_present}),
		.in0({1'b0, rx_buffer_full, rx_buffer_half_full, rx_buffer_data_present}),
		.clk(clk),
		.rst(btn_reset),
		.seg(seg),
		.an(an) );
   */
endmodule

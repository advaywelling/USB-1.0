`timescale 1ns / 10ps

module usb_tx (
    input clk, n_rst,
    input logic [7:0] tx_packet_data,
    input logic [6:0] buffer_occupancy,
    input logic [2:0] tx_packet,
    output logic dp_out, dm_out,
    output logic tx_transfer_active, tx_error, get_tx_packet_data
);

    logic byte_done, timer_en, timer_clr, load_en, send_eop, shift_strobe, sr_to_stuffer, bit_done;//stuffer_to_encoder; 
    logic [7:0]data_to_send;
    logic [4:0]curr_state;
    logic [3:0]pd_count, bit_count;
    //logic shift_en;

    txcu fsm_ctrl(
        .clk(clk),
        .n_rst(n_rst),
        .tx_packet_data(tx_packet_data),
        .buffer_occupancy(buffer_occupancy),
        .tx_packet(tx_packet),
        .byte_done(byte_done),
        .bit_done(bit_done),
        .pd_count(pd_count),
        .bit_count(bit_count),
        .data_to_send(data_to_send),
        .timer_en(timer_en), 
        .timer_clr(timer_clr),
        .load_en(load_en),
        .send_eop(send_eop),
        .tx_transfer_active(tx_transfer_active),
        .get_tx_packet_data(get_tx_packet_data),
        .tx_error(tx_error),
        .curr_state(curr_state)
    );

    tx_timer timer(
        .clk(clk), 
        .n_rst(n_rst),
        .timer_en(timer_en), 
        .timer_clr(timer_clr),
        .byte_done(byte_done),
        .bit_done(bit_done),
        .shift_strobe(shift_strobe),
        .pd_count(pd_count),
        .bit_count(bit_count)
    );

    flex_sr #(
        .SIZE(8),
        .MSB_FIRST(0)
    ) pts_register (
        .clk(clk),
        .n_rst(n_rst),
        .shift_enable(shift_strobe),
        .load_enable(load_en),
        .serial_in(1'b1),
        .parallel_in(data_to_send),
        .serial_out(sr_to_stuffer),
        .parallel_out()
    );

    encoder encoder_module(
        .clk(clk), 
        .n_rst(n_rst),
        .serial_in(sr_to_stuffer),
        .shift_strobe(shift_strobe),
        .curr_state(curr_state),
        .send_eop(send_eop),
        .dp_out(dp_out),
        .dm_out(dm_out)
    );

    // bit_stuffer stuffer(
    //     .clk(clk),
    //     .n_rst(n_rst),
    //     .serial_in(sr_to_stuffer),
    //     .shift_strobe(shift_strobe),
    //     .bit_out(stuffer_to_encoder),
    //     .shift_en(shift_en)
    // );

endmodule


`timescale 1ns / 10ps

module usb_rx #(
    // parameters
) (
    input clk, n_rst,
    input logic dp_in, dm_in,
    input logic [6:0] buffer_occupancy,
    output logic flush,
    output logic rx_data_ready, rx_transfer_active, rx_error, rx_store_packet_data,
    output logic [7:0] rx_packet_data, 
    output logic [2:0] rx_packet
);
    logic d_orig, error, end_packet;
    logic [7:0] input_data, byte_reg;
    logic unused, serial_out;
    logic shift_enable;
    logic valid_byte, start_count;
    logic bit_done, unused3;
    logic [3:0] pd_count, bit_count, unused1, unused2;
    logic restart;
    decoder nrzi (
        .clk(clk),
        .n_rst(n_rst),
        .restart(restart),
        .dp_in(dp_in),
        .dm_in(dm_in),
        .sample_en(shift_enable),
        .d_orig(d_orig),
        .error(error),
        .end_packet(end_packet)
    );

    flex_sr_rx #(.MSB_FIRST(0)) bit_shift (
        .clk(clk),
        .n_rst(n_rst),
        .restart(restart),
        .shift_enable(shift_enable),
        .load_enable(1'b0),
        .serial_in(d_orig),
        .parallel_in(8'b0),
        .serial_out(serial_out),
        .parallel_out(input_data)
    );
    assign unused = serial_out;
    always_ff @(posedge clk, negedge n_rst, posedge restart) begin
        if (!n_rst)
            byte_reg <= 8'b0;
        else if (restart)
            byte_reg <= 8'b0;
        else    
            byte_reg <= input_data;
    end
    rx_cu rcu (
        .clk(clk),
        .n_rst(n_rst),
        .restart(restart),
        .byte_reg(byte_reg),
        .end_packet(end_packet),
        .error(error),
        .valid_byte(valid_byte),
        .shift_strobe(shift_enable),
        .buffer_occupancy(buffer_occupancy),
        .start_count(start_count),
        .rx_packet_data(rx_packet_data),
        .rx_transfer_active(rx_transfer_active),
        .rx_error(rx_error),
        .rx_store_packet_data(rx_store_packet_data),
        .rx_data_ready(rx_data_ready),
        .flush(flush),
        .rx_packet(rx_packet)
    );
    logic temp;
    assign temp = error || start_count;
    rx_timer timer (
        .clk(clk),
        .n_rst(n_rst),
        .restart(restart),
        .timer_en(1'b1),
        .timer_clr(temp),
        .bit_done(bit_done),
        .shift_strobe(shift_enable),
        .byte_done(valid_byte),
        .pd_count(pd_count),
        .bit_count(bit_count)
    );
    assign unused1 = pd_count;
    assign unused2 = bit_count;
    assign unused3 = bit_done;
endmodule

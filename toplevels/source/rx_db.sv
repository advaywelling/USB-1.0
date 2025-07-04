`timescale 1ns / 10ps

module rx_db #(
    // parameters
) (
    input clk, n_rst,
    input logic dp_in, dm_in,
    input logic clear, get_rx_data, 
    input logic [7:0] tx_data,
    input logic get_tx_packet_data, store_tx_data,
    output logic [7:0] rx_data, tx_packet_data,
    output logic [2:0] rx_packet, 
    output logic rx_transfer_active, rx_data_ready,rx_error,
    output logic [6:0] buffer_occupancy
);
    logic [7:0] rx_packet_data;
    logic rx_store_packet_data;
    logic flush;
    logic [6:0] occupancy;

    usb_rx rx (
        .clk(clk),
        .n_rst(n_rst),
        .dp_in(dp_in),
        .dm_in(dm_in),
        .buffer_occupancy(occupancy),
        .flush(flush),
        .rx_data_ready(rx_data_ready),
        .rx_error(rx_error),
        .rx_store_packet_data(rx_store_packet_data),
        .rx_packet(rx_packet),
        .rx_packet_data(rx_packet_data),
        .rx_transfer_active(rx_transfer_active)
    );

    data_buffer db (
        .clk(clk),
        .n_rst(n_rst),
        .flush(flush),
        .clear(clear),
        .get_rx_data(get_rx_data),
        .get_tx_packet_data(get_tx_packet_data),
        .store_tx_data(store_tx_data),
        .store_rx_packet_data(rx_store_packet_data),
        .tx_data(tx_data),
        .rx_packet_data(rx_packet_data),
        .buffer_occupancy(occupancy),
        .tx_packet_data(tx_packet_data),
        .rx_data(rx_data)
    );
    assign buffer_occupancy = occupancy;
endmodule


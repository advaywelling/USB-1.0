`timescale 1ns / 10ps

module tx_db (
    input clk, n_rst,
    input logic [7:0] tx_data,
    input logic [7:0] rx_packet_data,
    input logic store_tx_data,
    input logic store_rx_packet_data,
    input logic get_rx_data,
    input logic [2:0] tx_packet,
    input logic flush,
    input logic clear,
    output logic [6:0] buffer_occupancy,
    output logic [7:0] rx_data,
    output logic dp_out,
    output logic dm_out,
    output logic tx_transfer_active,
    output logic tx_error
);

    logic [7:0] tx_packet_data;
    logic get_tx_packet_data;
    logic [6:0] occupancy;

    usb_tx transmitter(
        .clk(clk),
        .n_rst(n_rst),
        .tx_packet_data(tx_packet_data),
        .buffer_occupancy(occupancy),
        .tx_packet(tx_packet),
        .dp_out(dp_out),
        .dm_out(dm_out),
        .tx_transfer_active(tx_transfer_active),
        .tx_error(tx_error),
        .get_tx_packet_data(get_tx_packet_data)
    );

    data_buffer buffer(
        .clk(clk),
        .n_rst(n_rst),
        .flush(flush),
        .clear(clear),
        .get_rx_data(get_rx_data),
        .get_tx_packet_data(get_tx_packet_data),
        .store_tx_data(store_tx_data),
        .store_rx_packet_data(store_rx_packet_data),
        .tx_data(tx_data),
        .rx_packet_data(rx_packet_data),
        .buffer_occupancy(occupancy),
        .tx_packet_data(tx_packet_data),
        .rx_data(rx_data)
    );

    assign buffer_occupancy = occupancy;

endmodule


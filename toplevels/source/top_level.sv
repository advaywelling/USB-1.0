`timescale 1ns / 10ps

module top_level #(
    // parameters
) (
    input logic clk,
    input logic n_rst,
    input logic hsel,
    input logic [3:0] haddr,
    input logic [1:0] hsize,
    input logic [1:0] htrans,
    input logic hwrite,
    input logic [31:0] hwdata,
    output logic [31:0] hrdata,
    output logic hresp,
    output logic hready,
    input logic dp_in,
    input logic dm_in,
    output logic d_mode,
    output logic dp_out,
    output logic dm_out
);

    logic [6:0] occupancy;
    logic rx_transfer_active, rx_data_ready, rx_error;
    logic [2:0] rx_packet, tx_packet;
    logic flush;
    logic [7:0] rx_data, tx_data;
    logic get_rx_data, store_tx_data;
    logic clear;
    logic [7:0] tx_packet_data, rx_packet_data;
    logic store_rx_packet_data, get_tx_packet_data;

    logic tx_transfer_active, tx_error;

    ahb_subordinate_lite ahb(
        .clk(clk),
        .n_rst(n_rst),
        .hsel(hsel),
        .haddr(haddr),
        .hsize(hsize),
        .htrans(htrans),
        .hwrite(hwrite),
        .hwdata(hwdata),
        .hrdata(hrdata),
        .hready(hready),
        .hresp(hresp),
        .rx_packet(rx_packet),
        .rx_data_ready(rx_data_ready),
        .rx_transfer_active(rx_transfer_active),
        .rx_error(rx_error),
        .d_mode(d_mode),
        .buffer_occupancy(occupancy),
        .rx_data(rx_data),
        .get_rx_data(get_rx_data),
        .store_tx_data(store_tx_data),
        .tx_data(tx_data),
        .clear(clear),
        .tx_packet(tx_packet),
        .tx_transfer_active(tx_transfer_active),
        .tx_error(tx_error)
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
    usb_rx rx (
        .clk(clk),
        .n_rst(n_rst),
        .dp_in(dp_in),
        .dm_in(dm_in),
        .buffer_occupancy(occupancy),
        .flush(flush),
        .rx_data_ready(rx_data_ready),
        .rx_error(rx_error),
        .rx_store_packet_data(store_rx_packet_data),
        .rx_packet(rx_packet),
        .rx_packet_data(rx_packet_data),
        .rx_transfer_active(rx_transfer_active)
    );



endmodule


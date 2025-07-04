`timescale 1ns / 10ps

module ahb_db (
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
    input logic [2:0] rx_packet,
    input logic rx_data_ready,
    input logic rx_transfer_active,
    input logic rx_error,
    output logic d_mode,
    output logic [2:0] tx_packet,
    input logic tx_transfer_active,
    input logic tx_error,
    //db stuff below
    input logic flush,
    output logic [6:0] buffer_occupancy,
    input logic store_rx_packet_data,
    input logic [7:0] rx_packet_data,
    input logic get_tx_packet_data,
    output logic [7:0] tx_packet_data
);

    logic [6:0] buffocc;
    logic [7:0] rx_data, tx_data;
    logic get_rx_data, store_tx_data, clear;

    ahb_subordinate_lite ahb_sub (.clk(clk), .n_rst(n_rst), .hsel(hsel), .haddr(haddr), 
                                  .hsize(hsize), .htrans(htrans), .hwrite(hwrite), .hwdata(hwdata),
                                  .hrdata(hrdata), .hready(hready), .hresp(hresp), .rx_packet(rx_packet),
                                  .rx_data_ready(rx_data_ready), .rx_transfer_active(rx_transfer_active),
                                  .rx_error(rx_error), .d_mode(d_mode), .buffer_occupancy(buffocc), .rx_data(rx_data),
                                  .get_rx_data(get_rx_data), .store_tx_data(store_tx_data), .tx_data(tx_data), .clear(clear),
                                  .tx_packet(tx_packet), .tx_transfer_active(tx_transfer_active), .tx_error(tx_error));

    data_buffer db(.clk(clk), .n_rst(n_rst), .flush(flush), .clear(clear), .get_rx_data(get_rx_data), .get_tx_packet_data(get_tx_packet_data),
                   .store_tx_data(store_tx_data), .store_rx_packet_data(store_rx_packet_data), .tx_data(tx_data),
                   .rx_packet_data(rx_packet_data), .buffer_occupancy(buffocc), .tx_packet_data(tx_packet_data), .rx_data(rx_data));

    assign buffer_occupancy = buffocc;

endmodule


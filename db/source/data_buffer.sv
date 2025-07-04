`timescale 1ns / 10ps

module data_buffer #(
    // parameters
) (
    input clk, n_rst,
    input logic flush, clear,
    input logic get_rx_data, get_tx_packet_data,
    input logic store_tx_data, store_rx_packet_data,
    input logic [7:0] tx_data, rx_packet_data,
    output logic [6:0] buffer_occupancy,
    output logic [7:0] tx_packet_data, rx_data
);

    logic [7:0] curr_reg [0:63];
    logic [7:0] next_reg [0:63];
    logic [5:0] curr_read_ptr, curr_write_ptr, next_read_ptr, next_write_ptr;
    logic [6:0]curr_occupancy, next_occupancy;
    logic [7:0] curr_tx_packet_data, next_tx_packet_data, curr_rx_data, next_rx_data;

    always_ff @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            for(int i=0; i<64; i++) begin
                curr_reg[i] <= 8'h0;
            end
            curr_write_ptr <= 6'h0;
            curr_read_ptr <= 6'h0;
            curr_occupancy <= 7'h0;
            curr_tx_packet_data <= 8'd0;
            curr_rx_data <= 8'd0;
        end else begin
            curr_reg <= next_reg;
            curr_write_ptr <= next_write_ptr;
            curr_read_ptr <= next_read_ptr;
            curr_occupancy <= next_occupancy;
            curr_tx_packet_data <= next_tx_packet_data;
            curr_rx_data <= next_rx_data;
        end
    end

    always_comb begin : _WRITE
        next_reg = curr_reg;
        next_write_ptr = curr_write_ptr;

        if(clear || flush) begin
            next_write_ptr = 6'h0;
        end else if(curr_occupancy < 7'd64) begin
            if(store_tx_data) begin
                next_reg[curr_write_ptr] = tx_data;
                next_write_ptr = curr_write_ptr == 6'd63 ? 6'd0 : curr_write_ptr + 1;
            end else if(store_rx_packet_data) begin
                next_reg[curr_write_ptr] = rx_packet_data;
                next_write_ptr = curr_write_ptr == 6'd63 ? 6'd0 : curr_write_ptr + 1;
            end
        end
    end

    /*always_comb begin : _OCCUPANCY
    next_occupancy = curr_occupancy;

        if(next_write_ptr >= next_read_ptr) begin
            next_occupancy = next_write_ptr - next_read_ptr;
        end else begin
            next_occupancy = next_write_ptr + (64 - next_read_ptr);
        end
    end*/

    always_comb begin : _OCCUPANCY
        next_occupancy = curr_occupancy;

        if (clear || flush) begin
            next_occupancy = 7'd0;
        end else begin
            if ((store_tx_data||store_rx_packet_data) && !(get_tx_packet_data||get_rx_data)) begin
                next_occupancy = (curr_occupancy<7'd64) ? curr_occupancy+7'd1 : 7'd64;
            end else if ((get_tx_packet_data||get_rx_data) && !(store_tx_data||store_rx_packet_data)) begin
                next_occupancy = (curr_occupancy>0) ? curr_occupancy-7'd1 : 7'd0;
            end
        end
    end

    always_comb begin : _READ
        next_tx_packet_data = curr_tx_packet_data;
        next_rx_data = curr_rx_data;
        next_read_ptr = curr_read_ptr;
        if(clear || flush) begin
            next_read_ptr = 6'd0;
        end else if(get_tx_packet_data) begin
            next_tx_packet_data = curr_reg[curr_read_ptr];
            next_read_ptr = curr_read_ptr == 6'd63 ? 6'd0 : curr_read_ptr + 1;
        end else if(get_rx_data) begin
            next_rx_data = curr_reg[curr_read_ptr];
            next_read_ptr = curr_read_ptr == 6'd63 ? 6'd0 : curr_read_ptr + 1;
        end
    end

    assign tx_packet_data = curr_tx_packet_data;
    assign rx_data = curr_rx_data;
    assign buffer_occupancy = curr_occupancy;

endmodule


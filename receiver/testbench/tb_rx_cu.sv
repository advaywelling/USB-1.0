`timescale 1ns / 10ps
/* verilator coverage_off */

module tb_rx_cu ();

    localparam CLK_PERIOD = 10ns;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars;
    end

    logic clk, n_rst;
    logic [7:0] byte_reg;
    logic end_packet, error;
    logic valid_byte;
    logic [6:0] buffer_occupancy;
    logic start_count;
    logic [7:0] rx_packet_data;
    logic rx_transfer_active, rx_error, rx_store_packet_data;
    logic rx_data_ready, flush;
    logic [3:0] rx_packet;

    // clockgen
    always begin
        clk = 0;
        #(CLK_PERIOD / 2.0);
        clk = 1;
        #(CLK_PERIOD / 2.0);
    end

    task reset_dut;
    begin
        n_rst = 0;
        byte_reg = 8'b0;
        end_packet = 0;
        valid_byte = 0;

        @(posedge clk);
        @(posedge clk);
        @(negedge clk);
        n_rst = 1;
        @(posedge clk);
        @(posedge clk);
    end
    endtask

    rx_cu #() DUT (
        .clk(clk),
        .n_rst(n_rst),
        .byte_reg(byte_reg),
        .end_packet(end_packet),
        .error(error),
        .valid_byte(valid_byte),
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

    initial begin
        n_rst = 1;
        byte_reg = 8'h0;
        buffer_occupancy = 0;
        end_packet = 0;
        error = 0;
        valid_byte = 0;
        reset_dut;
        // 1 data byte test
        byte_reg = 8'h01; // sync
        @(posedge clk);
        @(posedge clk);
        valid_byte = 1;
        byte_reg = 8'b11000011; // data PID
        @(posedge clk);
        valid_byte = 0;
        @(posedge clk);
        valid_byte = 1;
        byte_reg = 8'b11111111; // data byte
        @(posedge clk);
        valid_byte = 0;
        end_packet = 1; 
        @(posedge clk);
        @(posedge clk);
        end_packet = 0;
        @(posedge clk);
        reset_dut;
        // multiple data bytes test
        byte_reg = 8'h01; // sync
        @(posedge clk);
        @(posedge clk);
        valid_byte = 1;
        byte_reg = 8'b11000011; // data PID
        @(posedge clk);
        valid_byte = 0;
        @(posedge clk);
        valid_byte = 1;
        byte_reg = 8'b11111111; // data byte
        @(posedge clk);
        @(posedge clk);
        byte_reg = 8'b10101010; // data byte
        @(posedge clk);
        end_packet = 1;
        @(posedge clk);
        @(posedge clk);
        reset_dut;
        // wrong sync byte
        byte_reg = 8'h02;
        @(posedge clk);
        reset_dut;
        $finish;
    end
endmodule

/* verilator coverage_on */

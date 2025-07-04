`timescale 1ns / 10ps
/* verilator coverage_off */

module tb_rx_db ();

    localparam CLK_PERIOD = 10ns;
    localparam CLK_DIV = 83.33ns;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars;
    end

    logic clk, n_rst, clk_div;
    logic dp_in, dm_in;
    logic clear, get_rx_data; 
    logic [7:0] tx_data;
    logic get_tx_packet_data, store_tx_data;
    logic [7:0] rx_data, tx_packet_data;
    logic [2:0] rx_packet;
    logic rx_transfer_active, rx_data_ready,rx_error;
    logic [6:0] buffer_occupancy;
    // clockgen
    always begin
        clk = 0;
        #(CLK_PERIOD / 2.0);
        clk = 1;
        #(CLK_PERIOD / 2.0);
    end
    always begin
        clk_div = 0;
        #(CLK_DIV / 2.0);
        clk_div = 1;
        #(CLK_DIV / 2.0);
    end

    task reset_dut;
    begin
        n_rst = 0;
        @(posedge clk);
        @(posedge clk);
        @(negedge clk);
        n_rst = 1;
        @(posedge clk);
        @(posedge clk);
    end
    endtask
    task sync_byte;
    begin
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        @(posedge clk_div);
    end
    endtask
    task pid_handshake;
    begin
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
    end
    endtask
    task pid_data_byte;
    begin
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
    end
    endtask
    task data_byte;
    begin
        dp_in = 1;
        dm_in = 0;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk_div);
    end
    endtask
    task send_eop;
    begin
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 0;
        @(posedge clk_div);
        dp_in = 0;
        dm_in = 0;
        @(posedge clk_div);
    end
    endtask
    rx_db #() DUT (
        .clk(clk),
        .n_rst(n_rst),
        .dp_in(dp_in),
        .dm_in(dm_in),
        .clear(clear), 
        .get_rx_data(get_rx_data),
        .tx_data(tx_data),
        .get_tx_packet_data(get_tx_packet_data), 
        .store_tx_data(store_tx_data),
        .rx_data(rx_data),
        .tx_packet_data(tx_packet_data), 
        .rx_packet(rx_packet),
        .rx_transfer_active(rx_transfer_active),
        .rx_data_ready(rx_data_ready),
        .rx_error(rx_error),
        .buffer_occupancy(buffer_occupancy)
    );

    initial begin
        n_rst = 1;
        dp_in = 1'b0;
        dm_in = 1'b0;
        clear = 0;
        get_tx_packet_data = 0;
        store_tx_data = 0;
        get_rx_data = 0;
        reset_dut;
        // small data
        sync_byte();
        pid_data_byte();
        data_byte();
        send_eop();
        @(posedge clk);
        @(posedge clk);
        @(negedge clk);
        @(posedge clk);
        @(posedge clk);
        // large data 
        sync_byte();
        pid_data_byte();
        for (int i = 0; i < 64; i++) begin
            data_byte();
        end
        send_eop();
        /*
        @(posedge clk);
        @(posedge clk);
        @(negedge clk);
        @(posedge clk);
        @(posedge clk);
        */
        @(posedge clk_div);
        reset_dut;
        // too many data bytes
        sync_byte();
        pid_data_byte();
        for (int i = 0; i < 65; i++) begin
            data_byte();
        end
        data_byte();
        send_eop(); 
        $finish;
    end
endmodule

/* verilator coverage_on */

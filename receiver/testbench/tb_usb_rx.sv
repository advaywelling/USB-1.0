`timescale 1ns / 10ps
/* verilator coverage_off */

module tb_usb_rx ();

    localparam CLK_PERIOD = 10ns;
    localparam CLK_DIV = 83.33ns;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars;
    end

    logic clk, n_rst, clk_div;
    logic dp_in, dm_in;
    logic [6:0] buffer_occupancy;
    logic flush;
    logic rx_data_ready, rx_transfer_active, rx_error, rx_store_packet_data;
    logic [7:0] rx_packet_data; 
    logic [2:0] rx_packet;
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
    task pid_handshake_in;
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
    task send_address_byte;
    begin

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
        //@(posedge clk_div);
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
    task invalid_pid_byte;
    begin
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
    usb_rx #() DUT (
        .clk(clk),
        .n_rst(n_rst),
        .dp_in(dp_in),
        .dm_in(dm_in),
        .buffer_occupancy(buffer_occupancy),
        .flush(flush),
        .rx_data_ready(rx_data_ready),
        .rx_error(rx_error),
        .rx_packet(rx_packet),
        .rx_packet_data(rx_packet_data),
        .rx_store_packet_data(rx_store_packet_data),
        .rx_transfer_active(rx_transfer_active)
    );

    initial begin
        n_rst = 1;
        dp_in = 1'b0;
        dm_in = 1'b0;
        buffer_occupancy = 7'b0;
        reset_dut;
        // 1 data byte testcase
        sync_byte();
        pid_data_byte();
        data_byte();
        send_eop();
        //reset_dut;
        @(posedge clk);
        @(posedge clk);
        @(negedge clk);
        @(posedge clk);
        @(posedge clk);
        // 2 data byte testcase
        sync_byte();
        pid_data_byte();
        data_byte();
        data_byte();
        send_eop();

        @(posedge clk);
        @(posedge clk);
        @(negedge clk);
        @(posedge clk);
        @(posedge clk);
        //reset_dut;
        // multiple data byte testcase
        sync_byte();
        pid_data_byte();
        data_byte();
        data_byte();
        data_byte();
        data_byte();
        data_byte();
        data_byte();
        send_eop();
        @(posedge clk);
        @(posedge clk);
        @(negedge clk);
        @(posedge clk);
        @(posedge clk);
        // invalid PID testcase
        sync_byte();
        invalid_pid_byte();
        @(posedge clk_div);
        @(posedge clk_div);
        reset_dut();
        sync_byte();
        pid_handshake_in();
        send_address_byte();
        repeat (16) begin
            @(posedge clk_div);
        end
        @(posedge clk_div);
        send_eop();
        @(posedge clk_div);
        $finish;
    end
endmodule

/* verilator coverage_on */

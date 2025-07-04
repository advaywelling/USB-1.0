`timescale 1ns / 10ps
/* verilator coverage_off */

module tb_tx_db ();

    localparam CLK_PERIOD = 10ns;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars;
    end

    //Inputs
    logic clk, n_rst;
    logic [7:0] tx_data;
    logic [7:0] rx_packet_data;
    logic store_tx_data;
    logic store_rx_packet_data;
    logic get_rx_data;
    logic [2:0] tx_packet;
    logic flush;
    logic clear;

    //Outptus
    logic [6:0] buffer_occupancy;
    logic [7:0] rx_data;
    logic dp_out;
    logic dm_out;
    logic tx_transfer_active;
    logic tx_error;

    typedef enum logic [2:0] {OUT, IN, DATA0, DATA1, ACK, NAK, STALL} tx_packet_type;

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
        @(posedge clk);
        @(posedge clk);
        @(negedge clk);
        n_rst = 1;
        @(posedge clk);
        @(posedge clk);
    end
    endtask

    tx_db #() DUT (.*);

    logic [7:0] temp_rx_data[0:63];
    logic [7:0] temp_tx_data[0:63];

    task write_to_buffer;
        input logic store_rx;
        input logic store_tx;
        input integer no_of_bytes;
        integer i;
    begin
        if(store_rx) begin
            for(i=0; i<no_of_bytes; i++) begin
                @(posedge clk);
                rx_packet_data = temp_rx_data[i];
                store_rx_packet_data = store_rx;
                @(posedge clk);
            end
            store_rx_packet_data = 1'b0;
        end else if(store_tx) begin
            @(posedge clk);
            for(i=0; i<no_of_bytes; i++) begin
                tx_data = temp_tx_data[i];
                store_tx_data = store_tx;
                @(posedge clk);
            end
            store_tx_data = 1'b0;
        end
        else begin
        end
    end
    endtask

    integer j;
    string test_case;

    initial begin
        n_rst = 1;
        tx_data = 8'h0;
        rx_packet_data = 8'h0;
        store_tx_data = 1'b0;
        store_rx_packet_data = 1'b0;
        get_rx_data = 1'b0;
        tx_packet = 3'b111;
        flush = 1'b0;
        clear = 1'b0;
        test_case = "Reset On";

        reset_dut;

        temp_tx_data[0] = 8'd100;
        temp_rx_data[0] = 8'd100;
        for(j=1; j<64; j++) begin
            temp_rx_data[j] = temp_rx_data[j-1] + 8'h1;
            temp_tx_data[j] = temp_tx_data[j-1] + 8'h1;
        end
        @(posedge clk);

        //DATA0 (1 byte)
        test_case = "Writing to Buffer";
        write_to_buffer(1'b1, 1'b0, 1);
        @(posedge clk);
        n_rst = 1'b1;
        test_case = "DATA0 1b TX";
        tx_packet = DATA0;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        while(tx_transfer_active != 1'b0) begin
            @(posedge clk);
        end
        @(posedge clk)
        //reset_dut;
        tx_packet = 3'b111;
        #(20ns);

        //DATA0 (5 bytes)
        @(posedge clk)
        test_case = "Writing to Buffer";
        write_to_buffer(1'b0, 1'b1, 5);
        @(posedge clk);
        test_case = "DATA0 5b TX";
        tx_packet = DATA0;
        #(30ns);
        while(tx_transfer_active != 1'b0) begin
            @(posedge clk);
        end
        @(posedge clk)
        tx_packet = 3'b111;
        #(20ns);


        $finish;
    end
endmodule

/* verilator coverage_on */


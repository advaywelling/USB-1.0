`timescale 1ns / 10ps
/* verilator coverage_off */

module tb_data_buffer ();

    localparam CLK_PERIOD = 10ns;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars;
    end

    // INPUTS
    logic clk, n_rst;
    logic flush, clear;
    logic get_rx_data, get_tx_packet_data;
    logic store_tx_data, store_rx_packet_data;
    logic [7:0] tx_data, rx_packet_data;

    // OUTPUTS
    logic [6:0] buffer_occupancy;
    logic [7:0] tx_packet_data, rx_data;

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

    data_buffer #() DUT (.*);

    logic [7:0] temp_rx_data [0:63];
    logic [7:0] temp_tx_data [0:63];

    task write_to_buffer;
        input logic store_rx;
        input logic store_tx;
        input integer no_of_bytes;
        integer i;
    begin
        if(store_rx) begin
            for(i=0; i<no_of_bytes; i++) begin
                rx_packet_data = temp_rx_data[i];
                store_rx_packet_data = store_rx;
                @(posedge clk);
            end
            store_rx_packet_data = 1'b0;
        end else if(store_tx) begin
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

    task read_from_buffer;
        input logic get_rx;
        input logic get_tx;
        input integer no_of_bytes;
        integer i;
    begin
        if(get_rx) begin
            @(posedge clk);
            for(i=0; i<no_of_bytes; i++) begin
                get_rx_data = get_rx;
                @(posedge clk);
            end
            get_rx_data = 1'b0;
        end else if(get_tx) begin
            @(posedge clk);
            for(i=0; i<no_of_bytes; i++) begin
                get_tx_packet_data = get_tx;
                @(posedge clk);
            end
            get_tx_packet_data = 1'b0;
        end
        else begin
        end
    end
    endtask


    integer j;
    string test_case;

    initial begin
        n_rst = 1;
        flush = 1'b0;
        clear = 1'b0;
        get_rx_data = 1'b0;
        get_tx_packet_data = 1'b0;
        store_tx_data = 1'b0;
        store_rx_packet_data = 1'b0;
        tx_data = 8'h0;
        rx_packet_data = 8'h0;
        
        for(int j=0; j<64; j++) begin
            temp_rx_data[j] = 8'h0;
            temp_tx_data[j] = 8'h0;
        end

        reset_dut;

        //RX-side small payload write (1 byte)
        test_case = "RX write 1b";
        temp_rx_data[0] = 8'h7C;
        write_to_buffer(1'b1, 1'b0, 1);
        #(30ns);


        test_case = "flush";
        @(posedge clk);
        flush = 1'b1;
        @(posedge clk);
        flush = 1'b0;

        //RX-side large payload write (20 bytes)
        test_case = "RX write 20b";
        @(posedge clk);
        temp_rx_data[0] = 8'h1;
        for(j=1; j<64; j++) begin
            temp_rx_data[j] = temp_rx_data[j-1] + 1;
        end
        write_to_buffer(1'b1, 1'b0, 20);
        #(20ns);

        //RX-side max payload write (64 bytes)
        @(posedge clk);
        flush = 1'b1;
        @(posedge clk);
        flush = 1'b0;
        test_case = "RX write 64b";
        @(posedge clk);
        temp_rx_data[0] = 8'd50;
        for(j=1; j<64; j++) begin
            temp_rx_data[j] = temp_rx_data[j-1] + 1;
        end
        write_to_buffer(1'b1, 1'b0, 64);
        #(20ns);

        //TX-side small read (1 byte)
        test_case = "TX read 1b";
        read_from_buffer(1'b0, 1'b1, 1);
        #(20ns);

        //TX-side large read (20 bytes)
        test_case = "TX read 20b";
        read_from_buffer(1'b0, 1'b1, 20);
        #(20ns);

        //AHB-side max write (64 bytes)
        test_case = "AHB write 64b";
        @(posedge clk);
        flush = 1'b1;
        @(posedge clk);
        flush = 1'b0;
        @(posedge clk);
        temp_tx_data[0] = 8'd100;
        for(j=1; j<64; j++) begin
            temp_tx_data[j] = temp_tx_data[j-1] + 1;
        end
        write_to_buffer(1'b0, 1'b1, 64);
        #(20ns);

        //TX-side max read (64 bytes)
        test_case = "TX read 64b";
        read_from_buffer(1'b0, 1'b1, 64);
        #(20ns);

        //AHB-side large write (20 bytes)
        test_case = "AHB write 20b";
        @(posedge clk);
        @(posedge clk);
        flush = 1'b0;
        @(posedge clk);
        temp_tx_data[0] = 8'd200;
        for(j=1; j<64; j++) begin
            temp_tx_data[j] = temp_tx_data[j-1] + 1;
        end
        write_to_buffer(1'b0, 1'b1, 20);
        #(20ns);

        //AHB-side large read (20 bytes)
        test_case = "AHB read 20b";
        read_from_buffer(1'b1, 1'b0, 20);
        #(20ns);

        //AHB-side max write (64 bytes)
        test_case = "AHB write 64b";
        @(posedge clk);
        flush = 1'b1;
        @(posedge clk);
        flush = 1'b0;
        @(posedge clk);
        temp_tx_data[0] = 8'd100;
        for(j=1; j<64; j++) begin
            temp_tx_data[j] = temp_tx_data[j-1] + 1;
        end
        write_to_buffer(1'b0, 1'b1, 64);
        #(20ns);

        //AHB-side max read (64 bytes)
        test_case = "AHB read 64b";
        read_from_buffer(1'b1, 1'b0, 64);
        #(20ns);

        $finish;
    end
endmodule

/* verilator coverage_on */


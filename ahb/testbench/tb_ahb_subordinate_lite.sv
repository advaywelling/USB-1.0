`timescale 1ns / 10ps
/* verilator coverage_off */

module tb_ahb_subordinate_lite ();

    localparam CLK_PERIOD = 10ns;
    localparam TIMEOUT = 1000;

    localparam BURST_SINGLE = 3'd0;
    localparam BURST_INCR   = 3'd1;
    localparam BURST_WRAP4  = 3'd2;
    localparam BURST_INCR4  = 3'd3;
    localparam BURST_WRAP8  = 3'd4;
    localparam BURST_INCR8  = 3'd5;
    localparam BURST_WRAP16 = 3'd6;
    localparam BURST_INCR16 = 3'd7;

    initial begin
        $dumpfile("waveform.fst");
        $dumpvars;
    end

    logic clk, n_rst;

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
        @(negedge clk);
        @(negedge clk);
    end
    endtask

    logic hsel;
    logic [3:0] haddr;
    logic [2:0] hsize;
    logic [2:0] hburst;
    logic [1:0] htrans;
    logic hwrite;
    logic [31:0] hwdata;
    logic [31:0] hrdata;
    logic hresp;
    logic hready;

    //inputs
    logic [2:0] rx_packet;
    logic rx_data_ready, rx_transfer_active, rx_error;
    logic [6:0] buffer_occupancy;
    logic [7:0] rx_data;
    logic tx_error, tx_transfer_active;
    //outputs
    logic d_mode, get_rx_data, store_tx_data, clear;
    logic [7:0] tx_data;
    logic [2:0] tx_packet;
    string testinfo;

    // bus model connections
    ahb_model_updated #(
        .ADDR_WIDTH(4),
        .DATA_WIDTH(4)
    ) BFM ( .clk(clk),
        // AHB-Subordinate Side
        .hsel(hsel),
        .haddr(haddr),
        .hsize(hsize),
        .htrans(htrans),
        .hburst(hburst),
        .hwrite(hwrite),
        .hwdata(hwdata),
        .hrdata(hrdata),
        .hresp(hresp),
        .hready(hready)
    );

    ahb_subordinate_lite DUT (.clk(clk), .n_rst(n_rst), .hsel(hsel), .haddr(haddr), .hsize(hsize[1:0]), .htrans(htrans), .hwrite(hwrite),
                              .hwdata(hwdata), .hrdata(hrdata), .hresp(hresp), .hready(hready), 
                              .rx_packet(rx_packet), .rx_data_ready(rx_data_ready), .rx_transfer_active(rx_transfer_active), .rx_error(rx_error), .d_mode(d_mode),
                              .buffer_occupancy(buffer_occupancy), .rx_data(rx_data), .get_rx_data(get_rx_data), .store_tx_data(store_tx_data), .tx_data(tx_data),
                              .clear(clear), .tx_packet(tx_packet), .tx_transfer_active(tx_transfer_active), .tx_error(tx_error), .hburst(hburst));

    task reset_inputs;
        rx_packet = 3'd7;
        rx_data_ready = 0;
        rx_transfer_active = 0;
        rx_error = 0;
        buffer_occupancy = 0;
        rx_data = 0;
        tx_error = 0;
        tx_transfer_active = 0;
        testinfo = "none";
    endtask

    // Supporting Tasks
    task reset_model;
        BFM.reset_model();
    endtask


    logic [31:0] data [];

    // Read from a register without checking the value
    task enqueue_poll ( input logic [3:0] addr, input logic [1:0] size );
    logic [31:0] data [];
        begin
            data = new [1];
            data[0] = {32'hXXXX};
            //              Fields: hsel,  R/W, addr, data, exp err,         size, burst, chk prdata or not
            BFM.enqueue_transaction(1'b1, 1'b0, addr, data,    1'b0, {1'b0, size},  3'b0,            1'b0);
        end
    endtask

    // Read from a register until a requested value is observed
    task poll_until ( input logic [3:0] addr, input logic [1:0] size, input logic [31:0] data);
        int iters;
        begin
            for (iters = 0; iters < TIMEOUT; iters++) begin
                enqueue_poll(addr, size);
                execute_transactions(1);
                if(BFM.get_last_read() == data) break;
            end
            if(iters >= TIMEOUT) begin
                $error("Bus polling timeout hit.");
            end
        end
    endtask

    // Read Transaction, verifying a specific value is read
    task enqueue_read ( input logic [3:0] addr, input logic [1:0] size, input logic [31:0] exp_read );
        logic [31:0] data [];
        begin
            data = new [1];
            data[0] = exp_read;
            BFM.enqueue_transaction(1'b1, 1'b0, addr, data, 1'b0, {1'b0, size}, 3'b0, 1'b1);
        end
    endtask

    // Write Transaction
    task enqueue_write ( input logic [3:0] addr, input logic [1:0] size, input logic [31:0] wdata );
        logic [31:0] data [];
        begin
            data = new [1];
            data[0] = wdata;
            BFM.enqueue_transaction(1'b1, 1'b1, addr, data, 1'b0, {1'b0, size}, 3'b0, 1'b0);
        end
    endtask

    task enqueue_error_read ( input logic [3:0] addr, input logic [1:0] size, input logic [31:0] exp_read );
        logic [31:0] data [];
        begin
            data = new [1];
            data[0] = exp_read;
            BFM.enqueue_transaction(1'b1, 1'b0, addr, data, 1'b1, {1'b0, size}, 3'b0, 1'b0);
        end
    endtask

    task enqueue_error_write ( input logic [3:0] addr, input logic [1:0] size, input logic [31:0] wdata );
        logic [31:0] data [];
        begin
            data = new [1];
            data[0] = wdata;
            BFM.enqueue_transaction(1'b1, 1'b1, addr, data, 1'b1, {1'b0, size}, 3'b0, 1'b0);
        end
    endtask

    // Write Transaction Intended for a different subordinate from yours
    task enqueue_fakewrite ( input logic [3:0] addr, input logic [1:0] size, input logic [31:0] wdata );
        logic [31:0] data [];
        begin
            data = new [1];
            data[0] = wdata;
            BFM.enqueue_transaction(1'b0, 1'b1, addr, data, 1'b0, {1'b0, size}, 3'b0, 1'b0);
        end
    endtask

    // Create a burst read of size based on the burst type.
    // If INCR, burst size dependent on dynamic array size
    task enqueue_burst_read ( input logic [3:0] base_addr, input logic [1:0] size, input logic [2:0] burst, input logic [31:0] data [] );
        BFM.enqueue_transaction(1'b1, 1'b0, base_addr, data, 1'b0, {1'b0, size}, burst, 1'b1);
    endtask

    // Create a burst write of size based on the burst type.
    task enqueue_burst_write ( input logic [3:0] base_addr, input logic [1:0] size, input logic [2:0] burst, input logic [31:0] data [] );
        BFM.enqueue_transaction(1'b1, 1'b1, base_addr, data, 1'b0, {1'b0, size}, burst, 1'b1);
    endtask

    // Run n transactions, where a k-beat burst counts as k transactions.
    task execute_transactions (input int num_transactions);
        BFM.run_transactions(num_transactions);
    endtask

    task check3; //for clear and tx_packet, manually check txdata & get/store tx/rx data
        input logic [2:0] actual;
        input logic [2:0] expected;
        input string case_info;
        begin
            if((actual == expected)) $write("Passed: ");
            else $write("Failed, got %d, expected %d at %0t ", actual, expected, $time);
            $display("%s", case_info);
            #(0.1ns);
        end
    endtask
    task paus;
        @(negedge clk);
        while(hready == 1'b0 || hsel == 1'b1) @(negedge clk);
        @(negedge clk);
    endtask
    
    task readall1;
        rx_data = 8'hCA;
        testinfo = "read register 0";
        enqueue_read(4'h0, 0, 32'hCA);
        execute_transactions(1);
        paus();
        testinfo = "read register 1";
        enqueue_read(4'h1, 0, 32'hCA);
        execute_transactions(1);
        paus();

        rx_data=8'hAC;
        testinfo = "read register 2";
        enqueue_read(4'h2, 0, 32'hAC);
        execute_transactions(1);
        paus();
        testinfo = "read register 3";
        enqueue_read(4'h3, 0, 32'hAC);
        execute_transactions(1);
        rx_packet = 3'b0;
        rx_data_ready = 1'b1;
        paus();
        testinfo = "read register 4";
        enqueue_read(4'h4, 0, 32'b101);
        execute_transactions(1);
        tx_error = 1'b1;
        rx_error = 1'b1;
        tx_transfer_active = 1'b1;
        paus();
        testinfo = "read register 5";
        enqueue_read(4'h5, 0, 32'b10);
        execute_transactions(1);
        paus();
        testinfo = "read register 6";
        enqueue_read(4'h6, 0, 32'b1);
        execute_transactions(1);
        paus();
        testinfo = "read register 7";
        enqueue_read(4'h7, 0, 32'b1);
        execute_transactions(1);
        buffer_occupancy = 7'd33;
        paus();
        testinfo = "read register 8";
        enqueue_read(4'h8, 0, 32'd33);
        execute_transactions(1);
        paus();
        testinfo = "write then read register C";
        enqueue_write(4'hC, 0, 32'd4);
        enqueue_read(4'hC, 0, 32'd4);
        execute_transactions(2);
        paus();
        testinfo = "write then read register D";
        enqueue_write(4'hD, 0, 32'b1);
        enqueue_read(4'hD, 0, 32'b1);
        execute_transactions(2);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
    endtask

    task readall2;
        rx_data = 8'hCA;
        testinfo = "read register 0 + 1";
        enqueue_read(4'h0, 2'b1, 32'hCACA);
        execute_transactions(1);
        paus();
        rx_data=8'hAC;
        testinfo = "read register 2 + 3";
        enqueue_read(4'h2, 2'b1, 32'hACAC);
        execute_transactions(1);
        paus();
        rx_packet = 3'b0;
        rx_data_ready = 1'b1; 
        tx_transfer_active = 1'b1;
        paus();
        
        testinfo = "read register 4+5";
        enqueue_read(4'h4, 2'b1, 32'b1000000101);
        execute_transactions(1);
        paus();
        tx_error = 1'b1;
        rx_error = 1'b1;
       
        paus();
        testinfo = "read register 6+7";
        enqueue_read(4'h6, 2'b1, 32'h101);
        execute_transactions(1);
        paus();
    endtask

    task readall4;
        rx_data = 8'hBB;
        testinfo = "read register 0 to 3";
        enqueue_read(4'h0, 2'b10, 32'h3311DDBB);
        execute_transactions(1);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        rx_data = 8'hDD;
        @(negedge clk);
        rx_data = 8'h11;
        @(negedge clk);
        rx_data = 8'h33;
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
    endtask

    task write1;
        testinfo = "write register 0";
        enqueue_write(4'h0, 2'b0, 32'hCC);
        execute_transactions(1);
        paus();
        testinfo = "write register 1";
        enqueue_write(4'h1, 2'b0, 32'hBB);
        execute_transactions(1);
        paus();
        testinfo = "write register 2";
        enqueue_write(4'h2, 2'b0, 32'hAA);
        execute_transactions(1);
        paus();
        testinfo = "write register 3";
        enqueue_write(4'h3, 2'b0, 32'h99);
        execute_transactions(1);
        paus();
        testinfo = "write register C";
        enqueue_write(4'hC, 2'b0, 32'h2);
        execute_transactions(1);
        paus();
        tx_transfer_active = 1'b1;
        testinfo = "write register D";
        enqueue_write(4'hD, 2'b0, 32'h1);
        execute_transactions(1);
        paus();
        tx_transfer_active = 1'b0;
        paus();
    endtask

    task write2and4;
        testinfo = "write register 0+1";
        enqueue_write(4'h0, 2'b1, 32'hCCBB);
        execute_transactions(1);
        @(negedge clk);
        while(hready == 1'b0) @(negedge clk);
        testinfo = "write register 2+3";
        enqueue_write(4'h2, 2'b1, 32'hAADD);
        execute_transactions(1);
        @(negedge clk);
        while(hready == 1'b0) @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        testinfo = "write register 0-3";
        enqueue_write(4'h0, 2'b10, 32'hDEADBEEF);
        execute_transactions(1);
        @(negedge clk);
        while(hready == 1'b0) @(negedge clk);
        @(negedge clk);
        @(negedge clk);
    endtask

    task write_to_read_errors;
    
        reset_inputs();
        rx_packet = 3'd3;
        testinfo = "error write to r5";
        enqueue_error_write(4'h5, 2'b0, 32'hAA);
        execute_transactions(1);
        @(negedge clk);
        while(hready == 1'b0) @(negedge clk);
        enqueue_read(4'h5, 2'b0, 32'h00);
        execute_transactions(1);
        @(negedge clk);
        @(negedge clk);

        testinfo = "error write to r4 + 5";
        enqueue_error_write(4'h4, 2'b1, 32'hBBAA);
        enqueue_read(4'h4, 2'b1, 32'h20);
        execute_transactions(2);
        @(negedge clk);
        while(hready == 1'b0) @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);

        testinfo = "error write to r6 + 7";
        enqueue_error_write(4'h6, 2'b1, 32'hAA);
        execute_transactions(1);
        @(negedge clk);
        while(hready == 1'b0) @(negedge clk);
        enqueue_read(4'h6, 2'b1, 32'h00);
        execute_transactions(1);
        @(negedge clk);
        @(negedge clk);

        testinfo = "error write to r7";
        enqueue_error_write(4'h7, 2'b0, 32'hAA);      
        enqueue_read(4'h7, 2'b0, 32'h00);
        execute_transactions(2);  
        @(negedge clk);
        while(hready == 1'b0) @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);

        testinfo = "error write to r8";
        enqueue_error_write(4'h8, 2'b0, 32'hAA);      
        enqueue_read(4'h8, 2'b0, 32'h00);
        execute_transactions(2);  
        @(negedge clk);
        while(hready == 1'b0) @(negedge clk);
        @(negedge clk);
    endtask

    task invalid_register_errors;
        testinfo = "error: read to r9";
        enqueue_error_read(4'h9, 0, 32'h33);
        execute_transactions(1);
        paus();

        testinfo = "error write to r9";
        enqueue_error_write(4'h9, 0, 32'h5555_5555);
        execute_transactions(1);
        paus();

        testinfo = "read to r10";
        enqueue_error_read(4'hA, 0, 32'h33);
        execute_transactions(1);
        paus();

        testinfo = "error write to r10";
        enqueue_error_write(4'hA, 1, 32'h5555);
        execute_transactions(1);
        paus();

        testinfo = "read to r11";
        enqueue_error_read(4'hB, 0, 32'h33);
        execute_transactions(1);
        paus();

        testinfo = "error write to r11";
        enqueue_error_write(4'hB, 0, 32'h66);
        execute_transactions(1);
        paus();

        testinfo = "read to r14";
        enqueue_error_read(4'hE, 1, 32'h3333);
        execute_transactions(1);
        paus();

        testinfo = "error write to r14";
        enqueue_error_write(4'hE, 0, 32'h55);
        execute_transactions(1);
        paus();

        testinfo = "read to r15";
        enqueue_error_read(4'hF, 0, 32'h11);
        execute_transactions(1);
        paus();

        testinfo = "error write to r15";
        enqueue_error_write(4'hF, 0, 32'h13);
        execute_transactions(1);
        paus();
    endtask

    task readread;
        reset_inputs();
        testinfo = "consecutive read r0-r3, r2+3";
        rx_data = 8'h33;
        enqueue_read(4'h0, 2'b10, 32'h33333333);
        enqueue_read(4'h2, 2'b1, 32'h3333);
        execute_transactions(2);
        BFM.wait_done();

        testinfo = "consecutive read r4r5";
        rx_data_ready = 1'b1;
        rx_packet = 0;
        enqueue_read(4'h4, 2'b1, 32'b101);
        enqueue_read(4'h4, 2'b0, 32'b101);
        execute_transactions(2);
        paus();

        testinfo = "consecutive read r6r7";
        rx_error = 1'b1;
        tx_error = 1'b1;
        enqueue_read(4'h6, 2'b1, 32'h101);
        enqueue_read(4'h7, 2'b0, 32'h1);
        execute_transactions(2);
        paus();

        testinfo = "read r5 then r0-3";
        rx_data = 8'h11;
        enqueue_read(4'h5, 2'b0, 32'h0);
        enqueue_read(4'h0, 2'h2, 32'h1111_1111);
        execute_transactions(2);
        paus();
        
        tx_error = 1;
        rx_error = 1;
        rx_packet = 0;
        rx_data_ready = 1;
        rx_transfer_active = 1;
        tx_transfer_active = 0;
        @(negedge clk);
        testinfo = "read r4-r7";
        enqueue_read(4'h4, 2'b10, 32'h01010105);
        execute_transactions(1);
        paus();

        testinfo = "read r12-r15";
        enqueue_write(4'hC, 2'b1, 32'h10C);
        enqueue_read(4'hC, 2'b10, 32'h10C);
        execute_transactions(2);
        paus();
    endtask

    task writewrite;
        reset_inputs();
        testinfo  = "consecutive write r0-3 r3";
        enqueue_write(4'h0, 2'h2, 32'h11223344);
        enqueue_write(4'h3, 2'b0, 32'h00);
        execute_transactions(2);
        paus();

        testinfo = "consecutive write to r0-r3 r12";
        enqueue_write(4'h0, 2'h2, 32'hFFEECCDD);
        enqueue_write(4'hC, 0, 32'h2);
        execute_transactions(2);
        paus();

        testinfo = "consecutive write to r13";
        enqueue_write(4'hD, 0, 32'h1);
        enqueue_write(4'hD, 0, 32'h1);
        execute_transactions(2);
        paus();
    endtask

    task writeread;
        reset_inputs();
        rx_data = 8'hDD;
        testinfo = "write then read r0-r3";
        enqueue_write(4'h0, 2'h2, 32'hAAAAAAAA);
        enqueue_read(4'h0, 2'h2, 32'hDDDDDDDD);
        execute_transactions(2);
        paus();


        testinfo = "write then read r0-r3, r12";
        enqueue_write(4'hC, 0, 32'h4);
        execute_transactions(1);
        paus();
        enqueue_write(4'h0, 2'h2, 32'hBBBBBBBB);
        enqueue_read(4'hC, 0, 32'h4);
        execute_transactions(2);
        paus();

        testinfo = "write then read r12";
        enqueue_write(4'hC, 2'h0, 32'h2);
        enqueue_read(4'hC, 2'h0, 32'h2);
        execute_transactions(2);
        paus();
    endtask

    task readwrite;
        reset_inputs();
        reset_dut();
        @(negedge clk);
        testinfo = "read then write r0-r3";
        rx_data = 8'h77;
        enqueue_read(4'h0, 2'h2, 32'h77777777);
        enqueue_write(4'h0, 2'h2, 32'h66666666);
        execute_transactions(2);
        paus();

        testinfo = "read then write r12";
        enqueue_read(4'hC, 0, 32'h0);
        enqueue_write(4'hC, 0, 32'h3);
        enqueue_read(4'hC, 0, 32'h3);
        execute_transactions(3);
        paus();

        testinfo = "read then write r2r3, r12";
        enqueue_read(4'h2, 2'b1, 32'h7777);
        enqueue_write(4'hC, 2'b0, 32'h6);
        enqueue_read(4'hC, 0, 32'h6);
        execute_transactions(3);
        paus();
    endtask

    task readwriteerr;
        reset_inputs();
        reset_dut();
        @(negedge clk);

        testinfo = "read then write error r8";
        buffer_occupancy = 7'h77;
        enqueue_read(4'h8, 0, 32'h77);
        enqueue_error_write(4'h8, 0, 32'h3);
        execute_transactions(2);
        paus();
        enqueue_read(4'h8, 0, 32'h77);
        execute_transactions(1);
        paus();

        testinfo = "read then write error r0-r4";
        rx_data = 8'h44;
        enqueue_read(4'h0, 2'h2, 32'h4444_4444);
        enqueue_error_write(4'h9, 0, 32'h33);
        execute_transactions(2);
        paus();

        testinfo = "read read write err";
        enqueue_read(4'hC, 0, 32'h0);
        enqueue_read(4'h8, 0, 32'h77);
        enqueue_error_write(4'hB, 0, 32'h5);
        execute_transactions(3);
        paus();

        testinfo = "write read write err";
        enqueue_write(4'hC, 0, 32'h5);
        enqueue_read(4'hC, 0, 32'h5);
        enqueue_error_write(4'hB, 0, 32'h6);
        execute_transactions(3);
        paus();
        enqueue_read(4'hC, 0, 32'h5);
        execute_transactions(1);
        paus();
        rx_data = 8'h1;
        testinfo = "read read write err";
        enqueue_read(4'h2, 0, 32'h1);
        enqueue_read(4'h8, 0, 32'h77);
        enqueue_error_write(4'hB, 0, 32'h5);
        execute_transactions(3);
        paus();

        testinfo = "write read write err";
        enqueue_write(4'h1, 0, 32'h5);
        rx_data = 8'h5;
        enqueue_read(4'h3, 0, 32'h5);
        enqueue_error_write(4'hB, 0, 32'h6);
        execute_transactions(3);
        paus();
        enqueue_read(4'hC, 0, 32'h5);
        execute_transactions(1);
        paus();
    endtask

    task writewriteerr;
        reset_inputs();
        reset_dut();
        @(negedge clk);
        buffer_occupancy = 32'h77;
        testinfo = "write r0-r3 then write err";
        enqueue_write(4'h0, 0, 32'h3333_3333);
        enqueue_error_write(4'h8, 0, 32'h3);
        execute_transactions(2);
        paus();
        enqueue_read(4'h8, 0, 32'h77);
        execute_transactions(1);
        paus();


        testinfo = "write r12 then write err";
        enqueue_write(4'hC, 0, 32'h4);
        enqueue_error_write(4'hE, 1, 32'h7);
        execute_transactions(2);
        paus();

        testinfo = "write write write err";
        enqueue_write(4'h3, 0, 32'h3);
        enqueue_write(4'h1, 0, 32'h1);
        enqueue_error_write(4'h5, 0, 32'h3);
        execute_transactions(3);
        paus();

        testinfo = "read write write err";
        rx_data = 8'h2;
        enqueue_read(4'h0, 0, 32'h2);
        enqueue_write(4'h0, 0, 32'h4);
        enqueue_error_write(4'h7, 0, 32'h3);
        execute_transactions(3);
        paus();

        testinfo = "write write write err";
        enqueue_write(4'hC, 0, 32'h3);
        enqueue_write(4'hC, 0, 32'h1);
        enqueue_error_write(4'hB, 0, 32'h3);
        execute_transactions(3);
        paus();

        testinfo = "read write write err";
        rx_data_ready = 1;
        enqueue_read(4'h4, 0, 32'h1);
        enqueue_write(4'hC, 0, 32'h4);
        enqueue_error_write(4'h7, 0, 32'h3);
        enqueue_read(4'h4, 0, 32'h1);
        enqueue_read(4'hC, 0, 32'h4);
        execute_transactions(5);
        paus();
    endtask

    task readreaderr;
        reset_inputs();
        reset_dut();
        @(negedge clk);
        testinfo = "read r1 read err";
        rx_data=8'h4;
        enqueue_read(4'h1, 0, 32'h4);
        enqueue_error_read(4'h9, 0, 32'h3);
        execute_transactions(2);
        paus();

        testinfo = "write read r12, read err";
        enqueue_write(4'hC, 0, 32'h4);
        enqueue_read(4'hC, 0, 32'h4);
        enqueue_error_read(4'hB, 0, 32'h4);
        enqueue_read(4'hC, 0, 32'h4);
        execute_transactions(1);
        paus();
        execute_transactions(3);
        paus();

        testinfo = "read read r0-3 read err";
        rx_data = 8'h44;
        enqueue_read(4'h0, 2'h2, 32'h4444_4444);
        enqueue_read(4'h0, 2'h1, 32'h4444);
        enqueue_error_read(4'hA, 2'h1, 32'h4444);
        execute_transactions(3);
        paus();
    endtask

    task writereaderr;
        reset_inputs();
        reset_dut();
        @(negedge clk);
        
        testinfo = "write r0-r3 read err";
        enqueue_write(4'h0, 2'h2, 32'h5555_5555);
        enqueue_error_read(4'hA, 2'h1, 32'h4444);
        enqueue_read(4'h0, 2'h2, 32'h0);
        execute_transactions(3);
        paus();
        testinfo = "write r12 read err";
        enqueue_write(4'hC, 2'h0, 32'h1);
        enqueue_error_read(4'hA, 2'h1, 32'h4444);
        enqueue_read(4'hC, 0, 32'h1);
        execute_transactions(3);
        paus();
        testinfo = "read r12 write r12 read err";
        enqueue_read(4'hC, 0, 32'h1);
        enqueue_write(4'hC, 0, 32'h4);
        enqueue_error_read(4'hA, 2'h1, 32'h4444);
        execute_transactions(3);
        paus();
        testinfo = "read r12 write r2 read err";
        enqueue_read(4'hC, 0, 32'h4);
        enqueue_write(4'h2, 0, 32'h65);
        enqueue_error_read(4'hA, 2'h1, 32'h4444);
        execute_transactions(3);
        paus();
    endtask

    //not applicable if [next transaction is squashed] feature is added
    task readerrwrite;
    endtask

    initial begin
        n_rst = 1;
        reset_model();
        reset_inputs();
        reset_dut();

        /****** EXAMPLE CODE ******/
        // Always put data LSB-aligned. The model will automagically move bytes to their proper position.
        // enqueue_read(3'h1, 1'b0, 31'h00BB);
        // enqueue_write(3'h2, 1'b1, 31'h00BB);
        
        // Example Burst Setup - Dynamic Array Required
        // data = new [8];
        // data = {32'h8888_8888, 32'h7777_7777,32'h6666_6666,32'h5555_5555,32'h4444_4444,32'h3333_3333,32'h2222_2222,32'h1111_1111};
        // enqueue_burst_read(4'hC, 1'b1, BURST_WRAP8, data);
        // execute_transactions(10); // Burst counts as 8 transactions for 8 beats
        /****** EXAMPLE CODE ******/

        //read to all registers
        reset_inputs();
        testinfo = "write register C";
        tx_transfer_active = 1;
        enqueue_write(4'hC, 2'b0, 32'h2);
        execute_transactions(1);
        paus();
        testinfo = "incr burst";
        rx_data = 8'hC;
        rx_packet = 3'd0;
        rx_data_ready = 1'b1;
        rx_transfer_active = 1'b1;
        data = new [4];
        data[0] = 32'h0C0C;
        data[1] = 32'h0C0C;
        data[2] = 32'h305;
        rx_error = 1'b1;
        data[3] = 32'h1;
        enqueue_burst_read(4'h0, 2'b1, 3'd3, data);
        execute_transactions(4);
        BFM.wait_done();
        paus();

        buffer_occupancy = 7'h11;
        testinfo = "wrap burst";
        data[0] = 32'h11;
        data[1] = 32'h2;
        data[2] = 32'h0c0c_0c0c;
        data[3] = 32'h01_0305;
        enqueue_burst_read(4'h8, 2'b10, 3'd2, data);
        execute_transactions(4);
        BFM.wait_done();

        testinfo = "incr burst write";
        data = new [8];
        data = {32'hAABB, 32'hCCDD, 32'h0, 32'h0, 32'h0, 32'h0, 32'h103, 32'h0};
        enqueue_burst_write(4'h0, 2'b1, 3'd5, data);
        execute_transactions(8);
        BFM.wait_done();

        testinfo = "wrap burst write";
        data = {32'h0, 32'h0, 32'h105, 32'h0, 32'hBBAA, 32'hDDCC, 32'h0, 32'h0};
        enqueue_burst_write(4'h8, 2'b1, 3'd4, data);
        execute_transactions(8);
        BFM.wait_done();

        
        // readall1();
        // @(negedge clk);
        // readall2();
        // @(negedge clk);
        // readall4();
        // @(negedge clk);
        // //write to all registers
        // write1();
        // @(negedge clk);
        // write2and4();
        // @(negedge clk);
        // write_to_read_errors();
        // @(negedge clk);
        // invalid_register_errors();
        // @(negedge clk);
        // readread();
        // @(negedge clk);
        // writewrite();
        // @(negedge clk);
        // writeread();
        // @(negedge clk);
        // readwrite();
        // @(negedge clk);
        // readwriteerr();
        // @(negedge clk);
        // writewriteerr();
        // @(negedge clk);
        // readreaderr();
        // @(negedge clk);
        // writereaderr();

        #(20ns);
        $finish;
    end
endmodule

/* verilator coverage_on */

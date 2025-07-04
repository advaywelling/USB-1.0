`timescale 1ns / 10ps
/* verilator coverage_off */

module tb_ahb_db_tx ();

    localparam CLK_PERIOD = 10ns;
    localparam TIMEOUT = 1000;
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars;
    end

    //Inputs
    logic clk, n_rst;
    logic [7:0] rx_packet_data;
    logic store_rx_packet_data;
    logic flush;
    logic hsel;
    logic [3:0] haddr;
    logic [1:0] hsize;
    logic [1:0] htrans;
    logic hwrite;
    logic [31:0] hwdata;
    logic [2:0] rx_packet;
    logic rx_data_ready;
    logic rx_transfer_active;
    logic rx_error;

    //Outputs
    logic [31:0] hrdata;
    logic hresp;
    logic hready;
    logic d_mode;
    logic dp_out;
    logic dm_out;

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

    task reset_inputs;
        flush = 0;
        rx_packet_data = 0;
        store_rx_packet_data = 0;
        rx_packet = 3'h7;
        rx_data_ready = 0;
        rx_transfer_active = 0;
        rx_error = 0;
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

    task poll_until2 ( input logic [3:0] addr, input logic [1:0] size, input logic [31:0] data);
        int iters;
        begin
            for (iters = 0; iters < TIMEOUT; iters++) begin
                enqueue_poll(addr, size);
                execute_transactions(1);
                if(BFM.get_last_read() == data && iters != 0) break;
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

    ahb_db_tx DUT (.*);
    task runtrans(input int num);
        execute_transactions(num);
        BFM.wait_done();
    endtask

    task send_packet;
        input logic [2:0] txpak;
        enqueue_write(4'hC, 2'b0, {5'b0, txpak});
        runtrans(1);
    endtask

    task write1;
        input logic [7:0] in;
        enqueue_write(4'h0, 2'b0, {24'h0, in});
        runtrans(1);
    endtask

    task write4;
        input logic [31:0] in;
        enqueue_write(4'h0, 2'b10, in);
        runtrans(1);
    endtask

    task waittx;
        @(negedge clk);
        poll_until2(4'h5, 2'b0, 32'h100);
        @(negedge clk);
    endtask

    initial begin
        n_rst = 1;
        reset_model();
        reset_inputs();
        reset_dut();
        rx_transfer_active = 1'b1;
        @(negedge clk);
        testinfo = "ACK packet";
        send_packet(3'd3);
        waittx();
        testinfo = "NAK packet";
        send_packet(3'd4);
        testinfo = "check NAK";
        waittx();
        testinfo = "STALL packet";
        send_packet(3'd5);
        @(negedge clk);
        testinfo = "check STALL";
        waittx();
        testinfo = "DATA0";
        @(negedge clk);
        write1(8'hAB);
        write4(32'hAABBCCDD);
        @(negedge clk);
        send_packet(3'd1);
        waittx();
        testinfo = "tx err";
        send_packet(3'd1);
        waittx();

        testinfo = "write buffer";
        @(negedge clk);
        write1(8'hAB);
        write4(32'hAABBCCDD);
        @(negedge clk);
        testinfo = "clear err";
        send_packet(3'd1);
        waittx();
        $finish;
    end
endmodule

/* verilator coverage_on */


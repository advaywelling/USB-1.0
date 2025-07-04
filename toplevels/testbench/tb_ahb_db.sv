`timescale 1ns / 10ps
/* verilator coverage_off */

module tb_ahb_db ();

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

    //inputs
    logic [2:0] rx_packet;
    logic rx_data_ready, rx_transfer_active, rx_error;
    logic tx_transfer_active, tx_error;
    //db
    logic flush, store_rx_packet_data, get_tx_packet_data;
    logic [7:0] rx_packet_data;
    //outputs
    logic d_mode;
    logic [2:0] tx_packet;
    //db
    logic [7:0] tx_packet_data;
    logic [6:0] buffer_occupancy;
    string testinfo = "";

    ahb_db DUT(.clk(clk), .n_rst(n_rst), .hsel(hsel), .haddr(haddr), .hsize(hsize[1:0]), .htrans(htrans),
                .hwrite(hwrite), .hwdata(hwdata), .hrdata(hrdata), .hresp(hresp), .hready(hready), .rx_packet(rx_packet),
                .rx_data_ready(rx_data_ready), .rx_transfer_active(rx_transfer_active), .rx_error(rx_error), .d_mode(d_mode),
                .tx_packet(tx_packet), .tx_transfer_active(tx_transfer_active), .tx_error(tx_error), .flush(flush), 
                .buffer_occupancy(buffer_occupancy), .store_rx_packet_data(store_rx_packet_data), .rx_packet_data(rx_packet_data),
                .get_tx_packet_data(get_tx_packet_data), .tx_packet_data(tx_packet_data));

    task reset_inputs;
        rx_packet = 3'h7;
        rx_data_ready = 1'b0;
        rx_transfer_active = 1'b0;
        rx_error = 1'b0;
        tx_transfer_active = 1'b0;
        tx_error = 1'b0;
        flush = 1'b0;
        store_rx_packet_data = 1'b0;
        get_tx_packet_data = 1'b0;
        rx_packet_data = 8'b0;
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
            BFM.enqueue_transaction(1'b1, 1'b0, addr, data, 1'b1, {1'b0, size}, 3'b0, 1'b1);
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

    task finish_transactions;
        BFM.wait_done();
    endtask

    task read1;
        input logic [7:0] pkt;
        enqueue_read(4'h0, 0, {24'b0, pkt});
        execute_transactions(1);
        finish_transactions();
    endtask

    task read2;
        input logic [15:0] pkts;
        enqueue_read(4'h0, 2'b1, {16'b0, pkts});
        execute_transactions(1);
        finish_transactions();
    endtask

    task read4;
        input logic [31:0] pkts;
        enqueue_read(4'h0, 2'b10, pkts);
        execute_transactions(1);
        finish_transactions();
    endtask

    task write1;
        input logic [7:0] pkt;
        enqueue_write(4'h0, 0, {24'b0, pkt});
        execute_transactions(1);
        finish_transactions();
    endtask

    task write2;
        input logic [15:0] pkts;
        enqueue_write(4'h0, 2'b1, {16'b0, pkts});
        execute_transactions(1);
        finish_transactions();
    endtask

    task write4;
        input logic [31:0] pkts;
        enqueue_write(4'h0, 2'b10, pkts);
        execute_transactions(1);
        finish_transactions();
    endtask

    task clr;
        enqueue_write(4'hD, 2'b0, 32'h1);
        execute_transactions(1);
        finish_transactions();
    endtask

    task writenread;
        input logic [31:0] pkts;
        logic [1:0] size;
        size[0] = pkts[15] && ~pkts[31];
        size[1] = pkts[31];
        enqueue_write(4'h0, size, pkts);
    endtask

    task checkocc;
        input logic [6:0] occ;
        enqueue_read(4'h8, 2'b0, {25'b0, occ});
        execute_transactions(1);
        finish_transactions();
    endtask

    initial begin
        n_rst = 1;
        reset_model();
        reset_inputs();
        reset_dut();

        @(negedge clk);
        write1(8'hAB);
        read1(8'hAB);
        write2(16'hABCD);
        checkocc(7'd3);
        read2(16'hABCD);
        write4(32'h98765432);
        read2(16'h5432);
        read1(8'h76);
        read1(8'h98);
        writenread(32'hDEADBEEF);
        

        $finish;
    end
endmodule

/* verilator coverage_on */


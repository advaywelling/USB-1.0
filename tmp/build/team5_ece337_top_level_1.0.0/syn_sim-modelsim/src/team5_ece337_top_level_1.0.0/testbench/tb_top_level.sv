`timescale 1ns / 10ps
/* verilator coverage_off */

module tb_top_level ();

    localparam CLK_PERIOD = 10ns;
    localparam CLK_DIV = 83.33ns;
    localparam TIMEOUT = 1000;
    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars;
    end

    logic clk, clk_div, n_rst;

    typedef enum logic [2:0] {OUT, IN, DATA0, DATA1, ACK, NAK, STALL} tx_packet_type;
    localparam [7:0]SYNC_DATA = 8'b00000001;
    localparam [7:0]DATA0_PID = 8'b11000011;
    localparam [7:0]DATA1_PID = 8'b01001011;
    localparam [7:0]ACK_PID = 8'b11010010;
    localparam [7:0]NAK_PID = 8'b01011010;
    localparam [7:0]STALL_PID = 8'b00011110;
    localparam [7:0]OUT_PID = 8'b11100001;
    localparam [7:0]IN_PID = 8'b01101001;

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
    logic [1:0] abc;
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

    logic dm_in, dm_out, dp_in, dp_out, d_mode;

    top_level DUT (.clk(clk), .n_rst(n_rst), .hsel(hsel), .haddr(haddr), .htrans(htrans),
                    .hsize(hsize[1:0]), .hwrite(hwrite), .hwdata(hwdata), .hrdata(hrdata), 
                    .hready(hready), .hresp(hresp), .d_mode(d_mode), .dp_in(dp_in), .dp_out(dp_out),
                    .dm_out(dm_out), .dm_in(dm_in));
    

    task reset_inputs;
        dp_in = 1'b1;
        abc = 2'b0;
        dm_in = 1'b0;
        testinfo = "";
    endtask

    logic check_pulse;

    // Supporting Tasks
    task reset_model;
        BFM.reset_model();
    endtask


    logic prev_d;

    task check_sync_pid;
        input logic [7:0] exp_pid;
        input string case_name;
        logic [7:0] recv_sync;
        logic [7:0] recv_pid;
        logic bit_out;
        integer k;
    begin
        $display("Test Case: %s", case_name);

        $display("Checking SYNC byte >>");
        for(k=0; k<8; k++) begin
            @(negedge clk_div);
            check_pulse = 1;
            recv_sync[k] = (dp_out == prev_d) ? 1'b1 : 1'b0;
            @(negedge clk);
            @(posedge clk);
            prev_d = dp_out;
            #(0.5ns);
            check_pulse = 0;
        end
        if(recv_sync != 8'b00000001) begin
            $display("%t SYNC is wrong expected: 00000001 got: %b", $time, recv_sync);
        end else begin
            $display("Correct PID, got: %b", recv_sync);
        end

        $display("Checking PID >>");
        for(k=0; k<8; k++) begin
            @(negedge clk_div);
            recv_pid[k] = (dp_out == prev_d) ? 1'b1 : 1'b0;
            prev_d = dp_out;
        end
        if(recv_pid != exp_pid) begin
            $display("%t PID is wrong expected: %b got: %b", $time, exp_pid, recv_pid);
        end else begin
            $display("Correct PID, got: %b", recv_pid);
        end

    end
    endtask

    task send_sync_byte;
    begin
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
        prev_d = 0;
    end
    endtask

    task invalid_sync_byte;
    begin
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 0;
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
        @(posedge clk_div);
        prev_d = 0;
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
    task invalid_pid_byte;
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
        dp_in = 1;
        dm_in = 0;
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
    task check_byte;
        input logic [7:0] exp_byte;
        logic [7:0] recv_byte;
        integer k;
    begin
        for(k=0; k<8; k++) begin
            @(negedge clk_div);
            check_pulse = 1;
            
            recv_byte[k] = (dp_out == prev_d) ? 1'b1 : 1'b0;
            prev_d = dp_out;
            #(0.3ns);
            check_pulse = 0;
        end
        if(recv_byte != exp_byte) begin
            $display("%t byte is wrong, expected: %h got: %h", $time, exp_byte, recv_byte);
        end else begin
            $display("%t: Correct byte, got: %h", $time, recv_byte);
        end
    end
    endtask

    task check_eop;
        integer eop_cnt;
        integer i;
    begin
        eop_cnt = 0;
        for(i=0; i<2; i++) begin
            @(negedge clk_div);
            if(dp_out == 1'b0 && dm_out == 1'b0)
                eop_cnt++;
        end
        if(eop_cnt == 2) begin
            $display("%t EOP detected", $time);
        end else if(eop_cnt < 2) begin
            $display("%t EOP not detected", $time);
        end
        prev_d = 1'b0;
    end
    endtask


    logic [31:0] data [];


    logic [7:0] encoded_byte;
    // task encode(input logic [7:0]in, input logic previousbit);
    //     encoded_byte = {8{previousbit}};
    //     encoded_byte       = (in[0] == 1'b0) ? ~encoded_byte       : encoded_byte;
    //     encoded_byte[7:1]  = (in[1] == 1'b0) ? ~encoded_byte[7:1]  : encoded_byte[7:1];
    //     encoded_byte[7:2]  = (in[2] == 1'b0) ? ~encoded_byte[7:2]  : encoded_byte[7:2];
    //     encoded_byte[7:3]  = (in[3] == 1'b0) ? ~encoded_byte[7:3]  : encoded_byte[7:3];
    //     encoded_byte[7:4]  = (in[4] == 1'b0) ? ~encoded_byte[7:4]  : encoded_byte[7:4];
    //     encoded_byte[7:5]  = (in[5] == 1'b0) ? ~encoded_byte[7:5]  : encoded_byte[7:5];
    //     encoded_byte[7:6]  = (in[6] == 1'b0) ? ~encoded_byte[7:6]  : encoded_byte[7:6];
    //     encoded_byte[7]    = (in[7] == 1'b0) ? ~encoded_byte[7]    : encoded_byte[7];
    //     encoded_byte = ~encoded_byte;
    // endtask

    task encode(input logic [7:0] in, input logic prev);
        int z;
        begin
            for(z = 0; z < 8; z++) begin
                if(in[z] ==1'b0) encoded_byte[z] = ~prev;
                else encoded_byte[z] = prev;
                prev = encoded_byte[z];
            end
        end
    endtask
    
    task send_encoded_byte();
        int l;
        begin
            for(l = 0; l < 8; l++) begin
                dp_in = encoded_byte[l];
                dm_in = ~encoded_byte[l];
               @(posedge clk_div);
            end
        end
    endtask

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
                if(BFM.get_last_read() == data && iters != 0) break;
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

    task send_encoded_data_byte(input logic [7:0] data);
    begin
        encode(data, prev_d);
        send_encoded_byte();
    end
    endtask

    logic [31:0] data0;
    logic [31:0] data1;
    logic [31:0] data2;
    logic [31:0] data3;

    task set_data(input logic [31:0] set, input logic [1:0] num);
        if(num == 2'b0) data0 = set;
        if(num == 2'b1) data1 = set;
        if(num == 2'b10) data2 = set;
        if(num == 2'b11) data3 = set;
    endtask

    task clear_buffer;
    begin
        enqueue_write(4'hD, 2'b0, 32'h1);
        execute_transactions(1);
        BFM.wait_done();
        @(negedge clk);
    end
    endtask

    task fill_buffer; //set data0-3 first 
    //will come out data0 -> data1 -> data2 -> data3 -> repeat (data0)
        int i;
        begin
            clear_buffer();
            for (i = 0; i < 16; i++) begin
                enqueue_write(4'h0, 2'b10, data0); 
                enqueue_write(4'h0, 2'b10, data1);
                enqueue_write(4'h0, 2'b10, data2);
                enqueue_write(4'h0, 2'b10, data3);
                execute_transactions(4);
                BFM.wait_done();
            end
        end
    endtask

    task read1 (input logic [7:0] data_byte);
        enqueue_read(4'h0, 2'b0, {24'b0, data_byte});
        execute_transactions(1);
        BFM.wait_done();
    endtask

    task read4(input logic [31:0] data_byte);
        enqueue_read(4'h0, 2'b10, data_byte);
        execute_transactions(1);
    endtask

    task write1;
        input logic [7:0] in;
        enqueue_write(4'h0, 2'b0, {24'h0, in});
        execute_transactions(1);
        BFM.wait_done();
    endtask

    task write4;
        input logic [31:0] in;
        enqueue_write(4'h0, 2'b10, in);
        execute_transactions(1);
        BFM.wait_done();
    endtask

    task send_packet;
        input logic [2:0] txpak;
        enqueue_write(4'hC, 2'b0, {5'b0, txpak});
        execute_transactions(1);
    endtask

    task waittx;
        @(negedge clk);
        poll_until2(4'h5, 2'b0, 32'h100);
        @(negedge clk);
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
        @(posedge clk);
        @(posedge clk);
        @(negedge clk);
        @(posedge clk);
        @(posedge clk);
        prev_d = 0;
    end
    endtask

    task fake_eop;
    begin
        dp_in = 1;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 1;
        @(posedge clk_div);
        dp_in = 1;
        dm_in = 0;
    end
    endtask

    integer n;
    typedef logic [7:0] byte_t;
    byte_t queue_array[$];
    //logic [7:0] exp_output[0:63];
    parameter TRANSMITTERTESTS = 1;
    parameter RECIEVERTESTS = 1;
    parameter AHBTESTS = 1;
    parameter DATABUFFERTESTS = 0;
    logic [31:0] datatosend;
    logic [7:0] databyte;
    initial begin
        n_rst = 1;
        prev_d = 1'b1;
        reset_model();
        reset_inputs();
        reset_dut();
        

        //receiver cases
        if(RECIEVERTESTS) begin
                
            //testinfo = "receive OUT";
            /*
            //todo check ahb side inputs
            //enqueue_read(4'h5, 2'b0, 32'b1);
            @(posedge clk_div);
            sync_byte();
            encode(OUT_PID, prev_d);
            send_encoded_byte();
            encode(8'hAA, prev_d);
            send_encoded_byte();
            encode(8'h22, prev_d);
            send_encoded_byte();
            send_eop();

            
            //poll_until2(4'h6, 2'b0, 32'h10000); //maybe need to move up
            //BFM.wait_done();
            @(negedge clk);//maybe remove            
            */
            
            testinfo = "receive IN";
            //todo check ahb side inputs
            sync_byte();
            @(posedge clk_div);
            encode(IN_PID, prev_d);
            send_encoded_byte();
            encode(8'hAA, prev_d);
            send_encoded_byte();
            encode(8'h22, prev_d);
            send_encoded_byte();
            send_eop();
            //@(posedge clk_div);
            testinfo = "receive OUT";
            //todo check ahb side inputs
            sync_byte();
            //@(posedge clk_div);
            encode(OUT_PID, prev_d);
            send_encoded_byte();
            encode(8'hAA, prev_d);
            send_encoded_byte();
            encode(8'h22, prev_d);
            send_encoded_byte();
            send_eop();
            
            testinfo = "receive ACK";
            //todo check ahb side inputs
            sync_byte();
            //@(posedge clk_div);
            encode(ACK_PID, prev_d);
            send_encoded_byte();
            repeat (5) begin
                @(posedge clk_div);
            end
            send_eop();
            
            /*
            testinfo = "receive ACK";
            //todo check ahb side inputs
            @(posedge clk_div);
            sync_byte();
            encode(ACK_PID, prev_d);
            send_encoded_byte();
            send_eop();
            */
            
            testinfo = "receive DATA1";
            encode(DATA1_PID, prev_d);
            //reset_dut();
            //send_sync_byte();
            sync_byte();
            send_encoded_byte();
            //send_encoded_data_byte(8'ha8);
            //pid_data_byte();
            //data_byte();
            databyte = 8'haa;
            for(n = 0; n<64; n++) begin
                queue_array.push_back(databyte);
                encode(databyte, prev_d);
                send_encoded_byte();
                databyte = ~databyte;
            end
            
            send_eop();
            
            
            for(n=0; n<64; n++) begin
                read1(queue_array.pop_front());
            end
            
            
            /*
            //reset_dut();
            
            testinfo = "receive DATA1";
            @(posedge clk_div);
            sync_byte();
            encode(DATA1_PID, prev_d);
            send_encoded_byte();

            for(n = 0; n < 5; n++) begin
                queue_array.push_back(databyte);
                encode(databyte, prev_d);
                send_encoded_byte();
                databyte = ~databyte;
            end
            send_eop();
            
            @(negedge clk_div);
            for(n = 0; n < 5; n++) begin
                read1(queue_array.pop_front());
            end
            */

            @(posedge clk_div);
            testinfo = "rx error: invalid sync";
            //encode(8'h82, prev_d);
            //send_encoded_byte();
            //poll_until2(4'h6, 2'b0, 32'h10000);
            invalid_sync_byte();
            //BFM.wait_done();
            @(posedge clk_div);
            @(posedge clk_div);
            testinfo = "rx error : overflow";
            encode(DATA0_PID, prev_d);
            //reset_dut();
            //send_sync_byte();
            sync_byte();
            send_encoded_byte();
            //send_encoded_data_byte(8'ha8);
            //pid_data_byte();
            //data_byte();
            databyte = 8'haa;
            for(n = 0; n<65; n++) begin
                queue_array.push_back(databyte);
                encode(databyte, prev_d);
                send_encoded_byte();
                databyte = ~databyte;
            end
            
            send_eop();
            
            
            for(n=0; n<64; n++) begin
                read1(queue_array.pop_front());
            end
            //todo check rx error
            

            @(posedge clk_div);
            testinfo = "rx error: invalid PID";
            sync_byte();
            encode(8'hff, prev_d);
            //send_encoded_byte();
            //invalid_pid_byte();
            //poll_until2(4'h6, 2'b0, 32'h10000);
            //BFM.wait_done();
            @(posedge clk_div);
            @(posedge clk_div);
            /*
            @(posedge clk_div);
            testinfo = "no eop";
            sync_byte();
            encode(DATA0_PID, prev_d);
            send_encoded_byte();
            //poll_until2(4'h6, 2'b0, 32'h10000);
            //BFM.wait_done();
            */
            /*
            @(posedge clk_div);
            
            testinfo = "rx error: invalid data < 8 bits";
            sync_byte();
            encode(DATA0_PID, prev_d);
            send_encoded_byte();
            //poll_until2(4'h6, 2'b0, 32'h10000);
            @(posedge clk_div);
            send_eop();      
            */
        end

        testinfo = "Clearing the Buffer";   
        clear_buffer();
        
        if(TRANSMITTERTESTS) begin
            //transmitter

            testinfo = "transmit ACK";
            send_packet(3'd3);
            //capture output
            @(posedge clk);
            @(negedge clk_div);
            @(posedge clk_div);
            check_sync_pid(ACK_PID, testinfo);
            check_eop();
            @(posedge clk);
            #(50ns);


            @(negedge clk);
            testinfo = "transmit NAK";
            send_packet(3'd4);
            //capture output
            @(posedge clk);
            @(negedge clk_div);
            @(posedge clk_div);
            check_sync_pid(NAK_PID, testinfo);
            check_eop();
            @(posedge clk);

            @(negedge clk);
            testinfo = "transmit STALL";
            send_packet(3'd5);
            //capture output
            @(posedge clk);
            @(posedge clk_div);
            @(posedge clk_div);
            check_sync_pid(STALL_PID, testinfo);
            check_eop();
            @(posedge clk);

            testinfo = "writing data to transmit..";
            @(negedge clk);
            //write some data to transmit
            //exp_output[0] = 8'h10;
            queue_array.push_back(8'h10);
            queue_array.push_back(8'h11);
            queue_array.push_back(8'h12);
            queue_array.push_back(8'h13);
            queue_array.push_back(8'h14);
            // for(n=1; n<64; n++) begin
            //     exp_output[n] = exp_output[n-1] + 8'h1;
            // end
            write1(8'h10);
            write4(32'h14131211);
            testinfo = "transmit DATA0";
            send_packet(3'd1);
            //capture output
            @(posedge clk);
            @(negedge clk_div);
            @(posedge clk_div);
            check_sync_pid(DATA0_PID, testinfo);
            for(n=0; n<5; n++) begin
                check_byte(queue_array.pop_front());
            end
            check_byte(8'h55);
            check_byte(8'h55);
            check_eop();
            @(posedge clk);

            @(negedge clk);
            testinfo = "writing data to transmit..";
            clear_buffer();
            datatosend = 32'h05040302;
            for(n = 0; n < 16; n++) begin
                enqueue_write(4'h0, 2'b10, datatosend);
                queue_array.push_back(datatosend[7:0]);
                queue_array.push_back(datatosend[15:8]);
                queue_array.push_back(datatosend[23:16]);
                queue_array.push_back(datatosend[31:24]);
                datatosend[7:0] = datatosend[7:0] + 8'h4;
                datatosend[15:8] = datatosend[15:8] + 8'h4;
                datatosend[23:16] = datatosend[23:16] + 8'h4;
                datatosend[31:24] = datatosend[31:24] + 8'h4;
            end
            execute_transactions(16);
            BFM.wait_done();
            @(negedge clk);
            testinfo = "transmit DATA1";
            //capture output
            send_packet(3'd2);
            @(posedge clk);
            @(posedge clk_div);
            @(negedge clk_div);
            check_sync_pid(DATA1_PID, testinfo);
            for(n=0; n<64; n++) begin
                check_byte(queue_array.pop_front());
            end
            check_byte(8'h55);
            check_byte(8'h55);
            check_eop();
            @(posedge clk);
            //todo txerr
            clear_buffer();
            @(negedge clk);
            testinfo = "tx error";
            send_packet(3'd2);
            BFM.wait_done();
            @(negedge clk);
            enqueue_read(4'h7, 2'b0, 32'h1);
            execute_transactions(1);
            BFM.wait_done();
            enqueue_read(4'hC, 2'b0, 32'h0);
            execute_transactions(1);
            BFM.wait_done();
            
        end

        testinfo = "Clearing the Buffer";
        clear_buffer();

        //AHB Test Cases
        if(AHBTESTS) begin
            //Read after Write
            testinfo = "write then read r12";
            enqueue_write(4'hC, 2'h0, 32'h2);
            enqueue_read(4'hC, 2'h0, 32'h2);
            execute_transactions(2);
            BFM.wait_done();

            //Write to a Read only Address
            testinfo = "error write to r8";
            enqueue_error_write(4'h8, 2'b0, 32'hAA);      
            enqueue_read(4'h8, 2'b0, 32'h00);
            execute_transactions(2);
            BFM.wait_done();

            //Write and Read from Invalid Address
            testinfo = "error: read to r9";
            enqueue_error_read(4'h9, 0, 32'h33);
            execute_transactions(1);
            BFM.wait_done();

            testinfo = "error write to r9";
            enqueue_error_write(4'h9, 0, 32'h5555_5555);
            execute_transactions(1);
            BFM.wait_done();

            //Valid write then Read errror
            testinfo = "write r0-r3 read err";
            enqueue_write(4'h0, 2'h2, 32'h5555_5555);
            enqueue_error_read(4'hA, 2'h1, 32'h4444);
            enqueue_read(4'h0, 2'h2, 32'h5555_5555);
            execute_transactions(3);
        end

        //db tests
        

        $finish;
    end
endmodule

/* verilator coverage_on */


`timescale 1ns / 10ps
/* verilator coverage_off */

module tb_usb_tx ();

    localparam CLK_PERIOD = 10ns;
    localparam CLK_DIV = 83.33ns;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars;
    end

    logic clk_div;

    // INPUTS
    logic clk, n_rst;
    logic [7:0] tx_packet_data;
    logic [6:0] buffer_occupancy;
    logic [2:0] tx_packet;

    // OUTPUTS
    logic dp_out, dm_out;
    logic tx_transfer_active, tx_error, get_tx_packet_data;

    typedef enum logic [2:0] {OUT, IN, DATA0, DATA1, ACK, NAK, STALL} tx_packet_type;
    localparam [7:0]SYNC_DATA = 8'b00000001;
    localparam [7:0]DATA0_PID = 8'b11000011;
    localparam [7:0]DATA1_PID = 8'b01001011;
    localparam [7:0]ACK_PID = 8'b11010010;
    localparam [7:0]NAK_PID = 8'b01011010;
    localparam [7:0]STALL_PID = 8'b00011110;

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


    usb_tx #() DUT (.*);

    logic prev_d;

    task check_sync_pid;
        input logic [7:0] exp_pid;
        input string case_name;
        logic [7:0] recv_pid;
        logic bit_out;
        integer k;
    begin
        $display("Test Case: %s", case_name);

        $display("Checking SYNC byte >>");
        for(k=0; k<8; k++) begin
            @(negedge clk_div);
            bit_out = (dp_out == prev_d) ? 1'b1 : 1'b0;
            if(bit_out != (k==0 ? 1'b1 : 1'b0)) begin
                $display("%t SYNC byte is wrong (%d bit)", $time, k);
            end
            prev_d = dp_out;
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

    task check_byte;
        input logic [7:0] exp_byte;
        logic [7:0] recv_byte;
        integer k;
    begin
        for(k=0; k<8; k++) begin
            @(negedge clk_div);
            recv_byte[k] = (dp_out == prev_d) ? 1'b1 : 1'b0;
            prev_d = dp_out;
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
    end
    endtask

    task send_packets;
        input logic [7:0] init_tx_packet;
        input logic [6:0] occupancy;
        input integer no_of_bytes;
        input logic [2:0] data_type;
        integer j;
    begin
        tx_packet_data = init_tx_packet;
        buffer_occupancy = occupancy;
        tx_packet = data_type;
        //@(negedge clk_div);
        //@(posedge clk_div);
        //check_sync_pid((data_type == 3'h2 ? DATA0_PID : DATA1_PID), test_case);

        for(j=0; j<no_of_bytes; j++) begin
            @(posedge clk);
            while(get_tx_packet_data != 1'b1) begin
                @(posedge clk);
            end
            buffer_occupancy = buffer_occupancy - 1'h1;
            //check_byte(tx_packet_data);
            tx_packet_data = tx_packet_data + 1'h1;
        end
    end
    endtask


    string test_case;
    integer i;

    initial begin
        n_rst = 1;
        tx_packet_data = 8'h0;
        buffer_occupancy = 7'h0;
        tx_packet = 3'b111;
        test_case = "Reset DUT";
        prev_d = 1'b1;

        reset_dut;
        prev_d = 1'b1;

        //ACK
        test_case = "ACK";
        tx_packet = ACK;
        @(negedge clk_div);
        @(posedge clk_div);
        check_sync_pid(ACK_PID, test_case);
        check_eop();
        while(tx_transfer_active != 1'b0) begin
            @(posedge clk);
        end
        tx_packet = 3'b111;

        reset_dut;
        prev_d = 1'b1;

        test_case = "NAK";
        //NAK
        tx_packet = NAK;
        @(negedge clk_div);
        @(posedge clk_div);
        check_sync_pid(NAK_PID, test_case);
        check_eop();
        while(tx_transfer_active != 1'b0) begin
            @(posedge clk);
        end
        tx_packet = 3'b111;

        reset_dut;
        prev_d = 1'b1;

        test_case = "STALL";
        //STALL
        tx_packet = STALL;
        @(negedge clk_div);
        @(posedge clk_div);
        check_sync_pid(STALL_PID, test_case);
        check_eop();
        while(tx_transfer_active != 1'b0) begin
            @(posedge clk);
        end
        tx_packet = 3'b111;

        reset_dut;
        prev_d = 1'b1;

        //DATA0 (1 byte data)
        test_case = "DATA0 1 byte";

        send_packets(8'h7C, 7'h1, 1, DATA0);

        while(tx_transfer_active != 1'b0) begin
            @(posedge clk);
        end
        tx_packet = 3'b111;
        
        reset_dut;
        prev_d = 1'b1;

        //DATA0 (3 bytes)
        test_case = "DATA0 3 bytes";

        send_packets(8'h59, 7'h3, 3, DATA0);

        while(tx_transfer_active != 1'b0) begin
            @(posedge clk);
        end
        tx_packet = 3'b111;

        reset_dut;
        prev_d = 1'b1;

        //DATA0 (5 bytes)
        test_case = "DATA0 5 bytes";

        send_packets(8'hA, 7'h5, 5, DATA0);

        while(tx_transfer_active != 1'b0) begin
            @(posedge clk);
        end
        tx_packet = 3'b111;

        reset_dut;
        prev_d = 1'b1;

        //DATA1 (10 bytes)
        test_case = "DATA1 10 bytes";
        
        send_packets(8'h1, 7'hA, 10, DATA1);

        while(tx_transfer_active != 1'b0) begin
            @(posedge clk);
        end
        tx_packet = 3'b111;

        reset_dut;
        prev_d = 1'b1;

        //Error case
        test_case = "ERROR";
        tx_packet = DATA0;
        buffer_occupancy = 7'h0;
        tx_packet_data = 8'hAA;
        @(posedge clk);
        @(negedge clk);
        if(tx_error == 1'b1) begin
            $display("Correct tx_error");
        end
        tx_packet = 3'b111;

        reset_dut;
        prev_d = 1'b1;
        #(20ns);

        //Bit Stuffing (3 bytes of 8'b11111111)
        test_case = "Bit Stuffing";
        tx_packet_data = 8'hFF;
        buffer_occupancy = 3;
        tx_packet = DATA0;

        for(i=0; i<3; i++) begin
            @(posedge clk);
            while(get_tx_packet_data != 1'b1) begin
                @(posedge clk);
            end
            buffer_occupancy = buffer_occupancy - 1'h1;
            @(posedge clk);
            @(posedge clk);
            @(posedge clk);
        end

        while(tx_transfer_active != 1'b0) begin
            @(posedge clk);
        end
        reset_dut;
        tx_packet = 3'b111;

        $finish;
    end
endmodule

/* verilator coverage_on */


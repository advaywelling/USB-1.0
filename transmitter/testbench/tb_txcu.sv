`timescale 1ns / 10ps
/* verilator coverage_off */

module tb_txcu ();

    localparam CLK_PERIOD = 10ns;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars;
    end
    //Local Parameters
    localparam [7:0]SYNC_DATA = 8'b00000001;
    localparam [7:0]DATA0_PID = 8'b11000011;
    localparam [7:0]ACK_PID = 8'b11010010;
    localparam [7:0]NAK_PID = 8'b01011010;
    localparam [7:0]STALL_PID = 8'b00011110;

    //INPUTS
    logic clk, n_rst;
    logic [7:0] tx_packet_data;
    logic [6:0] buffer_occupancy;
    logic [2:0] tx_packet;
    logic byte_done;
    logic bit_done;

    //OUTPUTS
    logic [7:0] data_to_send;
    logic timer_en, timer_clr;
    logic load_en;
    logic send_eop;
    logic tx_transfer_active;
    logic get_tx_packet_data;
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

    txcu #() DUT (.*);

    task check_outputs;
        input logic [7:0] exp_data_to_send;
        input logic exp_timer_en;
        input logic exp_timer_clr;
        input logic exp_load_en;
        input logic exp_send_eop;
        input logic exp_tx_transfer_active;
        input logic exp_get_tx_packet_data;
        input logic exp_tx_error;
    begin

        if(!send_eop)
            if(exp_data_to_send != data_to_send)
                $display("%t data_to_send is incorrect", $time);
        if(exp_timer_en != timer_en)
            $display("%t timer_en is incorrect", $time);
        if(exp_timer_clr != timer_clr)
            $display("%t timer_clr is incorrect", $time);
        if(exp_load_en != load_en)
            $display("%t load_en is incorrect", $time);
        if(exp_send_eop != send_eop)
            $display("%t send_eop is incorrect", $time);
        if(exp_tx_transfer_active != tx_transfer_active)
            $display("%t tx_transfer_active is incorrect", $time);
        if(exp_get_tx_packet_data != get_tx_packet_data)
            $display("%t get_tx_packet_data is incorrect", $time);
        if(exp_tx_error != tx_error)
            $display("%t tx_error is incorrect", $time);
    end
    endtask

    initial begin
        n_rst = 1;
        tx_packet_data = 8'hAC;
        buffer_occupancy = 7'h0;
        tx_packet = 3'b0;
        byte_done = 1'b0;
        bit_done = 1'b0;

        reset_dut;

        buffer_occupancy = 7'd2;
        tx_packet = ACK;

        @(posedge clk)
        @(negedge clk)
        if(data_to_send == SYNC_DATA) begin
            $display("%t sync data is correct", $time);
        end else begin
            $display("%t sync data is wrong", $time);
        end

        #(40ns);
        byte_done = 1'b1;
        @(posedge clk)
        byte_done = 1'b0;
        @(negedge clk)
        @(negedge clk)

        if(data_to_send == ACK_PID) begin
            $display("%t PID for ACK is correct", $time);
        end else begin
            $display("%t PID for ACK is wrong", $time);
        end

        #(30ns);
        @(posedge clk)
        byte_done = 1'b1;
        @(posedge clk)
        byte_done = 1'b0;
        @(negedge clk)

        if(send_eop) begin
            $display("%t Entered SEND_EOP1", $time);
        end else begin
            $display("%t Did not enter SEND_EOP1", $time);
        end
        @(posedge clk)
        bit_done = 1'b1;
        @(posedge clk)

        if(send_eop) begin
            $display("%t Entered SEND_EOP2", $time);
        end else begin
            $display("%t Did not enter SEND_EOP2", $time);
        end

        @(posedge clk)
        bit_done = 1'b0;
        @(posedge clk)


        //********************************************************************************
        // tx_packet = DATA0
        //********************************************************************************
        reset_dut;

        buffer_occupancy = 7'd2;
        tx_packet = DATA0;

        @(posedge clk)
        @(negedge clk)
        if(data_to_send == SYNC_DATA) begin
            $display("%t sync data is correct", $time);
        end else begin
            $display("%t sync data is wrong", $time);
        end

        #(40ns);
        byte_done = 1'b1;
        @(posedge clk)
        byte_done = 1'b0;
        @(posedge clk)
        @(negedge clk)

        $display("Time: %t Checking SEND_PID", $time);
        check_outputs(DATA0_PID, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0);

        #(30ns);
        @(posedge clk)
        byte_done = 1'b1;
        @(posedge clk)
        byte_done = 1'b0;
        @(negedge clk)
        @(negedge clk)
        
        $display("Time: %t Checking LOAD_TX_DATA", $time);
        check_outputs(tx_packet_data, 1'b1, 1'b0, 1'b1, 1'b0, 1'b1, 1'b0, 1'b0);

        #(10ns);
        //FETCH TX DATA
        buffer_occupancy = 7'd1;

        @(negedge clk)
        //SEND_TX_DATA
        $display("Time: %t Checking SEND_TX_DATA", $time);
        check_outputs(tx_packet_data, 1'b1, 1'b0, 1'b0, 1'b0, 1'b1, 1'b0, 1'b0);
        #(30ns);
        @(posedge clk)
        byte_done = 1'b1;
        @(posedge clk)
        byte_done = 1'b0;
        @(negedge clk);

        buffer_occupancy = 7'd0;
        #(50ns);
        @(posedge clk)
        byte_done = 1'b1;
        @(posedge clk)
        byte_done = 1'b0;
        @(negedge clk);

        //SEND_EOP1
        $display("Time: %t Checking SEND_EOP1", $time);
        check_outputs(tx_packet_data, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0);
        #(20ns);
        @(posedge clk)
        bit_done = 1'b1;
        @(posedge clk)
        bit_done = 1'b0;
        @(negedge clk)

        $display("Time: %t Checking SEND_EOP2", $time);
        check_outputs(tx_packet_data, 1'b1, 1'b0, 1'b0, 1'b1, 1'b1, 1'b0, 1'b0);

        #(20ns);
        @(posedge clk)
        bit_done = 1'b1;
        @(posedge clk)
        bit_done = 1'b0;
        @(negedge clk)

        $display("Time: %t Checking IDLE", $time);
        check_outputs(8'h1, 1'b0, 1'b1, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0);

        $finish;
    end
endmodule

/* verilator coverage_on */


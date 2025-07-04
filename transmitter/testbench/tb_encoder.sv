`timescale 1ns / 10ps
/* verilator coverage_off */

module tb_encoder ();

    localparam CLK_PERIOD = 10ns;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars;
    end

    //INPUTS
    logic clk, n_rst;
    logic serial_in;
    logic shift_strobe;
    logic send_eop;

    //OUTPUTS
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

    logic [7:0]encoded_output;

    task send_input;
        input logic [7:0] data_to_encode;
        integer i;
    begin
        for(i=0; i<8; i++) begin
            serial_in = data_to_encode[i];
            @(posedge clk);
            shift_strobe = 1'b1;
            @(posedge clk);
            shift_strobe = 1'b0;
            @(posedge clk)
            encoded_output[i] = dp_out;
            #(10ns);
        end

    end
    endtask

    task check_output;
        input logic [7:0] expected_output;
    begin
        if(expected_output == encoded_output) begin
            $display("Correct Encoded Output");
        end else begin
            $display("Incorrect Encoded Output Expected: %b EncodedOutput: %b", expected_output,encoded_output);
        end
    end
    endtask

    encoder #() DUT (.*);

    initial begin
        n_rst = 1;
        serial_in = 1'b1;
        shift_strobe = 1'b0;
        send_eop = 1'b0;

        reset_dut;

        send_input(8'b01100010);
        check_output(8'b01110100);
        @(posedge clk)
        reset_dut;

        send_input(8'b00000110);
        check_output(8'b10101000);
        @(posedge clk)
        reset_dut;

        send_input(8'b00000000);
        check_output(8'b10101010);
        send_eop = 1'b1;
        @(posedge clk)
        shift_strobe = 1'b1;
        @(posedge clk)
        shift_strobe = 1'b0;
        #(20ns)
        @(posedge clk)
        shift_strobe = 1'b1;
        @(posedge clk)
        shift_strobe = 1'b0;
        #(20ns)
        send_eop = 1'b0;

        $finish;
    end
endmodule

/* verilator coverage_on */


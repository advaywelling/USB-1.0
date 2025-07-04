`timescale 1ns / 10ps
/* verilator coverage_off */

module tb_tx_timer ();

    localparam CLK_PERIOD = 10ns;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars;
    end

    logic clk, n_rst;
    logic timer_en, timer_clr;
    logic byte_done;
    logic bit_done;
    logic shift_strobe;

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

    tx_timer #() DUT (.*);

    initial begin
        n_rst = 1;
        timer_en = 1'b0;
        timer_clr = 1'b0;
        reset_dut;

        timer_en = 1'b1;

        #(6000ns);

        timer_en = 1'b0;

        $finish;
    end
endmodule

/* verilator coverage_on */


`timescale 1ns / 10ps
/* verilator coverage_off */

module tb_decoder ();

    localparam CLK_PERIOD = 10ns;

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars;
    end

    logic clk, n_rst;
    logic dp_in, dm_in, d_orig;
    logic error, end_packet;
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

    decoder DUT (
        .clk(clk),
        .n_rst(n_rst),
        .dp_in(dp_in),
        .dm_in(dm_in),
        .d_orig(d_orig),
        .error(error),
        .end_packet(end_packet)
    );

    initial begin
        n_rst = 1;
        dp_in = 1;
        dm_in = 0;
        reset_dut();
        //normal test
        dp_in = 0;
        dm_in = 1;
        @(posedge clk);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk);
        //EOP test
        reset_dut();
        dp_in = 1;
        dm_in = 0;
        @(posedge clk);
        @(posedge clk);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk);
        dp_in = 0;
        dm_in = 1;
        @(posedge clk);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk);
        dp_in = 1;
        dm_in = 0;
        @(posedge clk);
        dp_in = 0;
        dm_in = 0;
        @(posedge clk);
        dp_in = 0;
        dm_in = 0;
        @(posedge clk);
        $finish;
    end
endmodule

/* verilator coverage_on */

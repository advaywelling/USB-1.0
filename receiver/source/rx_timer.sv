`timescale 1ns / 10ps

module rx_timer #(
    // parameters
) (
    input clk, n_rst,
    input logic timer_en, timer_clr, restart,
    output logic byte_done, shift_strobe, bit_done,
    output logic [3:0] pd_count, bit_count
);
    logic flag1, flag2;
    logic [3:0] count1, count2;
    bit_pd_counter_rx pd (
        .clk(clk),
        .n_rst(n_rst),
        .restart(restart),
        .enable(timer_en),
        .clear(timer_clr),
        .flag(flag1),
        .count_out(count1)
    );
    flex_counter_rx count (
        .clk(clk),
        .n_rst(n_rst),
        .restart(restart),
        .clear(timer_clr),
        .count_enable(flag1),
        .rollover_val(4'h8),
        .rollover_flag(flag2),
        .count_out(count2)
    );
    assign shift_strobe = flag1;
    assign bit_done = flag1;
    assign byte_done = flag2;
    assign pd_count = count1;
    assign bit_count = count2;
endmodule

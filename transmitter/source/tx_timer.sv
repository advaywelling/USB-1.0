`timescale 1ns / 10ps

module tx_timer (
    input clk, n_rst,
    input logic timer_en, timer_clr,
    output logic byte_done,
    output logic bit_done,
    output logic shift_strobe,
    output logic [3:0] pd_count, bit_count
);
    logic flag1, flag2;
    logic [3:0]count1, count2;
    //logic prev_byte_done;
    //logic curr_byte_done;

    bit_pd_counter bit_pd(
        .clk(clk), 
        .n_rst(n_rst),
        .enable(timer_en),
        .clear(timer_clr),
        .flag(flag1),
        .count_out(count1)
    );

    flex_counter #(
        .SIZE(4)
    ) bit_counter(
        .clk(clk),
        .n_rst(n_rst),
        .clear(timer_clr),
        .count_enable(flag1),
        .rollover_val(4'h8),
        .rollover_flag(flag2),
        .count_out(count2)
    );
    
    assign byte_done = (count1==4'h6) ? flag2 : 1'b0;
    assign shift_strobe = flag1;
    assign bit_done = flag1;
    assign pd_count = count1;
    assign bit_count = count2;

endmodule


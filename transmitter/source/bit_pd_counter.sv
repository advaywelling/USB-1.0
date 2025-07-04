`timescale 1ns / 10ps

module bit_pd_counter (
    input clk, n_rst,
    input logic enable,
    input logic clear,
    output logic flag,
    output logic [3:0] count_out
);

  logic [1:0] cycle_ctr, next_cycle_ctr;
  logic [3:0] period_cnt, next_period_cnt;
  logic curr_flag, next_flag;

  logic [3:0] max_cnt;

  always @(posedge clk, negedge n_rst) begin
    if (!n_rst) begin
      cycle_ctr  <= 2'd0;
      period_cnt <= 4'd0;
      curr_flag     <= 1'b0;
    end
    else begin
      cycle_ctr  <= next_cycle_ctr;
      period_cnt <= next_period_cnt;
      curr_flag <= next_flag;
    end
  end

  always_comb begin
    next_cycle_ctr = cycle_ctr;
    next_period_cnt = period_cnt;
    max_cnt = (cycle_ctr == 2) ? 4'd8 : 4'd7;

    if(clear) begin
        next_cycle_ctr = 0;
        next_period_cnt = 0;
    end else if(enable) begin
        if(period_cnt == max_cnt) begin
            next_period_cnt = 4'h0;
            if(cycle_ctr == 2) begin
                next_cycle_ctr = 2'h0;
            end else begin
                next_cycle_ctr = cycle_ctr + 1;
            end
        end else begin
            next_period_cnt = period_cnt + 1;
        end
    end
    next_flag = (next_period_cnt == max_cnt);
  end

  assign count_out = period_cnt;
  assign flag = curr_flag;


endmodule


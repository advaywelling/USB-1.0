`timescale 1ns / 10ps

module flex_counter #(
    parameter SIZE = 4
) (
    input logic clk,
    input logic n_rst,
    input logic clear,
    input logic count_enable,
    input logic [SIZE-1:0]rollover_val,
    output logic [SIZE-1:0]count_out,
    output logic rollover_flag
);
    logic [SIZE-1:0]curr_count;
    logic [SIZE-1:0]next_count;
    logic next_rollover_flag;

    always_ff @( posedge clk or negedge n_rst ) begin
        if(!n_rst) begin
            curr_count <= 0;
            rollover_flag <= 0;
        end else begin
            curr_count <= next_count;
            rollover_flag <= next_rollover_flag;
        end
    end

    always_comb begin
        next_count = curr_count;
        if(clear) begin
            next_count = 0;
        end else if(count_enable) begin
            if(curr_count >= rollover_val) begin
                next_count = 1;
            end else begin
                next_count = curr_count+1;
            end
        end
        next_rollover_flag = (next_count == rollover_val);
    end

    assign count_out = curr_count;

endmodule


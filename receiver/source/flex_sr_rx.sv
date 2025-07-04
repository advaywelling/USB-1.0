`timescale 1ns / 10ps

module flex_sr_rx #(
    parameter SIZE = 8,
    parameter MSB_FIRST = 0
) (
    input logic clk,
    input logic n_rst,
    input logic shift_enable,
    input logic load_enable,
    input logic serial_in, restart,
    input logic [SIZE-1:0]parallel_in,
    output logic serial_out,
    output logic [SIZE-1:0]parallel_out
);
    logic [SIZE-1:0]sr_temp;
    logic [SIZE-1:0]sr_next;

    always_ff @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            sr_temp <= {SIZE{1'b0}};
        end else if (restart) begin
            sr_temp <= {SIZE{1'b0}};
        end else begin
            sr_temp <= sr_next;
        end
    end

    always_comb begin
        if(load_enable) begin
            sr_next = parallel_in;
        end else if(shift_enable) begin
            if(MSB_FIRST) begin
                sr_next = {sr_temp[SIZE-2:0], serial_in};
            end else if(!MSB_FIRST) begin
                sr_next = {serial_in, sr_temp[SIZE-1:1]};
            end
        end else begin
            sr_next = sr_temp;
        end
    end

    assign serial_out = MSB_FIRST ? sr_temp[SIZE-1] : sr_temp[0];
    assign parallel_out = sr_temp;

endmodule


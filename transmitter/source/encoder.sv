`timescale 1ns / 10ps

module encoder #(
    // parameters
) (
    input clk, n_rst,
    input logic serial_in,
    input logic shift_strobe,
    input logic send_eop,
    input logic [4:0]curr_state,
    output logic dp_out,
    output logic dm_out
);

    logic d_out, next_d, d_inv, next_d_inv;

    always_ff @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            d_out <= 1'b1;
            d_inv <= 1'b0;
        end else begin
            d_out <= next_d;
            d_inv <= next_d_inv;
        end
    end

    always_comb begin
        next_d = d_out;
        next_d_inv = d_inv;
        if (shift_strobe && (curr_state==5'h9 || curr_state==5'd10 || curr_state==5'd11)) begin
            next_d = 1'b0;
            next_d_inv = 1'b0;
        end else if(shift_strobe) begin
            next_d = serial_in ? d_out : ~d_out;
            next_d_inv = ~next_d;
        end
    end

    assign dp_out = d_out;
    assign dm_out = d_inv;
    

endmodule




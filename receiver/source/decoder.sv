`timescale 1ns / 10ps

module decoder #(
    // parameters
) (
    input clk, n_rst,
    input logic dp_in, dm_in,
    input logic sample_en, restart,
    output logic d_orig, error, end_packet
);

    logic prev_dp, prev_dm, next_d_orig;
    always_ff @(posedge clk, negedge n_rst) begin
        if (!n_rst) begin
            prev_dp <= 1;
            prev_dm <= 0;
            d_orig <= 0;
        end else if (restart) begin
            prev_dp <= 1;
            prev_dm <= 0;
            d_orig <= 0;
        end else if (sample_en) begin
            prev_dp <= dp_in;
            prev_dm <= dm_in;
            d_orig <= next_d_orig;
        end
    end
    always_comb begin
        next_d_orig = d_orig;
        end_packet = 0;
        error = 0;
        if (sample_en) begin
        if (dp_in == !dm_in) begin
            next_d_orig = (dp_in == prev_dp) ? 1 : 0;
        end else if ((dp_in == dm_in) && (dp_in == 0)) begin
            if ((dp_in == prev_dp) && (dp_in == prev_dm)) 
                end_packet = 1;
            else if (prev_dp == prev_dm)
                error = 1;
        end
        end
    end

endmodule


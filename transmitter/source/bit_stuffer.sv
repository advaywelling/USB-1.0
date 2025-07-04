`timescale 1ns / 10ps

module bit_stuffer #(
    // parameters
) (
    input clk, n_rst,
    input logic serial_in,
    input logic shift_strobe,
    output logic bit_out,
    output logic shift_en
);

    logic [2:0] stuff_count, next_stuff_count;
    logic stuff_en, next_stuff_en;

    always_ff @(posedge clk, negedge n_rst) begin
        if(!n_rst) begin
            stuff_count <= 3'h0;
            stuff_en <= 1'b0;
        end else begin
            stuff_count <= next_stuff_count;
            stuff_en <= next_stuff_en;
        end
    end

    always_comb begin
        next_stuff_count = stuff_count;
        next_stuff_en = stuff_en;
        
        if(shift_strobe) begin
            if(stuff_en) begin
                next_stuff_en = 1'b0;
                next_stuff_count = 3'h0;
            end else begin
                if(serial_in == 1'b1) begin
                    if(stuff_count == 3'h5) begin
                        next_stuff_en = 1'b1;
                        next_stuff_count = 3'h0;
                    end else begin
                        next_stuff_count = stuff_count + 1;
                    end
                end else begin
                    next_stuff_count = 3'h0;
                end
            end
        end
    end

    always_comb begin
        bit_out = stuff_en ? 0 : serial_in;
        shift_en = ~stuff_en & shift_strobe;
    end

endmodule


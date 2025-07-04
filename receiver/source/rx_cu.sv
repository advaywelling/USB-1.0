`timescale 1ns / 10ps

module rx_cu #(
    // parameters
) (
    input clk, n_rst,
    input logic [7:0] byte_reg,
    input logic end_packet, error,
    input logic valid_byte,
    input logic shift_strobe,
    input logic [6:0] buffer_occupancy,
    output logic start_count, restart,
    output logic [7:0] rx_packet_data,
    output logic rx_transfer_active, rx_error, rx_store_packet_data,
    output logic rx_data_ready, flush,
    output logic [2:0] rx_packet
);
    typedef enum logic [4:0] { IDLE, PID, DATA, WAIT, TOKEN, ACK, ERROR, EOP, WAIT1, WAIT2, WAIT3, WAIT4, WAIT5,WAITB,EIDLE, WAITA, WAITC, WAITD, WAITE, WAITF } states;
    states state, next_state;
    logic prev_valid, nxt_valid, prev_prev_valid, nxt_prev_valid, prev_prev_prev_valid;
    logic [1:0] token_byte_cnt;
    logic err, n_err, prev_end_packet, next_rx_data_ready;
    logic [2:0] next_rx_packet;
    always_ff @(posedge clk, negedge n_rst) begin
        if (!n_rst) begin
            state <= IDLE;
            prev_valid <= '0;
            prev_prev_valid <= 0;
            prev_prev_prev_valid <= 0;
            prev_end_packet <= 0;
            rx_packet <= 3'd7;
            rx_data_ready <= 0;
            err <= 0;
        end else if (restart) begin
            state <=/* n_err ? EIDLE :*/ IDLE;
            prev_valid <= '0;
            prev_prev_valid <= 0;
            prev_prev_prev_valid <= 0;
            prev_end_packet <= 0;
            rx_packet <= 3'd7;
            rx_data_ready <= 0;
            err <= n_err;
        end else begin
            state <= next_state;
            prev_valid <= nxt_valid;
            prev_prev_valid <= nxt_prev_valid;
            prev_prev_prev_valid <= prev_prev_valid;
            prev_end_packet <= end_packet;
            rx_packet <= next_rx_packet;
            rx_data_ready <= next_rx_data_ready;
            err <= n_err;
        end
    end
    /*
    always_ff @(posedge clk, negedge n_rst) begin
        if (!n_rst)
            token_byte_cnt <= 2'd0;
        else if (restart)
            token_byte_cnt <= 2'd0;
        else if (state != TOKEN)
            token_byte_cnt <= 2'd0;
        else if (prev_prev_prev_valid)
            token_byte_cnt <= token_byte_cnt + 2'd1;
        else if (token_byte_cnt == 2'd2)
            token_byte_cnt <= 2'd0;
    end
    */
    always_comb begin: valid
        nxt_valid = prev_valid;
        nxt_prev_valid = prev_prev_valid;
        if (shift_strobe) begin
            nxt_valid = valid_byte;
            nxt_prev_valid = prev_valid;
        end 
        if (prev_prev_valid == 1)
            nxt_prev_valid = 0;
            
    end
    always_comb begin : next_state_logic
        next_state = state;
        case(state) 
            EIDLE: begin
                if (prev_prev_prev_valid) begin
                    if (byte_reg == 8'h01) 
                        next_state = PID;
                    /*end else if (byte_reg != 8'h00) begin
                        next_state = ERROR;
                    end*/
                end else 
                    next_state = EIDLE;
            end
            IDLE: begin
                if (byte_reg == 8'hc0) begin
                    next_state = ERROR;
                end
                if (prev_prev_prev_valid) begin
                    if (byte_reg == 8'h01) begin
                        next_state = PID;
                    //end else if (byte_reg != 8'h00) begin
                    //    next_state = ERROR;
                    end
                end else 
                    next_state = IDLE;
            end
            PID: begin
                if (end_packet)
                    next_state = ERROR;
                else begin
                    if (prev_prev_valid) begin
                        if (byte_reg[3:0] == 4'd3 || byte_reg[3:0] == 4'd11) begin
                            next_state = DATA;
                        end else if (byte_reg[3:0] == 4'd1 || byte_reg[3:0] == 4'd2 || byte_reg[3:0] == 4'd4) begin
                            next_state = TOKEN;
                        end else begin
                            next_state = ERROR;
                        end
                    end else begin
                        next_state = PID;
                end
                end
            end
            TOKEN: begin
                if (end_packet)
                    next_state = EOP;
                else
                    next_state = TOKEN;
            end
            ACK: begin
                if (end_packet)
                    next_state = EOP;
                else
                    next_state = TOKEN;
            end
            DATA: begin
                if (!prev_end_packet) begin
                    if (prev_prev_valid) begin
                        if (buffer_occupancy == 7'd64) begin
                            next_state = ERROR;
                        end else begin
                            next_state = WAIT;
                        end
                    end else begin
                        next_state = DATA;
                    end
                end else begin
                    next_state = EOP;
                end
            end
            WAIT: begin
                if (prev_end_packet || end_packet) begin
                    next_state = EOP;
                end else if (buffer_occupancy == 7'd64) begin
                    next_state = WAITA;
                end else
                    next_state = DATA;
            end
            WAITA: begin
                //if (!end_packet && buffer_occupancy == 7'd64) 
                //    next_state = ERROR;
                //else
                    next_state = WAITB;
            end
            WAITB: begin
                next_state = WAITC;
            end
            WAITC: begin
                next_state = WAITD;
            end
            WAITD: begin
                next_state =WAITE;
            end
            WAITE: begin
                next_state = WAITF;
            end
            WAITF: begin
                if (!end_packet && buffer_occupancy == 7'd64) 
                    next_state = ERROR;
                else
                    next_state = WAIT;
            end
            EOP: begin
                next_state = WAIT1;
            end
            ERROR: begin
                next_state = WAIT1;
            end
            WAIT1: next_state = WAIT2;
            WAIT2: next_state = WAIT3;
            WAIT3: next_state = WAIT4;
            WAIT4: next_state = WAIT5;
            WAIT5: next_state = IDLE;
            default: begin
                next_state = IDLE;
            end
        endcase
    end
    always_comb begin : output_logic
        next_rx_packet = rx_packet;
        rx_packet_data = 0;
        rx_store_packet_data = 0;
        flush = 0;
        next_rx_data_ready = rx_data_ready;
        start_count = 0;
        rx_transfer_active = 0;
        rx_error = 0;
        restart = 0;
        n_err = err;
        case(state)
            EIDLE: begin
                //rx_error = 1'b1;
                if (prev_prev_prev_valid) begin
                    if (byte_reg == 8'h01) begin
                        start_count = 1;
                        n_err = 0;
                    end
                end
                else begin
                    start_count = 0;
                end
            end
            IDLE: begin
                n_err = 0;
                if (prev_prev_prev_valid) begin
                    if (byte_reg == 8'h01) begin
                        start_count = 1;
                    end
                end
                else begin
                    start_count = 0;
                end
            end
            PID: begin
                if (prev_prev_valid) begin
                    rx_transfer_active = 1;
                    case (byte_reg/*[3:0]*/) 
                        8'b11100001: next_rx_packet = 3'd0;
                        8'b11010011: next_rx_packet = 3'd1;
                        8'b11000011: next_rx_packet = 3'd2;
                        8'b01001011: next_rx_packet = 3'd3;
                        8'b11010010: next_rx_packet = 3'd4;
                        default: begin 
                            next_rx_packet = 3'd7;
                        end
                    endcase
                    if (byte_reg[3:0] == 4'd3 || byte_reg[3:0] == 4'd11) begin
                        flush = 1;
                    end else begin
                        flush = 0;
                    end
                end else begin
                    rx_transfer_active = 0;
                end
            end
            TOKEN: begin
                rx_transfer_active = 1;
            end
            DATA: begin
                flush = 0;
                rx_transfer_active = 1;
                if (!prev_end_packet) begin
                    if (prev_prev_valid) begin
                        if (buffer_occupancy < 7'd64) begin
                            rx_store_packet_data = 1;
                            rx_packet_data = byte_reg;
                        end
                    end
                end
            end
            WAIT: begin
                rx_transfer_active = 1;
                rx_store_packet_data = 0;
            end
            WAITA: begin
                rx_transfer_active = 1;
            end
            WAITB: begin
                rx_transfer_active = 1;
            end
            WAITC: begin
                rx_transfer_active = 1;
            end
            WAITD: begin
                rx_transfer_active = 1;
            end
            WAITE: begin
                rx_transfer_active = 1;
            end
            WAITF: begin
                rx_transfer_active = 1;
            end
            ERROR:  begin rx_error = 1;
                    n_err = 1;
                    rx_transfer_active = 0;
            end
            EOP: begin
                next_rx_data_ready = 1;
                rx_transfer_active = 0;
            end
            WAIT5: restart = 1;
            default: begin
            end
        endcase
    end

endmodule

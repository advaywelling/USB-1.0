`timescale 1ns / 10ps

module txcu #(
) (
    input clk, n_rst,
    input logic [7:0] tx_packet_data,
    input logic [6:0] buffer_occupancy,
    input logic [2:0] tx_packet,
    input logic byte_done,  bit_done,
    input logic [3:0]pd_count, bit_count,
    output logic [7:0] data_to_send,
    output logic timer_en, timer_clr,
    output logic load_en,
    output logic send_eop,
    output logic tx_transfer_active,
    output logic get_tx_packet_data,
    output logic tx_error,
    output logic [4:0]curr_state
);

typedef enum logic [4:0] {IDLE, EIDLE, LOAD_SYNC, SEND_SYNC, LOAD_PID, SEND_PID, FETCH_TX_DATA, LOAD_TX_DATA, SEND_TX_DATA, WAIT_EOP, SEND_EOP1, SEND_EOP2, END_TX, LOAD_CRC1, SEND_CRC1, LOAD_CRC2, SEND_CRC2} state_t;
typedef enum logic [2:0] {OUT, IN, DATA0, DATA1, ACK, NAK, STALL} tx_packet_type;

state_t state, next_state;
localparam [7:0]SYNC_DATA = 8'b00000001;
localparam [7:0]DATA0_PID = 8'b11000011;
localparam [7:0]DATA1_PID = 8'b01001011;
localparam [7:0]ACK_PID = 8'b11010010;
localparam [7:0]NAK_PID = 8'b01011010;
localparam [7:0]STALL_PID = 8'b00011110;

always_ff @(posedge clk, negedge n_rst) begin : state_logic
    if(!n_rst) begin
        state <= IDLE;
        tx_transfer_active <= 0;
    end else begin
        state <= next_state;
        tx_transfer_active <= (next_state!=IDLE && next_state!=EIDLE && next_state!=END_TX);
    end
end

always_comb begin : next_state_logic
    next_state = state;
    case (state)
        IDLE: begin
            if((tx_packet == DATA0 || tx_packet == DATA1) && buffer_occupancy == 7'h0) begin
                next_state = EIDLE;
            end else if(((tx_packet == DATA0 || tx_packet == DATA1) && buffer_occupancy != 7'h0) || tx_packet == ACK || tx_packet == NAK || tx_packet == STALL)begin
                next_state = LOAD_SYNC;
            end else begin
                next_state = IDLE;
            end
        end
        LOAD_SYNC: next_state = SEND_SYNC;
        SEND_SYNC: next_state = byte_done ? LOAD_PID : SEND_SYNC;
        LOAD_PID: next_state = SEND_PID;
        SEND_PID: begin
            if(pd_count==4'h4 && bit_count==4'h8) begin
                next_state = (tx_packet==DATA0 || tx_packet==DATA1) ? FETCH_TX_DATA : SEND_PID;
            end else if (byte_done) begin
                next_state = WAIT_EOP;
            end else begin
                next_state = SEND_PID;
            end
        end
        FETCH_TX_DATA: next_state = LOAD_TX_DATA;
        LOAD_TX_DATA: next_state = SEND_TX_DATA;
        SEND_TX_DATA: begin
            if(buffer_occupancy != 0) begin
                next_state = (pd_count==4'h4 && bit_count==4'h8) ? FETCH_TX_DATA : SEND_TX_DATA;
            end else begin
                next_state = (pd_count==4'h5 && bit_count==4'h8) ? LOAD_CRC1 : SEND_TX_DATA;
            end
        end
        LOAD_CRC1: next_state = SEND_CRC1;
        SEND_CRC1: next_state = (pd_count==4'h5 && bit_count==4'h8) ? LOAD_CRC2 : SEND_CRC1;
        LOAD_CRC2: next_state = SEND_CRC2;
        SEND_CRC2: next_state = byte_done ? WAIT_EOP : SEND_CRC2;
        WAIT_EOP: next_state = bit_done ? SEND_EOP1 : WAIT_EOP;
        SEND_EOP1: next_state = bit_done ? SEND_EOP2 : SEND_EOP1;
        SEND_EOP2: next_state = bit_done ? END_TX : SEND_EOP2;
        END_TX: next_state = tx_packet==3'h7 ? IDLE : END_TX;
        EIDLE: begin
            if((tx_packet == DATA0 || tx_packet == DATA1) && buffer_occupancy == 7'h0) begin
                next_state = EIDLE;
            end else if (((tx_packet == DATA0 || tx_packet == DATA1) && buffer_occupancy != 7'h0) || tx_packet == ACK || tx_packet == NAK || tx_packet == STALL) begin
                next_state = LOAD_SYNC;
            end else begin
                next_state = EIDLE;
            end
        end
        default: next_state = state;
    endcase
end

always_comb begin : output_block
    data_to_send = 8'h1;
    timer_en = 0;
    timer_clr = 0;
    load_en = 0;
    send_eop = 0;
    case(state)
        IDLE: begin
            data_to_send = 8'h1;
            timer_en = 0;
            load_en = 0;
            send_eop = 0;
            timer_clr = 1'b1;
        end

        LOAD_SYNC: begin
            data_to_send = SYNC_DATA;
            timer_en = 1'b1;
            timer_clr = 1'b0;
            load_en = 1'b1;
        end

        SEND_SYNC: begin
            load_en = 1'b0;
            timer_en = 1'b1;
        end

        LOAD_PID: begin
            load_en = 1'b1;
            timer_en = 1'b1;
            case(tx_packet)
                DATA0: data_to_send = DATA0_PID;
                DATA1: data_to_send = DATA1_PID;
                ACK: data_to_send = ACK_PID;
                NAK: data_to_send = NAK_PID;
                STALL: data_to_send = STALL_PID;
                default: data_to_send = 8'b11111111;
            endcase
        end

        SEND_PID:  begin
            load_en = 1'b0;
            timer_en = 1'b1;
            case(tx_packet)
                DATA0: data_to_send = DATA0_PID;
                ACK: data_to_send = ACK_PID;
                NAK: data_to_send = NAK_PID;
                STALL: data_to_send = STALL_PID;
                default: data_to_send = 8'b11111111;
            endcase
        end

        FETCH_TX_DATA:  begin
            //get_tx_packet_data = 1'b1;
            timer_en = 1'b1;
            //tx_transfer_active = 1'b1;
        end

        LOAD_TX_DATA:  begin
            load_en = 1'b1;
            data_to_send = tx_packet_data;
            timer_en = 1'b1;
            //tx_transfer_active = 1'b1;
        end

        SEND_TX_DATA:  begin
            load_en = 1'b0;
            data_to_send = tx_packet_data;
            timer_en = 1'b1;
            //tx_transfer_active = 1'b1;
            //get_tx_packet_data = byte_done && (buffer_occupancy!=0);
        end

        LOAD_CRC1:  begin
            load_en = 1'b1;
            data_to_send = 8'h55;
            timer_en = 1'b1;
            //tx_transfer_active = 1'b1;
        end
        SEND_CRC1:  begin
            load_en = 1'b0;
            data_to_send = 8'h55;
            timer_en = 1'b1;
            //tx_transfer_active = 1'b1;
        end

        LOAD_CRC2:  begin
            load_en = 1'b1;
            data_to_send = 8'h55;
            timer_en = 1'b1;
            //tx_transfer_active = 1'b1;
        end
        SEND_CRC2:  begin
            load_en = 1'b0;
            data_to_send = 8'h55;
            timer_en = 1'b1;
            //tx_transfer_active = 1'b1;
        end

        WAIT_EOP:  begin
            load_en = 1'b0;
            send_eop = 1'b0;
            timer_en = 1'b1;
            //tx_transfer_active = 1'b1;
        end

        SEND_EOP1:  begin
            load_en = 1'b0;
            send_eop = 1'b1;
            timer_en = 1'b1;
            //tx_transfer_active = 1'b1;
        end

        SEND_EOP2:  begin
            load_en = 1'b0;
            send_eop = 1'b1;
            timer_en = 1'b1;
            //tx_transfer_active = 1'b1;
        end

        END_TX: begin
            data_to_send = 8'h1;
            timer_en = 0;
            load_en = 0;
            send_eop = 0;
            timer_clr = 1'b1;
        end

        EIDLE:  begin
            data_to_send = 8'h1;
            timer_en = 0;
            load_en = 0;
            send_eop = 0;
            //tx_transfer_active = 0;
            //get_tx_packet_data = 0;
            //tx_error = 1;
        end

        default: begin
            data_to_send = 8'hFF;
            timer_en = 0;
            load_en = 0;
            send_eop = 0;
            //tx_transfer_active = 0;
            //get_tx_packet_data = 0;
            //tx_error = 0;
            timer_clr = 0;
        end

    endcase
end

assign curr_state = state;

assign get_tx_packet_data = state==FETCH_TX_DATA;
assign tx_error = state==EIDLE;

endmodule


`timescale 1ns / 10ps

module hready_controller (
    input logic clk, 
    input logic n_rst,
    output logic hready,
    output logic hresp,
    output logic [3:0] regadd,
    output logic write_tx,
    output logic store_tx_data,
    output logic get_rx_data,
    input logic hwrite,
    input logic [3:0] haddr,
    input logic [1:0] hsize,
    input logic hsel,
    input logic [3:0] curr_addr,
    input logic [1:0] htrans
);

    typedef enum logic [5:0] {
        IDLE, EIDLE1, EIDLE2, WRITE0_DATA, WRITE1_DATA, WRITE1_MEM, WRITE1_NEXTTX, WRITE1_TX,
        WRITE2_DATA, WRITE2_MEM, WRITE2_NEXTTX1, WRITE2_NEXTTX2, WRITE2_TX,
        WRITE4_DATA, WRITE4_MEM, WRITE4_NEXTTX1, WRITE4_NEXTTX2, WRITE4_NEXTTX3, WRITE4_NEXTTX4, WRITE4_TX,
        READ0_DATA, READ1_DATA, READ1_NEXTMEM, READ1_MEM, READ1_HRDATA, 
        READ2_DATA, READ2_NEXTMEM1, READ2_NEXTMEM2, READ2_MEM, READ2_HRDATA,
        READ4_DATA, READ4_NEXTMEM1, READ4_NEXTMEM2, READ4_NEXTMEM3, READ4_NEXTMEM4, READ4_MEM, READ4_HRDATA
    } state_t;
    logic next_hready, next_hresp, next_get_rx_data, next_store_tx_data;
    state_t state, next_state;

    always_ff @( posedge clk, negedge n_rst ) begin : hready_state
        if(!n_rst) begin
            state <= IDLE;
            hready <= 1'b1;
            hresp <= 1'b0;
            get_rx_data <= 1'b0;
            store_tx_data <= 1'b0;
        end else begin
            state <= hsel ? next_state : IDLE;
            get_rx_data <= hsel ? next_get_rx_data : 1'b0;
            store_tx_data <= hsel ? next_store_tx_data : 1'b0;
            hready <= hsel ? next_hready : 1'b1;
            hresp <= hsel ? next_hresp : 1'b0;
        end        
    end

    always_comb begin : state_logic
        next_state = state;
        regadd = 4'h9;
        next_hready = 1'b0;
        next_hresp = 1'b0;
        next_store_tx_data = 1'b0;
        next_get_rx_data = 1'b0;
        write_tx = 1'b0;
        case (state)
            IDLE: begin
                next_hready = 1'b1;
                if((haddr == 4'd9 | haddr == 4'd10 | haddr == 4'd11 | haddr == 4'd14 | haddr == 4'd15) | 
                    (hwrite & ~(haddr == 4'b0 | haddr == 4'b1 | haddr == 4'd2 | haddr == 4'd3 | haddr == 4'd12 | haddr == 4'd13)) | 
                    (hwrite & haddr == 4'hC & hsize == 2'b10)) begin
                        next_state = EIDLE1;
                        next_hresp = 1'b1;
                        next_hready = 1'b0;
                end
                else if(!hwrite && haddr > 4'h3) begin 
                    next_state = IDLE;
                    next_hready = 1'b1;
                end
                else if(!hwrite && hsize == 2'b0 && haddr < 4'h4) begin
                    next_state = READ1_DATA;
                    next_get_rx_data = 1'b1;
                    next_hready = 1'b0;
                end
                else if(!hwrite && hsize == 2'b1 && (haddr == 4'b0 || haddr == 4'h2)) begin
                    next_state = READ2_DATA;
                    next_get_rx_data = 1'b1;
                    next_hready = 1'b0;
                end
                else if(!hwrite && hsize == 2'b10 && haddr == 4'b0) begin
                    next_state = READ4_DATA;
                    next_get_rx_data = 1'b1;
                    next_hready = 1'b0;
                end
                else if(hwrite && haddr > 4'h3) begin
                    next_state = WRITE0_DATA;
                    next_hready = 1'b0;
                end
                else if(hwrite && hsize == 2'b0 && haddr < 4'h4) begin
                    next_state = WRITE1_DATA;
                    next_hready = 1'b0;
                end
                else if(hwrite && hsize == 2'b1 && (haddr == 4'b0 || haddr == 4'h2)) begin
                    next_state = WRITE2_DATA;
                    next_hready = 1'b0;
                end
                else if(hwrite && hsize == 2'b10 && haddr == 4'b0) begin
                    next_state = WRITE4_DATA;
                    next_hready = 1'b0;
                end
                if(!hsel || htrans == 2'b0) begin
                    next_hready = 1'b1;
                    next_state = IDLE;
                    next_get_rx_data = 1'b0;
                    next_store_tx_data = 1'b0;
                    next_hresp = 1'b0;
                end
            end
            EIDLE1: begin
                next_hresp = 1'b1;
                next_hready = 1'b1;
                next_state = EIDLE2;
            end
            EIDLE2: begin
                next_hready = 1'b1;
                next_hresp = 1'b0;
                next_state = IDLE;
            end
            READ0_DATA: begin
                next_hready = 1'b1;
                next_state = IDLE;
            end
            READ1_DATA: begin
                next_get_rx_data = 1'b0;
                next_state = READ1_NEXTMEM;
            end
            READ1_NEXTMEM: begin
                regadd = curr_addr;
                next_state = READ1_MEM;
            end
            READ1_MEM: begin
                next_state = READ1_HRDATA;
            end
            READ1_HRDATA: begin 
                next_hready = 1'b1;
                next_state = IDLE;
            end
            READ2_DATA: begin
                next_get_rx_data = 1'b1;
                next_state = READ2_NEXTMEM1;
            end
            READ2_NEXTMEM1: begin
                next_get_rx_data = 1'b0;
                regadd = curr_addr;
                next_state = READ2_NEXTMEM2;
            end
            READ2_NEXTMEM2: begin
                regadd = curr_addr+4'b1;
                next_state = READ2_MEM;
            end
            READ2_MEM: next_state = READ2_HRDATA;
            READ2_HRDATA: begin 
                next_hready = 1'b1;
                next_state = IDLE;
            end
            READ4_DATA: begin
                next_get_rx_data = 1'b1;
                next_state = READ4_NEXTMEM1;
            end
            READ4_NEXTMEM1: begin
                next_get_rx_data = 1'b1;
                next_state = READ4_NEXTMEM2;
                regadd = curr_addr;
            end
            READ4_NEXTMEM2: begin
                next_get_rx_data = 1'b1;
                next_state = READ4_NEXTMEM3;
                regadd = curr_addr + 4'b1;
            end
            READ4_NEXTMEM3: begin
                next_get_rx_data = 1'b0;
                next_state = READ4_NEXTMEM4;
                regadd = curr_addr + 4'b10;
            end
            READ4_NEXTMEM4: begin
                regadd = curr_addr + 4'b11;
                next_state = READ4_MEM;
            end
            READ4_MEM: next_state = READ4_HRDATA;
            READ4_HRDATA: begin 
                next_hready = 1'b1;
                next_state = IDLE;
            end
            WRITE0_DATA: begin 
                next_hready = 1'b1;
                next_state = IDLE;
            end
            WRITE1_DATA: begin
                next_state = WRITE1_MEM;
            end
            WRITE1_MEM: next_state = WRITE1_NEXTTX;
            WRITE1_NEXTTX: begin
                regadd = curr_addr;
                write_tx = 1'b1;
                next_state = WRITE1_TX;
                next_store_tx_data = 1'b1;
            end
            WRITE1_TX: begin
                next_store_tx_data = 1'b0;
                next_hready = 1'b1;
                next_state = IDLE;
            end
            WRITE2_DATA: next_state = WRITE2_MEM;
            WRITE2_MEM: next_state = WRITE2_NEXTTX1;
            WRITE2_NEXTTX1: begin
                regadd = curr_addr;
                write_tx = 1'b1;
                next_state = WRITE2_NEXTTX2;
                next_store_tx_data = 1'b1;
            end
            WRITE2_NEXTTX2: begin
                regadd = curr_addr + 4'b1;
                next_state = WRITE2_TX;
                write_tx = 1'b1;
                next_store_tx_data = 1'b1;
            end
            WRITE2_TX: begin
                next_store_tx_data = 1'b0;
                next_state = IDLE;
                next_hready = 1'b1;
            end
            WRITE4_DATA: next_state = WRITE4_MEM;
            WRITE4_MEM: next_state = WRITE4_NEXTTX1;
            WRITE4_NEXTTX1: begin
                regadd = curr_addr;
                write_tx = 1'b1;
                next_state = WRITE4_NEXTTX2;
                next_store_tx_data = 1'b1;
            end
            WRITE4_NEXTTX2: begin
                regadd = curr_addr + 4'b1;
                write_tx = 1'b1;
                next_store_tx_data = 1'b1;
                next_state = WRITE4_NEXTTX3;
            end
            WRITE4_NEXTTX3: begin
                regadd = curr_addr + 4'h2;
                write_tx = 1'b1;
                next_store_tx_data = 1'b1;
                next_state = WRITE4_NEXTTX4;
            end
            WRITE4_NEXTTX4: begin
                regadd = curr_addr + 4'h3;
                write_tx = 1'b1;
                next_store_tx_data = 1'b1;
                next_state = WRITE4_TX;
            end
            WRITE4_TX: begin
                next_store_tx_data = 1'b0;
                next_hready = 1'b1;
                next_state = IDLE;
            end
            default: next_state = IDLE;
        endcase
    end

endmodule

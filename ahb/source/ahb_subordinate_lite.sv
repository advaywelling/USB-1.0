`timescale 1ns / 10ps

module ahb_subordinate_lite (
    input logic clk,
    input logic n_rst,
    input logic hsel,
    input logic [3:0] haddr,
    input logic [1:0] hsize,
    input logic [1:0] htrans,
    input logic hwrite,
    input logic [31:0] hwdata,
    output logic [31:0] hrdata,
    output logic hresp,
    output logic hready,
    input logic [2:0] rx_packet,
    input logic rx_data_ready,
    input logic rx_transfer_active,
    input logic rx_error,
    output logic d_mode,
    input logic [6:0] buffer_occupancy,
    input logic [7:0] rx_data,
    output logic get_rx_data,
    output logic store_tx_data,
    output logic [7:0] tx_data,
    output logic clear,
    output logic [2:0] tx_packet,
    input logic tx_transfer_active,
    input logic tx_error,
    input logic [2:0] hburst
    );
    logic [3:0] txreg;
    
    /* verilator lint_off UNUSEDSIGNAL */
    logic [15:0][7:0] mem,next_mem;
    logic write_tx;
    /* verilator lint_on UNUSEDSIGNAL */
    logic [3:0] prev_addr, curr_addr;
    logic [1:0] prev_size, curr_size;
    hready_controller hrcu(.clk(clk), .n_rst(n_rst), .hready(hready), .hresp(hresp), 
                            .regadd(txreg), .write_tx(write_tx), .store_tx_data(store_tx_data), .hsel(hsel), .htrans(htrans),
                            .get_rx_data(get_rx_data), .hwrite(hwrite), .haddr(haddr), .curr_addr(prev_addr), .hsize(hsize));
    logic [31:0] next_hrdata;
    logic [7:0] next_tx_data;
    logic prev_hwrite, prev_write, curr_write;
    logic [3:0] prev_write_addr, write_addr;
    logic [1:0] prev_write_size, write_size;
    logic prev_tx_active, prev_get_rx_data;
    
    assign d_mode = tx_transfer_active;
    assign clear = mem[13][0];
   
    always_comb begin
        case (mem[12])
            8'd1: tx_packet = 3'd2;
            8'd2: tx_packet = 3'd3;
            8'd3: tx_packet = 3'd4;
            8'd4: tx_packet = 3'd5;
            8'd5: tx_packet = 3'd6; 
            default: tx_packet = 3'd7;
        endcase
        next_tx_data = 8'b0;
        curr_addr = prev_addr;
        curr_size = prev_size;
        curr_write = prev_write;
        if(txreg < 4'h4) next_tx_data = mem[txreg][7:0];
        if(hsel && hready) begin
            curr_addr = haddr;
            curr_size = hsize;
            curr_write = hwrite;
        end
    end

    always_ff @( posedge clk, negedge n_rst ) begin : ready_stuff
        if(!n_rst) begin
            prev_addr <= 4'h9;
            prev_size <= 2'b0;
            prev_write <= 1'b0;
        end else begin
            prev_write <= curr_write;
            prev_addr <= curr_addr;
            prev_size <= curr_size;
        end
    end

    always_comb begin : read_logic
        next_hrdata = hrdata;
        if(hsel) begin
            next_hrdata = 32'b0;
            if(hready) begin
                if(!hwrite && !(hresp)) begin //removed &&htrans != 0 bc next_get_rx_data might need to update in idle (address) state
                    next_hrdata[31:0] = 32'b0;
                    if(hsize == 2'b0) begin
                        next_hrdata[haddr[1:0]*8 +: 8] = mem[haddr];
                    end
                    //reading 2 bytes from odd addresses is undefined behavior and will not be tested
                    if(hsize == 2'b1) begin
                        next_hrdata[haddr[1:0]*8 +: 16] = {mem[haddr+4'b1], mem[haddr]};
                    end
                    //reading 4 bytes from addresses %4 != 0 is undefined behavior and will not be tested.
                    if(hsize == 2'b10 && haddr <= 4'd12) begin
                        next_hrdata[31:0] = {mem[haddr+4'b11], mem[haddr+4'b10], mem[haddr+4'b1], mem[haddr]};
                    end
                end
            end
            if(~hready) begin
                if(!prev_write && !hresp) begin
                    if(prev_size == 2'b0) begin
                        next_hrdata[prev_addr[1:0]*8 +: 8] = mem[prev_addr];
                    end
                    //reading 2 bytes from odd addresses is undefined behavior and will not be tested
                    if(prev_size == 2'b1) begin
                        next_hrdata[prev_addr[1:0]*8 +: 16] = {mem[prev_addr+4'b1], mem[prev_addr]};
                    end
                    //reading 4 bytes from addresses %4 != 0 is undefined behavior and will not be tested.
                    if(prev_size == 2'b10 && prev_addr <= 4'd12) begin
                        next_hrdata[31:0] = {mem[prev_addr+4'b11], mem[prev_addr+4'b10], mem[prev_addr+4'b1], mem[prev_addr]};
                    end
                end
            end
        end
    end

    //writes > 1 cycle won't work based on prev write
    //might be fixed with hready logic in ff
    always_comb begin : write_logic
        next_mem = mem;
        if(hsel) begin
            if(prev_hwrite && (prev_write_addr < 4'd4 || prev_write_addr == 4'd12 || prev_write_addr == 4'd13)) begin
                if(prev_write_size == 2'b0) begin
                    next_mem[prev_write_addr] = hwdata[prev_write_addr[1:0]*8 +: 8];
                end
                if(prev_write_size == 2'b1) begin
                    {next_mem[prev_write_addr+4'b1], next_mem[prev_write_addr]} = hwdata[prev_write_addr[1:0]*8 +: 16];
                end
                if(prev_write_size == 2'b10) begin
                    {next_mem[prev_write_addr+4'b11], next_mem[prev_write_addr+4'b10], next_mem[prev_write_addr+4'b1], next_mem[prev_write_addr]} = hwdata;
                end
                    //hready low for tx_data done in hrcu
                    //clear r12 after packet is sent done in ready block
                if(prev_write_addr == 4'd13 || (prev_write_addr == 4'd12 && prev_write_size!=0)) begin
                    //clear high for 1 cycle if hwdata[8] == 1 done at top assign
                end
            end
        end
        write_addr = 4'h9;
        write_size = 2'b0;
        if(hsel && htrans != 0 && hwrite) begin
            write_addr = haddr;
            write_size = hsize;
        end
        else if(hsel && htrans != 0 && hwrite == 1'b0) begin
            write_addr = 4'hF;
        end
        if(prev_get_rx_data) begin
            next_mem[txreg] = rx_data;
        end
        if(mem[13][0] == 1'b1) begin
            next_mem[13] = 8'b0;
        end
        if((tx_transfer_active == 1'b0 && prev_tx_active == 1'b1) || tx_error == 1'b1) next_mem[12] = 8'b0;

    end

    always_ff @(posedge clk, negedge n_rst) begin : write_ff
        if(!n_rst) begin
            prev_write_addr <= 4'b0;
            prev_hwrite <= 1'b0;
            prev_write_size <= 2'b0;
            prev_tx_active <= 1'b0;
            prev_get_rx_data <= 1'b0;
        end
        else begin
            prev_tx_active <= tx_transfer_active;
            prev_get_rx_data <= get_rx_data;
            prev_write_addr <= (hready == 1'b0) ? prev_write_addr : write_addr;
            prev_write_size <= (hready == 1'b0) ? prev_write_size : write_size;
            prev_hwrite <= (hready == 1'b0) ? prev_hwrite : hwrite;
        end
    end

    always_ff @( posedge clk, negedge n_rst ) begin : registers_ff
        if(!n_rst) begin
            mem <= '0;
            hrdata <= 32'b0;
            tx_data <= 8'b0;
        end
        else begin
            hrdata <= next_hrdata;
            tx_data <= next_tx_data;
            mem[0] <= next_mem[0];
            mem[1] <= next_mem[1];
            mem[2] <= next_mem[2];
            mem[3] <= next_mem[3];
            mem[4][0] <= rx_data_ready;
            mem[4][1] <= rx_packet == 3'b1; //IN
            mem[4][2] <= rx_packet == 3'b0; //OUT
            mem[4][3] <= rx_packet == 3'd4; //ACK
            mem[4][4] <= rx_packet == 3'd2; //DATA0
            mem[4][5] <= rx_packet == 3'd3; //DATA1
            mem[4][7:6] <= 2'b0;
            mem[5] <= {6'b0, tx_transfer_active, rx_transfer_active};
            mem[6] <= {7'b0, rx_error};
            mem[7] <= {7'b0, tx_error};
            mem[8] <= {1'b0, buffer_occupancy};
            mem[9] <= 8'b0; //invalids
            mem[10] <= 8'b0; //invalids
            mem[11] <= 8'b0; //invalids

            
            mem[12] <= next_mem[12]; //clear after 1 cycle
            mem[13] <= next_mem[13]; //clear after 1 cycle


            mem[14] <= 8'b0; //invalids
            mem[15] <= 8'b0; //invalids
        end
    end

endmodule

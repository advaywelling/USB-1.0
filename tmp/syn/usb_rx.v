/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP4
// Date      : Thu May  1 12:00:56 2025
/////////////////////////////////////////////////////////////


module decoder ( clk, n_rst, dp_in, dm_in, sample_en, restart, d_orig, error, 
        end_packet );
  input clk, n_rst, dp_in, dm_in, sample_en, restart;
  output d_orig, error, end_packet;
  wire   prev_dp, prev_dm, n22, n23, n24, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18;

  DFFSR prev_dp_reg ( .D(n24), .CLK(clk), .R(1'b1), .S(n_rst), .Q(prev_dp) );
  DFFSR d_orig_reg ( .D(n23), .CLK(clk), .R(n_rst), .S(1'b1), .Q(d_orig) );
  DFFSR prev_dm_reg ( .D(n22), .CLK(clk), .R(n_rst), .S(1'b1), .Q(prev_dm) );
  NAND2X1 U6 ( .A(n4), .B(n5), .Y(n24) );
  INVX1 U7 ( .A(restart), .Y(n5) );
  MUX2X1 U8 ( .B(prev_dp), .A(dp_in), .S(sample_en), .Y(n4) );
  INVX1 U9 ( .A(n6), .Y(n23) );
  MUX2X1 U10 ( .B(n7), .A(d_orig), .S(n8), .Y(n6) );
  AOI21X1 U11 ( .A(sample_en), .B(n9), .C(restart), .Y(n8) );
  XNOR2X1 U12 ( .A(n10), .B(dm_in), .Y(n9) );
  NOR2X1 U13 ( .A(restart), .B(n11), .Y(n7) );
  XNOR2X1 U14 ( .A(n12), .B(dp_in), .Y(n11) );
  NOR2X1 U15 ( .A(restart), .B(n13), .Y(n22) );
  MUX2X1 U16 ( .B(prev_dm), .A(dm_in), .S(sample_en), .Y(n13) );
  NOR2X1 U17 ( .A(n14), .B(n15), .Y(error) );
  OR2X1 U18 ( .A(n16), .B(n12), .Y(n15) );
  NOR2X1 U19 ( .A(n16), .B(n17), .Y(end_packet) );
  NAND2X1 U20 ( .A(n14), .B(n12), .Y(n17) );
  INVX1 U21 ( .A(prev_dp), .Y(n12) );
  INVX1 U22 ( .A(prev_dm), .Y(n14) );
  NAND3X1 U23 ( .A(n18), .B(n10), .C(sample_en), .Y(n16) );
  INVX1 U24 ( .A(dp_in), .Y(n10) );
  INVX1 U25 ( .A(dm_in), .Y(n18) );
endmodule


module flex_sr_rx_MSB_FIRST0 ( clk, n_rst, shift_enable, load_enable, 
        serial_in, restart, parallel_in, serial_out, parallel_out );
  input [7:0] parallel_in;
  output [7:0] parallel_out;
  input clk, n_rst, shift_enable, load_enable, serial_in, restart;
  output serial_out;
  wire   serial_out, n32, n33, n34, n35, n36, n37, n38, n39, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31;
  assign parallel_out[0] = serial_out;

  DFFSR \sr_temp_reg[7]  ( .D(n33), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[7]) );
  DFFSR \sr_temp_reg[6]  ( .D(n34), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[6]) );
  DFFSR \sr_temp_reg[5]  ( .D(n35), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[5]) );
  DFFSR \sr_temp_reg[4]  ( .D(n36), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[4]) );
  DFFSR \sr_temp_reg[3]  ( .D(n37), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[3]) );
  DFFSR \sr_temp_reg[2]  ( .D(n38), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[2]) );
  DFFSR \sr_temp_reg[1]  ( .D(n39), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        parallel_out[1]) );
  DFFSR \sr_temp_reg[0]  ( .D(n32), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        serial_out) );
  OAI21X1 U10 ( .A(n9), .B(n10), .C(n11), .Y(n39) );
  AOI22X1 U11 ( .A(parallel_in[1]), .B(n12), .C(parallel_out[2]), .D(n13), .Y(
        n11) );
  INVX1 U12 ( .A(parallel_out[1]), .Y(n10) );
  OAI21X1 U13 ( .A(n14), .B(n9), .C(n15), .Y(n38) );
  AOI22X1 U14 ( .A(parallel_in[2]), .B(n12), .C(parallel_out[3]), .D(n13), .Y(
        n15) );
  INVX1 U15 ( .A(parallel_out[2]), .Y(n14) );
  OAI21X1 U16 ( .A(n9), .B(n16), .C(n17), .Y(n37) );
  AOI22X1 U17 ( .A(parallel_in[3]), .B(n12), .C(parallel_out[4]), .D(n13), .Y(
        n17) );
  INVX1 U18 ( .A(parallel_out[3]), .Y(n16) );
  OAI21X1 U19 ( .A(n9), .B(n18), .C(n19), .Y(n36) );
  AOI22X1 U20 ( .A(parallel_in[4]), .B(n12), .C(parallel_out[5]), .D(n13), .Y(
        n19) );
  INVX1 U21 ( .A(parallel_out[4]), .Y(n18) );
  OAI21X1 U22 ( .A(n9), .B(n20), .C(n21), .Y(n35) );
  AOI22X1 U23 ( .A(parallel_in[5]), .B(n12), .C(parallel_out[6]), .D(n13), .Y(
        n21) );
  INVX1 U24 ( .A(parallel_out[5]), .Y(n20) );
  OAI21X1 U25 ( .A(n9), .B(n22), .C(n23), .Y(n34) );
  AOI22X1 U26 ( .A(parallel_in[6]), .B(n12), .C(parallel_out[7]), .D(n13), .Y(
        n23) );
  INVX1 U27 ( .A(parallel_out[6]), .Y(n22) );
  OAI21X1 U28 ( .A(n9), .B(n24), .C(n25), .Y(n33) );
  AOI22X1 U29 ( .A(parallel_in[7]), .B(n12), .C(serial_in), .D(n13), .Y(n25)
         );
  INVX1 U30 ( .A(parallel_out[7]), .Y(n24) );
  OAI21X1 U31 ( .A(n9), .B(n26), .C(n27), .Y(n32) );
  AOI22X1 U32 ( .A(parallel_in[0]), .B(n12), .C(parallel_out[1]), .D(n13), .Y(
        n27) );
  INVX1 U33 ( .A(n28), .Y(n13) );
  NAND3X1 U34 ( .A(n29), .B(n30), .C(n9), .Y(n28) );
  INVX1 U35 ( .A(restart), .Y(n30) );
  NOR2X1 U36 ( .A(n29), .B(restart), .Y(n12) );
  INVX1 U37 ( .A(serial_out), .Y(n26) );
  NAND2X1 U38 ( .A(n31), .B(n29), .Y(n9) );
  INVX1 U39 ( .A(load_enable), .Y(n29) );
  NOR2X1 U40 ( .A(shift_enable), .B(restart), .Y(n31) );
endmodule


module rx_cu ( clk, n_rst, byte_reg, end_packet, error, valid_byte, 
        shift_strobe, buffer_occupancy, start_count, restart, rx_packet_data, 
        rx_transfer_active, rx_error, rx_store_packet_data, rx_data_ready, 
        flush, rx_packet );
  input [7:0] byte_reg;
  input [6:0] buffer_occupancy;
  output [7:0] rx_packet_data;
  output [2:0] rx_packet;
  input clk, n_rst, end_packet, error, valid_byte, shift_strobe;
  output start_count, restart, rx_transfer_active, rx_error,
         rx_store_packet_data, rx_data_ready, flush;
  wire   prev_valid, prev_prev_valid, prev_prev_prev_valid, prev_end_packet,
         N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, N78, N79, N80, N89,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71,
         n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155;
  wire   [4:0] state;
  wire   [1:0] token_byte_cnt;

  DFFSR \token_byte_cnt_reg[0]  ( .D(n155), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(token_byte_cnt[0]) );
  DFFSR \token_byte_cnt_reg[1]  ( .D(N89), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        token_byte_cnt[1]) );
  DFFSR \state_reg[1]  ( .D(N69), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  DFFSR \state_reg[4]  ( .D(N72), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[4])
         );
  DFFSR \state_reg[3]  ( .D(N71), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[0]  ( .D(N68), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[2]  ( .D(N70), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  DFFSR rx_data_ready_reg ( .D(N80), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rx_data_ready) );
  DFFSR prev_end_packet_reg ( .D(N76), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prev_end_packet) );
  DFFSR prev_valid_reg ( .D(N73), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prev_valid) );
  DFFSR prev_prev_valid_reg ( .D(N74), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prev_prev_valid) );
  DFFSR prev_prev_prev_valid_reg ( .D(N75), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prev_prev_prev_valid) );
  DFFSR \rx_packet_reg[2]  ( .D(N79), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_packet[2]) );
  DFFSR \rx_packet_reg[1]  ( .D(N78), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_packet[1]) );
  DFFSR \rx_packet_reg[0]  ( .D(N77), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_packet[0]) );
  INVX2 U18 ( .A(n38), .Y(restart) );
  AND2X1 U19 ( .A(n16), .B(n17), .Y(start_count) );
  OAI21X1 U20 ( .A(n18), .B(n19), .C(n20), .Y(n17) );
  INVX1 U21 ( .A(prev_prev_prev_valid), .Y(n19) );
  NAND3X1 U22 ( .A(n21), .B(n22), .C(n23), .Y(rx_transfer_active) );
  NOR2X1 U23 ( .A(n24), .B(n25), .Y(rx_packet_data[7]) );
  NOR2X1 U24 ( .A(n24), .B(n26), .Y(rx_packet_data[6]) );
  AND2X1 U25 ( .A(rx_store_packet_data), .B(byte_reg[5]), .Y(rx_packet_data[5]) );
  AND2X1 U26 ( .A(rx_store_packet_data), .B(byte_reg[4]), .Y(rx_packet_data[4]) );
  NOR2X1 U27 ( .A(n24), .B(n27), .Y(rx_packet_data[3]) );
  NOR2X1 U28 ( .A(n24), .B(n28), .Y(rx_packet_data[2]) );
  AND2X1 U29 ( .A(rx_store_packet_data), .B(byte_reg[1]), .Y(rx_packet_data[1]) );
  NOR2X1 U30 ( .A(n29), .B(n24), .Y(rx_packet_data[0]) );
  INVX1 U31 ( .A(rx_store_packet_data), .Y(n24) );
  NOR2X1 U32 ( .A(n30), .B(buffer_occupancy[6]), .Y(rx_store_packet_data) );
  NOR2X1 U33 ( .A(n31), .B(n32), .Y(n155) );
  XOR2X1 U34 ( .A(n33), .B(prev_prev_prev_valid), .Y(n31) );
  NOR2X1 U35 ( .A(n34), .B(n32), .Y(N89) );
  XOR2X1 U36 ( .A(n35), .B(token_byte_cnt[1]), .Y(n34) );
  NAND2X1 U37 ( .A(token_byte_cnt[0]), .B(prev_prev_prev_valid), .Y(n35) );
  INVX1 U38 ( .A(n36), .Y(N80) );
  OAI21X1 U39 ( .A(n37), .B(rx_data_ready), .C(n38), .Y(n36) );
  NAND2X1 U40 ( .A(n39), .B(n40), .Y(N79) );
  AOI22X1 U41 ( .A(rx_packet[2]), .B(n41), .C(n42), .D(byte_reg[2]), .Y(n39)
         );
  NAND2X1 U42 ( .A(n43), .B(n40), .Y(N78) );
  AOI22X1 U43 ( .A(rx_packet[1]), .B(n41), .C(n42), .D(byte_reg[1]), .Y(n43)
         );
  NAND2X1 U44 ( .A(n44), .B(n40), .Y(N77) );
  INVX1 U45 ( .A(n45), .Y(n40) );
  OAI21X1 U46 ( .A(n46), .B(n22), .C(n38), .Y(n45) );
  AOI21X1 U47 ( .A(byte_reg[1]), .B(byte_reg[2]), .C(n47), .Y(n46) );
  AOI22X1 U48 ( .A(rx_packet[0]), .B(n41), .C(n42), .D(byte_reg[0]), .Y(n44)
         );
  NAND3X1 U49 ( .A(n48), .B(n23), .C(n49), .Y(n41) );
  NOR2X1 U50 ( .A(n50), .B(n51), .Y(n49) );
  NAND2X1 U51 ( .A(n52), .B(n53), .Y(n51) );
  INVX1 U52 ( .A(n54), .Y(n23) );
  NAND3X1 U53 ( .A(n55), .B(n56), .C(n57), .Y(n54) );
  NOR2X1 U54 ( .A(n58), .B(n59), .Y(n57) );
  NAND2X1 U55 ( .A(n60), .B(n61), .Y(n59) );
  INVX1 U56 ( .A(n62), .Y(n55) );
  NOR2X1 U57 ( .A(restart), .B(n63), .Y(N76) );
  NOR2X1 U58 ( .A(restart), .B(n50), .Y(N75) );
  NOR2X1 U59 ( .A(n64), .B(n65), .Y(N74) );
  NAND2X1 U60 ( .A(shift_strobe), .B(prev_valid), .Y(n65) );
  NAND2X1 U61 ( .A(n38), .B(n50), .Y(n64) );
  NOR2X1 U62 ( .A(restart), .B(n66), .Y(N73) );
  MUX2X1 U63 ( .B(prev_valid), .A(valid_byte), .S(shift_strobe), .Y(n66) );
  NAND2X1 U64 ( .A(n67), .B(n52), .Y(n38) );
  OAI21X1 U65 ( .A(state[2]), .B(n68), .C(n21), .Y(N72) );
  NAND3X1 U66 ( .A(state[0]), .B(state[2]), .C(n67), .Y(n21) );
  NAND3X1 U67 ( .A(n69), .B(n70), .C(n71), .Y(N71) );
  AOI21X1 U68 ( .A(n72), .B(n73), .C(n74), .Y(n71) );
  NAND2X1 U69 ( .A(n56), .B(n75), .Y(n74) );
  INVX1 U70 ( .A(n76), .Y(n73) );
  AND2X1 U71 ( .A(n77), .B(n78), .Y(n72) );
  INVX1 U72 ( .A(n79), .Y(n69) );
  OAI22X1 U73 ( .A(n48), .B(state[4]), .C(n18), .D(n16), .Y(n79) );
  MUX2X1 U74 ( .B(n80), .A(n81), .S(state[3]), .Y(n48) );
  NOR2X1 U75 ( .A(state[2]), .B(state[1]), .Y(n81) );
  NOR2X1 U76 ( .A(n53), .B(n82), .Y(n80) );
  NAND2X1 U77 ( .A(state[0]), .B(state[2]), .Y(n82) );
  NAND3X1 U78 ( .A(n83), .B(n84), .C(n85), .Y(N70) );
  NOR2X1 U79 ( .A(n86), .B(n87), .Y(n85) );
  OAI21X1 U80 ( .A(n63), .B(n76), .C(n88), .Y(n87) );
  OAI21X1 U81 ( .A(n22), .B(n89), .C(n90), .Y(n86) );
  OAI21X1 U82 ( .A(n91), .B(n92), .C(n93), .Y(n90) );
  OAI21X1 U83 ( .A(n61), .B(n94), .C(n76), .Y(n92) );
  NAND2X1 U84 ( .A(state[1]), .B(n63), .Y(n94) );
  NOR2X1 U85 ( .A(n50), .B(n60), .Y(n91) );
  AND2X1 U86 ( .A(n32), .B(n56), .Y(n84) );
  NAND3X1 U87 ( .A(state[2]), .B(n95), .C(n67), .Y(n56) );
  AOI21X1 U88 ( .A(n96), .B(n97), .C(n98), .Y(n83) );
  AOI21X1 U89 ( .A(n60), .B(n76), .C(n77), .Y(n98) );
  OAI21X1 U90 ( .A(n99), .B(n100), .C(n101), .Y(n96) );
  INVX1 U91 ( .A(state[2]), .Y(n100) );
  INVX1 U92 ( .A(n102), .Y(n99) );
  NAND3X1 U93 ( .A(n103), .B(n104), .C(n105), .Y(N69) );
  NOR2X1 U94 ( .A(n106), .B(n107), .Y(n105) );
  OAI21X1 U95 ( .A(n108), .B(n109), .C(n110), .Y(n107) );
  NAND2X1 U96 ( .A(n75), .B(n111), .Y(n106) );
  AOI22X1 U97 ( .A(n112), .B(n113), .C(n114), .D(n115), .Y(n104) );
  NAND3X1 U98 ( .A(prev_prev_valid), .B(n77), .C(n93), .Y(n115) );
  INVX1 U99 ( .A(n116), .Y(n93) );
  INVX1 U100 ( .A(n61), .Y(n113) );
  NOR2X1 U101 ( .A(n78), .B(n53), .Y(n112) );
  NOR2X1 U102 ( .A(n116), .B(end_packet), .Y(n78) );
  NAND3X1 U103 ( .A(n117), .B(n118), .C(n119), .Y(n116) );
  NOR2X1 U104 ( .A(n120), .B(n121), .Y(n119) );
  OR2X1 U105 ( .A(buffer_occupancy[1]), .B(buffer_occupancy[0]), .Y(n121) );
  INVX1 U106 ( .A(buffer_occupancy[6]), .Y(n120) );
  NOR2X1 U107 ( .A(buffer_occupancy[5]), .B(buffer_occupancy[4]), .Y(n118) );
  NOR2X1 U108 ( .A(buffer_occupancy[3]), .B(buffer_occupancy[2]), .Y(n117) );
  NOR2X1 U109 ( .A(n62), .B(n122), .Y(n103) );
  MUX2X1 U110 ( .B(n123), .A(n124), .S(end_packet), .Y(n122) );
  NAND3X1 U111 ( .A(n58), .B(n33), .C(token_byte_cnt[1]), .Y(n124) );
  INVX1 U112 ( .A(token_byte_cnt[0]), .Y(n33) );
  INVX1 U113 ( .A(n32), .Y(n58) );
  NAND3X1 U114 ( .A(n95), .B(n125), .C(n126), .Y(n32) );
  INVX1 U115 ( .A(flush), .Y(n123) );
  NOR2X1 U116 ( .A(n22), .B(n127), .Y(flush) );
  OAI21X1 U117 ( .A(n108), .B(n68), .C(n128), .Y(n62) );
  AND2X1 U118 ( .A(n129), .B(n76), .Y(n128) );
  NAND3X1 U119 ( .A(n52), .B(n125), .C(n130), .Y(n76) );
  NAND3X1 U120 ( .A(n53), .B(n125), .C(state[4]), .Y(n68) );
  INVX1 U121 ( .A(n52), .Y(n108) );
  NAND3X1 U122 ( .A(n131), .B(n132), .C(n133), .Y(N68) );
  NOR2X1 U123 ( .A(n134), .B(n135), .Y(n133) );
  OAI21X1 U124 ( .A(prev_prev_valid), .B(n136), .C(n88), .Y(n135) );
  NOR2X1 U125 ( .A(n137), .B(n138), .Y(n88) );
  OAI21X1 U126 ( .A(n22), .B(n139), .C(n70), .Y(n138) );
  INVX1 U127 ( .A(n140), .Y(n70) );
  OAI21X1 U128 ( .A(prev_prev_prev_valid), .B(n18), .C(n129), .Y(n140) );
  NAND3X1 U129 ( .A(n126), .B(n95), .C(state[3]), .Y(n129) );
  NAND2X1 U130 ( .A(n89), .B(n127), .Y(n139) );
  NAND3X1 U131 ( .A(n28), .B(n27), .C(byte_reg[1]), .Y(n127) );
  OR2X1 U132 ( .A(n47), .B(byte_reg[1]), .Y(n89) );
  OAI21X1 U133 ( .A(n29), .B(n28), .C(n27), .Y(n47) );
  INVX1 U134 ( .A(byte_reg[2]), .Y(n28) );
  INVX1 U135 ( .A(n42), .Y(n22) );
  NOR2X1 U136 ( .A(n50), .B(n136), .Y(n42) );
  INVX1 U137 ( .A(prev_prev_valid), .Y(n50) );
  OAI21X1 U138 ( .A(n136), .B(n63), .C(n141), .Y(n137) );
  NOR2X1 U139 ( .A(rx_error), .B(n37), .Y(n141) );
  INVX1 U140 ( .A(n110), .Y(n37) );
  NAND3X1 U141 ( .A(n130), .B(state[2]), .C(n142), .Y(n110) );
  NOR2X1 U142 ( .A(state[3]), .B(state[0]), .Y(n142) );
  INVX1 U143 ( .A(n111), .Y(rx_error) );
  NAND3X1 U144 ( .A(n126), .B(n125), .C(state[0]), .Y(n111) );
  INVX1 U145 ( .A(end_packet), .Y(n63) );
  NAND3X1 U146 ( .A(n143), .B(n125), .C(n52), .Y(n136) );
  NOR2X1 U147 ( .A(n95), .B(state[2]), .Y(n52) );
  INVX1 U148 ( .A(state[0]), .Y(n95) );
  INVX1 U149 ( .A(state[3]), .Y(n125) );
  OAI21X1 U150 ( .A(n144), .B(n109), .C(n145), .Y(n134) );
  OAI21X1 U151 ( .A(n16), .B(state[0]), .C(n102), .Y(n145) );
  NAND2X1 U152 ( .A(n20), .B(n18), .Y(n102) );
  NAND3X1 U153 ( .A(state[0]), .B(n126), .C(state[3]), .Y(n18) );
  AND2X1 U154 ( .A(state[2]), .B(n143), .Y(n126) );
  INVX1 U155 ( .A(n97), .Y(n16) );
  NAND3X1 U156 ( .A(n26), .B(n25), .C(n146), .Y(n97) );
  NOR2X1 U157 ( .A(n147), .B(n29), .Y(n146) );
  INVX1 U158 ( .A(byte_reg[0]), .Y(n29) );
  INVX1 U159 ( .A(byte_reg[6]), .Y(n26) );
  NAND2X1 U160 ( .A(state[3]), .B(n143), .Y(n109) );
  AND2X1 U161 ( .A(n75), .B(n61), .Y(n132) );
  NAND2X1 U162 ( .A(state[4]), .B(n148), .Y(n61) );
  NAND2X1 U163 ( .A(n67), .B(n149), .Y(n75) );
  AND2X1 U164 ( .A(n130), .B(state[3]), .Y(n67) );
  AND2X1 U165 ( .A(n30), .B(n101), .Y(n131) );
  NAND3X1 U166 ( .A(n150), .B(byte_reg[6]), .C(n151), .Y(n101) );
  NOR2X1 U167 ( .A(n25), .B(n152), .Y(n151) );
  OR2X1 U168 ( .A(n147), .B(byte_reg[0]), .Y(n152) );
  NAND3X1 U169 ( .A(n153), .B(n27), .C(n154), .Y(n147) );
  NOR2X1 U170 ( .A(byte_reg[2]), .B(byte_reg[1]), .Y(n154) );
  INVX1 U171 ( .A(byte_reg[3]), .Y(n27) );
  NOR2X1 U172 ( .A(byte_reg[5]), .B(byte_reg[4]), .Y(n153) );
  INVX1 U173 ( .A(byte_reg[7]), .Y(n25) );
  INVX1 U174 ( .A(n20), .Y(n150) );
  NAND3X1 U175 ( .A(prev_prev_prev_valid), .B(n143), .C(n148), .Y(n20) );
  NOR2X1 U176 ( .A(state[1]), .B(state[4]), .Y(n143) );
  NAND3X1 U177 ( .A(prev_prev_valid), .B(n77), .C(n114), .Y(n30) );
  INVX1 U178 ( .A(n60), .Y(n114) );
  NAND2X1 U179 ( .A(n130), .B(n148), .Y(n60) );
  NOR2X1 U180 ( .A(n144), .B(state[3]), .Y(n148) );
  INVX1 U181 ( .A(n149), .Y(n144) );
  NOR2X1 U182 ( .A(state[0]), .B(state[2]), .Y(n149) );
  NOR2X1 U183 ( .A(n53), .B(state[4]), .Y(n130) );
  INVX1 U184 ( .A(state[1]), .Y(n53) );
  INVX1 U185 ( .A(prev_end_packet), .Y(n77) );
endmodule


module bit_pd_counter_rx ( clk, n_rst, enable, clear, restart, flag, count_out
 );
  output [3:0] count_out;
  input clk, n_rst, enable, clear, restart;
  output flag;
  wire   N10, N11, N12, N13, N14, n67, n68, n1, n2, n3, n4, n5, n6, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49;
  wire   [1:0] cycle_ctr;

  DFFSR \period_cnt_reg[0]  ( .D(N10), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \period_cnt_reg[3]  ( .D(N13), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \period_cnt_reg[1]  ( .D(N11), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \period_cnt_reg[2]  ( .D(N12), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \cycle_ctr_reg[1]  ( .D(n67), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        cycle_ctr[1]) );
  DFFSR \cycle_ctr_reg[0]  ( .D(n68), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        cycle_ctr[0]) );
  DFFSR curr_flag_reg ( .D(N14), .CLK(clk), .R(n_rst), .S(1'b1), .Q(flag) );
  MUX2X1 U10 ( .B(n1), .A(n2), .S(cycle_ctr[0]), .Y(n68) );
  OAI22X1 U11 ( .A(n3), .B(n2), .C(n4), .D(n1), .Y(n67) );
  NAND3X1 U12 ( .A(n5), .B(n6), .C(n14), .Y(n1) );
  NOR2X1 U13 ( .A(restart), .B(cycle_ctr[1]), .Y(n14) );
  INVX1 U14 ( .A(n15), .Y(n5) );
  NAND3X1 U15 ( .A(n6), .B(n16), .C(n15), .Y(n2) );
  NAND2X1 U16 ( .A(enable), .B(n17), .Y(n15) );
  INVX1 U17 ( .A(cycle_ctr[1]), .Y(n3) );
  NOR2X1 U18 ( .A(n18), .B(n19), .Y(N14) );
  OAI21X1 U19 ( .A(n20), .B(n21), .C(n22), .Y(n19) );
  MUX2X1 U20 ( .B(n23), .A(n20), .S(n24), .Y(n22) );
  NAND2X1 U21 ( .A(N13), .B(n25), .Y(n23) );
  INVX1 U22 ( .A(n26), .Y(n21) );
  MUX2X1 U23 ( .B(n26), .A(n27), .S(n24), .Y(n18) );
  NOR2X1 U24 ( .A(n28), .B(n29), .Y(n27) );
  INVX1 U25 ( .A(N10), .Y(n29) );
  AND2X1 U26 ( .A(n28), .B(n16), .Y(N13) );
  INVX1 U27 ( .A(restart), .Y(n16) );
  OAI21X1 U28 ( .A(n30), .B(n31), .C(n32), .Y(n28) );
  NAND2X1 U29 ( .A(n33), .B(n34), .Y(n32) );
  MUX2X1 U30 ( .B(n35), .A(n36), .S(count_out[3]), .Y(n33) );
  NOR2X1 U31 ( .A(n37), .B(n38), .Y(n36) );
  NAND3X1 U32 ( .A(count_out[2]), .B(count_out[0]), .C(count_out[1]), .Y(n35)
         );
  INVX1 U33 ( .A(count_out[3]), .Y(n31) );
  NOR2X1 U34 ( .A(restart), .B(n20), .Y(N12) );
  MUX2X1 U35 ( .B(n39), .A(n40), .S(count_out[2]), .Y(n20) );
  OAI21X1 U36 ( .A(count_out[1]), .B(n41), .C(n30), .Y(n40) );
  INVX1 U37 ( .A(n42), .Y(n30) );
  NOR2X1 U38 ( .A(n41), .B(n43), .Y(n39) );
  NAND2X1 U39 ( .A(count_out[1]), .B(count_out[0]), .Y(n43) );
  NOR2X1 U40 ( .A(restart), .B(n26), .Y(N11) );
  MUX2X1 U41 ( .B(n44), .A(n42), .S(count_out[1]), .Y(n26) );
  OAI22X1 U42 ( .A(enable), .B(clear), .C(count_out[0]), .D(n41), .Y(n42) );
  AND2X1 U43 ( .A(count_out[0]), .B(n34), .Y(n44) );
  NOR2X1 U44 ( .A(n25), .B(restart), .Y(N10) );
  MUX2X1 U45 ( .B(n34), .A(n45), .S(count_out[0]), .Y(n25) );
  NOR2X1 U46 ( .A(enable), .B(clear), .Y(n45) );
  INVX1 U47 ( .A(n41), .Y(n34) );
  NAND3X1 U48 ( .A(n46), .B(n6), .C(enable), .Y(n41) );
  INVX1 U49 ( .A(clear), .Y(n6) );
  INVX1 U50 ( .A(n17), .Y(n46) );
  NOR2X1 U51 ( .A(n47), .B(n48), .Y(n17) );
  OAI21X1 U52 ( .A(count_out[2]), .B(n38), .C(n49), .Y(n48) );
  MUX2X1 U53 ( .B(n24), .A(n38), .S(count_out[0]), .Y(n49) );
  INVX1 U54 ( .A(count_out[1]), .Y(n38) );
  MUX2X1 U55 ( .B(n24), .A(n37), .S(count_out[3]), .Y(n47) );
  INVX1 U56 ( .A(count_out[2]), .Y(n37) );
  NAND2X1 U57 ( .A(cycle_ctr[1]), .B(n4), .Y(n24) );
  INVX1 U58 ( .A(cycle_ctr[0]), .Y(n4) );
endmodule


module flex_counter_rx ( clk, n_rst, clear, count_enable, restart, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable, restart;
  output rollover_flag;
  wire   N5, N6, N7, N8, N9, n1, n2, n3, n4, n5, n6, n7, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47;

  DFFSR \curr_count_reg[0]  ( .D(N5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \curr_count_reg[1]  ( .D(N6), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \curr_count_reg[2]  ( .D(N7), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \curr_count_reg[3]  ( .D(N8), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR rollover_flag_reg ( .D(N9), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  NOR2X1 U8 ( .A(n1), .B(n2), .Y(N9) );
  NAND2X1 U9 ( .A(n3), .B(n4), .Y(n2) );
  XOR2X1 U10 ( .A(n5), .B(n6), .Y(n4) );
  XNOR2X1 U11 ( .A(rollover_val[1]), .B(n7), .Y(n3) );
  NAND3X1 U12 ( .A(n13), .B(n14), .C(n15), .Y(n1) );
  XOR2X1 U13 ( .A(n16), .B(n17), .Y(n15) );
  XOR2X1 U14 ( .A(rollover_val[0]), .B(n18), .Y(n13) );
  AND2X1 U15 ( .A(n14), .B(n17), .Y(N8) );
  OAI21X1 U16 ( .A(n19), .B(n20), .C(n21), .Y(n17) );
  NAND3X1 U17 ( .A(n22), .B(n23), .C(count_out[3]), .Y(n21) );
  AOI22X1 U18 ( .A(count_out[3]), .B(n24), .C(n25), .D(count_out[2]), .Y(n19)
         );
  AND2X1 U19 ( .A(n14), .B(n6), .Y(N7) );
  OAI21X1 U20 ( .A(n26), .B(n27), .C(n28), .Y(n6) );
  NAND3X1 U21 ( .A(n29), .B(n26), .C(n25), .Y(n28) );
  OAI21X1 U22 ( .A(n30), .B(n23), .C(n22), .Y(n27) );
  NOR2X1 U23 ( .A(n25), .B(n31), .Y(n30) );
  AND2X1 U24 ( .A(n32), .B(count_out[1]), .Y(n25) );
  AND2X1 U25 ( .A(n14), .B(n7), .Y(N6) );
  OAI21X1 U26 ( .A(n33), .B(n34), .C(n35), .Y(n7) );
  NAND3X1 U27 ( .A(n29), .B(n33), .C(n32), .Y(n35) );
  INVX1 U28 ( .A(n20), .Y(n29) );
  OAI21X1 U29 ( .A(n36), .B(n23), .C(n22), .Y(n34) );
  NOR2X1 U30 ( .A(n32), .B(n31), .Y(n36) );
  INVX1 U31 ( .A(n24), .Y(n31) );
  INVX1 U32 ( .A(restart), .Y(n14) );
  NOR2X1 U33 ( .A(restart), .B(n18), .Y(N5) );
  INVX1 U34 ( .A(n37), .Y(n18) );
  OAI21X1 U35 ( .A(n32), .B(n20), .C(n38), .Y(n37) );
  NAND3X1 U36 ( .A(n22), .B(n23), .C(count_out[0]), .Y(n38) );
  INVX1 U37 ( .A(count_enable), .Y(n23) );
  NAND2X1 U38 ( .A(count_enable), .B(n22), .Y(n20) );
  INVX1 U39 ( .A(clear), .Y(n22) );
  AND2X1 U40 ( .A(count_out[0]), .B(n24), .Y(n32) );
  OAI22X1 U41 ( .A(n39), .B(n40), .C(count_out[3]), .D(n16), .Y(n24) );
  OAI21X1 U42 ( .A(n41), .B(n26), .C(n42), .Y(n40) );
  OAI21X1 U43 ( .A(count_out[2]), .B(n43), .C(n5), .Y(n42) );
  INVX1 U44 ( .A(rollover_val[2]), .Y(n5) );
  INVX1 U45 ( .A(count_out[2]), .Y(n26) );
  INVX1 U46 ( .A(n43), .Y(n41) );
  OAI21X1 U47 ( .A(n44), .B(n33), .C(n45), .Y(n43) );
  INVX1 U48 ( .A(n46), .Y(n45) );
  AOI21X1 U49 ( .A(n33), .B(n44), .C(rollover_val[1]), .Y(n46) );
  INVX1 U50 ( .A(count_out[1]), .Y(n33) );
  NOR2X1 U51 ( .A(n47), .B(count_out[0]), .Y(n44) );
  INVX1 U52 ( .A(rollover_val[0]), .Y(n47) );
  AND2X1 U53 ( .A(n16), .B(count_out[3]), .Y(n39) );
  INVX1 U54 ( .A(rollover_val[3]), .Y(n16) );
endmodule


module rx_timer ( clk, n_rst, timer_en, timer_clr, restart, byte_done, 
        shift_strobe, bit_done, pd_count, bit_count );
  output [3:0] pd_count;
  output [3:0] bit_count;
  input clk, n_rst, timer_en, timer_clr, restart;
  output byte_done, shift_strobe, bit_done;
  wire   shift_strobe;
  assign bit_done = shift_strobe;

  bit_pd_counter_rx pd ( .clk(clk), .n_rst(n_rst), .enable(timer_en), .clear(
        timer_clr), .restart(restart), .flag(shift_strobe), .count_out(
        pd_count) );
  flex_counter_rx count ( .clk(clk), .n_rst(n_rst), .clear(timer_clr), 
        .count_enable(shift_strobe), .restart(restart), .rollover_val({1'b1, 
        1'b0, 1'b0, 1'b0}), .count_out(bit_count), .rollover_flag(byte_done)
         );
endmodule


module usb_rx ( clk, n_rst, dp_in, dm_in, buffer_occupancy, flush, 
        rx_data_ready, rx_transfer_active, rx_error, rx_store_packet_data, 
        rx_packet_data, rx_packet );
  input [6:0] buffer_occupancy;
  output [7:0] rx_packet_data;
  output [2:0] rx_packet;
  input clk, n_rst, dp_in, dm_in;
  output flush, rx_data_ready, rx_transfer_active, rx_error,
         rx_store_packet_data;
  wire   restart, shift_enable, d_orig, error, end_packet, valid_byte,
         start_count, temp, n11, n12;
  wire   [7:0] input_data;
  wire   [7:0] byte_reg;

  DFFSR \byte_reg_reg[0]  ( .D(input_data[0]), .CLK(clk), .R(n12), .S(1'b1), 
        .Q(byte_reg[0]) );
  DFFSR \byte_reg_reg[1]  ( .D(input_data[1]), .CLK(clk), .R(n12), .S(1'b1), 
        .Q(byte_reg[1]) );
  DFFSR \byte_reg_reg[2]  ( .D(input_data[2]), .CLK(clk), .R(n12), .S(1'b1), 
        .Q(byte_reg[2]) );
  DFFSR \byte_reg_reg[3]  ( .D(input_data[3]), .CLK(clk), .R(n12), .S(1'b1), 
        .Q(byte_reg[3]) );
  DFFSR \byte_reg_reg[4]  ( .D(input_data[4]), .CLK(clk), .R(n12), .S(1'b1), 
        .Q(byte_reg[4]) );
  DFFSR \byte_reg_reg[5]  ( .D(input_data[5]), .CLK(clk), .R(n12), .S(1'b1), 
        .Q(byte_reg[5]) );
  DFFSR \byte_reg_reg[6]  ( .D(input_data[6]), .CLK(clk), .R(n12), .S(1'b1), 
        .Q(byte_reg[6]) );
  DFFSR \byte_reg_reg[7]  ( .D(input_data[7]), .CLK(clk), .R(n12), .S(1'b1), 
        .Q(byte_reg[7]) );
  decoder nrzi ( .clk(clk), .n_rst(n_rst), .dp_in(dp_in), .dm_in(dm_in), 
        .sample_en(shift_enable), .restart(restart), .d_orig(d_orig), .error(
        error), .end_packet(end_packet) );
  flex_sr_rx_MSB_FIRST0 bit_shift ( .clk(clk), .n_rst(n_rst), .shift_enable(
        shift_enable), .load_enable(1'b0), .serial_in(d_orig), .restart(
        restart), .parallel_in({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .parallel_out(input_data) );
  rx_cu rcu ( .clk(clk), .n_rst(n_rst), .byte_reg(byte_reg), .end_packet(
        end_packet), .error(error), .valid_byte(valid_byte), .shift_strobe(
        shift_enable), .buffer_occupancy(buffer_occupancy), .start_count(
        start_count), .restart(restart), .rx_packet_data(rx_packet_data), 
        .rx_transfer_active(rx_transfer_active), .rx_error(rx_error), 
        .rx_store_packet_data(rx_store_packet_data), .rx_data_ready(
        rx_data_ready), .flush(flush), .rx_packet(rx_packet) );
  rx_timer timer ( .clk(clk), .n_rst(n_rst), .timer_en(1'b1), .timer_clr(temp), 
        .restart(restart), .byte_done(valid_byte), .shift_strobe(shift_enable)
         );
  OR2X1 U15 ( .A(error), .B(start_count), .Y(temp) );
  NOR2X1 U16 ( .A(restart), .B(n11), .Y(n12) );
  INVX1 U17 ( .A(n_rst), .Y(n11) );
endmodule


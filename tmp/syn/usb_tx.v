/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP4
// Date      : Tue Apr 29 23:45:29 2025
/////////////////////////////////////////////////////////////


module txcu ( clk, n_rst, tx_packet_data, buffer_occupancy, tx_packet, 
        byte_done, bit_done, pd_count, bit_count, data_to_send, timer_en, 
        timer_clr, load_en, send_eop, tx_transfer_active, get_tx_packet_data, 
        tx_error, curr_state );
  input [7:0] tx_packet_data;
  input [6:0] buffer_occupancy;
  input [2:0] tx_packet;
  input [3:0] pd_count;
  input [3:0] bit_count;
  output [7:0] data_to_send;
  output [4:0] curr_state;
  input clk, n_rst, byte_done, bit_done;
  output timer_en, timer_clr, load_en, send_eop, tx_transfer_active,
         get_tx_packet_data, tx_error;
  wire   next_tx_transfer_active, n54, n77, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131;
  assign curr_state[4] = 1'b0;

  DFFSR \state_reg[0]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_state[0]) );
  DFFSR \state_reg[3]  ( .D(n130), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_state[3]) );
  DFFSR \state_reg[2]  ( .D(n131), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_state[2]) );
  DFFSR \state_reg[1]  ( .D(n77), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        curr_state[1]) );
  DFFSR temp_tx_transfer_active_reg ( .D(next_tx_transfer_active), .CLK(clk), 
        .R(n_rst), .S(1'b1), .Q(tx_transfer_active) );
  AND2X1 U8 ( .A(n6), .B(n7), .Y(timer_clr) );
  NAND2X1 U10 ( .A(n8), .B(n9), .Y(next_tx_transfer_active) );
  INVX1 U11 ( .A(n77), .Y(n9) );
  MUX2X1 U12 ( .B(n131), .A(n10), .S(n130), .Y(n8) );
  NAND2X1 U13 ( .A(n131), .B(n11), .Y(n10) );
  INVX1 U14 ( .A(n54), .Y(n11) );
  NAND3X1 U15 ( .A(n12), .B(n13), .C(n14), .Y(n130) );
  AOI21X1 U16 ( .A(n15), .B(n16), .C(n17), .Y(n14) );
  OAI21X1 U17 ( .A(n18), .B(n19), .C(n20), .Y(n17) );
  OAI21X1 U18 ( .A(n21), .B(n22), .C(n23), .Y(n20) );
  INVX1 U19 ( .A(n24), .Y(n15) );
  AND2X1 U20 ( .A(n25), .B(n26), .Y(n12) );
  NAND3X1 U21 ( .A(n27), .B(n18), .C(n28), .Y(n131) );
  NOR2X1 U22 ( .A(n29), .B(n30), .Y(n28) );
  OAI21X1 U23 ( .A(n31), .B(n32), .C(n33), .Y(n30) );
  NAND2X1 U24 ( .A(curr_state[0]), .B(n34), .Y(n32) );
  NAND2X1 U25 ( .A(n35), .B(n36), .Y(n29) );
  INVX1 U26 ( .A(n37), .Y(n18) );
  OAI21X1 U27 ( .A(n38), .B(n39), .C(n40), .Y(n37) );
  OAI21X1 U28 ( .A(n41), .B(n42), .C(curr_state[2]), .Y(n39) );
  NAND2X1 U29 ( .A(tx_packet[0]), .B(tx_packet[1]), .Y(n42) );
  AOI22X1 U30 ( .A(n16), .B(n24), .C(bit_done), .D(n43), .Y(n27) );
  NAND2X1 U31 ( .A(byte_done), .B(n22), .Y(n24) );
  OR2X1 U32 ( .A(n44), .B(n45), .Y(timer_en) );
  NAND3X1 U33 ( .A(n46), .B(n13), .C(n47), .Y(n45) );
  NAND3X1 U34 ( .A(n48), .B(n25), .C(n33), .Y(n44) );
  INVX1 U35 ( .A(send_eop), .Y(n25) );
  INVX1 U36 ( .A(n34), .Y(n48) );
  NAND3X1 U37 ( .A(n49), .B(n50), .C(n51), .Y(n77) );
  NOR2X1 U38 ( .A(n52), .B(n53), .Y(n51) );
  OAI22X1 U39 ( .A(n55), .B(n40), .C(n13), .D(n56), .Y(n53) );
  AND2X1 U40 ( .A(n36), .B(n57), .Y(n50) );
  NAND3X1 U41 ( .A(n23), .B(n58), .C(n59), .Y(n36) );
  AOI22X1 U42 ( .A(n60), .B(n16), .C(n61), .D(n62), .Y(n49) );
  OAI21X1 U43 ( .A(curr_state[0]), .B(n63), .C(n64), .Y(n61) );
  NOR2X1 U44 ( .A(n22), .B(n65), .Y(n60) );
  NAND3X1 U45 ( .A(n66), .B(n67), .C(n68), .Y(n54) );
  NOR2X1 U46 ( .A(n69), .B(n70), .Y(n68) );
  OAI21X1 U47 ( .A(n62), .B(n64), .C(n71), .Y(n70) );
  OAI21X1 U48 ( .A(n22), .B(n65), .C(n16), .Y(n71) );
  INVX1 U49 ( .A(n72), .Y(n16) );
  INVX1 U50 ( .A(n59), .Y(n22) );
  NOR2X1 U51 ( .A(n73), .B(n74), .Y(n59) );
  NAND3X1 U52 ( .A(pd_count[2]), .B(bit_count[3]), .C(n75), .Y(n74) );
  NOR2X1 U53 ( .A(bit_count[1]), .B(bit_count[0]), .Y(n75) );
  NAND2X1 U54 ( .A(n76), .B(n78), .Y(n73) );
  NOR2X1 U55 ( .A(pd_count[3]), .B(pd_count[1]), .Y(n78) );
  NOR2X1 U56 ( .A(pd_count[0]), .B(bit_count[2]), .Y(n76) );
  INVX1 U57 ( .A(tx_error), .Y(n64) );
  NOR2X1 U58 ( .A(n79), .B(n63), .Y(tx_error) );
  OAI21X1 U59 ( .A(n21), .B(n65), .C(n80), .Y(n62) );
  OAI21X1 U60 ( .A(n81), .B(n82), .C(tx_packet[2]), .Y(n80) );
  INVX1 U61 ( .A(n58), .Y(n21) );
  OAI21X1 U62 ( .A(n83), .B(n58), .C(n35), .Y(n69) );
  NAND3X1 U63 ( .A(n84), .B(n85), .C(n86), .Y(n58) );
  NOR2X1 U64 ( .A(buffer_occupancy[0]), .B(n87), .Y(n86) );
  OR2X1 U65 ( .A(buffer_occupancy[2]), .B(buffer_occupancy[1]), .Y(n87) );
  NOR2X1 U66 ( .A(buffer_occupancy[6]), .B(buffer_occupancy[5]), .Y(n85) );
  NOR2X1 U67 ( .A(buffer_occupancy[4]), .B(buffer_occupancy[3]), .Y(n84) );
  AOI22X1 U68 ( .A(n88), .B(n89), .C(byte_done), .D(n23), .Y(n83) );
  INVX1 U69 ( .A(n90), .Y(n23) );
  NOR2X1 U70 ( .A(curr_state[3]), .B(n38), .Y(n88) );
  INVX1 U71 ( .A(n91), .Y(n67) );
  MUX2X1 U72 ( .B(n13), .A(n57), .S(bit_done), .Y(n91) );
  NAND2X1 U73 ( .A(n92), .B(n93), .Y(n13) );
  AOI21X1 U74 ( .A(n94), .B(curr_state[0]), .C(n52), .Y(n66) );
  NAND3X1 U75 ( .A(n33), .B(n95), .C(n96), .Y(n52) );
  AOI22X1 U76 ( .A(n34), .B(n31), .C(n43), .D(n56), .Y(n96) );
  INVX1 U77 ( .A(bit_done), .Y(n56) );
  INVX1 U78 ( .A(n97), .Y(n43) );
  INVX1 U79 ( .A(byte_done), .Y(n31) );
  NAND3X1 U80 ( .A(n95), .B(n26), .C(n35), .Y(load_en) );
  NAND2X1 U81 ( .A(n34), .B(n98), .Y(n95) );
  NOR2X1 U82 ( .A(n63), .B(n55), .Y(n34) );
  NAND2X1 U83 ( .A(n99), .B(n100), .Y(data_to_send[7]) );
  AOI21X1 U84 ( .A(n101), .B(n82), .C(n102), .Y(n100) );
  AOI21X1 U85 ( .A(tx_packet_data[7]), .B(n103), .C(n104), .Y(n99) );
  NAND3X1 U86 ( .A(n105), .B(n106), .C(n107), .Y(data_to_send[6]) );
  AOI21X1 U87 ( .A(tx_packet_data[6]), .B(n103), .C(n108), .Y(n107) );
  OAI21X1 U88 ( .A(n47), .B(n109), .C(n110), .Y(data_to_send[5]) );
  INVX1 U89 ( .A(tx_packet_data[5]), .Y(n109) );
  INVX1 U90 ( .A(n103), .Y(n47) );
  NAND2X1 U91 ( .A(n111), .B(n110), .Y(data_to_send[4]) );
  AOI22X1 U92 ( .A(n65), .B(n112), .C(tx_packet_data[4]), .D(n103), .Y(n111)
         );
  NAND2X1 U93 ( .A(n113), .B(n114), .Y(data_to_send[3]) );
  AOI21X1 U94 ( .A(n101), .B(tx_packet[0]), .C(n115), .Y(n114) );
  INVX1 U95 ( .A(n105), .Y(n101) );
  AOI21X1 U96 ( .A(tx_packet_data[3]), .B(n103), .C(n108), .Y(n113) );
  NAND2X1 U97 ( .A(n116), .B(n110), .Y(data_to_send[2]) );
  AOI21X1 U98 ( .A(tx_packet_data[2]), .B(n103), .C(n115), .Y(n116) );
  INVX1 U99 ( .A(n117), .Y(n115) );
  NAND3X1 U100 ( .A(tx_packet[1]), .B(n112), .C(tx_packet[2]), .Y(n117) );
  NAND2X1 U101 ( .A(n118), .B(n46), .Y(data_to_send[1]) );
  INVX1 U102 ( .A(n112), .Y(n46) );
  AOI21X1 U103 ( .A(tx_packet_data[1]), .B(n103), .C(n94), .Y(n118) );
  NAND3X1 U104 ( .A(n119), .B(n120), .C(n121), .Y(data_to_send[0]) );
  NOR2X1 U105 ( .A(n6), .B(n122), .Y(n121) );
  OAI21X1 U106 ( .A(curr_state[2]), .B(n79), .C(n123), .Y(n122) );
  INVX1 U107 ( .A(n108), .Y(n123) );
  OAI21X1 U108 ( .A(n35), .B(n124), .C(n110), .Y(n108) );
  INVX1 U109 ( .A(n104), .Y(n110) );
  OAI21X1 U110 ( .A(tx_packet[2]), .B(n105), .C(n125), .Y(n104) );
  AOI21X1 U111 ( .A(n126), .B(tx_packet[0]), .C(n94), .Y(n125) );
  INVX1 U112 ( .A(n40), .Y(n94) );
  NAND3X1 U113 ( .A(curr_state[2]), .B(n38), .C(curr_state[3]), .Y(n40) );
  AND2X1 U114 ( .A(tx_packet[1]), .B(n127), .Y(n126) );
  OAI21X1 U115 ( .A(n41), .B(n35), .C(n72), .Y(n127) );
  NAND2X1 U116 ( .A(n112), .B(n81), .Y(n105) );
  INVX1 U117 ( .A(tx_packet[1]), .Y(n81) );
  NAND2X1 U118 ( .A(tx_packet[0]), .B(n89), .Y(n124) );
  OAI21X1 U119 ( .A(n128), .B(n19), .C(n63), .Y(n6) );
  NAND2X1 U120 ( .A(n19), .B(n128), .Y(n63) );
  NOR2X1 U121 ( .A(send_eop), .B(n102), .Y(n120) );
  INVX1 U122 ( .A(n106), .Y(n102) );
  NAND3X1 U123 ( .A(n112), .B(n82), .C(n89), .Y(n106) );
  INVX1 U124 ( .A(n65), .Y(n89) );
  NAND2X1 U125 ( .A(tx_packet[1]), .B(n41), .Y(n65) );
  INVX1 U126 ( .A(tx_packet[2]), .Y(n41) );
  INVX1 U127 ( .A(tx_packet[0]), .Y(n82) );
  NAND2X1 U128 ( .A(n35), .B(n72), .Y(n112) );
  NAND2X1 U129 ( .A(n92), .B(n129), .Y(n72) );
  INVX1 U130 ( .A(n79), .Y(n92) );
  NAND2X1 U131 ( .A(curr_state[0]), .B(n55), .Y(n79) );
  NAND2X1 U132 ( .A(n129), .B(n7), .Y(n35) );
  NAND2X1 U133 ( .A(n57), .B(n97), .Y(send_eop) );
  NAND3X1 U134 ( .A(curr_state[1]), .B(n93), .C(curr_state[0]), .Y(n97) );
  NAND3X1 U135 ( .A(n93), .B(n98), .C(curr_state[1]), .Y(n57) );
  AOI21X1 U136 ( .A(tx_packet_data[0]), .B(n103), .C(get_tx_packet_data), .Y(
        n119) );
  INVX1 U137 ( .A(n33), .Y(get_tx_packet_data) );
  NAND3X1 U138 ( .A(curr_state[1]), .B(n98), .C(n129), .Y(n33) );
  NAND2X1 U139 ( .A(n90), .B(n26), .Y(n103) );
  NAND3X1 U140 ( .A(n129), .B(curr_state[1]), .C(curr_state[0]), .Y(n26) );
  NOR2X1 U141 ( .A(n128), .B(curr_state[3]), .Y(n129) );
  INVX1 U142 ( .A(curr_state[2]), .Y(n128) );
  NAND2X1 U143 ( .A(n93), .B(n7), .Y(n90) );
  INVX1 U144 ( .A(n38), .Y(n7) );
  NAND2X1 U145 ( .A(n55), .B(n98), .Y(n38) );
  INVX1 U146 ( .A(curr_state[0]), .Y(n98) );
  INVX1 U147 ( .A(curr_state[1]), .Y(n55) );
  NOR2X1 U148 ( .A(n19), .B(curr_state[2]), .Y(n93) );
  INVX1 U149 ( .A(curr_state[3]), .Y(n19) );
endmodule


module bit_pd_counter ( clk, n_rst, enable, clear, flag, count_out );
  output [3:0] count_out;
  input clk, n_rst, enable, clear;
  output flag;
  wire   next_flag, n53, n54, n1, n2, n3, n4, n5, n6, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41;
  wire   [1:0] cycle_ctr;
  wire   [3:0] next_period_cnt;

  DFFSR \period_cnt_reg[0]  ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR \period_cnt_reg[3]  ( .D(next_period_cnt[3]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(count_out[3]) );
  DFFSR \period_cnt_reg[1]  ( .D(next_period_cnt[1]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(count_out[1]) );
  DFFSR \period_cnt_reg[2]  ( .D(next_period_cnt[2]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(count_out[2]) );
  DFFSR \cycle_ctr_reg[0]  ( .D(n54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        cycle_ctr[0]) );
  DFFSR \cycle_ctr_reg[1]  ( .D(n53), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        cycle_ctr[1]) );
  DFFSR curr_flag_reg ( .D(next_flag), .CLK(clk), .R(n_rst), .S(1'b1), .Q(flag) );
  INVX1 U10 ( .A(n1), .Y(next_period_cnt[3]) );
  NOR2X1 U11 ( .A(n2), .B(n3), .Y(next_flag) );
  OAI21X1 U12 ( .A(n4), .B(n5), .C(n6), .Y(n3) );
  MUX2X1 U13 ( .B(n5), .A(n4), .S(next_period_cnt[1]), .Y(n6) );
  INVX1 U14 ( .A(n14), .Y(next_period_cnt[1]) );
  MUX2X1 U15 ( .B(n15), .A(n16), .S(count_out[1]), .Y(n14) );
  NOR2X1 U16 ( .A(n17), .B(n18), .Y(n15) );
  INVX1 U17 ( .A(count_out[0]), .Y(n17) );
  INVX1 U18 ( .A(next_period_cnt[2]), .Y(n4) );
  MUX2X1 U19 ( .B(n19), .A(n20), .S(count_out[2]), .Y(next_period_cnt[2]) );
  MUX2X1 U20 ( .B(n21), .A(n22), .S(n5), .Y(n2) );
  AND2X1 U21 ( .A(n1), .B(n41), .Y(n22) );
  NOR2X1 U22 ( .A(n1), .B(n41), .Y(n21) );
  MUX2X1 U23 ( .B(n23), .A(n24), .S(count_out[3]), .Y(n1) );
  OAI21X1 U24 ( .A(count_out[2]), .B(n18), .C(n20), .Y(n24) );
  AOI21X1 U25 ( .A(n25), .B(n26), .C(n16), .Y(n20) );
  OAI21X1 U26 ( .A(count_out[0]), .B(n18), .C(n27), .Y(n16) );
  NOR2X1 U27 ( .A(n28), .B(n19), .Y(n23) );
  NAND3X1 U28 ( .A(count_out[1]), .B(count_out[0]), .C(n26), .Y(n19) );
  INVX1 U29 ( .A(n18), .Y(n26) );
  MUX2X1 U30 ( .B(n18), .A(n27), .S(count_out[0]), .Y(n41) );
  NAND3X1 U31 ( .A(n29), .B(n30), .C(enable), .Y(n18) );
  INVX1 U32 ( .A(clear), .Y(n30) );
  INVX1 U33 ( .A(n31), .Y(n29) );
  MUX2X1 U34 ( .B(n32), .A(n33), .S(cycle_ctr[0]), .Y(n54) );
  OAI22X1 U35 ( .A(n33), .B(n34), .C(n35), .D(n32), .Y(n53) );
  NAND3X1 U36 ( .A(n31), .B(n27), .C(n36), .Y(n32) );
  NOR2X1 U37 ( .A(cycle_ctr[1]), .B(clear), .Y(n36) );
  INVX1 U38 ( .A(cycle_ctr[1]), .Y(n34) );
  INVX1 U39 ( .A(n37), .Y(n33) );
  OAI21X1 U40 ( .A(clear), .B(n31), .C(n27), .Y(n37) );
  OR2X1 U41 ( .A(clear), .B(enable), .Y(n27) );
  NOR2X1 U42 ( .A(n38), .B(n39), .Y(n31) );
  OAI21X1 U43 ( .A(count_out[2]), .B(n25), .C(n40), .Y(n39) );
  MUX2X1 U44 ( .B(n5), .A(n25), .S(count_out[0]), .Y(n40) );
  INVX1 U45 ( .A(count_out[1]), .Y(n25) );
  MUX2X1 U46 ( .B(n5), .A(n28), .S(count_out[3]), .Y(n38) );
  INVX1 U47 ( .A(count_out[2]), .Y(n28) );
  NAND2X1 U48 ( .A(cycle_ctr[1]), .B(n35), .Y(n5) );
  INVX1 U49 ( .A(cycle_ctr[0]), .Y(n35) );
endmodule


module flex_counter_SIZE4 ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   next_rollover_flag, n1, n2, n3, n4, n5, n6, n7, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42;
  wire   [3:0] next_count;

  DFFSR \curr_count_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(count_out[0]) );
  DFFSR \curr_count_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(count_out[1]) );
  DFFSR \curr_count_reg[2]  ( .D(next_count[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(count_out[2]) );
  DFFSR \curr_count_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(count_out[3]) );
  DFFSR rollover_flag_reg ( .D(next_rollover_flag), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(rollover_flag) );
  NOR2X1 U8 ( .A(n1), .B(n2), .Y(next_rollover_flag) );
  NAND2X1 U9 ( .A(n3), .B(n4), .Y(n2) );
  XOR2X1 U10 ( .A(n5), .B(next_count[1]), .Y(n4) );
  XOR2X1 U11 ( .A(n6), .B(next_count[2]), .Y(n3) );
  NAND2X1 U12 ( .A(n7), .B(n13), .Y(n1) );
  XNOR2X1 U13 ( .A(rollover_val[0]), .B(next_count[0]), .Y(n13) );
  XOR2X1 U14 ( .A(n14), .B(next_count[3]), .Y(n7) );
  OAI21X1 U15 ( .A(n15), .B(n16), .C(n17), .Y(next_count[3]) );
  NAND3X1 U16 ( .A(n18), .B(n19), .C(count_out[3]), .Y(n17) );
  AOI22X1 U17 ( .A(count_out[3]), .B(n20), .C(n21), .D(count_out[2]), .Y(n15)
         );
  OAI21X1 U18 ( .A(n22), .B(n23), .C(n24), .Y(next_count[2]) );
  NAND3X1 U19 ( .A(n25), .B(n22), .C(n21), .Y(n24) );
  OAI21X1 U20 ( .A(n26), .B(n19), .C(n18), .Y(n23) );
  NOR2X1 U21 ( .A(n21), .B(n27), .Y(n26) );
  AND2X1 U22 ( .A(n28), .B(count_out[1]), .Y(n21) );
  OAI21X1 U23 ( .A(n29), .B(n30), .C(n31), .Y(next_count[1]) );
  NAND3X1 U24 ( .A(n25), .B(n29), .C(n28), .Y(n31) );
  INVX1 U25 ( .A(n16), .Y(n25) );
  OAI21X1 U26 ( .A(n32), .B(n19), .C(n18), .Y(n30) );
  NOR2X1 U27 ( .A(n28), .B(n27), .Y(n32) );
  OAI21X1 U28 ( .A(n28), .B(n16), .C(n33), .Y(next_count[0]) );
  NAND3X1 U29 ( .A(n18), .B(n19), .C(count_out[0]), .Y(n33) );
  INVX1 U30 ( .A(count_enable), .Y(n19) );
  NAND2X1 U31 ( .A(count_enable), .B(n18), .Y(n16) );
  INVX1 U32 ( .A(clear), .Y(n18) );
  NOR2X1 U33 ( .A(n34), .B(n27), .Y(n28) );
  INVX1 U34 ( .A(n20), .Y(n27) );
  OAI22X1 U35 ( .A(n35), .B(n36), .C(count_out[3]), .D(n14), .Y(n20) );
  OAI21X1 U36 ( .A(n37), .B(n22), .C(n38), .Y(n36) );
  OAI21X1 U37 ( .A(count_out[2]), .B(n39), .C(n6), .Y(n38) );
  INVX1 U38 ( .A(rollover_val[2]), .Y(n6) );
  INVX1 U39 ( .A(count_out[2]), .Y(n22) );
  INVX1 U40 ( .A(n39), .Y(n37) );
  OAI21X1 U41 ( .A(n40), .B(n29), .C(n41), .Y(n39) );
  OAI21X1 U42 ( .A(count_out[1]), .B(n42), .C(n5), .Y(n41) );
  INVX1 U43 ( .A(rollover_val[1]), .Y(n5) );
  INVX1 U44 ( .A(count_out[1]), .Y(n29) );
  INVX1 U45 ( .A(n42), .Y(n40) );
  NAND2X1 U46 ( .A(rollover_val[0]), .B(n34), .Y(n42) );
  AND2X1 U47 ( .A(n14), .B(count_out[3]), .Y(n35) );
  INVX1 U48 ( .A(rollover_val[3]), .Y(n14) );
  INVX1 U49 ( .A(count_out[0]), .Y(n34) );
endmodule


module tx_timer ( clk, n_rst, timer_en, timer_clr, byte_done, bit_done, 
        shift_strobe, pd_count, bit_count );
  output [3:0] pd_count;
  output [3:0] bit_count;
  input clk, n_rst, timer_en, timer_clr;
  output byte_done, bit_done, shift_strobe;
  wire   bit_done, flag2, n1, n2, n3;
  assign shift_strobe = bit_done;

  bit_pd_counter bit_pd ( .clk(clk), .n_rst(n_rst), .enable(timer_en), .clear(
        timer_clr), .flag(bit_done), .count_out(pd_count) );
  flex_counter_SIZE4 bit_counter ( .clk(clk), .n_rst(n_rst), .clear(timer_clr), 
        .count_enable(bit_done), .rollover_val({1'b1, 1'b0, 1'b0, 1'b0}), 
        .count_out(bit_count), .rollover_flag(flag2) );
  NOR2X1 U3 ( .A(n1), .B(n2), .Y(byte_done) );
  NAND2X1 U4 ( .A(pd_count[2]), .B(pd_count[1]), .Y(n2) );
  NAND2X1 U5 ( .A(n3), .B(flag2), .Y(n1) );
  NOR2X1 U6 ( .A(pd_count[3]), .B(pd_count[0]), .Y(n3) );
endmodule


module flex_sr_SIZE8_MSB_FIRST0 ( clk, n_rst, shift_enable, load_enable, 
        serial_in, parallel_in, serial_out, parallel_out );
  input [7:0] parallel_in;
  output [7:0] parallel_out;
  input clk, n_rst, shift_enable, load_enable, serial_in;
  output serial_out;
  wire   serial_out, n28, n29, n30, n31, n32, n33, n34, n35, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27;
  assign parallel_out[0] = serial_out;

  DFFSR \sr_temp_reg[7]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \sr_temp_reg[6]  ( .D(n30), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \sr_temp_reg[5]  ( .D(n31), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \sr_temp_reg[4]  ( .D(n32), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \sr_temp_reg[3]  ( .D(n33), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \sr_temp_reg[2]  ( .D(n34), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \sr_temp_reg[1]  ( .D(n35), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \sr_temp_reg[0]  ( .D(n28), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        serial_out) );
  OAI21X1 U10 ( .A(n9), .B(n10), .C(n11), .Y(n35) );
  AOI22X1 U11 ( .A(parallel_out[2]), .B(n12), .C(parallel_out[1]), .D(n13), 
        .Y(n11) );
  INVX1 U12 ( .A(parallel_in[1]), .Y(n10) );
  OAI21X1 U13 ( .A(n9), .B(n14), .C(n15), .Y(n34) );
  AOI22X1 U14 ( .A(parallel_out[3]), .B(n12), .C(n13), .D(parallel_out[2]), 
        .Y(n15) );
  INVX1 U15 ( .A(parallel_in[2]), .Y(n14) );
  OAI21X1 U16 ( .A(n9), .B(n16), .C(n17), .Y(n33) );
  AOI22X1 U17 ( .A(parallel_out[4]), .B(n12), .C(parallel_out[3]), .D(n13), 
        .Y(n17) );
  INVX1 U18 ( .A(parallel_in[3]), .Y(n16) );
  OAI21X1 U19 ( .A(n9), .B(n18), .C(n19), .Y(n32) );
  AOI22X1 U20 ( .A(parallel_out[5]), .B(n12), .C(parallel_out[4]), .D(n13), 
        .Y(n19) );
  INVX1 U21 ( .A(parallel_in[4]), .Y(n18) );
  OAI21X1 U22 ( .A(n9), .B(n20), .C(n21), .Y(n31) );
  AOI22X1 U23 ( .A(parallel_out[6]), .B(n12), .C(parallel_out[5]), .D(n13), 
        .Y(n21) );
  INVX1 U24 ( .A(parallel_in[5]), .Y(n20) );
  OAI21X1 U25 ( .A(n9), .B(n22), .C(n23), .Y(n30) );
  AOI22X1 U26 ( .A(parallel_out[7]), .B(n12), .C(parallel_out[6]), .D(n13), 
        .Y(n23) );
  INVX1 U27 ( .A(parallel_in[6]), .Y(n22) );
  OAI21X1 U28 ( .A(n9), .B(n24), .C(n25), .Y(n29) );
  AOI22X1 U29 ( .A(serial_in), .B(n12), .C(parallel_out[7]), .D(n13), .Y(n25)
         );
  INVX1 U30 ( .A(parallel_in[7]), .Y(n24) );
  OAI21X1 U31 ( .A(n9), .B(n26), .C(n27), .Y(n28) );
  AOI22X1 U32 ( .A(parallel_out[1]), .B(n12), .C(serial_out), .D(n13), .Y(n27)
         );
  NOR2X1 U33 ( .A(n13), .B(load_enable), .Y(n12) );
  NOR2X1 U34 ( .A(shift_enable), .B(load_enable), .Y(n13) );
  INVX1 U35 ( .A(parallel_in[0]), .Y(n26) );
  INVX1 U36 ( .A(load_enable), .Y(n9) );
endmodule


module encoder ( clk, n_rst, serial_in, shift_strobe, send_eop, curr_state, 
        dp_out, dm_out );
  input [4:0] curr_state;
  input clk, n_rst, serial_in, shift_strobe, send_eop;
  output dp_out, dm_out;
  wire   n14, n15, n3, n4, n5, n6, n7, n8, n9, n10;

  DFFSR d_inv_reg ( .D(n15), .CLK(clk), .R(n_rst), .S(1'b1), .Q(dm_out) );
  DFFSR d_out_reg ( .D(n14), .CLK(clk), .R(1'b1), .S(n_rst), .Q(dp_out) );
  MUX2X1 U4 ( .B(n3), .A(n4), .S(dm_out), .Y(n15) );
  MUX2X1 U5 ( .B(n3), .A(n4), .S(dp_out), .Y(n14) );
  NAND2X1 U6 ( .A(n4), .B(n5), .Y(n3) );
  OAI21X1 U7 ( .A(n6), .B(n7), .C(n5), .Y(n4) );
  OR2X1 U8 ( .A(n8), .B(n9), .Y(n5) );
  NAND2X1 U9 ( .A(curr_state[3]), .B(shift_strobe), .Y(n9) );
  OAI21X1 U10 ( .A(curr_state[1]), .B(curr_state[0]), .C(n10), .Y(n8) );
  NOR2X1 U11 ( .A(curr_state[4]), .B(curr_state[2]), .Y(n10) );
  OR2X1 U12 ( .A(serial_in), .B(send_eop), .Y(n7) );
  INVX1 U13 ( .A(shift_strobe), .Y(n6) );
endmodule


module usb_tx ( clk, n_rst, tx_packet_data, buffer_occupancy, tx_packet, 
        dp_out, dm_out, tx_transfer_active, tx_error, get_tx_packet_data );
  input [7:0] tx_packet_data;
  input [6:0] buffer_occupancy;
  input [2:0] tx_packet;
  input clk, n_rst;
  output dp_out, dm_out, tx_transfer_active, tx_error, get_tx_packet_data;
  wire   byte_done, bit_done, timer_en, timer_clr, load_en, send_eop,
         shift_strobe, sr_to_stuffer;
  wire   [3:0] pd_count;
  wire   [3:0] bit_count;
  wire   [7:0] data_to_send;
  wire   [4:0] curr_state;
  wire   SYNOPSYS_UNCONNECTED__0;

  txcu fsm_ctrl ( .clk(clk), .n_rst(n_rst), .tx_packet_data(tx_packet_data), 
        .buffer_occupancy(buffer_occupancy), .tx_packet(tx_packet), 
        .byte_done(byte_done), .bit_done(bit_done), .pd_count(pd_count), 
        .bit_count(bit_count), .data_to_send(data_to_send), .timer_en(timer_en), .timer_clr(timer_clr), .load_en(load_en), .send_eop(send_eop), 
        .tx_transfer_active(tx_transfer_active), .get_tx_packet_data(
        get_tx_packet_data), .tx_error(tx_error), .curr_state({
        SYNOPSYS_UNCONNECTED__0, curr_state[3:0]}) );
  tx_timer timer ( .clk(clk), .n_rst(n_rst), .timer_en(timer_en), .timer_clr(
        timer_clr), .byte_done(byte_done), .bit_done(bit_done), .shift_strobe(
        shift_strobe), .pd_count(pd_count), .bit_count(bit_count) );
  flex_sr_SIZE8_MSB_FIRST0 pts_register ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .load_enable(load_en), .serial_in(1'b1), 
        .parallel_in(data_to_send), .serial_out(sr_to_stuffer) );
  encoder encoder_module ( .clk(clk), .n_rst(n_rst), .serial_in(sr_to_stuffer), 
        .shift_strobe(shift_strobe), .send_eop(send_eop), .curr_state({1'b0, 
        curr_state[3:0]}), .dp_out(dp_out), .dm_out(dm_out) );
endmodule


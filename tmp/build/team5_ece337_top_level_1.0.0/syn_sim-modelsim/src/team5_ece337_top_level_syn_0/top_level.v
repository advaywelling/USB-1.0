/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : W-2024.09-SP4
// Date      : Thu May  1 13:38:18 2025
/////////////////////////////////////////////////////////////


module hready_controller ( clk, n_rst, hready, hresp, regadd, write_tx, 
        store_tx_data, get_rx_data, hwrite, haddr, hsize, hsel, curr_addr, 
        htrans );
  output [3:0] regadd;
  input [3:0] haddr;
  input [1:0] hsize;
  input [3:0] curr_addr;
  input [1:0] htrans;
  input clk, n_rst, hwrite, hsel;
  output hready, hresp, write_tx, store_tx_data, get_rx_data;
  wire   N46, N48, N52, N53, N54, N339, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204;
  wire   [5:0] state;
  assign N339 = curr_addr[0];

  DFFSR \state_reg[0]  ( .D(n200), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[3]  ( .D(n204), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3]) );
  DFFSR \state_reg[2]  ( .D(N46), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  DFFSR \state_reg[1]  ( .D(n203), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  DFFSR \state_reg[4]  ( .D(N48), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[4])
         );
  DFFSR \state_reg[5]  ( .D(n201), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[5]) );
  DFFSR get_rx_data_reg ( .D(n202), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        get_rx_data) );
  DFFSR store_tx_data_reg ( .D(N52), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        store_tx_data) );
  DFFSR hready_reg ( .D(N53), .CLK(clk), .R(1'b1), .S(n_rst), .Q(hready) );
  DFFSR hresp_reg ( .D(N54), .CLK(clk), .R(n_rst), .S(1'b1), .Q(hresp) );
  INVX1 U13 ( .A(n1), .Y(write_tx) );
  NAND2X1 U14 ( .A(n2), .B(n3), .Y(regadd[3]) );
  MUX2X1 U15 ( .B(n4), .A(n5), .S(curr_addr[3]), .Y(n2) );
  OR2X1 U16 ( .A(n6), .B(n7), .Y(n5) );
  OAI21X1 U17 ( .A(n8), .B(n9), .C(curr_addr[2]), .Y(n7) );
  INVX1 U18 ( .A(n20), .Y(n9) );
  INVX1 U19 ( .A(n21), .Y(n8) );
  OAI21X1 U20 ( .A(n22), .B(n21), .C(n23), .Y(n4) );
  NAND3X1 U21 ( .A(n24), .B(n25), .C(curr_addr[2]), .Y(n23) );
  NAND2X1 U22 ( .A(curr_addr[2]), .B(curr_addr[1]), .Y(n21) );
  INVX1 U23 ( .A(n26), .Y(n22) );
  MUX2X1 U24 ( .B(n27), .A(n28), .S(curr_addr[2]), .Y(regadd[2]) );
  AOI21X1 U25 ( .A(n20), .B(n29), .C(n6), .Y(n28) );
  NAND2X1 U26 ( .A(n30), .B(n31), .Y(n6) );
  AOI22X1 U27 ( .A(n32), .B(n24), .C(n33), .D(n34), .Y(n30) );
  NAND2X1 U28 ( .A(n35), .B(n36), .Y(n20) );
  AOI22X1 U29 ( .A(curr_addr[1]), .B(n26), .C(n24), .D(n25), .Y(n27) );
  INVX1 U30 ( .A(n32), .Y(n25) );
  NOR2X1 U31 ( .A(n37), .B(N339), .Y(n32) );
  OAI21X1 U32 ( .A(n35), .B(n34), .C(n36), .Y(n26) );
  NAND2X1 U33 ( .A(n38), .B(n39), .Y(regadd[1]) );
  MUX2X1 U34 ( .B(n24), .A(n33), .S(n37), .Y(n39) );
  XOR2X1 U35 ( .A(n34), .B(n29), .Y(n37) );
  INVX1 U36 ( .A(curr_addr[1]), .Y(n29) );
  INVX1 U37 ( .A(N339), .Y(n34) );
  INVX1 U38 ( .A(n35), .Y(n33) );
  MUX2X1 U39 ( .B(n40), .A(n41), .S(curr_addr[1]), .Y(n38) );
  NAND2X1 U40 ( .A(n42), .B(n3), .Y(regadd[0]) );
  INVX1 U41 ( .A(n43), .Y(n3) );
  NAND3X1 U42 ( .A(n44), .B(n45), .C(n46), .Y(n43) );
  NOR2X1 U43 ( .A(n47), .B(n48), .Y(n46) );
  OAI21X1 U44 ( .A(n49), .B(n50), .C(n51), .Y(n48) );
  NOR2X1 U45 ( .A(n52), .B(n53), .Y(n45) );
  AND2X1 U46 ( .A(n54), .B(n55), .Y(n44) );
  OAI21X1 U47 ( .A(n56), .B(n57), .C(n58), .Y(n55) );
  OAI21X1 U48 ( .A(state[2]), .B(n59), .C(state[5]), .Y(n54) );
  MUX2X1 U49 ( .B(n60), .A(n61), .S(N339), .Y(n42) );
  NAND2X1 U50 ( .A(n31), .B(n36), .Y(n61) );
  INVX1 U51 ( .A(n40), .Y(n36) );
  INVX1 U52 ( .A(n41), .Y(n31) );
  OAI21X1 U53 ( .A(n62), .B(n49), .C(n63), .Y(n41) );
  NAND2X1 U54 ( .A(n35), .B(n64), .Y(n60) );
  AOI22X1 U55 ( .A(n65), .B(n66), .C(n67), .D(n58), .Y(n35) );
  NAND2X1 U56 ( .A(n68), .B(n69), .Y(n200) );
  OAI21X1 U57 ( .A(n70), .B(n71), .C(hsel), .Y(n69) );
  OAI21X1 U58 ( .A(n72), .B(n73), .C(n74), .Y(n71) );
  NAND3X1 U59 ( .A(n75), .B(n64), .C(n76), .Y(n70) );
  OAI21X1 U60 ( .A(n77), .B(n78), .C(n79), .Y(n68) );
  OAI21X1 U61 ( .A(hwrite), .B(n80), .C(n81), .Y(n78) );
  INVX1 U62 ( .A(n82), .Y(n201) );
  OAI21X1 U63 ( .A(n83), .B(n84), .C(hsel), .Y(n82) );
  OAI22X1 U64 ( .A(n49), .B(n85), .C(n86), .D(n87), .Y(n84) );
  INVX1 U65 ( .A(n88), .Y(n86) );
  OAI21X1 U66 ( .A(n73), .B(n89), .C(n90), .Y(n83) );
  NAND2X1 U67 ( .A(n91), .B(n92), .Y(n202) );
  OAI21X1 U68 ( .A(n93), .B(n94), .C(hsel), .Y(n92) );
  OAI22X1 U69 ( .A(n49), .B(n85), .C(n73), .D(n87), .Y(n94) );
  OAI21X1 U70 ( .A(n95), .B(n96), .C(n97), .Y(n203) );
  OAI21X1 U71 ( .A(n98), .B(n99), .C(hsel), .Y(n97) );
  NAND2X1 U72 ( .A(n63), .B(n51), .Y(n99) );
  INVX1 U73 ( .A(n100), .Y(n51) );
  OAI21X1 U74 ( .A(n101), .B(n102), .C(n103), .Y(n100) );
  AOI21X1 U75 ( .A(n58), .B(n65), .C(n104), .Y(n103) );
  AOI21X1 U76 ( .A(n105), .B(n106), .C(n49), .Y(n104) );
  NOR2X1 U77 ( .A(n107), .B(n108), .Y(n63) );
  OAI21X1 U78 ( .A(n109), .B(n49), .C(n75), .Y(n108) );
  OAI21X1 U79 ( .A(n73), .B(n110), .C(n111), .Y(n98) );
  NOR2X1 U80 ( .A(n24), .B(n40), .Y(n111) );
  AOI21X1 U81 ( .A(n89), .B(n50), .C(n73), .Y(n40) );
  INVX1 U82 ( .A(n64), .Y(n24) );
  NAND2X1 U83 ( .A(n66), .B(n67), .Y(n64) );
  NAND2X1 U84 ( .A(n109), .B(n87), .Y(n67) );
  AOI21X1 U85 ( .A(n112), .B(n113), .C(n114), .Y(n95) );
  OAI21X1 U86 ( .A(n115), .B(n116), .C(n117), .Y(n204) );
  INVX1 U87 ( .A(n118), .Y(n117) );
  AOI21X1 U88 ( .A(n80), .B(n119), .C(n96), .Y(n118) );
  NOR2X1 U89 ( .A(n120), .B(n121), .Y(n115) );
  NAND2X1 U90 ( .A(n122), .B(n123), .Y(n121) );
  OAI21X1 U91 ( .A(n58), .B(n124), .C(n56), .Y(n123) );
  NAND2X1 U92 ( .A(n125), .B(n76), .Y(n120) );
  OAI21X1 U93 ( .A(n52), .B(n88), .C(n126), .Y(n125) );
  OAI21X1 U94 ( .A(n113), .B(n96), .C(n127), .Y(N54) );
  NAND3X1 U95 ( .A(n128), .B(n58), .C(hsel), .Y(n127) );
  NAND3X1 U96 ( .A(n129), .B(n130), .C(hsel), .Y(N53) );
  NAND3X1 U97 ( .A(n58), .B(n131), .C(n57), .Y(n130) );
  OAI22X1 U98 ( .A(htrans[1]), .B(htrans[0]), .C(n132), .D(n133), .Y(n131) );
  NAND3X1 U99 ( .A(n134), .B(n135), .C(n113), .Y(n133) );
  INVX1 U100 ( .A(n77), .Y(n113) );
  OAI21X1 U101 ( .A(n136), .B(n137), .C(n138), .Y(n77) );
  NAND3X1 U102 ( .A(hwrite), .B(n139), .C(haddr[2]), .Y(n138) );
  OAI21X1 U103 ( .A(n140), .B(n141), .C(haddr[3]), .Y(n139) );
  NAND2X1 U104 ( .A(n142), .B(n143), .Y(n141) );
  INVX1 U105 ( .A(haddr[3]), .Y(n137) );
  AOI21X1 U106 ( .A(n144), .B(n145), .C(haddr[1]), .Y(n136) );
  INVX1 U107 ( .A(haddr[2]), .Y(n145) );
  NAND3X1 U108 ( .A(n81), .B(n119), .C(n80), .Y(n132) );
  INVX1 U109 ( .A(n112), .Y(n81) );
  NOR2X1 U110 ( .A(n146), .B(n147), .Y(n112) );
  INVX1 U111 ( .A(n47), .Y(n129) );
  NAND3X1 U112 ( .A(n148), .B(n149), .C(n150), .Y(n47) );
  AOI22X1 U113 ( .A(n52), .B(n151), .C(n152), .D(n58), .Y(n150) );
  NAND2X1 U114 ( .A(n72), .B(n85), .Y(n151) );
  AND2X1 U115 ( .A(n153), .B(n87), .Y(n72) );
  NAND3X1 U116 ( .A(n154), .B(n155), .C(state[5]), .Y(n87) );
  INVX1 U117 ( .A(n102), .Y(n52) );
  OAI21X1 U118 ( .A(n156), .B(n57), .C(n66), .Y(n149) );
  OAI21X1 U119 ( .A(n124), .B(n88), .C(n128), .Y(n148) );
  INVX1 U120 ( .A(n110), .Y(n128) );
  NOR2X1 U121 ( .A(n1), .B(n116), .Y(N52) );
  NOR2X1 U122 ( .A(n157), .B(n158), .Y(n1) );
  OAI21X1 U123 ( .A(n159), .B(n160), .C(n161), .Y(n158) );
  INVX1 U124 ( .A(n107), .Y(n161) );
  OAI21X1 U125 ( .A(n49), .B(n162), .C(n76), .Y(n107) );
  NAND2X1 U126 ( .A(n66), .B(n56), .Y(n76) );
  OAI21X1 U127 ( .A(n163), .B(n116), .C(n91), .Y(N48) );
  NAND3X1 U128 ( .A(n164), .B(n146), .C(n79), .Y(n91) );
  INVX1 U129 ( .A(n96), .Y(n79) );
  INVX1 U130 ( .A(hsel), .Y(n116) );
  NOR2X1 U131 ( .A(n165), .B(n166), .Y(n163) );
  NAND2X1 U132 ( .A(n122), .B(n167), .Y(n166) );
  INVX1 U133 ( .A(n157), .Y(n167) );
  OAI21X1 U134 ( .A(n50), .B(n73), .C(n168), .Y(n157) );
  AOI22X1 U135 ( .A(n169), .B(n88), .C(n124), .D(n126), .Y(n168) );
  INVX1 U136 ( .A(n159), .Y(n126) );
  NAND2X1 U137 ( .A(n73), .B(n160), .Y(n88) );
  INVX1 U138 ( .A(n58), .Y(n73) );
  NOR2X1 U139 ( .A(n170), .B(n171), .Y(n122) );
  OAI21X1 U140 ( .A(n102), .B(n105), .C(n172), .Y(n171) );
  INVX1 U141 ( .A(n93), .Y(n172) );
  OAI21X1 U142 ( .A(n49), .B(n105), .C(n173), .Y(n93) );
  AOI22X1 U143 ( .A(n174), .B(n175), .C(n176), .D(n58), .Y(n173) );
  INVX1 U144 ( .A(n85), .Y(n176) );
  OAI21X1 U145 ( .A(hwrite), .B(n80), .C(n134), .Y(n175) );
  INVX1 U146 ( .A(n114), .Y(n134) );
  NAND3X1 U147 ( .A(hsize[0]), .B(n147), .C(n177), .Y(n80) );
  NOR2X1 U148 ( .A(hsize[1]), .B(haddr[0]), .Y(n177) );
  OAI21X1 U149 ( .A(n49), .B(n50), .C(n178), .Y(n170) );
  INVX1 U150 ( .A(n179), .Y(n178) );
  OAI21X1 U151 ( .A(n85), .B(n160), .C(n75), .Y(n179) );
  NAND2X1 U152 ( .A(n152), .B(n66), .Y(n75) );
  OAI22X1 U153 ( .A(n109), .B(n49), .C(n50), .D(n102), .Y(n165) );
  INVX1 U154 ( .A(n169), .Y(n109) );
  OAI21X1 U155 ( .A(n180), .B(n96), .C(n181), .Y(N46) );
  OAI21X1 U156 ( .A(n182), .B(n183), .C(hsel), .Y(n181) );
  OAI21X1 U157 ( .A(n101), .B(n102), .C(n74), .Y(n183) );
  INVX1 U158 ( .A(n184), .Y(n74) );
  OAI21X1 U159 ( .A(n185), .B(n102), .C(n186), .Y(n184) );
  AOI22X1 U160 ( .A(n174), .B(n187), .C(n124), .D(n188), .Y(n186) );
  NAND2X1 U161 ( .A(n185), .B(n153), .Y(n188) );
  NOR2X1 U162 ( .A(n169), .B(n56), .Y(n153) );
  INVX1 U163 ( .A(n106), .Y(n56) );
  NAND3X1 U164 ( .A(n155), .B(n189), .C(n190), .Y(n106) );
  NOR2X1 U165 ( .A(n191), .B(state[0]), .Y(n169) );
  INVX1 U166 ( .A(n49), .Y(n124) );
  NAND2X1 U167 ( .A(state[2]), .B(state[1]), .Y(n49) );
  OAI21X1 U168 ( .A(hwrite), .B(n135), .C(n119), .Y(n187) );
  NAND3X1 U169 ( .A(n192), .B(n142), .C(hwrite), .Y(n119) );
  INVX1 U170 ( .A(n193), .Y(n192) );
  NOR2X1 U171 ( .A(n57), .B(n152), .Y(n185) );
  INVX1 U172 ( .A(n105), .Y(n152) );
  NAND3X1 U173 ( .A(state[4]), .B(n155), .C(n190), .Y(n105) );
  INVX1 U174 ( .A(n162), .Y(n57) );
  NAND2X1 U175 ( .A(state[2]), .B(n194), .Y(n102) );
  INVX1 U176 ( .A(n195), .Y(n101) );
  NAND3X1 U177 ( .A(n50), .B(n159), .C(n110), .Y(n195) );
  NAND3X1 U178 ( .A(state[0]), .B(n196), .C(n154), .Y(n110) );
  INVX1 U179 ( .A(n156), .Y(n50) );
  NOR2X1 U180 ( .A(n155), .B(n191), .Y(n156) );
  NAND3X1 U181 ( .A(n197), .B(n196), .C(state[4]), .Y(n191) );
  OAI21X1 U182 ( .A(n62), .B(n160), .C(n90), .Y(n182) );
  INVX1 U183 ( .A(n53), .Y(n90) );
  NOR2X1 U184 ( .A(n89), .B(n160), .Y(n53) );
  NAND3X1 U185 ( .A(n154), .B(state[0]), .C(state[5]), .Y(n89) );
  INVX1 U186 ( .A(n66), .Y(n160) );
  NOR2X1 U187 ( .A(n194), .B(state[2]), .Y(n66) );
  INVX1 U188 ( .A(state[1]), .Y(n194) );
  INVX1 U189 ( .A(n65), .Y(n62) );
  NAND2X1 U190 ( .A(n159), .B(n85), .Y(n65) );
  NAND3X1 U191 ( .A(n190), .B(state[4]), .C(state[0]), .Y(n85) );
  NAND3X1 U192 ( .A(n190), .B(n189), .C(state[0]), .Y(n159) );
  NOR2X1 U193 ( .A(n197), .B(state[5]), .Y(n190) );
  NAND2X1 U194 ( .A(hsel), .B(n174), .Y(n96) );
  NOR2X1 U195 ( .A(n162), .B(n198), .Y(n174) );
  OAI21X1 U196 ( .A(htrans[1]), .B(htrans[0]), .C(n58), .Y(n198) );
  NOR2X1 U197 ( .A(state[1]), .B(state[2]), .Y(n58) );
  NAND3X1 U198 ( .A(n155), .B(n196), .C(n154), .Y(n162) );
  INVX1 U199 ( .A(n59), .Y(n154) );
  NAND2X1 U200 ( .A(n189), .B(n197), .Y(n59) );
  INVX1 U201 ( .A(state[3]), .Y(n197) );
  INVX1 U202 ( .A(state[4]), .Y(n189) );
  INVX1 U203 ( .A(state[5]), .Y(n196) );
  INVX1 U204 ( .A(state[0]), .Y(n155) );
  NOR2X1 U205 ( .A(n114), .B(n164), .Y(n180) );
  INVX1 U206 ( .A(n135), .Y(n164) );
  NAND3X1 U207 ( .A(n143), .B(n140), .C(n147), .Y(n135) );
  INVX1 U208 ( .A(hsize[1]), .Y(n140) );
  INVX1 U209 ( .A(hsize[0]), .Y(n143) );
  NOR2X1 U210 ( .A(n144), .B(n193), .Y(n114) );
  NAND3X1 U211 ( .A(hsize[1]), .B(n147), .C(n199), .Y(n193) );
  NOR2X1 U212 ( .A(hsize[0]), .B(haddr[1]), .Y(n199) );
  NOR2X1 U213 ( .A(haddr[3]), .B(haddr[2]), .Y(n147) );
  NAND2X1 U214 ( .A(n146), .B(n142), .Y(n144) );
  INVX1 U215 ( .A(haddr[0]), .Y(n142) );
  INVX1 U216 ( .A(hwrite), .Y(n146) );
endmodule


module ahb_subordinate_lite ( clk, n_rst, hsel, haddr, hsize, htrans, hwrite, 
        hwdata, hrdata, hresp, hready, rx_packet, rx_data_ready, 
        rx_transfer_active, rx_error, d_mode, buffer_occupancy, rx_data, 
        get_rx_data, store_tx_data, tx_data, clear, tx_packet, 
        tx_transfer_active, tx_error );
  input [3:0] haddr;
  input [1:0] hsize;
  input [1:0] htrans;
  input [31:0] hwdata;
  output [31:0] hrdata;
  input [2:0] rx_packet;
  input [6:0] buffer_occupancy;
  input [7:0] rx_data;
  output [7:0] tx_data;
  output [2:0] tx_packet;
  input clk, n_rst, hsel, hwrite, rx_data_ready, rx_transfer_active, rx_error,
         tx_transfer_active, tx_error;
  output hresp, hready, d_mode, get_rx_data, store_tx_data, clear;
  wire   N174, N175, N176, N177, N179, N180, N181, N183, N184, N185, N192,
         N193, N194, N196, N197, N200, N201, N207, N208, N209, N210, N212,
         N213, N216, N217, tx_transfer_active, n2454, \mem[13][7] ,
         \mem[13][6] , \mem[13][5] , \mem[13][4] , \mem[13][3] , \mem[13][2] ,
         \mem[13][1] , \mem[12][7] , \mem[12][6] , \mem[12][5] , \mem[12][4] ,
         \mem[12][3] , \mem[12][2] , \mem[12][1] , \mem[12][0] , \mem[8][6] ,
         \mem[8][5] , \mem[8][4] , \mem[8][3] , \mem[8][2] , \mem[8][1] ,
         \mem[8][0] , \mem[7][0] , \mem[6][0] , \mem[5][1] , \mem[5][0] ,
         \mem[4][5] , \mem[4][4] , \mem[4][3] , \mem[4][2] , \mem[4][1] ,
         \mem[4][0] , \mem[3][7] , \mem[3][6] , \mem[3][5] , \mem[3][4] ,
         \mem[3][3] , \mem[3][2] , \mem[3][1] , \mem[3][0] , \mem[2][7] ,
         \mem[2][6] , \mem[2][5] , \mem[2][4] , \mem[2][3] , \mem[2][2] ,
         \mem[2][1] , \mem[2][0] , \mem[1][7] , \mem[1][6] , \mem[1][5] ,
         \mem[1][4] , \mem[1][3] , \mem[1][2] , \mem[1][1] , \mem[1][0] ,
         \mem[0][7] , \mem[0][6] , \mem[0][5] , \mem[0][4] , \mem[0][3] ,
         \mem[0][2] , \mem[0][1] , \mem[0][0] , curr_write, prev_write, N254,
         N255, N256, N257, N258, N259, N260, N261, N265, N266, N267, N268,
         N269, N270, N271, N272, N274, N275, N276, N277, N278, N279, N280,
         N281, N365, N366, N367, N368, N369, N370, N371, N372, N484, N485,
         N486, N487, N488, N489, N490, N491, N492, N493, N494, N495, N496,
         N497, N498, N499, N500, N501, N502, N503, N504, N505, N506, N507,
         N684, N685, N686, N687, N688, N689, N690, N691, N803, N804, N805,
         N806, N807, N808, N809, N810, N811, N812, N813, N814, N815, N816,
         N817, N818, N819, N820, N821, N822, N823, N824, N825, N826,
         prev_get_rx_data, \next_mem[13][7] , \next_mem[13][6] ,
         \next_mem[13][5] , \next_mem[13][4] , \next_mem[13][3] ,
         \next_mem[13][2] , \next_mem[13][1] , \next_mem[13][0] ,
         \next_mem[12][7] , \next_mem[12][6] , \next_mem[12][5] ,
         \next_mem[12][4] , \next_mem[12][3] , \next_mem[12][2] ,
         \next_mem[12][1] , \next_mem[12][0] , \next_mem[3][7] ,
         \next_mem[3][6] , \next_mem[3][5] , \next_mem[3][4] ,
         \next_mem[3][3] , \next_mem[3][2] , \next_mem[3][1] ,
         \next_mem[3][0] , \next_mem[2][7] , \next_mem[2][6] ,
         \next_mem[2][5] , \next_mem[2][4] , \next_mem[2][3] ,
         \next_mem[2][2] , \next_mem[2][1] , \next_mem[2][0] ,
         \next_mem[1][7] , \next_mem[1][6] , \next_mem[1][5] ,
         \next_mem[1][4] , \next_mem[1][3] , \next_mem[1][2] ,
         \next_mem[1][1] , \next_mem[1][0] , \next_mem[0][7] ,
         \next_mem[0][6] , \next_mem[0][5] , \next_mem[0][4] ,
         \next_mem[0][3] , \next_mem[0][2] , \next_mem[0][1] ,
         \next_mem[0][0] , prev_hwrite, prev_tx_active, N1739, N1740, N1741,
         N1742, N1743, N1744, N1747, n740, n742, n744, n746, n748, n750, n752,
         n754, n756, n758, n760, n762, n764, n766, n768, n770, n772, n774,
         n776, n778, n780, n782, n784, n786, n788, n790, n792, n794, n796,
         n798, n800, n802, n819, n823, n826, n827, n828, n829, n830, n1, n2,
         n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n293, n294, n295, n296, n297, n298, n299,
         n300, n301, n302, n303, n304, n305, n306, n307, n308, n309, n310,
         n311, n312, n313, n314, n315, n316, n317, n318, n319, n320, n321,
         n322, n323, n324, n325, n326, n327, n328, n329, n330, n331, n332,
         n333, n334, n335, n336, n337, n338, n339, n340, n341, n342, n343,
         n344, n345, n346, n347, n348, n349, n350, n351, n352, n353, n354,
         n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n387,
         n388, n389, n390, n391, n392, n393, n394, n395, n396, n397, n398,
         n399, n400, n401, n402, n403, n404, n405, n406, n407, n408, n409,
         n410, n411, n412, n413, n414, n415, n416, n417, n418, n419, n420,
         n421, n422, n423, n424, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442,
         n443, n444, n445, n446, n447, n448, n449, n450, n451, n452, n453,
         n454, n455, n456, n457, n458, n459, n460, n461, n462, n463, n464,
         n465, n466, n467, n468, n469, n470, n471, n472, n473, n474, n475,
         n476, n477, n478, n479, n480, n481, n482, n483, n484, n485, n486,
         n487, n488, n489, n490, n491, n492, n493, n494, n495, n496, n497,
         n498, n499, n500, n501, n502, n503, n504, n505, n506, n507, n508,
         n509, n510, n511, n512, n513, n514, n515, n516, n517, n518, n519,
         n520, n521, n522, n523, n524, n525, n526, n527, n528, n529, n530,
         n531, n532, n533, n534, n535, n536, n537, n538, n539, n540, n541,
         n542, n543, n544, n545, n546, n547, n548, n549, n550, n551, n552,
         n553, n554, n555, n556, n557, n558, n559, n560, n561, n562, n563,
         n564, n565, n566, n567, n568, n569, n570, n571, n572, n573, n574,
         n575, n576, n577, n578, n579, n580, n581, n582, n583, n584, n585,
         n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596,
         n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, n607,
         n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, n618,
         n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629,
         n630, n631, n632, n633, n634, n635, n636, n637, n638, n639, n640,
         n641, n642, n643, n644, n645, n646, n647, n648, n649, n650, n651,
         n652, n653, n654, n655, n656, n657, n658, n659, n660, n661, n662,
         n663, n664, n665, n820, n821, n822, n824, n825, n831, n832, n833,
         n834, n835, n836, n837, n838, n839, n840, n841, n842, n843, n844,
         n845, n846, n847, n848, n849, n850, n851, n852, n853, n854, n855,
         n856, n857, n858, n859, n860, n861, n862, n863, n864, n865, n866,
         n867, n868, n869, n870, n871, n872, n873, n874, n875, n876, n877,
         n878, n879, n880, n881, n882, n883, n884, n885, n886, n887, n888,
         n889, n890, n891, n892, n893, n894, n895, n896, n897, n898, n899,
         n900, n901, n902, n903, n904, n905, n906, n907, n908, n909, n910,
         n911, n912, n913, n914, n915, n916, n917, n918, n919, n920, n921,
         n922, n923, n924, n925, n926, n927, n928, n929, n930, n931, n932,
         n933, n934, n935, n936, n937, n938, n939, n940, n941, n942, n943,
         n944, n945, n946, n947, n948, n949, n950, n951, n952, n953, n954,
         n955, n956, n957, n958, n959, n960, n961, n962, n963, n964, n965,
         n966, n967, n968, n969, n970, n971, n972, n973, n974, n975, n976,
         n977, n978, n979, n980, n981, n982, n983, n984, n985, n986, n987,
         n988, n989, n990, n991, n992, n993, n994, n995, n996, n997, n998,
         n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008,
         n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018,
         n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028,
         n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038,
         n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048,
         n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058,
         n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068,
         n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078,
         n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088,
         n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098,
         n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108,
         n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118,
         n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128,
         n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138,
         n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148,
         n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158,
         n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168,
         n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178,
         n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186, n1187, n1188,
         n1189, n1190, n1191, n1192, n1193, n1194, n1195, n1196, n1197, n1198,
         n1199, n1200, n1201, n1202, n1203, n1204, n1205, n1206, n1207, n1208,
         n1209, n1210, n1211, n1212, n1213, n1214, n1215, n1216, n1217, n1218,
         n1219, n1220, n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228,
         n1229, n1230, n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238,
         n1239, n1240, n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248,
         n1249, n1250, n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258,
         n1259, n1260, n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268,
         n1269, n1270, n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278,
         n1279, n1280, n1281, n1282, n1283, n1284, n1285, n1286, n1287, n1288,
         n1289, n1290, n1291, n1292, n1293, n1294, n1295, n1296, n1297, n1298,
         n1299, n1300, n1301, n1302, n1303, n1304, n1305, n1306, n1307, n1308,
         n1309, n1310, n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318,
         n1319, n1320, n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328,
         n1329, n1330, n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338,
         n1339, n1340, n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348,
         n1349, n1350, n1351, n1352, n1353, n1354, n1355, n1356, n1357, n1358,
         n1359, n1360, n1361, n1362, n1363, n1364, n1365, n1366, n1367, n1368,
         n1369, n1370, n1371, n1372, n1373, n1374, n1375, n1376, n1377, n1378,
         n1379, n1380, n1381, n1382, n1383, n1384, n1385, n1386, n1387, n1388,
         n1389, n1390, n1391, n1392, n1393, n1394, n1395, n1396, n1397, n1398,
         n1399, n1400, n1401, n1402, n1403, n1404, n1405, n1406, n1407, n1408,
         n1409, n1410, n1411, n1412, n1413, n1414, n1415, n1416, n1417, n1418,
         n1419, n1420, n1421, n1422, n1423, n1424, n1425, n1426, n1427, n1428,
         n1429, n1430, n1431, n1432, n1433, n1434, n1435, n1436, n1437, n1438,
         n1439, n1440, n1441, n1442, n1443, n1444, n1445, n1446, n1447, n1448,
         n1449, n1450, n1451, n1452, n1453, n1454, n1455, n1456, n1457, n1458,
         n1459, n1460, n1461, n1462, n1463, n1464, n1465, n1466, n1467, n1468,
         n1469, n1470, n1471, n1472, n1473, n1474, n1475, n1476, n1477, n1478,
         n1479, n1480, n1481, n1482, n1483, n1484, n1485, n1486, n1487, n1488,
         n1489, n1490, n1491, n1492, n1493, n1494, n1495, n1496, n1497, n1498,
         n1499, n1500, n1501, n1502, n1503, n1504, n1505, n1506, n1507, n1508,
         n1509, n1510, n1511, n1512, n1513, n1514, n1515, n1516, n1517, n1518,
         n1519, n1520, n1521, n1522, n1523, n1524, n1525, n1526, n1527, n1528,
         n1529, n1530, n1531, n1532, n1533, n1534, n1535, n1536, n1537, n1538,
         n1539, n1540, n1541, n1542, n1543, n1544, n1545, n1546, n1547, n1548,
         n1549, n1550, n1551, n1552, n1553, n1554, n1555, n1556, n1557, n1558,
         n1559, n1560, n1561, n1562, n1563, n1564, n1565, n1566, n1567, n1568,
         n1569, n1570, n1571, n1572, n1573, n1574, n1575, n1576, n1577, n1578,
         n1579, n1580, n1581, n1582, n1583, n1584, n1585, n1586, n1587, n1588,
         n1589, n1590, n1591, n1592, n1593, n1594, n1595, n1596, n1597, n1598,
         n1599, n1600, n1601, n1602, n1603, n1604, n1605, n1606, n1607, n1608,
         n1609, n1610, n1611, n1612, n1613, n1614, n1615, n1616, n1617, n1618,
         n1619, n1620, n1621, n1622, n1623, n1624, n1625, n1626, n1627, n1628,
         n1629, n1630, n1631, n1632, n1633, n1634, n1635, n1636, n1637, n1638,
         n1639, n1640, n1641, n1642, n1643, n1644, n1645, n1646, n1647, n1648,
         n1649, n1650, n1651, n1652, n1653, n1654, n1655, n1656, n1657, n1658,
         n1659, n1660, n1661, n1662, n1663, n1664, n1665, n1666, n1667, n1668,
         n1669, n1670, n1671, n1672, n1673, n1674, n1675, n1676, n1677, n1678,
         n1679, n1680, n1681, n1682, n1683, n1684, n1685, n1686, n1687, n1688,
         n1689, n1690, n1691, n1692, n1693, n1694, n1695, n1696, n1697, n1698,
         n1699, n1700, n1701, n1702, n1703, n1704, n1705, n1706, n1707, n1708,
         n1709, n1710, n1711, n1712, n1713, n1714, n1715, n1716, n1717, n1718,
         n1719, n1720, n1721, n1722, n1723, n1724, n1725, n1726, n1727, n1728,
         n1729, n1730, n1731, n1732, n1733, n1734, n1735, n1736, n1737, n1738,
         n1739, n1740, n1741, n1742, n1743, n1744, n1745, n1746, n1747, n1748,
         n1749, n1750, n1751, n1752, n1753, n1754, n1755, n1756, n1757, n1758,
         n1759, n1760, n1761, n1762, n1763, n1764, n1765, n1766, n1767, n1768,
         n1769, n1770, n1771, n1772, n1773, n1774, n1775, n1776, n1777, n1778,
         n1779, n1780, n1781, n1782, n1783, n1784, n1785, n1786, n1787, n1788,
         n1789, n1790, n1791, n1792, n1793, n1794, n1795, n1796, n1797, n1798,
         n1799, n1800, n1801, n1802, n1803, n1804, n1805, n1806, n1807, n1808,
         n1809, n1810, n1811, n1812, n1813, n1814, n1815, n1816, n1817, n1818,
         n1819, n1820, n1821, n1822, n1823, n1824, n1825, n1826, n1827, n1828,
         n1829, n1830, n1831, n1832, n1833, n1834, n1835, n1836, n1837, n1838,
         n1839, n1840, n1841, n1842, n1843, n1844, n1845, n1846, n1847, n1848,
         n1849, n1850, n1851, n1852, n1853, n1854, n1855, n1856, n1857, n1858,
         n1859, n1860, n1861, n1862, n1863, n1864, n1865, n1866, n1867, n1868,
         n1869, n1870, n1871, n1872, n1873, n1874, n1875, n1876, n1877, n1878,
         n1879, n1880, n1881, n1882, n1883, n1884, n1885, n1886, n1887, n1888,
         n1889, n1890, n1891, n1892, n1893, n1894, n1895, n1896, n1897, n1898,
         n1899, n1900, n1901, n1902, n1903, n1904, n1905, n1906, n1907, n1908,
         n1909, n1910, n1911, n1912, n1913, n1914, n1915, n1916, n1917, n1918,
         n1919, n1920, n1921, n1922, n1923, n1924, n1925, n1926, n1927, n1928,
         n1929, n1930, n1931, n1932, n1933, n1934, n1935, n1936, n1937, n1938,
         n1939, n1940, n1941, n1942, n1943, n1944, n1945, n1946, n1947, n1948,
         n1949, n1950, n1951, n1952, n1953, n1954, n1955, n1956, n1957, n1958,
         n1959, n1960, n1961, n1962, n1963, n1964, n1965, n1966, n1967, n1968,
         n1969, n1970, n1971, n1972, n1973, n1974, n1975, n1976, n1977, n1978,
         n1979, n1980, n1981, n1982, n1983, n1984, n1985, n1986, n1987, n1988,
         n1989, n1990, n1991, n1992, n1993, n1994, n1995, n1996, n1997, n1998,
         n1999, n2000, n2001, n2002, n2003, n2004, n2005, n2006, n2007, n2008,
         n2009, n2010, n2011, n2012, n2013, n2014, n2015, n2016, n2017, n2018,
         n2019, n2020, n2021, n2022, n2023, n2024, n2025, n2026, n2027, n2028,
         n2029, n2030, n2031, n2032, n2033, n2034, n2035, n2036, n2037, n2038,
         n2039, n2040, n2041, n2042, n2043, n2044, n2045, n2046, n2047, n2048,
         n2049, n2050, n2051, n2052, n2053, n2054, n2055, n2056, n2057, n2058,
         n2059, n2060, n2061, n2062, n2063, n2064, n2065, n2066, n2067, n2068,
         n2069, n2070, n2071, n2072, n2073, n2074, n2075, n2076, n2077, n2078,
         n2079, n2080, n2081, n2082, n2083, n2084, n2085, n2086, n2087, n2088,
         n2089, n2090, n2091, n2092, n2093, n2094, n2095, n2096, n2097, n2098,
         n2099, n2100, n2101, n2102, n2103, n2104, n2105, n2106, n2107, n2108,
         n2109, n2110, n2111, n2112, n2113, n2114, n2115, n2116, n2117, n2118,
         n2119, n2120, n2121, n2122, n2123, n2124, n2125, n2126, n2127, n2128,
         n2129, n2130, n2131, n2132, n2133, n2134, n2135, n2136, n2137, n2138,
         n2139, n2140, n2141, n2142, n2143, n2144, n2145, n2146, n2147, n2148,
         n2149, n2150, n2151, n2152, n2153, n2154, n2155, n2156, n2157, n2158,
         n2159, n2160, n2161, n2162, n2163, n2164, n2165, n2166, n2167, n2168,
         n2169, n2170, n2171, n2172, n2173, n2174, n2175, n2176, n2177, n2178,
         n2179, n2180, n2181, n2182, n2183, n2184, n2185, n2186, n2187, n2188,
         n2189, n2190, n2191, n2192, n2193, n2194, n2195, n2196, n2197, n2198,
         n2199, n2200, n2201, n2202, n2203, n2204, n2205, n2206, n2207, n2208,
         n2209, n2210, n2211, n2212, n2213, n2214, n2215, n2216, n2217, n2218,
         n2219, n2220, n2221, n2222, n2223, n2224, n2225, n2226, n2227, n2228,
         n2229, n2230, n2231, n2232, n2233, n2234, n2235, n2236, n2237, n2238,
         n2239, n2240, n2241, n2242, n2243, n2244, n2245, n2246, n2247, n2248,
         n2249, n2250, n2251, n2252, n2253, n2254, n2255, n2256, n2257, n2258,
         n2259, n2260, n2261, n2262, n2263, n2264, n2265, n2266, n2267, n2268,
         n2269, n2270, n2271, n2272, n2273, n2274, n2275, n2276, n2277, n2278,
         n2279, n2280, n2281, n2282, n2283, n2284, n2285, n2286, n2287, n2288,
         n2289, n2290, n2291, n2292, n2293, n2294, n2295, n2296, n2297, n2298,
         n2299, n2300, n2301, n2302, n2303, n2304, n2305, n2306, n2307, n2308,
         n2309, n2310, n2311, n2312, n2313, n2314, n2315, n2316, n2317, n2318,
         n2319, n2320, n2321, n2322, n2323, n2324, n2325, n2326, n2327, n2328,
         n2329, n2330, n2331, n2332, n2333, n2334, n2335, n2336, n2337, n2338,
         n2339, n2340, n2341, n2342, n2343, n2344, n2345, n2346, n2347, n2348,
         n2349, n2350, n2351, n2352, n2353, n2354, n2355, n2356, n2357, n2358,
         n2359, n2360, n2361, n2362, n2363, n2364, n2365, n2366, n2367, n2368,
         n2369, n2370, n2371, n2372, n2373, n2374, n2375, n2376, n2377, n2378,
         n2379, n2380, n2381, n2382, n2383, n2384, n2385, n2386, n2387, n2388,
         n2389, n2390, n2391, n2392, n2393, n2394, n2395, n2396, n2397, n2398,
         n2399, n2400, n2401, n2402, n2403, n2404, n2405, n2406, n2407, n2408,
         n2409, n2410, n2411, n2412, n2413, n2414, n2415, n2416, n2417, n2418,
         n2419, n2420, n2421, n2422, n2423, n2424, n2425, n2426, n2427, n2428,
         n2429, n2430, n2431, n2432, n2433, n2434, n2435, n2436, n2437, n2438,
         n2439, n2440, n2441, n2442, n2443, n2444, n2445, n2446, n2447, n2448,
         n2449, n2450, n2451, n2452, n2453;
  wire   [7:0] next_tx_data;
  wire   [3:0] curr_addr;
  wire   [1:0] curr_size;
  wire   [1:0] prev_size;
  wire   [3:0] prev_write_addr;
  wire   [1:0] prev_write_size;
  assign N179 = haddr[1];
  assign N180 = haddr[2];
  assign N181 = haddr[3];
  assign N194 = haddr[0];
  assign d_mode = tx_transfer_active;
  assign N1747 = hsel;

  DFFSR \prev_addr_reg[0]  ( .D(curr_addr[0]), .CLK(n55), .R(1'b1), .S(n53), 
        .Q(N210) );
  DFFSR \prev_addr_reg[1]  ( .D(curr_addr[1]), .CLK(n55), .R(n49), .S(1'b1), 
        .Q(N183) );
  DFFSR \prev_addr_reg[2]  ( .D(curr_addr[2]), .CLK(n55), .R(n49), .S(1'b1), 
        .Q(N184) );
  DFFSR \prev_addr_reg[3]  ( .D(curr_addr[3]), .CLK(n55), .R(1'b1), .S(n53), 
        .Q(N185) );
  DFFSR \prev_size_reg[0]  ( .D(curr_size[0]), .CLK(n55), .R(n49), .S(1'b1), 
        .Q(prev_size[0]) );
  DFFSR \prev_size_reg[1]  ( .D(curr_size[1]), .CLK(n55), .R(n49), .S(1'b1), 
        .Q(prev_size[1]) );
  DFFSR prev_write_reg ( .D(curr_write), .CLK(n55), .R(n49), .S(1'b1), .Q(
        prev_write) );
  DFFSR prev_tx_active_reg ( .D(tx_transfer_active), .CLK(n55), .R(n50), .S(
        1'b1), .Q(prev_tx_active) );
  DFFSR prev_get_rx_data_reg ( .D(get_rx_data), .CLK(n55), .R(n49), .S(1'b1), 
        .Q(prev_get_rx_data) );
  DFFSR \prev_write_addr_reg[3]  ( .D(N1742), .CLK(n55), .R(n49), .S(1'b1), 
        .Q(prev_write_addr[3]) );
  DFFSR \prev_write_addr_reg[2]  ( .D(N1741), .CLK(n55), .R(n49), .S(1'b1), 
        .Q(prev_write_addr[2]) );
  DFFSR \prev_write_addr_reg[1]  ( .D(N1740), .CLK(n55), .R(n49), .S(1'b1), 
        .Q(prev_write_addr[1]) );
  DFFSR \prev_write_addr_reg[0]  ( .D(N1739), .CLK(n55), .R(n49), .S(1'b1), 
        .Q(prev_write_addr[0]) );
  DFFSR prev_hwrite_reg ( .D(n819), .CLK(n55), .R(n49), .S(1'b1), .Q(
        prev_hwrite) );
  DFFSR \prev_write_size_reg[1]  ( .D(N1744), .CLK(n55), .R(n49), .S(1'b1), 
        .Q(prev_write_size[1]) );
  DFFSR \prev_write_size_reg[0]  ( .D(N1743), .CLK(n55), .R(n51), .S(1'b1), 
        .Q(prev_write_size[0]) );
  DFFSR \hrdata_reg[31]  ( .D(n802), .CLK(n54), .R(n49), .S(1'b1), .Q(
        hrdata[31]) );
  DFFSR \hrdata_reg[30]  ( .D(n800), .CLK(n54), .R(n53), .S(1'b1), .Q(
        hrdata[30]) );
  DFFSR \hrdata_reg[29]  ( .D(n798), .CLK(n54), .R(n53), .S(1'b1), .Q(
        hrdata[29]) );
  DFFSR \hrdata_reg[28]  ( .D(n796), .CLK(n54), .R(n53), .S(1'b1), .Q(
        hrdata[28]) );
  DFFSR \hrdata_reg[27]  ( .D(n794), .CLK(n54), .R(n53), .S(1'b1), .Q(
        hrdata[27]) );
  DFFSR \hrdata_reg[26]  ( .D(n792), .CLK(n54), .R(n53), .S(1'b1), .Q(
        hrdata[26]) );
  DFFSR \hrdata_reg[25]  ( .D(n790), .CLK(n54), .R(n53), .S(1'b1), .Q(
        hrdata[25]) );
  DFFSR \hrdata_reg[24]  ( .D(n788), .CLK(n54), .R(n53), .S(1'b1), .Q(
        hrdata[24]) );
  DFFSR \hrdata_reg[23]  ( .D(n786), .CLK(n54), .R(n52), .S(1'b1), .Q(
        hrdata[23]) );
  DFFSR \hrdata_reg[22]  ( .D(n784), .CLK(n54), .R(n52), .S(1'b1), .Q(
        hrdata[22]) );
  DFFSR \hrdata_reg[21]  ( .D(n782), .CLK(n54), .R(n52), .S(1'b1), .Q(
        hrdata[21]) );
  DFFSR \hrdata_reg[20]  ( .D(n780), .CLK(n54), .R(n52), .S(1'b1), .Q(
        hrdata[20]) );
  DFFSR \hrdata_reg[19]  ( .D(n778), .CLK(n54), .R(n52), .S(1'b1), .Q(
        hrdata[19]) );
  DFFSR \hrdata_reg[18]  ( .D(n776), .CLK(n54), .R(n52), .S(1'b1), .Q(
        hrdata[18]) );
  DFFSR \hrdata_reg[17]  ( .D(n774), .CLK(n54), .R(n52), .S(1'b1), .Q(
        hrdata[17]) );
  DFFSR \hrdata_reg[16]  ( .D(n772), .CLK(n54), .R(n52), .S(1'b1), .Q(
        hrdata[16]) );
  DFFSR \hrdata_reg[15]  ( .D(n770), .CLK(n54), .R(n53), .S(1'b1), .Q(
        hrdata[15]) );
  DFFSR \hrdata_reg[14]  ( .D(n768), .CLK(n54), .R(n52), .S(1'b1), .Q(
        hrdata[14]) );
  DFFSR \hrdata_reg[13]  ( .D(n766), .CLK(n54), .R(n53), .S(1'b1), .Q(
        hrdata[13]) );
  DFFSR \hrdata_reg[12]  ( .D(n764), .CLK(n54), .R(n52), .S(1'b1), .Q(
        hrdata[12]) );
  DFFSR \hrdata_reg[11]  ( .D(n762), .CLK(n54), .R(n52), .S(1'b1), .Q(
        hrdata[11]) );
  DFFSR \hrdata_reg[10]  ( .D(n760), .CLK(n54), .R(n52), .S(1'b1), .Q(
        hrdata[10]) );
  DFFSR \hrdata_reg[9]  ( .D(n758), .CLK(n54), .R(n52), .S(1'b1), .Q(hrdata[9]) );
  DFFSR \hrdata_reg[8]  ( .D(n756), .CLK(n54), .R(n52), .S(1'b1), .Q(hrdata[8]) );
  DFFSR \hrdata_reg[7]  ( .D(n754), .CLK(n54), .R(n52), .S(1'b1), .Q(hrdata[7]) );
  DFFSR \hrdata_reg[6]  ( .D(n752), .CLK(n54), .R(n52), .S(1'b1), .Q(hrdata[6]) );
  DFFSR \hrdata_reg[5]  ( .D(n750), .CLK(n54), .R(n52), .S(1'b1), .Q(hrdata[5]) );
  DFFSR \hrdata_reg[4]  ( .D(n748), .CLK(n54), .R(n52), .S(1'b1), .Q(hrdata[4]) );
  DFFSR \hrdata_reg[3]  ( .D(n746), .CLK(n54), .R(n52), .S(1'b1), .Q(hrdata[3]) );
  DFFSR \hrdata_reg[2]  ( .D(n744), .CLK(n54), .R(n52), .S(1'b1), .Q(hrdata[2]) );
  DFFSR \hrdata_reg[1]  ( .D(n742), .CLK(n54), .R(n52), .S(1'b1), .Q(hrdata[1]) );
  DFFSR \hrdata_reg[0]  ( .D(n740), .CLK(n54), .R(n52), .S(1'b1), .Q(hrdata[0]) );
  DFFSR \tx_data_reg[7]  ( .D(next_tx_data[7]), .CLK(n55), .R(n49), .S(1'b1), 
        .Q(tx_data[7]) );
  DFFSR \tx_data_reg[6]  ( .D(next_tx_data[6]), .CLK(n54), .R(n52), .S(1'b1), 
        .Q(tx_data[6]) );
  DFFSR \tx_data_reg[5]  ( .D(next_tx_data[5]), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(tx_data[5]) );
  DFFSR \tx_data_reg[4]  ( .D(next_tx_data[4]), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(tx_data[4]) );
  DFFSR \tx_data_reg[3]  ( .D(next_tx_data[3]), .CLK(n55), .R(n51), .S(1'b1), 
        .Q(tx_data[3]) );
  DFFSR \tx_data_reg[2]  ( .D(next_tx_data[2]), .CLK(n55), .R(n51), .S(1'b1), 
        .Q(tx_data[2]) );
  DFFSR \tx_data_reg[1]  ( .D(next_tx_data[1]), .CLK(n55), .R(n50), .S(1'b1), 
        .Q(tx_data[1]) );
  DFFSR \tx_data_reg[0]  ( .D(next_tx_data[0]), .CLK(n55), .R(n49), .S(1'b1), 
        .Q(tx_data[0]) );
  DFFSR \mem_reg[13][0]  ( .D(\next_mem[13][0] ), .CLK(n55), .R(n50), .S(1'b1), 
        .Q(n2454) );
  DFFSR \mem_reg[13][7]  ( .D(\next_mem[13][7] ), .CLK(n55), .R(n50), .S(1'b1), 
        .Q(\mem[13][7] ) );
  DFFSR \mem_reg[13][6]  ( .D(\next_mem[13][6] ), .CLK(n54), .R(n52), .S(1'b1), 
        .Q(\mem[13][6] ) );
  DFFSR \mem_reg[13][5]  ( .D(\next_mem[13][5] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[13][5] ) );
  DFFSR \mem_reg[13][4]  ( .D(\next_mem[13][4] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[13][4] ) );
  DFFSR \mem_reg[13][3]  ( .D(\next_mem[13][3] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[13][3] ) );
  DFFSR \mem_reg[13][2]  ( .D(\next_mem[13][2] ), .CLK(n55), .R(n51), .S(1'b1), 
        .Q(\mem[13][2] ) );
  DFFSR \mem_reg[13][1]  ( .D(\next_mem[13][1] ), .CLK(n55), .R(n50), .S(1'b1), 
        .Q(\mem[13][1] ) );
  DFFSR \mem_reg[12][7]  ( .D(\next_mem[12][7] ), .CLK(n55), .R(n49), .S(1'b1), 
        .Q(\mem[12][7] ) );
  DFFSR \mem_reg[12][6]  ( .D(\next_mem[12][6] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[12][6] ) );
  DFFSR \mem_reg[12][5]  ( .D(\next_mem[12][5] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[12][5] ) );
  DFFSR \mem_reg[12][4]  ( .D(\next_mem[12][4] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[12][4] ) );
  DFFSR \mem_reg[12][3]  ( .D(\next_mem[12][3] ), .CLK(n55), .R(n51), .S(1'b1), 
        .Q(\mem[12][3] ) );
  DFFSR \mem_reg[12][2]  ( .D(\next_mem[12][2] ), .CLK(n55), .R(n51), .S(1'b1), 
        .Q(\mem[12][2] ) );
  DFFSR \mem_reg[12][1]  ( .D(\next_mem[12][1] ), .CLK(n55), .R(n50), .S(1'b1), 
        .Q(\mem[12][1] ) );
  DFFSR \mem_reg[12][0]  ( .D(\next_mem[12][0] ), .CLK(n55), .R(n50), .S(1'b1), 
        .Q(\mem[12][0] ) );
  DFFSR \mem_reg[8][6]  ( .D(buffer_occupancy[6]), .CLK(n55), .R(n50), .S(1'b1), .Q(\mem[8][6] ) );
  DFFSR \mem_reg[8][5]  ( .D(buffer_occupancy[5]), .CLK(n55), .R(n50), .S(1'b1), .Q(\mem[8][5] ) );
  DFFSR \mem_reg[8][4]  ( .D(buffer_occupancy[4]), .CLK(n55), .R(n50), .S(1'b1), .Q(\mem[8][4] ) );
  DFFSR \mem_reg[8][3]  ( .D(buffer_occupancy[3]), .CLK(n55), .R(n50), .S(1'b1), .Q(\mem[8][3] ) );
  DFFSR \mem_reg[8][2]  ( .D(buffer_occupancy[2]), .CLK(n55), .R(n50), .S(1'b1), .Q(\mem[8][2] ) );
  DFFSR \mem_reg[8][1]  ( .D(buffer_occupancy[1]), .CLK(n55), .R(n50), .S(1'b1), .Q(\mem[8][1] ) );
  DFFSR \mem_reg[8][0]  ( .D(buffer_occupancy[0]), .CLK(n55), .R(n50), .S(1'b1), .Q(\mem[8][0] ) );
  DFFSR \mem_reg[7][0]  ( .D(tx_error), .CLK(n55), .R(n49), .S(1'b1), .Q(
        \mem[7][0] ) );
  DFFSR \mem_reg[6][0]  ( .D(rx_error), .CLK(n55), .R(n50), .S(1'b1), .Q(
        \mem[6][0] ) );
  DFFSR \mem_reg[5][1]  ( .D(tx_transfer_active), .CLK(n55), .R(n50), .S(1'b1), 
        .Q(\mem[5][1] ) );
  DFFSR \mem_reg[5][0]  ( .D(rx_transfer_active), .CLK(n55), .R(n50), .S(1'b1), 
        .Q(\mem[5][0] ) );
  DFFSR \mem_reg[4][5]  ( .D(n830), .CLK(n55), .R(n50), .S(1'b1), .Q(
        \mem[4][5] ) );
  DFFSR \mem_reg[4][4]  ( .D(n829), .CLK(n55), .R(n50), .S(1'b1), .Q(
        \mem[4][4] ) );
  DFFSR \mem_reg[4][3]  ( .D(n828), .CLK(n55), .R(n50), .S(1'b1), .Q(
        \mem[4][3] ) );
  DFFSR \mem_reg[4][2]  ( .D(n827), .CLK(n55), .R(n50), .S(1'b1), .Q(
        \mem[4][2] ) );
  DFFSR \mem_reg[4][1]  ( .D(n826), .CLK(n55), .R(n50), .S(1'b1), .Q(
        \mem[4][1] ) );
  DFFSR \mem_reg[4][0]  ( .D(rx_data_ready), .CLK(n55), .R(n50), .S(1'b1), .Q(
        \mem[4][0] ) );
  DFFSR \mem_reg[3][7]  ( .D(\next_mem[3][7] ), .CLK(n55), .R(n49), .S(1'b1), 
        .Q(\mem[3][7] ) );
  DFFSR \mem_reg[3][6]  ( .D(\next_mem[3][6] ), .CLK(n54), .R(n52), .S(1'b1), 
        .Q(\mem[3][6] ) );
  DFFSR \mem_reg[3][5]  ( .D(\next_mem[3][5] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[3][5] ) );
  DFFSR \mem_reg[3][4]  ( .D(\next_mem[3][4] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[3][4] ) );
  DFFSR \mem_reg[3][3]  ( .D(\next_mem[3][3] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[3][3] ) );
  DFFSR \mem_reg[3][2]  ( .D(\next_mem[3][2] ), .CLK(n55), .R(n51), .S(1'b1), 
        .Q(\mem[3][2] ) );
  DFFSR \mem_reg[3][1]  ( .D(\next_mem[3][1] ), .CLK(n55), .R(n50), .S(1'b1), 
        .Q(\mem[3][1] ) );
  DFFSR \mem_reg[3][0]  ( .D(\next_mem[3][0] ), .CLK(n55), .R(n50), .S(1'b1), 
        .Q(\mem[3][0] ) );
  DFFSR \mem_reg[2][7]  ( .D(\next_mem[2][7] ), .CLK(n55), .R(n49), .S(1'b1), 
        .Q(\mem[2][7] ) );
  DFFSR \mem_reg[2][6]  ( .D(\next_mem[2][6] ), .CLK(n54), .R(n52), .S(1'b1), 
        .Q(\mem[2][6] ) );
  DFFSR \mem_reg[2][5]  ( .D(\next_mem[2][5] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[2][5] ) );
  DFFSR \mem_reg[2][4]  ( .D(\next_mem[2][4] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[2][4] ) );
  DFFSR \mem_reg[2][3]  ( .D(\next_mem[2][3] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[2][3] ) );
  DFFSR \mem_reg[2][2]  ( .D(\next_mem[2][2] ), .CLK(n55), .R(n51), .S(1'b1), 
        .Q(\mem[2][2] ) );
  DFFSR \mem_reg[2][1]  ( .D(\next_mem[2][1] ), .CLK(n55), .R(n50), .S(1'b1), 
        .Q(\mem[2][1] ) );
  DFFSR \mem_reg[2][0]  ( .D(\next_mem[2][0] ), .CLK(n55), .R(n50), .S(1'b1), 
        .Q(\mem[2][0] ) );
  DFFSR \mem_reg[1][7]  ( .D(\next_mem[1][7] ), .CLK(n55), .R(n49), .S(1'b1), 
        .Q(\mem[1][7] ) );
  DFFSR \mem_reg[1][6]  ( .D(\next_mem[1][6] ), .CLK(n54), .R(n52), .S(1'b1), 
        .Q(\mem[1][6] ) );
  DFFSR \mem_reg[1][5]  ( .D(\next_mem[1][5] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[1][5] ) );
  DFFSR \mem_reg[1][4]  ( .D(\next_mem[1][4] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[1][4] ) );
  DFFSR \mem_reg[1][3]  ( .D(\next_mem[1][3] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[1][3] ) );
  DFFSR \mem_reg[1][2]  ( .D(\next_mem[1][2] ), .CLK(n55), .R(n51), .S(1'b1), 
        .Q(\mem[1][2] ) );
  DFFSR \mem_reg[1][1]  ( .D(\next_mem[1][1] ), .CLK(n55), .R(n50), .S(1'b1), 
        .Q(\mem[1][1] ) );
  DFFSR \mem_reg[1][0]  ( .D(\next_mem[1][0] ), .CLK(n55), .R(n50), .S(1'b1), 
        .Q(\mem[1][0] ) );
  DFFSR \mem_reg[0][7]  ( .D(\next_mem[0][7] ), .CLK(n54), .R(n52), .S(1'b1), 
        .Q(\mem[0][7] ) );
  DFFSR \mem_reg[0][6]  ( .D(\next_mem[0][6] ), .CLK(n54), .R(n52), .S(1'b1), 
        .Q(\mem[0][6] ) );
  DFFSR \mem_reg[0][5]  ( .D(\next_mem[0][5] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[0][5] ) );
  DFFSR \mem_reg[0][4]  ( .D(\next_mem[0][4] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[0][4] ) );
  DFFSR \mem_reg[0][3]  ( .D(\next_mem[0][3] ), .CLK(n54), .R(n51), .S(1'b1), 
        .Q(\mem[0][3] ) );
  DFFSR \mem_reg[0][2]  ( .D(\next_mem[0][2] ), .CLK(n55), .R(n51), .S(1'b1), 
        .Q(\mem[0][2] ) );
  DFFSR \mem_reg[0][1]  ( .D(\next_mem[0][1] ), .CLK(n55), .R(n50), .S(1'b1), 
        .Q(\mem[0][1] ) );
  DFFSR \mem_reg[0][0]  ( .D(\next_mem[0][0] ), .CLK(n54), .R(n52), .S(1'b1), 
        .Q(\mem[0][0] ) );
  hready_controller hrcu ( .clk(n54), .n_rst(n49), .hready(hready), .hresp(
        hresp), .regadd({N177, N176, N175, N174}), .store_tx_data(
        store_tx_data), .get_rx_data(get_rx_data), .hwrite(hwrite), .haddr({
        N181, N180, N179, N194}), .hsize(hsize), .hsel(N1747), .curr_addr({n32, 
        N184, N183, n31}), .htrans(htrans) );
  INVX2 U3 ( .A(N210), .Y(n501) );
  INVX2 U4 ( .A(N194), .Y(n2453) );
  AND2X2 U5 ( .A(n191), .B(n188), .Y(n1) );
  AND2X2 U6 ( .A(n341), .B(n338), .Y(n2) );
  AND2X2 U7 ( .A(n490), .B(n487), .Y(n3) );
  AND2X2 U8 ( .A(n640), .B(n637), .Y(n4) );
  AND2X2 U9 ( .A(n949), .B(n946), .Y(n5) );
  AND2X2 U10 ( .A(n1099), .B(n1096), .Y(n6) );
  AND2X2 U11 ( .A(n1249), .B(n1246), .Y(n7) );
  AND2X2 U12 ( .A(n1395), .B(n1392), .Y(n8) );
  AND2X2 U13 ( .A(n1541), .B(n1538), .Y(n9) );
  AND2X2 U14 ( .A(n1688), .B(n1685), .Y(n10) );
  AND2X2 U15 ( .A(n1835), .B(n1832), .Y(n11) );
  INVX1 U16 ( .A(n2454), .Y(n12) );
  INVX2 U17 ( .A(n12), .Y(clear) );
  BUFX2 U18 ( .A(\mem[12][7] ), .Y(n14) );
  BUFX2 U19 ( .A(\mem[12][4] ), .Y(n15) );
  BUFX2 U20 ( .A(\mem[12][6] ), .Y(n16) );
  BUFX2 U21 ( .A(\mem[12][3] ), .Y(n17) );
  BUFX2 U22 ( .A(n1681), .Y(n18) );
  INVX2 U23 ( .A(\mem[12][0] ), .Y(n2450) );
  BUFX2 U24 ( .A(n184), .Y(n19) );
  BUFX2 U25 ( .A(n1534), .Y(n20) );
  AND2X2 U26 ( .A(n661), .B(n2453), .Y(n942) );
  INVX2 U27 ( .A(n942), .Y(n21) );
  BUFX2 U28 ( .A(n483), .Y(n22) );
  BUFX2 U29 ( .A(n641), .Y(n23) );
  BUFX2 U30 ( .A(n1836), .Y(n24) );
  BUFX2 U31 ( .A(n1396), .Y(n25) );
  BUFX2 U32 ( .A(n1250), .Y(n26) );
  INVX2 U33 ( .A(N1747), .Y(n2240) );
  BUFX2 U34 ( .A(n1092), .Y(n27) );
  BUFX2 U35 ( .A(n1828), .Y(n28) );
  BUFX2 U36 ( .A(n334), .Y(n29) );
  AND2X2 U37 ( .A(n1121), .B(n2453), .Y(n1242) );
  INVX2 U38 ( .A(n1242), .Y(n30) );
  INVX1 U39 ( .A(n501), .Y(n31) );
  INVX2 U40 ( .A(n500), .Y(n32) );
  INVX1 U41 ( .A(N185), .Y(n500) );
  BUFX2 U42 ( .A(\mem[12][1] ), .Y(n33) );
  INVX2 U43 ( .A(n2018), .Y(n34) );
  BUFX2 U44 ( .A(n2058), .Y(n35) );
  INVX2 U45 ( .A(n2378), .Y(n2242) );
  AND2X2 U46 ( .A(n512), .B(n2453), .Y(n633) );
  INVX2 U47 ( .A(n633), .Y(n36) );
  AND2X2 U48 ( .A(n1267), .B(n501), .Y(n1388) );
  INVX2 U49 ( .A(n1388), .Y(n37) );
  BUFX2 U50 ( .A(n192), .Y(n38) );
  BUFX2 U51 ( .A(n1542), .Y(n39) );
  BUFX2 U52 ( .A(n950), .Y(n40) );
  BUFX2 U53 ( .A(n1689), .Y(n41) );
  BUFX2 U54 ( .A(n1100), .Y(n42) );
  BUFX2 U55 ( .A(n491), .Y(n43) );
  BUFX2 U56 ( .A(n342), .Y(n44) );
  INVX2 U57 ( .A(n1865), .Y(n2018) );
  INVX2 U58 ( .A(n1259), .Y(n45) );
  INVX1 U59 ( .A(N201), .Y(n1259) );
  INVX2 U60 ( .A(n1845), .Y(n46) );
  INVX1 U61 ( .A(N217), .Y(n1845) );
  INVX2 U62 ( .A(n1949), .Y(n47) );
  AND2X2 U63 ( .A(n1862), .B(n47), .Y(n1958) );
  INVX2 U64 ( .A(n2380), .Y(n2241) );
  BUFX2 U65 ( .A(n1866), .Y(n48) );
  BUFX2 U66 ( .A(n_rst), .Y(n53) );
  BUFX4 U67 ( .A(n_rst), .Y(n49) );
  BUFX4 U68 ( .A(n_rst), .Y(n50) );
  BUFX4 U69 ( .A(n_rst), .Y(n51) );
  BUFX4 U70 ( .A(n_rst), .Y(n52) );
  BUFX4 U71 ( .A(clk), .Y(n54) );
  BUFX4 U72 ( .A(clk), .Y(n55) );
  NOR2X1 U73 ( .A(n2059), .B(N176), .Y(n58) );
  NAND2X1 U74 ( .A(n58), .B(N174), .Y(n183) );
  NOR2X1 U75 ( .A(N175), .B(N176), .Y(n59) );
  NAND2X1 U76 ( .A(n59), .B(N174), .Y(n182) );
  NOR2X1 U77 ( .A(n202), .B(n2059), .Y(n62) );
  NAND2X1 U78 ( .A(N174), .B(n62), .Y(n185) );
  NOR2X1 U79 ( .A(n202), .B(N175), .Y(n63) );
  NAND2X1 U80 ( .A(n63), .B(N174), .Y(n184) );
  NOR2X1 U81 ( .A(n57), .B(n56), .Y(n75) );
  NAND2X1 U82 ( .A(n58), .B(n2013), .Y(n191) );
  NAND2X1 U83 ( .A(n59), .B(n2013), .Y(n188) );
  NOR2X1 U84 ( .A(\mem[8][0] ), .B(n188), .Y(n60) );
  NOR2X1 U85 ( .A(n201), .B(n60), .Y(n61) );
  NAND2X1 U86 ( .A(n62), .B(n2013), .Y(n193) );
  NAND2X1 U87 ( .A(n63), .B(n2013), .Y(n192) );
  NOR2X1 U88 ( .A(n65), .B(n64), .Y(n74) );
  OAI22X1 U89 ( .A(\mem[3][0] ), .B(n183), .C(\mem[1][0] ), .D(n182), .Y(n67)
         );
  OAI22X1 U90 ( .A(\mem[7][0] ), .B(n185), .C(\mem[5][0] ), .D(n19), .Y(n66)
         );
  NOR2X1 U91 ( .A(n67), .B(n66), .Y(n73) );
  NOR2X1 U92 ( .A(\mem[0][0] ), .B(n188), .Y(n68) );
  NOR2X1 U93 ( .A(N177), .B(n68), .Y(n69) );
  OAI21X1 U94 ( .A(\mem[2][0] ), .B(n191), .C(n69), .Y(n71) );
  OAI22X1 U95 ( .A(\mem[6][0] ), .B(n193), .C(\mem[4][0] ), .D(n38), .Y(n70)
         );
  NOR2X1 U96 ( .A(n71), .B(n70), .Y(n72) );
  AOI22X1 U97 ( .A(n75), .B(n74), .C(n73), .D(n72), .Y(n76) );
  NOR2X1 U98 ( .A(n57), .B(n77), .Y(n91) );
  NOR2X1 U99 ( .A(\mem[8][1] ), .B(n188), .Y(n78) );
  NOR2X1 U100 ( .A(n201), .B(n78), .Y(n79) );
  NOR2X1 U101 ( .A(n81), .B(n80), .Y(n90) );
  OAI22X1 U102 ( .A(\mem[3][1] ), .B(n183), .C(\mem[1][1] ), .D(n182), .Y(n83)
         );
  NOR2X1 U103 ( .A(n83), .B(n82), .Y(n89) );
  NOR2X1 U104 ( .A(\mem[0][1] ), .B(n188), .Y(n84) );
  NOR2X1 U105 ( .A(N177), .B(n84), .Y(n85) );
  OAI21X1 U106 ( .A(\mem[2][1] ), .B(n191), .C(n85), .Y(n87) );
  NOR2X1 U107 ( .A(n87), .B(n86), .Y(n88) );
  AOI22X1 U108 ( .A(n91), .B(n90), .C(n89), .D(n88), .Y(n92) );
  NOR2X1 U109 ( .A(n94), .B(n93), .Y(n108) );
  NOR2X1 U110 ( .A(\mem[8][2] ), .B(n188), .Y(n95) );
  NOR2X1 U111 ( .A(n201), .B(n95), .Y(n96) );
  NOR2X1 U112 ( .A(n98), .B(n97), .Y(n107) );
  OAI22X1 U113 ( .A(\mem[3][2] ), .B(n183), .C(\mem[1][2] ), .D(n182), .Y(n100) );
  NOR2X1 U114 ( .A(n100), .B(n99), .Y(n106) );
  NOR2X1 U115 ( .A(\mem[0][2] ), .B(n188), .Y(n101) );
  NOR2X1 U116 ( .A(N177), .B(n101), .Y(n102) );
  OAI21X1 U117 ( .A(\mem[2][2] ), .B(n191), .C(n102), .Y(n104) );
  NOR2X1 U118 ( .A(n104), .B(n103), .Y(n105) );
  AOI22X1 U119 ( .A(n108), .B(n107), .C(n106), .D(n105), .Y(n109) );
  NOR2X1 U120 ( .A(n111), .B(n110), .Y(n125) );
  NOR2X1 U121 ( .A(\mem[8][3] ), .B(n188), .Y(n112) );
  NOR2X1 U122 ( .A(n201), .B(n112), .Y(n113) );
  NOR2X1 U123 ( .A(n115), .B(n114), .Y(n124) );
  OAI22X1 U124 ( .A(\mem[3][3] ), .B(n183), .C(\mem[1][3] ), .D(n182), .Y(n117) );
  NOR2X1 U125 ( .A(n117), .B(n116), .Y(n123) );
  NOR2X1 U126 ( .A(\mem[0][3] ), .B(n188), .Y(n118) );
  NOR2X1 U127 ( .A(N177), .B(n118), .Y(n119) );
  OAI21X1 U128 ( .A(\mem[2][3] ), .B(n191), .C(n119), .Y(n121) );
  NOR2X1 U129 ( .A(n121), .B(n120), .Y(n122) );
  AOI22X1 U130 ( .A(n125), .B(n124), .C(n123), .D(n122), .Y(n126) );
  NOR2X1 U131 ( .A(n128), .B(n127), .Y(n142) );
  NOR2X1 U132 ( .A(\mem[8][4] ), .B(n188), .Y(n129) );
  NOR2X1 U133 ( .A(n201), .B(n129), .Y(n130) );
  NOR2X1 U134 ( .A(n132), .B(n131), .Y(n141) );
  OAI22X1 U135 ( .A(\mem[3][4] ), .B(n183), .C(\mem[1][4] ), .D(n182), .Y(n134) );
  NOR2X1 U136 ( .A(n134), .B(n133), .Y(n140) );
  NOR2X1 U137 ( .A(\mem[0][4] ), .B(n188), .Y(n135) );
  NOR2X1 U138 ( .A(N177), .B(n135), .Y(n136) );
  OAI21X1 U139 ( .A(\mem[2][4] ), .B(n191), .C(n136), .Y(n138) );
  NOR2X1 U140 ( .A(n138), .B(n137), .Y(n139) );
  AOI22X1 U141 ( .A(n142), .B(n141), .C(n140), .D(n139), .Y(n143) );
  NOR2X1 U142 ( .A(n145), .B(n144), .Y(n159) );
  NOR2X1 U143 ( .A(\mem[8][5] ), .B(n188), .Y(n146) );
  NOR2X1 U144 ( .A(n201), .B(n146), .Y(n147) );
  NOR2X1 U145 ( .A(n149), .B(n148), .Y(n158) );
  OAI22X1 U146 ( .A(\mem[3][5] ), .B(n183), .C(\mem[1][5] ), .D(n182), .Y(n151) );
  NOR2X1 U147 ( .A(n151), .B(n150), .Y(n157) );
  NOR2X1 U148 ( .A(\mem[0][5] ), .B(n188), .Y(n152) );
  NOR2X1 U149 ( .A(N177), .B(n152), .Y(n153) );
  OAI21X1 U150 ( .A(\mem[2][5] ), .B(n191), .C(n153), .Y(n155) );
  NOR2X1 U151 ( .A(n155), .B(n154), .Y(n156) );
  AOI22X1 U152 ( .A(n159), .B(n158), .C(n157), .D(n156), .Y(n160) );
  NOR2X1 U153 ( .A(n162), .B(n161), .Y(n176) );
  NOR2X1 U154 ( .A(\mem[8][6] ), .B(n188), .Y(n163) );
  NOR2X1 U155 ( .A(n201), .B(n163), .Y(n164) );
  NOR2X1 U156 ( .A(n166), .B(n165), .Y(n175) );
  OAI22X1 U157 ( .A(\mem[3][6] ), .B(n183), .C(\mem[1][6] ), .D(n182), .Y(n168) );
  NOR2X1 U158 ( .A(n168), .B(n167), .Y(n174) );
  NOR2X1 U159 ( .A(\mem[0][6] ), .B(n188), .Y(n169) );
  NOR2X1 U160 ( .A(N177), .B(n169), .Y(n170) );
  OAI21X1 U161 ( .A(\mem[2][6] ), .B(n191), .C(n170), .Y(n172) );
  NOR2X1 U162 ( .A(n172), .B(n171), .Y(n173) );
  AOI22X1 U163 ( .A(n176), .B(n175), .C(n174), .D(n173), .Y(n177) );
  NOR2X1 U164 ( .A(n179), .B(n178), .Y(n199) );
  OAI21X1 U165 ( .A(n14), .B(n38), .C(n1), .Y(n181) );
  NOR2X1 U166 ( .A(n181), .B(n180), .Y(n198) );
  OAI22X1 U167 ( .A(\mem[3][7] ), .B(n183), .C(\mem[1][7] ), .D(n182), .Y(n187) );
  NOR2X1 U168 ( .A(n187), .B(n186), .Y(n197) );
  NOR2X1 U169 ( .A(\mem[0][7] ), .B(n188), .Y(n189) );
  NOR2X1 U170 ( .A(N177), .B(n189), .Y(n190) );
  OAI21X1 U171 ( .A(\mem[2][7] ), .B(n191), .C(n190), .Y(n195) );
  NOR2X1 U172 ( .A(n195), .B(n194), .Y(n196) );
  AOI22X1 U173 ( .A(n199), .B(n198), .C(n197), .D(n196), .Y(n200) );
  NAND2X1 U174 ( .A(n185), .B(N177), .Y(n178) );
  OAI21X1 U175 ( .A(\mem[13][6] ), .B(n19), .C(n185), .Y(n161) );
  OAI21X1 U176 ( .A(\mem[13][5] ), .B(n19), .C(n185), .Y(n144) );
  OAI21X1 U177 ( .A(\mem[13][4] ), .B(n19), .C(n185), .Y(n127) );
  OAI21X1 U178 ( .A(\mem[13][3] ), .B(n19), .C(n185), .Y(n110) );
  OAI21X1 U179 ( .A(\mem[13][2] ), .B(n19), .C(n185), .Y(n93) );
  OAI21X1 U180 ( .A(\mem[13][1] ), .B(n19), .C(n185), .Y(n77) );
  OAI21X1 U181 ( .A(clear), .B(n19), .C(n185), .Y(n56) );
  NAND2X1 U182 ( .A(n182), .B(n193), .Y(n180) );
  OAI21X1 U183 ( .A(n16), .B(n38), .C(n193), .Y(n165) );
  OAI21X1 U184 ( .A(n203), .B(n38), .C(n193), .Y(n148) );
  OAI21X1 U185 ( .A(n15), .B(n38), .C(n193), .Y(n131) );
  OAI21X1 U186 ( .A(n17), .B(n38), .C(n193), .Y(n114) );
  OAI21X1 U187 ( .A(n204), .B(n38), .C(n193), .Y(n97) );
  OAI21X1 U188 ( .A(n33), .B(n38), .C(n193), .Y(n80) );
  OAI21X1 U189 ( .A(n205), .B(n38), .C(n193), .Y(n64) );
  OAI21X1 U190 ( .A(\mem[13][7] ), .B(n19), .C(n183), .Y(n179) );
  NAND2X1 U191 ( .A(n183), .B(n182), .Y(n162) );
  NAND2X1 U192 ( .A(n183), .B(n182), .Y(n145) );
  NAND2X1 U193 ( .A(n183), .B(n182), .Y(n128) );
  NAND2X1 U194 ( .A(n183), .B(n182), .Y(n111) );
  NAND2X1 U195 ( .A(n183), .B(n182), .Y(n94) );
  NAND2X1 U196 ( .A(n183), .B(n182), .Y(n57) );
  NAND2X1 U197 ( .A(n191), .B(n164), .Y(n166) );
  NAND2X1 U198 ( .A(n191), .B(n147), .Y(n149) );
  NAND2X1 U199 ( .A(n191), .B(n130), .Y(n132) );
  NAND2X1 U200 ( .A(n191), .B(n113), .Y(n115) );
  NAND2X1 U201 ( .A(n191), .B(n96), .Y(n98) );
  NAND2X1 U202 ( .A(n191), .B(n79), .Y(n81) );
  NAND2X1 U203 ( .A(n191), .B(n61), .Y(n65) );
  NAND2X1 U204 ( .A(n185), .B(n19), .Y(n186) );
  NAND2X1 U205 ( .A(n185), .B(n19), .Y(n167) );
  NAND2X1 U206 ( .A(n185), .B(n19), .Y(n150) );
  NAND2X1 U207 ( .A(n185), .B(n19), .Y(n133) );
  NAND2X1 U208 ( .A(n185), .B(n19), .Y(n116) );
  NAND2X1 U209 ( .A(n185), .B(n19), .Y(n99) );
  OAI21X1 U210 ( .A(\mem[5][1] ), .B(n19), .C(n185), .Y(n82) );
  NAND2X1 U211 ( .A(n193), .B(n38), .Y(n194) );
  NAND2X1 U212 ( .A(n193), .B(n38), .Y(n171) );
  OAI21X1 U213 ( .A(\mem[4][5] ), .B(n38), .C(n193), .Y(n154) );
  OAI21X1 U214 ( .A(\mem[4][4] ), .B(n38), .C(n193), .Y(n137) );
  OAI21X1 U215 ( .A(\mem[4][3] ), .B(n38), .C(n193), .Y(n120) );
  OAI21X1 U216 ( .A(\mem[4][2] ), .B(n38), .C(n193), .Y(n103) );
  OAI21X1 U217 ( .A(\mem[4][1] ), .B(n38), .C(n193), .Y(n86) );
  INVX2 U218 ( .A(N177), .Y(n201) );
  INVX2 U219 ( .A(N176), .Y(n202) );
  INVX2 U220 ( .A(n76), .Y(N261) );
  INVX2 U221 ( .A(n200), .Y(N254) );
  INVX2 U222 ( .A(n177), .Y(N255) );
  INVX2 U223 ( .A(n160), .Y(N256) );
  INVX2 U224 ( .A(n143), .Y(N257) );
  INVX2 U225 ( .A(n126), .Y(N258) );
  INVX2 U226 ( .A(n109), .Y(N259) );
  INVX2 U227 ( .A(n92), .Y(N260) );
  INVX2 U228 ( .A(n2448), .Y(n203) );
  INVX2 U229 ( .A(n2449), .Y(n204) );
  INVX2 U230 ( .A(n2450), .Y(n205) );
  NOR2X1 U231 ( .A(n2452), .B(N180), .Y(n208) );
  NAND2X1 U232 ( .A(n208), .B(N194), .Y(n333) );
  NOR2X1 U233 ( .A(N179), .B(N180), .Y(n209) );
  NAND2X1 U234 ( .A(n209), .B(N194), .Y(n332) );
  NOR2X1 U235 ( .A(n2415), .B(n2452), .Y(n212) );
  NAND2X1 U236 ( .A(N194), .B(n212), .Y(n335) );
  NOR2X1 U237 ( .A(n2415), .B(N179), .Y(n213) );
  NAND2X1 U238 ( .A(n213), .B(N194), .Y(n334) );
  NOR2X1 U239 ( .A(n207), .B(n206), .Y(n225) );
  NAND2X1 U240 ( .A(n208), .B(n2453), .Y(n341) );
  NAND2X1 U241 ( .A(n209), .B(n2453), .Y(n338) );
  NOR2X1 U242 ( .A(\mem[8][0] ), .B(n338), .Y(n210) );
  NOR2X1 U243 ( .A(n351), .B(n210), .Y(n211) );
  NAND2X1 U244 ( .A(n212), .B(n2453), .Y(n343) );
  NAND2X1 U245 ( .A(n213), .B(n2453), .Y(n342) );
  NOR2X1 U246 ( .A(n215), .B(n214), .Y(n224) );
  OAI22X1 U247 ( .A(\mem[3][0] ), .B(n333), .C(\mem[1][0] ), .D(n332), .Y(n217) );
  OAI22X1 U248 ( .A(\mem[7][0] ), .B(n335), .C(\mem[5][0] ), .D(n29), .Y(n216)
         );
  NOR2X1 U249 ( .A(n217), .B(n216), .Y(n223) );
  NOR2X1 U250 ( .A(\mem[0][0] ), .B(n338), .Y(n218) );
  NOR2X1 U251 ( .A(N181), .B(n218), .Y(n219) );
  OAI21X1 U252 ( .A(\mem[2][0] ), .B(n341), .C(n219), .Y(n221) );
  OAI22X1 U253 ( .A(\mem[6][0] ), .B(n343), .C(\mem[4][0] ), .D(n44), .Y(n220)
         );
  NOR2X1 U254 ( .A(n221), .B(n220), .Y(n222) );
  AOI22X1 U255 ( .A(n225), .B(n224), .C(n223), .D(n222), .Y(n226) );
  NOR2X1 U256 ( .A(n207), .B(n227), .Y(n241) );
  NOR2X1 U257 ( .A(\mem[8][1] ), .B(n338), .Y(n228) );
  NOR2X1 U258 ( .A(n351), .B(n228), .Y(n229) );
  NOR2X1 U259 ( .A(n231), .B(n230), .Y(n240) );
  OAI22X1 U260 ( .A(\mem[3][1] ), .B(n333), .C(\mem[1][1] ), .D(n332), .Y(n233) );
  NOR2X1 U261 ( .A(n233), .B(n232), .Y(n239) );
  NOR2X1 U262 ( .A(\mem[0][1] ), .B(n338), .Y(n234) );
  NOR2X1 U263 ( .A(N181), .B(n234), .Y(n235) );
  OAI21X1 U264 ( .A(\mem[2][1] ), .B(n341), .C(n235), .Y(n237) );
  NOR2X1 U265 ( .A(n237), .B(n236), .Y(n238) );
  AOI22X1 U266 ( .A(n241), .B(n240), .C(n239), .D(n238), .Y(n242) );
  NOR2X1 U267 ( .A(n244), .B(n243), .Y(n258) );
  NOR2X1 U268 ( .A(\mem[8][2] ), .B(n338), .Y(n245) );
  NOR2X1 U269 ( .A(n351), .B(n245), .Y(n246) );
  NOR2X1 U270 ( .A(n248), .B(n247), .Y(n257) );
  OAI22X1 U271 ( .A(\mem[3][2] ), .B(n333), .C(\mem[1][2] ), .D(n332), .Y(n250) );
  NOR2X1 U272 ( .A(n250), .B(n249), .Y(n256) );
  NOR2X1 U273 ( .A(\mem[0][2] ), .B(n338), .Y(n251) );
  NOR2X1 U274 ( .A(N181), .B(n251), .Y(n252) );
  OAI21X1 U275 ( .A(\mem[2][2] ), .B(n341), .C(n252), .Y(n254) );
  NOR2X1 U276 ( .A(n254), .B(n253), .Y(n255) );
  AOI22X1 U277 ( .A(n258), .B(n257), .C(n256), .D(n255), .Y(n259) );
  NOR2X1 U278 ( .A(n261), .B(n260), .Y(n275) );
  NOR2X1 U279 ( .A(\mem[8][3] ), .B(n338), .Y(n262) );
  NOR2X1 U280 ( .A(n351), .B(n262), .Y(n263) );
  NOR2X1 U281 ( .A(n265), .B(n264), .Y(n274) );
  OAI22X1 U282 ( .A(\mem[3][3] ), .B(n333), .C(\mem[1][3] ), .D(n332), .Y(n267) );
  NOR2X1 U283 ( .A(n267), .B(n266), .Y(n273) );
  NOR2X1 U284 ( .A(\mem[0][3] ), .B(n338), .Y(n268) );
  NOR2X1 U285 ( .A(N181), .B(n268), .Y(n269) );
  OAI21X1 U286 ( .A(\mem[2][3] ), .B(n341), .C(n269), .Y(n271) );
  NOR2X1 U287 ( .A(n271), .B(n270), .Y(n272) );
  AOI22X1 U288 ( .A(n275), .B(n274), .C(n273), .D(n272), .Y(n276) );
  NOR2X1 U289 ( .A(n278), .B(n277), .Y(n292) );
  NOR2X1 U290 ( .A(\mem[8][4] ), .B(n338), .Y(n279) );
  NOR2X1 U291 ( .A(n351), .B(n279), .Y(n280) );
  NOR2X1 U292 ( .A(n282), .B(n281), .Y(n291) );
  OAI22X1 U293 ( .A(\mem[3][4] ), .B(n333), .C(\mem[1][4] ), .D(n332), .Y(n284) );
  NOR2X1 U294 ( .A(n284), .B(n283), .Y(n290) );
  NOR2X1 U295 ( .A(\mem[0][4] ), .B(n338), .Y(n285) );
  NOR2X1 U296 ( .A(N181), .B(n285), .Y(n286) );
  OAI21X1 U297 ( .A(\mem[2][4] ), .B(n341), .C(n286), .Y(n288) );
  NOR2X1 U298 ( .A(n288), .B(n287), .Y(n289) );
  AOI22X1 U299 ( .A(n292), .B(n291), .C(n290), .D(n289), .Y(n293) );
  NOR2X1 U300 ( .A(n295), .B(n294), .Y(n309) );
  NOR2X1 U301 ( .A(\mem[8][5] ), .B(n338), .Y(n296) );
  NOR2X1 U302 ( .A(n351), .B(n296), .Y(n297) );
  NOR2X1 U303 ( .A(n299), .B(n298), .Y(n308) );
  OAI22X1 U304 ( .A(\mem[3][5] ), .B(n333), .C(\mem[1][5] ), .D(n332), .Y(n301) );
  NOR2X1 U305 ( .A(n301), .B(n300), .Y(n307) );
  NOR2X1 U306 ( .A(\mem[0][5] ), .B(n338), .Y(n302) );
  NOR2X1 U307 ( .A(N181), .B(n302), .Y(n303) );
  OAI21X1 U308 ( .A(\mem[2][5] ), .B(n341), .C(n303), .Y(n305) );
  NOR2X1 U309 ( .A(n305), .B(n304), .Y(n306) );
  AOI22X1 U310 ( .A(n309), .B(n308), .C(n307), .D(n306), .Y(n310) );
  NOR2X1 U311 ( .A(n312), .B(n311), .Y(n326) );
  NOR2X1 U312 ( .A(\mem[8][6] ), .B(n338), .Y(n313) );
  NOR2X1 U313 ( .A(n351), .B(n313), .Y(n314) );
  NOR2X1 U314 ( .A(n316), .B(n315), .Y(n325) );
  OAI22X1 U315 ( .A(\mem[3][6] ), .B(n333), .C(\mem[1][6] ), .D(n332), .Y(n318) );
  NOR2X1 U316 ( .A(n318), .B(n317), .Y(n324) );
  NOR2X1 U317 ( .A(\mem[0][6] ), .B(n338), .Y(n319) );
  NOR2X1 U318 ( .A(N181), .B(n319), .Y(n320) );
  OAI21X1 U319 ( .A(\mem[2][6] ), .B(n341), .C(n320), .Y(n322) );
  NOR2X1 U320 ( .A(n322), .B(n321), .Y(n323) );
  AOI22X1 U321 ( .A(n326), .B(n325), .C(n324), .D(n323), .Y(n327) );
  NOR2X1 U322 ( .A(n329), .B(n328), .Y(n349) );
  OAI21X1 U323 ( .A(n14), .B(n44), .C(n2), .Y(n331) );
  NOR2X1 U324 ( .A(n331), .B(n330), .Y(n348) );
  OAI22X1 U325 ( .A(\mem[3][7] ), .B(n333), .C(\mem[1][7] ), .D(n332), .Y(n337) );
  NOR2X1 U326 ( .A(n337), .B(n336), .Y(n347) );
  NOR2X1 U327 ( .A(\mem[0][7] ), .B(n338), .Y(n339) );
  NOR2X1 U328 ( .A(N181), .B(n339), .Y(n340) );
  OAI21X1 U329 ( .A(\mem[2][7] ), .B(n341), .C(n340), .Y(n345) );
  NOR2X1 U330 ( .A(n345), .B(n344), .Y(n346) );
  AOI22X1 U331 ( .A(n349), .B(n348), .C(n347), .D(n346), .Y(n350) );
  NAND2X1 U332 ( .A(n335), .B(N181), .Y(n328) );
  OAI21X1 U333 ( .A(\mem[13][6] ), .B(n29), .C(n335), .Y(n311) );
  OAI21X1 U334 ( .A(\mem[13][5] ), .B(n29), .C(n335), .Y(n294) );
  OAI21X1 U335 ( .A(\mem[13][4] ), .B(n29), .C(n335), .Y(n277) );
  OAI21X1 U336 ( .A(\mem[13][3] ), .B(n29), .C(n335), .Y(n260) );
  OAI21X1 U337 ( .A(\mem[13][2] ), .B(n29), .C(n335), .Y(n243) );
  OAI21X1 U338 ( .A(\mem[13][1] ), .B(n29), .C(n335), .Y(n227) );
  OAI21X1 U339 ( .A(clear), .B(n29), .C(n335), .Y(n206) );
  NAND2X1 U340 ( .A(n332), .B(n343), .Y(n330) );
  OAI21X1 U341 ( .A(n16), .B(n44), .C(n343), .Y(n315) );
  OAI21X1 U342 ( .A(n352), .B(n44), .C(n343), .Y(n298) );
  OAI21X1 U343 ( .A(n15), .B(n44), .C(n343), .Y(n281) );
  OAI21X1 U344 ( .A(n17), .B(n44), .C(n343), .Y(n264) );
  OAI21X1 U345 ( .A(n353), .B(n44), .C(n343), .Y(n247) );
  OAI21X1 U346 ( .A(n33), .B(n44), .C(n343), .Y(n230) );
  OAI21X1 U347 ( .A(n354), .B(n44), .C(n343), .Y(n214) );
  OAI21X1 U348 ( .A(\mem[13][7] ), .B(n29), .C(n333), .Y(n329) );
  NAND2X1 U349 ( .A(n333), .B(n332), .Y(n312) );
  NAND2X1 U350 ( .A(n333), .B(n332), .Y(n295) );
  NAND2X1 U351 ( .A(n333), .B(n332), .Y(n278) );
  NAND2X1 U352 ( .A(n333), .B(n332), .Y(n261) );
  NAND2X1 U353 ( .A(n333), .B(n332), .Y(n244) );
  NAND2X1 U354 ( .A(n333), .B(n332), .Y(n207) );
  NAND2X1 U355 ( .A(n341), .B(n314), .Y(n316) );
  NAND2X1 U356 ( .A(n341), .B(n297), .Y(n299) );
  NAND2X1 U357 ( .A(n341), .B(n280), .Y(n282) );
  NAND2X1 U358 ( .A(n341), .B(n263), .Y(n265) );
  NAND2X1 U359 ( .A(n341), .B(n246), .Y(n248) );
  NAND2X1 U360 ( .A(n341), .B(n229), .Y(n231) );
  NAND2X1 U361 ( .A(n341), .B(n211), .Y(n215) );
  NAND2X1 U362 ( .A(n335), .B(n29), .Y(n336) );
  NAND2X1 U363 ( .A(n335), .B(n29), .Y(n317) );
  NAND2X1 U364 ( .A(n335), .B(n29), .Y(n300) );
  NAND2X1 U365 ( .A(n335), .B(n29), .Y(n283) );
  NAND2X1 U366 ( .A(n335), .B(n29), .Y(n266) );
  NAND2X1 U367 ( .A(n335), .B(n29), .Y(n249) );
  OAI21X1 U368 ( .A(\mem[5][1] ), .B(n29), .C(n335), .Y(n232) );
  NAND2X1 U369 ( .A(n343), .B(n44), .Y(n344) );
  NAND2X1 U370 ( .A(n343), .B(n44), .Y(n321) );
  OAI21X1 U371 ( .A(\mem[4][5] ), .B(n44), .C(n343), .Y(n304) );
  OAI21X1 U372 ( .A(\mem[4][4] ), .B(n44), .C(n343), .Y(n287) );
  OAI21X1 U373 ( .A(\mem[4][3] ), .B(n44), .C(n343), .Y(n270) );
  OAI21X1 U374 ( .A(\mem[4][2] ), .B(n44), .C(n343), .Y(n253) );
  OAI21X1 U375 ( .A(\mem[4][1] ), .B(n44), .C(n343), .Y(n236) );
  INVX2 U376 ( .A(N181), .Y(n351) );
  INVX2 U377 ( .A(n242), .Y(N271) );
  INVX2 U378 ( .A(n259), .Y(N270) );
  INVX2 U379 ( .A(n276), .Y(N269) );
  INVX2 U380 ( .A(n293), .Y(N268) );
  INVX2 U381 ( .A(n310), .Y(N267) );
  INVX2 U382 ( .A(n327), .Y(N266) );
  INVX2 U383 ( .A(n350), .Y(N265) );
  INVX2 U384 ( .A(n226), .Y(N272) );
  INVX2 U385 ( .A(n2448), .Y(n352) );
  INVX2 U386 ( .A(n2449), .Y(n353) );
  INVX2 U387 ( .A(n2450), .Y(n354) );
  NOR2X1 U388 ( .A(n2447), .B(N184), .Y(n357) );
  NAND2X1 U389 ( .A(n357), .B(N210), .Y(n482) );
  NOR2X1 U390 ( .A(N183), .B(N184), .Y(n358) );
  NAND2X1 U391 ( .A(n358), .B(N210), .Y(n481) );
  NOR2X1 U392 ( .A(n2419), .B(n2447), .Y(n361) );
  NAND2X1 U393 ( .A(N210), .B(n361), .Y(n484) );
  NOR2X1 U394 ( .A(n2419), .B(N183), .Y(n362) );
  NAND2X1 U395 ( .A(n362), .B(N210), .Y(n483) );
  NOR2X1 U396 ( .A(n356), .B(n355), .Y(n374) );
  NAND2X1 U397 ( .A(n357), .B(n501), .Y(n490) );
  NAND2X1 U398 ( .A(n358), .B(n501), .Y(n487) );
  NOR2X1 U399 ( .A(\mem[8][0] ), .B(n487), .Y(n359) );
  NOR2X1 U400 ( .A(n500), .B(n359), .Y(n360) );
  NAND2X1 U401 ( .A(n361), .B(n501), .Y(n492) );
  NAND2X1 U402 ( .A(n362), .B(n501), .Y(n491) );
  NOR2X1 U403 ( .A(n364), .B(n363), .Y(n373) );
  OAI22X1 U404 ( .A(\mem[3][0] ), .B(n482), .C(\mem[1][0] ), .D(n481), .Y(n366) );
  OAI22X1 U405 ( .A(\mem[7][0] ), .B(n484), .C(\mem[5][0] ), .D(n22), .Y(n365)
         );
  NOR2X1 U406 ( .A(n366), .B(n365), .Y(n372) );
  NOR2X1 U407 ( .A(\mem[0][0] ), .B(n487), .Y(n367) );
  NOR2X1 U408 ( .A(N185), .B(n367), .Y(n368) );
  OAI21X1 U409 ( .A(\mem[2][0] ), .B(n490), .C(n368), .Y(n370) );
  OAI22X1 U410 ( .A(\mem[6][0] ), .B(n492), .C(\mem[4][0] ), .D(n43), .Y(n369)
         );
  NOR2X1 U411 ( .A(n370), .B(n369), .Y(n371) );
  AOI22X1 U412 ( .A(n374), .B(n373), .C(n372), .D(n371), .Y(n375) );
  NOR2X1 U413 ( .A(n356), .B(n376), .Y(n390) );
  NOR2X1 U414 ( .A(\mem[8][1] ), .B(n487), .Y(n377) );
  NOR2X1 U415 ( .A(n500), .B(n377), .Y(n378) );
  NOR2X1 U416 ( .A(n380), .B(n379), .Y(n389) );
  OAI22X1 U417 ( .A(\mem[3][1] ), .B(n482), .C(\mem[1][1] ), .D(n481), .Y(n382) );
  NOR2X1 U418 ( .A(n382), .B(n381), .Y(n388) );
  NOR2X1 U419 ( .A(\mem[0][1] ), .B(n487), .Y(n383) );
  NOR2X1 U420 ( .A(N185), .B(n383), .Y(n384) );
  OAI21X1 U421 ( .A(\mem[2][1] ), .B(n490), .C(n384), .Y(n386) );
  NOR2X1 U422 ( .A(n386), .B(n385), .Y(n387) );
  AOI22X1 U423 ( .A(n390), .B(n389), .C(n388), .D(n387), .Y(n391) );
  NOR2X1 U424 ( .A(n393), .B(n392), .Y(n407) );
  NOR2X1 U425 ( .A(\mem[8][2] ), .B(n487), .Y(n394) );
  NOR2X1 U426 ( .A(n500), .B(n394), .Y(n395) );
  NOR2X1 U427 ( .A(n397), .B(n396), .Y(n406) );
  OAI22X1 U428 ( .A(\mem[3][2] ), .B(n482), .C(\mem[1][2] ), .D(n481), .Y(n399) );
  NOR2X1 U429 ( .A(n399), .B(n398), .Y(n405) );
  NOR2X1 U430 ( .A(\mem[0][2] ), .B(n487), .Y(n400) );
  NOR2X1 U431 ( .A(N185), .B(n400), .Y(n401) );
  OAI21X1 U432 ( .A(\mem[2][2] ), .B(n490), .C(n401), .Y(n403) );
  NOR2X1 U433 ( .A(n403), .B(n402), .Y(n404) );
  AOI22X1 U434 ( .A(n407), .B(n406), .C(n405), .D(n404), .Y(n408) );
  NOR2X1 U435 ( .A(n410), .B(n409), .Y(n424) );
  NOR2X1 U436 ( .A(\mem[8][3] ), .B(n487), .Y(n411) );
  NOR2X1 U437 ( .A(n500), .B(n411), .Y(n412) );
  NOR2X1 U438 ( .A(n414), .B(n413), .Y(n423) );
  OAI22X1 U439 ( .A(\mem[3][3] ), .B(n482), .C(\mem[1][3] ), .D(n481), .Y(n416) );
  NOR2X1 U440 ( .A(n416), .B(n415), .Y(n422) );
  NOR2X1 U441 ( .A(\mem[0][3] ), .B(n487), .Y(n417) );
  NOR2X1 U442 ( .A(N185), .B(n417), .Y(n418) );
  OAI21X1 U443 ( .A(\mem[2][3] ), .B(n490), .C(n418), .Y(n420) );
  NOR2X1 U444 ( .A(n420), .B(n419), .Y(n421) );
  AOI22X1 U445 ( .A(n424), .B(n423), .C(n422), .D(n421), .Y(n425) );
  NOR2X1 U446 ( .A(n427), .B(n426), .Y(n441) );
  NOR2X1 U447 ( .A(\mem[8][4] ), .B(n487), .Y(n428) );
  NOR2X1 U448 ( .A(n500), .B(n428), .Y(n429) );
  NOR2X1 U449 ( .A(n431), .B(n430), .Y(n440) );
  OAI22X1 U450 ( .A(\mem[3][4] ), .B(n482), .C(\mem[1][4] ), .D(n481), .Y(n433) );
  NOR2X1 U451 ( .A(n433), .B(n432), .Y(n439) );
  NOR2X1 U452 ( .A(\mem[0][4] ), .B(n487), .Y(n434) );
  NOR2X1 U453 ( .A(N185), .B(n434), .Y(n435) );
  OAI21X1 U454 ( .A(\mem[2][4] ), .B(n490), .C(n435), .Y(n437) );
  NOR2X1 U455 ( .A(n437), .B(n436), .Y(n438) );
  AOI22X1 U456 ( .A(n441), .B(n440), .C(n439), .D(n438), .Y(n442) );
  NOR2X1 U457 ( .A(n444), .B(n443), .Y(n458) );
  NOR2X1 U458 ( .A(\mem[8][5] ), .B(n487), .Y(n445) );
  NOR2X1 U459 ( .A(n500), .B(n445), .Y(n446) );
  NOR2X1 U460 ( .A(n448), .B(n447), .Y(n457) );
  OAI22X1 U461 ( .A(\mem[3][5] ), .B(n482), .C(\mem[1][5] ), .D(n481), .Y(n450) );
  NOR2X1 U462 ( .A(n450), .B(n449), .Y(n456) );
  NOR2X1 U463 ( .A(\mem[0][5] ), .B(n487), .Y(n451) );
  NOR2X1 U464 ( .A(N185), .B(n451), .Y(n452) );
  OAI21X1 U465 ( .A(\mem[2][5] ), .B(n490), .C(n452), .Y(n454) );
  NOR2X1 U466 ( .A(n454), .B(n453), .Y(n455) );
  AOI22X1 U467 ( .A(n458), .B(n457), .C(n456), .D(n455), .Y(n459) );
  NOR2X1 U468 ( .A(n461), .B(n460), .Y(n475) );
  NOR2X1 U469 ( .A(\mem[8][6] ), .B(n487), .Y(n462) );
  NOR2X1 U470 ( .A(n500), .B(n462), .Y(n463) );
  NOR2X1 U471 ( .A(n465), .B(n464), .Y(n474) );
  OAI22X1 U472 ( .A(\mem[3][6] ), .B(n482), .C(\mem[1][6] ), .D(n481), .Y(n467) );
  NOR2X1 U473 ( .A(n467), .B(n466), .Y(n473) );
  NOR2X1 U474 ( .A(\mem[0][6] ), .B(n487), .Y(n468) );
  NOR2X1 U475 ( .A(N185), .B(n468), .Y(n469) );
  OAI21X1 U476 ( .A(\mem[2][6] ), .B(n490), .C(n469), .Y(n471) );
  NOR2X1 U477 ( .A(n471), .B(n470), .Y(n472) );
  AOI22X1 U478 ( .A(n475), .B(n474), .C(n473), .D(n472), .Y(n476) );
  NOR2X1 U479 ( .A(n478), .B(n477), .Y(n498) );
  OAI21X1 U480 ( .A(n14), .B(n43), .C(n3), .Y(n480) );
  NOR2X1 U481 ( .A(n480), .B(n479), .Y(n497) );
  OAI22X1 U482 ( .A(\mem[3][7] ), .B(n482), .C(\mem[1][7] ), .D(n481), .Y(n486) );
  NOR2X1 U483 ( .A(n486), .B(n485), .Y(n496) );
  NOR2X1 U484 ( .A(\mem[0][7] ), .B(n487), .Y(n488) );
  NOR2X1 U485 ( .A(N185), .B(n488), .Y(n489) );
  OAI21X1 U486 ( .A(\mem[2][7] ), .B(n490), .C(n489), .Y(n494) );
  NOR2X1 U487 ( .A(n494), .B(n493), .Y(n495) );
  AOI22X1 U488 ( .A(n498), .B(n497), .C(n496), .D(n495), .Y(n499) );
  NAND2X1 U489 ( .A(n484), .B(N185), .Y(n477) );
  OAI21X1 U490 ( .A(\mem[13][6] ), .B(n22), .C(n484), .Y(n460) );
  OAI21X1 U491 ( .A(\mem[13][5] ), .B(n22), .C(n484), .Y(n443) );
  OAI21X1 U492 ( .A(\mem[13][4] ), .B(n22), .C(n484), .Y(n426) );
  OAI21X1 U493 ( .A(\mem[13][3] ), .B(n22), .C(n484), .Y(n409) );
  OAI21X1 U494 ( .A(\mem[13][2] ), .B(n22), .C(n484), .Y(n392) );
  OAI21X1 U495 ( .A(\mem[13][1] ), .B(n22), .C(n484), .Y(n376) );
  OAI21X1 U496 ( .A(clear), .B(n22), .C(n484), .Y(n355) );
  NAND2X1 U497 ( .A(n481), .B(n492), .Y(n479) );
  OAI21X1 U498 ( .A(n16), .B(n43), .C(n492), .Y(n464) );
  OAI21X1 U499 ( .A(n502), .B(n43), .C(n492), .Y(n447) );
  OAI21X1 U500 ( .A(n15), .B(n43), .C(n492), .Y(n430) );
  OAI21X1 U501 ( .A(n17), .B(n43), .C(n492), .Y(n413) );
  OAI21X1 U502 ( .A(n503), .B(n43), .C(n492), .Y(n396) );
  OAI21X1 U503 ( .A(n33), .B(n43), .C(n492), .Y(n379) );
  OAI21X1 U504 ( .A(n504), .B(n43), .C(n492), .Y(n363) );
  OAI21X1 U505 ( .A(\mem[13][7] ), .B(n22), .C(n482), .Y(n478) );
  NAND2X1 U506 ( .A(n482), .B(n481), .Y(n461) );
  NAND2X1 U507 ( .A(n482), .B(n481), .Y(n444) );
  NAND2X1 U508 ( .A(n482), .B(n481), .Y(n427) );
  NAND2X1 U509 ( .A(n482), .B(n481), .Y(n410) );
  NAND2X1 U510 ( .A(n482), .B(n481), .Y(n393) );
  NAND2X1 U511 ( .A(n482), .B(n481), .Y(n356) );
  NAND2X1 U512 ( .A(n490), .B(n463), .Y(n465) );
  NAND2X1 U513 ( .A(n490), .B(n446), .Y(n448) );
  NAND2X1 U514 ( .A(n490), .B(n429), .Y(n431) );
  NAND2X1 U515 ( .A(n490), .B(n412), .Y(n414) );
  NAND2X1 U516 ( .A(n490), .B(n395), .Y(n397) );
  NAND2X1 U517 ( .A(n490), .B(n378), .Y(n380) );
  NAND2X1 U518 ( .A(n490), .B(n360), .Y(n364) );
  NAND2X1 U519 ( .A(n484), .B(n22), .Y(n485) );
  NAND2X1 U520 ( .A(n484), .B(n22), .Y(n466) );
  NAND2X1 U521 ( .A(n484), .B(n22), .Y(n449) );
  NAND2X1 U522 ( .A(n484), .B(n22), .Y(n432) );
  NAND2X1 U523 ( .A(n484), .B(n22), .Y(n415) );
  NAND2X1 U524 ( .A(n484), .B(n22), .Y(n398) );
  OAI21X1 U525 ( .A(\mem[5][1] ), .B(n22), .C(n484), .Y(n381) );
  NAND2X1 U526 ( .A(n492), .B(n43), .Y(n493) );
  NAND2X1 U527 ( .A(n492), .B(n43), .Y(n470) );
  OAI21X1 U528 ( .A(\mem[4][5] ), .B(n43), .C(n492), .Y(n453) );
  OAI21X1 U529 ( .A(\mem[4][4] ), .B(n43), .C(n492), .Y(n436) );
  OAI21X1 U530 ( .A(\mem[4][3] ), .B(n43), .C(n492), .Y(n419) );
  OAI21X1 U531 ( .A(\mem[4][2] ), .B(n43), .C(n492), .Y(n402) );
  OAI21X1 U532 ( .A(\mem[4][1] ), .B(n43), .C(n492), .Y(n385) );
  INVX2 U533 ( .A(n499), .Y(N274) );
  INVX2 U534 ( .A(n476), .Y(N275) );
  INVX2 U535 ( .A(n459), .Y(N276) );
  INVX2 U536 ( .A(n442), .Y(N277) );
  INVX2 U537 ( .A(n425), .Y(N278) );
  INVX2 U538 ( .A(n408), .Y(N279) );
  INVX2 U539 ( .A(n391), .Y(N280) );
  INVX2 U540 ( .A(n375), .Y(N281) );
  INVX2 U541 ( .A(n2448), .Y(n502) );
  INVX2 U542 ( .A(n2449), .Y(n503) );
  INVX2 U543 ( .A(n2450), .Y(n504) );
  NOR2X1 U544 ( .A(n2451), .B(N200), .Y(n507) );
  NAND2X1 U545 ( .A(n507), .B(n2453), .Y(n632) );
  NOR2X1 U546 ( .A(n823), .B(N200), .Y(n508) );
  NAND2X1 U547 ( .A(n508), .B(n2453), .Y(n631) );
  NOR2X1 U548 ( .A(n650), .B(n2451), .Y(n511) );
  NAND2X1 U549 ( .A(n2453), .B(n511), .Y(n634) );
  NOR2X1 U550 ( .A(n650), .B(n823), .Y(n512) );
  NOR2X1 U551 ( .A(n506), .B(n505), .Y(n524) );
  NAND2X1 U552 ( .A(n507), .B(N194), .Y(n640) );
  NAND2X1 U553 ( .A(n508), .B(N194), .Y(n637) );
  NOR2X1 U554 ( .A(\mem[8][0] ), .B(n637), .Y(n509) );
  NOR2X1 U555 ( .A(n1259), .B(n509), .Y(n510) );
  NAND2X1 U556 ( .A(n511), .B(N194), .Y(n642) );
  NAND2X1 U557 ( .A(n512), .B(N194), .Y(n641) );
  NOR2X1 U558 ( .A(n514), .B(n513), .Y(n523) );
  OAI22X1 U559 ( .A(\mem[3][0] ), .B(n632), .C(\mem[1][0] ), .D(n631), .Y(n516) );
  OAI22X1 U560 ( .A(\mem[7][0] ), .B(n634), .C(\mem[5][0] ), .D(n36), .Y(n515)
         );
  NOR2X1 U561 ( .A(n516), .B(n515), .Y(n522) );
  NOR2X1 U562 ( .A(\mem[0][0] ), .B(n637), .Y(n517) );
  NOR2X1 U563 ( .A(N201), .B(n517), .Y(n518) );
  OAI21X1 U564 ( .A(\mem[2][0] ), .B(n640), .C(n518), .Y(n520) );
  OAI22X1 U565 ( .A(\mem[6][0] ), .B(n642), .C(\mem[4][0] ), .D(n23), .Y(n519)
         );
  NOR2X1 U566 ( .A(n520), .B(n519), .Y(n521) );
  AOI22X1 U567 ( .A(n524), .B(n523), .C(n522), .D(n521), .Y(n525) );
  NOR2X1 U568 ( .A(n506), .B(n526), .Y(n540) );
  NOR2X1 U569 ( .A(\mem[8][1] ), .B(n637), .Y(n527) );
  NOR2X1 U570 ( .A(n1259), .B(n527), .Y(n528) );
  NOR2X1 U571 ( .A(n530), .B(n529), .Y(n539) );
  OAI22X1 U572 ( .A(\mem[3][1] ), .B(n632), .C(\mem[1][1] ), .D(n631), .Y(n532) );
  NOR2X1 U573 ( .A(n532), .B(n531), .Y(n538) );
  NOR2X1 U574 ( .A(\mem[0][1] ), .B(n637), .Y(n533) );
  NOR2X1 U575 ( .A(N201), .B(n533), .Y(n534) );
  OAI21X1 U576 ( .A(\mem[2][1] ), .B(n640), .C(n534), .Y(n536) );
  NOR2X1 U577 ( .A(n536), .B(n535), .Y(n537) );
  AOI22X1 U578 ( .A(n540), .B(n539), .C(n538), .D(n537), .Y(n541) );
  NOR2X1 U579 ( .A(n543), .B(n542), .Y(n557) );
  NOR2X1 U580 ( .A(\mem[8][2] ), .B(n637), .Y(n544) );
  NOR2X1 U581 ( .A(n1259), .B(n544), .Y(n545) );
  NOR2X1 U582 ( .A(n547), .B(n546), .Y(n556) );
  OAI22X1 U583 ( .A(\mem[3][2] ), .B(n632), .C(\mem[1][2] ), .D(n631), .Y(n549) );
  NOR2X1 U584 ( .A(n549), .B(n548), .Y(n555) );
  NOR2X1 U585 ( .A(\mem[0][2] ), .B(n637), .Y(n550) );
  NOR2X1 U586 ( .A(N201), .B(n550), .Y(n551) );
  OAI21X1 U587 ( .A(\mem[2][2] ), .B(n640), .C(n551), .Y(n553) );
  NOR2X1 U588 ( .A(n553), .B(n552), .Y(n554) );
  AOI22X1 U589 ( .A(n557), .B(n556), .C(n555), .D(n554), .Y(n558) );
  NOR2X1 U590 ( .A(n560), .B(n559), .Y(n574) );
  NOR2X1 U591 ( .A(\mem[8][3] ), .B(n637), .Y(n561) );
  NOR2X1 U592 ( .A(n1259), .B(n561), .Y(n562) );
  NOR2X1 U593 ( .A(n564), .B(n563), .Y(n573) );
  OAI22X1 U594 ( .A(\mem[3][3] ), .B(n632), .C(\mem[1][3] ), .D(n631), .Y(n566) );
  NOR2X1 U595 ( .A(n566), .B(n565), .Y(n572) );
  NOR2X1 U596 ( .A(\mem[0][3] ), .B(n637), .Y(n567) );
  NOR2X1 U597 ( .A(N201), .B(n567), .Y(n568) );
  OAI21X1 U598 ( .A(\mem[2][3] ), .B(n640), .C(n568), .Y(n570) );
  NOR2X1 U599 ( .A(n570), .B(n569), .Y(n571) );
  AOI22X1 U600 ( .A(n574), .B(n573), .C(n572), .D(n571), .Y(n575) );
  NOR2X1 U601 ( .A(n577), .B(n576), .Y(n591) );
  NOR2X1 U602 ( .A(\mem[8][4] ), .B(n637), .Y(n578) );
  NOR2X1 U603 ( .A(n1259), .B(n578), .Y(n579) );
  NOR2X1 U604 ( .A(n581), .B(n580), .Y(n590) );
  OAI22X1 U605 ( .A(\mem[3][4] ), .B(n632), .C(\mem[1][4] ), .D(n631), .Y(n583) );
  NOR2X1 U606 ( .A(n583), .B(n582), .Y(n589) );
  NOR2X1 U607 ( .A(\mem[0][4] ), .B(n637), .Y(n584) );
  NOR2X1 U608 ( .A(N201), .B(n584), .Y(n585) );
  OAI21X1 U609 ( .A(\mem[2][4] ), .B(n640), .C(n585), .Y(n587) );
  NOR2X1 U610 ( .A(n587), .B(n586), .Y(n588) );
  AOI22X1 U611 ( .A(n591), .B(n590), .C(n589), .D(n588), .Y(n592) );
  NOR2X1 U612 ( .A(n594), .B(n593), .Y(n608) );
  NOR2X1 U613 ( .A(\mem[8][5] ), .B(n637), .Y(n595) );
  NOR2X1 U614 ( .A(n1259), .B(n595), .Y(n596) );
  NOR2X1 U615 ( .A(n598), .B(n597), .Y(n607) );
  OAI22X1 U616 ( .A(\mem[3][5] ), .B(n632), .C(\mem[1][5] ), .D(n631), .Y(n600) );
  NOR2X1 U617 ( .A(n600), .B(n599), .Y(n606) );
  NOR2X1 U618 ( .A(\mem[0][5] ), .B(n637), .Y(n601) );
  NOR2X1 U619 ( .A(N201), .B(n601), .Y(n602) );
  OAI21X1 U620 ( .A(\mem[2][5] ), .B(n640), .C(n602), .Y(n604) );
  NOR2X1 U621 ( .A(n604), .B(n603), .Y(n605) );
  AOI22X1 U622 ( .A(n608), .B(n607), .C(n606), .D(n605), .Y(n609) );
  NOR2X1 U623 ( .A(n611), .B(n610), .Y(n625) );
  NOR2X1 U624 ( .A(\mem[8][6] ), .B(n637), .Y(n612) );
  NOR2X1 U625 ( .A(n1259), .B(n612), .Y(n613) );
  NOR2X1 U626 ( .A(n615), .B(n614), .Y(n624) );
  OAI22X1 U627 ( .A(\mem[3][6] ), .B(n632), .C(\mem[1][6] ), .D(n631), .Y(n617) );
  NOR2X1 U628 ( .A(n617), .B(n616), .Y(n623) );
  NOR2X1 U629 ( .A(\mem[0][6] ), .B(n637), .Y(n618) );
  NOR2X1 U630 ( .A(N201), .B(n618), .Y(n619) );
  OAI21X1 U631 ( .A(\mem[2][6] ), .B(n640), .C(n619), .Y(n621) );
  NOR2X1 U632 ( .A(n621), .B(n620), .Y(n622) );
  AOI22X1 U633 ( .A(n625), .B(n624), .C(n623), .D(n622), .Y(n626) );
  NOR2X1 U634 ( .A(n628), .B(n627), .Y(n648) );
  OAI21X1 U635 ( .A(n14), .B(n23), .C(n4), .Y(n630) );
  NOR2X1 U636 ( .A(n630), .B(n629), .Y(n647) );
  OAI22X1 U637 ( .A(\mem[3][7] ), .B(n632), .C(\mem[1][7] ), .D(n631), .Y(n636) );
  NOR2X1 U638 ( .A(n636), .B(n635), .Y(n646) );
  NOR2X1 U639 ( .A(\mem[0][7] ), .B(n637), .Y(n638) );
  NOR2X1 U640 ( .A(N201), .B(n638), .Y(n639) );
  OAI21X1 U641 ( .A(\mem[2][7] ), .B(n640), .C(n639), .Y(n644) );
  NOR2X1 U642 ( .A(n644), .B(n643), .Y(n645) );
  AOI22X1 U643 ( .A(n648), .B(n647), .C(n646), .D(n645), .Y(n649) );
  NAND2X1 U644 ( .A(n634), .B(n45), .Y(n627) );
  OAI21X1 U645 ( .A(\mem[13][6] ), .B(n36), .C(n634), .Y(n610) );
  OAI21X1 U646 ( .A(\mem[13][5] ), .B(n36), .C(n634), .Y(n593) );
  OAI21X1 U647 ( .A(\mem[13][4] ), .B(n36), .C(n634), .Y(n576) );
  OAI21X1 U648 ( .A(\mem[13][3] ), .B(n36), .C(n634), .Y(n559) );
  OAI21X1 U649 ( .A(\mem[13][2] ), .B(n36), .C(n634), .Y(n542) );
  OAI21X1 U650 ( .A(\mem[13][1] ), .B(n36), .C(n634), .Y(n526) );
  OAI21X1 U651 ( .A(clear), .B(n36), .C(n634), .Y(n505) );
  NAND2X1 U652 ( .A(n631), .B(n642), .Y(n629) );
  OAI21X1 U653 ( .A(n16), .B(n23), .C(n642), .Y(n614) );
  OAI21X1 U654 ( .A(n651), .B(n23), .C(n642), .Y(n597) );
  OAI21X1 U655 ( .A(n15), .B(n23), .C(n642), .Y(n580) );
  OAI21X1 U656 ( .A(n17), .B(n23), .C(n642), .Y(n563) );
  OAI21X1 U657 ( .A(n652), .B(n23), .C(n642), .Y(n546) );
  OAI21X1 U658 ( .A(n33), .B(n23), .C(n642), .Y(n529) );
  OAI21X1 U659 ( .A(n653), .B(n23), .C(n642), .Y(n513) );
  OAI21X1 U660 ( .A(\mem[13][7] ), .B(n36), .C(n632), .Y(n628) );
  NAND2X1 U661 ( .A(n632), .B(n631), .Y(n611) );
  NAND2X1 U662 ( .A(n632), .B(n631), .Y(n594) );
  NAND2X1 U663 ( .A(n632), .B(n631), .Y(n577) );
  NAND2X1 U664 ( .A(n632), .B(n631), .Y(n560) );
  NAND2X1 U665 ( .A(n632), .B(n631), .Y(n543) );
  NAND2X1 U666 ( .A(n632), .B(n631), .Y(n506) );
  NAND2X1 U667 ( .A(n640), .B(n613), .Y(n615) );
  NAND2X1 U668 ( .A(n640), .B(n596), .Y(n598) );
  NAND2X1 U669 ( .A(n640), .B(n579), .Y(n581) );
  NAND2X1 U670 ( .A(n640), .B(n562), .Y(n564) );
  NAND2X1 U671 ( .A(n640), .B(n545), .Y(n547) );
  NAND2X1 U672 ( .A(n640), .B(n528), .Y(n530) );
  NAND2X1 U673 ( .A(n640), .B(n510), .Y(n514) );
  NAND2X1 U674 ( .A(n634), .B(n36), .Y(n635) );
  NAND2X1 U675 ( .A(n634), .B(n36), .Y(n616) );
  NAND2X1 U676 ( .A(n634), .B(n36), .Y(n599) );
  NAND2X1 U677 ( .A(n634), .B(n36), .Y(n582) );
  NAND2X1 U678 ( .A(n634), .B(n36), .Y(n565) );
  NAND2X1 U679 ( .A(n634), .B(n36), .Y(n548) );
  OAI21X1 U680 ( .A(\mem[5][1] ), .B(n36), .C(n634), .Y(n531) );
  NAND2X1 U681 ( .A(n642), .B(n23), .Y(n643) );
  NAND2X1 U682 ( .A(n642), .B(n23), .Y(n620) );
  OAI21X1 U683 ( .A(\mem[4][5] ), .B(n23), .C(n642), .Y(n603) );
  OAI21X1 U684 ( .A(\mem[4][4] ), .B(n23), .C(n642), .Y(n586) );
  OAI21X1 U685 ( .A(\mem[4][3] ), .B(n23), .C(n642), .Y(n569) );
  OAI21X1 U686 ( .A(\mem[4][2] ), .B(n23), .C(n642), .Y(n552) );
  OAI21X1 U687 ( .A(\mem[4][1] ), .B(n23), .C(n642), .Y(n535) );
  INVX2 U688 ( .A(N200), .Y(n650) );
  INVX2 U689 ( .A(n541), .Y(N371) );
  INVX2 U690 ( .A(n558), .Y(N370) );
  INVX2 U691 ( .A(n575), .Y(N369) );
  INVX2 U692 ( .A(n592), .Y(N368) );
  INVX2 U693 ( .A(n609), .Y(N367) );
  INVX2 U694 ( .A(n626), .Y(N366) );
  INVX2 U695 ( .A(n649), .Y(N365) );
  INVX2 U696 ( .A(n525), .Y(N372) );
  INVX2 U697 ( .A(n2448), .Y(n651) );
  INVX2 U698 ( .A(n2449), .Y(n652) );
  INVX2 U699 ( .A(n2450), .Y(n653) );
  NOR2X1 U700 ( .A(n823), .B(N192), .Y(n656) );
  NAND2X1 U701 ( .A(n656), .B(n2453), .Y(n941) );
  NOR2X1 U702 ( .A(n2451), .B(N192), .Y(n657) );
  NAND2X1 U703 ( .A(n657), .B(n2453), .Y(n940) );
  NOR2X1 U704 ( .A(n959), .B(n823), .Y(n660) );
  NAND2X1 U705 ( .A(n2453), .B(n660), .Y(n943) );
  NOR2X1 U706 ( .A(n959), .B(n2451), .Y(n661) );
  NOR2X1 U707 ( .A(n655), .B(n654), .Y(n833) );
  NAND2X1 U708 ( .A(n656), .B(N194), .Y(n949) );
  NAND2X1 U709 ( .A(n657), .B(N194), .Y(n946) );
  NOR2X1 U710 ( .A(\mem[8][0] ), .B(n946), .Y(n658) );
  NOR2X1 U711 ( .A(n960), .B(n658), .Y(n659) );
  NAND2X1 U712 ( .A(n660), .B(N194), .Y(n951) );
  NAND2X1 U713 ( .A(n661), .B(N194), .Y(n950) );
  NOR2X1 U714 ( .A(n663), .B(n662), .Y(n832) );
  OAI22X1 U715 ( .A(\mem[3][0] ), .B(n941), .C(\mem[1][0] ), .D(n940), .Y(n665) );
  OAI22X1 U716 ( .A(\mem[7][0] ), .B(n943), .C(\mem[5][0] ), .D(n21), .Y(n664)
         );
  NOR2X1 U717 ( .A(n665), .B(n664), .Y(n831) );
  NOR2X1 U718 ( .A(\mem[0][0] ), .B(n946), .Y(n820) );
  NOR2X1 U719 ( .A(N193), .B(n820), .Y(n821) );
  OAI21X1 U720 ( .A(\mem[2][0] ), .B(n949), .C(n821), .Y(n824) );
  OAI22X1 U721 ( .A(\mem[6][0] ), .B(n951), .C(\mem[4][0] ), .D(n40), .Y(n822)
         );
  NOR2X1 U722 ( .A(n824), .B(n822), .Y(n825) );
  AOI22X1 U723 ( .A(n833), .B(n832), .C(n831), .D(n825), .Y(n834) );
  NOR2X1 U724 ( .A(n655), .B(n835), .Y(n849) );
  NOR2X1 U725 ( .A(\mem[8][1] ), .B(n946), .Y(n836) );
  NOR2X1 U726 ( .A(n960), .B(n836), .Y(n837) );
  NOR2X1 U727 ( .A(n839), .B(n838), .Y(n848) );
  OAI22X1 U728 ( .A(\mem[3][1] ), .B(n941), .C(\mem[1][1] ), .D(n940), .Y(n841) );
  NOR2X1 U729 ( .A(n841), .B(n840), .Y(n847) );
  NOR2X1 U730 ( .A(\mem[0][1] ), .B(n946), .Y(n842) );
  NOR2X1 U731 ( .A(N193), .B(n842), .Y(n843) );
  OAI21X1 U732 ( .A(\mem[2][1] ), .B(n949), .C(n843), .Y(n845) );
  NOR2X1 U733 ( .A(n845), .B(n844), .Y(n846) );
  AOI22X1 U734 ( .A(n849), .B(n848), .C(n847), .D(n846), .Y(n850) );
  NOR2X1 U735 ( .A(n852), .B(n851), .Y(n866) );
  NOR2X1 U736 ( .A(\mem[8][2] ), .B(n946), .Y(n853) );
  NOR2X1 U737 ( .A(n960), .B(n853), .Y(n854) );
  NOR2X1 U738 ( .A(n856), .B(n855), .Y(n865) );
  OAI22X1 U739 ( .A(\mem[3][2] ), .B(n941), .C(\mem[1][2] ), .D(n940), .Y(n858) );
  NOR2X1 U740 ( .A(n858), .B(n857), .Y(n864) );
  NOR2X1 U741 ( .A(\mem[0][2] ), .B(n946), .Y(n859) );
  NOR2X1 U742 ( .A(N193), .B(n859), .Y(n860) );
  OAI21X1 U743 ( .A(\mem[2][2] ), .B(n949), .C(n860), .Y(n862) );
  NOR2X1 U744 ( .A(n862), .B(n861), .Y(n863) );
  AOI22X1 U745 ( .A(n866), .B(n865), .C(n864), .D(n863), .Y(n867) );
  NOR2X1 U746 ( .A(n869), .B(n868), .Y(n883) );
  NOR2X1 U747 ( .A(\mem[8][3] ), .B(n946), .Y(n870) );
  NOR2X1 U748 ( .A(n960), .B(n870), .Y(n871) );
  NOR2X1 U749 ( .A(n873), .B(n872), .Y(n882) );
  OAI22X1 U750 ( .A(\mem[3][3] ), .B(n941), .C(\mem[1][3] ), .D(n940), .Y(n875) );
  NOR2X1 U751 ( .A(n875), .B(n874), .Y(n881) );
  NOR2X1 U752 ( .A(\mem[0][3] ), .B(n946), .Y(n876) );
  NOR2X1 U753 ( .A(N193), .B(n876), .Y(n877) );
  OAI21X1 U754 ( .A(\mem[2][3] ), .B(n949), .C(n877), .Y(n879) );
  NOR2X1 U755 ( .A(n879), .B(n878), .Y(n880) );
  AOI22X1 U756 ( .A(n883), .B(n882), .C(n881), .D(n880), .Y(n884) );
  NOR2X1 U757 ( .A(n886), .B(n885), .Y(n900) );
  NOR2X1 U758 ( .A(\mem[8][4] ), .B(n946), .Y(n887) );
  NOR2X1 U759 ( .A(n960), .B(n887), .Y(n888) );
  NOR2X1 U760 ( .A(n890), .B(n889), .Y(n899) );
  OAI22X1 U761 ( .A(\mem[3][4] ), .B(n941), .C(\mem[1][4] ), .D(n940), .Y(n892) );
  NOR2X1 U762 ( .A(n892), .B(n891), .Y(n898) );
  NOR2X1 U763 ( .A(\mem[0][4] ), .B(n946), .Y(n893) );
  NOR2X1 U764 ( .A(N193), .B(n893), .Y(n894) );
  OAI21X1 U765 ( .A(\mem[2][4] ), .B(n949), .C(n894), .Y(n896) );
  NOR2X1 U766 ( .A(n896), .B(n895), .Y(n897) );
  AOI22X1 U767 ( .A(n900), .B(n899), .C(n898), .D(n897), .Y(n901) );
  NOR2X1 U768 ( .A(n903), .B(n902), .Y(n917) );
  NOR2X1 U769 ( .A(\mem[8][5] ), .B(n946), .Y(n904) );
  NOR2X1 U770 ( .A(n960), .B(n904), .Y(n905) );
  NOR2X1 U771 ( .A(n907), .B(n906), .Y(n916) );
  OAI22X1 U772 ( .A(\mem[3][5] ), .B(n941), .C(\mem[1][5] ), .D(n940), .Y(n909) );
  NOR2X1 U773 ( .A(n909), .B(n908), .Y(n915) );
  NOR2X1 U774 ( .A(\mem[0][5] ), .B(n946), .Y(n910) );
  NOR2X1 U775 ( .A(N193), .B(n910), .Y(n911) );
  OAI21X1 U776 ( .A(\mem[2][5] ), .B(n949), .C(n911), .Y(n913) );
  NOR2X1 U777 ( .A(n913), .B(n912), .Y(n914) );
  AOI22X1 U778 ( .A(n917), .B(n916), .C(n915), .D(n914), .Y(n918) );
  NOR2X1 U779 ( .A(n920), .B(n919), .Y(n934) );
  NOR2X1 U780 ( .A(\mem[8][6] ), .B(n946), .Y(n921) );
  NOR2X1 U781 ( .A(n960), .B(n921), .Y(n922) );
  NOR2X1 U782 ( .A(n924), .B(n923), .Y(n933) );
  OAI22X1 U783 ( .A(\mem[3][6] ), .B(n941), .C(\mem[1][6] ), .D(n940), .Y(n926) );
  NOR2X1 U822 ( .A(n926), .B(n925), .Y(n932) );
  NOR2X1 U823 ( .A(\mem[0][6] ), .B(n946), .Y(n927) );
  NOR2X1 U826 ( .A(N193), .B(n927), .Y(n928) );
  OAI21X1 U827 ( .A(\mem[2][6] ), .B(n949), .C(n928), .Y(n930) );
  NOR2X1 U828 ( .A(n930), .B(n929), .Y(n931) );
  AOI22X1 U829 ( .A(n934), .B(n933), .C(n932), .D(n931), .Y(n935) );
  NOR2X1 U830 ( .A(n937), .B(n936), .Y(n957) );
  OAI21X1 U831 ( .A(n14), .B(n40), .C(n5), .Y(n939) );
  NOR2X1 U833 ( .A(n939), .B(n938), .Y(n956) );
  OAI22X1 U834 ( .A(\mem[3][7] ), .B(n941), .C(\mem[1][7] ), .D(n940), .Y(n945) );
  NOR2X1 U835 ( .A(n945), .B(n944), .Y(n955) );
  NOR2X1 U836 ( .A(\mem[0][7] ), .B(n946), .Y(n947) );
  NOR2X1 U837 ( .A(N193), .B(n947), .Y(n948) );
  OAI21X1 U838 ( .A(\mem[2][7] ), .B(n949), .C(n948), .Y(n953) );
  NOR2X1 U839 ( .A(n953), .B(n952), .Y(n954) );
  AOI22X1 U841 ( .A(n957), .B(n956), .C(n955), .D(n954), .Y(n958) );
  NAND2X1 U842 ( .A(n943), .B(N193), .Y(n936) );
  OAI21X1 U843 ( .A(\mem[13][6] ), .B(n21), .C(n943), .Y(n919) );
  OAI21X1 U844 ( .A(\mem[13][5] ), .B(n21), .C(n943), .Y(n902) );
  OAI21X1 U845 ( .A(\mem[13][4] ), .B(n21), .C(n943), .Y(n885) );
  OAI21X1 U846 ( .A(\mem[13][3] ), .B(n21), .C(n943), .Y(n868) );
  OAI21X1 U847 ( .A(\mem[13][2] ), .B(n21), .C(n943), .Y(n851) );
  OAI21X1 U855 ( .A(\mem[13][1] ), .B(n21), .C(n943), .Y(n835) );
  OAI21X1 U856 ( .A(clear), .B(n21), .C(n943), .Y(n654) );
  NAND2X1 U857 ( .A(n940), .B(n951), .Y(n938) );
  OAI21X1 U858 ( .A(n16), .B(n40), .C(n951), .Y(n923) );
  OAI21X1 U859 ( .A(n961), .B(n40), .C(n951), .Y(n906) );
  OAI21X1 U860 ( .A(n15), .B(n40), .C(n951), .Y(n889) );
  OAI21X1 U861 ( .A(n17), .B(n40), .C(n951), .Y(n872) );
  OAI21X1 U862 ( .A(n962), .B(n40), .C(n951), .Y(n855) );
  OAI21X1 U863 ( .A(n33), .B(n40), .C(n951), .Y(n838) );
  OAI21X1 U864 ( .A(n963), .B(n40), .C(n951), .Y(n662) );
  OAI21X1 U865 ( .A(\mem[13][7] ), .B(n21), .C(n941), .Y(n937) );
  NAND2X1 U866 ( .A(n941), .B(n940), .Y(n920) );
  NAND2X1 U867 ( .A(n941), .B(n940), .Y(n903) );
  NAND2X1 U868 ( .A(n941), .B(n940), .Y(n886) );
  NAND2X1 U869 ( .A(n941), .B(n940), .Y(n869) );
  NAND2X1 U870 ( .A(n941), .B(n940), .Y(n852) );
  NAND2X1 U871 ( .A(n941), .B(n940), .Y(n655) );
  NAND2X1 U872 ( .A(n949), .B(n922), .Y(n924) );
  NAND2X1 U873 ( .A(n949), .B(n905), .Y(n907) );
  NAND2X1 U874 ( .A(n949), .B(n888), .Y(n890) );
  NAND2X1 U875 ( .A(n949), .B(n871), .Y(n873) );
  NAND2X1 U876 ( .A(n949), .B(n854), .Y(n856) );
  NAND2X1 U877 ( .A(n949), .B(n837), .Y(n839) );
  NAND2X1 U878 ( .A(n949), .B(n659), .Y(n663) );
  NAND2X1 U879 ( .A(n943), .B(n21), .Y(n944) );
  NAND2X1 U896 ( .A(n943), .B(n21), .Y(n925) );
  NAND2X1 U897 ( .A(n943), .B(n21), .Y(n908) );
  NAND2X1 U898 ( .A(n943), .B(n21), .Y(n891) );
  NAND2X1 U899 ( .A(n943), .B(n21), .Y(n874) );
  NAND2X1 U900 ( .A(n943), .B(n21), .Y(n857) );
  OAI21X1 U901 ( .A(\mem[5][1] ), .B(n21), .C(n943), .Y(n840) );
  NAND2X1 U902 ( .A(n951), .B(n40), .Y(n952) );
  NAND2X1 U903 ( .A(n951), .B(n40), .Y(n929) );
  OAI21X1 U904 ( .A(\mem[4][5] ), .B(n40), .C(n951), .Y(n912) );
  OAI21X1 U905 ( .A(\mem[4][4] ), .B(n40), .C(n951), .Y(n895) );
  OAI21X1 U906 ( .A(\mem[4][3] ), .B(n40), .C(n951), .Y(n878) );
  OAI21X1 U907 ( .A(\mem[4][2] ), .B(n40), .C(n951), .Y(n861) );
  OAI21X1 U908 ( .A(\mem[4][1] ), .B(n40), .C(n951), .Y(n844) );
  INVX2 U909 ( .A(N192), .Y(n959) );
  INVX2 U910 ( .A(N193), .Y(n960) );
  INVX2 U911 ( .A(n850), .Y(N490) );
  INVX2 U968 ( .A(n867), .Y(N489) );
  INVX2 U969 ( .A(n884), .Y(N488) );
  INVX2 U970 ( .A(n901), .Y(N487) );
  INVX2 U971 ( .A(n918), .Y(N486) );
  INVX2 U972 ( .A(n935), .Y(N485) );
  INVX2 U973 ( .A(n958), .Y(N484) );
  INVX2 U974 ( .A(n834), .Y(N491) );
  INVX2 U975 ( .A(n2448), .Y(n961) );
  INVX2 U976 ( .A(n2449), .Y(n962) );
  INVX2 U977 ( .A(n2450), .Y(n963) );
  NOR2X1 U978 ( .A(N179), .B(N196), .Y(n966) );
  NAND2X1 U979 ( .A(n966), .B(N194), .Y(n1091) );
  NOR2X1 U980 ( .A(n2452), .B(N196), .Y(n967) );
  NAND2X1 U981 ( .A(n967), .B(N194), .Y(n1090) );
  NOR2X1 U982 ( .A(n1109), .B(N179), .Y(n970) );
  NAND2X1 U983 ( .A(N194), .B(n970), .Y(n1093) );
  NOR2X1 U984 ( .A(n1109), .B(n2452), .Y(n971) );
  NAND2X1 U985 ( .A(n971), .B(N194), .Y(n1092) );
  NOR2X1 U986 ( .A(n965), .B(n964), .Y(n983) );
  NAND2X1 U987 ( .A(n966), .B(n2453), .Y(n1099) );
  NAND2X1 U988 ( .A(n967), .B(n2453), .Y(n1096) );
  NOR2X1 U989 ( .A(\mem[8][0] ), .B(n1096), .Y(n968) );
  NOR2X1 U990 ( .A(n1110), .B(n968), .Y(n969) );
  NAND2X1 U991 ( .A(n970), .B(n2453), .Y(n1101) );
  NAND2X1 U992 ( .A(n971), .B(n2453), .Y(n1100) );
  NOR2X1 U993 ( .A(n973), .B(n972), .Y(n982) );
  OAI22X1 U994 ( .A(\mem[3][0] ), .B(n1091), .C(\mem[1][0] ), .D(n1090), .Y(
        n975) );
  OAI22X1 U995 ( .A(\mem[7][0] ), .B(n1093), .C(\mem[5][0] ), .D(n27), .Y(n974) );
  NOR2X1 U996 ( .A(n975), .B(n974), .Y(n981) );
  NOR2X1 U997 ( .A(\mem[0][0] ), .B(n1096), .Y(n976) );
  NOR2X1 U998 ( .A(N197), .B(n976), .Y(n977) );
  OAI21X1 U999 ( .A(\mem[2][0] ), .B(n1099), .C(n977), .Y(n979) );
  OAI22X1 U1000 ( .A(\mem[6][0] ), .B(n1101), .C(\mem[4][0] ), .D(n42), .Y(
        n978) );
  NOR2X1 U1001 ( .A(n979), .B(n978), .Y(n980) );
  AOI22X1 U1002 ( .A(n983), .B(n982), .C(n981), .D(n980), .Y(n984) );
  NOR2X1 U1003 ( .A(n965), .B(n985), .Y(n999) );
  NOR2X1 U1004 ( .A(\mem[8][1] ), .B(n1096), .Y(n986) );
  NOR2X1 U1005 ( .A(n1110), .B(n986), .Y(n987) );
  NOR2X1 U1006 ( .A(n989), .B(n988), .Y(n998) );
  OAI22X1 U1007 ( .A(\mem[3][1] ), .B(n1091), .C(\mem[1][1] ), .D(n1090), .Y(
        n991) );
  NOR2X1 U1008 ( .A(n991), .B(n990), .Y(n997) );
  NOR2X1 U1009 ( .A(\mem[0][1] ), .B(n1096), .Y(n992) );
  NOR2X1 U1010 ( .A(N197), .B(n992), .Y(n993) );
  OAI21X1 U1011 ( .A(\mem[2][1] ), .B(n1099), .C(n993), .Y(n995) );
  NOR2X1 U1012 ( .A(n995), .B(n994), .Y(n996) );
  AOI22X1 U1013 ( .A(n999), .B(n998), .C(n997), .D(n996), .Y(n1000) );
  NOR2X1 U1014 ( .A(n1002), .B(n1001), .Y(n1016) );
  NOR2X1 U1015 ( .A(\mem[8][2] ), .B(n1096), .Y(n1003) );
  NOR2X1 U1016 ( .A(n1110), .B(n1003), .Y(n1004) );
  NOR2X1 U1017 ( .A(n1006), .B(n1005), .Y(n1015) );
  OAI22X1 U1018 ( .A(\mem[3][2] ), .B(n1091), .C(\mem[1][2] ), .D(n1090), .Y(
        n1008) );
  NOR2X1 U1019 ( .A(n1008), .B(n1007), .Y(n1014) );
  NOR2X1 U1020 ( .A(\mem[0][2] ), .B(n1096), .Y(n1009) );
  NOR2X1 U1021 ( .A(N197), .B(n1009), .Y(n1010) );
  OAI21X1 U1022 ( .A(\mem[2][2] ), .B(n1099), .C(n1010), .Y(n1012) );
  NOR2X1 U1023 ( .A(n1012), .B(n1011), .Y(n1013) );
  AOI22X1 U1024 ( .A(n1016), .B(n1015), .C(n1014), .D(n1013), .Y(n1017) );
  NOR2X1 U1025 ( .A(n1019), .B(n1018), .Y(n1033) );
  NOR2X1 U1026 ( .A(\mem[8][3] ), .B(n1096), .Y(n1020) );
  NOR2X1 U1027 ( .A(n1110), .B(n1020), .Y(n1021) );
  NOR2X1 U1028 ( .A(n1023), .B(n1022), .Y(n1032) );
  OAI22X1 U1029 ( .A(\mem[3][3] ), .B(n1091), .C(\mem[1][3] ), .D(n1090), .Y(
        n1025) );
  NOR2X1 U1030 ( .A(n1025), .B(n1024), .Y(n1031) );
  NOR2X1 U1031 ( .A(\mem[0][3] ), .B(n1096), .Y(n1026) );
  NOR2X1 U1032 ( .A(N197), .B(n1026), .Y(n1027) );
  OAI21X1 U1033 ( .A(\mem[2][3] ), .B(n1099), .C(n1027), .Y(n1029) );
  NOR2X1 U1034 ( .A(n1029), .B(n1028), .Y(n1030) );
  AOI22X1 U1035 ( .A(n1033), .B(n1032), .C(n1031), .D(n1030), .Y(n1034) );
  NOR2X1 U1036 ( .A(n1036), .B(n1035), .Y(n1050) );
  NOR2X1 U1037 ( .A(\mem[8][4] ), .B(n1096), .Y(n1037) );
  NOR2X1 U1038 ( .A(n1110), .B(n1037), .Y(n1038) );
  NOR2X1 U1039 ( .A(n1040), .B(n1039), .Y(n1049) );
  OAI22X1 U1040 ( .A(\mem[3][4] ), .B(n1091), .C(\mem[1][4] ), .D(n1090), .Y(
        n1042) );
  NOR2X1 U1041 ( .A(n1042), .B(n1041), .Y(n1048) );
  NOR2X1 U1042 ( .A(\mem[0][4] ), .B(n1096), .Y(n1043) );
  NOR2X1 U1043 ( .A(N197), .B(n1043), .Y(n1044) );
  OAI21X1 U1044 ( .A(\mem[2][4] ), .B(n1099), .C(n1044), .Y(n1046) );
  NOR2X1 U1045 ( .A(n1046), .B(n1045), .Y(n1047) );
  AOI22X1 U1046 ( .A(n1050), .B(n1049), .C(n1048), .D(n1047), .Y(n1051) );
  NOR2X1 U1047 ( .A(n1053), .B(n1052), .Y(n1067) );
  NOR2X1 U1048 ( .A(\mem[8][5] ), .B(n1096), .Y(n1054) );
  NOR2X1 U1049 ( .A(n1110), .B(n1054), .Y(n1055) );
  NOR2X1 U1050 ( .A(n1057), .B(n1056), .Y(n1066) );
  OAI22X1 U1051 ( .A(\mem[3][5] ), .B(n1091), .C(\mem[1][5] ), .D(n1090), .Y(
        n1059) );
  NOR2X1 U1052 ( .A(n1059), .B(n1058), .Y(n1065) );
  NOR2X1 U1053 ( .A(\mem[0][5] ), .B(n1096), .Y(n1060) );
  NOR2X1 U1054 ( .A(N197), .B(n1060), .Y(n1061) );
  OAI21X1 U1055 ( .A(\mem[2][5] ), .B(n1099), .C(n1061), .Y(n1063) );
  NOR2X1 U1056 ( .A(n1063), .B(n1062), .Y(n1064) );
  AOI22X1 U1057 ( .A(n1067), .B(n1066), .C(n1065), .D(n1064), .Y(n1068) );
  NOR2X1 U1058 ( .A(n1070), .B(n1069), .Y(n1084) );
  NOR2X1 U1059 ( .A(\mem[8][6] ), .B(n1096), .Y(n1071) );
  NOR2X1 U1060 ( .A(n1110), .B(n1071), .Y(n1072) );
  NOR2X1 U1061 ( .A(n1074), .B(n1073), .Y(n1083) );
  OAI22X1 U1062 ( .A(\mem[3][6] ), .B(n1091), .C(\mem[1][6] ), .D(n1090), .Y(
        n1076) );
  NOR2X1 U1063 ( .A(n1076), .B(n1075), .Y(n1082) );
  NOR2X1 U1064 ( .A(\mem[0][6] ), .B(n1096), .Y(n1077) );
  NOR2X1 U1065 ( .A(N197), .B(n1077), .Y(n1078) );
  OAI21X1 U1066 ( .A(\mem[2][6] ), .B(n1099), .C(n1078), .Y(n1080) );
  NOR2X1 U1067 ( .A(n1080), .B(n1079), .Y(n1081) );
  AOI22X1 U1068 ( .A(n1084), .B(n1083), .C(n1082), .D(n1081), .Y(n1085) );
  NOR2X1 U1069 ( .A(n1087), .B(n1086), .Y(n1107) );
  OAI21X1 U1070 ( .A(n14), .B(n42), .C(n6), .Y(n1089) );
  NOR2X1 U1071 ( .A(n1089), .B(n1088), .Y(n1106) );
  OAI22X1 U1072 ( .A(\mem[3][7] ), .B(n1091), .C(\mem[1][7] ), .D(n1090), .Y(
        n1095) );
  NOR2X1 U1073 ( .A(n1095), .B(n1094), .Y(n1105) );
  NOR2X1 U1074 ( .A(\mem[0][7] ), .B(n1096), .Y(n1097) );
  NOR2X1 U1075 ( .A(N197), .B(n1097), .Y(n1098) );
  OAI21X1 U1076 ( .A(\mem[2][7] ), .B(n1099), .C(n1098), .Y(n1103) );
  NOR2X1 U1077 ( .A(n1103), .B(n1102), .Y(n1104) );
  AOI22X1 U1078 ( .A(n1107), .B(n1106), .C(n1105), .D(n1104), .Y(n1108) );
  NAND2X1 U1079 ( .A(n1093), .B(N197), .Y(n1086) );
  OAI21X1 U1080 ( .A(\mem[13][6] ), .B(n27), .C(n1093), .Y(n1069) );
  OAI21X1 U1081 ( .A(\mem[13][5] ), .B(n27), .C(n1093), .Y(n1052) );
  OAI21X1 U1082 ( .A(\mem[13][4] ), .B(n27), .C(n1093), .Y(n1035) );
  OAI21X1 U1083 ( .A(\mem[13][3] ), .B(n27), .C(n1093), .Y(n1018) );
  OAI21X1 U1084 ( .A(\mem[13][2] ), .B(n27), .C(n1093), .Y(n1001) );
  OAI21X1 U1085 ( .A(\mem[13][1] ), .B(n27), .C(n1093), .Y(n985) );
  OAI21X1 U1086 ( .A(clear), .B(n27), .C(n1093), .Y(n964) );
  NAND2X1 U1087 ( .A(n1090), .B(n1101), .Y(n1088) );
  OAI21X1 U1088 ( .A(n16), .B(n42), .C(n1101), .Y(n1073) );
  OAI21X1 U1089 ( .A(n1111), .B(n42), .C(n1101), .Y(n1056) );
  OAI21X1 U1090 ( .A(n15), .B(n42), .C(n1101), .Y(n1039) );
  OAI21X1 U1091 ( .A(n17), .B(n42), .C(n1101), .Y(n1022) );
  OAI21X1 U1092 ( .A(n1112), .B(n42), .C(n1101), .Y(n1005) );
  OAI21X1 U1093 ( .A(n33), .B(n42), .C(n1101), .Y(n988) );
  OAI21X1 U1094 ( .A(n1113), .B(n42), .C(n1101), .Y(n972) );
  OAI21X1 U1095 ( .A(\mem[13][7] ), .B(n27), .C(n1091), .Y(n1087) );
  NAND2X1 U1096 ( .A(n1091), .B(n1090), .Y(n1070) );
  NAND2X1 U1097 ( .A(n1091), .B(n1090), .Y(n1053) );
  NAND2X1 U1098 ( .A(n1091), .B(n1090), .Y(n1036) );
  NAND2X1 U1099 ( .A(n1091), .B(n1090), .Y(n1019) );
  NAND2X1 U1100 ( .A(n1091), .B(n1090), .Y(n1002) );
  NAND2X1 U1101 ( .A(n1091), .B(n1090), .Y(n965) );
  NAND2X1 U1102 ( .A(n1099), .B(n1072), .Y(n1074) );
  NAND2X1 U1103 ( .A(n1099), .B(n1055), .Y(n1057) );
  NAND2X1 U1104 ( .A(n1099), .B(n1038), .Y(n1040) );
  NAND2X1 U1105 ( .A(n1099), .B(n1021), .Y(n1023) );
  NAND2X1 U1106 ( .A(n1099), .B(n1004), .Y(n1006) );
  NAND2X1 U1107 ( .A(n1099), .B(n987), .Y(n989) );
  NAND2X1 U1108 ( .A(n1099), .B(n969), .Y(n973) );
  NAND2X1 U1109 ( .A(n1093), .B(n27), .Y(n1094) );
  NAND2X1 U1110 ( .A(n1093), .B(n27), .Y(n1075) );
  NAND2X1 U1111 ( .A(n1093), .B(n27), .Y(n1058) );
  NAND2X1 U1112 ( .A(n1093), .B(n27), .Y(n1041) );
  NAND2X1 U1113 ( .A(n1093), .B(n27), .Y(n1024) );
  NAND2X1 U1114 ( .A(n1093), .B(n27), .Y(n1007) );
  OAI21X1 U1115 ( .A(\mem[5][1] ), .B(n27), .C(n1093), .Y(n990) );
  NAND2X1 U1116 ( .A(n1101), .B(n42), .Y(n1102) );
  NAND2X1 U1117 ( .A(n1101), .B(n42), .Y(n1079) );
  OAI21X1 U1118 ( .A(\mem[4][5] ), .B(n42), .C(n1101), .Y(n1062) );
  OAI21X1 U1119 ( .A(\mem[4][4] ), .B(n42), .C(n1101), .Y(n1045) );
  OAI21X1 U1120 ( .A(\mem[4][3] ), .B(n42), .C(n1101), .Y(n1028) );
  OAI21X1 U1121 ( .A(\mem[4][2] ), .B(n42), .C(n1101), .Y(n1011) );
  OAI21X1 U1122 ( .A(\mem[4][1] ), .B(n42), .C(n1101), .Y(n994) );
  INVX2 U1123 ( .A(N196), .Y(n1109) );
  INVX2 U1124 ( .A(N197), .Y(n1110) );
  INVX2 U1125 ( .A(n1000), .Y(N498) );
  INVX2 U1126 ( .A(n1017), .Y(N497) );
  INVX2 U1127 ( .A(n1034), .Y(N496) );
  INVX2 U1128 ( .A(n1051), .Y(N495) );
  INVX2 U1129 ( .A(n1068), .Y(N494) );
  INVX2 U1130 ( .A(n1085), .Y(N493) );
  INVX2 U1131 ( .A(n1108), .Y(N492) );
  INVX2 U1132 ( .A(n984), .Y(N499) );
  INVX2 U1133 ( .A(n2448), .Y(n1111) );
  INVX2 U1134 ( .A(n2449), .Y(n1112) );
  INVX2 U1135 ( .A(n2450), .Y(n1113) );
  NOR2X1 U1136 ( .A(n2451), .B(N200), .Y(n1116) );
  NAND2X1 U1137 ( .A(n1116), .B(n2453), .Y(n1241) );
  NOR2X1 U1138 ( .A(n823), .B(N200), .Y(n1117) );
  NAND2X1 U1139 ( .A(n1117), .B(n2453), .Y(n1240) );
  NOR2X1 U1140 ( .A(n650), .B(n2451), .Y(n1120) );
  NAND2X1 U1141 ( .A(n2453), .B(n1120), .Y(n1243) );
  NOR2X1 U1142 ( .A(n650), .B(n823), .Y(n1121) );
  NOR2X1 U1143 ( .A(n1115), .B(n1114), .Y(n1133) );
  NAND2X1 U1144 ( .A(n1116), .B(N194), .Y(n1249) );
  NAND2X1 U1145 ( .A(n1117), .B(N194), .Y(n1246) );
  NOR2X1 U1146 ( .A(\mem[8][0] ), .B(n1246), .Y(n1118) );
  NOR2X1 U1147 ( .A(n1259), .B(n1118), .Y(n1119) );
  NAND2X1 U1148 ( .A(n1120), .B(N194), .Y(n1251) );
  NAND2X1 U1149 ( .A(n1121), .B(N194), .Y(n1250) );
  NOR2X1 U1150 ( .A(n1123), .B(n1122), .Y(n1132) );
  OAI22X1 U1151 ( .A(\mem[3][0] ), .B(n1241), .C(\mem[1][0] ), .D(n1240), .Y(
        n1125) );
  OAI22X1 U1152 ( .A(\mem[7][0] ), .B(n1243), .C(\mem[5][0] ), .D(n30), .Y(
        n1124) );
  NOR2X1 U1153 ( .A(n1125), .B(n1124), .Y(n1131) );
  NOR2X1 U1154 ( .A(\mem[0][0] ), .B(n1246), .Y(n1126) );
  NOR2X1 U1155 ( .A(N201), .B(n1126), .Y(n1127) );
  OAI21X1 U1156 ( .A(\mem[2][0] ), .B(n1249), .C(n1127), .Y(n1129) );
  OAI22X1 U1157 ( .A(\mem[6][0] ), .B(n1251), .C(\mem[4][0] ), .D(n26), .Y(
        n1128) );
  NOR2X1 U1158 ( .A(n1129), .B(n1128), .Y(n1130) );
  AOI22X1 U1159 ( .A(n1133), .B(n1132), .C(n1131), .D(n1130), .Y(n1134) );
  NOR2X1 U1160 ( .A(n1115), .B(n1135), .Y(n1149) );
  NOR2X1 U1161 ( .A(\mem[8][1] ), .B(n1246), .Y(n1136) );
  NOR2X1 U1162 ( .A(n1259), .B(n1136), .Y(n1137) );
  NOR2X1 U1163 ( .A(n1139), .B(n1138), .Y(n1148) );
  OAI22X1 U1164 ( .A(\mem[3][1] ), .B(n1241), .C(\mem[1][1] ), .D(n1240), .Y(
        n1141) );
  NOR2X1 U1165 ( .A(n1141), .B(n1140), .Y(n1147) );
  NOR2X1 U1166 ( .A(\mem[0][1] ), .B(n1246), .Y(n1142) );
  NOR2X1 U1167 ( .A(N201), .B(n1142), .Y(n1143) );
  OAI21X1 U1168 ( .A(\mem[2][1] ), .B(n1249), .C(n1143), .Y(n1145) );
  NOR2X1 U1169 ( .A(n1145), .B(n1144), .Y(n1146) );
  AOI22X1 U1170 ( .A(n1149), .B(n1148), .C(n1147), .D(n1146), .Y(n1150) );
  NOR2X1 U1171 ( .A(n1152), .B(n1151), .Y(n1166) );
  NOR2X1 U1172 ( .A(\mem[8][2] ), .B(n1246), .Y(n1153) );
  NOR2X1 U1173 ( .A(n1259), .B(n1153), .Y(n1154) );
  NOR2X1 U1174 ( .A(n1156), .B(n1155), .Y(n1165) );
  OAI22X1 U1175 ( .A(\mem[3][2] ), .B(n1241), .C(\mem[1][2] ), .D(n1240), .Y(
        n1158) );
  NOR2X1 U1176 ( .A(n1158), .B(n1157), .Y(n1164) );
  NOR2X1 U1177 ( .A(\mem[0][2] ), .B(n1246), .Y(n1159) );
  NOR2X1 U1178 ( .A(N201), .B(n1159), .Y(n1160) );
  OAI21X1 U1179 ( .A(\mem[2][2] ), .B(n1249), .C(n1160), .Y(n1162) );
  NOR2X1 U1180 ( .A(n1162), .B(n1161), .Y(n1163) );
  AOI22X1 U1181 ( .A(n1166), .B(n1165), .C(n1164), .D(n1163), .Y(n1167) );
  NOR2X1 U1182 ( .A(n1169), .B(n1168), .Y(n1183) );
  NOR2X1 U1183 ( .A(\mem[8][3] ), .B(n1246), .Y(n1170) );
  NOR2X1 U1184 ( .A(n1259), .B(n1170), .Y(n1171) );
  NOR2X1 U1185 ( .A(n1173), .B(n1172), .Y(n1182) );
  OAI22X1 U1186 ( .A(\mem[3][3] ), .B(n1241), .C(\mem[1][3] ), .D(n1240), .Y(
        n1175) );
  NOR2X1 U1187 ( .A(n1175), .B(n1174), .Y(n1181) );
  NOR2X1 U1188 ( .A(\mem[0][3] ), .B(n1246), .Y(n1176) );
  NOR2X1 U1189 ( .A(N201), .B(n1176), .Y(n1177) );
  OAI21X1 U1190 ( .A(\mem[2][3] ), .B(n1249), .C(n1177), .Y(n1179) );
  NOR2X1 U1191 ( .A(n1179), .B(n1178), .Y(n1180) );
  AOI22X1 U1192 ( .A(n1183), .B(n1182), .C(n1181), .D(n1180), .Y(n1184) );
  NOR2X1 U1193 ( .A(n1186), .B(n1185), .Y(n1200) );
  NOR2X1 U1194 ( .A(\mem[8][4] ), .B(n1246), .Y(n1187) );
  NOR2X1 U1195 ( .A(n1259), .B(n1187), .Y(n1188) );
  NOR2X1 U1196 ( .A(n1190), .B(n1189), .Y(n1199) );
  OAI22X1 U1197 ( .A(\mem[3][4] ), .B(n1241), .C(\mem[1][4] ), .D(n1240), .Y(
        n1192) );
  NOR2X1 U1198 ( .A(n1192), .B(n1191), .Y(n1198) );
  NOR2X1 U1199 ( .A(\mem[0][4] ), .B(n1246), .Y(n1193) );
  NOR2X1 U1200 ( .A(N201), .B(n1193), .Y(n1194) );
  OAI21X1 U1201 ( .A(\mem[2][4] ), .B(n1249), .C(n1194), .Y(n1196) );
  NOR2X1 U1202 ( .A(n1196), .B(n1195), .Y(n1197) );
  AOI22X1 U1203 ( .A(n1200), .B(n1199), .C(n1198), .D(n1197), .Y(n1201) );
  NOR2X1 U1204 ( .A(n1203), .B(n1202), .Y(n1217) );
  NOR2X1 U1205 ( .A(\mem[8][5] ), .B(n1246), .Y(n1204) );
  NOR2X1 U1206 ( .A(n1259), .B(n1204), .Y(n1205) );
  NOR2X1 U1207 ( .A(n1207), .B(n1206), .Y(n1216) );
  OAI22X1 U1208 ( .A(\mem[3][5] ), .B(n1241), .C(\mem[1][5] ), .D(n1240), .Y(
        n1209) );
  NOR2X1 U1209 ( .A(n1209), .B(n1208), .Y(n1215) );
  NOR2X1 U1210 ( .A(\mem[0][5] ), .B(n1246), .Y(n1210) );
  NOR2X1 U1211 ( .A(N201), .B(n1210), .Y(n1211) );
  OAI21X1 U1212 ( .A(\mem[2][5] ), .B(n1249), .C(n1211), .Y(n1213) );
  NOR2X1 U1213 ( .A(n1213), .B(n1212), .Y(n1214) );
  AOI22X1 U1214 ( .A(n1217), .B(n1216), .C(n1215), .D(n1214), .Y(n1218) );
  NOR2X1 U1215 ( .A(n1220), .B(n1219), .Y(n1234) );
  NOR2X1 U1216 ( .A(\mem[8][6] ), .B(n1246), .Y(n1221) );
  NOR2X1 U1217 ( .A(n1259), .B(n1221), .Y(n1222) );
  NOR2X1 U1218 ( .A(n1224), .B(n1223), .Y(n1233) );
  OAI22X1 U1219 ( .A(\mem[3][6] ), .B(n1241), .C(\mem[1][6] ), .D(n1240), .Y(
        n1226) );
  NOR2X1 U1220 ( .A(n1226), .B(n1225), .Y(n1232) );
  NOR2X1 U1221 ( .A(\mem[0][6] ), .B(n1246), .Y(n1227) );
  NOR2X1 U1222 ( .A(N201), .B(n1227), .Y(n1228) );
  OAI21X1 U1223 ( .A(\mem[2][6] ), .B(n1249), .C(n1228), .Y(n1230) );
  NOR2X1 U1224 ( .A(n1230), .B(n1229), .Y(n1231) );
  AOI22X1 U1225 ( .A(n1234), .B(n1233), .C(n1232), .D(n1231), .Y(n1235) );
  NOR2X1 U1226 ( .A(n1237), .B(n1236), .Y(n1257) );
  OAI21X1 U1227 ( .A(n14), .B(n26), .C(n7), .Y(n1239) );
  NOR2X1 U1228 ( .A(n1239), .B(n1238), .Y(n1256) );
  OAI22X1 U1229 ( .A(\mem[3][7] ), .B(n1241), .C(\mem[1][7] ), .D(n1240), .Y(
        n1245) );
  NOR2X1 U1230 ( .A(n1245), .B(n1244), .Y(n1255) );
  NOR2X1 U1231 ( .A(\mem[0][7] ), .B(n1246), .Y(n1247) );
  NOR2X1 U1232 ( .A(n45), .B(n1247), .Y(n1248) );
  OAI21X1 U1233 ( .A(\mem[2][7] ), .B(n1249), .C(n1248), .Y(n1253) );
  NOR2X1 U1234 ( .A(n1253), .B(n1252), .Y(n1254) );
  AOI22X1 U1235 ( .A(n1257), .B(n1256), .C(n1255), .D(n1254), .Y(n1258) );
  NAND2X1 U1236 ( .A(n1243), .B(n45), .Y(n1236) );
  OAI21X1 U1237 ( .A(\mem[13][6] ), .B(n30), .C(n1243), .Y(n1219) );
  OAI21X1 U1238 ( .A(\mem[13][5] ), .B(n30), .C(n1243), .Y(n1202) );
  OAI21X1 U1239 ( .A(\mem[13][4] ), .B(n30), .C(n1243), .Y(n1185) );
  OAI21X1 U1240 ( .A(\mem[13][3] ), .B(n30), .C(n1243), .Y(n1168) );
  OAI21X1 U1241 ( .A(\mem[13][2] ), .B(n30), .C(n1243), .Y(n1151) );
  OAI21X1 U1242 ( .A(\mem[13][1] ), .B(n30), .C(n1243), .Y(n1135) );
  OAI21X1 U1243 ( .A(clear), .B(n30), .C(n1243), .Y(n1114) );
  NAND2X1 U1244 ( .A(n1240), .B(n1251), .Y(n1238) );
  OAI21X1 U1245 ( .A(n16), .B(n26), .C(n1251), .Y(n1223) );
  OAI21X1 U1246 ( .A(n961), .B(n26), .C(n1251), .Y(n1206) );
  OAI21X1 U1247 ( .A(n15), .B(n26), .C(n1251), .Y(n1189) );
  OAI21X1 U1248 ( .A(n17), .B(n26), .C(n1251), .Y(n1172) );
  OAI21X1 U1249 ( .A(n962), .B(n26), .C(n1251), .Y(n1155) );
  OAI21X1 U1250 ( .A(n33), .B(n26), .C(n1251), .Y(n1138) );
  OAI21X1 U1251 ( .A(n963), .B(n26), .C(n1251), .Y(n1122) );
  OAI21X1 U1252 ( .A(\mem[13][7] ), .B(n30), .C(n1241), .Y(n1237) );
  NAND2X1 U1253 ( .A(n1241), .B(n1240), .Y(n1220) );
  NAND2X1 U1254 ( .A(n1241), .B(n1240), .Y(n1203) );
  NAND2X1 U1255 ( .A(n1241), .B(n1240), .Y(n1186) );
  NAND2X1 U1256 ( .A(n1241), .B(n1240), .Y(n1169) );
  NAND2X1 U1257 ( .A(n1241), .B(n1240), .Y(n1152) );
  NAND2X1 U1258 ( .A(n1241), .B(n1240), .Y(n1115) );
  NAND2X1 U1259 ( .A(n1249), .B(n1222), .Y(n1224) );
  NAND2X1 U1260 ( .A(n1249), .B(n1205), .Y(n1207) );
  NAND2X1 U1261 ( .A(n1249), .B(n1188), .Y(n1190) );
  NAND2X1 U1262 ( .A(n1249), .B(n1171), .Y(n1173) );
  NAND2X1 U1263 ( .A(n1249), .B(n1154), .Y(n1156) );
  NAND2X1 U1264 ( .A(n1249), .B(n1137), .Y(n1139) );
  NAND2X1 U1265 ( .A(n1249), .B(n1119), .Y(n1123) );
  NAND2X1 U1266 ( .A(n1243), .B(n30), .Y(n1244) );
  NAND2X1 U1267 ( .A(n1243), .B(n30), .Y(n1225) );
  NAND2X1 U1268 ( .A(n1243), .B(n30), .Y(n1208) );
  NAND2X1 U1269 ( .A(n1243), .B(n30), .Y(n1191) );
  NAND2X1 U1270 ( .A(n1243), .B(n30), .Y(n1174) );
  NAND2X1 U1271 ( .A(n1243), .B(n30), .Y(n1157) );
  OAI21X1 U1272 ( .A(\mem[5][1] ), .B(n30), .C(n1243), .Y(n1140) );
  NAND2X1 U1273 ( .A(n1251), .B(n26), .Y(n1252) );
  NAND2X1 U1274 ( .A(n1251), .B(n26), .Y(n1229) );
  OAI21X1 U1275 ( .A(\mem[4][5] ), .B(n26), .C(n1251), .Y(n1212) );
  OAI21X1 U1276 ( .A(\mem[4][4] ), .B(n26), .C(n1251), .Y(n1195) );
  OAI21X1 U1277 ( .A(\mem[4][3] ), .B(n26), .C(n1251), .Y(n1178) );
  OAI21X1 U1278 ( .A(\mem[4][2] ), .B(n26), .C(n1251), .Y(n1161) );
  OAI21X1 U1279 ( .A(\mem[4][1] ), .B(n26), .C(n1251), .Y(n1144) );
  INVX2 U1280 ( .A(n1150), .Y(N506) );
  INVX2 U1281 ( .A(n1167), .Y(N505) );
  INVX2 U1282 ( .A(n1184), .Y(N504) );
  INVX2 U1283 ( .A(n1201), .Y(N503) );
  INVX2 U1284 ( .A(n1218), .Y(N502) );
  INVX2 U1285 ( .A(n1235), .Y(N501) );
  INVX2 U1286 ( .A(n1258), .Y(N500) );
  INVX2 U1287 ( .A(n1134), .Y(N507) );
  NOR2X1 U1288 ( .A(N207), .B(N216), .Y(n1262) );
  NAND2X1 U1289 ( .A(n1262), .B(n501), .Y(n1387) );
  NOR2X1 U1290 ( .A(n2446), .B(N216), .Y(n1263) );
  NAND2X1 U1291 ( .A(n1263), .B(n501), .Y(n1386) );
  NOR2X1 U1292 ( .A(n1405), .B(N207), .Y(n1266) );
  NAND2X1 U1293 ( .A(n501), .B(n1266), .Y(n1389) );
  NOR2X1 U1294 ( .A(n1405), .B(n2446), .Y(n1267) );
  NOR2X1 U1295 ( .A(n1261), .B(n1260), .Y(n1279) );
  NAND2X1 U1296 ( .A(n1262), .B(n31), .Y(n1395) );
  NAND2X1 U1297 ( .A(n1263), .B(n31), .Y(n1392) );
  NOR2X1 U1298 ( .A(\mem[8][0] ), .B(n1392), .Y(n1264) );
  NOR2X1 U1299 ( .A(n1845), .B(n1264), .Y(n1265) );
  NAND2X1 U1300 ( .A(n1266), .B(n31), .Y(n1397) );
  NAND2X1 U1301 ( .A(n1267), .B(n31), .Y(n1396) );
  NOR2X1 U1302 ( .A(n1269), .B(n1268), .Y(n1278) );
  OAI22X1 U1303 ( .A(\mem[3][0] ), .B(n1387), .C(\mem[1][0] ), .D(n1386), .Y(
        n1271) );
  OAI22X1 U1304 ( .A(\mem[7][0] ), .B(n1389), .C(\mem[5][0] ), .D(n37), .Y(
        n1270) );
  NOR2X1 U1305 ( .A(n1271), .B(n1270), .Y(n1277) );
  NOR2X1 U1306 ( .A(\mem[0][0] ), .B(n1392), .Y(n1272) );
  NOR2X1 U1307 ( .A(N217), .B(n1272), .Y(n1273) );
  OAI21X1 U1308 ( .A(\mem[2][0] ), .B(n1395), .C(n1273), .Y(n1275) );
  OAI22X1 U1309 ( .A(\mem[6][0] ), .B(n1397), .C(\mem[4][0] ), .D(n25), .Y(
        n1274) );
  NOR2X1 U1310 ( .A(n1275), .B(n1274), .Y(n1276) );
  AOI22X1 U1311 ( .A(n1279), .B(n1278), .C(n1277), .D(n1276), .Y(n1280) );
  NOR2X1 U1312 ( .A(n1261), .B(n1281), .Y(n1295) );
  NOR2X1 U1313 ( .A(\mem[8][1] ), .B(n1392), .Y(n1282) );
  NOR2X1 U1314 ( .A(n1845), .B(n1282), .Y(n1283) );
  NOR2X1 U1315 ( .A(n1285), .B(n1284), .Y(n1294) );
  OAI22X1 U1316 ( .A(\mem[3][1] ), .B(n1387), .C(\mem[1][1] ), .D(n1386), .Y(
        n1287) );
  NOR2X1 U1317 ( .A(n1287), .B(n1286), .Y(n1293) );
  NOR2X1 U1318 ( .A(\mem[0][1] ), .B(n1392), .Y(n1288) );
  NOR2X1 U1319 ( .A(N217), .B(n1288), .Y(n1289) );
  OAI21X1 U1320 ( .A(\mem[2][1] ), .B(n1395), .C(n1289), .Y(n1291) );
  NOR2X1 U1321 ( .A(n1291), .B(n1290), .Y(n1292) );
  AOI22X1 U1322 ( .A(n1295), .B(n1294), .C(n1293), .D(n1292), .Y(n1296) );
  NOR2X1 U1323 ( .A(n1298), .B(n1297), .Y(n1312) );
  NOR2X1 U1324 ( .A(\mem[8][2] ), .B(n1392), .Y(n1299) );
  NOR2X1 U1325 ( .A(n1845), .B(n1299), .Y(n1300) );
  NOR2X1 U1326 ( .A(n1302), .B(n1301), .Y(n1311) );
  OAI22X1 U1327 ( .A(\mem[3][2] ), .B(n1387), .C(\mem[1][2] ), .D(n1386), .Y(
        n1304) );
  NOR2X1 U1328 ( .A(n1304), .B(n1303), .Y(n1310) );
  NOR2X1 U1329 ( .A(\mem[0][2] ), .B(n1392), .Y(n1305) );
  NOR2X1 U1330 ( .A(N217), .B(n1305), .Y(n1306) );
  OAI21X1 U1331 ( .A(\mem[2][2] ), .B(n1395), .C(n1306), .Y(n1308) );
  NOR2X1 U1332 ( .A(n1308), .B(n1307), .Y(n1309) );
  AOI22X1 U1333 ( .A(n1312), .B(n1311), .C(n1310), .D(n1309), .Y(n1313) );
  NOR2X1 U1334 ( .A(n1315), .B(n1314), .Y(n1329) );
  NOR2X1 U1335 ( .A(\mem[8][3] ), .B(n1392), .Y(n1316) );
  NOR2X1 U1336 ( .A(n1845), .B(n1316), .Y(n1317) );
  NOR2X1 U1337 ( .A(n1319), .B(n1318), .Y(n1328) );
  OAI22X1 U1338 ( .A(\mem[3][3] ), .B(n1387), .C(\mem[1][3] ), .D(n1386), .Y(
        n1321) );
  NOR2X1 U1339 ( .A(n1321), .B(n1320), .Y(n1327) );
  NOR2X1 U1340 ( .A(\mem[0][3] ), .B(n1392), .Y(n1322) );
  NOR2X1 U1341 ( .A(N217), .B(n1322), .Y(n1323) );
  OAI21X1 U1342 ( .A(\mem[2][3] ), .B(n1395), .C(n1323), .Y(n1325) );
  NOR2X1 U1343 ( .A(n1325), .B(n1324), .Y(n1326) );
  AOI22X1 U1344 ( .A(n1329), .B(n1328), .C(n1327), .D(n1326), .Y(n1330) );
  NOR2X1 U1345 ( .A(n1332), .B(n1331), .Y(n1346) );
  NOR2X1 U1346 ( .A(\mem[8][4] ), .B(n1392), .Y(n1333) );
  NOR2X1 U1347 ( .A(n1845), .B(n1333), .Y(n1334) );
  NOR2X1 U1348 ( .A(n1336), .B(n1335), .Y(n1345) );
  OAI22X1 U1349 ( .A(\mem[3][4] ), .B(n1387), .C(\mem[1][4] ), .D(n1386), .Y(
        n1338) );
  NOR2X1 U1350 ( .A(n1338), .B(n1337), .Y(n1344) );
  NOR2X1 U1351 ( .A(\mem[0][4] ), .B(n1392), .Y(n1339) );
  NOR2X1 U1352 ( .A(N217), .B(n1339), .Y(n1340) );
  OAI21X1 U1353 ( .A(\mem[2][4] ), .B(n1395), .C(n1340), .Y(n1342) );
  NOR2X1 U1354 ( .A(n1342), .B(n1341), .Y(n1343) );
  AOI22X1 U1355 ( .A(n1346), .B(n1345), .C(n1344), .D(n1343), .Y(n1347) );
  NOR2X1 U1356 ( .A(n1349), .B(n1348), .Y(n1363) );
  NOR2X1 U1357 ( .A(\mem[8][5] ), .B(n1392), .Y(n1350) );
  NOR2X1 U1358 ( .A(n1845), .B(n1350), .Y(n1351) );
  NOR2X1 U1359 ( .A(n1353), .B(n1352), .Y(n1362) );
  OAI22X1 U1360 ( .A(\mem[3][5] ), .B(n1387), .C(\mem[1][5] ), .D(n1386), .Y(
        n1355) );
  NOR2X1 U1361 ( .A(n1355), .B(n1354), .Y(n1361) );
  NOR2X1 U1362 ( .A(\mem[0][5] ), .B(n1392), .Y(n1356) );
  NOR2X1 U1363 ( .A(N217), .B(n1356), .Y(n1357) );
  OAI21X1 U1364 ( .A(\mem[2][5] ), .B(n1395), .C(n1357), .Y(n1359) );
  NOR2X1 U1365 ( .A(n1359), .B(n1358), .Y(n1360) );
  AOI22X1 U1366 ( .A(n1363), .B(n1362), .C(n1361), .D(n1360), .Y(n1364) );
  NOR2X1 U1367 ( .A(n1366), .B(n1365), .Y(n1380) );
  NOR2X1 U1368 ( .A(\mem[8][6] ), .B(n1392), .Y(n1367) );
  NOR2X1 U1369 ( .A(n1845), .B(n1367), .Y(n1368) );
  NOR2X1 U1370 ( .A(n1370), .B(n1369), .Y(n1379) );
  OAI22X1 U1371 ( .A(\mem[3][6] ), .B(n1387), .C(\mem[1][6] ), .D(n1386), .Y(
        n1372) );
  NOR2X1 U1372 ( .A(n1372), .B(n1371), .Y(n1378) );
  NOR2X1 U1373 ( .A(\mem[0][6] ), .B(n1392), .Y(n1373) );
  NOR2X1 U1374 ( .A(N217), .B(n1373), .Y(n1374) );
  OAI21X1 U1375 ( .A(\mem[2][6] ), .B(n1395), .C(n1374), .Y(n1376) );
  NOR2X1 U1376 ( .A(n1376), .B(n1375), .Y(n1377) );
  AOI22X1 U1377 ( .A(n1380), .B(n1379), .C(n1378), .D(n1377), .Y(n1381) );
  NOR2X1 U1378 ( .A(n1383), .B(n1382), .Y(n1403) );
  OAI21X1 U1379 ( .A(n14), .B(n25), .C(n8), .Y(n1385) );
  NOR2X1 U1380 ( .A(n1385), .B(n1384), .Y(n1402) );
  OAI22X1 U1381 ( .A(\mem[3][7] ), .B(n1387), .C(\mem[1][7] ), .D(n1386), .Y(
        n1391) );
  NOR2X1 U1382 ( .A(n1391), .B(n1390), .Y(n1401) );
  NOR2X1 U1383 ( .A(\mem[0][7] ), .B(n1392), .Y(n1393) );
  NOR2X1 U1384 ( .A(N217), .B(n1393), .Y(n1394) );
  OAI21X1 U1385 ( .A(\mem[2][7] ), .B(n1395), .C(n1394), .Y(n1399) );
  NOR2X1 U1386 ( .A(n1399), .B(n1398), .Y(n1400) );
  AOI22X1 U1387 ( .A(n1403), .B(n1402), .C(n1401), .D(n1400), .Y(n1404) );
  NAND2X1 U1388 ( .A(n1389), .B(n46), .Y(n1382) );
  OAI21X1 U1389 ( .A(\mem[13][6] ), .B(n37), .C(n1389), .Y(n1365) );
  OAI21X1 U1390 ( .A(\mem[13][5] ), .B(n37), .C(n1389), .Y(n1348) );
  OAI21X1 U1391 ( .A(\mem[13][4] ), .B(n37), .C(n1389), .Y(n1331) );
  OAI21X1 U1392 ( .A(\mem[13][3] ), .B(n37), .C(n1389), .Y(n1314) );
  OAI21X1 U1393 ( .A(\mem[13][2] ), .B(n37), .C(n1389), .Y(n1297) );
  OAI21X1 U1394 ( .A(\mem[13][1] ), .B(n37), .C(n1389), .Y(n1281) );
  OAI21X1 U1395 ( .A(clear), .B(n37), .C(n1389), .Y(n1260) );
  NAND2X1 U1396 ( .A(n1386), .B(n1397), .Y(n1384) );
  OAI21X1 U1397 ( .A(n16), .B(n25), .C(n1397), .Y(n1369) );
  OAI21X1 U1398 ( .A(n651), .B(n25), .C(n1397), .Y(n1352) );
  OAI21X1 U1399 ( .A(n15), .B(n25), .C(n1397), .Y(n1335) );
  OAI21X1 U1400 ( .A(n17), .B(n25), .C(n1397), .Y(n1318) );
  OAI21X1 U1401 ( .A(n652), .B(n25), .C(n1397), .Y(n1301) );
  OAI21X1 U1402 ( .A(n33), .B(n25), .C(n1397), .Y(n1284) );
  OAI21X1 U1403 ( .A(n653), .B(n25), .C(n1397), .Y(n1268) );
  OAI21X1 U1404 ( .A(\mem[13][7] ), .B(n37), .C(n1387), .Y(n1383) );
  NAND2X1 U1405 ( .A(n1387), .B(n1386), .Y(n1366) );
  NAND2X1 U1406 ( .A(n1387), .B(n1386), .Y(n1349) );
  NAND2X1 U1407 ( .A(n1387), .B(n1386), .Y(n1332) );
  NAND2X1 U1408 ( .A(n1387), .B(n1386), .Y(n1315) );
  NAND2X1 U1409 ( .A(n1387), .B(n1386), .Y(n1298) );
  NAND2X1 U1410 ( .A(n1387), .B(n1386), .Y(n1261) );
  NAND2X1 U1411 ( .A(n1395), .B(n1368), .Y(n1370) );
  NAND2X1 U1412 ( .A(n1395), .B(n1351), .Y(n1353) );
  NAND2X1 U1413 ( .A(n1395), .B(n1334), .Y(n1336) );
  NAND2X1 U1414 ( .A(n1395), .B(n1317), .Y(n1319) );
  NAND2X1 U1415 ( .A(n1395), .B(n1300), .Y(n1302) );
  NAND2X1 U1416 ( .A(n1395), .B(n1283), .Y(n1285) );
  NAND2X1 U1417 ( .A(n1395), .B(n1265), .Y(n1269) );
  NAND2X1 U1418 ( .A(n1389), .B(n37), .Y(n1390) );
  NAND2X1 U1419 ( .A(n1389), .B(n37), .Y(n1371) );
  NAND2X1 U1420 ( .A(n1389), .B(n37), .Y(n1354) );
  NAND2X1 U1421 ( .A(n1389), .B(n37), .Y(n1337) );
  NAND2X1 U1422 ( .A(n1389), .B(n37), .Y(n1320) );
  NAND2X1 U1423 ( .A(n1389), .B(n37), .Y(n1303) );
  OAI21X1 U1424 ( .A(\mem[5][1] ), .B(n37), .C(n1389), .Y(n1286) );
  NAND2X1 U1425 ( .A(n1397), .B(n25), .Y(n1398) );
  NAND2X1 U1426 ( .A(n1397), .B(n25), .Y(n1375) );
  OAI21X1 U1427 ( .A(\mem[4][5] ), .B(n25), .C(n1397), .Y(n1358) );
  OAI21X1 U1428 ( .A(\mem[4][4] ), .B(n25), .C(n1397), .Y(n1341) );
  OAI21X1 U1429 ( .A(\mem[4][3] ), .B(n25), .C(n1397), .Y(n1324) );
  OAI21X1 U1430 ( .A(\mem[4][2] ), .B(n25), .C(n1397), .Y(n1307) );
  OAI21X1 U1431 ( .A(\mem[4][1] ), .B(n25), .C(n1397), .Y(n1290) );
  INVX2 U1432 ( .A(N216), .Y(n1405) );
  INVX2 U1433 ( .A(n1404), .Y(N684) );
  INVX2 U1434 ( .A(n1381), .Y(N685) );
  INVX2 U1435 ( .A(n1364), .Y(N686) );
  INVX2 U1436 ( .A(n1347), .Y(N687) );
  INVX2 U1437 ( .A(n1330), .Y(N688) );
  INVX2 U1438 ( .A(n1313), .Y(N689) );
  INVX2 U1439 ( .A(n1296), .Y(N690) );
  INVX2 U1440 ( .A(n1280), .Y(N691) );
  NOR2X1 U1441 ( .A(n2446), .B(N208), .Y(n1408) );
  NAND2X1 U1442 ( .A(n1408), .B(n501), .Y(n1533) );
  NOR2X1 U1443 ( .A(N207), .B(N208), .Y(n1409) );
  NAND2X1 U1444 ( .A(n1409), .B(n501), .Y(n1532) );
  NOR2X1 U1445 ( .A(n1552), .B(n2446), .Y(n1412) );
  NAND2X1 U1446 ( .A(n501), .B(n1412), .Y(n1535) );
  NOR2X1 U1447 ( .A(n1552), .B(N207), .Y(n1413) );
  NAND2X1 U1448 ( .A(n1413), .B(n501), .Y(n1534) );
  NOR2X1 U1449 ( .A(n1407), .B(n1406), .Y(n1425) );
  NAND2X1 U1450 ( .A(n1408), .B(n31), .Y(n1541) );
  NAND2X1 U1451 ( .A(n1409), .B(n31), .Y(n1538) );
  NOR2X1 U1452 ( .A(\mem[8][0] ), .B(n1538), .Y(n1410) );
  NOR2X1 U1453 ( .A(n1551), .B(n1410), .Y(n1411) );
  NAND2X1 U1454 ( .A(n1412), .B(n31), .Y(n1543) );
  NAND2X1 U1455 ( .A(n1413), .B(n31), .Y(n1542) );
  NOR2X1 U1456 ( .A(n1415), .B(n1414), .Y(n1424) );
  OAI22X1 U1457 ( .A(\mem[3][0] ), .B(n1533), .C(\mem[1][0] ), .D(n1532), .Y(
        n1417) );
  OAI22X1 U1458 ( .A(\mem[7][0] ), .B(n1535), .C(\mem[5][0] ), .D(n20), .Y(
        n1416) );
  NOR2X1 U1459 ( .A(n1417), .B(n1416), .Y(n1423) );
  NOR2X1 U1460 ( .A(\mem[0][0] ), .B(n1538), .Y(n1418) );
  NOR2X1 U1461 ( .A(N209), .B(n1418), .Y(n1419) );
  OAI21X1 U1462 ( .A(\mem[2][0] ), .B(n1541), .C(n1419), .Y(n1421) );
  OAI22X1 U1463 ( .A(\mem[6][0] ), .B(n1543), .C(\mem[4][0] ), .D(n39), .Y(
        n1420) );
  NOR2X1 U1464 ( .A(n1421), .B(n1420), .Y(n1422) );
  AOI22X1 U1465 ( .A(n1425), .B(n1424), .C(n1423), .D(n1422), .Y(n1426) );
  NOR2X1 U1466 ( .A(n1407), .B(n1427), .Y(n1441) );
  NOR2X1 U1467 ( .A(\mem[8][1] ), .B(n1538), .Y(n1428) );
  NOR2X1 U1468 ( .A(n1551), .B(n1428), .Y(n1429) );
  NOR2X1 U1469 ( .A(n1431), .B(n1430), .Y(n1440) );
  OAI22X1 U1470 ( .A(\mem[3][1] ), .B(n1533), .C(\mem[1][1] ), .D(n1532), .Y(
        n1433) );
  NOR2X1 U1471 ( .A(n1433), .B(n1432), .Y(n1439) );
  NOR2X1 U1472 ( .A(\mem[0][1] ), .B(n1538), .Y(n1434) );
  NOR2X1 U1473 ( .A(N209), .B(n1434), .Y(n1435) );
  OAI21X1 U1474 ( .A(\mem[2][1] ), .B(n1541), .C(n1435), .Y(n1437) );
  NOR2X1 U1475 ( .A(n1437), .B(n1436), .Y(n1438) );
  AOI22X1 U1476 ( .A(n1441), .B(n1440), .C(n1439), .D(n1438), .Y(n1442) );
  NOR2X1 U1477 ( .A(n1444), .B(n1443), .Y(n1458) );
  NOR2X1 U1478 ( .A(\mem[8][2] ), .B(n1538), .Y(n1445) );
  NOR2X1 U1479 ( .A(n1551), .B(n1445), .Y(n1446) );
  NOR2X1 U1480 ( .A(n1448), .B(n1447), .Y(n1457) );
  OAI22X1 U1481 ( .A(\mem[3][2] ), .B(n1533), .C(\mem[1][2] ), .D(n1532), .Y(
        n1450) );
  NOR2X1 U1482 ( .A(n1450), .B(n1449), .Y(n1456) );
  NOR2X1 U1483 ( .A(\mem[0][2] ), .B(n1538), .Y(n1451) );
  NOR2X1 U1484 ( .A(N209), .B(n1451), .Y(n1452) );
  OAI21X1 U1485 ( .A(\mem[2][2] ), .B(n1541), .C(n1452), .Y(n1454) );
  NOR2X1 U1486 ( .A(n1454), .B(n1453), .Y(n1455) );
  AOI22X1 U1487 ( .A(n1458), .B(n1457), .C(n1456), .D(n1455), .Y(n1459) );
  NOR2X1 U1488 ( .A(n1461), .B(n1460), .Y(n1475) );
  NOR2X1 U1489 ( .A(\mem[8][3] ), .B(n1538), .Y(n1462) );
  NOR2X1 U1490 ( .A(n1551), .B(n1462), .Y(n1463) );
  NOR2X1 U1491 ( .A(n1465), .B(n1464), .Y(n1474) );
  OAI22X1 U1492 ( .A(\mem[3][3] ), .B(n1533), .C(\mem[1][3] ), .D(n1532), .Y(
        n1467) );
  NOR2X1 U1493 ( .A(n1467), .B(n1466), .Y(n1473) );
  NOR2X1 U1494 ( .A(\mem[0][3] ), .B(n1538), .Y(n1468) );
  NOR2X1 U1495 ( .A(N209), .B(n1468), .Y(n1469) );
  OAI21X1 U1496 ( .A(\mem[2][3] ), .B(n1541), .C(n1469), .Y(n1471) );
  NOR2X1 U1497 ( .A(n1471), .B(n1470), .Y(n1472) );
  AOI22X1 U1498 ( .A(n1475), .B(n1474), .C(n1473), .D(n1472), .Y(n1476) );
  NOR2X1 U1499 ( .A(n1478), .B(n1477), .Y(n1492) );
  NOR2X1 U1500 ( .A(\mem[8][4] ), .B(n1538), .Y(n1479) );
  NOR2X1 U1501 ( .A(n1551), .B(n1479), .Y(n1480) );
  NOR2X1 U1502 ( .A(n1482), .B(n1481), .Y(n1491) );
  OAI22X1 U1503 ( .A(\mem[3][4] ), .B(n1533), .C(\mem[1][4] ), .D(n1532), .Y(
        n1484) );
  NOR2X1 U1504 ( .A(n1484), .B(n1483), .Y(n1490) );
  NOR2X1 U1505 ( .A(\mem[0][4] ), .B(n1538), .Y(n1485) );
  NOR2X1 U1506 ( .A(N209), .B(n1485), .Y(n1486) );
  OAI21X1 U1507 ( .A(\mem[2][4] ), .B(n1541), .C(n1486), .Y(n1488) );
  NOR2X1 U1508 ( .A(n1488), .B(n1487), .Y(n1489) );
  AOI22X1 U1509 ( .A(n1492), .B(n1491), .C(n1490), .D(n1489), .Y(n1493) );
  NOR2X1 U1510 ( .A(n1495), .B(n1494), .Y(n1509) );
  NOR2X1 U1511 ( .A(\mem[8][5] ), .B(n1538), .Y(n1496) );
  NOR2X1 U1512 ( .A(n1551), .B(n1496), .Y(n1497) );
  NOR2X1 U1513 ( .A(n1499), .B(n1498), .Y(n1508) );
  OAI22X1 U1514 ( .A(\mem[3][5] ), .B(n1533), .C(\mem[1][5] ), .D(n1532), .Y(
        n1501) );
  NOR2X1 U1515 ( .A(n1501), .B(n1500), .Y(n1507) );
  NOR2X1 U1516 ( .A(\mem[0][5] ), .B(n1538), .Y(n1502) );
  NOR2X1 U1517 ( .A(N209), .B(n1502), .Y(n1503) );
  OAI21X1 U1518 ( .A(\mem[2][5] ), .B(n1541), .C(n1503), .Y(n1505) );
  NOR2X1 U1519 ( .A(n1505), .B(n1504), .Y(n1506) );
  AOI22X1 U1520 ( .A(n1509), .B(n1508), .C(n1507), .D(n1506), .Y(n1510) );
  NOR2X1 U1521 ( .A(n1512), .B(n1511), .Y(n1526) );
  NOR2X1 U1522 ( .A(\mem[8][6] ), .B(n1538), .Y(n1513) );
  NOR2X1 U1523 ( .A(n1551), .B(n1513), .Y(n1514) );
  NOR2X1 U1524 ( .A(n1516), .B(n1515), .Y(n1525) );
  OAI22X1 U1525 ( .A(\mem[3][6] ), .B(n1533), .C(\mem[1][6] ), .D(n1532), .Y(
        n1518) );
  NOR2X1 U1526 ( .A(n1518), .B(n1517), .Y(n1524) );
  NOR2X1 U1527 ( .A(\mem[0][6] ), .B(n1538), .Y(n1519) );
  NOR2X1 U1528 ( .A(N209), .B(n1519), .Y(n1520) );
  OAI21X1 U1529 ( .A(\mem[2][6] ), .B(n1541), .C(n1520), .Y(n1522) );
  NOR2X1 U1530 ( .A(n1522), .B(n1521), .Y(n1523) );
  AOI22X1 U1531 ( .A(n1526), .B(n1525), .C(n1524), .D(n1523), .Y(n1527) );
  NOR2X1 U1532 ( .A(n1529), .B(n1528), .Y(n1549) );
  OAI21X1 U1533 ( .A(n14), .B(n39), .C(n9), .Y(n1531) );
  NOR2X1 U1534 ( .A(n1531), .B(n1530), .Y(n1548) );
  OAI22X1 U1535 ( .A(\mem[3][7] ), .B(n1533), .C(\mem[1][7] ), .D(n1532), .Y(
        n1537) );
  NOR2X1 U1536 ( .A(n1537), .B(n1536), .Y(n1547) );
  NOR2X1 U1537 ( .A(\mem[0][7] ), .B(n1538), .Y(n1539) );
  NOR2X1 U1538 ( .A(N209), .B(n1539), .Y(n1540) );
  OAI21X1 U1539 ( .A(\mem[2][7] ), .B(n1541), .C(n1540), .Y(n1545) );
  NOR2X1 U1540 ( .A(n1545), .B(n1544), .Y(n1546) );
  AOI22X1 U1541 ( .A(n1549), .B(n1548), .C(n1547), .D(n1546), .Y(n1550) );
  NAND2X1 U1542 ( .A(n1535), .B(N209), .Y(n1528) );
  OAI21X1 U1543 ( .A(\mem[13][6] ), .B(n20), .C(n1535), .Y(n1511) );
  OAI21X1 U1544 ( .A(\mem[13][5] ), .B(n20), .C(n1535), .Y(n1494) );
  OAI21X1 U1545 ( .A(\mem[13][4] ), .B(n20), .C(n1535), .Y(n1477) );
  OAI21X1 U1546 ( .A(\mem[13][3] ), .B(n20), .C(n1535), .Y(n1460) );
  OAI21X1 U1547 ( .A(\mem[13][2] ), .B(n20), .C(n1535), .Y(n1443) );
  OAI21X1 U1548 ( .A(\mem[13][1] ), .B(n20), .C(n1535), .Y(n1427) );
  OAI21X1 U1549 ( .A(clear), .B(n20), .C(n1535), .Y(n1406) );
  NAND2X1 U1550 ( .A(n1532), .B(n1543), .Y(n1530) );
  OAI21X1 U1551 ( .A(n16), .B(n39), .C(n1543), .Y(n1515) );
  OAI21X1 U1552 ( .A(n502), .B(n39), .C(n1543), .Y(n1498) );
  OAI21X1 U1553 ( .A(n15), .B(n39), .C(n1543), .Y(n1481) );
  OAI21X1 U1554 ( .A(n17), .B(n39), .C(n1543), .Y(n1464) );
  OAI21X1 U1555 ( .A(n503), .B(n39), .C(n1543), .Y(n1447) );
  OAI21X1 U1556 ( .A(n33), .B(n39), .C(n1543), .Y(n1430) );
  OAI21X1 U1557 ( .A(n504), .B(n39), .C(n1543), .Y(n1414) );
  OAI21X1 U1558 ( .A(\mem[13][7] ), .B(n20), .C(n1533), .Y(n1529) );
  NAND2X1 U1559 ( .A(n1533), .B(n1532), .Y(n1512) );
  NAND2X1 U1560 ( .A(n1533), .B(n1532), .Y(n1495) );
  NAND2X1 U1561 ( .A(n1533), .B(n1532), .Y(n1478) );
  NAND2X1 U1562 ( .A(n1533), .B(n1532), .Y(n1461) );
  NAND2X1 U1563 ( .A(n1533), .B(n1532), .Y(n1444) );
  NAND2X1 U1564 ( .A(n1533), .B(n1532), .Y(n1407) );
  NAND2X1 U1565 ( .A(n1541), .B(n1514), .Y(n1516) );
  NAND2X1 U1566 ( .A(n1541), .B(n1497), .Y(n1499) );
  NAND2X1 U1567 ( .A(n1541), .B(n1480), .Y(n1482) );
  NAND2X1 U1568 ( .A(n1541), .B(n1463), .Y(n1465) );
  NAND2X1 U1569 ( .A(n1541), .B(n1446), .Y(n1448) );
  NAND2X1 U1570 ( .A(n1541), .B(n1429), .Y(n1431) );
  NAND2X1 U1571 ( .A(n1541), .B(n1411), .Y(n1415) );
  NAND2X1 U1572 ( .A(n1535), .B(n20), .Y(n1536) );
  NAND2X1 U1573 ( .A(n1535), .B(n20), .Y(n1517) );
  NAND2X1 U1574 ( .A(n1535), .B(n20), .Y(n1500) );
  NAND2X1 U1575 ( .A(n1535), .B(n20), .Y(n1483) );
  NAND2X1 U1576 ( .A(n1535), .B(n20), .Y(n1466) );
  NAND2X1 U1577 ( .A(n1535), .B(n20), .Y(n1449) );
  OAI21X1 U1578 ( .A(\mem[5][1] ), .B(n20), .C(n1535), .Y(n1432) );
  NAND2X1 U1579 ( .A(n1543), .B(n39), .Y(n1544) );
  NAND2X1 U1580 ( .A(n1543), .B(n39), .Y(n1521) );
  OAI21X1 U1581 ( .A(\mem[4][5] ), .B(n39), .C(n1543), .Y(n1504) );
  OAI21X1 U1582 ( .A(\mem[4][4] ), .B(n39), .C(n1543), .Y(n1487) );
  OAI21X1 U1583 ( .A(\mem[4][3] ), .B(n39), .C(n1543), .Y(n1470) );
  OAI21X1 U1584 ( .A(\mem[4][2] ), .B(n39), .C(n1543), .Y(n1453) );
  OAI21X1 U1585 ( .A(\mem[4][1] ), .B(n39), .C(n1543), .Y(n1436) );
  INVX2 U1586 ( .A(N209), .Y(n1551) );
  INVX2 U1587 ( .A(N208), .Y(n1552) );
  INVX2 U1588 ( .A(n1550), .Y(N803) );
  INVX2 U1589 ( .A(n1527), .Y(N804) );
  INVX2 U1590 ( .A(n1510), .Y(N805) );
  INVX2 U1591 ( .A(n1493), .Y(N806) );
  INVX2 U1592 ( .A(n1476), .Y(N807) );
  INVX2 U1593 ( .A(n1459), .Y(N808) );
  INVX2 U1594 ( .A(n1442), .Y(N809) );
  INVX2 U1595 ( .A(n1426), .Y(N810) );
  NOR2X1 U1596 ( .A(N183), .B(N212), .Y(n1555) );
  NAND2X1 U1597 ( .A(n1555), .B(N210), .Y(n1680) );
  NOR2X1 U1598 ( .A(n2447), .B(N212), .Y(n1556) );
  NAND2X1 U1599 ( .A(n1556), .B(N210), .Y(n1679) );
  NOR2X1 U1600 ( .A(n1698), .B(N183), .Y(n1559) );
  NAND2X1 U1601 ( .A(N210), .B(n1559), .Y(n1682) );
  NOR2X1 U1602 ( .A(n1698), .B(n2447), .Y(n1560) );
  NAND2X1 U1603 ( .A(n1560), .B(N210), .Y(n1681) );
  NOR2X1 U1604 ( .A(n1554), .B(n1553), .Y(n1572) );
  NAND2X1 U1605 ( .A(n1555), .B(n501), .Y(n1688) );
  NAND2X1 U1606 ( .A(n1556), .B(n501), .Y(n1685) );
  NOR2X1 U1607 ( .A(\mem[8][0] ), .B(n1685), .Y(n1557) );
  NOR2X1 U1608 ( .A(n1699), .B(n1557), .Y(n1558) );
  NAND2X1 U1609 ( .A(n1559), .B(n501), .Y(n1690) );
  NAND2X1 U1610 ( .A(n1560), .B(n501), .Y(n1689) );
  NOR2X1 U1611 ( .A(n1562), .B(n1561), .Y(n1571) );
  OAI22X1 U1612 ( .A(\mem[3][0] ), .B(n1680), .C(\mem[1][0] ), .D(n1679), .Y(
        n1564) );
  OAI22X1 U1613 ( .A(\mem[7][0] ), .B(n1682), .C(\mem[5][0] ), .D(n18), .Y(
        n1563) );
  NOR2X1 U1614 ( .A(n1564), .B(n1563), .Y(n1570) );
  NOR2X1 U1615 ( .A(\mem[0][0] ), .B(n1685), .Y(n1565) );
  NOR2X1 U1616 ( .A(N213), .B(n1565), .Y(n1566) );
  OAI21X1 U1617 ( .A(\mem[2][0] ), .B(n1688), .C(n1566), .Y(n1568) );
  OAI22X1 U1618 ( .A(\mem[6][0] ), .B(n1690), .C(\mem[4][0] ), .D(n41), .Y(
        n1567) );
  NOR2X1 U1619 ( .A(n1568), .B(n1567), .Y(n1569) );
  AOI22X1 U1620 ( .A(n1572), .B(n1571), .C(n1570), .D(n1569), .Y(n1573) );
  NOR2X1 U1621 ( .A(n1554), .B(n1574), .Y(n1588) );
  NOR2X1 U1622 ( .A(\mem[8][1] ), .B(n1685), .Y(n1575) );
  NOR2X1 U1623 ( .A(n1699), .B(n1575), .Y(n1576) );
  NOR2X1 U1624 ( .A(n1578), .B(n1577), .Y(n1587) );
  OAI22X1 U1625 ( .A(\mem[3][1] ), .B(n1680), .C(\mem[1][1] ), .D(n1679), .Y(
        n1580) );
  NOR2X1 U1626 ( .A(n1580), .B(n1579), .Y(n1586) );
  NOR2X1 U1627 ( .A(\mem[0][1] ), .B(n1685), .Y(n1581) );
  NOR2X1 U1628 ( .A(N213), .B(n1581), .Y(n1582) );
  OAI21X1 U1629 ( .A(\mem[2][1] ), .B(n1688), .C(n1582), .Y(n1584) );
  NOR2X1 U1630 ( .A(n1584), .B(n1583), .Y(n1585) );
  AOI22X1 U1631 ( .A(n1588), .B(n1587), .C(n1586), .D(n1585), .Y(n1589) );
  NOR2X1 U1632 ( .A(n1591), .B(n1590), .Y(n1605) );
  NOR2X1 U1633 ( .A(\mem[8][2] ), .B(n1685), .Y(n1592) );
  NOR2X1 U1634 ( .A(n1699), .B(n1592), .Y(n1593) );
  NOR2X1 U1635 ( .A(n1595), .B(n1594), .Y(n1604) );
  OAI22X1 U1636 ( .A(\mem[3][2] ), .B(n1680), .C(\mem[1][2] ), .D(n1679), .Y(
        n1597) );
  NOR2X1 U1637 ( .A(n1597), .B(n1596), .Y(n1603) );
  NOR2X1 U1638 ( .A(\mem[0][2] ), .B(n1685), .Y(n1598) );
  NOR2X1 U1639 ( .A(N213), .B(n1598), .Y(n1599) );
  OAI21X1 U1640 ( .A(\mem[2][2] ), .B(n1688), .C(n1599), .Y(n1601) );
  NOR2X1 U1641 ( .A(n1601), .B(n1600), .Y(n1602) );
  AOI22X1 U1642 ( .A(n1605), .B(n1604), .C(n1603), .D(n1602), .Y(n1606) );
  NOR2X1 U1643 ( .A(n1608), .B(n1607), .Y(n1622) );
  NOR2X1 U1644 ( .A(\mem[8][3] ), .B(n1685), .Y(n1609) );
  NOR2X1 U1645 ( .A(n1699), .B(n1609), .Y(n1610) );
  NOR2X1 U1646 ( .A(n1612), .B(n1611), .Y(n1621) );
  OAI22X1 U1647 ( .A(\mem[3][3] ), .B(n1680), .C(\mem[1][3] ), .D(n1679), .Y(
        n1614) );
  NOR2X1 U1648 ( .A(n1614), .B(n1613), .Y(n1620) );
  NOR2X1 U1649 ( .A(\mem[0][3] ), .B(n1685), .Y(n1615) );
  NOR2X1 U1650 ( .A(N213), .B(n1615), .Y(n1616) );
  OAI21X1 U1651 ( .A(\mem[2][3] ), .B(n1688), .C(n1616), .Y(n1618) );
  NOR2X1 U1652 ( .A(n1618), .B(n1617), .Y(n1619) );
  AOI22X1 U1653 ( .A(n1622), .B(n1621), .C(n1620), .D(n1619), .Y(n1623) );
  NOR2X1 U1654 ( .A(n1625), .B(n1624), .Y(n1639) );
  NOR2X1 U1655 ( .A(\mem[8][4] ), .B(n1685), .Y(n1626) );
  NOR2X1 U1656 ( .A(n1699), .B(n1626), .Y(n1627) );
  NOR2X1 U1657 ( .A(n1629), .B(n1628), .Y(n1638) );
  OAI22X1 U1658 ( .A(\mem[3][4] ), .B(n1680), .C(\mem[1][4] ), .D(n1679), .Y(
        n1631) );
  NOR2X1 U1659 ( .A(n1631), .B(n1630), .Y(n1637) );
  NOR2X1 U1660 ( .A(\mem[0][4] ), .B(n1685), .Y(n1632) );
  NOR2X1 U1661 ( .A(N213), .B(n1632), .Y(n1633) );
  OAI21X1 U1662 ( .A(\mem[2][4] ), .B(n1688), .C(n1633), .Y(n1635) );
  NOR2X1 U1663 ( .A(n1635), .B(n1634), .Y(n1636) );
  AOI22X1 U1664 ( .A(n1639), .B(n1638), .C(n1637), .D(n1636), .Y(n1640) );
  NOR2X1 U1665 ( .A(n1642), .B(n1641), .Y(n1656) );
  NOR2X1 U1666 ( .A(\mem[8][5] ), .B(n1685), .Y(n1643) );
  NOR2X1 U1667 ( .A(n1699), .B(n1643), .Y(n1644) );
  NOR2X1 U1668 ( .A(n1646), .B(n1645), .Y(n1655) );
  OAI22X1 U1669 ( .A(\mem[3][5] ), .B(n1680), .C(\mem[1][5] ), .D(n1679), .Y(
        n1648) );
  NOR2X1 U1670 ( .A(n1648), .B(n1647), .Y(n1654) );
  NOR2X1 U1671 ( .A(\mem[0][5] ), .B(n1685), .Y(n1649) );
  NOR2X1 U1672 ( .A(N213), .B(n1649), .Y(n1650) );
  OAI21X1 U1673 ( .A(\mem[2][5] ), .B(n1688), .C(n1650), .Y(n1652) );
  NOR2X1 U1674 ( .A(n1652), .B(n1651), .Y(n1653) );
  AOI22X1 U1675 ( .A(n1656), .B(n1655), .C(n1654), .D(n1653), .Y(n1657) );
  NOR2X1 U1676 ( .A(n1659), .B(n1658), .Y(n1673) );
  NOR2X1 U1677 ( .A(\mem[8][6] ), .B(n1685), .Y(n1660) );
  NOR2X1 U1678 ( .A(n1699), .B(n1660), .Y(n1661) );
  NOR2X1 U1679 ( .A(n1663), .B(n1662), .Y(n1672) );
  OAI22X1 U1680 ( .A(\mem[3][6] ), .B(n1680), .C(\mem[1][6] ), .D(n1679), .Y(
        n1665) );
  NOR2X1 U1681 ( .A(n1665), .B(n1664), .Y(n1671) );
  NOR2X1 U1682 ( .A(\mem[0][6] ), .B(n1685), .Y(n1666) );
  NOR2X1 U1683 ( .A(N213), .B(n1666), .Y(n1667) );
  OAI21X1 U1684 ( .A(\mem[2][6] ), .B(n1688), .C(n1667), .Y(n1669) );
  NOR2X1 U1685 ( .A(n1669), .B(n1668), .Y(n1670) );
  AOI22X1 U1686 ( .A(n1673), .B(n1672), .C(n1671), .D(n1670), .Y(n1674) );
  NOR2X1 U1687 ( .A(n1676), .B(n1675), .Y(n1696) );
  OAI21X1 U1688 ( .A(n14), .B(n41), .C(n10), .Y(n1678) );
  NOR2X1 U1689 ( .A(n1678), .B(n1677), .Y(n1695) );
  OAI22X1 U1690 ( .A(\mem[3][7] ), .B(n1680), .C(\mem[1][7] ), .D(n1679), .Y(
        n1684) );
  NOR2X1 U1691 ( .A(n1684), .B(n1683), .Y(n1694) );
  NOR2X1 U1692 ( .A(\mem[0][7] ), .B(n1685), .Y(n1686) );
  NOR2X1 U1693 ( .A(N213), .B(n1686), .Y(n1687) );
  OAI21X1 U1694 ( .A(\mem[2][7] ), .B(n1688), .C(n1687), .Y(n1692) );
  NOR2X1 U1695 ( .A(n1692), .B(n1691), .Y(n1693) );
  AOI22X1 U1696 ( .A(n1696), .B(n1695), .C(n1694), .D(n1693), .Y(n1697) );
  NAND2X1 U1697 ( .A(n1682), .B(N213), .Y(n1675) );
  OAI21X1 U1698 ( .A(\mem[13][6] ), .B(n18), .C(n1682), .Y(n1658) );
  OAI21X1 U1699 ( .A(\mem[13][5] ), .B(n18), .C(n1682), .Y(n1641) );
  OAI21X1 U1700 ( .A(\mem[13][4] ), .B(n18), .C(n1682), .Y(n1624) );
  OAI21X1 U1701 ( .A(\mem[13][3] ), .B(n18), .C(n1682), .Y(n1607) );
  OAI21X1 U1702 ( .A(\mem[13][2] ), .B(n18), .C(n1682), .Y(n1590) );
  OAI21X1 U1703 ( .A(\mem[13][1] ), .B(n18), .C(n1682), .Y(n1574) );
  OAI21X1 U1704 ( .A(clear), .B(n18), .C(n1682), .Y(n1553) );
  NAND2X1 U1705 ( .A(n1679), .B(n1690), .Y(n1677) );
  OAI21X1 U1706 ( .A(n16), .B(n41), .C(n1690), .Y(n1662) );
  OAI21X1 U1707 ( .A(n352), .B(n41), .C(n1690), .Y(n1645) );
  OAI21X1 U1708 ( .A(n15), .B(n41), .C(n1690), .Y(n1628) );
  OAI21X1 U1709 ( .A(n17), .B(n41), .C(n1690), .Y(n1611) );
  OAI21X1 U1710 ( .A(n353), .B(n41), .C(n1690), .Y(n1594) );
  OAI21X1 U1711 ( .A(n33), .B(n41), .C(n1690), .Y(n1577) );
  OAI21X1 U1712 ( .A(n354), .B(n41), .C(n1690), .Y(n1561) );
  OAI21X1 U1713 ( .A(\mem[13][7] ), .B(n18), .C(n1680), .Y(n1676) );
  NAND2X1 U1714 ( .A(n1680), .B(n1679), .Y(n1659) );
  NAND2X1 U1715 ( .A(n1680), .B(n1679), .Y(n1642) );
  NAND2X1 U1716 ( .A(n1680), .B(n1679), .Y(n1625) );
  NAND2X1 U1717 ( .A(n1680), .B(n1679), .Y(n1608) );
  NAND2X1 U1718 ( .A(n1680), .B(n1679), .Y(n1591) );
  NAND2X1 U1719 ( .A(n1680), .B(n1679), .Y(n1554) );
  NAND2X1 U1720 ( .A(n1688), .B(n1661), .Y(n1663) );
  NAND2X1 U1721 ( .A(n1688), .B(n1644), .Y(n1646) );
  NAND2X1 U1722 ( .A(n1688), .B(n1627), .Y(n1629) );
  NAND2X1 U1723 ( .A(n1688), .B(n1610), .Y(n1612) );
  NAND2X1 U1724 ( .A(n1688), .B(n1593), .Y(n1595) );
  NAND2X1 U1725 ( .A(n1688), .B(n1576), .Y(n1578) );
  NAND2X1 U1726 ( .A(n1688), .B(n1558), .Y(n1562) );
  NAND2X1 U1727 ( .A(n1682), .B(n18), .Y(n1683) );
  NAND2X1 U1728 ( .A(n1682), .B(n18), .Y(n1664) );
  NAND2X1 U1729 ( .A(n1682), .B(n18), .Y(n1647) );
  NAND2X1 U1730 ( .A(n1682), .B(n18), .Y(n1630) );
  NAND2X1 U1731 ( .A(n1682), .B(n18), .Y(n1613) );
  NAND2X1 U1732 ( .A(n1682), .B(n18), .Y(n1596) );
  OAI21X1 U1733 ( .A(\mem[5][1] ), .B(n18), .C(n1682), .Y(n1579) );
  NAND2X1 U1734 ( .A(n1690), .B(n41), .Y(n1691) );
  NAND2X1 U1735 ( .A(n1690), .B(n41), .Y(n1668) );
  OAI21X1 U1736 ( .A(\mem[4][5] ), .B(n41), .C(n1690), .Y(n1651) );
  OAI21X1 U1737 ( .A(\mem[4][4] ), .B(n41), .C(n1690), .Y(n1634) );
  OAI21X1 U1738 ( .A(\mem[4][3] ), .B(n41), .C(n1690), .Y(n1617) );
  OAI21X1 U1739 ( .A(\mem[4][2] ), .B(n41), .C(n1690), .Y(n1600) );
  OAI21X1 U1740 ( .A(\mem[4][1] ), .B(n41), .C(n1690), .Y(n1583) );
  INVX2 U1741 ( .A(N212), .Y(n1698) );
  INVX2 U1742 ( .A(N213), .Y(n1699) );
  INVX2 U1743 ( .A(n1697), .Y(N811) );
  INVX2 U1744 ( .A(n1674), .Y(N812) );
  INVX2 U1745 ( .A(n1657), .Y(N813) );
  INVX2 U1746 ( .A(n1640), .Y(N814) );
  INVX2 U1747 ( .A(n1623), .Y(N815) );
  INVX2 U1748 ( .A(n1606), .Y(N816) );
  INVX2 U1749 ( .A(n1589), .Y(N817) );
  INVX2 U1750 ( .A(n1573), .Y(N818) );
  NOR2X1 U1751 ( .A(N207), .B(N216), .Y(n1702) );
  NAND2X1 U1752 ( .A(n1702), .B(n501), .Y(n1827) );
  NOR2X1 U1753 ( .A(n2446), .B(N216), .Y(n1703) );
  NAND2X1 U1754 ( .A(n1703), .B(n501), .Y(n1826) );
  NOR2X1 U1755 ( .A(n1405), .B(N207), .Y(n1706) );
  NAND2X1 U1756 ( .A(n501), .B(n1706), .Y(n1829) );
  NOR2X1 U1757 ( .A(n1405), .B(n2446), .Y(n1707) );
  NAND2X1 U1758 ( .A(n1707), .B(n501), .Y(n1828) );
  NOR2X1 U1759 ( .A(n1701), .B(n1700), .Y(n1719) );
  NAND2X1 U1760 ( .A(n1702), .B(n31), .Y(n1835) );
  NAND2X1 U1761 ( .A(n1703), .B(n31), .Y(n1832) );
  NOR2X1 U1762 ( .A(\mem[8][0] ), .B(n1832), .Y(n1704) );
  NOR2X1 U1763 ( .A(n1845), .B(n1704), .Y(n1705) );
  NAND2X1 U1764 ( .A(n1706), .B(n31), .Y(n1837) );
  NAND2X1 U1765 ( .A(n1707), .B(n31), .Y(n1836) );
  NOR2X1 U1766 ( .A(n1709), .B(n1708), .Y(n1718) );
  OAI22X1 U1767 ( .A(\mem[3][0] ), .B(n1827), .C(\mem[1][0] ), .D(n1826), .Y(
        n1711) );
  OAI22X1 U1768 ( .A(\mem[7][0] ), .B(n1829), .C(\mem[5][0] ), .D(n28), .Y(
        n1710) );
  NOR2X1 U1769 ( .A(n1711), .B(n1710), .Y(n1717) );
  NOR2X1 U1770 ( .A(\mem[0][0] ), .B(n1832), .Y(n1712) );
  NOR2X1 U1771 ( .A(N217), .B(n1712), .Y(n1713) );
  OAI21X1 U1772 ( .A(\mem[2][0] ), .B(n1835), .C(n1713), .Y(n1715) );
  OAI22X1 U1773 ( .A(\mem[6][0] ), .B(n1837), .C(\mem[4][0] ), .D(n24), .Y(
        n1714) );
  NOR2X1 U1774 ( .A(n1715), .B(n1714), .Y(n1716) );
  AOI22X1 U1775 ( .A(n1719), .B(n1718), .C(n1717), .D(n1716), .Y(n1720) );
  NOR2X1 U1776 ( .A(n1701), .B(n1721), .Y(n1735) );
  NOR2X1 U1777 ( .A(\mem[8][1] ), .B(n1832), .Y(n1722) );
  NOR2X1 U1778 ( .A(n1845), .B(n1722), .Y(n1723) );
  NOR2X1 U1779 ( .A(n1725), .B(n1724), .Y(n1734) );
  OAI22X1 U1780 ( .A(\mem[3][1] ), .B(n1827), .C(\mem[1][1] ), .D(n1826), .Y(
        n1727) );
  NOR2X1 U1781 ( .A(n1727), .B(n1726), .Y(n1733) );
  NOR2X1 U1782 ( .A(\mem[0][1] ), .B(n1832), .Y(n1728) );
  NOR2X1 U1783 ( .A(N217), .B(n1728), .Y(n1729) );
  OAI21X1 U1784 ( .A(\mem[2][1] ), .B(n1835), .C(n1729), .Y(n1731) );
  NOR2X1 U1785 ( .A(n1731), .B(n1730), .Y(n1732) );
  AOI22X1 U1786 ( .A(n1735), .B(n1734), .C(n1733), .D(n1732), .Y(n1736) );
  NOR2X1 U1787 ( .A(n1738), .B(n1737), .Y(n1752) );
  NOR2X1 U1788 ( .A(\mem[8][2] ), .B(n1832), .Y(n1739) );
  NOR2X1 U1789 ( .A(n1845), .B(n1739), .Y(n1740) );
  NOR2X1 U1790 ( .A(n1742), .B(n1741), .Y(n1751) );
  OAI22X1 U1791 ( .A(\mem[3][2] ), .B(n1827), .C(\mem[1][2] ), .D(n1826), .Y(
        n1744) );
  NOR2X1 U1792 ( .A(n1744), .B(n1743), .Y(n1750) );
  NOR2X1 U1793 ( .A(\mem[0][2] ), .B(n1832), .Y(n1745) );
  NOR2X1 U1794 ( .A(N217), .B(n1745), .Y(n1746) );
  OAI21X1 U1795 ( .A(\mem[2][2] ), .B(n1835), .C(n1746), .Y(n1748) );
  NOR2X1 U1796 ( .A(n1748), .B(n1747), .Y(n1749) );
  AOI22X1 U1797 ( .A(n1752), .B(n1751), .C(n1750), .D(n1749), .Y(n1753) );
  NOR2X1 U1798 ( .A(n1755), .B(n1754), .Y(n1769) );
  NOR2X1 U1799 ( .A(\mem[8][3] ), .B(n1832), .Y(n1756) );
  NOR2X1 U1800 ( .A(n1845), .B(n1756), .Y(n1757) );
  NOR2X1 U1801 ( .A(n1759), .B(n1758), .Y(n1768) );
  OAI22X1 U1802 ( .A(\mem[3][3] ), .B(n1827), .C(\mem[1][3] ), .D(n1826), .Y(
        n1761) );
  NOR2X1 U1803 ( .A(n1761), .B(n1760), .Y(n1767) );
  NOR2X1 U1804 ( .A(\mem[0][3] ), .B(n1832), .Y(n1762) );
  NOR2X1 U1805 ( .A(N217), .B(n1762), .Y(n1763) );
  OAI21X1 U1806 ( .A(\mem[2][3] ), .B(n1835), .C(n1763), .Y(n1765) );
  NOR2X1 U1807 ( .A(n1765), .B(n1764), .Y(n1766) );
  AOI22X1 U1808 ( .A(n1769), .B(n1768), .C(n1767), .D(n1766), .Y(n1770) );
  NOR2X1 U1809 ( .A(n1772), .B(n1771), .Y(n1786) );
  NOR2X1 U1810 ( .A(\mem[8][4] ), .B(n1832), .Y(n1773) );
  NOR2X1 U1811 ( .A(n1845), .B(n1773), .Y(n1774) );
  NOR2X1 U1812 ( .A(n1776), .B(n1775), .Y(n1785) );
  OAI22X1 U1813 ( .A(\mem[3][4] ), .B(n1827), .C(\mem[1][4] ), .D(n1826), .Y(
        n1778) );
  NOR2X1 U1814 ( .A(n1778), .B(n1777), .Y(n1784) );
  NOR2X1 U1815 ( .A(\mem[0][4] ), .B(n1832), .Y(n1779) );
  NOR2X1 U1816 ( .A(N217), .B(n1779), .Y(n1780) );
  OAI21X1 U1817 ( .A(\mem[2][4] ), .B(n1835), .C(n1780), .Y(n1782) );
  NOR2X1 U1818 ( .A(n1782), .B(n1781), .Y(n1783) );
  AOI22X1 U1819 ( .A(n1786), .B(n1785), .C(n1784), .D(n1783), .Y(n1787) );
  NOR2X1 U1820 ( .A(n1789), .B(n1788), .Y(n1803) );
  NOR2X1 U1821 ( .A(\mem[8][5] ), .B(n1832), .Y(n1790) );
  NOR2X1 U1822 ( .A(n1845), .B(n1790), .Y(n1791) );
  NOR2X1 U1823 ( .A(n1793), .B(n1792), .Y(n1802) );
  OAI22X1 U1824 ( .A(\mem[3][5] ), .B(n1827), .C(\mem[1][5] ), .D(n1826), .Y(
        n1795) );
  NOR2X1 U1825 ( .A(n1795), .B(n1794), .Y(n1801) );
  NOR2X1 U1826 ( .A(\mem[0][5] ), .B(n1832), .Y(n1796) );
  NOR2X1 U1827 ( .A(N217), .B(n1796), .Y(n1797) );
  OAI21X1 U1828 ( .A(\mem[2][5] ), .B(n1835), .C(n1797), .Y(n1799) );
  NOR2X1 U1829 ( .A(n1799), .B(n1798), .Y(n1800) );
  AOI22X1 U1830 ( .A(n1803), .B(n1802), .C(n1801), .D(n1800), .Y(n1804) );
  NOR2X1 U1831 ( .A(n1806), .B(n1805), .Y(n1820) );
  NOR2X1 U1832 ( .A(\mem[8][6] ), .B(n1832), .Y(n1807) );
  NOR2X1 U1833 ( .A(n1845), .B(n1807), .Y(n1808) );
  NOR2X1 U1834 ( .A(n1810), .B(n1809), .Y(n1819) );
  OAI22X1 U1835 ( .A(\mem[3][6] ), .B(n1827), .C(\mem[1][6] ), .D(n1826), .Y(
        n1812) );
  NOR2X1 U1836 ( .A(n1812), .B(n1811), .Y(n1818) );
  NOR2X1 U1837 ( .A(\mem[0][6] ), .B(n1832), .Y(n1813) );
  NOR2X1 U1838 ( .A(N217), .B(n1813), .Y(n1814) );
  OAI21X1 U1839 ( .A(\mem[2][6] ), .B(n1835), .C(n1814), .Y(n1816) );
  NOR2X1 U1840 ( .A(n1816), .B(n1815), .Y(n1817) );
  AOI22X1 U1841 ( .A(n1820), .B(n1819), .C(n1818), .D(n1817), .Y(n1821) );
  NOR2X1 U1842 ( .A(n1823), .B(n1822), .Y(n1843) );
  OAI21X1 U1843 ( .A(n14), .B(n24), .C(n11), .Y(n1825) );
  NOR2X1 U1844 ( .A(n1825), .B(n1824), .Y(n1842) );
  OAI22X1 U1845 ( .A(\mem[3][7] ), .B(n1827), .C(\mem[1][7] ), .D(n1826), .Y(
        n1831) );
  NOR2X1 U1846 ( .A(n1831), .B(n1830), .Y(n1841) );
  NOR2X1 U1847 ( .A(\mem[0][7] ), .B(n1832), .Y(n1833) );
  NOR2X1 U1848 ( .A(n46), .B(n1833), .Y(n1834) );
  OAI21X1 U1849 ( .A(\mem[2][7] ), .B(n1835), .C(n1834), .Y(n1839) );
  NOR2X1 U1850 ( .A(n1839), .B(n1838), .Y(n1840) );
  AOI22X1 U1851 ( .A(n1843), .B(n1842), .C(n1841), .D(n1840), .Y(n1844) );
  NAND2X1 U1852 ( .A(n1829), .B(n46), .Y(n1822) );
  OAI21X1 U1853 ( .A(\mem[13][6] ), .B(n28), .C(n1829), .Y(n1805) );
  OAI21X1 U1854 ( .A(\mem[13][5] ), .B(n28), .C(n1829), .Y(n1788) );
  OAI21X1 U1855 ( .A(\mem[13][4] ), .B(n28), .C(n1829), .Y(n1771) );
  OAI21X1 U1856 ( .A(\mem[13][3] ), .B(n28), .C(n1829), .Y(n1754) );
  OAI21X1 U1857 ( .A(\mem[13][2] ), .B(n28), .C(n1829), .Y(n1737) );
  OAI21X1 U1858 ( .A(\mem[13][1] ), .B(n28), .C(n1829), .Y(n1721) );
  OAI21X1 U1859 ( .A(clear), .B(n28), .C(n1829), .Y(n1700) );
  NAND2X1 U1860 ( .A(n1826), .B(n1837), .Y(n1824) );
  OAI21X1 U1861 ( .A(n16), .B(n24), .C(n1837), .Y(n1809) );
  OAI21X1 U1862 ( .A(n203), .B(n24), .C(n1837), .Y(n1792) );
  OAI21X1 U1863 ( .A(n15), .B(n24), .C(n1837), .Y(n1775) );
  OAI21X1 U1864 ( .A(n17), .B(n24), .C(n1837), .Y(n1758) );
  OAI21X1 U1865 ( .A(n204), .B(n24), .C(n1837), .Y(n1741) );
  OAI21X1 U1866 ( .A(n33), .B(n24), .C(n1837), .Y(n1724) );
  OAI21X1 U1867 ( .A(n205), .B(n24), .C(n1837), .Y(n1708) );
  OAI21X1 U1868 ( .A(\mem[13][7] ), .B(n28), .C(n1827), .Y(n1823) );
  NAND2X1 U1869 ( .A(n1827), .B(n1826), .Y(n1806) );
  NAND2X1 U1870 ( .A(n1827), .B(n1826), .Y(n1789) );
  NAND2X1 U1871 ( .A(n1827), .B(n1826), .Y(n1772) );
  NAND2X1 U1872 ( .A(n1827), .B(n1826), .Y(n1755) );
  NAND2X1 U1873 ( .A(n1827), .B(n1826), .Y(n1738) );
  NAND2X1 U1874 ( .A(n1827), .B(n1826), .Y(n1701) );
  NAND2X1 U1875 ( .A(n1835), .B(n1808), .Y(n1810) );
  NAND2X1 U1876 ( .A(n1835), .B(n1791), .Y(n1793) );
  NAND2X1 U1877 ( .A(n1835), .B(n1774), .Y(n1776) );
  NAND2X1 U1878 ( .A(n1835), .B(n1757), .Y(n1759) );
  NAND2X1 U1879 ( .A(n1835), .B(n1740), .Y(n1742) );
  NAND2X1 U1880 ( .A(n1835), .B(n1723), .Y(n1725) );
  NAND2X1 U1881 ( .A(n1835), .B(n1705), .Y(n1709) );
  NAND2X1 U1882 ( .A(n1829), .B(n28), .Y(n1830) );
  NAND2X1 U1883 ( .A(n1829), .B(n28), .Y(n1811) );
  NAND2X1 U1884 ( .A(n1829), .B(n28), .Y(n1794) );
  NAND2X1 U1885 ( .A(n1829), .B(n28), .Y(n1777) );
  NAND2X1 U1886 ( .A(n1829), .B(n28), .Y(n1760) );
  NAND2X1 U1887 ( .A(n1829), .B(n28), .Y(n1743) );
  OAI21X1 U1888 ( .A(\mem[5][1] ), .B(n28), .C(n1829), .Y(n1726) );
  NAND2X1 U1889 ( .A(n1837), .B(n24), .Y(n1838) );
  NAND2X1 U1890 ( .A(n1837), .B(n24), .Y(n1815) );
  OAI21X1 U1891 ( .A(\mem[4][5] ), .B(n24), .C(n1837), .Y(n1798) );
  OAI21X1 U1892 ( .A(\mem[4][4] ), .B(n24), .C(n1837), .Y(n1781) );
  OAI21X1 U1893 ( .A(\mem[4][3] ), .B(n24), .C(n1837), .Y(n1764) );
  OAI21X1 U1894 ( .A(\mem[4][2] ), .B(n24), .C(n1837), .Y(n1747) );
  OAI21X1 U1895 ( .A(\mem[4][1] ), .B(n24), .C(n1837), .Y(n1730) );
  INVX2 U1896 ( .A(n1844), .Y(N819) );
  INVX2 U1897 ( .A(n1821), .Y(N820) );
  INVX2 U1898 ( .A(n1804), .Y(N821) );
  INVX2 U1899 ( .A(n1787), .Y(N822) );
  INVX2 U1900 ( .A(n1770), .Y(N823) );
  INVX2 U1901 ( .A(n1753), .Y(N824) );
  INVX2 U1902 ( .A(n1736), .Y(N825) );
  INVX2 U1903 ( .A(n1720), .Y(N826) );
  NAND3X1 U1904 ( .A(n1846), .B(n2449), .C(n1847), .Y(tx_packet[2]) );
  INVX1 U1905 ( .A(n1848), .Y(n1847) );
  XNOR2X1 U1906 ( .A(n33), .B(n2450), .Y(n1846) );
  NAND2X1 U1907 ( .A(n1849), .B(n1850), .Y(tx_packet[1]) );
  INVX1 U1908 ( .A(n1851), .Y(n1849) );
  MUX2X1 U1909 ( .B(n33), .A(\mem[12][2] ), .S(n2450), .Y(n1851) );
  NAND2X1 U1910 ( .A(n1850), .B(\mem[12][0] ), .Y(tx_packet[0]) );
  AOI21X1 U1911 ( .A(\mem[12][2] ), .B(n33), .C(n1848), .Y(n1850) );
  NAND3X1 U1912 ( .A(n1852), .B(n2448), .C(n1853), .Y(n1848) );
  NOR2X1 U1913 ( .A(n15), .B(n17), .Y(n1853) );
  NOR2X1 U1914 ( .A(n14), .B(n16), .Y(n1852) );
  AND2X1 U1915 ( .A(N254), .B(n1854), .Y(next_tx_data[7]) );
  AND2X1 U1916 ( .A(N255), .B(n1854), .Y(next_tx_data[6]) );
  AND2X1 U1917 ( .A(N256), .B(n1854), .Y(next_tx_data[5]) );
  AND2X1 U1918 ( .A(N257), .B(n1854), .Y(next_tx_data[4]) );
  AND2X1 U1919 ( .A(N258), .B(n1854), .Y(next_tx_data[3]) );
  AND2X1 U1920 ( .A(N259), .B(n1854), .Y(next_tx_data[2]) );
  AND2X1 U1921 ( .A(N260), .B(n1854), .Y(next_tx_data[1]) );
  AND2X1 U1922 ( .A(N261), .B(n1854), .Y(next_tx_data[0]) );
  NAND2X1 U1923 ( .A(n1855), .B(n1856), .Y(\next_mem[3][7] ) );
  AOI22X1 U1924 ( .A(n1857), .B(n1858), .C(n1859), .D(n1860), .Y(n1856) );
  MUX2X1 U1925 ( .B(rx_data[7]), .A(n1861), .S(n1862), .Y(n1855) );
  NAND2X1 U1926 ( .A(n1863), .B(n1864), .Y(n1861) );
  AOI22X1 U1927 ( .A(hwdata[31]), .B(n1865), .C(hwdata[23]), .D(n48), .Y(n1864) );
  INVX1 U1928 ( .A(n1867), .Y(n1863) );
  OAI21X1 U1929 ( .A(n1868), .B(n1869), .C(n1870), .Y(n1867) );
  AOI22X1 U1930 ( .A(n1871), .B(hwdata[7]), .C(\mem[3][7] ), .D(n1872), .Y(
        n1870) );
  NAND2X1 U1931 ( .A(n1873), .B(n1874), .Y(\next_mem[3][6] ) );
  MUX2X1 U1932 ( .B(rx_data[6]), .A(n1875), .S(n1862), .Y(n1874) );
  NAND2X1 U1933 ( .A(n1876), .B(n1877), .Y(n1875) );
  AOI22X1 U1934 ( .A(n34), .B(hwdata[30]), .C(n48), .D(hwdata[22]), .Y(n1877)
         );
  INVX1 U1935 ( .A(n1878), .Y(n1876) );
  OAI21X1 U1936 ( .A(n1869), .B(n1879), .C(n1880), .Y(n1878) );
  AOI22X1 U1937 ( .A(hwdata[6]), .B(n1871), .C(\mem[3][6] ), .D(n1872), .Y(
        n1880) );
  AOI22X1 U1938 ( .A(n1860), .B(n1881), .C(n1858), .D(n1882), .Y(n1873) );
  NAND2X1 U1939 ( .A(n1883), .B(n1884), .Y(\next_mem[3][5] ) );
  MUX2X1 U1940 ( .B(rx_data[5]), .A(n1885), .S(n1862), .Y(n1884) );
  NAND2X1 U1941 ( .A(n1886), .B(n1887), .Y(n1885) );
  AOI22X1 U1942 ( .A(n34), .B(hwdata[29]), .C(n48), .D(hwdata[21]), .Y(n1887)
         );
  INVX1 U1943 ( .A(n1888), .Y(n1886) );
  OAI21X1 U1944 ( .A(n1869), .B(n1889), .C(n1890), .Y(n1888) );
  AOI22X1 U1945 ( .A(hwdata[5]), .B(n1871), .C(\mem[3][5] ), .D(n1872), .Y(
        n1890) );
  AOI22X1 U1946 ( .A(n1860), .B(n1891), .C(n1858), .D(n1892), .Y(n1883) );
  NAND2X1 U1947 ( .A(n1893), .B(n1894), .Y(\next_mem[3][4] ) );
  MUX2X1 U1948 ( .B(rx_data[4]), .A(n1895), .S(n1862), .Y(n1894) );
  NAND2X1 U1949 ( .A(n1896), .B(n1897), .Y(n1895) );
  AOI22X1 U1950 ( .A(n34), .B(hwdata[28]), .C(n48), .D(hwdata[20]), .Y(n1897)
         );
  INVX1 U1951 ( .A(n1898), .Y(n1896) );
  OAI21X1 U1952 ( .A(n1869), .B(n1899), .C(n1900), .Y(n1898) );
  AOI22X1 U1953 ( .A(hwdata[4]), .B(n1871), .C(\mem[3][4] ), .D(n1872), .Y(
        n1900) );
  AOI22X1 U1954 ( .A(n1860), .B(n1901), .C(n1858), .D(n1902), .Y(n1893) );
  NAND2X1 U1955 ( .A(n1903), .B(n1904), .Y(\next_mem[3][3] ) );
  MUX2X1 U1956 ( .B(rx_data[3]), .A(n1905), .S(n1862), .Y(n1904) );
  NAND2X1 U1957 ( .A(n1906), .B(n1907), .Y(n1905) );
  AOI22X1 U1958 ( .A(n34), .B(hwdata[27]), .C(n48), .D(hwdata[19]), .Y(n1907)
         );
  INVX1 U1959 ( .A(n1908), .Y(n1906) );
  OAI21X1 U1960 ( .A(n1869), .B(n1909), .C(n1910), .Y(n1908) );
  AOI22X1 U1961 ( .A(hwdata[3]), .B(n1871), .C(\mem[3][3] ), .D(n1872), .Y(
        n1910) );
  AOI22X1 U1962 ( .A(n1860), .B(n1911), .C(n1858), .D(n1912), .Y(n1903) );
  NAND2X1 U1963 ( .A(n1913), .B(n1914), .Y(\next_mem[3][2] ) );
  MUX2X1 U1964 ( .B(rx_data[2]), .A(n1915), .S(n1862), .Y(n1914) );
  NAND2X1 U1965 ( .A(n1916), .B(n1917), .Y(n1915) );
  AOI22X1 U1966 ( .A(n34), .B(hwdata[26]), .C(n48), .D(hwdata[18]), .Y(n1917)
         );
  INVX1 U1967 ( .A(n1918), .Y(n1916) );
  OAI21X1 U1968 ( .A(n1869), .B(n1919), .C(n1920), .Y(n1918) );
  AOI22X1 U1969 ( .A(hwdata[2]), .B(n1871), .C(\mem[3][2] ), .D(n1872), .Y(
        n1920) );
  AOI22X1 U1970 ( .A(n1860), .B(n1921), .C(n1858), .D(n1922), .Y(n1913) );
  NAND2X1 U1971 ( .A(n1923), .B(n1924), .Y(\next_mem[3][1] ) );
  MUX2X1 U1972 ( .B(rx_data[1]), .A(n1925), .S(n1862), .Y(n1924) );
  NAND2X1 U1973 ( .A(n1926), .B(n1927), .Y(n1925) );
  AOI22X1 U1974 ( .A(n34), .B(hwdata[25]), .C(n48), .D(hwdata[17]), .Y(n1927)
         );
  INVX1 U1975 ( .A(n1928), .Y(n1926) );
  OAI21X1 U1976 ( .A(n1869), .B(n1929), .C(n1930), .Y(n1928) );
  AOI22X1 U1977 ( .A(hwdata[1]), .B(n1871), .C(\mem[3][1] ), .D(n1872), .Y(
        n1930) );
  AOI22X1 U1978 ( .A(n1860), .B(n1931), .C(n1858), .D(n1932), .Y(n1923) );
  NAND2X1 U1979 ( .A(n1933), .B(n1934), .Y(\next_mem[3][0] ) );
  MUX2X1 U1980 ( .B(rx_data[0]), .A(n1935), .S(n1862), .Y(n1934) );
  NAND2X1 U1981 ( .A(n1936), .B(n1937), .Y(n1935) );
  AOI22X1 U1982 ( .A(n1865), .B(hwdata[24]), .C(n48), .D(hwdata[16]), .Y(n1937) );
  INVX1 U1983 ( .A(n1938), .Y(n1936) );
  OAI21X1 U1984 ( .A(n1869), .B(n1939), .C(n1940), .Y(n1938) );
  AOI22X1 U1985 ( .A(hwdata[0]), .B(n1871), .C(\mem[3][0] ), .D(n1872), .Y(
        n1940) );
  OAI21X1 U1986 ( .A(n1941), .B(n1942), .C(n1943), .Y(n1872) );
  OAI21X1 U1987 ( .A(n1944), .B(n1945), .C(n1946), .Y(n1942) );
  NAND2X1 U1988 ( .A(n1947), .B(n1948), .Y(n1946) );
  OAI21X1 U1989 ( .A(n1949), .B(n1950), .C(n1944), .Y(n1947) );
  NOR2X1 U1990 ( .A(n1951), .B(n1944), .Y(n1871) );
  INVX1 U1991 ( .A(n1952), .Y(n1944) );
  INVX1 U1992 ( .A(n1953), .Y(n1869) );
  AOI22X1 U1993 ( .A(n1860), .B(n1954), .C(n1858), .D(n1955), .Y(n1933) );
  INVX1 U1994 ( .A(n1956), .Y(n1858) );
  NAND3X1 U1995 ( .A(prev_write_size[0]), .B(n1957), .C(n1958), .Y(n1956) );
  INVX1 U1996 ( .A(n1960), .Y(n1860) );
  NAND3X1 U1997 ( .A(n1952), .B(n1862), .C(n1957), .Y(n1960) );
  NAND3X1 U1998 ( .A(N174), .B(n1961), .C(N175), .Y(n1862) );
  NAND2X1 U1999 ( .A(n1962), .B(n1963), .Y(\next_mem[2][7] ) );
  MUX2X1 U2000 ( .B(rx_data[7]), .A(n1964), .S(n1965), .Y(n1963) );
  NAND2X1 U2001 ( .A(n1966), .B(n1967), .Y(n1964) );
  AOI22X1 U2002 ( .A(\mem[2][7] ), .B(n1968), .C(n1953), .D(hwdata[7]), .Y(
        n1967) );
  AOI22X1 U2003 ( .A(n48), .B(hwdata[15]), .C(n1865), .D(hwdata[23]), .Y(n1966) );
  AOI22X1 U2004 ( .A(n1969), .B(n1859), .C(n1970), .D(n1857), .Y(n1962) );
  NAND2X1 U2005 ( .A(n1971), .B(n1972), .Y(\next_mem[2][6] ) );
  MUX2X1 U2006 ( .B(rx_data[6]), .A(n1973), .S(n1965), .Y(n1972) );
  NAND2X1 U2007 ( .A(n1974), .B(n1975), .Y(n1973) );
  AOI22X1 U2008 ( .A(\mem[2][6] ), .B(n1968), .C(hwdata[6]), .D(n1953), .Y(
        n1975) );
  AOI22X1 U2009 ( .A(hwdata[14]), .B(n48), .C(hwdata[22]), .D(n1865), .Y(n1974) );
  AOI22X1 U2010 ( .A(n1969), .B(n1881), .C(n1970), .D(n1882), .Y(n1971) );
  NAND2X1 U2011 ( .A(n1976), .B(n1977), .Y(\next_mem[2][5] ) );
  MUX2X1 U2012 ( .B(rx_data[5]), .A(n1978), .S(n1965), .Y(n1977) );
  NAND2X1 U2013 ( .A(n1979), .B(n1980), .Y(n1978) );
  AOI22X1 U2014 ( .A(\mem[2][5] ), .B(n1968), .C(hwdata[5]), .D(n1953), .Y(
        n1980) );
  AOI22X1 U2015 ( .A(hwdata[13]), .B(n48), .C(hwdata[21]), .D(n1865), .Y(n1979) );
  AOI22X1 U2016 ( .A(n1969), .B(n1891), .C(n1970), .D(n1892), .Y(n1976) );
  NAND2X1 U2017 ( .A(n1981), .B(n1982), .Y(\next_mem[2][4] ) );
  MUX2X1 U2018 ( .B(rx_data[4]), .A(n1983), .S(n1965), .Y(n1982) );
  NAND2X1 U2019 ( .A(n1984), .B(n1985), .Y(n1983) );
  AOI22X1 U2020 ( .A(\mem[2][4] ), .B(n1968), .C(hwdata[4]), .D(n1953), .Y(
        n1985) );
  AOI22X1 U2021 ( .A(hwdata[12]), .B(n48), .C(hwdata[20]), .D(n1865), .Y(n1984) );
  AOI22X1 U2022 ( .A(n1969), .B(n1901), .C(n1970), .D(n1902), .Y(n1981) );
  NAND2X1 U2023 ( .A(n1986), .B(n1987), .Y(\next_mem[2][3] ) );
  MUX2X1 U2024 ( .B(rx_data[3]), .A(n1988), .S(n1965), .Y(n1987) );
  NAND2X1 U2025 ( .A(n1989), .B(n1990), .Y(n1988) );
  AOI22X1 U2026 ( .A(\mem[2][3] ), .B(n1968), .C(hwdata[3]), .D(n1953), .Y(
        n1990) );
  AOI22X1 U2027 ( .A(hwdata[11]), .B(n48), .C(hwdata[19]), .D(n1865), .Y(n1989) );
  AOI22X1 U2028 ( .A(n1969), .B(n1911), .C(n1970), .D(n1912), .Y(n1986) );
  NAND2X1 U2029 ( .A(n1991), .B(n1992), .Y(\next_mem[2][2] ) );
  MUX2X1 U2030 ( .B(rx_data[2]), .A(n1993), .S(n1965), .Y(n1992) );
  NAND2X1 U2031 ( .A(n1994), .B(n1995), .Y(n1993) );
  AOI22X1 U2032 ( .A(\mem[2][2] ), .B(n1968), .C(hwdata[2]), .D(n1953), .Y(
        n1995) );
  AOI22X1 U2033 ( .A(hwdata[10]), .B(n48), .C(hwdata[18]), .D(n1865), .Y(n1994) );
  AOI22X1 U2034 ( .A(n1969), .B(n1921), .C(n1970), .D(n1922), .Y(n1991) );
  NAND2X1 U2035 ( .A(n1996), .B(n1997), .Y(\next_mem[2][1] ) );
  MUX2X1 U2036 ( .B(rx_data[1]), .A(n1998), .S(n1965), .Y(n1997) );
  NAND2X1 U2037 ( .A(n1999), .B(n2000), .Y(n1998) );
  AOI22X1 U2038 ( .A(\mem[2][1] ), .B(n1968), .C(hwdata[1]), .D(n1953), .Y(
        n2000) );
  AOI22X1 U2039 ( .A(hwdata[9]), .B(n48), .C(hwdata[17]), .D(n1865), .Y(n1999)
         );
  AOI22X1 U2040 ( .A(n1969), .B(n1931), .C(n1970), .D(n1932), .Y(n1996) );
  NAND2X1 U2041 ( .A(n2001), .B(n2002), .Y(\next_mem[2][0] ) );
  MUX2X1 U2042 ( .B(rx_data[0]), .A(n2003), .S(n1965), .Y(n2002) );
  NAND2X1 U2043 ( .A(n2004), .B(n2005), .Y(n2003) );
  AOI22X1 U2044 ( .A(\mem[2][0] ), .B(n1968), .C(hwdata[0]), .D(n1953), .Y(
        n2005) );
  NOR2X1 U2045 ( .A(n1951), .B(n1949), .Y(n1953) );
  OAI21X1 U2046 ( .A(n2006), .B(n1941), .C(n1943), .Y(n1968) );
  INVX1 U2047 ( .A(n2007), .Y(n2006) );
  OAI21X1 U2048 ( .A(n2008), .B(n1959), .C(n1948), .Y(n2007) );
  AOI22X1 U2049 ( .A(hwdata[8]), .B(n48), .C(hwdata[16]), .D(n1865), .Y(n2004)
         );
  AOI22X1 U2050 ( .A(n1969), .B(n1954), .C(n1970), .D(n1955), .Y(n2001) );
  INVX1 U2051 ( .A(n2009), .Y(n1970) );
  NAND3X1 U2052 ( .A(n1957), .B(n1965), .C(n2008), .Y(n2009) );
  NOR2X1 U2053 ( .A(n1950), .B(n2010), .Y(n2008) );
  INVX1 U2054 ( .A(n2011), .Y(n1969) );
  NAND3X1 U2055 ( .A(n47), .B(n1965), .C(n1957), .Y(n2011) );
  NOR2X1 U2056 ( .A(n1941), .B(prev_write_size[1]), .Y(n1957) );
  OAI21X1 U2057 ( .A(n1949), .B(n1945), .C(n2012), .Y(n1941) );
  INVX1 U2058 ( .A(n1959), .Y(n1949) );
  NAND3X1 U2059 ( .A(n1961), .B(n2013), .C(N175), .Y(n1965) );
  NAND2X1 U2060 ( .A(n2014), .B(n2015), .Y(\next_mem[1][7] ) );
  MUX2X1 U2061 ( .B(rx_data[7]), .A(n2016), .S(n2017), .Y(n2015) );
  OAI21X1 U2062 ( .A(n1868), .B(n2018), .C(n2019), .Y(n2016) );
  AOI22X1 U2063 ( .A(n48), .B(hwdata[7]), .C(\mem[1][7] ), .D(n2020), .Y(n2019) );
  AOI22X1 U2064 ( .A(n2021), .B(n1857), .C(n2022), .D(n1859), .Y(n2014) );
  NAND2X1 U2065 ( .A(n2023), .B(n2024), .Y(\next_mem[1][6] ) );
  MUX2X1 U2066 ( .B(rx_data[6]), .A(n2025), .S(n2017), .Y(n2024) );
  OAI21X1 U2067 ( .A(n2018), .B(n1879), .C(n2026), .Y(n2025) );
  AOI22X1 U2068 ( .A(hwdata[6]), .B(n48), .C(\mem[1][6] ), .D(n2020), .Y(n2026) );
  AOI22X1 U2069 ( .A(n2021), .B(n1882), .C(n2022), .D(n1881), .Y(n2023) );
  NAND2X1 U2070 ( .A(n2027), .B(n2028), .Y(\next_mem[1][5] ) );
  MUX2X1 U2071 ( .B(rx_data[5]), .A(n2029), .S(n2017), .Y(n2028) );
  OAI21X1 U2072 ( .A(n2018), .B(n1889), .C(n2030), .Y(n2029) );
  AOI22X1 U2073 ( .A(hwdata[5]), .B(n48), .C(\mem[1][5] ), .D(n2020), .Y(n2030) );
  AOI22X1 U2074 ( .A(n2021), .B(n1892), .C(n2022), .D(n1891), .Y(n2027) );
  NAND2X1 U2075 ( .A(n2031), .B(n2032), .Y(\next_mem[1][4] ) );
  MUX2X1 U2076 ( .B(rx_data[4]), .A(n2033), .S(n2017), .Y(n2032) );
  OAI21X1 U2077 ( .A(n2018), .B(n1899), .C(n2034), .Y(n2033) );
  AOI22X1 U2078 ( .A(hwdata[4]), .B(n48), .C(\mem[1][4] ), .D(n2020), .Y(n2034) );
  AOI22X1 U2079 ( .A(n2021), .B(n1902), .C(n2022), .D(n1901), .Y(n2031) );
  NAND2X1 U2080 ( .A(n2035), .B(n2036), .Y(\next_mem[1][3] ) );
  MUX2X1 U2081 ( .B(rx_data[3]), .A(n2037), .S(n2017), .Y(n2036) );
  OAI21X1 U2082 ( .A(n2018), .B(n1909), .C(n2038), .Y(n2037) );
  AOI22X1 U2083 ( .A(hwdata[3]), .B(n48), .C(\mem[1][3] ), .D(n2020), .Y(n2038) );
  AOI22X1 U2084 ( .A(n2021), .B(n1912), .C(n2022), .D(n1911), .Y(n2035) );
  NAND2X1 U2085 ( .A(n2039), .B(n2040), .Y(\next_mem[1][2] ) );
  MUX2X1 U2086 ( .B(rx_data[2]), .A(n2041), .S(n2017), .Y(n2040) );
  OAI21X1 U2087 ( .A(n2018), .B(n1919), .C(n2042), .Y(n2041) );
  AOI22X1 U2088 ( .A(hwdata[2]), .B(n48), .C(\mem[1][2] ), .D(n2020), .Y(n2042) );
  AOI22X1 U2089 ( .A(n2021), .B(n1922), .C(n2022), .D(n1921), .Y(n2039) );
  NAND2X1 U2090 ( .A(n2043), .B(n2044), .Y(\next_mem[1][1] ) );
  MUX2X1 U2091 ( .B(rx_data[1]), .A(n2045), .S(n2017), .Y(n2044) );
  OAI21X1 U2092 ( .A(n2018), .B(n1929), .C(n2046), .Y(n2045) );
  AOI22X1 U2093 ( .A(hwdata[1]), .B(n48), .C(\mem[1][1] ), .D(n2020), .Y(n2046) );
  AOI22X1 U2094 ( .A(n2021), .B(n1932), .C(n2022), .D(n1931), .Y(n2043) );
  NAND2X1 U2095 ( .A(n2047), .B(n2048), .Y(\next_mem[1][0] ) );
  MUX2X1 U2096 ( .B(rx_data[0]), .A(n2049), .S(n2017), .Y(n2048) );
  OAI21X1 U2097 ( .A(n2018), .B(n1939), .C(n2050), .Y(n2049) );
  AOI22X1 U2098 ( .A(hwdata[0]), .B(n48), .C(\mem[1][0] ), .D(n2020), .Y(n2050) );
  OAI21X1 U2099 ( .A(n2051), .B(n2052), .C(n1943), .Y(n2020) );
  AOI21X1 U2100 ( .A(n2053), .B(n2010), .C(prev_write_size[1]), .Y(n2051) );
  NOR2X1 U2101 ( .A(n1951), .B(n2010), .Y(n1866) );
  AOI22X1 U2102 ( .A(n2021), .B(n1955), .C(n2022), .D(n1954), .Y(n2047) );
  NOR2X1 U2103 ( .A(n2054), .B(n2010), .Y(n2022) );
  NOR2X1 U2104 ( .A(n2054), .B(n2053), .Y(n2021) );
  NAND2X1 U2105 ( .A(prev_write_size[0]), .B(n2055), .Y(n2053) );
  NAND3X1 U2106 ( .A(n2017), .B(n1948), .C(n2012), .Y(n2054) );
  INVX1 U2107 ( .A(n2052), .Y(n2012) );
  OAI21X1 U2108 ( .A(n1945), .B(n2010), .C(n2056), .Y(n2052) );
  NAND2X1 U2109 ( .A(n2057), .B(n35), .Y(n2010) );
  NAND3X1 U2110 ( .A(n1961), .B(n2059), .C(N174), .Y(n2017) );
  NAND2X1 U2111 ( .A(n2060), .B(n2061), .Y(\next_mem[13][7] ) );
  AOI22X1 U2112 ( .A(n2062), .B(n2063), .C(n2064), .D(n1857), .Y(n2061) );
  OAI21X1 U2113 ( .A(n1868), .B(n2065), .C(n2066), .Y(n1857) );
  AOI22X1 U2114 ( .A(hwdata[31]), .B(n47), .C(n35), .D(hwdata[23]), .Y(n2066)
         );
  INVX1 U2115 ( .A(hwdata[15]), .Y(n1868) );
  OAI21X1 U2116 ( .A(n2067), .B(n2068), .C(n2069), .Y(n2063) );
  AOI22X1 U2117 ( .A(\mem[13][7] ), .B(n2070), .C(n2071), .D(hwdata[15]), .Y(
        n2069) );
  AOI22X1 U2118 ( .A(n2072), .B(rx_data[7]), .C(n2073), .D(n1859), .Y(n2060)
         );
  NAND2X1 U2119 ( .A(n2074), .B(n2075), .Y(\next_mem[13][6] ) );
  AOI22X1 U2120 ( .A(n2062), .B(n2076), .C(n2064), .D(n1882), .Y(n2075) );
  OAI21X1 U2121 ( .A(n2065), .B(n1879), .C(n2077), .Y(n1882) );
  AOI22X1 U2122 ( .A(hwdata[30]), .B(n47), .C(hwdata[22]), .D(n35), .Y(n2077)
         );
  INVX1 U2123 ( .A(hwdata[14]), .Y(n1879) );
  OAI21X1 U2124 ( .A(n2078), .B(n2068), .C(n2079), .Y(n2076) );
  AOI22X1 U2125 ( .A(\mem[13][6] ), .B(n2070), .C(n2071), .D(hwdata[14]), .Y(
        n2079) );
  AOI22X1 U2126 ( .A(n2072), .B(rx_data[6]), .C(n2073), .D(n1881), .Y(n2074)
         );
  NAND2X1 U2127 ( .A(n2080), .B(n2081), .Y(\next_mem[13][5] ) );
  AOI22X1 U2128 ( .A(n2062), .B(n2082), .C(n2064), .D(n1892), .Y(n2081) );
  OAI21X1 U2129 ( .A(n2065), .B(n1889), .C(n2083), .Y(n1892) );
  AOI22X1 U2130 ( .A(hwdata[29]), .B(n47), .C(hwdata[21]), .D(n35), .Y(n2083)
         );
  INVX1 U2131 ( .A(hwdata[13]), .Y(n1889) );
  OAI21X1 U2132 ( .A(n2084), .B(n2068), .C(n2085), .Y(n2082) );
  AOI22X1 U2133 ( .A(\mem[13][5] ), .B(n2070), .C(n2071), .D(hwdata[13]), .Y(
        n2085) );
  AOI22X1 U2134 ( .A(n2072), .B(rx_data[5]), .C(n2073), .D(n1891), .Y(n2080)
         );
  NAND2X1 U2135 ( .A(n2086), .B(n2087), .Y(\next_mem[13][4] ) );
  AOI22X1 U2136 ( .A(n2062), .B(n2088), .C(n2064), .D(n1902), .Y(n2087) );
  OAI21X1 U2137 ( .A(n2065), .B(n1899), .C(n2089), .Y(n1902) );
  AOI22X1 U2138 ( .A(hwdata[28]), .B(n47), .C(hwdata[20]), .D(n35), .Y(n2089)
         );
  INVX1 U2139 ( .A(hwdata[12]), .Y(n1899) );
  OAI21X1 U2140 ( .A(n2090), .B(n2068), .C(n2091), .Y(n2088) );
  AOI22X1 U2141 ( .A(\mem[13][4] ), .B(n2070), .C(n2071), .D(hwdata[12]), .Y(
        n2091) );
  AOI22X1 U2142 ( .A(n2072), .B(rx_data[4]), .C(n2073), .D(n1901), .Y(n2086)
         );
  NAND2X1 U2143 ( .A(n2092), .B(n2093), .Y(\next_mem[13][3] ) );
  AOI22X1 U2144 ( .A(n2062), .B(n2094), .C(n2064), .D(n1912), .Y(n2093) );
  OAI21X1 U2145 ( .A(n2065), .B(n1909), .C(n2095), .Y(n1912) );
  AOI22X1 U2146 ( .A(hwdata[27]), .B(n47), .C(hwdata[19]), .D(n35), .Y(n2095)
         );
  INVX1 U2147 ( .A(hwdata[11]), .Y(n1909) );
  OAI21X1 U2148 ( .A(n2096), .B(n2068), .C(n2097), .Y(n2094) );
  AOI22X1 U2149 ( .A(\mem[13][3] ), .B(n2070), .C(n2071), .D(hwdata[11]), .Y(
        n2097) );
  AOI22X1 U2150 ( .A(n2072), .B(rx_data[3]), .C(n2073), .D(n1911), .Y(n2092)
         );
  NAND2X1 U2151 ( .A(n2098), .B(n2099), .Y(\next_mem[13][2] ) );
  AOI22X1 U2152 ( .A(n2062), .B(n2100), .C(n2064), .D(n1922), .Y(n2099) );
  OAI21X1 U2153 ( .A(n2065), .B(n1919), .C(n2101), .Y(n1922) );
  AOI22X1 U2154 ( .A(hwdata[26]), .B(n47), .C(hwdata[18]), .D(n35), .Y(n2101)
         );
  INVX1 U2155 ( .A(hwdata[10]), .Y(n1919) );
  OAI21X1 U2156 ( .A(n2102), .B(n2068), .C(n2103), .Y(n2100) );
  AOI22X1 U2157 ( .A(\mem[13][2] ), .B(n2070), .C(n2071), .D(hwdata[10]), .Y(
        n2103) );
  AOI22X1 U2158 ( .A(n2072), .B(rx_data[2]), .C(n2073), .D(n1921), .Y(n2098)
         );
  NAND2X1 U2159 ( .A(n2104), .B(n2105), .Y(\next_mem[13][1] ) );
  AOI22X1 U2160 ( .A(n2062), .B(n2106), .C(n2064), .D(n1932), .Y(n2105) );
  OAI21X1 U2161 ( .A(n2065), .B(n1929), .C(n2107), .Y(n1932) );
  AOI22X1 U2162 ( .A(hwdata[25]), .B(n1959), .C(hwdata[17]), .D(n35), .Y(n2107) );
  INVX1 U2163 ( .A(hwdata[9]), .Y(n1929) );
  OAI21X1 U2164 ( .A(n2108), .B(n2068), .C(n2109), .Y(n2106) );
  AOI22X1 U2165 ( .A(\mem[13][1] ), .B(n2070), .C(n2071), .D(hwdata[9]), .Y(
        n2109) );
  OAI21X1 U2166 ( .A(n2110), .B(n2111), .C(n1943), .Y(n2070) );
  AOI21X1 U2167 ( .A(n2112), .B(n2113), .C(prev_write_size[1]), .Y(n2110) );
  AOI22X1 U2168 ( .A(n2072), .B(rx_data[1]), .C(n2073), .D(n1931), .Y(n2104)
         );
  NAND2X1 U2169 ( .A(n2114), .B(n2115), .Y(\next_mem[13][0] ) );
  AOI22X1 U2170 ( .A(n2062), .B(n2116), .C(n2064), .D(n1955), .Y(n2115) );
  OAI21X1 U2171 ( .A(n2065), .B(n1939), .C(n2117), .Y(n1955) );
  AOI22X1 U2172 ( .A(hwdata[24]), .B(n1959), .C(hwdata[16]), .D(n35), .Y(n2117) );
  INVX1 U2173 ( .A(n2118), .Y(n2065) );
  NOR2X1 U2174 ( .A(n2119), .B(n2112), .Y(n2064) );
  OR2X1 U2175 ( .A(n2120), .B(n1950), .Y(n2112) );
  OAI22X1 U2176 ( .A(n2121), .B(n2068), .C(n1939), .D(n2122), .Y(n2116) );
  INVX1 U2177 ( .A(hwdata[8]), .Y(n1939) );
  INVX1 U2178 ( .A(n2123), .Y(n2068) );
  AOI22X1 U2179 ( .A(n2072), .B(rx_data[0]), .C(n2073), .D(n1954), .Y(n2114)
         );
  NOR2X1 U2180 ( .A(n2119), .B(n2113), .Y(n2073) );
  NAND3X1 U2181 ( .A(n2124), .B(n1948), .C(n2062), .Y(n2119) );
  NOR2X1 U2182 ( .A(n2125), .B(clear), .Y(n2062) );
  INVX1 U2183 ( .A(n2111), .Y(n2124) );
  OAI21X1 U2184 ( .A(n1945), .B(n2113), .C(n2126), .Y(n2111) );
  NOR2X1 U2185 ( .A(n2127), .B(clear), .Y(n2072) );
  INVX1 U2186 ( .A(n2125), .Y(n2127) );
  NOR2X1 U2187 ( .A(n2128), .B(n2013), .Y(n2125) );
  NAND2X1 U2188 ( .A(n2129), .B(n2130), .Y(\next_mem[12][7] ) );
  AOI22X1 U2189 ( .A(n2131), .B(hwdata[7]), .C(n14), .D(n2132), .Y(n2130) );
  AOI22X1 U2190 ( .A(n2133), .B(rx_data[7]), .C(n2134), .D(n1859), .Y(n2129)
         );
  NAND2X1 U2191 ( .A(n2135), .B(n2136), .Y(\next_mem[12][6] ) );
  AOI22X1 U2192 ( .A(n2131), .B(hwdata[6]), .C(n16), .D(n2132), .Y(n2136) );
  AOI22X1 U2193 ( .A(n2133), .B(rx_data[6]), .C(n2134), .D(n1881), .Y(n2135)
         );
  NAND2X1 U2194 ( .A(n2137), .B(n2138), .Y(\next_mem[12][5] ) );
  AOI22X1 U2195 ( .A(n2131), .B(hwdata[5]), .C(n2132), .D(\mem[12][5] ), .Y(
        n2138) );
  AOI22X1 U2196 ( .A(n2133), .B(rx_data[5]), .C(n2134), .D(n1891), .Y(n2137)
         );
  NAND2X1 U2197 ( .A(n2139), .B(n2140), .Y(\next_mem[12][4] ) );
  AOI22X1 U2198 ( .A(n2131), .B(hwdata[4]), .C(n15), .D(n2132), .Y(n2140) );
  AOI22X1 U2199 ( .A(n2133), .B(rx_data[4]), .C(n2134), .D(n1901), .Y(n2139)
         );
  NAND2X1 U2200 ( .A(n2141), .B(n2142), .Y(\next_mem[12][3] ) );
  AOI22X1 U2201 ( .A(n2131), .B(hwdata[3]), .C(n17), .D(n2132), .Y(n2142) );
  AOI22X1 U2202 ( .A(n2133), .B(rx_data[3]), .C(n2134), .D(n1911), .Y(n2141)
         );
  NAND2X1 U2203 ( .A(n2143), .B(n2144), .Y(\next_mem[12][2] ) );
  AOI22X1 U2204 ( .A(n2131), .B(hwdata[2]), .C(n2132), .D(\mem[12][2] ), .Y(
        n2144) );
  AOI22X1 U2205 ( .A(n2133), .B(rx_data[2]), .C(n2134), .D(n1921), .Y(n2143)
         );
  NAND2X1 U2206 ( .A(n2145), .B(n2146), .Y(\next_mem[12][1] ) );
  AOI22X1 U2207 ( .A(n2131), .B(hwdata[1]), .C(n2132), .D(n33), .Y(n2146) );
  AOI22X1 U2208 ( .A(n2133), .B(rx_data[1]), .C(n2134), .D(n1931), .Y(n2145)
         );
  NAND2X1 U2209 ( .A(n2147), .B(n2148), .Y(\next_mem[12][0] ) );
  AOI22X1 U2210 ( .A(n2131), .B(hwdata[0]), .C(n2132), .D(\mem[12][0] ), .Y(
        n2148) );
  INVX1 U2211 ( .A(n2149), .Y(n2132) );
  OAI21X1 U2212 ( .A(n2150), .B(n2151), .C(n2152), .Y(n2149) );
  NOR2X1 U2213 ( .A(n2153), .B(n2154), .Y(n2150) );
  NOR2X1 U2214 ( .A(n2155), .B(n2122), .Y(n2131) );
  INVX1 U2215 ( .A(n2071), .Y(n2122) );
  NOR2X1 U2216 ( .A(n2120), .B(n1951), .Y(n2071) );
  AOI22X1 U2217 ( .A(n2133), .B(rx_data[0]), .C(n2134), .D(n1954), .Y(n2147)
         );
  INVX1 U2218 ( .A(n2156), .Y(n2134) );
  NAND3X1 U2219 ( .A(n2152), .B(n2126), .C(n2153), .Y(n2156) );
  NOR2X1 U2220 ( .A(n2120), .B(prev_write_size[1]), .Y(n2153) );
  INVX1 U2221 ( .A(n2154), .Y(n2126) );
  OAI21X1 U2222 ( .A(n1945), .B(n2120), .C(n1943), .Y(n2154) );
  NAND3X1 U2223 ( .A(prev_write_addr[2]), .B(n2118), .C(prev_write_addr[3]), 
        .Y(n2120) );
  INVX1 U2224 ( .A(n2155), .Y(n2152) );
  OAI21X1 U2225 ( .A(N174), .B(n2128), .C(n2157), .Y(n2155) );
  INVX1 U2226 ( .A(n2158), .Y(n2133) );
  NAND3X1 U2227 ( .A(n2159), .B(n2013), .C(n2157), .Y(n2158) );
  AOI21X1 U2228 ( .A(n2160), .B(prev_tx_active), .C(tx_error), .Y(n2157) );
  INVX1 U2229 ( .A(tx_transfer_active), .Y(n2160) );
  INVX1 U2230 ( .A(n2128), .Y(n2159) );
  NAND3X1 U2231 ( .A(N177), .B(N176), .C(n2161), .Y(n2128) );
  AND2X1 U2232 ( .A(n2059), .B(prev_get_rx_data), .Y(n2161) );
  OAI21X1 U2233 ( .A(n2162), .B(n2163), .C(n2164), .Y(\next_mem[0][7] ) );
  MUX2X1 U2234 ( .B(rx_data[7]), .A(n2165), .S(n2166), .Y(n2164) );
  OAI21X1 U2235 ( .A(n2067), .B(n2018), .C(n2167), .Y(n2165) );
  AOI22X1 U2236 ( .A(n2123), .B(hwdata[31]), .C(\mem[0][7] ), .D(n2168), .Y(
        n2167) );
  INVX1 U2237 ( .A(hwdata[7]), .Y(n2067) );
  INVX1 U2238 ( .A(n1859), .Y(n2162) );
  NAND2X1 U2239 ( .A(n2169), .B(n2170), .Y(n1859) );
  AOI22X1 U2240 ( .A(hwdata[23]), .B(n1959), .C(hwdata[31]), .D(n1952), .Y(
        n2170) );
  AOI22X1 U2241 ( .A(hwdata[15]), .B(n35), .C(hwdata[7]), .D(n2118), .Y(n2169)
         );
  OAI21X1 U2242 ( .A(n2171), .B(n2163), .C(n2172), .Y(\next_mem[0][6] ) );
  MUX2X1 U2243 ( .B(rx_data[6]), .A(n2173), .S(n2166), .Y(n2172) );
  OAI21X1 U2244 ( .A(n2018), .B(n2078), .C(n2174), .Y(n2173) );
  AOI22X1 U2245 ( .A(n2123), .B(hwdata[30]), .C(\mem[0][6] ), .D(n2168), .Y(
        n2174) );
  INVX1 U2246 ( .A(hwdata[6]), .Y(n2078) );
  INVX1 U2247 ( .A(n1881), .Y(n2171) );
  NAND2X1 U2248 ( .A(n2175), .B(n2176), .Y(n1881) );
  AOI22X1 U2249 ( .A(hwdata[22]), .B(n1959), .C(hwdata[30]), .D(n1952), .Y(
        n2176) );
  AOI22X1 U2250 ( .A(hwdata[14]), .B(n35), .C(hwdata[6]), .D(n2118), .Y(n2175)
         );
  OAI21X1 U2251 ( .A(n2177), .B(n2163), .C(n2178), .Y(\next_mem[0][5] ) );
  MUX2X1 U2252 ( .B(rx_data[5]), .A(n2179), .S(n2166), .Y(n2178) );
  OAI21X1 U2253 ( .A(n2018), .B(n2084), .C(n2180), .Y(n2179) );
  AOI22X1 U2254 ( .A(n2123), .B(hwdata[29]), .C(\mem[0][5] ), .D(n2168), .Y(
        n2180) );
  INVX1 U2255 ( .A(hwdata[5]), .Y(n2084) );
  INVX1 U2256 ( .A(n1891), .Y(n2177) );
  NAND2X1 U2257 ( .A(n2181), .B(n2182), .Y(n1891) );
  AOI22X1 U2258 ( .A(hwdata[21]), .B(n1959), .C(hwdata[29]), .D(n1952), .Y(
        n2182) );
  AOI22X1 U2259 ( .A(hwdata[13]), .B(n35), .C(hwdata[5]), .D(n2118), .Y(n2181)
         );
  OAI21X1 U2260 ( .A(n2183), .B(n2163), .C(n2184), .Y(\next_mem[0][4] ) );
  MUX2X1 U2261 ( .B(rx_data[4]), .A(n2185), .S(n2166), .Y(n2184) );
  OAI21X1 U2262 ( .A(n2018), .B(n2090), .C(n2186), .Y(n2185) );
  AOI22X1 U2263 ( .A(n2123), .B(hwdata[28]), .C(\mem[0][4] ), .D(n2168), .Y(
        n2186) );
  INVX1 U2264 ( .A(hwdata[4]), .Y(n2090) );
  INVX1 U2265 ( .A(n1901), .Y(n2183) );
  NAND2X1 U2266 ( .A(n2187), .B(n2188), .Y(n1901) );
  AOI22X1 U2267 ( .A(hwdata[20]), .B(n1959), .C(hwdata[28]), .D(n1952), .Y(
        n2188) );
  AOI22X1 U2268 ( .A(hwdata[12]), .B(n35), .C(hwdata[4]), .D(n2118), .Y(n2187)
         );
  OAI21X1 U2269 ( .A(n2189), .B(n2163), .C(n2190), .Y(\next_mem[0][3] ) );
  MUX2X1 U2270 ( .B(rx_data[3]), .A(n2191), .S(n2166), .Y(n2190) );
  OAI21X1 U2271 ( .A(n2018), .B(n2096), .C(n2192), .Y(n2191) );
  AOI22X1 U2272 ( .A(n2123), .B(hwdata[27]), .C(\mem[0][3] ), .D(n2168), .Y(
        n2192) );
  INVX1 U2273 ( .A(hwdata[3]), .Y(n2096) );
  INVX1 U2274 ( .A(n1911), .Y(n2189) );
  NAND2X1 U2275 ( .A(n2193), .B(n2194), .Y(n1911) );
  AOI22X1 U2276 ( .A(hwdata[19]), .B(n1959), .C(hwdata[27]), .D(n1952), .Y(
        n2194) );
  AOI22X1 U2277 ( .A(hwdata[11]), .B(n35), .C(hwdata[3]), .D(n2118), .Y(n2193)
         );
  OAI21X1 U2278 ( .A(n2195), .B(n2163), .C(n2196), .Y(\next_mem[0][2] ) );
  MUX2X1 U2279 ( .B(rx_data[2]), .A(n2197), .S(n2166), .Y(n2196) );
  OAI21X1 U2280 ( .A(n2018), .B(n2102), .C(n2198), .Y(n2197) );
  AOI22X1 U2281 ( .A(n2123), .B(hwdata[26]), .C(\mem[0][2] ), .D(n2168), .Y(
        n2198) );
  INVX1 U2282 ( .A(hwdata[2]), .Y(n2102) );
  INVX1 U2283 ( .A(n1921), .Y(n2195) );
  NAND2X1 U2284 ( .A(n2199), .B(n2200), .Y(n1921) );
  AOI22X1 U2285 ( .A(hwdata[18]), .B(n1959), .C(hwdata[26]), .D(n1952), .Y(
        n2200) );
  AOI22X1 U2286 ( .A(hwdata[10]), .B(n35), .C(hwdata[2]), .D(n2118), .Y(n2199)
         );
  OAI21X1 U2287 ( .A(n2201), .B(n2163), .C(n2202), .Y(\next_mem[0][1] ) );
  MUX2X1 U2288 ( .B(rx_data[1]), .A(n2203), .S(n2166), .Y(n2202) );
  OAI21X1 U2289 ( .A(n2018), .B(n2108), .C(n2204), .Y(n2203) );
  AOI22X1 U2290 ( .A(n2123), .B(hwdata[25]), .C(\mem[0][1] ), .D(n2168), .Y(
        n2204) );
  INVX1 U2291 ( .A(hwdata[1]), .Y(n2108) );
  INVX1 U2292 ( .A(n1931), .Y(n2201) );
  NAND2X1 U2293 ( .A(n2205), .B(n2206), .Y(n1931) );
  AOI22X1 U2294 ( .A(hwdata[17]), .B(n1959), .C(hwdata[25]), .D(n1952), .Y(
        n2206) );
  AOI22X1 U2295 ( .A(hwdata[9]), .B(n35), .C(hwdata[1]), .D(n2118), .Y(n2205)
         );
  OAI21X1 U2296 ( .A(n2207), .B(n2163), .C(n2208), .Y(\next_mem[0][0] ) );
  MUX2X1 U2297 ( .B(rx_data[0]), .A(n2209), .S(n2166), .Y(n2208) );
  OAI21X1 U2298 ( .A(n2018), .B(n2121), .C(n2210), .Y(n2209) );
  AOI22X1 U2299 ( .A(n2123), .B(hwdata[24]), .C(\mem[0][0] ), .D(n2168), .Y(
        n2210) );
  OAI21X1 U2300 ( .A(n2211), .B(n2212), .C(n1943), .Y(n2168) );
  NOR2X1 U2301 ( .A(n2113), .B(n1951), .Y(n2123) );
  INVX1 U2302 ( .A(hwdata[0]), .Y(n2121) );
  NOR2X1 U2303 ( .A(n1951), .B(n2213), .Y(n1865) );
  NAND2X1 U2304 ( .A(n1943), .B(n2214), .Y(n1951) );
  NAND3X1 U2305 ( .A(n2211), .B(n2166), .C(n2215), .Y(n2163) );
  INVX1 U2306 ( .A(n2212), .Y(n2215) );
  OAI21X1 U2307 ( .A(n1945), .B(n2113), .C(n2056), .Y(n2212) );
  AOI21X1 U2308 ( .A(n2214), .B(n2055), .C(n2151), .Y(n2056) );
  INVX1 U2309 ( .A(n1943), .Y(n2151) );
  NOR2X1 U2310 ( .A(n2216), .B(n2217), .Y(n1943) );
  OAI21X1 U2311 ( .A(n2057), .B(n2218), .C(N1747), .Y(n2217) );
  INVX1 U2312 ( .A(n2213), .Y(n2055) );
  NAND3X1 U2313 ( .A(prev_write_addr[2]), .B(n35), .C(prev_write_addr[3]), .Y(
        n2113) );
  INVX1 U2314 ( .A(n2214), .Y(n1945) );
  NOR2X1 U2315 ( .A(n1948), .B(prev_write_size[0]), .Y(n2214) );
  NAND3X1 U2316 ( .A(n2013), .B(n2059), .C(n1961), .Y(n2166) );
  AND2X1 U2317 ( .A(prev_get_rx_data), .B(n1854), .Y(n1961) );
  NOR2X1 U2318 ( .A(N176), .B(N177), .Y(n1854) );
  INVX1 U2319 ( .A(N175), .Y(n2059) );
  INVX1 U2320 ( .A(N174), .Y(n2013) );
  NOR2X1 U2321 ( .A(n2213), .B(prev_write_size[1]), .Y(n2211) );
  NAND2X1 U2322 ( .A(n2057), .B(n2118), .Y(n2213) );
  NOR2X1 U2323 ( .A(prev_write_addr[2]), .B(prev_write_addr[3]), .Y(n2057) );
  INVX1 U2324 ( .A(n1954), .Y(n2207) );
  NAND2X1 U2325 ( .A(n2219), .B(n2220), .Y(n1954) );
  AOI22X1 U2326 ( .A(hwdata[16]), .B(n1959), .C(hwdata[24]), .D(n1952), .Y(
        n2220) );
  NOR2X1 U2327 ( .A(n2221), .B(n2218), .Y(n1952) );
  NOR2X1 U2328 ( .A(n2218), .B(prev_write_addr[0]), .Y(n1959) );
  AOI22X1 U2329 ( .A(hwdata[8]), .B(n35), .C(hwdata[0]), .D(n2118), .Y(n2219)
         );
  NOR2X1 U2330 ( .A(prev_write_addr[0]), .B(prev_write_addr[1]), .Y(n2118) );
  NOR2X1 U2331 ( .A(n2221), .B(prev_write_addr[1]), .Y(n2058) );
  INVX1 U2332 ( .A(\mem[12][5] ), .Y(n2448) );
  INVX1 U2333 ( .A(\mem[12][2] ), .Y(n2449) );
  NOR2X1 U2334 ( .A(n2222), .B(n2223), .Y(n830) );
  NAND2X1 U2335 ( .A(rx_packet[0]), .B(n2224), .Y(n2223) );
  NOR2X1 U2336 ( .A(n2222), .B(n2225), .Y(n829) );
  NAND2X1 U2337 ( .A(n2226), .B(n2224), .Y(n2225) );
  NOR2X1 U2338 ( .A(n2224), .B(n2227), .Y(n828) );
  NAND2X1 U2339 ( .A(n2226), .B(n2222), .Y(n2227) );
  NOR2X1 U2340 ( .A(rx_packet[0]), .B(n2228), .Y(n827) );
  NOR2X1 U2341 ( .A(n2226), .B(n2228), .Y(n826) );
  NAND2X1 U2342 ( .A(n2222), .B(n2224), .Y(n2228) );
  INVX1 U2343 ( .A(rx_packet[2]), .Y(n2224) );
  INVX1 U2344 ( .A(rx_packet[1]), .Y(n2222) );
  INVX1 U2345 ( .A(rx_packet[0]), .Y(n2226) );
  MUX2X1 U2346 ( .B(n2229), .A(n2216), .S(n2230), .Y(n819) );
  INVX1 U2347 ( .A(prev_hwrite), .Y(n2216) );
  NAND3X1 U2348 ( .A(n2231), .B(n2232), .C(n2233), .Y(n802) );
  NOR2X1 U2349 ( .A(n2234), .B(n2235), .Y(n2233) );
  OAI22X1 U2350 ( .A(n2236), .B(n350), .C(n2237), .D(n649), .Y(n2235) );
  OAI22X1 U2351 ( .A(n2238), .B(n499), .C(n2239), .D(n1404), .Y(n2234) );
  NAND2X1 U2352 ( .A(hrdata[31]), .B(n2240), .Y(n2232) );
  AOI22X1 U2353 ( .A(N803), .B(n2241), .C(N484), .D(n2242), .Y(n2231) );
  NAND3X1 U2354 ( .A(n2243), .B(n2244), .C(n2245), .Y(n800) );
  NOR2X1 U2355 ( .A(n2246), .B(n2247), .Y(n2245) );
  OAI22X1 U2356 ( .A(n2236), .B(n327), .C(n2237), .D(n626), .Y(n2247) );
  OAI22X1 U2357 ( .A(n2238), .B(n476), .C(n2239), .D(n1381), .Y(n2246) );
  NAND2X1 U2358 ( .A(hrdata[30]), .B(n2240), .Y(n2244) );
  AOI22X1 U2359 ( .A(N804), .B(n2241), .C(N485), .D(n2242), .Y(n2243) );
  NAND3X1 U2360 ( .A(n2248), .B(n2249), .C(n2250), .Y(n798) );
  NOR2X1 U2361 ( .A(n2251), .B(n2252), .Y(n2250) );
  OAI22X1 U2362 ( .A(n2236), .B(n310), .C(n2237), .D(n609), .Y(n2252) );
  OAI22X1 U2363 ( .A(n2238), .B(n459), .C(n2239), .D(n1364), .Y(n2251) );
  NAND2X1 U2364 ( .A(hrdata[29]), .B(n2240), .Y(n2249) );
  AOI22X1 U2365 ( .A(N805), .B(n2241), .C(N486), .D(n2242), .Y(n2248) );
  NAND3X1 U2366 ( .A(n2253), .B(n2254), .C(n2255), .Y(n796) );
  NOR2X1 U2367 ( .A(n2256), .B(n2257), .Y(n2255) );
  OAI22X1 U2368 ( .A(n2236), .B(n293), .C(n2237), .D(n592), .Y(n2257) );
  OAI22X1 U2369 ( .A(n2238), .B(n442), .C(n2239), .D(n1347), .Y(n2256) );
  NAND2X1 U2370 ( .A(hrdata[28]), .B(n2240), .Y(n2254) );
  AOI22X1 U2371 ( .A(N806), .B(n2241), .C(N487), .D(n2242), .Y(n2253) );
  NAND3X1 U2372 ( .A(n2258), .B(n2259), .C(n2260), .Y(n794) );
  NOR2X1 U2373 ( .A(n2261), .B(n2262), .Y(n2260) );
  OAI22X1 U2374 ( .A(n2236), .B(n276), .C(n2237), .D(n575), .Y(n2262) );
  OAI22X1 U2375 ( .A(n2238), .B(n425), .C(n2239), .D(n1330), .Y(n2261) );
  NAND2X1 U2376 ( .A(hrdata[27]), .B(n2240), .Y(n2259) );
  AOI22X1 U2377 ( .A(N807), .B(n2241), .C(N488), .D(n2242), .Y(n2258) );
  NAND3X1 U2378 ( .A(n2263), .B(n2264), .C(n2265), .Y(n792) );
  NOR2X1 U2379 ( .A(n2266), .B(n2267), .Y(n2265) );
  OAI22X1 U2380 ( .A(n2236), .B(n259), .C(n2237), .D(n558), .Y(n2267) );
  OAI22X1 U2381 ( .A(n2238), .B(n408), .C(n2239), .D(n1313), .Y(n2266) );
  NAND2X1 U2382 ( .A(hrdata[26]), .B(n2240), .Y(n2264) );
  AOI22X1 U2383 ( .A(N808), .B(n2241), .C(N489), .D(n2242), .Y(n2263) );
  NAND3X1 U2384 ( .A(n2268), .B(n2269), .C(n2270), .Y(n790) );
  NOR2X1 U2385 ( .A(n2271), .B(n2272), .Y(n2270) );
  OAI22X1 U2386 ( .A(n2236), .B(n242), .C(n2237), .D(n541), .Y(n2272) );
  OAI22X1 U2387 ( .A(n2238), .B(n391), .C(n2239), .D(n1296), .Y(n2271) );
  NAND2X1 U2388 ( .A(hrdata[25]), .B(n2240), .Y(n2269) );
  AOI22X1 U2389 ( .A(N809), .B(n2241), .C(N490), .D(n2242), .Y(n2268) );
  NAND3X1 U2390 ( .A(n2273), .B(n2274), .C(n2275), .Y(n788) );
  NOR2X1 U2391 ( .A(n2276), .B(n2277), .Y(n2275) );
  OAI22X1 U2392 ( .A(n2236), .B(n226), .C(n2237), .D(n525), .Y(n2277) );
  NAND2X1 U2393 ( .A(n2278), .B(n2279), .Y(n2237) );
  OR2X1 U2394 ( .A(n2280), .B(n2281), .Y(n2236) );
  OAI22X1 U2395 ( .A(n2238), .B(n375), .C(n2239), .D(n1280), .Y(n2276) );
  NAND2X1 U2396 ( .A(n2282), .B(n2283), .Y(n2239) );
  OR2X1 U2397 ( .A(n2284), .B(n2285), .Y(n2238) );
  NAND2X1 U2398 ( .A(hrdata[24]), .B(n2240), .Y(n2274) );
  AOI22X1 U2399 ( .A(N810), .B(n2241), .C(N491), .D(n2242), .Y(n2273) );
  NAND3X1 U2400 ( .A(n2286), .B(n2287), .C(n2288), .Y(n786) );
  NOR2X1 U2401 ( .A(n2289), .B(n2290), .Y(n2288) );
  OAI22X1 U2402 ( .A(n350), .B(n2291), .C(n649), .D(n2292), .Y(n2290) );
  OAI22X1 U2403 ( .A(n499), .B(n2293), .C(n1404), .D(n2294), .Y(n2289) );
  NAND2X1 U2404 ( .A(hrdata[23]), .B(n2240), .Y(n2287) );
  AOI22X1 U2405 ( .A(N811), .B(n2241), .C(N492), .D(n2242), .Y(n2286) );
  NAND3X1 U2406 ( .A(n2295), .B(n2296), .C(n2297), .Y(n784) );
  NOR2X1 U2407 ( .A(n2298), .B(n2299), .Y(n2297) );
  OAI22X1 U2408 ( .A(n327), .B(n2291), .C(n626), .D(n2292), .Y(n2299) );
  OAI22X1 U2409 ( .A(n476), .B(n2293), .C(n1381), .D(n2294), .Y(n2298) );
  NAND2X1 U2410 ( .A(hrdata[22]), .B(n2240), .Y(n2296) );
  AOI22X1 U2411 ( .A(N812), .B(n2241), .C(N493), .D(n2242), .Y(n2295) );
  NAND3X1 U2412 ( .A(n2300), .B(n2301), .C(n2302), .Y(n782) );
  NOR2X1 U2413 ( .A(n2303), .B(n2304), .Y(n2302) );
  OAI22X1 U2414 ( .A(n310), .B(n2291), .C(n609), .D(n2292), .Y(n2304) );
  OAI22X1 U2415 ( .A(n459), .B(n2293), .C(n1364), .D(n2294), .Y(n2303) );
  NAND2X1 U2416 ( .A(hrdata[21]), .B(n2240), .Y(n2301) );
  AOI22X1 U2417 ( .A(N813), .B(n2241), .C(N494), .D(n2242), .Y(n2300) );
  NAND3X1 U2418 ( .A(n2305), .B(n2306), .C(n2307), .Y(n780) );
  NOR2X1 U2419 ( .A(n2308), .B(n2309), .Y(n2307) );
  OAI22X1 U2420 ( .A(n293), .B(n2291), .C(n592), .D(n2292), .Y(n2309) );
  OAI22X1 U2421 ( .A(n442), .B(n2293), .C(n1347), .D(n2294), .Y(n2308) );
  NAND2X1 U2422 ( .A(hrdata[20]), .B(n2240), .Y(n2306) );
  AOI22X1 U2423 ( .A(N814), .B(n2241), .C(N495), .D(n2242), .Y(n2305) );
  NAND3X1 U2424 ( .A(n2310), .B(n2311), .C(n2312), .Y(n778) );
  NOR2X1 U2425 ( .A(n2313), .B(n2314), .Y(n2312) );
  OAI22X1 U2426 ( .A(n276), .B(n2291), .C(n575), .D(n2292), .Y(n2314) );
  OAI22X1 U2427 ( .A(n425), .B(n2293), .C(n1330), .D(n2294), .Y(n2313) );
  NAND2X1 U2428 ( .A(hrdata[19]), .B(n2240), .Y(n2311) );
  AOI22X1 U2429 ( .A(N815), .B(n2241), .C(N496), .D(n2242), .Y(n2310) );
  NAND3X1 U2430 ( .A(n2315), .B(n2316), .C(n2317), .Y(n776) );
  NOR2X1 U2431 ( .A(n2318), .B(n2319), .Y(n2317) );
  OAI22X1 U2432 ( .A(n259), .B(n2291), .C(n558), .D(n2292), .Y(n2319) );
  OAI22X1 U2433 ( .A(n408), .B(n2293), .C(n1313), .D(n2294), .Y(n2318) );
  NAND2X1 U2434 ( .A(hrdata[18]), .B(n2240), .Y(n2316) );
  AOI22X1 U2435 ( .A(N816), .B(n2241), .C(N497), .D(n2242), .Y(n2315) );
  NAND3X1 U2436 ( .A(n2320), .B(n2321), .C(n2322), .Y(n774) );
  NOR2X1 U2437 ( .A(n2323), .B(n2324), .Y(n2322) );
  OAI22X1 U2438 ( .A(n242), .B(n2291), .C(n541), .D(n2292), .Y(n2324) );
  OAI22X1 U2439 ( .A(n391), .B(n2293), .C(n1296), .D(n2294), .Y(n2323) );
  NAND2X1 U2440 ( .A(hrdata[17]), .B(n2240), .Y(n2321) );
  AOI22X1 U2441 ( .A(N817), .B(n2241), .C(N498), .D(n2242), .Y(n2320) );
  NAND3X1 U2442 ( .A(n2325), .B(n2326), .C(n2327), .Y(n772) );
  NOR2X1 U2443 ( .A(n2328), .B(n2329), .Y(n2327) );
  OAI22X1 U2444 ( .A(n226), .B(n2291), .C(n525), .D(n2292), .Y(n2329) );
  NAND2X1 U2445 ( .A(n2330), .B(n2279), .Y(n2292) );
  NAND2X1 U2446 ( .A(n2278), .B(n2331), .Y(n2291) );
  OAI22X1 U2447 ( .A(n375), .B(n2293), .C(n1280), .D(n2294), .Y(n2328) );
  NAND3X1 U2448 ( .A(N210), .B(n2447), .C(n2283), .Y(n2294) );
  INVX1 U2449 ( .A(n2332), .Y(n2283) );
  NAND2X1 U2450 ( .A(n2282), .B(n2333), .Y(n2293) );
  NAND2X1 U2451 ( .A(hrdata[16]), .B(n2240), .Y(n2326) );
  AOI22X1 U2452 ( .A(N818), .B(n2241), .C(N499), .D(n2242), .Y(n2325) );
  NAND3X1 U2453 ( .A(n2334), .B(n2335), .C(n2336), .Y(n770) );
  AOI21X1 U2454 ( .A(hrdata[15]), .B(n2240), .C(n2337), .Y(n2336) );
  OAI21X1 U2455 ( .A(n350), .B(n2338), .C(n2339), .Y(n2337) );
  NAND2X1 U2456 ( .A(N500), .B(n2242), .Y(n2339) );
  AOI22X1 U2457 ( .A(N819), .B(n2241), .C(n2340), .D(N684), .Y(n2335) );
  AOI22X1 U2458 ( .A(n2341), .B(N274), .C(n2342), .D(N365), .Y(n2334) );
  NAND3X1 U2459 ( .A(n2343), .B(n2344), .C(n2345), .Y(n768) );
  AOI21X1 U2460 ( .A(hrdata[14]), .B(n2240), .C(n2346), .Y(n2345) );
  OAI21X1 U2461 ( .A(n327), .B(n2338), .C(n2347), .Y(n2346) );
  NAND2X1 U2462 ( .A(N501), .B(n2242), .Y(n2347) );
  AOI22X1 U2463 ( .A(N820), .B(n2241), .C(n2340), .D(N685), .Y(n2344) );
  AOI22X1 U2464 ( .A(n2341), .B(N275), .C(n2342), .D(N366), .Y(n2343) );
  NAND3X1 U2465 ( .A(n2348), .B(n2349), .C(n2350), .Y(n766) );
  AOI21X1 U2466 ( .A(hrdata[13]), .B(n2240), .C(n2351), .Y(n2350) );
  OAI21X1 U2467 ( .A(n310), .B(n2338), .C(n2352), .Y(n2351) );
  NAND2X1 U2468 ( .A(N502), .B(n2242), .Y(n2352) );
  AOI22X1 U2469 ( .A(N821), .B(n2241), .C(n2340), .D(N686), .Y(n2349) );
  AOI22X1 U2470 ( .A(n2341), .B(N276), .C(n2342), .D(N367), .Y(n2348) );
  NAND3X1 U2471 ( .A(n2353), .B(n2354), .C(n2355), .Y(n764) );
  AOI21X1 U2472 ( .A(hrdata[12]), .B(n2240), .C(n2356), .Y(n2355) );
  OAI21X1 U2473 ( .A(n293), .B(n2338), .C(n2357), .Y(n2356) );
  NAND2X1 U2474 ( .A(N503), .B(n2242), .Y(n2357) );
  AOI22X1 U2475 ( .A(N822), .B(n2241), .C(n2340), .D(N687), .Y(n2354) );
  AOI22X1 U2476 ( .A(n2341), .B(N277), .C(n2342), .D(N368), .Y(n2353) );
  NAND3X1 U2477 ( .A(n2358), .B(n2359), .C(n2360), .Y(n762) );
  AOI21X1 U2478 ( .A(hrdata[11]), .B(n2240), .C(n2361), .Y(n2360) );
  OAI21X1 U2479 ( .A(n276), .B(n2338), .C(n2362), .Y(n2361) );
  NAND2X1 U2480 ( .A(N504), .B(n2242), .Y(n2362) );
  AOI22X1 U2481 ( .A(N823), .B(n2241), .C(n2340), .D(N688), .Y(n2359) );
  AOI22X1 U2482 ( .A(n2341), .B(N278), .C(n2342), .D(N369), .Y(n2358) );
  NAND3X1 U2483 ( .A(n2363), .B(n2364), .C(n2365), .Y(n760) );
  AOI21X1 U2484 ( .A(hrdata[10]), .B(n2240), .C(n2366), .Y(n2365) );
  OAI21X1 U2485 ( .A(n259), .B(n2338), .C(n2367), .Y(n2366) );
  NAND2X1 U2486 ( .A(N505), .B(n2242), .Y(n2367) );
  AOI22X1 U2487 ( .A(N824), .B(n2241), .C(n2340), .D(N689), .Y(n2364) );
  AOI22X1 U2488 ( .A(n2341), .B(N279), .C(n2342), .D(N370), .Y(n2363) );
  NAND3X1 U2489 ( .A(n2368), .B(n2369), .C(n2370), .Y(n758) );
  AOI21X1 U2490 ( .A(hrdata[9]), .B(n2240), .C(n2371), .Y(n2370) );
  OAI21X1 U2491 ( .A(n242), .B(n2338), .C(n2372), .Y(n2371) );
  NAND2X1 U2492 ( .A(N506), .B(n2242), .Y(n2372) );
  AOI22X1 U2493 ( .A(N825), .B(n2241), .C(n2340), .D(N690), .Y(n2369) );
  AOI22X1 U2494 ( .A(n2341), .B(N280), .C(n2342), .D(N371), .Y(n2368) );
  NAND3X1 U2495 ( .A(n2373), .B(n2374), .C(n2375), .Y(n756) );
  AOI21X1 U2496 ( .A(hrdata[8]), .B(n2240), .C(n2376), .Y(n2375) );
  OAI21X1 U2497 ( .A(n226), .B(n2338), .C(n2377), .Y(n2376) );
  NAND2X1 U2498 ( .A(N507), .B(n2242), .Y(n2377) );
  NAND2X1 U2499 ( .A(n2330), .B(n2331), .Y(n2338) );
  AOI22X1 U2500 ( .A(N826), .B(n2241), .C(n2340), .D(N691), .Y(n2374) );
  NOR2X1 U2501 ( .A(n2379), .B(n2332), .Y(n2340) );
  NAND2X1 U2502 ( .A(prev_size[0]), .B(n2333), .Y(n2332) );
  AOI22X1 U2503 ( .A(n2341), .B(N281), .C(n2342), .D(N372), .Y(n2373) );
  AND2X1 U2504 ( .A(n2381), .B(n2279), .Y(n2342) );
  NOR2X1 U2505 ( .A(n2382), .B(n2281), .Y(n2279) );
  INVX1 U2506 ( .A(n2383), .Y(n2341) );
  NAND3X1 U2507 ( .A(N210), .B(n2447), .C(n2333), .Y(n2383) );
  INVX1 U2508 ( .A(n2285), .Y(n2333) );
  OAI21X1 U2509 ( .A(N1747), .B(n2384), .C(n2385), .Y(n754) );
  AOI22X1 U2510 ( .A(N265), .B(n2386), .C(N274), .D(n2387), .Y(n2385) );
  INVX1 U2511 ( .A(hrdata[7]), .Y(n2384) );
  OAI21X1 U2512 ( .A(N1747), .B(n2388), .C(n2389), .Y(n752) );
  AOI22X1 U2513 ( .A(N266), .B(n2386), .C(N275), .D(n2387), .Y(n2389) );
  INVX1 U2514 ( .A(hrdata[6]), .Y(n2388) );
  OAI21X1 U2515 ( .A(N1747), .B(n2390), .C(n2391), .Y(n750) );
  AOI22X1 U2516 ( .A(N267), .B(n2386), .C(N276), .D(n2387), .Y(n2391) );
  INVX1 U2517 ( .A(hrdata[5]), .Y(n2390) );
  OAI21X1 U2518 ( .A(N1747), .B(n2392), .C(n2393), .Y(n748) );
  AOI22X1 U2519 ( .A(N268), .B(n2386), .C(N277), .D(n2387), .Y(n2393) );
  INVX1 U2520 ( .A(hrdata[4]), .Y(n2392) );
  OAI21X1 U2521 ( .A(N1747), .B(n2394), .C(n2395), .Y(n746) );
  AOI22X1 U2522 ( .A(N269), .B(n2386), .C(N278), .D(n2387), .Y(n2395) );
  INVX1 U2523 ( .A(hrdata[3]), .Y(n2394) );
  OAI21X1 U2524 ( .A(N1747), .B(n2396), .C(n2397), .Y(n744) );
  AOI22X1 U2525 ( .A(N270), .B(n2386), .C(N279), .D(n2387), .Y(n2397) );
  INVX1 U2526 ( .A(hrdata[2]), .Y(n2396) );
  OAI21X1 U2527 ( .A(N1747), .B(n2398), .C(n2399), .Y(n742) );
  AOI22X1 U2528 ( .A(N271), .B(n2386), .C(N280), .D(n2387), .Y(n2399) );
  INVX1 U2529 ( .A(hrdata[1]), .Y(n2398) );
  OAI21X1 U2530 ( .A(N1747), .B(n2400), .C(n2401), .Y(n740) );
  AOI22X1 U2531 ( .A(N272), .B(n2386), .C(N281), .D(n2387), .Y(n2401) );
  OAI21X1 U2532 ( .A(n2285), .B(n2379), .C(n2380), .Y(n2387) );
  NAND3X1 U2533 ( .A(prev_size[1]), .B(n2402), .C(n2403), .Y(n2380) );
  NOR2X1 U2534 ( .A(n2240), .B(n2404), .Y(n2403) );
  OAI21X1 U2535 ( .A(n500), .B(n2405), .C(n2406), .Y(n2404) );
  NAND2X1 U2536 ( .A(N184), .B(n2379), .Y(n2405) );
  NAND2X1 U2537 ( .A(n501), .B(n2447), .Y(n2379) );
  NAND3X1 U2538 ( .A(N1747), .B(n2407), .C(n2402), .Y(n2285) );
  INVX1 U2539 ( .A(n2408), .Y(n2402) );
  NAND3X1 U2540 ( .A(n2409), .B(n2410), .C(n2230), .Y(n2408) );
  OAI21X1 U2541 ( .A(n2281), .B(n2411), .C(n2378), .Y(n2386) );
  NAND3X1 U2542 ( .A(hsize[1]), .B(n2412), .C(n2413), .Y(n2378) );
  AOI21X1 U2543 ( .A(n2414), .B(N181), .C(hsize[0]), .Y(n2413) );
  NOR2X1 U2544 ( .A(n2381), .B(n2415), .Y(n2414) );
  INVX1 U2545 ( .A(n2416), .Y(n2412) );
  INVX1 U2546 ( .A(n2381), .Y(n2411) );
  NOR2X1 U2547 ( .A(N194), .B(N179), .Y(n2381) );
  INVX1 U2548 ( .A(n2331), .Y(n2281) );
  NOR2X1 U2549 ( .A(n2416), .B(hsize[1]), .Y(n2331) );
  NAND3X1 U2550 ( .A(n2409), .B(n2229), .C(n2417), .Y(n2416) );
  INVX1 U2551 ( .A(hresp), .Y(n2409) );
  INVX1 U2552 ( .A(hrdata[0]), .Y(n2400) );
  MUX2X1 U2553 ( .B(n2410), .A(n2229), .S(n2417), .Y(curr_write) );
  INVX1 U2554 ( .A(prev_write), .Y(n2410) );
  MUX2X1 U2555 ( .B(n2407), .A(n2418), .S(n2417), .Y(curr_size[1]) );
  INVX1 U2556 ( .A(prev_size[1]), .Y(n2407) );
  MUX2X1 U2557 ( .B(n2406), .A(n2382), .S(n2417), .Y(curr_size[0]) );
  INVX1 U2558 ( .A(prev_size[0]), .Y(n2406) );
  MUX2X1 U2559 ( .B(n500), .A(n351), .S(n2417), .Y(curr_addr[3]) );
  MUX2X1 U2560 ( .B(n2419), .A(n2415), .S(n2417), .Y(curr_addr[2]) );
  MUX2X1 U2561 ( .B(n2447), .A(n2452), .S(n2417), .Y(curr_addr[1]) );
  MUX2X1 U2562 ( .B(n501), .A(n2453), .S(n2417), .Y(curr_addr[0]) );
  NAND2X1 U2563 ( .A(n2420), .B(n2421), .Y(N217) );
  MUX2X1 U2564 ( .B(n2422), .A(N185), .S(n2284), .Y(n2420) );
  XNOR2X1 U2565 ( .A(N184), .B(n2284), .Y(N216) );
  NAND2X1 U2566 ( .A(N183), .B(N210), .Y(n2284) );
  NAND2X1 U2567 ( .A(n2423), .B(n2421), .Y(N213) );
  MUX2X1 U2568 ( .B(n2422), .A(N185), .S(n2447), .Y(n2423) );
  XNOR2X1 U2569 ( .A(n2419), .B(N183), .Y(N212) );
  NAND2X1 U2570 ( .A(n2424), .B(n2421), .Y(N209) );
  NAND2X1 U2571 ( .A(N185), .B(n2419), .Y(n2421) );
  MUX2X1 U2572 ( .B(N185), .A(n2422), .S(n2425), .Y(n2424) );
  INVX1 U2573 ( .A(n2426), .Y(n2425) );
  NOR2X1 U2574 ( .A(n2419), .B(N185), .Y(n2422) );
  INVX1 U2575 ( .A(N184), .Y(n2419) );
  XNOR2X1 U2576 ( .A(n2426), .B(N184), .Y(N208) );
  NOR2X1 U2577 ( .A(N210), .B(n2282), .Y(n2426) );
  INVX1 U2578 ( .A(n2446), .Y(N207) );
  OAI21X1 U2579 ( .A(N183), .B(n501), .C(n2427), .Y(n2446) );
  INVX1 U2580 ( .A(n2282), .Y(n2427) );
  NOR2X1 U2581 ( .A(n2447), .B(N210), .Y(n2282) );
  INVX1 U2582 ( .A(N183), .Y(n2447) );
  NAND2X1 U2583 ( .A(n2428), .B(n2429), .Y(N201) );
  MUX2X1 U2584 ( .B(n2430), .A(N181), .S(n2280), .Y(n2428) );
  XNOR2X1 U2585 ( .A(N180), .B(n2280), .Y(N200) );
  NAND2X1 U2586 ( .A(N194), .B(N179), .Y(n2280) );
  NAND2X1 U2587 ( .A(n2431), .B(n2429), .Y(N197) );
  MUX2X1 U2588 ( .B(n2430), .A(N181), .S(n2452), .Y(n2431) );
  XNOR2X1 U2589 ( .A(n2415), .B(N179), .Y(N196) );
  NAND2X1 U2590 ( .A(n2432), .B(n2429), .Y(N193) );
  NAND2X1 U2591 ( .A(N181), .B(n2415), .Y(n2429) );
  MUX2X1 U2592 ( .B(n2430), .A(N181), .S(n2433), .Y(n2432) );
  NOR2X1 U2593 ( .A(n2415), .B(N181), .Y(n2430) );
  INVX1 U2594 ( .A(N180), .Y(n2415) );
  XNOR2X1 U2595 ( .A(N180), .B(n2433), .Y(N192) );
  NOR2X1 U2596 ( .A(n823), .B(N194), .Y(n2433) );
  INVX1 U2597 ( .A(n2451), .Y(n823) );
  NOR2X1 U2598 ( .A(n2330), .B(n2278), .Y(n2451) );
  NOR2X1 U2599 ( .A(n2452), .B(N194), .Y(n2278) );
  INVX1 U2600 ( .A(N179), .Y(n2452) );
  NOR2X1 U2601 ( .A(n2453), .B(N179), .Y(n2330) );
  OAI22X1 U2602 ( .A(hready), .B(n1948), .C(n2418), .D(n2434), .Y(N1744) );
  INVX1 U2603 ( .A(hsize[1]), .Y(n2418) );
  INVX1 U2604 ( .A(prev_write_size[1]), .Y(n1948) );
  OAI22X1 U2605 ( .A(hready), .B(n1950), .C(n2382), .D(n2434), .Y(N1743) );
  INVX1 U2606 ( .A(n2435), .Y(n2434) );
  INVX1 U2607 ( .A(hsize[0]), .Y(n2382) );
  INVX1 U2608 ( .A(prev_write_size[0]), .Y(n1950) );
  MUX2X1 U2609 ( .B(n2436), .A(n2437), .S(n2230), .Y(N1742) );
  INVX1 U2610 ( .A(prev_write_addr[3]), .Y(n2437) );
  NOR2X1 U2611 ( .A(N181), .B(n2438), .Y(n2436) );
  OAI21X1 U2612 ( .A(hready), .B(n2439), .C(n2440), .Y(N1741) );
  AOI21X1 U2613 ( .A(n2435), .B(N180), .C(n2441), .Y(n2440) );
  INVX1 U2614 ( .A(prev_write_addr[2]), .Y(n2439) );
  OAI21X1 U2615 ( .A(hready), .B(n2218), .C(n2442), .Y(N1740) );
  AOI21X1 U2616 ( .A(n2435), .B(N179), .C(n2441), .Y(n2442) );
  INVX1 U2617 ( .A(n2443), .Y(n2441) );
  NAND3X1 U2618 ( .A(n2444), .B(n2229), .C(n2417), .Y(n2443) );
  NOR2X1 U2619 ( .A(n2230), .B(n2240), .Y(n2417) );
  INVX1 U2620 ( .A(hwrite), .Y(n2229) );
  NOR2X1 U2621 ( .A(n2438), .B(n2230), .Y(n2435) );
  INVX1 U2622 ( .A(prev_write_addr[1]), .Y(n2218) );
  MUX2X1 U2623 ( .B(n2445), .A(n2221), .S(n2230), .Y(N1739) );
  INVX1 U2624 ( .A(hready), .Y(n2230) );
  INVX1 U2625 ( .A(prev_write_addr[0]), .Y(n2221) );
  NOR2X1 U2626 ( .A(N194), .B(n2438), .Y(n2445) );
  NAND3X1 U2627 ( .A(N1747), .B(n2444), .C(hwrite), .Y(n2438) );
  OR2X1 U2628 ( .A(htrans[0]), .B(htrans[1]), .Y(n2444) );
endmodule


module data_buffer_DW01_inc_2_DW01_inc_13 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module data_buffer ( clk, n_rst, flush, clear, get_rx_data, get_tx_packet_data, 
        store_tx_data, store_rx_packet_data, tx_data, rx_packet_data, 
        buffer_occupancy, tx_packet_data, rx_data );
  input [7:0] tx_data;
  input [7:0] rx_packet_data;
  output [6:0] buffer_occupancy;
  output [7:0] tx_packet_data;
  output [7:0] rx_data;
  input clk, n_rst, flush, clear, get_rx_data, get_tx_packet_data,
         store_tx_data, store_rx_packet_data;
  wire   N153, N154, N155, N156, N157, N158, \curr_reg[0][7] ,
         \curr_reg[0][6] , \curr_reg[0][5] , \curr_reg[0][4] ,
         \curr_reg[0][3] , \curr_reg[0][2] , \curr_reg[0][1] ,
         \curr_reg[0][0] , \curr_reg[1][7] , \curr_reg[1][6] ,
         \curr_reg[1][5] , \curr_reg[1][4] , \curr_reg[1][3] ,
         \curr_reg[1][2] , \curr_reg[1][1] , \curr_reg[1][0] ,
         \curr_reg[2][7] , \curr_reg[2][6] , \curr_reg[2][5] ,
         \curr_reg[2][4] , \curr_reg[2][3] , \curr_reg[2][2] ,
         \curr_reg[2][1] , \curr_reg[2][0] , \curr_reg[3][7] ,
         \curr_reg[3][6] , \curr_reg[3][5] , \curr_reg[3][4] ,
         \curr_reg[3][3] , \curr_reg[3][2] , \curr_reg[3][1] ,
         \curr_reg[3][0] , \curr_reg[4][7] , \curr_reg[4][6] ,
         \curr_reg[4][5] , \curr_reg[4][4] , \curr_reg[4][3] ,
         \curr_reg[4][2] , \curr_reg[4][1] , \curr_reg[4][0] ,
         \curr_reg[5][7] , \curr_reg[5][6] , \curr_reg[5][5] ,
         \curr_reg[5][4] , \curr_reg[5][3] , \curr_reg[5][2] ,
         \curr_reg[5][1] , \curr_reg[5][0] , \curr_reg[6][7] ,
         \curr_reg[6][6] , \curr_reg[6][5] , \curr_reg[6][4] ,
         \curr_reg[6][3] , \curr_reg[6][2] , \curr_reg[6][1] ,
         \curr_reg[6][0] , \curr_reg[7][7] , \curr_reg[7][6] ,
         \curr_reg[7][5] , \curr_reg[7][4] , \curr_reg[7][3] ,
         \curr_reg[7][2] , \curr_reg[7][1] , \curr_reg[7][0] ,
         \curr_reg[8][7] , \curr_reg[8][6] , \curr_reg[8][5] ,
         \curr_reg[8][4] , \curr_reg[8][3] , \curr_reg[8][2] ,
         \curr_reg[8][1] , \curr_reg[8][0] , \curr_reg[9][7] ,
         \curr_reg[9][6] , \curr_reg[9][5] , \curr_reg[9][4] ,
         \curr_reg[9][3] , \curr_reg[9][2] , \curr_reg[9][1] ,
         \curr_reg[9][0] , \curr_reg[10][7] , \curr_reg[10][6] ,
         \curr_reg[10][5] , \curr_reg[10][4] , \curr_reg[10][3] ,
         \curr_reg[10][2] , \curr_reg[10][1] , \curr_reg[10][0] ,
         \curr_reg[11][7] , \curr_reg[11][6] , \curr_reg[11][5] ,
         \curr_reg[11][4] , \curr_reg[11][3] , \curr_reg[11][2] ,
         \curr_reg[11][1] , \curr_reg[11][0] , \curr_reg[12][7] ,
         \curr_reg[12][6] , \curr_reg[12][5] , \curr_reg[12][4] ,
         \curr_reg[12][3] , \curr_reg[12][2] , \curr_reg[12][1] ,
         \curr_reg[12][0] , \curr_reg[13][7] , \curr_reg[13][6] ,
         \curr_reg[13][5] , \curr_reg[13][4] , \curr_reg[13][3] ,
         \curr_reg[13][2] , \curr_reg[13][1] , \curr_reg[13][0] ,
         \curr_reg[14][7] , \curr_reg[14][6] , \curr_reg[14][5] ,
         \curr_reg[14][4] , \curr_reg[14][3] , \curr_reg[14][2] ,
         \curr_reg[14][1] , \curr_reg[14][0] , \curr_reg[15][7] ,
         \curr_reg[15][6] , \curr_reg[15][5] , \curr_reg[15][4] ,
         \curr_reg[15][3] , \curr_reg[15][2] , \curr_reg[15][1] ,
         \curr_reg[15][0] , \curr_reg[16][7] , \curr_reg[16][6] ,
         \curr_reg[16][5] , \curr_reg[16][4] , \curr_reg[16][3] ,
         \curr_reg[16][2] , \curr_reg[16][1] , \curr_reg[16][0] ,
         \curr_reg[17][7] , \curr_reg[17][6] , \curr_reg[17][5] ,
         \curr_reg[17][4] , \curr_reg[17][3] , \curr_reg[17][2] ,
         \curr_reg[17][1] , \curr_reg[17][0] , \curr_reg[18][7] ,
         \curr_reg[18][6] , \curr_reg[18][5] , \curr_reg[18][4] ,
         \curr_reg[18][3] , \curr_reg[18][2] , \curr_reg[18][1] ,
         \curr_reg[18][0] , \curr_reg[19][7] , \curr_reg[19][6] ,
         \curr_reg[19][5] , \curr_reg[19][4] , \curr_reg[19][3] ,
         \curr_reg[19][2] , \curr_reg[19][1] , \curr_reg[19][0] ,
         \curr_reg[20][7] , \curr_reg[20][6] , \curr_reg[20][5] ,
         \curr_reg[20][4] , \curr_reg[20][3] , \curr_reg[20][2] ,
         \curr_reg[20][1] , \curr_reg[20][0] , \curr_reg[21][7] ,
         \curr_reg[21][6] , \curr_reg[21][5] , \curr_reg[21][4] ,
         \curr_reg[21][3] , \curr_reg[21][2] , \curr_reg[21][1] ,
         \curr_reg[21][0] , \curr_reg[22][7] , \curr_reg[22][6] ,
         \curr_reg[22][5] , \curr_reg[22][4] , \curr_reg[22][3] ,
         \curr_reg[22][2] , \curr_reg[22][1] , \curr_reg[22][0] ,
         \curr_reg[23][7] , \curr_reg[23][6] , \curr_reg[23][5] ,
         \curr_reg[23][4] , \curr_reg[23][3] , \curr_reg[23][2] ,
         \curr_reg[23][1] , \curr_reg[23][0] , \curr_reg[24][7] ,
         \curr_reg[24][6] , \curr_reg[24][5] , \curr_reg[24][4] ,
         \curr_reg[24][3] , \curr_reg[24][2] , \curr_reg[24][1] ,
         \curr_reg[24][0] , \curr_reg[25][7] , \curr_reg[25][6] ,
         \curr_reg[25][5] , \curr_reg[25][4] , \curr_reg[25][3] ,
         \curr_reg[25][2] , \curr_reg[25][1] , \curr_reg[25][0] ,
         \curr_reg[26][7] , \curr_reg[26][6] , \curr_reg[26][5] ,
         \curr_reg[26][4] , \curr_reg[26][3] , \curr_reg[26][2] ,
         \curr_reg[26][1] , \curr_reg[26][0] , \curr_reg[27][7] ,
         \curr_reg[27][6] , \curr_reg[27][5] , \curr_reg[27][4] ,
         \curr_reg[27][3] , \curr_reg[27][2] , \curr_reg[27][1] ,
         \curr_reg[27][0] , \curr_reg[28][7] , \curr_reg[28][6] ,
         \curr_reg[28][5] , \curr_reg[28][4] , \curr_reg[28][3] ,
         \curr_reg[28][2] , \curr_reg[28][1] , \curr_reg[28][0] ,
         \curr_reg[29][7] , \curr_reg[29][6] , \curr_reg[29][5] ,
         \curr_reg[29][4] , \curr_reg[29][3] , \curr_reg[29][2] ,
         \curr_reg[29][1] , \curr_reg[29][0] , \curr_reg[30][7] ,
         \curr_reg[30][6] , \curr_reg[30][5] , \curr_reg[30][4] ,
         \curr_reg[30][3] , \curr_reg[30][2] , \curr_reg[30][1] ,
         \curr_reg[30][0] , \curr_reg[31][7] , \curr_reg[31][6] ,
         \curr_reg[31][5] , \curr_reg[31][4] , \curr_reg[31][3] ,
         \curr_reg[31][2] , \curr_reg[31][1] , \curr_reg[31][0] ,
         \curr_reg[32][7] , \curr_reg[32][6] , \curr_reg[32][5] ,
         \curr_reg[32][4] , \curr_reg[32][3] , \curr_reg[32][2] ,
         \curr_reg[32][1] , \curr_reg[32][0] , \curr_reg[33][7] ,
         \curr_reg[33][6] , \curr_reg[33][5] , \curr_reg[33][4] ,
         \curr_reg[33][3] , \curr_reg[33][2] , \curr_reg[33][1] ,
         \curr_reg[33][0] , \curr_reg[34][7] , \curr_reg[34][6] ,
         \curr_reg[34][5] , \curr_reg[34][4] , \curr_reg[34][3] ,
         \curr_reg[34][2] , \curr_reg[34][1] , \curr_reg[34][0] ,
         \curr_reg[35][7] , \curr_reg[35][6] , \curr_reg[35][5] ,
         \curr_reg[35][4] , \curr_reg[35][3] , \curr_reg[35][2] ,
         \curr_reg[35][1] , \curr_reg[35][0] , \curr_reg[36][7] ,
         \curr_reg[36][6] , \curr_reg[36][5] , \curr_reg[36][4] ,
         \curr_reg[36][3] , \curr_reg[36][2] , \curr_reg[36][1] ,
         \curr_reg[36][0] , \curr_reg[37][7] , \curr_reg[37][6] ,
         \curr_reg[37][5] , \curr_reg[37][4] , \curr_reg[37][3] ,
         \curr_reg[37][2] , \curr_reg[37][1] , \curr_reg[37][0] ,
         \curr_reg[38][7] , \curr_reg[38][6] , \curr_reg[38][5] ,
         \curr_reg[38][4] , \curr_reg[38][3] , \curr_reg[38][2] ,
         \curr_reg[38][1] , \curr_reg[38][0] , \curr_reg[39][7] ,
         \curr_reg[39][6] , \curr_reg[39][5] , \curr_reg[39][4] ,
         \curr_reg[39][3] , \curr_reg[39][2] , \curr_reg[39][1] ,
         \curr_reg[39][0] , \curr_reg[40][7] , \curr_reg[40][6] ,
         \curr_reg[40][5] , \curr_reg[40][4] , \curr_reg[40][3] ,
         \curr_reg[40][2] , \curr_reg[40][1] , \curr_reg[40][0] ,
         \curr_reg[41][7] , \curr_reg[41][6] , \curr_reg[41][5] ,
         \curr_reg[41][4] , \curr_reg[41][3] , \curr_reg[41][2] ,
         \curr_reg[41][1] , \curr_reg[41][0] , \curr_reg[42][7] ,
         \curr_reg[42][6] , \curr_reg[42][5] , \curr_reg[42][4] ,
         \curr_reg[42][3] , \curr_reg[42][2] , \curr_reg[42][1] ,
         \curr_reg[42][0] , \curr_reg[43][7] , \curr_reg[43][6] ,
         \curr_reg[43][5] , \curr_reg[43][4] , \curr_reg[43][3] ,
         \curr_reg[43][2] , \curr_reg[43][1] , \curr_reg[43][0] ,
         \curr_reg[44][7] , \curr_reg[44][6] , \curr_reg[44][5] ,
         \curr_reg[44][4] , \curr_reg[44][3] , \curr_reg[44][2] ,
         \curr_reg[44][1] , \curr_reg[44][0] , \curr_reg[45][7] ,
         \curr_reg[45][6] , \curr_reg[45][5] , \curr_reg[45][4] ,
         \curr_reg[45][3] , \curr_reg[45][2] , \curr_reg[45][1] ,
         \curr_reg[45][0] , \curr_reg[46][7] , \curr_reg[46][6] ,
         \curr_reg[46][5] , \curr_reg[46][4] , \curr_reg[46][3] ,
         \curr_reg[46][2] , \curr_reg[46][1] , \curr_reg[46][0] ,
         \curr_reg[47][7] , \curr_reg[47][6] , \curr_reg[47][5] ,
         \curr_reg[47][4] , \curr_reg[47][3] , \curr_reg[47][2] ,
         \curr_reg[47][1] , \curr_reg[47][0] , \curr_reg[48][7] ,
         \curr_reg[48][6] , \curr_reg[48][5] , \curr_reg[48][4] ,
         \curr_reg[48][3] , \curr_reg[48][2] , \curr_reg[48][1] ,
         \curr_reg[48][0] , \curr_reg[49][7] , \curr_reg[49][6] ,
         \curr_reg[49][5] , \curr_reg[49][4] , \curr_reg[49][3] ,
         \curr_reg[49][2] , \curr_reg[49][1] , \curr_reg[49][0] ,
         \curr_reg[50][7] , \curr_reg[50][6] , \curr_reg[50][5] ,
         \curr_reg[50][4] , \curr_reg[50][3] , \curr_reg[50][2] ,
         \curr_reg[50][1] , \curr_reg[50][0] , \curr_reg[51][7] ,
         \curr_reg[51][6] , \curr_reg[51][5] , \curr_reg[51][4] ,
         \curr_reg[51][3] , \curr_reg[51][2] , \curr_reg[51][1] ,
         \curr_reg[51][0] , \curr_reg[52][7] , \curr_reg[52][6] ,
         \curr_reg[52][5] , \curr_reg[52][4] , \curr_reg[52][3] ,
         \curr_reg[52][2] , \curr_reg[52][1] , \curr_reg[52][0] ,
         \curr_reg[53][7] , \curr_reg[53][6] , \curr_reg[53][5] ,
         \curr_reg[53][4] , \curr_reg[53][3] , \curr_reg[53][2] ,
         \curr_reg[53][1] , \curr_reg[53][0] , \curr_reg[54][7] ,
         \curr_reg[54][6] , \curr_reg[54][5] , \curr_reg[54][4] ,
         \curr_reg[54][3] , \curr_reg[54][2] , \curr_reg[54][1] ,
         \curr_reg[54][0] , \curr_reg[55][7] , \curr_reg[55][6] ,
         \curr_reg[55][5] , \curr_reg[55][4] , \curr_reg[55][3] ,
         \curr_reg[55][2] , \curr_reg[55][1] , \curr_reg[55][0] ,
         \curr_reg[56][7] , \curr_reg[56][6] , \curr_reg[56][5] ,
         \curr_reg[56][4] , \curr_reg[56][3] , \curr_reg[56][2] ,
         \curr_reg[56][1] , \curr_reg[56][0] , \curr_reg[57][7] ,
         \curr_reg[57][6] , \curr_reg[57][5] , \curr_reg[57][4] ,
         \curr_reg[57][3] , \curr_reg[57][2] , \curr_reg[57][1] ,
         \curr_reg[57][0] , \curr_reg[58][7] , \curr_reg[58][6] ,
         \curr_reg[58][5] , \curr_reg[58][4] , \curr_reg[58][3] ,
         \curr_reg[58][2] , \curr_reg[58][1] , \curr_reg[58][0] ,
         \curr_reg[59][7] , \curr_reg[59][6] , \curr_reg[59][5] ,
         \curr_reg[59][4] , \curr_reg[59][3] , \curr_reg[59][2] ,
         \curr_reg[59][1] , \curr_reg[59][0] , \curr_reg[60][7] ,
         \curr_reg[60][6] , \curr_reg[60][5] , \curr_reg[60][4] ,
         \curr_reg[60][3] , \curr_reg[60][2] , \curr_reg[60][1] ,
         \curr_reg[60][0] , \curr_reg[61][7] , \curr_reg[61][6] ,
         \curr_reg[61][5] , \curr_reg[61][4] , \curr_reg[61][3] ,
         \curr_reg[61][2] , \curr_reg[61][1] , \curr_reg[61][0] ,
         \curr_reg[62][7] , \curr_reg[62][6] , \curr_reg[62][5] ,
         \curr_reg[62][4] , \curr_reg[62][3] , \curr_reg[62][2] ,
         \curr_reg[62][1] , \curr_reg[62][0] , \curr_reg[63][7] ,
         \curr_reg[63][6] , \curr_reg[63][5] , \curr_reg[63][4] ,
         \curr_reg[63][3] , \curr_reg[63][2] , \curr_reg[63][1] ,
         \curr_reg[63][0] , N2003, N2004, N2005, N2006, N2007, N2008, N2009,
         N2038, N2039, N2040, N2041, N2042, N2043, N2044, N2045, n829, n831,
         n833, n835, n837, n839, n841, n843, n1376, n1378, n1380, n1382, n1384,
         n1386, n1388, n1390, n1391, n1392, n1393, n1394, n1395, n1396, n1397,
         n1398, n1399, n1400, n1401, n1402, n1403, n1404, n1405, n1406, n1407,
         n1408, n1409, n1410, n1411, n1412, n1413, n1414, n1415, n1416, n1417,
         n1418, n1419, n1420, n1421, n1422, n1423, n1424, n1425, n1426, n1427,
         n1428, n1429, n1430, n1431, n1432, n1433, n1434, n1435, n1436, n1437,
         n1438, n1439, n1440, n1441, n1442, n1443, n1444, n1445, n1446, n1447,
         n1448, n1449, n1450, n1451, n1452, n1453, n1454, n1455, n1456, n1457,
         n1458, n1459, n1460, n1461, n1462, n1463, n1464, n1465, n1466, n1467,
         n1468, n1469, n1470, n1471, n1472, n1473, n1474, n1475, n1476, n1477,
         n1478, n1479, n1480, n1481, n1482, n1483, n1484, n1485, n1486, n1487,
         n1488, n1489, n1490, n1491, n1492, n1493, n1494, n1495, n1496, n1497,
         n1498, n1499, n1500, n1501, n1502, n1503, n1504, n1505, n1506, n1507,
         n1508, n1509, n1510, n1511, n1512, n1513, n1514, n1515, n1516, n1517,
         n1518, n1519, n1520, n1521, n1522, n1523, n1524, n1525, n1526, n1527,
         n1528, n1529, n1530, n1531, n1532, n1533, n1534, n1535, n1536, n1537,
         n1538, n1539, n1540, n1541, n1542, n1543, n1544, n1545, n1546, n1547,
         n1548, n1549, n1550, n1551, n1552, n1553, n1554, n1555, n1556, n1557,
         n1558, n1559, n1560, n1561, n1562, n1563, n1564, n1565, n1566, n1567,
         n1568, n1569, n1570, n1571, n1572, n1573, n1574, n1575, n1576, n1577,
         n1578, n1579, n1580, n1581, n1582, n1583, n1584, n1585, n1586, n1587,
         n1588, n1589, n1590, n1591, n1592, n1593, n1594, n1595, n1596, n1597,
         n1598, n1599, n1600, n1601, n1602, n1603, n1604, n1605, n1606, n1607,
         n1608, n1609, n1610, n1611, n1612, n1613, n1614, n1615, n1616, n1617,
         n1618, n1619, n1620, n1621, n1622, n1623, n1624, n1625, n1626, n1627,
         n1628, n1629, n1630, n1631, n1632, n1633, n1634, n1635, n1636, n1637,
         n1638, n1639, n1640, n1641, n1642, n1643, n1644, n1645, n1646, n1647,
         n1648, n1649, n1650, n1651, n1652, n1653, n1654, n1655, n1656, n1657,
         n1658, n1659, n1660, n1661, n1662, n1663, n1664, n1665, n1666, n1667,
         n1668, n1669, n1670, n1671, n1672, n1673, n1674, n1675, n1676, n1677,
         n1678, n1679, n1680, n1681, n1682, n1683, n1684, n1685, n1686, n1687,
         n1688, n1689, n1690, n1691, n1692, n1693, n1694, n1695, n1696, n1697,
         n1698, n1699, n1700, n1701, n1702, n1703, n1704, n1705, n1706, n1707,
         n1708, n1709, n1710, n1711, n1712, n1713, n1714, n1715, n1716, n1717,
         n1718, n1719, n1720, n1721, n1722, n1723, n1724, n1725, n1726, n1727,
         n1728, n1729, n1730, n1731, n1732, n1733, n1734, n1735, n1736, n1737,
         n1738, n1739, n1740, n1741, n1742, n1743, n1744, n1745, n1746, n1747,
         n1748, n1749, n1750, n1751, n1752, n1753, n1754, n1755, n1756, n1757,
         n1758, n1759, n1760, n1761, n1762, n1763, n1764, n1765, n1766, n1767,
         n1768, n1769, n1770, n1771, n1772, n1773, n1774, n1775, n1776, n1777,
         n1778, n1779, n1780, n1781, n1782, n1783, n1784, n1785, n1786, n1787,
         n1788, n1789, n1790, n1791, n1792, n1793, n1794, n1795, n1796, n1797,
         n1798, n1799, n1800, n1801, n1802, n1803, n1804, n1805, n1806, n1807,
         n1808, n1809, n1810, n1811, n1812, n1813, n1814, n1815, n1816, n1817,
         n1818, n1819, n1820, n1821, n1822, n1823, n1824, n1825, n1826, n1827,
         n1828, n1829, n1830, n1831, n1832, n1833, n1834, n1835, n1836, n1837,
         n1838, n1839, n1840, n1841, n1842, n1843, n1844, n1845, n1846, n1847,
         n1848, n1849, n1850, n1851, n1852, n1853, n1854, n1855, n1856, n1857,
         n1858, n1859, n1860, n1861, n1862, n1863, n1864, n1865, n1866, n1867,
         n1868, n1869, n1870, n1871, n1872, n1873, n1874, n1875, n1876, n1877,
         n1878, n1879, n1880, n1881, n1882, n1883, n1884, n1885, n1886, n1887,
         n1888, n1889, n1890, n1891, n1892, n1893, n1894, n1895, n1896, n1897,
         n1898, n1899, n1900, n1901, n1902, n1903, n1904, n1905, n1906, n1907,
         n1908, n1909, n1910, n1911, n1912, n1913, n1914, n1915, n1916, n1917,
         n1918, n1919, n1920, n1921, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n561, n562, n563, n564, n565, n566, n567, n568,
         n569, n570, n571, n572, n573, n574, n575, n576, n577, n578, n579,
         n580, n581, n582, n583, n584, n585, n586, n587, n588, n589, n590,
         n591, n592, n593, n594, n595, n596, n597, n598, n599, n600, n601,
         n602, n603, n604, n605, n606, n607, n608, n609, n610, n611, n612,
         n613, n614, n615, n616, n617, n618, n619, n620, n621, n622, n623,
         n624, n625, n626, n627, n628, n629, n630, n631, n632, n633, n634,
         n635, n636, n637, n638, n639, n640, n641, n642, n643, n644, n645,
         n646, n647, n648, n649, n650, n651, n652, n653, n654, n655, n656,
         n657, n658, n659, n660, n661, n662, n663, n664, n665, n666, n667,
         n668, n669, n670, n671, n672, n673, n674, n675, n676, n677, n678,
         n679, n680, n681, n682, n683, n684, n685, n686, n687, n688, n689,
         n690, n691, n692, n693, n694, n695, n696, n697, n698, n699, n700,
         n701, n702, n703, n704, n705, n706, n707, n708, n709, n710, n711,
         n712, n713, n714, n715, n716, n717, n718, n719, n720, n721, n722,
         n723, n724, n725, n726, n727, n728, n729, n730, n731, n732, n733,
         n734, n735, n736, n737, n738, n739, n740, n741, n742, n743, n744,
         n745, n746, n747, n748, n749, n750, n751, n752, n753, n754, n755,
         n756, n757, n758, n759, n760, n761, n762, n763, n764, n765, n766,
         n767, n768, n769, n770, n771, n772, n773, n774, n775, n776, n777,
         n778, n779, n780, n781, n782, n783, n784, n785, n786, n787, n788,
         n789, n790, n791, n792, n793, n794, n795, n796, n797, n798, n799,
         n800, n801, n802, n803, n804, n805, n806, n807, n808, n809, n810,
         n811, n812, n813, n814, n815, n816, n817, n818, n819, n820, n821,
         n822, n823, n824, n825, n826, n827, n1922, n1923, n1924, n1925, n1926,
         n1927, n1928, n1929, n1930, n1931, n1932, n1933, n1934, n1935, n1936,
         n1937, n1938, n1939, n1940, n1941, n1942, n1943, n1944, n1945, n1946,
         n1947, n1948, n1949, n1950, n1951, n1952, n1953, n1954, n1955, n1956,
         n1957, n1958, n1959, n1960, n1961, n1962, n1963, n1964, n1965, n1966,
         n1967, n1968, n1969, n1970, n1971, n1972, n1973, n1974, n1975, n1976,
         n1977, n1978, n1979, n1980, n1981, n1982, n1983, n1984, n1985, n1986,
         n1987, n1988, n1989, n1990, n1991, n1992, n1993, n1994, n1995, n1996,
         n1997, n1998, n1999, n2000, n2001, n2002, n2003, n2004, n2005, n2006,
         n2007, n2008, n2009, n2010, n2011, n2012, n2013, n2014, n2015, n2016,
         n2017, n2018, n2019, n2020, n2021, n2022, n2023, n2024, n2025, n2026,
         n2027, n2028, n2029, n2030, n2031, n2032, n2033, n2034, n2035, n2036,
         n2037, n2038, n2039, n2040, n2041, n2042, n2043, n2044, n2045, n2046,
         n2047, n2048, n2049, n2050, n2051, n2052, n2053, n2054, n2055, n2056,
         n2057, n2058, n2059, n2060, n2061, n2062, n2063, n2064, n2065, n2066,
         n2067, n2068, n2069, n2070, n2071, n2072, n2073, n2074, n2075, n2076,
         n2077, n2078, n2079, n2080, n2081, n2082, n2083, n2084, n2085, n2086,
         n2087, n2088, n2089, n2090, n2091, n2092, n2093, n2094, n2095, n2096,
         n2097, n2098, n2099, n2100, n2101, n2102, n2103, n2104, n2105, n2106,
         n2107, n2108, n2109, n2110, n2111, n2112, n2113, n2114, n2115, n2116,
         n2117, n2118, n2119, n2120, n2121, n2122, n2123, n2124, n2125, n2126,
         n2127, n2128, n2129, n2130, n2131, n2132, n2133, n2134, n2135, n2136,
         n2137, n2138, n2139, n2140, n2141, n2142, n2143, n2144, n2145, n2146,
         n2147, n2148, n2149, n2150, n2151, n2152, n2153, n2154, n2155, n2156,
         n2157, n2158, n2159, n2160, n2161, n2162, n2163, n2164, n2165, n2166,
         n2167, n2168, n2169, n2170, n2171, n2172, n2173, n2174, n2175, n2176,
         n2177, n2178, n2179, n2180, n2181, n2182, n2183, n2184, n2185, n2186,
         n2187, n2188, n2189, n2190, n2191, n2192, n2193, n2194, n2195, n2196,
         n2197, n2198, n2199, n2200, n2201, n2202, n2203, n2204, n2205, n2206,
         n2207, n2208, n2209, n2210, n2211, n2212, n2213, n2214, n2215, n2216,
         n2217, n2218, n2219, n2220, n2221, n2222, n2223, n2224, n2225, n2226,
         n2227, n2228, n2229, n2230, n2231, n2232, n2233, n2234, n2235, n2236,
         n2237, n2238, n2239, n2240, n2241, n2242, n2243, n2244, n2245, n2246,
         n2247, n2248, n2249, n2250, n2251, n2252, n2253, n2254, n2255, n2256,
         n2257, n2258, n2259, n2260, n2261, n2262, n2263, n2264, n2265, n2266,
         n2267, n2268, n2269, n2270, n2271, n2272, n2273, n2274, n2275, n2276,
         n2277, n2278, n2279, n2280, n2281, n2282, n2283, n2284, n2285, n2286,
         n2287, n2288, n2289, n2290, n2291, n2292, n2293, n2294, n2295, n2296,
         n2297, n2298, n2299, n2300, n2301, n2302, n2303, n2304, n2305, n2306,
         n2307, n2308, n2309, n2310, n2311, n2312, n2313, n2314, n2315, n2316,
         n2317, n2318, n2319, n2320, n2321, n2322, n2323, n2324, n2325, n2326,
         n2327, n2328, n2329, n2330, n2331, n2332, n2333, n2334, n2335, n2336,
         n2337, n2338, n2339, n2340, n2341, n2342, n2343, n2344, n2345, n2346,
         n2347, n2348, n2349, n2350, n2351, n2352, n2353, n2354, n2355, n2356,
         n2357, n2358, n2359, n2360, n2361, n2362, n2363, n2364, n2365, n2366,
         n2367, n2368, n2369, n2370, n2371, n2372, n2373, n2374, n2375, n2376,
         n2377, n2378, n2379, n2380, n2381, n2382, n2383, n2384, n2385, n2386,
         n2387, n2388, n2389, n2390, n2391, n2392, n2393, n2394, n2395, n2396,
         n2397, n2398, n2399, n2400, n2401, n2402, n2403, n2404, n2405, n2406,
         n2407, n2408, n2409, n2410, n2411, n2412, n2413, n2414, n2415, n2416,
         n2417, n2418, n2419, n2420, n2421, n2422, n2423, n2424, n2425, n2426,
         n2427, n2428, n2429, n2430, n2431, n2432, n2433, n2434, n2435, n2436,
         n2437, n2438, n2439, n2440, n2441, n2442, n2443, n2444, n2445, n2446,
         n2447, n2448, n2449, n2450, n2451, n2452, n2453, n2454, n2455, n2456,
         n2457, n2458, n2459, n2460, n2461, n2462, n2463, n2464, n2465, n2466,
         n2467, n2468, n2469, n2470, n2471, n2472, n2473, n2474, n2475, n2476,
         n2477, n2478, n2479, n2480, n2481, n2482, n2483, n2484, n2485, n2486,
         n2487, n2488, n2489, n2490, n2491, n2492, n2493, n2494, n2495, n2496,
         n2497, n2498, n2499, n2500, n2501, n2502, n2503, n2504, n2505, n2506,
         n2507, n2508, n2509, n2510, n2511, n2512, n2513, n2514, n2515, n2516,
         n2517, n2518, n2519, n2520, n2521, n2522, n2523, n2524, n2525, n2526,
         n2527, n2528, n2529, n2530, n2531, n2532, n2533, n2534, n2535, n2536,
         n2537, n2538, n2539, n2540, n2541, n2542, n2543, n2544, n2545, n2546,
         n2547, n2548, n2549, n2550, n2551, n2552, n2553, n2554, n2555, n2556,
         n2557, n2558, n2559, n2560, n2561, n2562, n2563, n2564, n2565, n2566,
         n2567, n2568, n2569, n2570, n2571, n2572, n2573, n2574, n2575, n2576,
         n2577, n2578, n2579, n2580, n2581, n2582, n2583, n2584, n2585, n2586,
         n2587, n2588, n2589, n2590, n2591, n2592, n2593, n2594, n2595, n2596,
         n2597, n2598, n2599, n2600, n2601, n2602, n2603, n2604, n2605, n2606,
         n2607, n2608, n2609, n2610, n2611, n2612, n2613, n2614, n2615, n2616,
         n2617, n2618, n2619, n2620, n2621, n2622, n2623, n2624, n2625, n2626,
         n2627, n2628, n2629, n2630, n2631, n2632, n2633, n2634, n2635, n2636,
         n2637, n2638, n2639, n2640, n2641, n2642, n2643, n2644, n2645, n2646,
         n2647, n2648, n2649, n2650, n2651, n2652, n2653, n2654, n2655, n2656,
         n2657, n2658, n2659, n2660, n2661, n2662, n2663, n2664, n2665, n2666,
         n2667, n2668, n2669, n2670, n2671, n2672, n2673, n2674, n2675, n2676,
         n2677, n2678, n2679;
  wire   [5:0] curr_write_ptr;

  DFFSR \curr_rx_data_reg[7]  ( .D(n1390), .CLK(n147), .R(n84), .S(1'b1), .Q(
        rx_data[7]) );
  DFFSR \curr_rx_data_reg[6]  ( .D(n1388), .CLK(n106), .R(n39), .S(1'b1), .Q(
        rx_data[6]) );
  DFFSR \curr_rx_data_reg[5]  ( .D(n1386), .CLK(n111), .R(n44), .S(1'b1), .Q(
        rx_data[5]) );
  DFFSR \curr_rx_data_reg[4]  ( .D(n1384), .CLK(n116), .R(n50), .S(1'b1), .Q(
        rx_data[4]) );
  DFFSR \curr_rx_data_reg[3]  ( .D(n1382), .CLK(n121), .R(n55), .S(1'b1), .Q(
        rx_data[3]) );
  DFFSR \curr_rx_data_reg[2]  ( .D(n1380), .CLK(n126), .R(n61), .S(1'b1), .Q(
        rx_data[2]) );
  DFFSR \curr_rx_data_reg[1]  ( .D(n1378), .CLK(n131), .R(n66), .S(1'b1), .Q(
        rx_data[1]) );
  DFFSR \curr_rx_data_reg[0]  ( .D(n1376), .CLK(n147), .R(n84), .S(1'b1), .Q(
        rx_data[0]) );
  DFFSR \curr_read_ptr_reg[0]  ( .D(n1921), .CLK(n136), .R(n72), .S(1'b1), .Q(
        N153) );
  DFFSR \curr_read_ptr_reg[5]  ( .D(n1916), .CLK(n136), .R(n72), .S(1'b1), .Q(
        N158) );
  DFFSR \curr_read_ptr_reg[1]  ( .D(n1920), .CLK(n136), .R(n72), .S(1'b1), .Q(
        N154) );
  DFFSR \curr_read_ptr_reg[2]  ( .D(n1919), .CLK(n136), .R(n72), .S(1'b1), .Q(
        N155) );
  DFFSR \curr_read_ptr_reg[3]  ( .D(n1918), .CLK(n136), .R(n72), .S(1'b1), .Q(
        N156) );
  DFFSR \curr_read_ptr_reg[4]  ( .D(n1917), .CLK(n136), .R(n72), .S(1'b1), .Q(
        N157) );
  DFFSR \curr_occupancy_reg[0]  ( .D(n1915), .CLK(n147), .R(n84), .S(1'b1), 
        .Q(buffer_occupancy[0]) );
  DFFSR \curr_occupancy_reg[6]  ( .D(n1909), .CLK(n147), .R(n83), .S(1'b1), 
        .Q(buffer_occupancy[6]) );
  DFFSR \curr_write_ptr_reg[5]  ( .D(n1903), .CLK(n146), .R(n83), .S(1'b1), 
        .Q(curr_write_ptr[5]) );
  DFFSR \curr_write_ptr_reg[0]  ( .D(n1907), .CLK(n147), .R(n83), .S(1'b1), 
        .Q(curr_write_ptr[0]) );
  DFFSR \curr_write_ptr_reg[1]  ( .D(n1906), .CLK(n146), .R(n83), .S(1'b1), 
        .Q(curr_write_ptr[1]) );
  DFFSR \curr_write_ptr_reg[2]  ( .D(n1905), .CLK(n146), .R(n83), .S(1'b1), 
        .Q(curr_write_ptr[2]) );
  DFFSR \curr_write_ptr_reg[3]  ( .D(n1904), .CLK(n146), .R(n83), .S(1'b1), 
        .Q(curr_write_ptr[3]) );
  DFFSR \curr_write_ptr_reg[4]  ( .D(n1908), .CLK(n146), .R(n83), .S(1'b1), 
        .Q(curr_write_ptr[4]) );
  DFFSR \curr_reg_reg[55][1]  ( .D(n1837), .CLK(n132), .R(n67), .S(1'b1), .Q(
        \curr_reg[55][1] ) );
  DFFSR \curr_reg_reg[56][1]  ( .D(n1845), .CLK(n132), .R(n67), .S(1'b1), .Q(
        \curr_reg[56][1] ) );
  DFFSR \curr_reg_reg[57][1]  ( .D(n1853), .CLK(n132), .R(n67), .S(1'b1), .Q(
        \curr_reg[57][1] ) );
  DFFSR \curr_reg_reg[58][1]  ( .D(n1861), .CLK(n131), .R(n67), .S(1'b1), .Q(
        \curr_reg[58][1] ) );
  DFFSR \curr_reg_reg[59][1]  ( .D(n1869), .CLK(n131), .R(n67), .S(1'b1), .Q(
        \curr_reg[59][1] ) );
  DFFSR \curr_reg_reg[60][1]  ( .D(n1877), .CLK(n131), .R(n66), .S(1'b1), .Q(
        \curr_reg[60][1] ) );
  DFFSR \curr_reg_reg[61][1]  ( .D(n1885), .CLK(n131), .R(n66), .S(1'b1), .Q(
        \curr_reg[61][1] ) );
  DFFSR \curr_reg_reg[62][1]  ( .D(n1893), .CLK(n131), .R(n66), .S(1'b1), .Q(
        \curr_reg[62][1] ) );
  DFFSR \curr_reg_reg[63][1]  ( .D(n1901), .CLK(n131), .R(n66), .S(1'b1), .Q(
        \curr_reg[63][1] ) );
  DFFSR \curr_reg_reg[0][1]  ( .D(n1397), .CLK(n136), .R(n71), .S(1'b1), .Q(
        \curr_reg[0][1] ) );
  DFFSR \curr_reg_reg[1][1]  ( .D(n1405), .CLK(n136), .R(n71), .S(1'b1), .Q(
        \curr_reg[1][1] ) );
  DFFSR \curr_reg_reg[2][1]  ( .D(n1413), .CLK(n136), .R(n71), .S(1'b1), .Q(
        \curr_reg[2][1] ) );
  DFFSR \curr_reg_reg[3][1]  ( .D(n1421), .CLK(n136), .R(n71), .S(1'b1), .Q(
        \curr_reg[3][1] ) );
  DFFSR \curr_reg_reg[4][1]  ( .D(n1429), .CLK(n136), .R(n71), .S(1'b1), .Q(
        \curr_reg[4][1] ) );
  DFFSR \curr_reg_reg[5][1]  ( .D(n1437), .CLK(n136), .R(n71), .S(1'b1), .Q(
        \curr_reg[5][1] ) );
  DFFSR \curr_reg_reg[6][1]  ( .D(n1445), .CLK(n135), .R(n71), .S(1'b1), .Q(
        \curr_reg[6][1] ) );
  DFFSR \curr_reg_reg[7][1]  ( .D(n1453), .CLK(n135), .R(n71), .S(1'b1), .Q(
        \curr_reg[7][1] ) );
  DFFSR \curr_reg_reg[8][1]  ( .D(n1461), .CLK(n135), .R(n71), .S(1'b1), .Q(
        \curr_reg[8][1] ) );
  DFFSR \curr_reg_reg[9][1]  ( .D(n1469), .CLK(n135), .R(n71), .S(1'b1), .Q(
        \curr_reg[9][1] ) );
  DFFSR \curr_reg_reg[10][1]  ( .D(n1477), .CLK(n135), .R(n71), .S(1'b1), .Q(
        \curr_reg[10][1] ) );
  DFFSR \curr_reg_reg[11][1]  ( .D(n1485), .CLK(n135), .R(n71), .S(1'b1), .Q(
        \curr_reg[11][1] ) );
  DFFSR \curr_reg_reg[12][1]  ( .D(n1493), .CLK(n135), .R(n70), .S(1'b1), .Q(
        \curr_reg[12][1] ) );
  DFFSR \curr_reg_reg[13][1]  ( .D(n1501), .CLK(n135), .R(n70), .S(1'b1), .Q(
        \curr_reg[13][1] ) );
  DFFSR \curr_reg_reg[14][1]  ( .D(n1509), .CLK(n135), .R(n70), .S(1'b1), .Q(
        \curr_reg[14][1] ) );
  DFFSR \curr_reg_reg[15][1]  ( .D(n1517), .CLK(n135), .R(n70), .S(1'b1), .Q(
        \curr_reg[15][1] ) );
  DFFSR \curr_reg_reg[16][1]  ( .D(n1525), .CLK(n135), .R(n70), .S(1'b1), .Q(
        \curr_reg[16][1] ) );
  DFFSR \curr_reg_reg[17][1]  ( .D(n1533), .CLK(n135), .R(n70), .S(1'b1), .Q(
        \curr_reg[17][1] ) );
  DFFSR \curr_reg_reg[18][1]  ( .D(n1541), .CLK(n135), .R(n70), .S(1'b1), .Q(
        \curr_reg[18][1] ) );
  DFFSR \curr_reg_reg[19][1]  ( .D(n1549), .CLK(n134), .R(n70), .S(1'b1), .Q(
        \curr_reg[19][1] ) );
  DFFSR \curr_reg_reg[20][1]  ( .D(n1557), .CLK(n134), .R(n70), .S(1'b1), .Q(
        \curr_reg[20][1] ) );
  DFFSR \curr_reg_reg[21][1]  ( .D(n1565), .CLK(n134), .R(n70), .S(1'b1), .Q(
        \curr_reg[21][1] ) );
  DFFSR \curr_reg_reg[22][1]  ( .D(n1573), .CLK(n134), .R(n70), .S(1'b1), .Q(
        \curr_reg[22][1] ) );
  DFFSR \curr_reg_reg[23][1]  ( .D(n1581), .CLK(n134), .R(n70), .S(1'b1), .Q(
        \curr_reg[23][1] ) );
  DFFSR \curr_reg_reg[24][1]  ( .D(n1589), .CLK(n134), .R(n69), .S(1'b1), .Q(
        \curr_reg[24][1] ) );
  DFFSR \curr_reg_reg[25][1]  ( .D(n1597), .CLK(n134), .R(n69), .S(1'b1), .Q(
        \curr_reg[25][1] ) );
  DFFSR \curr_reg_reg[26][1]  ( .D(n1605), .CLK(n134), .R(n69), .S(1'b1), .Q(
        \curr_reg[26][1] ) );
  DFFSR \curr_reg_reg[27][1]  ( .D(n1613), .CLK(n134), .R(n69), .S(1'b1), .Q(
        \curr_reg[27][1] ) );
  DFFSR \curr_reg_reg[28][1]  ( .D(n1621), .CLK(n134), .R(n69), .S(1'b1), .Q(
        \curr_reg[28][1] ) );
  DFFSR \curr_reg_reg[29][1]  ( .D(n1629), .CLK(n134), .R(n69), .S(1'b1), .Q(
        \curr_reg[29][1] ) );
  DFFSR \curr_reg_reg[30][1]  ( .D(n1637), .CLK(n134), .R(n69), .S(1'b1), .Q(
        \curr_reg[30][1] ) );
  DFFSR \curr_reg_reg[31][1]  ( .D(n1645), .CLK(n134), .R(n69), .S(1'b1), .Q(
        \curr_reg[31][1] ) );
  DFFSR \curr_reg_reg[32][1]  ( .D(n1653), .CLK(n133), .R(n69), .S(1'b1), .Q(
        \curr_reg[32][1] ) );
  DFFSR \curr_reg_reg[33][1]  ( .D(n1661), .CLK(n133), .R(n69), .S(1'b1), .Q(
        \curr_reg[33][1] ) );
  DFFSR \curr_reg_reg[34][1]  ( .D(n1669), .CLK(n133), .R(n69), .S(1'b1), .Q(
        \curr_reg[34][1] ) );
  DFFSR \curr_reg_reg[35][1]  ( .D(n1677), .CLK(n133), .R(n69), .S(1'b1), .Q(
        \curr_reg[35][1] ) );
  DFFSR \curr_reg_reg[36][1]  ( .D(n1685), .CLK(n133), .R(n68), .S(1'b1), .Q(
        \curr_reg[36][1] ) );
  DFFSR \curr_reg_reg[37][1]  ( .D(n1693), .CLK(n133), .R(n68), .S(1'b1), .Q(
        \curr_reg[37][1] ) );
  DFFSR \curr_reg_reg[38][1]  ( .D(n1701), .CLK(n133), .R(n68), .S(1'b1), .Q(
        \curr_reg[38][1] ) );
  DFFSR \curr_reg_reg[39][1]  ( .D(n1709), .CLK(n133), .R(n68), .S(1'b1), .Q(
        \curr_reg[39][1] ) );
  DFFSR \curr_reg_reg[40][1]  ( .D(n1717), .CLK(n133), .R(n68), .S(1'b1), .Q(
        \curr_reg[40][1] ) );
  DFFSR \curr_reg_reg[41][1]  ( .D(n1725), .CLK(n133), .R(n68), .S(1'b1), .Q(
        \curr_reg[41][1] ) );
  DFFSR \curr_reg_reg[42][1]  ( .D(n1733), .CLK(n133), .R(n68), .S(1'b1), .Q(
        \curr_reg[42][1] ) );
  DFFSR \curr_reg_reg[43][1]  ( .D(n1741), .CLK(n133), .R(n68), .S(1'b1), .Q(
        \curr_reg[43][1] ) );
  DFFSR \curr_reg_reg[44][1]  ( .D(n1749), .CLK(n133), .R(n68), .S(1'b1), .Q(
        \curr_reg[44][1] ) );
  DFFSR \curr_reg_reg[45][1]  ( .D(n1757), .CLK(n132), .R(n68), .S(1'b1), .Q(
        \curr_reg[45][1] ) );
  DFFSR \curr_reg_reg[46][1]  ( .D(n1765), .CLK(n132), .R(n68), .S(1'b1), .Q(
        \curr_reg[46][1] ) );
  DFFSR \curr_reg_reg[47][1]  ( .D(n1773), .CLK(n132), .R(n68), .S(1'b1), .Q(
        \curr_reg[47][1] ) );
  DFFSR \curr_reg_reg[48][1]  ( .D(n1781), .CLK(n132), .R(n67), .S(1'b1), .Q(
        \curr_reg[48][1] ) );
  DFFSR \curr_reg_reg[49][1]  ( .D(n1789), .CLK(n132), .R(n67), .S(1'b1), .Q(
        \curr_reg[49][1] ) );
  DFFSR \curr_reg_reg[50][1]  ( .D(n1797), .CLK(n132), .R(n67), .S(1'b1), .Q(
        \curr_reg[50][1] ) );
  DFFSR \curr_reg_reg[51][1]  ( .D(n1805), .CLK(n132), .R(n67), .S(1'b1), .Q(
        \curr_reg[51][1] ) );
  DFFSR \curr_reg_reg[52][1]  ( .D(n1813), .CLK(n132), .R(n67), .S(1'b1), .Q(
        \curr_reg[52][1] ) );
  DFFSR \curr_reg_reg[53][1]  ( .D(n1821), .CLK(n132), .R(n67), .S(1'b1), .Q(
        \curr_reg[53][1] ) );
  DFFSR \curr_reg_reg[54][1]  ( .D(n1829), .CLK(n132), .R(n67), .S(1'b1), .Q(
        \curr_reg[54][1] ) );
  DFFSR \curr_reg_reg[55][0]  ( .D(n1838), .CLK(n138), .R(n73), .S(1'b1), .Q(
        \curr_reg[55][0] ) );
  DFFSR \curr_reg_reg[56][0]  ( .D(n1846), .CLK(n137), .R(n73), .S(1'b1), .Q(
        \curr_reg[56][0] ) );
  DFFSR \curr_reg_reg[57][0]  ( .D(n1854), .CLK(n137), .R(n73), .S(1'b1), .Q(
        \curr_reg[57][0] ) );
  DFFSR \curr_reg_reg[58][0]  ( .D(n1862), .CLK(n137), .R(n73), .S(1'b1), .Q(
        \curr_reg[58][0] ) );
  DFFSR \curr_reg_reg[59][0]  ( .D(n1870), .CLK(n137), .R(n73), .S(1'b1), .Q(
        \curr_reg[59][0] ) );
  DFFSR \curr_reg_reg[60][0]  ( .D(n1878), .CLK(n137), .R(n72), .S(1'b1), .Q(
        \curr_reg[60][0] ) );
  DFFSR \curr_reg_reg[61][0]  ( .D(n1886), .CLK(n137), .R(n72), .S(1'b1), .Q(
        \curr_reg[61][0] ) );
  DFFSR \curr_reg_reg[62][0]  ( .D(n1894), .CLK(n136), .R(n72), .S(1'b1), .Q(
        \curr_reg[62][0] ) );
  DFFSR \curr_reg_reg[63][0]  ( .D(n1902), .CLK(n147), .R(n84), .S(1'b1), .Q(
        \curr_reg[63][0] ) );
  DFFSR \curr_reg_reg[0][0]  ( .D(n1398), .CLK(n146), .R(n82), .S(1'b1), .Q(
        \curr_reg[0][0] ) );
  DFFSR \curr_reg_reg[1][0]  ( .D(n1406), .CLK(n146), .R(n82), .S(1'b1), .Q(
        \curr_reg[1][0] ) );
  DFFSR \curr_reg_reg[2][0]  ( .D(n1414), .CLK(n146), .R(n82), .S(1'b1), .Q(
        \curr_reg[2][0] ) );
  DFFSR \curr_reg_reg[3][0]  ( .D(n1422), .CLK(n146), .R(n82), .S(1'b1), .Q(
        \curr_reg[3][0] ) );
  DFFSR \curr_reg_reg[4][0]  ( .D(n1430), .CLK(n145), .R(n82), .S(1'b1), .Q(
        \curr_reg[4][0] ) );
  DFFSR \curr_reg_reg[5][0]  ( .D(n1438), .CLK(n145), .R(n82), .S(1'b1), .Q(
        \curr_reg[5][0] ) );
  DFFSR \curr_reg_reg[6][0]  ( .D(n1446), .CLK(n145), .R(n81), .S(1'b1), .Q(
        \curr_reg[6][0] ) );
  DFFSR \curr_reg_reg[7][0]  ( .D(n1454), .CLK(n145), .R(n81), .S(1'b1), .Q(
        \curr_reg[7][0] ) );
  DFFSR \curr_reg_reg[8][0]  ( .D(n1462), .CLK(n145), .R(n81), .S(1'b1), .Q(
        \curr_reg[8][0] ) );
  DFFSR \curr_reg_reg[9][0]  ( .D(n1470), .CLK(n145), .R(n81), .S(1'b1), .Q(
        \curr_reg[9][0] ) );
  DFFSR \curr_reg_reg[10][0]  ( .D(n1478), .CLK(n144), .R(n81), .S(1'b1), .Q(
        \curr_reg[10][0] ) );
  DFFSR \curr_reg_reg[11][0]  ( .D(n1486), .CLK(n144), .R(n81), .S(1'b1), .Q(
        \curr_reg[11][0] ) );
  DFFSR \curr_reg_reg[12][0]  ( .D(n1494), .CLK(n144), .R(n80), .S(1'b1), .Q(
        \curr_reg[12][0] ) );
  DFFSR \curr_reg_reg[13][0]  ( .D(n1502), .CLK(n144), .R(n80), .S(1'b1), .Q(
        \curr_reg[13][0] ) );
  DFFSR \curr_reg_reg[14][0]  ( .D(n1510), .CLK(n144), .R(n80), .S(1'b1), .Q(
        \curr_reg[14][0] ) );
  DFFSR \curr_reg_reg[15][0]  ( .D(n1518), .CLK(n144), .R(n80), .S(1'b1), .Q(
        \curr_reg[15][0] ) );
  DFFSR \curr_reg_reg[16][0]  ( .D(n1526), .CLK(n144), .R(n80), .S(1'b1), .Q(
        \curr_reg[16][0] ) );
  DFFSR \curr_reg_reg[17][0]  ( .D(n1534), .CLK(n143), .R(n80), .S(1'b1), .Q(
        \curr_reg[17][0] ) );
  DFFSR \curr_reg_reg[18][0]  ( .D(n1542), .CLK(n143), .R(n79), .S(1'b1), .Q(
        \curr_reg[18][0] ) );
  DFFSR \curr_reg_reg[19][0]  ( .D(n1550), .CLK(n143), .R(n79), .S(1'b1), .Q(
        \curr_reg[19][0] ) );
  DFFSR \curr_reg_reg[20][0]  ( .D(n1558), .CLK(n143), .R(n79), .S(1'b1), .Q(
        \curr_reg[20][0] ) );
  DFFSR \curr_reg_reg[21][0]  ( .D(n1566), .CLK(n143), .R(n79), .S(1'b1), .Q(
        \curr_reg[21][0] ) );
  DFFSR \curr_reg_reg[22][0]  ( .D(n1574), .CLK(n143), .R(n79), .S(1'b1), .Q(
        \curr_reg[22][0] ) );
  DFFSR \curr_reg_reg[23][0]  ( .D(n1582), .CLK(n142), .R(n79), .S(1'b1), .Q(
        \curr_reg[23][0] ) );
  DFFSR \curr_reg_reg[24][0]  ( .D(n1590), .CLK(n142), .R(n78), .S(1'b1), .Q(
        \curr_reg[24][0] ) );
  DFFSR \curr_reg_reg[25][0]  ( .D(n1598), .CLK(n142), .R(n78), .S(1'b1), .Q(
        \curr_reg[25][0] ) );
  DFFSR \curr_reg_reg[26][0]  ( .D(n1606), .CLK(n142), .R(n78), .S(1'b1), .Q(
        \curr_reg[26][0] ) );
  DFFSR \curr_reg_reg[27][0]  ( .D(n1614), .CLK(n142), .R(n78), .S(1'b1), .Q(
        \curr_reg[27][0] ) );
  DFFSR \curr_reg_reg[28][0]  ( .D(n1622), .CLK(n142), .R(n78), .S(1'b1), .Q(
        \curr_reg[28][0] ) );
  DFFSR \curr_reg_reg[29][0]  ( .D(n1630), .CLK(n142), .R(n78), .S(1'b1), .Q(
        \curr_reg[29][0] ) );
  DFFSR \curr_reg_reg[30][0]  ( .D(n1638), .CLK(n141), .R(n77), .S(1'b1), .Q(
        \curr_reg[30][0] ) );
  DFFSR \curr_reg_reg[31][0]  ( .D(n1646), .CLK(n141), .R(n77), .S(1'b1), .Q(
        \curr_reg[31][0] ) );
  DFFSR \curr_reg_reg[32][0]  ( .D(n1654), .CLK(n141), .R(n77), .S(1'b1), .Q(
        \curr_reg[32][0] ) );
  DFFSR \curr_reg_reg[33][0]  ( .D(n1662), .CLK(n141), .R(n77), .S(1'b1), .Q(
        \curr_reg[33][0] ) );
  DFFSR \curr_reg_reg[34][0]  ( .D(n1670), .CLK(n141), .R(n77), .S(1'b1), .Q(
        \curr_reg[34][0] ) );
  DFFSR \curr_reg_reg[35][0]  ( .D(n1678), .CLK(n141), .R(n77), .S(1'b1), .Q(
        \curr_reg[35][0] ) );
  DFFSR \curr_reg_reg[36][0]  ( .D(n1686), .CLK(n140), .R(n76), .S(1'b1), .Q(
        \curr_reg[36][0] ) );
  DFFSR \curr_reg_reg[37][0]  ( .D(n1694), .CLK(n140), .R(n76), .S(1'b1), .Q(
        \curr_reg[37][0] ) );
  DFFSR \curr_reg_reg[38][0]  ( .D(n1702), .CLK(n140), .R(n76), .S(1'b1), .Q(
        \curr_reg[38][0] ) );
  DFFSR \curr_reg_reg[39][0]  ( .D(n1710), .CLK(n140), .R(n76), .S(1'b1), .Q(
        \curr_reg[39][0] ) );
  DFFSR \curr_reg_reg[40][0]  ( .D(n1718), .CLK(n140), .R(n76), .S(1'b1), .Q(
        \curr_reg[40][0] ) );
  DFFSR \curr_reg_reg[41][0]  ( .D(n1726), .CLK(n140), .R(n76), .S(1'b1), .Q(
        \curr_reg[41][0] ) );
  DFFSR \curr_reg_reg[42][0]  ( .D(n1734), .CLK(n140), .R(n75), .S(1'b1), .Q(
        \curr_reg[42][0] ) );
  DFFSR \curr_reg_reg[43][0]  ( .D(n1742), .CLK(n139), .R(n75), .S(1'b1), .Q(
        \curr_reg[43][0] ) );
  DFFSR \curr_reg_reg[44][0]  ( .D(n1750), .CLK(n139), .R(n75), .S(1'b1), .Q(
        \curr_reg[44][0] ) );
  DFFSR \curr_reg_reg[45][0]  ( .D(n1758), .CLK(n139), .R(n75), .S(1'b1), .Q(
        \curr_reg[45][0] ) );
  DFFSR \curr_reg_reg[46][0]  ( .D(n1766), .CLK(n139), .R(n75), .S(1'b1), .Q(
        \curr_reg[46][0] ) );
  DFFSR \curr_reg_reg[47][0]  ( .D(n1774), .CLK(n139), .R(n75), .S(1'b1), .Q(
        \curr_reg[47][0] ) );
  DFFSR \curr_reg_reg[48][0]  ( .D(n1782), .CLK(n139), .R(n74), .S(1'b1), .Q(
        \curr_reg[48][0] ) );
  DFFSR \curr_reg_reg[49][0]  ( .D(n1790), .CLK(n138), .R(n74), .S(1'b1), .Q(
        \curr_reg[49][0] ) );
  DFFSR \curr_reg_reg[50][0]  ( .D(n1798), .CLK(n138), .R(n74), .S(1'b1), .Q(
        \curr_reg[50][0] ) );
  DFFSR \curr_reg_reg[51][0]  ( .D(n1806), .CLK(n138), .R(n74), .S(1'b1), .Q(
        \curr_reg[51][0] ) );
  DFFSR \curr_reg_reg[52][0]  ( .D(n1814), .CLK(n138), .R(n74), .S(1'b1), .Q(
        \curr_reg[52][0] ) );
  DFFSR \curr_reg_reg[53][0]  ( .D(n1822), .CLK(n138), .R(n74), .S(1'b1), .Q(
        \curr_reg[53][0] ) );
  DFFSR \curr_reg_reg[54][0]  ( .D(n1830), .CLK(n138), .R(n73), .S(1'b1), .Q(
        \curr_reg[54][0] ) );
  DFFSR \curr_reg_reg[56][7]  ( .D(n1839), .CLK(n137), .R(n73), .S(1'b1), .Q(
        \curr_reg[56][7] ) );
  DFFSR \curr_reg_reg[57][7]  ( .D(n1847), .CLK(n137), .R(n73), .S(1'b1), .Q(
        \curr_reg[57][7] ) );
  DFFSR \curr_reg_reg[58][7]  ( .D(n1855), .CLK(n137), .R(n73), .S(1'b1), .Q(
        \curr_reg[58][7] ) );
  DFFSR \curr_reg_reg[59][7]  ( .D(n1863), .CLK(n137), .R(n73), .S(1'b1), .Q(
        \curr_reg[59][7] ) );
  DFFSR \curr_reg_reg[60][7]  ( .D(n1871), .CLK(n137), .R(n72), .S(1'b1), .Q(
        \curr_reg[60][7] ) );
  DFFSR \curr_reg_reg[61][7]  ( .D(n1879), .CLK(n137), .R(n72), .S(1'b1), .Q(
        \curr_reg[61][7] ) );
  DFFSR \curr_reg_reg[62][7]  ( .D(n1887), .CLK(n137), .R(n72), .S(1'b1), .Q(
        \curr_reg[62][7] ) );
  DFFSR \curr_reg_reg[63][7]  ( .D(n1895), .CLK(n162), .R(n84), .S(1'b1), .Q(
        \curr_reg[63][7] ) );
  DFFSR \curr_reg_reg[0][7]  ( .D(n1391), .CLK(n146), .R(n82), .S(1'b1), .Q(
        \curr_reg[0][7] ) );
  DFFSR \curr_reg_reg[1][7]  ( .D(n1399), .CLK(n146), .R(n82), .S(1'b1), .Q(
        \curr_reg[1][7] ) );
  DFFSR \curr_reg_reg[2][7]  ( .D(n1407), .CLK(n146), .R(n82), .S(1'b1), .Q(
        \curr_reg[2][7] ) );
  DFFSR \curr_reg_reg[3][7]  ( .D(n1415), .CLK(n146), .R(n82), .S(1'b1), .Q(
        \curr_reg[3][7] ) );
  DFFSR \curr_reg_reg[4][7]  ( .D(n1423), .CLK(n145), .R(n82), .S(1'b1), .Q(
        \curr_reg[4][7] ) );
  DFFSR \curr_reg_reg[5][7]  ( .D(n1431), .CLK(n145), .R(n82), .S(1'b1), .Q(
        \curr_reg[5][7] ) );
  DFFSR \curr_reg_reg[6][7]  ( .D(n1439), .CLK(n145), .R(n81), .S(1'b1), .Q(
        \curr_reg[6][7] ) );
  DFFSR \curr_reg_reg[7][7]  ( .D(n1447), .CLK(n145), .R(n81), .S(1'b1), .Q(
        \curr_reg[7][7] ) );
  DFFSR \curr_reg_reg[8][7]  ( .D(n1455), .CLK(n145), .R(n81), .S(1'b1), .Q(
        \curr_reg[8][7] ) );
  DFFSR \curr_reg_reg[9][7]  ( .D(n1463), .CLK(n145), .R(n81), .S(1'b1), .Q(
        \curr_reg[9][7] ) );
  DFFSR \curr_reg_reg[10][7]  ( .D(n1471), .CLK(n145), .R(n81), .S(1'b1), .Q(
        \curr_reg[10][7] ) );
  DFFSR \curr_reg_reg[11][7]  ( .D(n1479), .CLK(n144), .R(n81), .S(1'b1), .Q(
        \curr_reg[11][7] ) );
  DFFSR \curr_reg_reg[12][7]  ( .D(n1487), .CLK(n144), .R(n80), .S(1'b1), .Q(
        \curr_reg[12][7] ) );
  DFFSR \curr_reg_reg[13][7]  ( .D(n1495), .CLK(n144), .R(n80), .S(1'b1), .Q(
        \curr_reg[13][7] ) );
  DFFSR \curr_reg_reg[14][7]  ( .D(n1503), .CLK(n144), .R(n80), .S(1'b1), .Q(
        \curr_reg[14][7] ) );
  DFFSR \curr_reg_reg[15][7]  ( .D(n1511), .CLK(n144), .R(n80), .S(1'b1), .Q(
        \curr_reg[15][7] ) );
  DFFSR \curr_reg_reg[16][7]  ( .D(n1519), .CLK(n144), .R(n80), .S(1'b1), .Q(
        \curr_reg[16][7] ) );
  DFFSR \curr_reg_reg[17][7]  ( .D(n1527), .CLK(n143), .R(n80), .S(1'b1), .Q(
        \curr_reg[17][7] ) );
  DFFSR \curr_reg_reg[18][7]  ( .D(n1535), .CLK(n143), .R(n79), .S(1'b1), .Q(
        \curr_reg[18][7] ) );
  DFFSR \curr_reg_reg[19][7]  ( .D(n1543), .CLK(n143), .R(n79), .S(1'b1), .Q(
        \curr_reg[19][7] ) );
  DFFSR \curr_reg_reg[20][7]  ( .D(n1551), .CLK(n143), .R(n79), .S(1'b1), .Q(
        \curr_reg[20][7] ) );
  DFFSR \curr_reg_reg[21][7]  ( .D(n1559), .CLK(n143), .R(n79), .S(1'b1), .Q(
        \curr_reg[21][7] ) );
  DFFSR \curr_reg_reg[22][7]  ( .D(n1567), .CLK(n143), .R(n79), .S(1'b1), .Q(
        \curr_reg[22][7] ) );
  DFFSR \curr_reg_reg[23][7]  ( .D(n1575), .CLK(n143), .R(n79), .S(1'b1), .Q(
        \curr_reg[23][7] ) );
  DFFSR \curr_reg_reg[24][7]  ( .D(n1583), .CLK(n142), .R(n78), .S(1'b1), .Q(
        \curr_reg[24][7] ) );
  DFFSR \curr_reg_reg[25][7]  ( .D(n1591), .CLK(n142), .R(n78), .S(1'b1), .Q(
        \curr_reg[25][7] ) );
  DFFSR \curr_reg_reg[26][7]  ( .D(n1599), .CLK(n142), .R(n78), .S(1'b1), .Q(
        \curr_reg[26][7] ) );
  DFFSR \curr_reg_reg[27][7]  ( .D(n1607), .CLK(n142), .R(n78), .S(1'b1), .Q(
        \curr_reg[27][7] ) );
  DFFSR \curr_reg_reg[28][7]  ( .D(n1615), .CLK(n142), .R(n78), .S(1'b1), .Q(
        \curr_reg[28][7] ) );
  DFFSR \curr_reg_reg[29][7]  ( .D(n1623), .CLK(n142), .R(n78), .S(1'b1), .Q(
        \curr_reg[29][7] ) );
  DFFSR \curr_reg_reg[30][7]  ( .D(n1631), .CLK(n141), .R(n77), .S(1'b1), .Q(
        \curr_reg[30][7] ) );
  DFFSR \curr_reg_reg[31][7]  ( .D(n1639), .CLK(n141), .R(n77), .S(1'b1), .Q(
        \curr_reg[31][7] ) );
  DFFSR \curr_reg_reg[32][7]  ( .D(n1647), .CLK(n141), .R(n77), .S(1'b1), .Q(
        \curr_reg[32][7] ) );
  DFFSR \curr_reg_reg[33][7]  ( .D(n1655), .CLK(n141), .R(n77), .S(1'b1), .Q(
        \curr_reg[33][7] ) );
  DFFSR \curr_reg_reg[34][7]  ( .D(n1663), .CLK(n141), .R(n77), .S(1'b1), .Q(
        \curr_reg[34][7] ) );
  DFFSR \curr_reg_reg[35][7]  ( .D(n1671), .CLK(n141), .R(n77), .S(1'b1), .Q(
        \curr_reg[35][7] ) );
  DFFSR \curr_reg_reg[36][7]  ( .D(n1679), .CLK(n141), .R(n76), .S(1'b1), .Q(
        \curr_reg[36][7] ) );
  DFFSR \curr_reg_reg[37][7]  ( .D(n1687), .CLK(n140), .R(n76), .S(1'b1), .Q(
        \curr_reg[37][7] ) );
  DFFSR \curr_reg_reg[38][7]  ( .D(n1695), .CLK(n140), .R(n76), .S(1'b1), .Q(
        \curr_reg[38][7] ) );
  DFFSR \curr_reg_reg[39][7]  ( .D(n1703), .CLK(n140), .R(n76), .S(1'b1), .Q(
        \curr_reg[39][7] ) );
  DFFSR \curr_reg_reg[40][7]  ( .D(n1711), .CLK(n140), .R(n76), .S(1'b1), .Q(
        \curr_reg[40][7] ) );
  DFFSR \curr_reg_reg[41][7]  ( .D(n1719), .CLK(n140), .R(n76), .S(1'b1), .Q(
        \curr_reg[41][7] ) );
  DFFSR \curr_reg_reg[42][7]  ( .D(n1727), .CLK(n140), .R(n75), .S(1'b1), .Q(
        \curr_reg[42][7] ) );
  DFFSR \curr_reg_reg[43][7]  ( .D(n1735), .CLK(n139), .R(n75), .S(1'b1), .Q(
        \curr_reg[43][7] ) );
  DFFSR \curr_reg_reg[44][7]  ( .D(n1743), .CLK(n139), .R(n75), .S(1'b1), .Q(
        \curr_reg[44][7] ) );
  DFFSR \curr_reg_reg[45][7]  ( .D(n1751), .CLK(n139), .R(n75), .S(1'b1), .Q(
        \curr_reg[45][7] ) );
  DFFSR \curr_reg_reg[46][7]  ( .D(n1759), .CLK(n139), .R(n75), .S(1'b1), .Q(
        \curr_reg[46][7] ) );
  DFFSR \curr_reg_reg[47][7]  ( .D(n1767), .CLK(n139), .R(n75), .S(1'b1), .Q(
        \curr_reg[47][7] ) );
  DFFSR \curr_reg_reg[48][7]  ( .D(n1775), .CLK(n139), .R(n74), .S(1'b1), .Q(
        \curr_reg[48][7] ) );
  DFFSR \curr_reg_reg[49][7]  ( .D(n1783), .CLK(n139), .R(n74), .S(1'b1), .Q(
        \curr_reg[49][7] ) );
  DFFSR \curr_reg_reg[50][7]  ( .D(n1791), .CLK(n138), .R(n74), .S(1'b1), .Q(
        \curr_reg[50][7] ) );
  DFFSR \curr_reg_reg[51][7]  ( .D(n1799), .CLK(n138), .R(n74), .S(1'b1), .Q(
        \curr_reg[51][7] ) );
  DFFSR \curr_reg_reg[52][7]  ( .D(n1807), .CLK(n138), .R(n74), .S(1'b1), .Q(
        \curr_reg[52][7] ) );
  DFFSR \curr_reg_reg[53][7]  ( .D(n1815), .CLK(n138), .R(n74), .S(1'b1), .Q(
        \curr_reg[53][7] ) );
  DFFSR \curr_reg_reg[54][7]  ( .D(n1823), .CLK(n138), .R(n73), .S(1'b1), .Q(
        \curr_reg[54][7] ) );
  DFFSR \curr_reg_reg[55][7]  ( .D(n1831), .CLK(n138), .R(n73), .S(1'b1), .Q(
        \curr_reg[55][7] ) );
  DFFSR \curr_reg_reg[56][6]  ( .D(n1840), .CLK(n106), .R(n39), .S(1'b1), .Q(
        \curr_reg[56][6] ) );
  DFFSR \curr_reg_reg[57][6]  ( .D(n1848), .CLK(n106), .R(n39), .S(1'b1), .Q(
        \curr_reg[57][6] ) );
  DFFSR \curr_reg_reg[58][6]  ( .D(n1856), .CLK(n106), .R(n39), .S(1'b1), .Q(
        \curr_reg[58][6] ) );
  DFFSR \curr_reg_reg[59][6]  ( .D(n1864), .CLK(n106), .R(n39), .S(1'b1), .Q(
        \curr_reg[59][6] ) );
  DFFSR \curr_reg_reg[60][6]  ( .D(n1872), .CLK(n106), .R(n39), .S(1'b1), .Q(
        \curr_reg[60][6] ) );
  DFFSR \curr_reg_reg[61][6]  ( .D(n1880), .CLK(n106), .R(n39), .S(1'b1), .Q(
        \curr_reg[61][6] ) );
  DFFSR \curr_reg_reg[62][6]  ( .D(n1888), .CLK(n106), .R(n39), .S(1'b1), .Q(
        \curr_reg[62][6] ) );
  DFFSR \curr_reg_reg[63][6]  ( .D(n1896), .CLK(n106), .R(n39), .S(1'b1), .Q(
        \curr_reg[63][6] ) );
  DFFSR \curr_reg_reg[0][6]  ( .D(n1392), .CLK(n111), .R(n44), .S(1'b1), .Q(
        \curr_reg[0][6] ) );
  DFFSR \curr_reg_reg[1][6]  ( .D(n1400), .CLK(n110), .R(n44), .S(1'b1), .Q(
        \curr_reg[1][6] ) );
  DFFSR \curr_reg_reg[2][6]  ( .D(n1408), .CLK(n110), .R(n44), .S(1'b1), .Q(
        \curr_reg[2][6] ) );
  DFFSR \curr_reg_reg[3][6]  ( .D(n1416), .CLK(n110), .R(n44), .S(1'b1), .Q(
        \curr_reg[3][6] ) );
  DFFSR \curr_reg_reg[4][6]  ( .D(n1424), .CLK(n110), .R(n44), .S(1'b1), .Q(
        \curr_reg[4][6] ) );
  DFFSR \curr_reg_reg[5][6]  ( .D(n1432), .CLK(n110), .R(n44), .S(1'b1), .Q(
        \curr_reg[5][6] ) );
  DFFSR \curr_reg_reg[6][6]  ( .D(n1440), .CLK(n110), .R(n43), .S(1'b1), .Q(
        \curr_reg[6][6] ) );
  DFFSR \curr_reg_reg[7][6]  ( .D(n1448), .CLK(n110), .R(n43), .S(1'b1), .Q(
        \curr_reg[7][6] ) );
  DFFSR \curr_reg_reg[8][6]  ( .D(n1456), .CLK(n110), .R(n43), .S(1'b1), .Q(
        \curr_reg[8][6] ) );
  DFFSR \curr_reg_reg[9][6]  ( .D(n1464), .CLK(n110), .R(n43), .S(1'b1), .Q(
        \curr_reg[9][6] ) );
  DFFSR \curr_reg_reg[10][6]  ( .D(n1472), .CLK(n110), .R(n43), .S(1'b1), .Q(
        \curr_reg[10][6] ) );
  DFFSR \curr_reg_reg[11][6]  ( .D(n1480), .CLK(n110), .R(n43), .S(1'b1), .Q(
        \curr_reg[11][6] ) );
  DFFSR \curr_reg_reg[12][6]  ( .D(n1488), .CLK(n110), .R(n43), .S(1'b1), .Q(
        \curr_reg[12][6] ) );
  DFFSR \curr_reg_reg[13][6]  ( .D(n1496), .CLK(n110), .R(n43), .S(1'b1), .Q(
        \curr_reg[13][6] ) );
  DFFSR \curr_reg_reg[14][6]  ( .D(n1504), .CLK(n109), .R(n43), .S(1'b1), .Q(
        \curr_reg[14][6] ) );
  DFFSR \curr_reg_reg[15][6]  ( .D(n1512), .CLK(n109), .R(n43), .S(1'b1), .Q(
        \curr_reg[15][6] ) );
  DFFSR \curr_reg_reg[16][6]  ( .D(n1520), .CLK(n109), .R(n43), .S(1'b1), .Q(
        \curr_reg[16][6] ) );
  DFFSR \curr_reg_reg[17][6]  ( .D(n1528), .CLK(n109), .R(n43), .S(1'b1), .Q(
        \curr_reg[17][6] ) );
  DFFSR \curr_reg_reg[18][6]  ( .D(n1536), .CLK(n109), .R(n42), .S(1'b1), .Q(
        \curr_reg[18][6] ) );
  DFFSR \curr_reg_reg[19][6]  ( .D(n1544), .CLK(n109), .R(n42), .S(1'b1), .Q(
        \curr_reg[19][6] ) );
  DFFSR \curr_reg_reg[20][6]  ( .D(n1552), .CLK(n109), .R(n42), .S(1'b1), .Q(
        \curr_reg[20][6] ) );
  DFFSR \curr_reg_reg[21][6]  ( .D(n1560), .CLK(n109), .R(n42), .S(1'b1), .Q(
        \curr_reg[21][6] ) );
  DFFSR \curr_reg_reg[22][6]  ( .D(n1568), .CLK(n109), .R(n42), .S(1'b1), .Q(
        \curr_reg[22][6] ) );
  DFFSR \curr_reg_reg[23][6]  ( .D(n1576), .CLK(n109), .R(n42), .S(1'b1), .Q(
        \curr_reg[23][6] ) );
  DFFSR \curr_reg_reg[24][6]  ( .D(n1584), .CLK(n109), .R(n42), .S(1'b1), .Q(
        \curr_reg[24][6] ) );
  DFFSR \curr_reg_reg[25][6]  ( .D(n1592), .CLK(n109), .R(n42), .S(1'b1), .Q(
        \curr_reg[25][6] ) );
  DFFSR \curr_reg_reg[26][6]  ( .D(n1600), .CLK(n109), .R(n42), .S(1'b1), .Q(
        \curr_reg[26][6] ) );
  DFFSR \curr_reg_reg[27][6]  ( .D(n1608), .CLK(n108), .R(n42), .S(1'b1), .Q(
        \curr_reg[27][6] ) );
  DFFSR \curr_reg_reg[28][6]  ( .D(n1616), .CLK(n108), .R(n42), .S(1'b1), .Q(
        \curr_reg[28][6] ) );
  DFFSR \curr_reg_reg[29][6]  ( .D(n1624), .CLK(n108), .R(n42), .S(1'b1), .Q(
        \curr_reg[29][6] ) );
  DFFSR \curr_reg_reg[30][6]  ( .D(n1632), .CLK(n108), .R(n41), .S(1'b1), .Q(
        \curr_reg[30][6] ) );
  DFFSR \curr_reg_reg[31][6]  ( .D(n1640), .CLK(n108), .R(n41), .S(1'b1), .Q(
        \curr_reg[31][6] ) );
  DFFSR \curr_reg_reg[32][6]  ( .D(n1648), .CLK(n108), .R(n41), .S(1'b1), .Q(
        \curr_reg[32][6] ) );
  DFFSR \curr_reg_reg[33][6]  ( .D(n1656), .CLK(n108), .R(n41), .S(1'b1), .Q(
        \curr_reg[33][6] ) );
  DFFSR \curr_reg_reg[34][6]  ( .D(n1664), .CLK(n108), .R(n41), .S(1'b1), .Q(
        \curr_reg[34][6] ) );
  DFFSR \curr_reg_reg[35][6]  ( .D(n1672), .CLK(n108), .R(n41), .S(1'b1), .Q(
        \curr_reg[35][6] ) );
  DFFSR \curr_reg_reg[36][6]  ( .D(n1680), .CLK(n108), .R(n41), .S(1'b1), .Q(
        \curr_reg[36][6] ) );
  DFFSR \curr_reg_reg[37][6]  ( .D(n1688), .CLK(n108), .R(n41), .S(1'b1), .Q(
        \curr_reg[37][6] ) );
  DFFSR \curr_reg_reg[38][6]  ( .D(n1696), .CLK(n108), .R(n41), .S(1'b1), .Q(
        \curr_reg[38][6] ) );
  DFFSR \curr_reg_reg[39][6]  ( .D(n1704), .CLK(n108), .R(n41), .S(1'b1), .Q(
        \curr_reg[39][6] ) );
  DFFSR \curr_reg_reg[40][6]  ( .D(n1712), .CLK(n107), .R(n41), .S(1'b1), .Q(
        \curr_reg[40][6] ) );
  DFFSR \curr_reg_reg[41][6]  ( .D(n1720), .CLK(n107), .R(n41), .S(1'b1), .Q(
        \curr_reg[41][6] ) );
  DFFSR \curr_reg_reg[42][6]  ( .D(n1728), .CLK(n107), .R(n40), .S(1'b1), .Q(
        \curr_reg[42][6] ) );
  DFFSR \curr_reg_reg[43][6]  ( .D(n1736), .CLK(n107), .R(n40), .S(1'b1), .Q(
        \curr_reg[43][6] ) );
  DFFSR \curr_reg_reg[44][6]  ( .D(n1744), .CLK(n107), .R(n40), .S(1'b1), .Q(
        \curr_reg[44][6] ) );
  DFFSR \curr_reg_reg[45][6]  ( .D(n1752), .CLK(n107), .R(n40), .S(1'b1), .Q(
        \curr_reg[45][6] ) );
  DFFSR \curr_reg_reg[46][6]  ( .D(n1760), .CLK(n107), .R(n40), .S(1'b1), .Q(
        \curr_reg[46][6] ) );
  DFFSR \curr_reg_reg[47][6]  ( .D(n1768), .CLK(n107), .R(n40), .S(1'b1), .Q(
        \curr_reg[47][6] ) );
  DFFSR \curr_reg_reg[48][6]  ( .D(n1776), .CLK(n107), .R(n40), .S(1'b1), .Q(
        \curr_reg[48][6] ) );
  DFFSR \curr_reg_reg[49][6]  ( .D(n1784), .CLK(n107), .R(n40), .S(1'b1), .Q(
        \curr_reg[49][6] ) );
  DFFSR \curr_reg_reg[50][6]  ( .D(n1792), .CLK(n107), .R(n40), .S(1'b1), .Q(
        \curr_reg[50][6] ) );
  DFFSR \curr_reg_reg[51][6]  ( .D(n1800), .CLK(n107), .R(n40), .S(1'b1), .Q(
        \curr_reg[51][6] ) );
  DFFSR \curr_reg_reg[52][6]  ( .D(n1808), .CLK(n107), .R(n40), .S(1'b1), .Q(
        \curr_reg[52][6] ) );
  DFFSR \curr_reg_reg[53][6]  ( .D(n1816), .CLK(n106), .R(n40), .S(1'b1), .Q(
        \curr_reg[53][6] ) );
  DFFSR \curr_reg_reg[54][6]  ( .D(n1824), .CLK(n106), .R(n39), .S(1'b1), .Q(
        \curr_reg[54][6] ) );
  DFFSR \curr_reg_reg[55][6]  ( .D(n1832), .CLK(n106), .R(n39), .S(1'b1), .Q(
        \curr_reg[55][6] ) );
  DFFSR \curr_reg_reg[56][5]  ( .D(n1841), .CLK(n111), .R(n45), .S(1'b1), .Q(
        \curr_reg[56][5] ) );
  DFFSR \curr_reg_reg[57][5]  ( .D(n1849), .CLK(n111), .R(n45), .S(1'b1), .Q(
        \curr_reg[57][5] ) );
  DFFSR \curr_reg_reg[58][5]  ( .D(n1857), .CLK(n111), .R(n45), .S(1'b1), .Q(
        \curr_reg[58][5] ) );
  DFFSR \curr_reg_reg[59][5]  ( .D(n1865), .CLK(n111), .R(n45), .S(1'b1), .Q(
        \curr_reg[59][5] ) );
  DFFSR \curr_reg_reg[60][5]  ( .D(n1873), .CLK(n111), .R(n44), .S(1'b1), .Q(
        \curr_reg[60][5] ) );
  DFFSR \curr_reg_reg[61][5]  ( .D(n1881), .CLK(n111), .R(n44), .S(1'b1), .Q(
        \curr_reg[61][5] ) );
  DFFSR \curr_reg_reg[62][5]  ( .D(n1889), .CLK(n111), .R(n44), .S(1'b1), .Q(
        \curr_reg[62][5] ) );
  DFFSR \curr_reg_reg[63][5]  ( .D(n1897), .CLK(n111), .R(n44), .S(1'b1), .Q(
        \curr_reg[63][5] ) );
  DFFSR \curr_reg_reg[0][5]  ( .D(n1393), .CLK(n116), .R(n49), .S(1'b1), .Q(
        \curr_reg[0][5] ) );
  DFFSR \curr_reg_reg[1][5]  ( .D(n1401), .CLK(n116), .R(n49), .S(1'b1), .Q(
        \curr_reg[1][5] ) );
  DFFSR \curr_reg_reg[2][5]  ( .D(n1409), .CLK(n115), .R(n49), .S(1'b1), .Q(
        \curr_reg[2][5] ) );
  DFFSR \curr_reg_reg[3][5]  ( .D(n1417), .CLK(n115), .R(n49), .S(1'b1), .Q(
        \curr_reg[3][5] ) );
  DFFSR \curr_reg_reg[4][5]  ( .D(n1425), .CLK(n115), .R(n49), .S(1'b1), .Q(
        \curr_reg[4][5] ) );
  DFFSR \curr_reg_reg[5][5]  ( .D(n1433), .CLK(n115), .R(n49), .S(1'b1), .Q(
        \curr_reg[5][5] ) );
  DFFSR \curr_reg_reg[6][5]  ( .D(n1441), .CLK(n115), .R(n49), .S(1'b1), .Q(
        \curr_reg[6][5] ) );
  DFFSR \curr_reg_reg[7][5]  ( .D(n1449), .CLK(n115), .R(n49), .S(1'b1), .Q(
        \curr_reg[7][5] ) );
  DFFSR \curr_reg_reg[8][5]  ( .D(n1457), .CLK(n115), .R(n49), .S(1'b1), .Q(
        \curr_reg[8][5] ) );
  DFFSR \curr_reg_reg[9][5]  ( .D(n1465), .CLK(n115), .R(n49), .S(1'b1), .Q(
        \curr_reg[9][5] ) );
  DFFSR \curr_reg_reg[10][5]  ( .D(n1473), .CLK(n115), .R(n49), .S(1'b1), .Q(
        \curr_reg[10][5] ) );
  DFFSR \curr_reg_reg[11][5]  ( .D(n1481), .CLK(n115), .R(n49), .S(1'b1), .Q(
        \curr_reg[11][5] ) );
  DFFSR \curr_reg_reg[12][5]  ( .D(n1489), .CLK(n115), .R(n48), .S(1'b1), .Q(
        \curr_reg[12][5] ) );
  DFFSR \curr_reg_reg[13][5]  ( .D(n1497), .CLK(n115), .R(n48), .S(1'b1), .Q(
        \curr_reg[13][5] ) );
  DFFSR \curr_reg_reg[14][5]  ( .D(n1505), .CLK(n115), .R(n48), .S(1'b1), .Q(
        \curr_reg[14][5] ) );
  DFFSR \curr_reg_reg[15][5]  ( .D(n1513), .CLK(n114), .R(n48), .S(1'b1), .Q(
        \curr_reg[15][5] ) );
  DFFSR \curr_reg_reg[16][5]  ( .D(n1521), .CLK(n114), .R(n48), .S(1'b1), .Q(
        \curr_reg[16][5] ) );
  DFFSR \curr_reg_reg[17][5]  ( .D(n1529), .CLK(n114), .R(n48), .S(1'b1), .Q(
        \curr_reg[17][5] ) );
  DFFSR \curr_reg_reg[18][5]  ( .D(n1537), .CLK(n114), .R(n48), .S(1'b1), .Q(
        \curr_reg[18][5] ) );
  DFFSR \curr_reg_reg[19][5]  ( .D(n1545), .CLK(n114), .R(n48), .S(1'b1), .Q(
        \curr_reg[19][5] ) );
  DFFSR \curr_reg_reg[20][5]  ( .D(n1553), .CLK(n114), .R(n48), .S(1'b1), .Q(
        \curr_reg[20][5] ) );
  DFFSR \curr_reg_reg[21][5]  ( .D(n1561), .CLK(n114), .R(n48), .S(1'b1), .Q(
        \curr_reg[21][5] ) );
  DFFSR \curr_reg_reg[22][5]  ( .D(n1569), .CLK(n114), .R(n48), .S(1'b1), .Q(
        \curr_reg[22][5] ) );
  DFFSR \curr_reg_reg[23][5]  ( .D(n1577), .CLK(n114), .R(n48), .S(1'b1), .Q(
        \curr_reg[23][5] ) );
  DFFSR \curr_reg_reg[24][5]  ( .D(n1585), .CLK(n114), .R(n47), .S(1'b1), .Q(
        \curr_reg[24][5] ) );
  DFFSR \curr_reg_reg[25][5]  ( .D(n1593), .CLK(n114), .R(n47), .S(1'b1), .Q(
        \curr_reg[25][5] ) );
  DFFSR \curr_reg_reg[26][5]  ( .D(n1601), .CLK(n114), .R(n47), .S(1'b1), .Q(
        \curr_reg[26][5] ) );
  DFFSR \curr_reg_reg[27][5]  ( .D(n1609), .CLK(n114), .R(n47), .S(1'b1), .Q(
        \curr_reg[27][5] ) );
  DFFSR \curr_reg_reg[28][5]  ( .D(n1617), .CLK(n113), .R(n47), .S(1'b1), .Q(
        \curr_reg[28][5] ) );
  DFFSR \curr_reg_reg[29][5]  ( .D(n1625), .CLK(n113), .R(n47), .S(1'b1), .Q(
        \curr_reg[29][5] ) );
  DFFSR \curr_reg_reg[30][5]  ( .D(n1633), .CLK(n113), .R(n47), .S(1'b1), .Q(
        \curr_reg[30][5] ) );
  DFFSR \curr_reg_reg[31][5]  ( .D(n1641), .CLK(n113), .R(n47), .S(1'b1), .Q(
        \curr_reg[31][5] ) );
  DFFSR \curr_reg_reg[32][5]  ( .D(n1649), .CLK(n113), .R(n47), .S(1'b1), .Q(
        \curr_reg[32][5] ) );
  DFFSR \curr_reg_reg[33][5]  ( .D(n1657), .CLK(n113), .R(n47), .S(1'b1), .Q(
        \curr_reg[33][5] ) );
  DFFSR \curr_reg_reg[34][5]  ( .D(n1665), .CLK(n113), .R(n47), .S(1'b1), .Q(
        \curr_reg[34][5] ) );
  DFFSR \curr_reg_reg[35][5]  ( .D(n1673), .CLK(n113), .R(n47), .S(1'b1), .Q(
        \curr_reg[35][5] ) );
  DFFSR \curr_reg_reg[36][5]  ( .D(n1681), .CLK(n113), .R(n46), .S(1'b1), .Q(
        \curr_reg[36][5] ) );
  DFFSR \curr_reg_reg[37][5]  ( .D(n1689), .CLK(n113), .R(n46), .S(1'b1), .Q(
        \curr_reg[37][5] ) );
  DFFSR \curr_reg_reg[38][5]  ( .D(n1697), .CLK(n113), .R(n46), .S(1'b1), .Q(
        \curr_reg[38][5] ) );
  DFFSR \curr_reg_reg[39][5]  ( .D(n1705), .CLK(n113), .R(n46), .S(1'b1), .Q(
        \curr_reg[39][5] ) );
  DFFSR \curr_reg_reg[40][5]  ( .D(n1713), .CLK(n113), .R(n46), .S(1'b1), .Q(
        \curr_reg[40][5] ) );
  DFFSR \curr_reg_reg[41][5]  ( .D(n1721), .CLK(n112), .R(n46), .S(1'b1), .Q(
        \curr_reg[41][5] ) );
  DFFSR \curr_reg_reg[42][5]  ( .D(n1729), .CLK(n112), .R(n46), .S(1'b1), .Q(
        \curr_reg[42][5] ) );
  DFFSR \curr_reg_reg[43][5]  ( .D(n1737), .CLK(n112), .R(n46), .S(1'b1), .Q(
        \curr_reg[43][5] ) );
  DFFSR \curr_reg_reg[44][5]  ( .D(n1745), .CLK(n112), .R(n46), .S(1'b1), .Q(
        \curr_reg[44][5] ) );
  DFFSR \curr_reg_reg[45][5]  ( .D(n1753), .CLK(n112), .R(n46), .S(1'b1), .Q(
        \curr_reg[45][5] ) );
  DFFSR \curr_reg_reg[46][5]  ( .D(n1761), .CLK(n112), .R(n46), .S(1'b1), .Q(
        \curr_reg[46][5] ) );
  DFFSR \curr_reg_reg[47][5]  ( .D(n1769), .CLK(n112), .R(n46), .S(1'b1), .Q(
        \curr_reg[47][5] ) );
  DFFSR \curr_reg_reg[48][5]  ( .D(n1777), .CLK(n112), .R(n45), .S(1'b1), .Q(
        \curr_reg[48][5] ) );
  DFFSR \curr_reg_reg[49][5]  ( .D(n1785), .CLK(n112), .R(n45), .S(1'b1), .Q(
        \curr_reg[49][5] ) );
  DFFSR \curr_reg_reg[50][5]  ( .D(n1793), .CLK(n112), .R(n45), .S(1'b1), .Q(
        \curr_reg[50][5] ) );
  DFFSR \curr_reg_reg[51][5]  ( .D(n1801), .CLK(n112), .R(n45), .S(1'b1), .Q(
        \curr_reg[51][5] ) );
  DFFSR \curr_reg_reg[52][5]  ( .D(n1809), .CLK(n112), .R(n45), .S(1'b1), .Q(
        \curr_reg[52][5] ) );
  DFFSR \curr_reg_reg[53][5]  ( .D(n1817), .CLK(n112), .R(n45), .S(1'b1), .Q(
        \curr_reg[53][5] ) );
  DFFSR \curr_reg_reg[54][5]  ( .D(n1825), .CLK(n111), .R(n45), .S(1'b1), .Q(
        \curr_reg[54][5] ) );
  DFFSR \curr_reg_reg[55][5]  ( .D(n1833), .CLK(n111), .R(n45), .S(1'b1), .Q(
        \curr_reg[55][5] ) );
  DFFSR \curr_reg_reg[56][4]  ( .D(n1842), .CLK(n116), .R(n50), .S(1'b1), .Q(
        \curr_reg[56][4] ) );
  DFFSR \curr_reg_reg[57][4]  ( .D(n1850), .CLK(n116), .R(n50), .S(1'b1), .Q(
        \curr_reg[57][4] ) );
  DFFSR \curr_reg_reg[58][4]  ( .D(n1858), .CLK(n116), .R(n50), .S(1'b1), .Q(
        \curr_reg[58][4] ) );
  DFFSR \curr_reg_reg[59][4]  ( .D(n1866), .CLK(n116), .R(n50), .S(1'b1), .Q(
        \curr_reg[59][4] ) );
  DFFSR \curr_reg_reg[60][4]  ( .D(n1874), .CLK(n116), .R(n50), .S(1'b1), .Q(
        \curr_reg[60][4] ) );
  DFFSR \curr_reg_reg[61][4]  ( .D(n1882), .CLK(n116), .R(n50), .S(1'b1), .Q(
        \curr_reg[61][4] ) );
  DFFSR \curr_reg_reg[62][4]  ( .D(n1890), .CLK(n116), .R(n50), .S(1'b1), .Q(
        \curr_reg[62][4] ) );
  DFFSR \curr_reg_reg[63][4]  ( .D(n1898), .CLK(n116), .R(n50), .S(1'b1), .Q(
        \curr_reg[63][4] ) );
  DFFSR \curr_reg_reg[0][4]  ( .D(n1394), .CLK(n121), .R(n55), .S(1'b1), .Q(
        \curr_reg[0][4] ) );
  DFFSR \curr_reg_reg[1][4]  ( .D(n1402), .CLK(n121), .R(n55), .S(1'b1), .Q(
        \curr_reg[1][4] ) );
  DFFSR \curr_reg_reg[2][4]  ( .D(n1410), .CLK(n121), .R(n55), .S(1'b1), .Q(
        \curr_reg[2][4] ) );
  DFFSR \curr_reg_reg[3][4]  ( .D(n1418), .CLK(n120), .R(n55), .S(1'b1), .Q(
        \curr_reg[3][4] ) );
  DFFSR \curr_reg_reg[4][4]  ( .D(n1426), .CLK(n120), .R(n55), .S(1'b1), .Q(
        \curr_reg[4][4] ) );
  DFFSR \curr_reg_reg[5][4]  ( .D(n1434), .CLK(n120), .R(n55), .S(1'b1), .Q(
        \curr_reg[5][4] ) );
  DFFSR \curr_reg_reg[6][4]  ( .D(n1442), .CLK(n120), .R(n54), .S(1'b1), .Q(
        \curr_reg[6][4] ) );
  DFFSR \curr_reg_reg[7][4]  ( .D(n1450), .CLK(n120), .R(n54), .S(1'b1), .Q(
        \curr_reg[7][4] ) );
  DFFSR \curr_reg_reg[8][4]  ( .D(n1458), .CLK(n120), .R(n54), .S(1'b1), .Q(
        \curr_reg[8][4] ) );
  DFFSR \curr_reg_reg[9][4]  ( .D(n1466), .CLK(n120), .R(n54), .S(1'b1), .Q(
        \curr_reg[9][4] ) );
  DFFSR \curr_reg_reg[10][4]  ( .D(n1474), .CLK(n120), .R(n54), .S(1'b1), .Q(
        \curr_reg[10][4] ) );
  DFFSR \curr_reg_reg[11][4]  ( .D(n1482), .CLK(n120), .R(n54), .S(1'b1), .Q(
        \curr_reg[11][4] ) );
  DFFSR \curr_reg_reg[12][4]  ( .D(n1490), .CLK(n120), .R(n54), .S(1'b1), .Q(
        \curr_reg[12][4] ) );
  DFFSR \curr_reg_reg[13][4]  ( .D(n1498), .CLK(n120), .R(n54), .S(1'b1), .Q(
        \curr_reg[13][4] ) );
  DFFSR \curr_reg_reg[14][4]  ( .D(n1506), .CLK(n120), .R(n54), .S(1'b1), .Q(
        \curr_reg[14][4] ) );
  DFFSR \curr_reg_reg[15][4]  ( .D(n1514), .CLK(n120), .R(n54), .S(1'b1), .Q(
        \curr_reg[15][4] ) );
  DFFSR \curr_reg_reg[16][4]  ( .D(n1522), .CLK(n119), .R(n54), .S(1'b1), .Q(
        \curr_reg[16][4] ) );
  DFFSR \curr_reg_reg[17][4]  ( .D(n1530), .CLK(n119), .R(n54), .S(1'b1), .Q(
        \curr_reg[17][4] ) );
  DFFSR \curr_reg_reg[18][4]  ( .D(n1538), .CLK(n119), .R(n53), .S(1'b1), .Q(
        \curr_reg[18][4] ) );
  DFFSR \curr_reg_reg[19][4]  ( .D(n1546), .CLK(n119), .R(n53), .S(1'b1), .Q(
        \curr_reg[19][4] ) );
  DFFSR \curr_reg_reg[20][4]  ( .D(n1554), .CLK(n119), .R(n53), .S(1'b1), .Q(
        \curr_reg[20][4] ) );
  DFFSR \curr_reg_reg[21][4]  ( .D(n1562), .CLK(n119), .R(n53), .S(1'b1), .Q(
        \curr_reg[21][4] ) );
  DFFSR \curr_reg_reg[22][4]  ( .D(n1570), .CLK(n119), .R(n53), .S(1'b1), .Q(
        \curr_reg[22][4] ) );
  DFFSR \curr_reg_reg[23][4]  ( .D(n1578), .CLK(n119), .R(n53), .S(1'b1), .Q(
        \curr_reg[23][4] ) );
  DFFSR \curr_reg_reg[24][4]  ( .D(n1586), .CLK(n119), .R(n53), .S(1'b1), .Q(
        \curr_reg[24][4] ) );
  DFFSR \curr_reg_reg[25][4]  ( .D(n1594), .CLK(n119), .R(n53), .S(1'b1), .Q(
        \curr_reg[25][4] ) );
  DFFSR \curr_reg_reg[26][4]  ( .D(n1602), .CLK(n119), .R(n53), .S(1'b1), .Q(
        \curr_reg[26][4] ) );
  DFFSR \curr_reg_reg[27][4]  ( .D(n1610), .CLK(n119), .R(n53), .S(1'b1), .Q(
        \curr_reg[27][4] ) );
  DFFSR \curr_reg_reg[28][4]  ( .D(n1618), .CLK(n119), .R(n53), .S(1'b1), .Q(
        \curr_reg[28][4] ) );
  DFFSR \curr_reg_reg[29][4]  ( .D(n1626), .CLK(n118), .R(n53), .S(1'b1), .Q(
        \curr_reg[29][4] ) );
  DFFSR \curr_reg_reg[30][4]  ( .D(n1634), .CLK(n118), .R(n52), .S(1'b1), .Q(
        \curr_reg[30][4] ) );
  DFFSR \curr_reg_reg[31][4]  ( .D(n1642), .CLK(n118), .R(n52), .S(1'b1), .Q(
        \curr_reg[31][4] ) );
  DFFSR \curr_reg_reg[32][4]  ( .D(n1650), .CLK(n118), .R(n52), .S(1'b1), .Q(
        \curr_reg[32][4] ) );
  DFFSR \curr_reg_reg[33][4]  ( .D(n1658), .CLK(n118), .R(n52), .S(1'b1), .Q(
        \curr_reg[33][4] ) );
  DFFSR \curr_reg_reg[34][4]  ( .D(n1666), .CLK(n118), .R(n52), .S(1'b1), .Q(
        \curr_reg[34][4] ) );
  DFFSR \curr_reg_reg[35][4]  ( .D(n1674), .CLK(n118), .R(n52), .S(1'b1), .Q(
        \curr_reg[35][4] ) );
  DFFSR \curr_reg_reg[36][4]  ( .D(n1682), .CLK(n118), .R(n52), .S(1'b1), .Q(
        \curr_reg[36][4] ) );
  DFFSR \curr_reg_reg[37][4]  ( .D(n1690), .CLK(n118), .R(n52), .S(1'b1), .Q(
        \curr_reg[37][4] ) );
  DFFSR \curr_reg_reg[38][4]  ( .D(n1698), .CLK(n118), .R(n52), .S(1'b1), .Q(
        \curr_reg[38][4] ) );
  DFFSR \curr_reg_reg[39][4]  ( .D(n1706), .CLK(n118), .R(n52), .S(1'b1), .Q(
        \curr_reg[39][4] ) );
  DFFSR \curr_reg_reg[40][4]  ( .D(n1714), .CLK(n118), .R(n52), .S(1'b1), .Q(
        \curr_reg[40][4] ) );
  DFFSR \curr_reg_reg[41][4]  ( .D(n1722), .CLK(n118), .R(n52), .S(1'b1), .Q(
        \curr_reg[41][4] ) );
  DFFSR \curr_reg_reg[42][4]  ( .D(n1730), .CLK(n117), .R(n51), .S(1'b1), .Q(
        \curr_reg[42][4] ) );
  DFFSR \curr_reg_reg[43][4]  ( .D(n1738), .CLK(n117), .R(n51), .S(1'b1), .Q(
        \curr_reg[43][4] ) );
  DFFSR \curr_reg_reg[44][4]  ( .D(n1746), .CLK(n117), .R(n51), .S(1'b1), .Q(
        \curr_reg[44][4] ) );
  DFFSR \curr_reg_reg[45][4]  ( .D(n1754), .CLK(n117), .R(n51), .S(1'b1), .Q(
        \curr_reg[45][4] ) );
  DFFSR \curr_reg_reg[46][4]  ( .D(n1762), .CLK(n117), .R(n51), .S(1'b1), .Q(
        \curr_reg[46][4] ) );
  DFFSR \curr_reg_reg[47][4]  ( .D(n1770), .CLK(n117), .R(n51), .S(1'b1), .Q(
        \curr_reg[47][4] ) );
  DFFSR \curr_reg_reg[48][4]  ( .D(n1778), .CLK(n117), .R(n51), .S(1'b1), .Q(
        \curr_reg[48][4] ) );
  DFFSR \curr_reg_reg[49][4]  ( .D(n1786), .CLK(n117), .R(n51), .S(1'b1), .Q(
        \curr_reg[49][4] ) );
  DFFSR \curr_reg_reg[50][4]  ( .D(n1794), .CLK(n117), .R(n51), .S(1'b1), .Q(
        \curr_reg[50][4] ) );
  DFFSR \curr_reg_reg[51][4]  ( .D(n1802), .CLK(n117), .R(n51), .S(1'b1), .Q(
        \curr_reg[51][4] ) );
  DFFSR \curr_reg_reg[52][4]  ( .D(n1810), .CLK(n117), .R(n51), .S(1'b1), .Q(
        \curr_reg[52][4] ) );
  DFFSR \curr_reg_reg[53][4]  ( .D(n1818), .CLK(n117), .R(n51), .S(1'b1), .Q(
        \curr_reg[53][4] ) );
  DFFSR \curr_reg_reg[54][4]  ( .D(n1826), .CLK(n117), .R(n50), .S(1'b1), .Q(
        \curr_reg[54][4] ) );
  DFFSR \curr_reg_reg[55][4]  ( .D(n1834), .CLK(n116), .R(n50), .S(1'b1), .Q(
        \curr_reg[55][4] ) );
  DFFSR \curr_reg_reg[56][3]  ( .D(n1843), .CLK(n121), .R(n56), .S(1'b1), .Q(
        \curr_reg[56][3] ) );
  DFFSR \curr_reg_reg[57][3]  ( .D(n1851), .CLK(n121), .R(n56), .S(1'b1), .Q(
        \curr_reg[57][3] ) );
  DFFSR \curr_reg_reg[58][3]  ( .D(n1859), .CLK(n121), .R(n56), .S(1'b1), .Q(
        \curr_reg[58][3] ) );
  DFFSR \curr_reg_reg[59][3]  ( .D(n1867), .CLK(n121), .R(n56), .S(1'b1), .Q(
        \curr_reg[59][3] ) );
  DFFSR \curr_reg_reg[60][3]  ( .D(n1875), .CLK(n121), .R(n55), .S(1'b1), .Q(
        \curr_reg[60][3] ) );
  DFFSR \curr_reg_reg[61][3]  ( .D(n1883), .CLK(n121), .R(n55), .S(1'b1), .Q(
        \curr_reg[61][3] ) );
  DFFSR \curr_reg_reg[62][3]  ( .D(n1891), .CLK(n121), .R(n55), .S(1'b1), .Q(
        \curr_reg[62][3] ) );
  DFFSR \curr_reg_reg[63][3]  ( .D(n1899), .CLK(n121), .R(n55), .S(1'b1), .Q(
        \curr_reg[63][3] ) );
  DFFSR \curr_reg_reg[0][3]  ( .D(n1395), .CLK(n126), .R(n60), .S(1'b1), .Q(
        \curr_reg[0][3] ) );
  DFFSR \curr_reg_reg[1][3]  ( .D(n1403), .CLK(n126), .R(n60), .S(1'b1), .Q(
        \curr_reg[1][3] ) );
  DFFSR \curr_reg_reg[2][3]  ( .D(n1411), .CLK(n126), .R(n60), .S(1'b1), .Q(
        \curr_reg[2][3] ) );
  DFFSR \curr_reg_reg[3][3]  ( .D(n1419), .CLK(n126), .R(n60), .S(1'b1), .Q(
        \curr_reg[3][3] ) );
  DFFSR \curr_reg_reg[4][3]  ( .D(n1427), .CLK(n125), .R(n60), .S(1'b1), .Q(
        \curr_reg[4][3] ) );
  DFFSR \curr_reg_reg[5][3]  ( .D(n1435), .CLK(n125), .R(n60), .S(1'b1), .Q(
        \curr_reg[5][3] ) );
  DFFSR \curr_reg_reg[6][3]  ( .D(n1443), .CLK(n125), .R(n60), .S(1'b1), .Q(
        \curr_reg[6][3] ) );
  DFFSR \curr_reg_reg[7][3]  ( .D(n1451), .CLK(n125), .R(n60), .S(1'b1), .Q(
        \curr_reg[7][3] ) );
  DFFSR \curr_reg_reg[8][3]  ( .D(n1459), .CLK(n125), .R(n60), .S(1'b1), .Q(
        \curr_reg[8][3] ) );
  DFFSR \curr_reg_reg[9][3]  ( .D(n1467), .CLK(n125), .R(n60), .S(1'b1), .Q(
        \curr_reg[9][3] ) );
  DFFSR \curr_reg_reg[10][3]  ( .D(n1475), .CLK(n125), .R(n60), .S(1'b1), .Q(
        \curr_reg[10][3] ) );
  DFFSR \curr_reg_reg[11][3]  ( .D(n1483), .CLK(n125), .R(n60), .S(1'b1), .Q(
        \curr_reg[11][3] ) );
  DFFSR \curr_reg_reg[12][3]  ( .D(n1491), .CLK(n125), .R(n59), .S(1'b1), .Q(
        \curr_reg[12][3] ) );
  DFFSR \curr_reg_reg[13][3]  ( .D(n1499), .CLK(n125), .R(n59), .S(1'b1), .Q(
        \curr_reg[13][3] ) );
  DFFSR \curr_reg_reg[14][3]  ( .D(n1507), .CLK(n125), .R(n59), .S(1'b1), .Q(
        \curr_reg[14][3] ) );
  DFFSR \curr_reg_reg[15][3]  ( .D(n1515), .CLK(n125), .R(n59), .S(1'b1), .Q(
        \curr_reg[15][3] ) );
  DFFSR \curr_reg_reg[16][3]  ( .D(n1523), .CLK(n125), .R(n59), .S(1'b1), .Q(
        \curr_reg[16][3] ) );
  DFFSR \curr_reg_reg[17][3]  ( .D(n1531), .CLK(n124), .R(n59), .S(1'b1), .Q(
        \curr_reg[17][3] ) );
  DFFSR \curr_reg_reg[18][3]  ( .D(n1539), .CLK(n124), .R(n59), .S(1'b1), .Q(
        \curr_reg[18][3] ) );
  DFFSR \curr_reg_reg[19][3]  ( .D(n1547), .CLK(n124), .R(n59), .S(1'b1), .Q(
        \curr_reg[19][3] ) );
  DFFSR \curr_reg_reg[20][3]  ( .D(n1555), .CLK(n124), .R(n59), .S(1'b1), .Q(
        \curr_reg[20][3] ) );
  DFFSR \curr_reg_reg[21][3]  ( .D(n1563), .CLK(n124), .R(n59), .S(1'b1), .Q(
        \curr_reg[21][3] ) );
  DFFSR \curr_reg_reg[22][3]  ( .D(n1571), .CLK(n124), .R(n59), .S(1'b1), .Q(
        \curr_reg[22][3] ) );
  DFFSR \curr_reg_reg[23][3]  ( .D(n1579), .CLK(n124), .R(n59), .S(1'b1), .Q(
        \curr_reg[23][3] ) );
  DFFSR \curr_reg_reg[24][3]  ( .D(n1587), .CLK(n124), .R(n58), .S(1'b1), .Q(
        \curr_reg[24][3] ) );
  DFFSR \curr_reg_reg[25][3]  ( .D(n1595), .CLK(n124), .R(n58), .S(1'b1), .Q(
        \curr_reg[25][3] ) );
  DFFSR \curr_reg_reg[26][3]  ( .D(n1603), .CLK(n124), .R(n58), .S(1'b1), .Q(
        \curr_reg[26][3] ) );
  DFFSR \curr_reg_reg[27][3]  ( .D(n1611), .CLK(n124), .R(n58), .S(1'b1), .Q(
        \curr_reg[27][3] ) );
  DFFSR \curr_reg_reg[28][3]  ( .D(n1619), .CLK(n124), .R(n58), .S(1'b1), .Q(
        \curr_reg[28][3] ) );
  DFFSR \curr_reg_reg[29][3]  ( .D(n1627), .CLK(n124), .R(n58), .S(1'b1), .Q(
        \curr_reg[29][3] ) );
  DFFSR \curr_reg_reg[30][3]  ( .D(n1635), .CLK(n123), .R(n58), .S(1'b1), .Q(
        \curr_reg[30][3] ) );
  DFFSR \curr_reg_reg[31][3]  ( .D(n1643), .CLK(n123), .R(n58), .S(1'b1), .Q(
        \curr_reg[31][3] ) );
  DFFSR \curr_reg_reg[32][3]  ( .D(n1651), .CLK(n123), .R(n58), .S(1'b1), .Q(
        \curr_reg[32][3] ) );
  DFFSR \curr_reg_reg[33][3]  ( .D(n1659), .CLK(n123), .R(n58), .S(1'b1), .Q(
        \curr_reg[33][3] ) );
  DFFSR \curr_reg_reg[34][3]  ( .D(n1667), .CLK(n123), .R(n58), .S(1'b1), .Q(
        \curr_reg[34][3] ) );
  DFFSR \curr_reg_reg[35][3]  ( .D(n1675), .CLK(n123), .R(n58), .S(1'b1), .Q(
        \curr_reg[35][3] ) );
  DFFSR \curr_reg_reg[36][3]  ( .D(n1683), .CLK(n123), .R(n57), .S(1'b1), .Q(
        \curr_reg[36][3] ) );
  DFFSR \curr_reg_reg[37][3]  ( .D(n1691), .CLK(n123), .R(n57), .S(1'b1), .Q(
        \curr_reg[37][3] ) );
  DFFSR \curr_reg_reg[38][3]  ( .D(n1699), .CLK(n123), .R(n57), .S(1'b1), .Q(
        \curr_reg[38][3] ) );
  DFFSR \curr_reg_reg[39][3]  ( .D(n1707), .CLK(n123), .R(n57), .S(1'b1), .Q(
        \curr_reg[39][3] ) );
  DFFSR \curr_reg_reg[40][3]  ( .D(n1715), .CLK(n123), .R(n57), .S(1'b1), .Q(
        \curr_reg[40][3] ) );
  DFFSR \curr_reg_reg[41][3]  ( .D(n1723), .CLK(n123), .R(n57), .S(1'b1), .Q(
        \curr_reg[41][3] ) );
  DFFSR \curr_reg_reg[42][3]  ( .D(n1731), .CLK(n123), .R(n57), .S(1'b1), .Q(
        \curr_reg[42][3] ) );
  DFFSR \curr_reg_reg[43][3]  ( .D(n1739), .CLK(n122), .R(n57), .S(1'b1), .Q(
        \curr_reg[43][3] ) );
  DFFSR \curr_reg_reg[44][3]  ( .D(n1747), .CLK(n122), .R(n57), .S(1'b1), .Q(
        \curr_reg[44][3] ) );
  DFFSR \curr_reg_reg[45][3]  ( .D(n1755), .CLK(n122), .R(n57), .S(1'b1), .Q(
        \curr_reg[45][3] ) );
  DFFSR \curr_reg_reg[46][3]  ( .D(n1763), .CLK(n122), .R(n57), .S(1'b1), .Q(
        \curr_reg[46][3] ) );
  DFFSR \curr_reg_reg[47][3]  ( .D(n1771), .CLK(n122), .R(n57), .S(1'b1), .Q(
        \curr_reg[47][3] ) );
  DFFSR \curr_reg_reg[48][3]  ( .D(n1779), .CLK(n122), .R(n56), .S(1'b1), .Q(
        \curr_reg[48][3] ) );
  DFFSR \curr_reg_reg[49][3]  ( .D(n1787), .CLK(n122), .R(n56), .S(1'b1), .Q(
        \curr_reg[49][3] ) );
  DFFSR \curr_reg_reg[50][3]  ( .D(n1795), .CLK(n122), .R(n56), .S(1'b1), .Q(
        \curr_reg[50][3] ) );
  DFFSR \curr_reg_reg[51][3]  ( .D(n1803), .CLK(n122), .R(n56), .S(1'b1), .Q(
        \curr_reg[51][3] ) );
  DFFSR \curr_reg_reg[52][3]  ( .D(n1811), .CLK(n122), .R(n56), .S(1'b1), .Q(
        \curr_reg[52][3] ) );
  DFFSR \curr_reg_reg[53][3]  ( .D(n1819), .CLK(n122), .R(n56), .S(1'b1), .Q(
        \curr_reg[53][3] ) );
  DFFSR \curr_reg_reg[54][3]  ( .D(n1827), .CLK(n122), .R(n56), .S(1'b1), .Q(
        \curr_reg[54][3] ) );
  DFFSR \curr_reg_reg[55][3]  ( .D(n1835), .CLK(n122), .R(n56), .S(1'b1), .Q(
        \curr_reg[55][3] ) );
  DFFSR \curr_reg_reg[56][2]  ( .D(n1844), .CLK(n127), .R(n61), .S(1'b1), .Q(
        \curr_reg[56][2] ) );
  DFFSR \curr_reg_reg[57][2]  ( .D(n1852), .CLK(n126), .R(n61), .S(1'b1), .Q(
        \curr_reg[57][2] ) );
  DFFSR \curr_reg_reg[58][2]  ( .D(n1860), .CLK(n126), .R(n61), .S(1'b1), .Q(
        \curr_reg[58][2] ) );
  DFFSR \curr_reg_reg[59][2]  ( .D(n1868), .CLK(n126), .R(n61), .S(1'b1), .Q(
        \curr_reg[59][2] ) );
  DFFSR \curr_reg_reg[60][2]  ( .D(n1876), .CLK(n126), .R(n61), .S(1'b1), .Q(
        \curr_reg[60][2] ) );
  DFFSR \curr_reg_reg[61][2]  ( .D(n1884), .CLK(n126), .R(n61), .S(1'b1), .Q(
        \curr_reg[61][2] ) );
  DFFSR \curr_reg_reg[62][2]  ( .D(n1892), .CLK(n126), .R(n61), .S(1'b1), .Q(
        \curr_reg[62][2] ) );
  DFFSR \curr_reg_reg[63][2]  ( .D(n1900), .CLK(n126), .R(n61), .S(1'b1), .Q(
        \curr_reg[63][2] ) );
  DFFSR \curr_reg_reg[0][2]  ( .D(n1396), .CLK(n131), .R(n66), .S(1'b1), .Q(
        \curr_reg[0][2] ) );
  DFFSR \curr_reg_reg[1][2]  ( .D(n1404), .CLK(n131), .R(n66), .S(1'b1), .Q(
        \curr_reg[1][2] ) );
  DFFSR \curr_reg_reg[2][2]  ( .D(n1412), .CLK(n131), .R(n66), .S(1'b1), .Q(
        \curr_reg[2][2] ) );
  DFFSR \curr_reg_reg[3][2]  ( .D(n1420), .CLK(n131), .R(n66), .S(1'b1), .Q(
        \curr_reg[3][2] ) );
  DFFSR \curr_reg_reg[4][2]  ( .D(n1428), .CLK(n131), .R(n66), .S(1'b1), .Q(
        \curr_reg[4][2] ) );
  DFFSR \curr_reg_reg[5][2]  ( .D(n1436), .CLK(n130), .R(n66), .S(1'b1), .Q(
        \curr_reg[5][2] ) );
  DFFSR \curr_reg_reg[6][2]  ( .D(n1444), .CLK(n130), .R(n65), .S(1'b1), .Q(
        \curr_reg[6][2] ) );
  DFFSR \curr_reg_reg[7][2]  ( .D(n1452), .CLK(n130), .R(n65), .S(1'b1), .Q(
        \curr_reg[7][2] ) );
  DFFSR \curr_reg_reg[8][2]  ( .D(n1460), .CLK(n130), .R(n65), .S(1'b1), .Q(
        \curr_reg[8][2] ) );
  DFFSR \curr_reg_reg[9][2]  ( .D(n1468), .CLK(n130), .R(n65), .S(1'b1), .Q(
        \curr_reg[9][2] ) );
  DFFSR \curr_reg_reg[10][2]  ( .D(n1476), .CLK(n130), .R(n65), .S(1'b1), .Q(
        \curr_reg[10][2] ) );
  DFFSR \curr_reg_reg[11][2]  ( .D(n1484), .CLK(n130), .R(n65), .S(1'b1), .Q(
        \curr_reg[11][2] ) );
  DFFSR \curr_reg_reg[12][2]  ( .D(n1492), .CLK(n130), .R(n65), .S(1'b1), .Q(
        \curr_reg[12][2] ) );
  DFFSR \curr_reg_reg[13][2]  ( .D(n1500), .CLK(n130), .R(n65), .S(1'b1), .Q(
        \curr_reg[13][2] ) );
  DFFSR \curr_reg_reg[14][2]  ( .D(n1508), .CLK(n130), .R(n65), .S(1'b1), .Q(
        \curr_reg[14][2] ) );
  DFFSR \curr_reg_reg[15][2]  ( .D(n1516), .CLK(n130), .R(n65), .S(1'b1), .Q(
        \curr_reg[15][2] ) );
  DFFSR \curr_reg_reg[16][2]  ( .D(n1524), .CLK(n130), .R(n65), .S(1'b1), .Q(
        \curr_reg[16][2] ) );
  DFFSR \curr_reg_reg[17][2]  ( .D(n1532), .CLK(n130), .R(n65), .S(1'b1), .Q(
        \curr_reg[17][2] ) );
  DFFSR \curr_reg_reg[18][2]  ( .D(n1540), .CLK(n129), .R(n64), .S(1'b1), .Q(
        \curr_reg[18][2] ) );
  DFFSR \curr_reg_reg[19][2]  ( .D(n1548), .CLK(n129), .R(n64), .S(1'b1), .Q(
        \curr_reg[19][2] ) );
  DFFSR \curr_reg_reg[20][2]  ( .D(n1556), .CLK(n129), .R(n64), .S(1'b1), .Q(
        \curr_reg[20][2] ) );
  DFFSR \curr_reg_reg[21][2]  ( .D(n1564), .CLK(n129), .R(n64), .S(1'b1), .Q(
        \curr_reg[21][2] ) );
  DFFSR \curr_reg_reg[22][2]  ( .D(n1572), .CLK(n129), .R(n64), .S(1'b1), .Q(
        \curr_reg[22][2] ) );
  DFFSR \curr_reg_reg[23][2]  ( .D(n1580), .CLK(n129), .R(n64), .S(1'b1), .Q(
        \curr_reg[23][2] ) );
  DFFSR \curr_reg_reg[24][2]  ( .D(n1588), .CLK(n129), .R(n64), .S(1'b1), .Q(
        \curr_reg[24][2] ) );
  DFFSR \curr_reg_reg[25][2]  ( .D(n1596), .CLK(n129), .R(n64), .S(1'b1), .Q(
        \curr_reg[25][2] ) );
  DFFSR \curr_reg_reg[26][2]  ( .D(n1604), .CLK(n129), .R(n64), .S(1'b1), .Q(
        \curr_reg[26][2] ) );
  DFFSR \curr_reg_reg[27][2]  ( .D(n1612), .CLK(n129), .R(n64), .S(1'b1), .Q(
        \curr_reg[27][2] ) );
  DFFSR \curr_reg_reg[28][2]  ( .D(n1620), .CLK(n129), .R(n64), .S(1'b1), .Q(
        \curr_reg[28][2] ) );
  DFFSR \curr_reg_reg[29][2]  ( .D(n1628), .CLK(n129), .R(n64), .S(1'b1), .Q(
        \curr_reg[29][2] ) );
  DFFSR \curr_reg_reg[30][2]  ( .D(n1636), .CLK(n129), .R(n63), .S(1'b1), .Q(
        \curr_reg[30][2] ) );
  DFFSR \curr_reg_reg[31][2]  ( .D(n1644), .CLK(n128), .R(n63), .S(1'b1), .Q(
        \curr_reg[31][2] ) );
  DFFSR \curr_reg_reg[32][2]  ( .D(n1652), .CLK(n128), .R(n63), .S(1'b1), .Q(
        \curr_reg[32][2] ) );
  DFFSR \curr_reg_reg[33][2]  ( .D(n1660), .CLK(n128), .R(n63), .S(1'b1), .Q(
        \curr_reg[33][2] ) );
  DFFSR \curr_reg_reg[34][2]  ( .D(n1668), .CLK(n128), .R(n63), .S(1'b1), .Q(
        \curr_reg[34][2] ) );
  DFFSR \curr_reg_reg[35][2]  ( .D(n1676), .CLK(n128), .R(n63), .S(1'b1), .Q(
        \curr_reg[35][2] ) );
  DFFSR \curr_reg_reg[36][2]  ( .D(n1684), .CLK(n128), .R(n63), .S(1'b1), .Q(
        \curr_reg[36][2] ) );
  DFFSR \curr_reg_reg[37][2]  ( .D(n1692), .CLK(n128), .R(n63), .S(1'b1), .Q(
        \curr_reg[37][2] ) );
  DFFSR \curr_reg_reg[38][2]  ( .D(n1700), .CLK(n128), .R(n63), .S(1'b1), .Q(
        \curr_reg[38][2] ) );
  DFFSR \curr_reg_reg[39][2]  ( .D(n1708), .CLK(n128), .R(n63), .S(1'b1), .Q(
        \curr_reg[39][2] ) );
  DFFSR \curr_reg_reg[40][2]  ( .D(n1716), .CLK(n128), .R(n63), .S(1'b1), .Q(
        \curr_reg[40][2] ) );
  DFFSR \curr_reg_reg[41][2]  ( .D(n1724), .CLK(n128), .R(n63), .S(1'b1), .Q(
        \curr_reg[41][2] ) );
  DFFSR \curr_reg_reg[42][2]  ( .D(n1732), .CLK(n128), .R(n62), .S(1'b1), .Q(
        \curr_reg[42][2] ) );
  DFFSR \curr_reg_reg[43][2]  ( .D(n1740), .CLK(n128), .R(n62), .S(1'b1), .Q(
        \curr_reg[43][2] ) );
  DFFSR \curr_reg_reg[44][2]  ( .D(n1748), .CLK(n127), .R(n62), .S(1'b1), .Q(
        \curr_reg[44][2] ) );
  DFFSR \curr_reg_reg[45][2]  ( .D(n1756), .CLK(n127), .R(n62), .S(1'b1), .Q(
        \curr_reg[45][2] ) );
  DFFSR \curr_reg_reg[46][2]  ( .D(n1764), .CLK(n127), .R(n62), .S(1'b1), .Q(
        \curr_reg[46][2] ) );
  DFFSR \curr_reg_reg[47][2]  ( .D(n1772), .CLK(n127), .R(n62), .S(1'b1), .Q(
        \curr_reg[47][2] ) );
  DFFSR \curr_reg_reg[48][2]  ( .D(n1780), .CLK(n127), .R(n62), .S(1'b1), .Q(
        \curr_reg[48][2] ) );
  DFFSR \curr_reg_reg[49][2]  ( .D(n1788), .CLK(n127), .R(n62), .S(1'b1), .Q(
        \curr_reg[49][2] ) );
  DFFSR \curr_reg_reg[50][2]  ( .D(n1796), .CLK(n127), .R(n62), .S(1'b1), .Q(
        \curr_reg[50][2] ) );
  DFFSR \curr_reg_reg[51][2]  ( .D(n1804), .CLK(n127), .R(n62), .S(1'b1), .Q(
        \curr_reg[51][2] ) );
  DFFSR \curr_reg_reg[52][2]  ( .D(n1812), .CLK(n127), .R(n62), .S(1'b1), .Q(
        \curr_reg[52][2] ) );
  DFFSR \curr_reg_reg[53][2]  ( .D(n1820), .CLK(n127), .R(n62), .S(1'b1), .Q(
        \curr_reg[53][2] ) );
  DFFSR \curr_reg_reg[54][2]  ( .D(n1828), .CLK(n127), .R(n61), .S(1'b1), .Q(
        \curr_reg[54][2] ) );
  DFFSR \curr_reg_reg[55][2]  ( .D(n1836), .CLK(n127), .R(n61), .S(1'b1), .Q(
        \curr_reg[55][2] ) );
  DFFSR \curr_occupancy_reg[1]  ( .D(n1914), .CLK(n147), .R(n84), .S(1'b1), 
        .Q(buffer_occupancy[1]) );
  DFFSR \curr_occupancy_reg[5]  ( .D(n1910), .CLK(n147), .R(n83), .S(1'b1), 
        .Q(buffer_occupancy[5]) );
  DFFSR \curr_occupancy_reg[2]  ( .D(n1913), .CLK(n147), .R(n83), .S(1'b1), 
        .Q(buffer_occupancy[2]) );
  DFFSR \curr_occupancy_reg[3]  ( .D(n1912), .CLK(n147), .R(n83), .S(1'b1), 
        .Q(buffer_occupancy[3]) );
  DFFSR \curr_occupancy_reg[4]  ( .D(n1911), .CLK(n147), .R(n83), .S(1'b1), 
        .Q(buffer_occupancy[4]) );
  DFFSR \curr_tx_packet_data_reg[7]  ( .D(n843), .CLK(n147), .R(n83), .S(1'b1), 
        .Q(tx_packet_data[7]) );
  DFFSR \curr_tx_packet_data_reg[6]  ( .D(n841), .CLK(n106), .R(n39), .S(1'b1), 
        .Q(tx_packet_data[6]) );
  DFFSR \curr_tx_packet_data_reg[5]  ( .D(n839), .CLK(n111), .R(n44), .S(1'b1), 
        .Q(tx_packet_data[5]) );
  DFFSR \curr_tx_packet_data_reg[4]  ( .D(n837), .CLK(n116), .R(n50), .S(1'b1), 
        .Q(tx_packet_data[4]) );
  DFFSR \curr_tx_packet_data_reg[3]  ( .D(n835), .CLK(n121), .R(n55), .S(1'b1), 
        .Q(tx_packet_data[3]) );
  DFFSR \curr_tx_packet_data_reg[2]  ( .D(n833), .CLK(n126), .R(n61), .S(1'b1), 
        .Q(tx_packet_data[2]) );
  DFFSR \curr_tx_packet_data_reg[1]  ( .D(n831), .CLK(n131), .R(n66), .S(1'b1), 
        .Q(tx_packet_data[1]) );
  DFFSR \curr_tx_packet_data_reg[0]  ( .D(n829), .CLK(n147), .R(n84), .S(1'b1), 
        .Q(tx_packet_data[0]) );
  data_buffer_DW01_inc_2_DW01_inc_13 add_75 ( .A(buffer_occupancy), .SUM({
        N2009, N2008, N2007, N2006, N2005, N2004, N2003}) );
  AND2X2 U3 ( .A(n166), .B(n742), .Y(n1) );
  AND2X2 U4 ( .A(n170), .B(N153), .Y(n2) );
  AND2X2 U5 ( .A(n166), .B(N153), .Y(n3) );
  AND2X2 U6 ( .A(n170), .B(n742), .Y(n4) );
  AND2X2 U7 ( .A(n165), .B(N153), .Y(n5) );
  AND2X2 U8 ( .A(n169), .B(n742), .Y(n6) );
  AND2X2 U9 ( .A(N153), .B(n169), .Y(n7) );
  AND2X2 U10 ( .A(n165), .B(n742), .Y(n8) );
  INVX4 U11 ( .A(n2668), .Y(n1953) );
  INVX4 U12 ( .A(n1), .Y(n9) );
  INVX1 U13 ( .A(n1935), .Y(n10) );
  INVX8 U14 ( .A(n10), .Y(n11) );
  INVX1 U15 ( .A(n1938), .Y(n12) );
  INVX8 U16 ( .A(n12), .Y(n13) );
  INVX1 U17 ( .A(n1940), .Y(n14) );
  INVX8 U18 ( .A(n14), .Y(n15) );
  INVX1 U19 ( .A(n1942), .Y(n16) );
  INVX8 U20 ( .A(n16), .Y(n17) );
  INVX1 U21 ( .A(n1944), .Y(n18) );
  INVX8 U22 ( .A(n18), .Y(n19) );
  INVX1 U23 ( .A(n1946), .Y(n20) );
  INVX8 U24 ( .A(n20), .Y(n21) );
  INVX1 U25 ( .A(n1948), .Y(n22) );
  INVX8 U26 ( .A(n22), .Y(n23) );
  INVX1 U27 ( .A(n1950), .Y(n24) );
  INVX8 U28 ( .A(n24), .Y(n25) );
  INVX8 U29 ( .A(n8), .Y(n26) );
  INVX8 U30 ( .A(n7), .Y(n27) );
  INVX8 U31 ( .A(n5), .Y(n28) );
  INVX8 U32 ( .A(n6), .Y(n29) );
  INVX8 U33 ( .A(n3), .Y(n30) );
  INVX8 U34 ( .A(n2), .Y(n31) );
  INVX8 U35 ( .A(n4), .Y(n32) );
  INVX1 U36 ( .A(n691), .Y(n738) );
  INVX1 U37 ( .A(n699), .Y(n739) );
  BUFX2 U38 ( .A(n92), .Y(n62) );
  BUFX2 U39 ( .A(n92), .Y(n63) );
  BUFX2 U40 ( .A(n91), .Y(n64) );
  BUFX2 U41 ( .A(n91), .Y(n65) );
  BUFX2 U42 ( .A(n94), .Y(n57) );
  BUFX2 U43 ( .A(n93), .Y(n58) );
  BUFX2 U44 ( .A(n93), .Y(n59) );
  BUFX2 U45 ( .A(n93), .Y(n60) );
  BUFX2 U46 ( .A(n94), .Y(n56) );
  BUFX2 U47 ( .A(n96), .Y(n51) );
  BUFX2 U48 ( .A(n95), .Y(n52) );
  BUFX2 U49 ( .A(n95), .Y(n53) );
  BUFX2 U50 ( .A(n95), .Y(n54) );
  BUFX2 U51 ( .A(n97), .Y(n46) );
  BUFX2 U52 ( .A(n97), .Y(n47) );
  BUFX2 U53 ( .A(n97), .Y(n48) );
  BUFX2 U54 ( .A(n96), .Y(n49) );
  BUFX2 U55 ( .A(n98), .Y(n45) );
  BUFX2 U56 ( .A(n99), .Y(n40) );
  BUFX2 U57 ( .A(n99), .Y(n41) );
  BUFX2 U58 ( .A(n99), .Y(n42) );
  BUFX2 U59 ( .A(n98), .Y(n43) );
  BUFX2 U60 ( .A(n88), .Y(n74) );
  BUFX2 U61 ( .A(n88), .Y(n75) );
  BUFX2 U62 ( .A(n87), .Y(n76) );
  BUFX2 U63 ( .A(n87), .Y(n77) );
  BUFX2 U64 ( .A(n87), .Y(n78) );
  BUFX2 U65 ( .A(n86), .Y(n79) );
  BUFX2 U66 ( .A(n86), .Y(n80) );
  BUFX2 U67 ( .A(n86), .Y(n81) );
  BUFX2 U68 ( .A(n85), .Y(n82) );
  BUFX2 U69 ( .A(n88), .Y(n73) );
  BUFX2 U70 ( .A(n90), .Y(n68) );
  BUFX2 U71 ( .A(n90), .Y(n69) );
  BUFX2 U72 ( .A(n89), .Y(n70) );
  BUFX2 U73 ( .A(n89), .Y(n71) );
  BUFX2 U74 ( .A(n90), .Y(n67) );
  BUFX2 U75 ( .A(n85), .Y(n83) );
  BUFX2 U76 ( .A(n89), .Y(n72) );
  BUFX2 U77 ( .A(n91), .Y(n66) );
  BUFX2 U78 ( .A(n92), .Y(n61) );
  BUFX2 U79 ( .A(n94), .Y(n55) );
  BUFX2 U80 ( .A(n96), .Y(n50) );
  BUFX2 U81 ( .A(n98), .Y(n44) );
  BUFX2 U82 ( .A(n85), .Y(n84) );
  BUFX2 U83 ( .A(n154), .Y(n128) );
  BUFX2 U84 ( .A(n154), .Y(n129) );
  BUFX2 U85 ( .A(n154), .Y(n130) );
  BUFX2 U86 ( .A(n155), .Y(n127) );
  BUFX2 U87 ( .A(n156), .Y(n122) );
  BUFX2 U88 ( .A(n156), .Y(n123) );
  BUFX2 U89 ( .A(n156), .Y(n124) );
  BUFX2 U90 ( .A(n155), .Y(n125) );
  BUFX2 U91 ( .A(n158), .Y(n117) );
  BUFX2 U92 ( .A(n158), .Y(n118) );
  BUFX2 U93 ( .A(n157), .Y(n119) );
  BUFX2 U94 ( .A(n157), .Y(n120) );
  BUFX2 U95 ( .A(n160), .Y(n112) );
  BUFX2 U96 ( .A(n159), .Y(n113) );
  BUFX2 U97 ( .A(n159), .Y(n114) );
  BUFX2 U98 ( .A(n159), .Y(n115) );
  BUFX2 U99 ( .A(n161), .Y(n107) );
  BUFX2 U100 ( .A(n161), .Y(n108) );
  BUFX2 U101 ( .A(n161), .Y(n109) );
  BUFX2 U102 ( .A(n160), .Y(n110) );
  BUFX2 U103 ( .A(n151), .Y(n139) );
  BUFX2 U104 ( .A(n150), .Y(n140) );
  BUFX2 U105 ( .A(n150), .Y(n141) );
  BUFX2 U106 ( .A(n150), .Y(n142) );
  BUFX2 U107 ( .A(n149), .Y(n143) );
  BUFX2 U108 ( .A(n149), .Y(n144) );
  BUFX2 U109 ( .A(n149), .Y(n145) );
  BUFX2 U110 ( .A(n151), .Y(n137) );
  BUFX2 U111 ( .A(n151), .Y(n138) );
  BUFX2 U112 ( .A(n153), .Y(n133) );
  BUFX2 U113 ( .A(n152), .Y(n134) );
  BUFX2 U114 ( .A(n152), .Y(n135) );
  BUFX2 U115 ( .A(n153), .Y(n132) );
  BUFX2 U116 ( .A(n148), .Y(n146) );
  BUFX2 U117 ( .A(n152), .Y(n136) );
  BUFX2 U118 ( .A(n153), .Y(n131) );
  BUFX2 U119 ( .A(n155), .Y(n126) );
  BUFX2 U120 ( .A(n157), .Y(n121) );
  BUFX2 U121 ( .A(n158), .Y(n116) );
  BUFX2 U122 ( .A(n160), .Y(n111) );
  BUFX2 U123 ( .A(n148), .Y(n147) );
  BUFX2 U124 ( .A(n162), .Y(n106) );
  BUFX2 U125 ( .A(n105), .Y(n162) );
  BUFX2 U126 ( .A(n103), .Y(n154) );
  BUFX2 U127 ( .A(n103), .Y(n156) );
  BUFX2 U128 ( .A(n35), .Y(n93) );
  BUFX2 U129 ( .A(n36), .Y(n95) );
  BUFX2 U130 ( .A(n37), .Y(n97) );
  BUFX2 U131 ( .A(n104), .Y(n159) );
  BUFX2 U132 ( .A(n37), .Y(n99) );
  BUFX2 U133 ( .A(n105), .Y(n161) );
  BUFX2 U134 ( .A(n33), .Y(n87) );
  BUFX2 U135 ( .A(n101), .Y(n150) );
  BUFX2 U136 ( .A(n33), .Y(n86) );
  BUFX2 U137 ( .A(n101), .Y(n149) );
  BUFX2 U138 ( .A(n34), .Y(n88) );
  BUFX2 U139 ( .A(n102), .Y(n151) );
  BUFX2 U140 ( .A(n34), .Y(n90) );
  BUFX2 U141 ( .A(n34), .Y(n89) );
  BUFX2 U142 ( .A(n102), .Y(n152) );
  BUFX2 U143 ( .A(n35), .Y(n91) );
  BUFX2 U144 ( .A(n102), .Y(n153) );
  BUFX2 U145 ( .A(n35), .Y(n92) );
  BUFX2 U146 ( .A(n103), .Y(n155) );
  BUFX2 U147 ( .A(n36), .Y(n94) );
  BUFX2 U148 ( .A(n104), .Y(n157) );
  BUFX2 U149 ( .A(n36), .Y(n96) );
  BUFX2 U150 ( .A(n104), .Y(n158) );
  BUFX2 U151 ( .A(n37), .Y(n98) );
  BUFX2 U152 ( .A(n105), .Y(n160) );
  BUFX2 U153 ( .A(n33), .Y(n85) );
  BUFX2 U154 ( .A(n101), .Y(n148) );
  BUFX2 U155 ( .A(n100), .Y(n39) );
  BUFX2 U156 ( .A(n38), .Y(n100) );
  BUFX2 U157 ( .A(n_rst), .Y(n38) );
  BUFX2 U158 ( .A(n_rst), .Y(n34) );
  BUFX2 U159 ( .A(clk), .Y(n102) );
  BUFX2 U160 ( .A(n_rst), .Y(n35) );
  BUFX2 U161 ( .A(clk), .Y(n103) );
  BUFX2 U162 ( .A(n_rst), .Y(n36) );
  BUFX2 U163 ( .A(clk), .Y(n104) );
  BUFX2 U164 ( .A(n_rst), .Y(n37) );
  BUFX2 U165 ( .A(clk), .Y(n105) );
  BUFX2 U166 ( .A(n_rst), .Y(n33) );
  BUFX2 U167 ( .A(clk), .Y(n101) );
  NOR2X1 U168 ( .A(n737), .B(N155), .Y(n165) );
  NOR2X1 U169 ( .A(N154), .B(N155), .Y(n166) );
  OAI22X1 U170 ( .A(\curr_reg[35][0] ), .B(n28), .C(\curr_reg[33][0] ), .D(n30), .Y(n164) );
  AND2X1 U171 ( .A(N155), .B(N154), .Y(n169) );
  AND2X1 U172 ( .A(N155), .B(n737), .Y(n170) );
  OAI22X1 U173 ( .A(\curr_reg[39][0] ), .B(n27), .C(\curr_reg[37][0] ), .D(n31), .Y(n163) );
  NOR2X1 U174 ( .A(n164), .B(n163), .Y(n182) );
  NAND2X1 U175 ( .A(N158), .B(n735), .Y(n691) );
  NOR2X1 U176 ( .A(\curr_reg[32][0] ), .B(n9), .Y(n167) );
  NOR2X1 U177 ( .A(n691), .B(n167), .Y(n168) );
  OAI21X1 U178 ( .A(\curr_reg[34][0] ), .B(n26), .C(n168), .Y(n172) );
  OAI22X1 U179 ( .A(\curr_reg[38][0] ), .B(n29), .C(\curr_reg[36][0] ), .D(n32), .Y(n171) );
  NOR2X1 U180 ( .A(n172), .B(n171), .Y(n181) );
  OAI22X1 U181 ( .A(\curr_reg[51][0] ), .B(n28), .C(\curr_reg[49][0] ), .D(n30), .Y(n174) );
  OAI22X1 U182 ( .A(\curr_reg[55][0] ), .B(n27), .C(\curr_reg[53][0] ), .D(n31), .Y(n173) );
  NOR2X1 U183 ( .A(n174), .B(n173), .Y(n180) );
  NAND2X1 U184 ( .A(N158), .B(N157), .Y(n699) );
  NOR2X1 U185 ( .A(\curr_reg[48][0] ), .B(n9), .Y(n175) );
  NOR2X1 U186 ( .A(n699), .B(n175), .Y(n176) );
  OAI21X1 U187 ( .A(\curr_reg[50][0] ), .B(n26), .C(n176), .Y(n178) );
  OAI22X1 U188 ( .A(\curr_reg[54][0] ), .B(n29), .C(\curr_reg[52][0] ), .D(n32), .Y(n177) );
  NOR2X1 U189 ( .A(n178), .B(n177), .Y(n179) );
  AOI22X1 U190 ( .A(n182), .B(n181), .C(n180), .D(n179), .Y(n200) );
  OAI22X1 U191 ( .A(\curr_reg[3][0] ), .B(n28), .C(\curr_reg[1][0] ), .D(n30), 
        .Y(n184) );
  OAI22X1 U192 ( .A(\curr_reg[7][0] ), .B(n27), .C(\curr_reg[5][0] ), .D(n31), 
        .Y(n183) );
  NOR2X1 U193 ( .A(n184), .B(n183), .Y(n198) );
  NOR2X1 U194 ( .A(N157), .B(N158), .Y(n711) );
  NOR2X1 U195 ( .A(\curr_reg[0][0] ), .B(n9), .Y(n185) );
  NOR2X1 U196 ( .A(n740), .B(n185), .Y(n186) );
  OAI21X1 U197 ( .A(\curr_reg[2][0] ), .B(n26), .C(n186), .Y(n188) );
  OAI22X1 U198 ( .A(\curr_reg[6][0] ), .B(n29), .C(\curr_reg[4][0] ), .D(n32), 
        .Y(n187) );
  NOR2X1 U199 ( .A(n188), .B(n187), .Y(n197) );
  OAI22X1 U200 ( .A(\curr_reg[19][0] ), .B(n28), .C(\curr_reg[17][0] ), .D(n30), .Y(n190) );
  OAI22X1 U201 ( .A(\curr_reg[23][0] ), .B(n27), .C(\curr_reg[21][0] ), .D(n31), .Y(n189) );
  NOR2X1 U202 ( .A(n190), .B(n189), .Y(n196) );
  NOR2X1 U203 ( .A(n735), .B(N158), .Y(n719) );
  NOR2X1 U204 ( .A(\curr_reg[16][0] ), .B(n9), .Y(n191) );
  NOR2X1 U205 ( .A(n741), .B(n191), .Y(n192) );
  OAI21X1 U206 ( .A(\curr_reg[18][0] ), .B(n26), .C(n192), .Y(n194) );
  OAI22X1 U207 ( .A(\curr_reg[22][0] ), .B(n29), .C(\curr_reg[20][0] ), .D(n32), .Y(n193) );
  NOR2X1 U208 ( .A(n194), .B(n193), .Y(n195) );
  AOI22X1 U209 ( .A(n198), .B(n197), .C(n196), .D(n195), .Y(n199) );
  AOI21X1 U210 ( .A(n200), .B(n199), .C(N156), .Y(n236) );
  OAI22X1 U211 ( .A(\curr_reg[43][0] ), .B(n28), .C(\curr_reg[41][0] ), .D(n30), .Y(n202) );
  OAI22X1 U212 ( .A(\curr_reg[47][0] ), .B(n27), .C(\curr_reg[45][0] ), .D(n31), .Y(n201) );
  NOR2X1 U213 ( .A(n202), .B(n201), .Y(n216) );
  NOR2X1 U214 ( .A(\curr_reg[40][0] ), .B(n9), .Y(n203) );
  NOR2X1 U215 ( .A(n691), .B(n203), .Y(n204) );
  OAI21X1 U216 ( .A(\curr_reg[42][0] ), .B(n26), .C(n204), .Y(n206) );
  OAI22X1 U217 ( .A(\curr_reg[46][0] ), .B(n29), .C(\curr_reg[44][0] ), .D(n32), .Y(n205) );
  NOR2X1 U218 ( .A(n206), .B(n205), .Y(n215) );
  OAI22X1 U219 ( .A(\curr_reg[59][0] ), .B(n28), .C(\curr_reg[57][0] ), .D(n30), .Y(n208) );
  OAI22X1 U220 ( .A(\curr_reg[63][0] ), .B(n27), .C(\curr_reg[61][0] ), .D(n31), .Y(n207) );
  NOR2X1 U221 ( .A(n208), .B(n207), .Y(n214) );
  NOR2X1 U222 ( .A(\curr_reg[56][0] ), .B(n9), .Y(n209) );
  NOR2X1 U223 ( .A(n699), .B(n209), .Y(n210) );
  OAI21X1 U224 ( .A(\curr_reg[58][0] ), .B(n26), .C(n210), .Y(n212) );
  OAI22X1 U225 ( .A(\curr_reg[62][0] ), .B(n29), .C(\curr_reg[60][0] ), .D(n32), .Y(n211) );
  NOR2X1 U226 ( .A(n212), .B(n211), .Y(n213) );
  AOI22X1 U227 ( .A(n216), .B(n215), .C(n214), .D(n213), .Y(n234) );
  OAI22X1 U228 ( .A(\curr_reg[11][0] ), .B(n28), .C(\curr_reg[9][0] ), .D(n30), 
        .Y(n218) );
  OAI22X1 U229 ( .A(\curr_reg[15][0] ), .B(n27), .C(\curr_reg[13][0] ), .D(n31), .Y(n217) );
  NOR2X1 U230 ( .A(n218), .B(n217), .Y(n232) );
  NOR2X1 U231 ( .A(\curr_reg[8][0] ), .B(n9), .Y(n219) );
  NOR2X1 U232 ( .A(n740), .B(n219), .Y(n220) );
  OAI21X1 U233 ( .A(\curr_reg[10][0] ), .B(n26), .C(n220), .Y(n222) );
  OAI22X1 U234 ( .A(\curr_reg[14][0] ), .B(n29), .C(\curr_reg[12][0] ), .D(n32), .Y(n221) );
  NOR2X1 U235 ( .A(n222), .B(n221), .Y(n231) );
  OAI22X1 U236 ( .A(\curr_reg[27][0] ), .B(n28), .C(\curr_reg[25][0] ), .D(n30), .Y(n224) );
  OAI22X1 U237 ( .A(\curr_reg[31][0] ), .B(n27), .C(\curr_reg[29][0] ), .D(n31), .Y(n223) );
  NOR2X1 U238 ( .A(n224), .B(n223), .Y(n230) );
  NOR2X1 U239 ( .A(\curr_reg[24][0] ), .B(n9), .Y(n225) );
  NOR2X1 U240 ( .A(n741), .B(n225), .Y(n226) );
  OAI21X1 U241 ( .A(\curr_reg[26][0] ), .B(n26), .C(n226), .Y(n228) );
  OAI22X1 U242 ( .A(\curr_reg[30][0] ), .B(n29), .C(\curr_reg[28][0] ), .D(n32), .Y(n227) );
  NOR2X1 U243 ( .A(n228), .B(n227), .Y(n229) );
  AOI22X1 U244 ( .A(n232), .B(n231), .C(n230), .D(n229), .Y(n233) );
  AOI21X1 U245 ( .A(n234), .B(n233), .C(n736), .Y(n235) );
  OR2X1 U246 ( .A(n236), .B(n235), .Y(N2045) );
  OAI22X1 U247 ( .A(\curr_reg[35][1] ), .B(n28), .C(\curr_reg[33][1] ), .D(n30), .Y(n238) );
  OAI22X1 U248 ( .A(\curr_reg[39][1] ), .B(n27), .C(\curr_reg[37][1] ), .D(n31), .Y(n237) );
  NOR2X1 U249 ( .A(n238), .B(n237), .Y(n252) );
  NOR2X1 U250 ( .A(\curr_reg[32][1] ), .B(n9), .Y(n239) );
  NOR2X1 U251 ( .A(n691), .B(n239), .Y(n240) );
  OAI21X1 U252 ( .A(\curr_reg[34][1] ), .B(n26), .C(n240), .Y(n242) );
  OAI22X1 U253 ( .A(\curr_reg[38][1] ), .B(n29), .C(\curr_reg[36][1] ), .D(n32), .Y(n241) );
  NOR2X1 U254 ( .A(n242), .B(n241), .Y(n251) );
  OAI22X1 U255 ( .A(\curr_reg[51][1] ), .B(n28), .C(\curr_reg[49][1] ), .D(n30), .Y(n244) );
  OAI22X1 U256 ( .A(\curr_reg[55][1] ), .B(n27), .C(\curr_reg[53][1] ), .D(n31), .Y(n243) );
  NOR2X1 U257 ( .A(n244), .B(n243), .Y(n250) );
  NOR2X1 U258 ( .A(\curr_reg[48][1] ), .B(n9), .Y(n245) );
  NOR2X1 U259 ( .A(n699), .B(n245), .Y(n246) );
  OAI21X1 U260 ( .A(\curr_reg[50][1] ), .B(n26), .C(n246), .Y(n248) );
  OAI22X1 U261 ( .A(\curr_reg[54][1] ), .B(n29), .C(\curr_reg[52][1] ), .D(n32), .Y(n247) );
  NOR2X1 U262 ( .A(n248), .B(n247), .Y(n249) );
  AOI22X1 U263 ( .A(n252), .B(n251), .C(n250), .D(n249), .Y(n270) );
  OAI22X1 U264 ( .A(\curr_reg[3][1] ), .B(n28), .C(\curr_reg[1][1] ), .D(n30), 
        .Y(n254) );
  OAI22X1 U265 ( .A(\curr_reg[7][1] ), .B(n27), .C(\curr_reg[5][1] ), .D(n31), 
        .Y(n253) );
  NOR2X1 U266 ( .A(n254), .B(n253), .Y(n268) );
  NOR2X1 U267 ( .A(\curr_reg[0][1] ), .B(n9), .Y(n255) );
  NOR2X1 U268 ( .A(n740), .B(n255), .Y(n256) );
  OAI21X1 U269 ( .A(\curr_reg[2][1] ), .B(n26), .C(n256), .Y(n258) );
  OAI22X1 U270 ( .A(\curr_reg[6][1] ), .B(n29), .C(\curr_reg[4][1] ), .D(n32), 
        .Y(n257) );
  NOR2X1 U271 ( .A(n258), .B(n257), .Y(n267) );
  OAI22X1 U272 ( .A(\curr_reg[19][1] ), .B(n28), .C(\curr_reg[17][1] ), .D(n30), .Y(n260) );
  OAI22X1 U273 ( .A(\curr_reg[23][1] ), .B(n27), .C(\curr_reg[21][1] ), .D(n31), .Y(n259) );
  NOR2X1 U274 ( .A(n260), .B(n259), .Y(n266) );
  NOR2X1 U275 ( .A(\curr_reg[16][1] ), .B(n9), .Y(n261) );
  NOR2X1 U276 ( .A(n741), .B(n261), .Y(n262) );
  OAI21X1 U277 ( .A(\curr_reg[18][1] ), .B(n26), .C(n262), .Y(n264) );
  OAI22X1 U278 ( .A(\curr_reg[22][1] ), .B(n29), .C(\curr_reg[20][1] ), .D(n32), .Y(n263) );
  NOR2X1 U279 ( .A(n264), .B(n263), .Y(n265) );
  AOI22X1 U280 ( .A(n268), .B(n267), .C(n266), .D(n265), .Y(n269) );
  AOI21X1 U281 ( .A(n270), .B(n269), .C(N156), .Y(n306) );
  OAI22X1 U282 ( .A(\curr_reg[43][1] ), .B(n28), .C(\curr_reg[41][1] ), .D(n30), .Y(n272) );
  OAI22X1 U283 ( .A(\curr_reg[47][1] ), .B(n27), .C(\curr_reg[45][1] ), .D(n31), .Y(n271) );
  NOR2X1 U284 ( .A(n272), .B(n271), .Y(n286) );
  NOR2X1 U285 ( .A(\curr_reg[40][1] ), .B(n9), .Y(n273) );
  NOR2X1 U286 ( .A(n691), .B(n273), .Y(n274) );
  OAI21X1 U287 ( .A(\curr_reg[42][1] ), .B(n26), .C(n274), .Y(n276) );
  OAI22X1 U288 ( .A(\curr_reg[46][1] ), .B(n29), .C(\curr_reg[44][1] ), .D(n32), .Y(n275) );
  NOR2X1 U289 ( .A(n276), .B(n275), .Y(n285) );
  OAI22X1 U290 ( .A(\curr_reg[59][1] ), .B(n28), .C(\curr_reg[57][1] ), .D(n30), .Y(n278) );
  OAI22X1 U291 ( .A(\curr_reg[63][1] ), .B(n27), .C(\curr_reg[61][1] ), .D(n31), .Y(n277) );
  NOR2X1 U292 ( .A(n278), .B(n277), .Y(n284) );
  NOR2X1 U293 ( .A(\curr_reg[56][1] ), .B(n9), .Y(n279) );
  NOR2X1 U294 ( .A(n699), .B(n279), .Y(n280) );
  OAI21X1 U295 ( .A(\curr_reg[58][1] ), .B(n26), .C(n280), .Y(n282) );
  OAI22X1 U296 ( .A(\curr_reg[62][1] ), .B(n29), .C(\curr_reg[60][1] ), .D(n32), .Y(n281) );
  NOR2X1 U297 ( .A(n282), .B(n281), .Y(n283) );
  AOI22X1 U298 ( .A(n286), .B(n285), .C(n284), .D(n283), .Y(n304) );
  OAI22X1 U299 ( .A(\curr_reg[11][1] ), .B(n28), .C(\curr_reg[9][1] ), .D(n30), 
        .Y(n288) );
  OAI22X1 U300 ( .A(\curr_reg[15][1] ), .B(n27), .C(\curr_reg[13][1] ), .D(n31), .Y(n287) );
  NOR2X1 U301 ( .A(n288), .B(n287), .Y(n302) );
  NOR2X1 U302 ( .A(\curr_reg[8][1] ), .B(n9), .Y(n289) );
  NOR2X1 U303 ( .A(n740), .B(n289), .Y(n290) );
  OAI21X1 U304 ( .A(\curr_reg[10][1] ), .B(n26), .C(n290), .Y(n292) );
  OAI22X1 U305 ( .A(\curr_reg[14][1] ), .B(n29), .C(\curr_reg[12][1] ), .D(n32), .Y(n291) );
  NOR2X1 U306 ( .A(n292), .B(n291), .Y(n301) );
  OAI22X1 U307 ( .A(\curr_reg[27][1] ), .B(n28), .C(\curr_reg[25][1] ), .D(n30), .Y(n294) );
  OAI22X1 U308 ( .A(\curr_reg[31][1] ), .B(n27), .C(\curr_reg[29][1] ), .D(n31), .Y(n293) );
  NOR2X1 U309 ( .A(n294), .B(n293), .Y(n300) );
  NOR2X1 U310 ( .A(\curr_reg[24][1] ), .B(n9), .Y(n295) );
  NOR2X1 U311 ( .A(n741), .B(n295), .Y(n296) );
  OAI21X1 U312 ( .A(\curr_reg[26][1] ), .B(n26), .C(n296), .Y(n298) );
  OAI22X1 U313 ( .A(\curr_reg[30][1] ), .B(n29), .C(\curr_reg[28][1] ), .D(n32), .Y(n297) );
  NOR2X1 U314 ( .A(n298), .B(n297), .Y(n299) );
  AOI22X1 U315 ( .A(n302), .B(n301), .C(n300), .D(n299), .Y(n303) );
  AOI21X1 U316 ( .A(n304), .B(n303), .C(n736), .Y(n305) );
  OR2X1 U317 ( .A(n306), .B(n305), .Y(N2044) );
  OAI22X1 U318 ( .A(\curr_reg[35][2] ), .B(n28), .C(\curr_reg[33][2] ), .D(n30), .Y(n308) );
  OAI22X1 U319 ( .A(\curr_reg[39][2] ), .B(n27), .C(\curr_reg[37][2] ), .D(n31), .Y(n307) );
  NOR2X1 U320 ( .A(n308), .B(n307), .Y(n322) );
  NOR2X1 U321 ( .A(\curr_reg[32][2] ), .B(n9), .Y(n309) );
  NOR2X1 U322 ( .A(n691), .B(n309), .Y(n310) );
  OAI21X1 U323 ( .A(\curr_reg[34][2] ), .B(n26), .C(n310), .Y(n312) );
  OAI22X1 U324 ( .A(\curr_reg[38][2] ), .B(n29), .C(\curr_reg[36][2] ), .D(n32), .Y(n311) );
  NOR2X1 U325 ( .A(n312), .B(n311), .Y(n321) );
  OAI22X1 U326 ( .A(\curr_reg[51][2] ), .B(n28), .C(\curr_reg[49][2] ), .D(n30), .Y(n314) );
  OAI22X1 U327 ( .A(\curr_reg[55][2] ), .B(n27), .C(\curr_reg[53][2] ), .D(n31), .Y(n313) );
  NOR2X1 U328 ( .A(n314), .B(n313), .Y(n320) );
  NOR2X1 U329 ( .A(\curr_reg[48][2] ), .B(n9), .Y(n315) );
  NOR2X1 U330 ( .A(n699), .B(n315), .Y(n316) );
  OAI21X1 U331 ( .A(\curr_reg[50][2] ), .B(n26), .C(n316), .Y(n318) );
  OAI22X1 U332 ( .A(\curr_reg[54][2] ), .B(n29), .C(\curr_reg[52][2] ), .D(n32), .Y(n317) );
  NOR2X1 U333 ( .A(n318), .B(n317), .Y(n319) );
  AOI22X1 U334 ( .A(n322), .B(n321), .C(n320), .D(n319), .Y(n340) );
  OAI22X1 U335 ( .A(\curr_reg[3][2] ), .B(n28), .C(\curr_reg[1][2] ), .D(n30), 
        .Y(n324) );
  OAI22X1 U336 ( .A(\curr_reg[7][2] ), .B(n27), .C(\curr_reg[5][2] ), .D(n31), 
        .Y(n323) );
  NOR2X1 U337 ( .A(n324), .B(n323), .Y(n338) );
  NOR2X1 U338 ( .A(\curr_reg[0][2] ), .B(n9), .Y(n325) );
  NOR2X1 U339 ( .A(n740), .B(n325), .Y(n326) );
  OAI21X1 U340 ( .A(\curr_reg[2][2] ), .B(n26), .C(n326), .Y(n328) );
  OAI22X1 U341 ( .A(\curr_reg[6][2] ), .B(n29), .C(\curr_reg[4][2] ), .D(n32), 
        .Y(n327) );
  NOR2X1 U342 ( .A(n328), .B(n327), .Y(n337) );
  OAI22X1 U343 ( .A(\curr_reg[19][2] ), .B(n28), .C(\curr_reg[17][2] ), .D(n30), .Y(n330) );
  OAI22X1 U344 ( .A(\curr_reg[23][2] ), .B(n27), .C(\curr_reg[21][2] ), .D(n31), .Y(n329) );
  NOR2X1 U345 ( .A(n330), .B(n329), .Y(n336) );
  NOR2X1 U346 ( .A(\curr_reg[16][2] ), .B(n9), .Y(n331) );
  NOR2X1 U347 ( .A(n741), .B(n331), .Y(n332) );
  OAI21X1 U348 ( .A(\curr_reg[18][2] ), .B(n26), .C(n332), .Y(n334) );
  OAI22X1 U349 ( .A(\curr_reg[22][2] ), .B(n29), .C(\curr_reg[20][2] ), .D(n32), .Y(n333) );
  NOR2X1 U350 ( .A(n334), .B(n333), .Y(n335) );
  AOI22X1 U351 ( .A(n338), .B(n337), .C(n336), .D(n335), .Y(n339) );
  AOI21X1 U352 ( .A(n340), .B(n339), .C(N156), .Y(n376) );
  OAI22X1 U353 ( .A(\curr_reg[43][2] ), .B(n28), .C(\curr_reg[41][2] ), .D(n30), .Y(n342) );
  OAI22X1 U354 ( .A(\curr_reg[47][2] ), .B(n27), .C(\curr_reg[45][2] ), .D(n31), .Y(n341) );
  NOR2X1 U355 ( .A(n342), .B(n341), .Y(n356) );
  NOR2X1 U356 ( .A(\curr_reg[40][2] ), .B(n9), .Y(n343) );
  NOR2X1 U357 ( .A(n691), .B(n343), .Y(n344) );
  OAI21X1 U358 ( .A(\curr_reg[42][2] ), .B(n26), .C(n344), .Y(n346) );
  OAI22X1 U359 ( .A(\curr_reg[46][2] ), .B(n29), .C(\curr_reg[44][2] ), .D(n32), .Y(n345) );
  NOR2X1 U360 ( .A(n346), .B(n345), .Y(n355) );
  OAI22X1 U361 ( .A(\curr_reg[59][2] ), .B(n28), .C(\curr_reg[57][2] ), .D(n30), .Y(n348) );
  OAI22X1 U362 ( .A(\curr_reg[63][2] ), .B(n27), .C(\curr_reg[61][2] ), .D(n31), .Y(n347) );
  NOR2X1 U363 ( .A(n348), .B(n347), .Y(n354) );
  NOR2X1 U364 ( .A(\curr_reg[56][2] ), .B(n9), .Y(n349) );
  NOR2X1 U365 ( .A(n699), .B(n349), .Y(n350) );
  OAI21X1 U366 ( .A(\curr_reg[58][2] ), .B(n26), .C(n350), .Y(n352) );
  OAI22X1 U367 ( .A(\curr_reg[62][2] ), .B(n29), .C(\curr_reg[60][2] ), .D(n32), .Y(n351) );
  NOR2X1 U368 ( .A(n352), .B(n351), .Y(n353) );
  AOI22X1 U369 ( .A(n356), .B(n355), .C(n354), .D(n353), .Y(n374) );
  OAI22X1 U370 ( .A(\curr_reg[11][2] ), .B(n28), .C(\curr_reg[9][2] ), .D(n30), 
        .Y(n358) );
  OAI22X1 U371 ( .A(\curr_reg[15][2] ), .B(n27), .C(\curr_reg[13][2] ), .D(n31), .Y(n357) );
  NOR2X1 U372 ( .A(n358), .B(n357), .Y(n372) );
  NOR2X1 U373 ( .A(\curr_reg[8][2] ), .B(n9), .Y(n359) );
  NOR2X1 U374 ( .A(n740), .B(n359), .Y(n360) );
  OAI21X1 U375 ( .A(\curr_reg[10][2] ), .B(n26), .C(n360), .Y(n362) );
  OAI22X1 U376 ( .A(\curr_reg[14][2] ), .B(n29), .C(\curr_reg[12][2] ), .D(n32), .Y(n361) );
  NOR2X1 U377 ( .A(n362), .B(n361), .Y(n371) );
  OAI22X1 U378 ( .A(\curr_reg[27][2] ), .B(n28), .C(\curr_reg[25][2] ), .D(n30), .Y(n364) );
  OAI22X1 U379 ( .A(\curr_reg[31][2] ), .B(n27), .C(\curr_reg[29][2] ), .D(n31), .Y(n363) );
  NOR2X1 U380 ( .A(n364), .B(n363), .Y(n370) );
  NOR2X1 U381 ( .A(\curr_reg[24][2] ), .B(n9), .Y(n365) );
  NOR2X1 U382 ( .A(n741), .B(n365), .Y(n366) );
  OAI21X1 U383 ( .A(\curr_reg[26][2] ), .B(n26), .C(n366), .Y(n368) );
  OAI22X1 U384 ( .A(\curr_reg[30][2] ), .B(n29), .C(\curr_reg[28][2] ), .D(n32), .Y(n367) );
  NOR2X1 U385 ( .A(n368), .B(n367), .Y(n369) );
  AOI22X1 U386 ( .A(n372), .B(n371), .C(n370), .D(n369), .Y(n373) );
  AOI21X1 U387 ( .A(n374), .B(n373), .C(n736), .Y(n375) );
  OR2X1 U388 ( .A(n376), .B(n375), .Y(N2043) );
  OAI22X1 U389 ( .A(\curr_reg[35][3] ), .B(n28), .C(\curr_reg[33][3] ), .D(n30), .Y(n378) );
  OAI22X1 U390 ( .A(\curr_reg[39][3] ), .B(n27), .C(\curr_reg[37][3] ), .D(n31), .Y(n377) );
  NOR2X1 U391 ( .A(n378), .B(n377), .Y(n392) );
  NOR2X1 U392 ( .A(\curr_reg[32][3] ), .B(n9), .Y(n379) );
  NOR2X1 U393 ( .A(n691), .B(n379), .Y(n380) );
  OAI21X1 U394 ( .A(\curr_reg[34][3] ), .B(n26), .C(n380), .Y(n382) );
  OAI22X1 U395 ( .A(\curr_reg[38][3] ), .B(n29), .C(\curr_reg[36][3] ), .D(n32), .Y(n381) );
  NOR2X1 U396 ( .A(n382), .B(n381), .Y(n391) );
  OAI22X1 U397 ( .A(\curr_reg[51][3] ), .B(n28), .C(\curr_reg[49][3] ), .D(n30), .Y(n384) );
  OAI22X1 U398 ( .A(\curr_reg[55][3] ), .B(n27), .C(\curr_reg[53][3] ), .D(n31), .Y(n383) );
  NOR2X1 U399 ( .A(n384), .B(n383), .Y(n390) );
  NOR2X1 U400 ( .A(\curr_reg[48][3] ), .B(n9), .Y(n385) );
  NOR2X1 U401 ( .A(n699), .B(n385), .Y(n386) );
  OAI21X1 U402 ( .A(\curr_reg[50][3] ), .B(n26), .C(n386), .Y(n388) );
  OAI22X1 U403 ( .A(\curr_reg[54][3] ), .B(n29), .C(\curr_reg[52][3] ), .D(n32), .Y(n387) );
  NOR2X1 U404 ( .A(n388), .B(n387), .Y(n389) );
  AOI22X1 U405 ( .A(n392), .B(n391), .C(n390), .D(n389), .Y(n410) );
  OAI22X1 U406 ( .A(\curr_reg[3][3] ), .B(n28), .C(\curr_reg[1][3] ), .D(n30), 
        .Y(n394) );
  OAI22X1 U407 ( .A(\curr_reg[7][3] ), .B(n27), .C(\curr_reg[5][3] ), .D(n31), 
        .Y(n393) );
  NOR2X1 U408 ( .A(n394), .B(n393), .Y(n408) );
  NOR2X1 U409 ( .A(\curr_reg[0][3] ), .B(n9), .Y(n395) );
  NOR2X1 U410 ( .A(n740), .B(n395), .Y(n396) );
  OAI21X1 U411 ( .A(\curr_reg[2][3] ), .B(n26), .C(n396), .Y(n398) );
  OAI22X1 U412 ( .A(\curr_reg[6][3] ), .B(n29), .C(\curr_reg[4][3] ), .D(n32), 
        .Y(n397) );
  NOR2X1 U413 ( .A(n398), .B(n397), .Y(n407) );
  OAI22X1 U414 ( .A(\curr_reg[19][3] ), .B(n28), .C(\curr_reg[17][3] ), .D(n30), .Y(n400) );
  OAI22X1 U415 ( .A(\curr_reg[23][3] ), .B(n27), .C(\curr_reg[21][3] ), .D(n31), .Y(n399) );
  NOR2X1 U416 ( .A(n400), .B(n399), .Y(n406) );
  NOR2X1 U417 ( .A(\curr_reg[16][3] ), .B(n9), .Y(n401) );
  NOR2X1 U418 ( .A(n741), .B(n401), .Y(n402) );
  OAI21X1 U419 ( .A(\curr_reg[18][3] ), .B(n26), .C(n402), .Y(n404) );
  OAI22X1 U420 ( .A(\curr_reg[22][3] ), .B(n29), .C(\curr_reg[20][3] ), .D(n32), .Y(n403) );
  NOR2X1 U421 ( .A(n404), .B(n403), .Y(n405) );
  AOI22X1 U422 ( .A(n408), .B(n407), .C(n406), .D(n405), .Y(n409) );
  AOI21X1 U423 ( .A(n410), .B(n409), .C(N156), .Y(n446) );
  OAI22X1 U424 ( .A(\curr_reg[43][3] ), .B(n28), .C(\curr_reg[41][3] ), .D(n30), .Y(n412) );
  OAI22X1 U425 ( .A(\curr_reg[47][3] ), .B(n27), .C(\curr_reg[45][3] ), .D(n31), .Y(n411) );
  NOR2X1 U426 ( .A(n412), .B(n411), .Y(n426) );
  NOR2X1 U427 ( .A(\curr_reg[40][3] ), .B(n9), .Y(n413) );
  NOR2X1 U428 ( .A(n691), .B(n413), .Y(n414) );
  OAI21X1 U429 ( .A(\curr_reg[42][3] ), .B(n26), .C(n414), .Y(n416) );
  OAI22X1 U430 ( .A(\curr_reg[46][3] ), .B(n29), .C(\curr_reg[44][3] ), .D(n32), .Y(n415) );
  NOR2X1 U431 ( .A(n416), .B(n415), .Y(n425) );
  OAI22X1 U432 ( .A(\curr_reg[59][3] ), .B(n28), .C(\curr_reg[57][3] ), .D(n30), .Y(n418) );
  OAI22X1 U433 ( .A(\curr_reg[63][3] ), .B(n27), .C(\curr_reg[61][3] ), .D(n31), .Y(n417) );
  NOR2X1 U434 ( .A(n418), .B(n417), .Y(n424) );
  NOR2X1 U435 ( .A(\curr_reg[56][3] ), .B(n9), .Y(n419) );
  NOR2X1 U436 ( .A(n699), .B(n419), .Y(n420) );
  OAI21X1 U437 ( .A(\curr_reg[58][3] ), .B(n26), .C(n420), .Y(n422) );
  OAI22X1 U438 ( .A(\curr_reg[62][3] ), .B(n29), .C(\curr_reg[60][3] ), .D(n32), .Y(n421) );
  NOR2X1 U439 ( .A(n422), .B(n421), .Y(n423) );
  AOI22X1 U440 ( .A(n426), .B(n425), .C(n424), .D(n423), .Y(n444) );
  OAI22X1 U441 ( .A(\curr_reg[11][3] ), .B(n28), .C(\curr_reg[9][3] ), .D(n30), 
        .Y(n428) );
  OAI22X1 U442 ( .A(\curr_reg[15][3] ), .B(n27), .C(\curr_reg[13][3] ), .D(n31), .Y(n427) );
  NOR2X1 U443 ( .A(n428), .B(n427), .Y(n442) );
  NOR2X1 U444 ( .A(\curr_reg[8][3] ), .B(n9), .Y(n429) );
  NOR2X1 U445 ( .A(n740), .B(n429), .Y(n430) );
  OAI21X1 U446 ( .A(\curr_reg[10][3] ), .B(n26), .C(n430), .Y(n432) );
  OAI22X1 U447 ( .A(\curr_reg[14][3] ), .B(n29), .C(\curr_reg[12][3] ), .D(n32), .Y(n431) );
  NOR2X1 U448 ( .A(n432), .B(n431), .Y(n441) );
  OAI22X1 U449 ( .A(\curr_reg[27][3] ), .B(n28), .C(\curr_reg[25][3] ), .D(n30), .Y(n434) );
  OAI22X1 U450 ( .A(\curr_reg[31][3] ), .B(n27), .C(\curr_reg[29][3] ), .D(n31), .Y(n433) );
  NOR2X1 U451 ( .A(n434), .B(n433), .Y(n440) );
  NOR2X1 U452 ( .A(\curr_reg[24][3] ), .B(n9), .Y(n435) );
  NOR2X1 U453 ( .A(n741), .B(n435), .Y(n436) );
  OAI21X1 U454 ( .A(\curr_reg[26][3] ), .B(n26), .C(n436), .Y(n438) );
  OAI22X1 U455 ( .A(\curr_reg[30][3] ), .B(n29), .C(\curr_reg[28][3] ), .D(n32), .Y(n437) );
  NOR2X1 U456 ( .A(n438), .B(n437), .Y(n439) );
  AOI22X1 U457 ( .A(n442), .B(n441), .C(n440), .D(n439), .Y(n443) );
  AOI21X1 U458 ( .A(n444), .B(n443), .C(n736), .Y(n445) );
  OR2X1 U459 ( .A(n446), .B(n445), .Y(N2042) );
  OAI22X1 U460 ( .A(\curr_reg[35][4] ), .B(n28), .C(\curr_reg[33][4] ), .D(n30), .Y(n448) );
  OAI22X1 U461 ( .A(\curr_reg[39][4] ), .B(n27), .C(\curr_reg[37][4] ), .D(n31), .Y(n447) );
  NOR2X1 U462 ( .A(n448), .B(n447), .Y(n462) );
  NOR2X1 U463 ( .A(\curr_reg[32][4] ), .B(n9), .Y(n449) );
  NOR2X1 U464 ( .A(n691), .B(n449), .Y(n450) );
  OAI21X1 U465 ( .A(\curr_reg[34][4] ), .B(n26), .C(n450), .Y(n452) );
  OAI22X1 U466 ( .A(\curr_reg[38][4] ), .B(n29), .C(\curr_reg[36][4] ), .D(n32), .Y(n451) );
  NOR2X1 U467 ( .A(n452), .B(n451), .Y(n461) );
  OAI22X1 U468 ( .A(\curr_reg[51][4] ), .B(n28), .C(\curr_reg[49][4] ), .D(n30), .Y(n454) );
  OAI22X1 U469 ( .A(\curr_reg[55][4] ), .B(n27), .C(\curr_reg[53][4] ), .D(n31), .Y(n453) );
  NOR2X1 U470 ( .A(n454), .B(n453), .Y(n460) );
  NOR2X1 U471 ( .A(\curr_reg[48][4] ), .B(n9), .Y(n455) );
  NOR2X1 U472 ( .A(n699), .B(n455), .Y(n456) );
  OAI21X1 U473 ( .A(\curr_reg[50][4] ), .B(n26), .C(n456), .Y(n458) );
  OAI22X1 U474 ( .A(\curr_reg[54][4] ), .B(n29), .C(\curr_reg[52][4] ), .D(n32), .Y(n457) );
  NOR2X1 U475 ( .A(n458), .B(n457), .Y(n459) );
  AOI22X1 U476 ( .A(n462), .B(n461), .C(n460), .D(n459), .Y(n480) );
  OAI22X1 U477 ( .A(\curr_reg[3][4] ), .B(n28), .C(\curr_reg[1][4] ), .D(n30), 
        .Y(n464) );
  OAI22X1 U478 ( .A(\curr_reg[7][4] ), .B(n27), .C(\curr_reg[5][4] ), .D(n31), 
        .Y(n463) );
  NOR2X1 U479 ( .A(n464), .B(n463), .Y(n478) );
  NOR2X1 U480 ( .A(\curr_reg[0][4] ), .B(n9), .Y(n465) );
  NOR2X1 U481 ( .A(n740), .B(n465), .Y(n466) );
  OAI21X1 U482 ( .A(\curr_reg[2][4] ), .B(n26), .C(n466), .Y(n468) );
  OAI22X1 U483 ( .A(\curr_reg[6][4] ), .B(n29), .C(\curr_reg[4][4] ), .D(n32), 
        .Y(n467) );
  NOR2X1 U484 ( .A(n468), .B(n467), .Y(n477) );
  OAI22X1 U485 ( .A(\curr_reg[19][4] ), .B(n28), .C(\curr_reg[17][4] ), .D(n30), .Y(n470) );
  OAI22X1 U486 ( .A(\curr_reg[23][4] ), .B(n27), .C(\curr_reg[21][4] ), .D(n31), .Y(n469) );
  NOR2X1 U487 ( .A(n470), .B(n469), .Y(n476) );
  NOR2X1 U488 ( .A(\curr_reg[16][4] ), .B(n9), .Y(n471) );
  NOR2X1 U489 ( .A(n741), .B(n471), .Y(n472) );
  OAI21X1 U490 ( .A(\curr_reg[18][4] ), .B(n26), .C(n472), .Y(n474) );
  OAI22X1 U491 ( .A(\curr_reg[22][4] ), .B(n29), .C(\curr_reg[20][4] ), .D(n32), .Y(n473) );
  NOR2X1 U492 ( .A(n474), .B(n473), .Y(n475) );
  AOI22X1 U493 ( .A(n478), .B(n477), .C(n476), .D(n475), .Y(n479) );
  AOI21X1 U494 ( .A(n480), .B(n479), .C(N156), .Y(n516) );
  OAI22X1 U495 ( .A(\curr_reg[43][4] ), .B(n28), .C(\curr_reg[41][4] ), .D(n30), .Y(n482) );
  OAI22X1 U496 ( .A(\curr_reg[47][4] ), .B(n27), .C(\curr_reg[45][4] ), .D(n31), .Y(n481) );
  NOR2X1 U497 ( .A(n482), .B(n481), .Y(n496) );
  NOR2X1 U498 ( .A(\curr_reg[40][4] ), .B(n9), .Y(n483) );
  NOR2X1 U499 ( .A(n691), .B(n483), .Y(n484) );
  OAI21X1 U500 ( .A(\curr_reg[42][4] ), .B(n26), .C(n484), .Y(n486) );
  OAI22X1 U501 ( .A(\curr_reg[46][4] ), .B(n29), .C(\curr_reg[44][4] ), .D(n32), .Y(n485) );
  NOR2X1 U502 ( .A(n486), .B(n485), .Y(n495) );
  OAI22X1 U503 ( .A(\curr_reg[59][4] ), .B(n28), .C(\curr_reg[57][4] ), .D(n30), .Y(n488) );
  OAI22X1 U504 ( .A(\curr_reg[63][4] ), .B(n27), .C(\curr_reg[61][4] ), .D(n31), .Y(n487) );
  NOR2X1 U505 ( .A(n488), .B(n487), .Y(n494) );
  NOR2X1 U506 ( .A(\curr_reg[56][4] ), .B(n9), .Y(n489) );
  NOR2X1 U507 ( .A(n699), .B(n489), .Y(n490) );
  OAI21X1 U508 ( .A(\curr_reg[58][4] ), .B(n26), .C(n490), .Y(n492) );
  OAI22X1 U509 ( .A(\curr_reg[62][4] ), .B(n29), .C(\curr_reg[60][4] ), .D(n32), .Y(n491) );
  NOR2X1 U510 ( .A(n492), .B(n491), .Y(n493) );
  AOI22X1 U511 ( .A(n496), .B(n495), .C(n494), .D(n493), .Y(n514) );
  OAI22X1 U512 ( .A(\curr_reg[11][4] ), .B(n28), .C(\curr_reg[9][4] ), .D(n30), 
        .Y(n498) );
  OAI22X1 U513 ( .A(\curr_reg[15][4] ), .B(n27), .C(\curr_reg[13][4] ), .D(n31), .Y(n497) );
  NOR2X1 U514 ( .A(n498), .B(n497), .Y(n512) );
  NOR2X1 U515 ( .A(\curr_reg[8][4] ), .B(n9), .Y(n499) );
  NOR2X1 U516 ( .A(n740), .B(n499), .Y(n500) );
  OAI21X1 U517 ( .A(\curr_reg[10][4] ), .B(n26), .C(n500), .Y(n502) );
  OAI22X1 U518 ( .A(\curr_reg[14][4] ), .B(n29), .C(\curr_reg[12][4] ), .D(n32), .Y(n501) );
  NOR2X1 U519 ( .A(n502), .B(n501), .Y(n511) );
  OAI22X1 U520 ( .A(\curr_reg[27][4] ), .B(n28), .C(\curr_reg[25][4] ), .D(n30), .Y(n504) );
  OAI22X1 U521 ( .A(\curr_reg[31][4] ), .B(n27), .C(\curr_reg[29][4] ), .D(n31), .Y(n503) );
  NOR2X1 U522 ( .A(n504), .B(n503), .Y(n510) );
  NOR2X1 U523 ( .A(\curr_reg[24][4] ), .B(n9), .Y(n505) );
  NOR2X1 U524 ( .A(n741), .B(n505), .Y(n506) );
  OAI21X1 U525 ( .A(\curr_reg[26][4] ), .B(n26), .C(n506), .Y(n508) );
  OAI22X1 U526 ( .A(\curr_reg[30][4] ), .B(n29), .C(\curr_reg[28][4] ), .D(n32), .Y(n507) );
  NOR2X1 U527 ( .A(n508), .B(n507), .Y(n509) );
  AOI22X1 U528 ( .A(n512), .B(n511), .C(n510), .D(n509), .Y(n513) );
  AOI21X1 U529 ( .A(n514), .B(n513), .C(n736), .Y(n515) );
  OR2X1 U530 ( .A(n516), .B(n515), .Y(N2041) );
  OAI22X1 U531 ( .A(\curr_reg[35][5] ), .B(n28), .C(\curr_reg[33][5] ), .D(n30), .Y(n518) );
  OAI22X1 U532 ( .A(\curr_reg[39][5] ), .B(n27), .C(\curr_reg[37][5] ), .D(n31), .Y(n517) );
  NOR2X1 U533 ( .A(n518), .B(n517), .Y(n532) );
  NOR2X1 U534 ( .A(\curr_reg[32][5] ), .B(n9), .Y(n519) );
  NOR2X1 U535 ( .A(n691), .B(n519), .Y(n520) );
  OAI21X1 U536 ( .A(\curr_reg[34][5] ), .B(n26), .C(n520), .Y(n522) );
  OAI22X1 U537 ( .A(\curr_reg[38][5] ), .B(n29), .C(\curr_reg[36][5] ), .D(n32), .Y(n521) );
  NOR2X1 U538 ( .A(n522), .B(n521), .Y(n531) );
  OAI22X1 U539 ( .A(\curr_reg[51][5] ), .B(n28), .C(\curr_reg[49][5] ), .D(n30), .Y(n524) );
  OAI22X1 U540 ( .A(\curr_reg[55][5] ), .B(n27), .C(\curr_reg[53][5] ), .D(n31), .Y(n523) );
  NOR2X1 U541 ( .A(n524), .B(n523), .Y(n530) );
  NOR2X1 U542 ( .A(\curr_reg[48][5] ), .B(n9), .Y(n525) );
  NOR2X1 U543 ( .A(n699), .B(n525), .Y(n526) );
  OAI21X1 U544 ( .A(\curr_reg[50][5] ), .B(n26), .C(n526), .Y(n528) );
  OAI22X1 U545 ( .A(\curr_reg[54][5] ), .B(n29), .C(\curr_reg[52][5] ), .D(n32), .Y(n527) );
  NOR2X1 U546 ( .A(n528), .B(n527), .Y(n529) );
  AOI22X1 U547 ( .A(n532), .B(n531), .C(n530), .D(n529), .Y(n550) );
  OAI22X1 U548 ( .A(\curr_reg[3][5] ), .B(n28), .C(\curr_reg[1][5] ), .D(n30), 
        .Y(n534) );
  OAI22X1 U549 ( .A(\curr_reg[7][5] ), .B(n27), .C(\curr_reg[5][5] ), .D(n31), 
        .Y(n533) );
  NOR2X1 U550 ( .A(n534), .B(n533), .Y(n548) );
  NOR2X1 U551 ( .A(\curr_reg[0][5] ), .B(n9), .Y(n535) );
  NOR2X1 U552 ( .A(n740), .B(n535), .Y(n536) );
  OAI21X1 U553 ( .A(\curr_reg[2][5] ), .B(n26), .C(n536), .Y(n538) );
  OAI22X1 U554 ( .A(\curr_reg[6][5] ), .B(n29), .C(\curr_reg[4][5] ), .D(n32), 
        .Y(n537) );
  NOR2X1 U555 ( .A(n538), .B(n537), .Y(n547) );
  OAI22X1 U556 ( .A(\curr_reg[19][5] ), .B(n28), .C(\curr_reg[17][5] ), .D(n30), .Y(n540) );
  OAI22X1 U557 ( .A(\curr_reg[23][5] ), .B(n27), .C(\curr_reg[21][5] ), .D(n31), .Y(n539) );
  NOR2X1 U558 ( .A(n540), .B(n539), .Y(n546) );
  NOR2X1 U559 ( .A(\curr_reg[16][5] ), .B(n9), .Y(n541) );
  NOR2X1 U560 ( .A(n741), .B(n541), .Y(n542) );
  OAI21X1 U561 ( .A(\curr_reg[18][5] ), .B(n26), .C(n542), .Y(n544) );
  OAI22X1 U562 ( .A(\curr_reg[22][5] ), .B(n29), .C(\curr_reg[20][5] ), .D(n32), .Y(n543) );
  NOR2X1 U563 ( .A(n544), .B(n543), .Y(n545) );
  AOI22X1 U564 ( .A(n548), .B(n547), .C(n546), .D(n545), .Y(n549) );
  AOI21X1 U565 ( .A(n550), .B(n549), .C(N156), .Y(n586) );
  OAI22X1 U566 ( .A(\curr_reg[43][5] ), .B(n28), .C(\curr_reg[41][5] ), .D(n30), .Y(n552) );
  OAI22X1 U567 ( .A(\curr_reg[47][5] ), .B(n27), .C(\curr_reg[45][5] ), .D(n31), .Y(n551) );
  NOR2X1 U568 ( .A(n552), .B(n551), .Y(n566) );
  NOR2X1 U569 ( .A(\curr_reg[40][5] ), .B(n9), .Y(n553) );
  NOR2X1 U570 ( .A(n691), .B(n553), .Y(n554) );
  OAI21X1 U571 ( .A(\curr_reg[42][5] ), .B(n26), .C(n554), .Y(n556) );
  OAI22X1 U572 ( .A(\curr_reg[46][5] ), .B(n29), .C(\curr_reg[44][5] ), .D(n32), .Y(n555) );
  NOR2X1 U573 ( .A(n556), .B(n555), .Y(n565) );
  OAI22X1 U574 ( .A(\curr_reg[59][5] ), .B(n28), .C(\curr_reg[57][5] ), .D(n30), .Y(n558) );
  OAI22X1 U575 ( .A(\curr_reg[63][5] ), .B(n27), .C(\curr_reg[61][5] ), .D(n31), .Y(n557) );
  NOR2X1 U576 ( .A(n558), .B(n557), .Y(n564) );
  NOR2X1 U577 ( .A(\curr_reg[56][5] ), .B(n9), .Y(n559) );
  NOR2X1 U578 ( .A(n699), .B(n559), .Y(n560) );
  OAI21X1 U579 ( .A(\curr_reg[58][5] ), .B(n26), .C(n560), .Y(n562) );
  OAI22X1 U580 ( .A(\curr_reg[62][5] ), .B(n29), .C(\curr_reg[60][5] ), .D(n32), .Y(n561) );
  NOR2X1 U581 ( .A(n562), .B(n561), .Y(n563) );
  AOI22X1 U582 ( .A(n566), .B(n565), .C(n564), .D(n563), .Y(n584) );
  OAI22X1 U583 ( .A(\curr_reg[11][5] ), .B(n28), .C(\curr_reg[9][5] ), .D(n30), 
        .Y(n568) );
  OAI22X1 U584 ( .A(\curr_reg[15][5] ), .B(n27), .C(\curr_reg[13][5] ), .D(n31), .Y(n567) );
  NOR2X1 U585 ( .A(n568), .B(n567), .Y(n582) );
  NOR2X1 U586 ( .A(\curr_reg[8][5] ), .B(n9), .Y(n569) );
  NOR2X1 U587 ( .A(n740), .B(n569), .Y(n570) );
  OAI21X1 U588 ( .A(\curr_reg[10][5] ), .B(n26), .C(n570), .Y(n572) );
  OAI22X1 U589 ( .A(\curr_reg[14][5] ), .B(n29), .C(\curr_reg[12][5] ), .D(n32), .Y(n571) );
  NOR2X1 U590 ( .A(n572), .B(n571), .Y(n581) );
  OAI22X1 U591 ( .A(\curr_reg[27][5] ), .B(n28), .C(\curr_reg[25][5] ), .D(n30), .Y(n574) );
  OAI22X1 U592 ( .A(\curr_reg[31][5] ), .B(n27), .C(\curr_reg[29][5] ), .D(n31), .Y(n573) );
  NOR2X1 U593 ( .A(n574), .B(n573), .Y(n580) );
  NOR2X1 U594 ( .A(\curr_reg[24][5] ), .B(n9), .Y(n575) );
  NOR2X1 U595 ( .A(n741), .B(n575), .Y(n576) );
  OAI21X1 U596 ( .A(\curr_reg[26][5] ), .B(n26), .C(n576), .Y(n578) );
  OAI22X1 U597 ( .A(\curr_reg[30][5] ), .B(n29), .C(\curr_reg[28][5] ), .D(n32), .Y(n577) );
  NOR2X1 U598 ( .A(n578), .B(n577), .Y(n579) );
  AOI22X1 U599 ( .A(n582), .B(n581), .C(n580), .D(n579), .Y(n583) );
  AOI21X1 U600 ( .A(n584), .B(n583), .C(n736), .Y(n585) );
  OR2X1 U601 ( .A(n586), .B(n585), .Y(N2040) );
  OAI22X1 U602 ( .A(\curr_reg[35][6] ), .B(n28), .C(\curr_reg[33][6] ), .D(n30), .Y(n588) );
  OAI22X1 U603 ( .A(\curr_reg[39][6] ), .B(n27), .C(\curr_reg[37][6] ), .D(n31), .Y(n587) );
  NOR2X1 U604 ( .A(n588), .B(n587), .Y(n602) );
  NOR2X1 U605 ( .A(\curr_reg[32][6] ), .B(n9), .Y(n589) );
  NOR2X1 U606 ( .A(n691), .B(n589), .Y(n590) );
  OAI21X1 U607 ( .A(\curr_reg[34][6] ), .B(n26), .C(n590), .Y(n592) );
  OAI22X1 U608 ( .A(\curr_reg[38][6] ), .B(n29), .C(\curr_reg[36][6] ), .D(n32), .Y(n591) );
  NOR2X1 U609 ( .A(n592), .B(n591), .Y(n601) );
  OAI22X1 U610 ( .A(\curr_reg[51][6] ), .B(n28), .C(\curr_reg[49][6] ), .D(n30), .Y(n594) );
  OAI22X1 U611 ( .A(\curr_reg[55][6] ), .B(n27), .C(\curr_reg[53][6] ), .D(n31), .Y(n593) );
  NOR2X1 U612 ( .A(n594), .B(n593), .Y(n600) );
  NOR2X1 U613 ( .A(\curr_reg[48][6] ), .B(n9), .Y(n595) );
  NOR2X1 U614 ( .A(n699), .B(n595), .Y(n596) );
  OAI21X1 U615 ( .A(\curr_reg[50][6] ), .B(n26), .C(n596), .Y(n598) );
  OAI22X1 U616 ( .A(\curr_reg[54][6] ), .B(n29), .C(\curr_reg[52][6] ), .D(n32), .Y(n597) );
  NOR2X1 U617 ( .A(n598), .B(n597), .Y(n599) );
  AOI22X1 U618 ( .A(n602), .B(n601), .C(n600), .D(n599), .Y(n620) );
  OAI22X1 U619 ( .A(\curr_reg[3][6] ), .B(n28), .C(\curr_reg[1][6] ), .D(n30), 
        .Y(n604) );
  OAI22X1 U620 ( .A(\curr_reg[7][6] ), .B(n27), .C(\curr_reg[5][6] ), .D(n31), 
        .Y(n603) );
  NOR2X1 U621 ( .A(n604), .B(n603), .Y(n618) );
  NOR2X1 U622 ( .A(\curr_reg[0][6] ), .B(n9), .Y(n605) );
  NOR2X1 U623 ( .A(n740), .B(n605), .Y(n606) );
  OAI21X1 U624 ( .A(\curr_reg[2][6] ), .B(n26), .C(n606), .Y(n608) );
  OAI22X1 U625 ( .A(\curr_reg[6][6] ), .B(n29), .C(\curr_reg[4][6] ), .D(n32), 
        .Y(n607) );
  NOR2X1 U626 ( .A(n608), .B(n607), .Y(n617) );
  OAI22X1 U627 ( .A(\curr_reg[19][6] ), .B(n28), .C(\curr_reg[17][6] ), .D(n30), .Y(n610) );
  OAI22X1 U628 ( .A(\curr_reg[23][6] ), .B(n27), .C(\curr_reg[21][6] ), .D(n31), .Y(n609) );
  NOR2X1 U629 ( .A(n610), .B(n609), .Y(n616) );
  NOR2X1 U630 ( .A(\curr_reg[16][6] ), .B(n9), .Y(n611) );
  NOR2X1 U631 ( .A(n741), .B(n611), .Y(n612) );
  OAI21X1 U632 ( .A(\curr_reg[18][6] ), .B(n26), .C(n612), .Y(n614) );
  OAI22X1 U633 ( .A(\curr_reg[22][6] ), .B(n29), .C(\curr_reg[20][6] ), .D(n32), .Y(n613) );
  NOR2X1 U634 ( .A(n614), .B(n613), .Y(n615) );
  AOI22X1 U635 ( .A(n618), .B(n617), .C(n616), .D(n615), .Y(n619) );
  AOI21X1 U636 ( .A(n620), .B(n619), .C(N156), .Y(n656) );
  OAI22X1 U637 ( .A(\curr_reg[43][6] ), .B(n28), .C(\curr_reg[41][6] ), .D(n30), .Y(n622) );
  OAI22X1 U638 ( .A(\curr_reg[47][6] ), .B(n27), .C(\curr_reg[45][6] ), .D(n31), .Y(n621) );
  NOR2X1 U639 ( .A(n622), .B(n621), .Y(n636) );
  NOR2X1 U640 ( .A(\curr_reg[40][6] ), .B(n9), .Y(n623) );
  NOR2X1 U641 ( .A(n691), .B(n623), .Y(n624) );
  OAI21X1 U642 ( .A(\curr_reg[42][6] ), .B(n26), .C(n624), .Y(n626) );
  OAI22X1 U643 ( .A(\curr_reg[46][6] ), .B(n29), .C(\curr_reg[44][6] ), .D(n32), .Y(n625) );
  NOR2X1 U644 ( .A(n626), .B(n625), .Y(n635) );
  OAI22X1 U645 ( .A(\curr_reg[59][6] ), .B(n28), .C(\curr_reg[57][6] ), .D(n30), .Y(n628) );
  OAI22X1 U646 ( .A(\curr_reg[63][6] ), .B(n27), .C(\curr_reg[61][6] ), .D(n31), .Y(n627) );
  NOR2X1 U647 ( .A(n628), .B(n627), .Y(n634) );
  NOR2X1 U648 ( .A(\curr_reg[56][6] ), .B(n9), .Y(n629) );
  NOR2X1 U649 ( .A(n699), .B(n629), .Y(n630) );
  OAI21X1 U650 ( .A(\curr_reg[58][6] ), .B(n26), .C(n630), .Y(n632) );
  OAI22X1 U651 ( .A(\curr_reg[62][6] ), .B(n29), .C(\curr_reg[60][6] ), .D(n32), .Y(n631) );
  NOR2X1 U652 ( .A(n632), .B(n631), .Y(n633) );
  AOI22X1 U653 ( .A(n636), .B(n635), .C(n634), .D(n633), .Y(n654) );
  OAI22X1 U654 ( .A(\curr_reg[11][6] ), .B(n28), .C(\curr_reg[9][6] ), .D(n30), 
        .Y(n638) );
  OAI22X1 U655 ( .A(\curr_reg[15][6] ), .B(n27), .C(\curr_reg[13][6] ), .D(n31), .Y(n637) );
  NOR2X1 U656 ( .A(n638), .B(n637), .Y(n652) );
  NOR2X1 U657 ( .A(\curr_reg[8][6] ), .B(n9), .Y(n639) );
  NOR2X1 U658 ( .A(n740), .B(n639), .Y(n640) );
  OAI21X1 U659 ( .A(\curr_reg[10][6] ), .B(n26), .C(n640), .Y(n642) );
  OAI22X1 U660 ( .A(\curr_reg[14][6] ), .B(n29), .C(\curr_reg[12][6] ), .D(n32), .Y(n641) );
  NOR2X1 U661 ( .A(n642), .B(n641), .Y(n651) );
  OAI22X1 U662 ( .A(\curr_reg[27][6] ), .B(n28), .C(\curr_reg[25][6] ), .D(n30), .Y(n644) );
  OAI22X1 U663 ( .A(\curr_reg[31][6] ), .B(n27), .C(\curr_reg[29][6] ), .D(n31), .Y(n643) );
  NOR2X1 U664 ( .A(n644), .B(n643), .Y(n650) );
  NOR2X1 U665 ( .A(\curr_reg[24][6] ), .B(n9), .Y(n645) );
  NOR2X1 U666 ( .A(n741), .B(n645), .Y(n646) );
  OAI21X1 U667 ( .A(\curr_reg[26][6] ), .B(n26), .C(n646), .Y(n648) );
  OAI22X1 U668 ( .A(\curr_reg[30][6] ), .B(n29), .C(\curr_reg[28][6] ), .D(n32), .Y(n647) );
  NOR2X1 U669 ( .A(n648), .B(n647), .Y(n649) );
  AOI22X1 U670 ( .A(n652), .B(n651), .C(n650), .D(n649), .Y(n653) );
  AOI21X1 U671 ( .A(n654), .B(n653), .C(n736), .Y(n655) );
  OR2X1 U672 ( .A(n656), .B(n655), .Y(N2039) );
  OAI22X1 U673 ( .A(\curr_reg[35][7] ), .B(n28), .C(\curr_reg[33][7] ), .D(n30), .Y(n658) );
  OAI22X1 U674 ( .A(\curr_reg[39][7] ), .B(n27), .C(\curr_reg[37][7] ), .D(n31), .Y(n657) );
  NOR2X1 U675 ( .A(n658), .B(n657), .Y(n672) );
  NOR2X1 U676 ( .A(\curr_reg[32][7] ), .B(n9), .Y(n659) );
  NOR2X1 U677 ( .A(n691), .B(n659), .Y(n660) );
  OAI21X1 U678 ( .A(\curr_reg[34][7] ), .B(n26), .C(n660), .Y(n662) );
  OAI22X1 U679 ( .A(\curr_reg[38][7] ), .B(n29), .C(\curr_reg[36][7] ), .D(n32), .Y(n661) );
  NOR2X1 U680 ( .A(n662), .B(n661), .Y(n671) );
  OAI22X1 U681 ( .A(\curr_reg[51][7] ), .B(n28), .C(\curr_reg[49][7] ), .D(n30), .Y(n664) );
  OAI22X1 U682 ( .A(\curr_reg[55][7] ), .B(n27), .C(\curr_reg[53][7] ), .D(n31), .Y(n663) );
  NOR2X1 U683 ( .A(n664), .B(n663), .Y(n670) );
  NOR2X1 U684 ( .A(\curr_reg[48][7] ), .B(n9), .Y(n665) );
  NOR2X1 U685 ( .A(n699), .B(n665), .Y(n666) );
  OAI21X1 U686 ( .A(\curr_reg[50][7] ), .B(n26), .C(n666), .Y(n668) );
  OAI22X1 U687 ( .A(\curr_reg[54][7] ), .B(n29), .C(\curr_reg[52][7] ), .D(n32), .Y(n667) );
  NOR2X1 U688 ( .A(n668), .B(n667), .Y(n669) );
  AOI22X1 U689 ( .A(n672), .B(n671), .C(n670), .D(n669), .Y(n690) );
  OAI22X1 U690 ( .A(\curr_reg[3][7] ), .B(n28), .C(\curr_reg[1][7] ), .D(n30), 
        .Y(n674) );
  OAI22X1 U691 ( .A(\curr_reg[7][7] ), .B(n27), .C(\curr_reg[5][7] ), .D(n31), 
        .Y(n673) );
  NOR2X1 U692 ( .A(n674), .B(n673), .Y(n688) );
  NOR2X1 U693 ( .A(\curr_reg[0][7] ), .B(n9), .Y(n675) );
  NOR2X1 U694 ( .A(n740), .B(n675), .Y(n676) );
  OAI21X1 U695 ( .A(\curr_reg[2][7] ), .B(n26), .C(n676), .Y(n678) );
  OAI22X1 U696 ( .A(\curr_reg[6][7] ), .B(n29), .C(\curr_reg[4][7] ), .D(n32), 
        .Y(n677) );
  NOR2X1 U697 ( .A(n678), .B(n677), .Y(n687) );
  OAI22X1 U698 ( .A(\curr_reg[19][7] ), .B(n28), .C(\curr_reg[17][7] ), .D(n30), .Y(n680) );
  OAI22X1 U699 ( .A(\curr_reg[23][7] ), .B(n27), .C(\curr_reg[21][7] ), .D(n31), .Y(n679) );
  NOR2X1 U700 ( .A(n680), .B(n679), .Y(n686) );
  NOR2X1 U701 ( .A(\curr_reg[16][7] ), .B(n9), .Y(n681) );
  NOR2X1 U702 ( .A(n741), .B(n681), .Y(n682) );
  OAI21X1 U703 ( .A(\curr_reg[18][7] ), .B(n26), .C(n682), .Y(n684) );
  OAI22X1 U704 ( .A(\curr_reg[22][7] ), .B(n29), .C(\curr_reg[20][7] ), .D(n32), .Y(n683) );
  NOR2X1 U705 ( .A(n684), .B(n683), .Y(n685) );
  AOI22X1 U706 ( .A(n688), .B(n687), .C(n686), .D(n685), .Y(n689) );
  AOI21X1 U707 ( .A(n690), .B(n689), .C(N156), .Y(n734) );
  OAI22X1 U708 ( .A(\curr_reg[45][7] ), .B(n31), .C(\curr_reg[43][7] ), .D(n28), .Y(n693) );
  OAI21X1 U709 ( .A(\curr_reg[47][7] ), .B(n27), .C(n738), .Y(n692) );
  NOR2X1 U710 ( .A(n693), .B(n692), .Y(n710) );
  NOR2X1 U711 ( .A(\curr_reg[40][7] ), .B(n9), .Y(n695) );
  NOR2X1 U712 ( .A(\curr_reg[42][7] ), .B(n26), .Y(n694) );
  NOR2X1 U713 ( .A(n695), .B(n694), .Y(n696) );
  OAI21X1 U714 ( .A(\curr_reg[44][7] ), .B(n32), .C(n696), .Y(n698) );
  OAI22X1 U715 ( .A(\curr_reg[41][7] ), .B(n30), .C(\curr_reg[46][7] ), .D(n29), .Y(n697) );
  NOR2X1 U716 ( .A(n698), .B(n697), .Y(n709) );
  OAI22X1 U717 ( .A(\curr_reg[61][7] ), .B(n31), .C(\curr_reg[59][7] ), .D(n28), .Y(n701) );
  OAI21X1 U718 ( .A(\curr_reg[63][7] ), .B(n27), .C(n739), .Y(n700) );
  NOR2X1 U719 ( .A(n701), .B(n700), .Y(n708) );
  NOR2X1 U720 ( .A(\curr_reg[56][7] ), .B(n9), .Y(n703) );
  NOR2X1 U721 ( .A(\curr_reg[58][7] ), .B(n26), .Y(n702) );
  NOR2X1 U722 ( .A(n703), .B(n702), .Y(n704) );
  OAI21X1 U723 ( .A(\curr_reg[60][7] ), .B(n32), .C(n704), .Y(n706) );
  OAI22X1 U724 ( .A(\curr_reg[57][7] ), .B(n30), .C(\curr_reg[62][7] ), .D(n29), .Y(n705) );
  NOR2X1 U725 ( .A(n706), .B(n705), .Y(n707) );
  AOI22X1 U726 ( .A(n710), .B(n709), .C(n708), .D(n707), .Y(n732) );
  OAI22X1 U727 ( .A(\curr_reg[13][7] ), .B(n31), .C(\curr_reg[11][7] ), .D(n28), .Y(n713) );
  OAI21X1 U728 ( .A(\curr_reg[15][7] ), .B(n27), .C(n711), .Y(n712) );
  NOR2X1 U729 ( .A(n713), .B(n712), .Y(n730) );
  NOR2X1 U730 ( .A(\curr_reg[8][7] ), .B(n9), .Y(n715) );
  NOR2X1 U731 ( .A(\curr_reg[10][7] ), .B(n26), .Y(n714) );
  NOR2X1 U732 ( .A(n715), .B(n714), .Y(n716) );
  OAI21X1 U733 ( .A(\curr_reg[12][7] ), .B(n32), .C(n716), .Y(n718) );
  OAI22X1 U734 ( .A(\curr_reg[9][7] ), .B(n30), .C(\curr_reg[14][7] ), .D(n29), 
        .Y(n717) );
  NOR2X1 U735 ( .A(n718), .B(n717), .Y(n729) );
  OAI22X1 U736 ( .A(\curr_reg[29][7] ), .B(n31), .C(\curr_reg[27][7] ), .D(n28), .Y(n721) );
  OAI21X1 U737 ( .A(\curr_reg[31][7] ), .B(n27), .C(n719), .Y(n720) );
  NOR2X1 U738 ( .A(n721), .B(n720), .Y(n728) );
  NOR2X1 U739 ( .A(\curr_reg[24][7] ), .B(n9), .Y(n723) );
  NOR2X1 U740 ( .A(\curr_reg[26][7] ), .B(n26), .Y(n722) );
  NOR2X1 U741 ( .A(n723), .B(n722), .Y(n724) );
  OAI21X1 U742 ( .A(\curr_reg[28][7] ), .B(n32), .C(n724), .Y(n726) );
  OAI22X1 U743 ( .A(\curr_reg[25][7] ), .B(n30), .C(\curr_reg[30][7] ), .D(n29), .Y(n725) );
  NOR2X1 U744 ( .A(n726), .B(n725), .Y(n727) );
  AOI22X1 U745 ( .A(n730), .B(n729), .C(n728), .D(n727), .Y(n731) );
  AOI21X1 U746 ( .A(n732), .B(n731), .C(n736), .Y(n733) );
  OR2X1 U747 ( .A(n734), .B(n733), .Y(N2038) );
  INVX2 U748 ( .A(N157), .Y(n735) );
  INVX2 U749 ( .A(N156), .Y(n736) );
  INVX2 U750 ( .A(N154), .Y(n737) );
  INVX2 U751 ( .A(n711), .Y(n740) );
  INVX2 U752 ( .A(n719), .Y(n741) );
  INVX2 U753 ( .A(N153), .Y(n742) );
  INVX1 U754 ( .A(n743), .Y(n843) );
  MUX2X1 U755 ( .B(tx_packet_data[7]), .A(N2038), .S(n744), .Y(n743) );
  INVX1 U756 ( .A(n745), .Y(n841) );
  MUX2X1 U757 ( .B(tx_packet_data[6]), .A(N2039), .S(n744), .Y(n745) );
  INVX1 U758 ( .A(n746), .Y(n839) );
  MUX2X1 U759 ( .B(tx_packet_data[5]), .A(N2040), .S(n744), .Y(n746) );
  INVX1 U760 ( .A(n747), .Y(n837) );
  MUX2X1 U761 ( .B(tx_packet_data[4]), .A(N2041), .S(n744), .Y(n747) );
  INVX1 U762 ( .A(n748), .Y(n835) );
  MUX2X1 U763 ( .B(tx_packet_data[3]), .A(N2042), .S(n744), .Y(n748) );
  INVX1 U764 ( .A(n749), .Y(n833) );
  MUX2X1 U765 ( .B(tx_packet_data[2]), .A(N2043), .S(n744), .Y(n749) );
  INVX1 U766 ( .A(n750), .Y(n831) );
  MUX2X1 U767 ( .B(tx_packet_data[1]), .A(N2044), .S(n744), .Y(n750) );
  INVX1 U768 ( .A(n751), .Y(n829) );
  MUX2X1 U769 ( .B(tx_packet_data[0]), .A(N2045), .S(n744), .Y(n751) );
  MUX2X1 U770 ( .B(n752), .A(n753), .S(N153), .Y(n1921) );
  MUX2X1 U771 ( .B(n754), .A(n755), .S(N154), .Y(n1920) );
  NAND2X1 U772 ( .A(n756), .B(N153), .Y(n754) );
  MUX2X1 U773 ( .B(n757), .A(n758), .S(N155), .Y(n1919) );
  INVX1 U774 ( .A(n759), .Y(n758) );
  OAI21X1 U775 ( .A(n752), .B(N154), .C(n755), .Y(n759) );
  INVX1 U776 ( .A(n760), .Y(n755) );
  OAI21X1 U777 ( .A(N153), .B(n752), .C(n753), .Y(n760) );
  INVX1 U778 ( .A(n761), .Y(n753) );
  NAND3X1 U779 ( .A(N154), .B(N153), .C(n756), .Y(n757) );
  MUX2X1 U780 ( .B(n762), .A(n763), .S(N156), .Y(n1918) );
  NAND2X1 U781 ( .A(n756), .B(n764), .Y(n762) );
  MUX2X1 U782 ( .B(n765), .A(n766), .S(N157), .Y(n1917) );
  INVX1 U783 ( .A(n767), .Y(n766) );
  NAND3X1 U784 ( .A(N156), .B(n764), .C(n756), .Y(n765) );
  OAI21X1 U785 ( .A(n768), .B(n752), .C(n769), .Y(n1916) );
  OAI21X1 U786 ( .A(n756), .B(n767), .C(N158), .Y(n769) );
  OAI21X1 U787 ( .A(N156), .B(n752), .C(n763), .Y(n767) );
  AOI21X1 U788 ( .A(n770), .B(n756), .C(n761), .Y(n763) );
  INVX1 U789 ( .A(n752), .Y(n756) );
  OAI21X1 U790 ( .A(n744), .B(n771), .C(n772), .Y(n752) );
  AOI21X1 U791 ( .A(N158), .B(n773), .C(n761), .Y(n772) );
  INVX1 U792 ( .A(n768), .Y(n773) );
  AND2X1 U793 ( .A(get_tx_packet_data), .B(n774), .Y(n744) );
  NAND3X1 U794 ( .A(N156), .B(n764), .C(N157), .Y(n768) );
  INVX1 U795 ( .A(n770), .Y(n764) );
  NAND3X1 U796 ( .A(N154), .B(N153), .C(N155), .Y(n770) );
  INVX1 U797 ( .A(n775), .Y(n1915) );
  AOI21X1 U798 ( .A(n776), .B(N2003), .C(n777), .Y(n775) );
  MUX2X1 U799 ( .B(n778), .A(n779), .S(buffer_occupancy[0]), .Y(n777) );
  OAI21X1 U800 ( .A(n780), .B(n778), .C(n781), .Y(n1914) );
  AOI22X1 U801 ( .A(buffer_occupancy[1]), .B(n782), .C(N2004), .D(n776), .Y(
        n781) );
  OAI21X1 U802 ( .A(n783), .B(n778), .C(n779), .Y(n782) );
  INVX1 U803 ( .A(buffer_occupancy[0]), .Y(n783) );
  OAI21X1 U804 ( .A(n784), .B(n785), .C(n786), .Y(n1913) );
  MUX2X1 U805 ( .B(n787), .A(n788), .S(buffer_occupancy[2]), .Y(n786) );
  NOR2X1 U806 ( .A(n780), .B(n778), .Y(n787) );
  INVX1 U807 ( .A(n789), .Y(n780) );
  INVX1 U808 ( .A(N2005), .Y(n785) );
  OAI21X1 U809 ( .A(n790), .B(n778), .C(n791), .Y(n1912) );
  AOI22X1 U810 ( .A(buffer_occupancy[3]), .B(n792), .C(N2006), .D(n776), .Y(
        n791) );
  OAI21X1 U811 ( .A(n778), .B(n793), .C(n794), .Y(n792) );
  INVX1 U812 ( .A(n788), .Y(n794) );
  OAI21X1 U813 ( .A(n789), .B(n778), .C(n779), .Y(n788) );
  INVX1 U814 ( .A(n795), .Y(n1911) );
  AOI21X1 U815 ( .A(n776), .B(N2007), .C(n796), .Y(n795) );
  OAI22X1 U816 ( .A(n778), .B(n797), .C(n798), .D(n799), .Y(n796) );
  INVX1 U817 ( .A(n784), .Y(n776) );
  OAI21X1 U818 ( .A(n784), .B(n800), .C(n801), .Y(n1910) );
  MUX2X1 U819 ( .B(n802), .A(n803), .S(buffer_occupancy[5]), .Y(n801) );
  NOR2X1 U820 ( .A(n797), .B(n778), .Y(n802) );
  INVX1 U821 ( .A(N2008), .Y(n800) );
  NAND3X1 U822 ( .A(n774), .B(n804), .C(n805), .Y(n784) );
  OAI21X1 U823 ( .A(n806), .B(n807), .C(n808), .Y(n1909) );
  OAI21X1 U824 ( .A(n809), .B(n803), .C(buffer_occupancy[6]), .Y(n808) );
  OAI21X1 U825 ( .A(n778), .B(n798), .C(n799), .Y(n803) );
  INVX1 U826 ( .A(n810), .Y(n799) );
  OAI21X1 U827 ( .A(n811), .B(n778), .C(n779), .Y(n810) );
  NOR2X1 U828 ( .A(n778), .B(n812), .Y(n809) );
  INVX1 U829 ( .A(buffer_occupancy[5]), .Y(n812) );
  NAND3X1 U830 ( .A(n774), .B(n779), .C(n813), .Y(n778) );
  AOI21X1 U831 ( .A(n814), .B(n815), .C(n805), .Y(n813) );
  INVX1 U832 ( .A(n806), .Y(n805) );
  INVX1 U833 ( .A(n797), .Y(n815) );
  NAND2X1 U834 ( .A(n811), .B(n798), .Y(n797) );
  INVX1 U835 ( .A(buffer_occupancy[4]), .Y(n798) );
  INVX1 U836 ( .A(n790), .Y(n811) );
  NAND3X1 U837 ( .A(n793), .B(n816), .C(n789), .Y(n790) );
  NOR2X1 U838 ( .A(buffer_occupancy[0]), .B(buffer_occupancy[1]), .Y(n789) );
  INVX1 U839 ( .A(buffer_occupancy[3]), .Y(n816) );
  INVX1 U840 ( .A(buffer_occupancy[2]), .Y(n793) );
  NOR2X1 U841 ( .A(buffer_occupancy[6]), .B(buffer_occupancy[5]), .Y(n814) );
  OAI21X1 U842 ( .A(n761), .B(n817), .C(n806), .Y(n779) );
  NOR2X1 U843 ( .A(n818), .B(get_rx_data), .Y(n761) );
  INVX1 U844 ( .A(n771), .Y(n818) );
  OAI21X1 U845 ( .A(N2009), .B(buffer_occupancy[6]), .C(n774), .Y(n807) );
  OAI21X1 U846 ( .A(store_tx_data), .B(store_rx_packet_data), .C(n819), .Y(
        n806) );
  NOR2X1 U847 ( .A(get_tx_packet_data), .B(get_rx_data), .Y(n819) );
  MUX2X1 U848 ( .B(n820), .A(n821), .S(curr_write_ptr[4]), .Y(n1908) );
  INVX1 U849 ( .A(n822), .Y(n821) );
  NAND3X1 U850 ( .A(n823), .B(curr_write_ptr[3]), .C(n824), .Y(n820) );
  MUX2X1 U851 ( .B(n825), .A(n826), .S(curr_write_ptr[0]), .Y(n1907) );
  MUX2X1 U852 ( .B(n827), .A(n1922), .S(curr_write_ptr[1]), .Y(n1906) );
  INVX1 U853 ( .A(n1923), .Y(n1922) );
  NAND2X1 U854 ( .A(n824), .B(curr_write_ptr[0]), .Y(n827) );
  OAI21X1 U855 ( .A(n825), .B(n1924), .C(n1925), .Y(n1905) );
  OAI21X1 U856 ( .A(n1926), .B(n1923), .C(curr_write_ptr[2]), .Y(n1925) );
  OAI21X1 U857 ( .A(curr_write_ptr[0]), .B(n825), .C(n826), .Y(n1923) );
  NOR2X1 U858 ( .A(curr_write_ptr[1]), .B(n825), .Y(n1926) );
  MUX2X1 U859 ( .B(n1927), .A(n1928), .S(curr_write_ptr[3]), .Y(n1904) );
  NAND2X1 U860 ( .A(n824), .B(n823), .Y(n1927) );
  OAI21X1 U861 ( .A(n825), .B(n1929), .C(n1930), .Y(n1903) );
  OAI21X1 U862 ( .A(n824), .B(n822), .C(curr_write_ptr[5]), .Y(n1930) );
  OAI21X1 U863 ( .A(curr_write_ptr[3]), .B(n825), .C(n1928), .Y(n822) );
  INVX1 U864 ( .A(n1931), .Y(n1928) );
  OAI21X1 U865 ( .A(n823), .B(n825), .C(n826), .Y(n1931) );
  INVX1 U866 ( .A(n1932), .Y(n823) );
  INVX1 U867 ( .A(n825), .Y(n824) );
  NAND3X1 U868 ( .A(n826), .B(n1933), .C(n774), .Y(n825) );
  OAI21X1 U869 ( .A(buffer_occupancy[6]), .B(n1934), .C(n774), .Y(n826) );
  NOR2X1 U870 ( .A(store_rx_packet_data), .B(store_tx_data), .Y(n1934) );
  OAI21X1 U871 ( .A(n11), .B(n1933), .C(n1936), .Y(n1902) );
  NAND2X1 U872 ( .A(\curr_reg[63][0] ), .B(n1937), .Y(n1936) );
  OAI21X1 U873 ( .A(n13), .B(n1933), .C(n1939), .Y(n1901) );
  NAND2X1 U874 ( .A(\curr_reg[63][1] ), .B(n1937), .Y(n1939) );
  OAI21X1 U875 ( .A(n15), .B(n1933), .C(n1941), .Y(n1900) );
  NAND2X1 U876 ( .A(\curr_reg[63][2] ), .B(n1937), .Y(n1941) );
  OAI21X1 U877 ( .A(n17), .B(n1933), .C(n1943), .Y(n1899) );
  NAND2X1 U878 ( .A(\curr_reg[63][3] ), .B(n1937), .Y(n1943) );
  OAI21X1 U879 ( .A(n19), .B(n1933), .C(n1945), .Y(n1898) );
  NAND2X1 U880 ( .A(\curr_reg[63][4] ), .B(n1937), .Y(n1945) );
  OAI21X1 U881 ( .A(n21), .B(n1933), .C(n1947), .Y(n1897) );
  NAND2X1 U882 ( .A(\curr_reg[63][5] ), .B(n1937), .Y(n1947) );
  OAI21X1 U883 ( .A(n23), .B(n1933), .C(n1949), .Y(n1896) );
  NAND2X1 U884 ( .A(\curr_reg[63][6] ), .B(n1937), .Y(n1949) );
  OAI21X1 U885 ( .A(n25), .B(n1933), .C(n1951), .Y(n1895) );
  NAND2X1 U886 ( .A(\curr_reg[63][7] ), .B(n1937), .Y(n1951) );
  NAND2X1 U887 ( .A(n1952), .B(n1953), .Y(n1937) );
  INVX1 U888 ( .A(n1952), .Y(n1933) );
  NOR2X1 U889 ( .A(n1932), .B(n1954), .Y(n1952) );
  OAI21X1 U890 ( .A(n11), .B(n1955), .C(n1956), .Y(n1894) );
  NAND2X1 U891 ( .A(\curr_reg[62][0] ), .B(n1957), .Y(n1956) );
  OAI21X1 U892 ( .A(n13), .B(n1955), .C(n1958), .Y(n1893) );
  NAND2X1 U893 ( .A(\curr_reg[62][1] ), .B(n1957), .Y(n1958) );
  OAI21X1 U894 ( .A(n15), .B(n1955), .C(n1959), .Y(n1892) );
  NAND2X1 U895 ( .A(\curr_reg[62][2] ), .B(n1957), .Y(n1959) );
  OAI21X1 U896 ( .A(n17), .B(n1955), .C(n1960), .Y(n1891) );
  NAND2X1 U897 ( .A(\curr_reg[62][3] ), .B(n1957), .Y(n1960) );
  OAI21X1 U898 ( .A(n19), .B(n1955), .C(n1961), .Y(n1890) );
  NAND2X1 U899 ( .A(\curr_reg[62][4] ), .B(n1957), .Y(n1961) );
  OAI21X1 U900 ( .A(n21), .B(n1955), .C(n1962), .Y(n1889) );
  NAND2X1 U901 ( .A(\curr_reg[62][5] ), .B(n1957), .Y(n1962) );
  OAI21X1 U902 ( .A(n23), .B(n1955), .C(n1963), .Y(n1888) );
  NAND2X1 U903 ( .A(\curr_reg[62][6] ), .B(n1957), .Y(n1963) );
  OAI21X1 U904 ( .A(n25), .B(n1955), .C(n1964), .Y(n1887) );
  NAND2X1 U905 ( .A(\curr_reg[62][7] ), .B(n1957), .Y(n1964) );
  NAND2X1 U906 ( .A(n1965), .B(n1953), .Y(n1957) );
  INVX1 U907 ( .A(n1965), .Y(n1955) );
  NOR2X1 U908 ( .A(n1966), .B(n1954), .Y(n1965) );
  OAI21X1 U909 ( .A(n11), .B(n1967), .C(n1968), .Y(n1886) );
  NAND2X1 U910 ( .A(\curr_reg[61][0] ), .B(n1969), .Y(n1968) );
  OAI21X1 U911 ( .A(n13), .B(n1967), .C(n1970), .Y(n1885) );
  NAND2X1 U912 ( .A(\curr_reg[61][1] ), .B(n1969), .Y(n1970) );
  OAI21X1 U913 ( .A(n15), .B(n1967), .C(n1971), .Y(n1884) );
  NAND2X1 U914 ( .A(\curr_reg[61][2] ), .B(n1969), .Y(n1971) );
  OAI21X1 U915 ( .A(n17), .B(n1967), .C(n1972), .Y(n1883) );
  NAND2X1 U916 ( .A(\curr_reg[61][3] ), .B(n1969), .Y(n1972) );
  OAI21X1 U917 ( .A(n19), .B(n1967), .C(n1973), .Y(n1882) );
  NAND2X1 U918 ( .A(\curr_reg[61][4] ), .B(n1969), .Y(n1973) );
  OAI21X1 U919 ( .A(n21), .B(n1967), .C(n1974), .Y(n1881) );
  NAND2X1 U920 ( .A(\curr_reg[61][5] ), .B(n1969), .Y(n1974) );
  OAI21X1 U921 ( .A(n23), .B(n1967), .C(n1975), .Y(n1880) );
  NAND2X1 U922 ( .A(\curr_reg[61][6] ), .B(n1969), .Y(n1975) );
  OAI21X1 U923 ( .A(n25), .B(n1967), .C(n1976), .Y(n1879) );
  NAND2X1 U924 ( .A(\curr_reg[61][7] ), .B(n1969), .Y(n1976) );
  NAND2X1 U925 ( .A(n1977), .B(n1953), .Y(n1969) );
  INVX1 U926 ( .A(n1977), .Y(n1967) );
  NOR2X1 U927 ( .A(n1978), .B(n1954), .Y(n1977) );
  OAI21X1 U928 ( .A(n11), .B(n1979), .C(n1980), .Y(n1878) );
  NAND2X1 U929 ( .A(\curr_reg[60][0] ), .B(n1981), .Y(n1980) );
  OAI21X1 U930 ( .A(n13), .B(n1979), .C(n1982), .Y(n1877) );
  NAND2X1 U931 ( .A(\curr_reg[60][1] ), .B(n1981), .Y(n1982) );
  OAI21X1 U932 ( .A(n15), .B(n1979), .C(n1983), .Y(n1876) );
  NAND2X1 U933 ( .A(\curr_reg[60][2] ), .B(n1981), .Y(n1983) );
  OAI21X1 U934 ( .A(n17), .B(n1979), .C(n1984), .Y(n1875) );
  NAND2X1 U935 ( .A(\curr_reg[60][3] ), .B(n1981), .Y(n1984) );
  OAI21X1 U936 ( .A(n19), .B(n1979), .C(n1985), .Y(n1874) );
  NAND2X1 U937 ( .A(\curr_reg[60][4] ), .B(n1981), .Y(n1985) );
  OAI21X1 U938 ( .A(n21), .B(n1979), .C(n1986), .Y(n1873) );
  NAND2X1 U939 ( .A(\curr_reg[60][5] ), .B(n1981), .Y(n1986) );
  OAI21X1 U940 ( .A(n23), .B(n1979), .C(n1987), .Y(n1872) );
  NAND2X1 U941 ( .A(\curr_reg[60][6] ), .B(n1981), .Y(n1987) );
  OAI21X1 U942 ( .A(n25), .B(n1979), .C(n1988), .Y(n1871) );
  NAND2X1 U943 ( .A(\curr_reg[60][7] ), .B(n1981), .Y(n1988) );
  NAND2X1 U944 ( .A(n1989), .B(n1953), .Y(n1981) );
  INVX1 U945 ( .A(n1989), .Y(n1979) );
  NOR2X1 U946 ( .A(n1990), .B(n1954), .Y(n1989) );
  OAI21X1 U947 ( .A(n11), .B(n1991), .C(n1992), .Y(n1870) );
  NAND2X1 U948 ( .A(\curr_reg[59][0] ), .B(n1993), .Y(n1992) );
  OAI21X1 U949 ( .A(n13), .B(n1991), .C(n1994), .Y(n1869) );
  NAND2X1 U950 ( .A(\curr_reg[59][1] ), .B(n1993), .Y(n1994) );
  OAI21X1 U951 ( .A(n15), .B(n1991), .C(n1995), .Y(n1868) );
  NAND2X1 U952 ( .A(\curr_reg[59][2] ), .B(n1993), .Y(n1995) );
  OAI21X1 U953 ( .A(n17), .B(n1991), .C(n1996), .Y(n1867) );
  NAND2X1 U954 ( .A(\curr_reg[59][3] ), .B(n1993), .Y(n1996) );
  OAI21X1 U955 ( .A(n19), .B(n1991), .C(n1997), .Y(n1866) );
  NAND2X1 U956 ( .A(\curr_reg[59][4] ), .B(n1993), .Y(n1997) );
  OAI21X1 U957 ( .A(n21), .B(n1991), .C(n1998), .Y(n1865) );
  NAND2X1 U958 ( .A(\curr_reg[59][5] ), .B(n1993), .Y(n1998) );
  OAI21X1 U959 ( .A(n23), .B(n1991), .C(n1999), .Y(n1864) );
  NAND2X1 U960 ( .A(\curr_reg[59][6] ), .B(n1993), .Y(n1999) );
  OAI21X1 U961 ( .A(n25), .B(n1991), .C(n2000), .Y(n1863) );
  NAND2X1 U962 ( .A(\curr_reg[59][7] ), .B(n1993), .Y(n2000) );
  NAND2X1 U963 ( .A(n2001), .B(n1953), .Y(n1993) );
  INVX1 U964 ( .A(n2001), .Y(n1991) );
  NOR2X1 U965 ( .A(n1924), .B(n1954), .Y(n2001) );
  OAI21X1 U966 ( .A(n11), .B(n2002), .C(n2003), .Y(n1862) );
  NAND2X1 U967 ( .A(\curr_reg[58][0] ), .B(n2004), .Y(n2003) );
  OAI21X1 U968 ( .A(n13), .B(n2002), .C(n2005), .Y(n1861) );
  NAND2X1 U969 ( .A(\curr_reg[58][1] ), .B(n2004), .Y(n2005) );
  OAI21X1 U970 ( .A(n15), .B(n2002), .C(n2006), .Y(n1860) );
  NAND2X1 U971 ( .A(\curr_reg[58][2] ), .B(n2004), .Y(n2006) );
  OAI21X1 U972 ( .A(n17), .B(n2002), .C(n2007), .Y(n1859) );
  NAND2X1 U973 ( .A(\curr_reg[58][3] ), .B(n2004), .Y(n2007) );
  OAI21X1 U974 ( .A(n19), .B(n2002), .C(n2008), .Y(n1858) );
  NAND2X1 U975 ( .A(\curr_reg[58][4] ), .B(n2004), .Y(n2008) );
  OAI21X1 U976 ( .A(n21), .B(n2002), .C(n2009), .Y(n1857) );
  NAND2X1 U977 ( .A(\curr_reg[58][5] ), .B(n2004), .Y(n2009) );
  OAI21X1 U978 ( .A(n23), .B(n2002), .C(n2010), .Y(n1856) );
  NAND2X1 U979 ( .A(\curr_reg[58][6] ), .B(n2004), .Y(n2010) );
  OAI21X1 U980 ( .A(n25), .B(n2002), .C(n2011), .Y(n1855) );
  NAND2X1 U981 ( .A(\curr_reg[58][7] ), .B(n2004), .Y(n2011) );
  NAND2X1 U982 ( .A(n2012), .B(n1953), .Y(n2004) );
  INVX1 U983 ( .A(n2012), .Y(n2002) );
  NOR2X1 U984 ( .A(n2013), .B(n1954), .Y(n2012) );
  OAI21X1 U985 ( .A(n11), .B(n2014), .C(n2015), .Y(n1854) );
  NAND2X1 U986 ( .A(\curr_reg[57][0] ), .B(n2016), .Y(n2015) );
  OAI21X1 U987 ( .A(n13), .B(n2014), .C(n2017), .Y(n1853) );
  NAND2X1 U988 ( .A(\curr_reg[57][1] ), .B(n2016), .Y(n2017) );
  OAI21X1 U989 ( .A(n15), .B(n2014), .C(n2018), .Y(n1852) );
  NAND2X1 U990 ( .A(\curr_reg[57][2] ), .B(n2016), .Y(n2018) );
  OAI21X1 U991 ( .A(n17), .B(n2014), .C(n2019), .Y(n1851) );
  NAND2X1 U992 ( .A(\curr_reg[57][3] ), .B(n2016), .Y(n2019) );
  OAI21X1 U993 ( .A(n19), .B(n2014), .C(n2020), .Y(n1850) );
  NAND2X1 U994 ( .A(\curr_reg[57][4] ), .B(n2016), .Y(n2020) );
  OAI21X1 U995 ( .A(n21), .B(n2014), .C(n2021), .Y(n1849) );
  NAND2X1 U996 ( .A(\curr_reg[57][5] ), .B(n2016), .Y(n2021) );
  OAI21X1 U997 ( .A(n23), .B(n2014), .C(n2022), .Y(n1848) );
  NAND2X1 U998 ( .A(\curr_reg[57][6] ), .B(n2016), .Y(n2022) );
  OAI21X1 U999 ( .A(n25), .B(n2014), .C(n2023), .Y(n1847) );
  NAND2X1 U1000 ( .A(\curr_reg[57][7] ), .B(n2016), .Y(n2023) );
  NAND2X1 U1001 ( .A(n2024), .B(n1953), .Y(n2016) );
  INVX1 U1002 ( .A(n2024), .Y(n2014) );
  NOR2X1 U1003 ( .A(n2025), .B(n1954), .Y(n2024) );
  OAI21X1 U1004 ( .A(n11), .B(n2026), .C(n2027), .Y(n1846) );
  NAND2X1 U1005 ( .A(\curr_reg[56][0] ), .B(n2028), .Y(n2027) );
  OAI21X1 U1006 ( .A(n13), .B(n2026), .C(n2029), .Y(n1845) );
  NAND2X1 U1007 ( .A(\curr_reg[56][1] ), .B(n2028), .Y(n2029) );
  OAI21X1 U1008 ( .A(n15), .B(n2026), .C(n2030), .Y(n1844) );
  NAND2X1 U1009 ( .A(\curr_reg[56][2] ), .B(n2028), .Y(n2030) );
  OAI21X1 U1010 ( .A(n17), .B(n2026), .C(n2031), .Y(n1843) );
  NAND2X1 U1011 ( .A(\curr_reg[56][3] ), .B(n2028), .Y(n2031) );
  OAI21X1 U1012 ( .A(n19), .B(n2026), .C(n2032), .Y(n1842) );
  NAND2X1 U1013 ( .A(\curr_reg[56][4] ), .B(n2028), .Y(n2032) );
  OAI21X1 U1014 ( .A(n21), .B(n2026), .C(n2033), .Y(n1841) );
  NAND2X1 U1015 ( .A(\curr_reg[56][5] ), .B(n2028), .Y(n2033) );
  OAI21X1 U1016 ( .A(n23), .B(n2026), .C(n2034), .Y(n1840) );
  NAND2X1 U1017 ( .A(\curr_reg[56][6] ), .B(n2028), .Y(n2034) );
  OAI21X1 U1018 ( .A(n25), .B(n2026), .C(n2035), .Y(n1839) );
  NAND2X1 U1019 ( .A(\curr_reg[56][7] ), .B(n2028), .Y(n2035) );
  NAND2X1 U1020 ( .A(n2036), .B(n1953), .Y(n2028) );
  INVX1 U1021 ( .A(n2036), .Y(n2026) );
  NOR2X1 U1022 ( .A(n2037), .B(n1954), .Y(n2036) );
  NAND3X1 U1023 ( .A(curr_write_ptr[4]), .B(curr_write_ptr[3]), .C(
        curr_write_ptr[5]), .Y(n1954) );
  OAI21X1 U1024 ( .A(n11), .B(n2038), .C(n2039), .Y(n1838) );
  NAND2X1 U1025 ( .A(\curr_reg[55][0] ), .B(n2040), .Y(n2039) );
  OAI21X1 U1026 ( .A(n13), .B(n2038), .C(n2041), .Y(n1837) );
  NAND2X1 U1027 ( .A(\curr_reg[55][1] ), .B(n2040), .Y(n2041) );
  OAI21X1 U1028 ( .A(n15), .B(n2038), .C(n2042), .Y(n1836) );
  NAND2X1 U1029 ( .A(\curr_reg[55][2] ), .B(n2040), .Y(n2042) );
  OAI21X1 U1030 ( .A(n17), .B(n2038), .C(n2043), .Y(n1835) );
  NAND2X1 U1031 ( .A(\curr_reg[55][3] ), .B(n2040), .Y(n2043) );
  OAI21X1 U1032 ( .A(n19), .B(n2038), .C(n2044), .Y(n1834) );
  NAND2X1 U1033 ( .A(\curr_reg[55][4] ), .B(n2040), .Y(n2044) );
  OAI21X1 U1034 ( .A(n21), .B(n2038), .C(n2045), .Y(n1833) );
  NAND2X1 U1035 ( .A(\curr_reg[55][5] ), .B(n2040), .Y(n2045) );
  OAI21X1 U1036 ( .A(n23), .B(n2038), .C(n2046), .Y(n1832) );
  NAND2X1 U1037 ( .A(\curr_reg[55][6] ), .B(n2040), .Y(n2046) );
  OAI21X1 U1038 ( .A(n25), .B(n2038), .C(n2047), .Y(n1831) );
  NAND2X1 U1039 ( .A(\curr_reg[55][7] ), .B(n2040), .Y(n2047) );
  NAND2X1 U1040 ( .A(n2048), .B(n1953), .Y(n2040) );
  INVX1 U1041 ( .A(n2048), .Y(n2038) );
  NOR2X1 U1042 ( .A(n2049), .B(n1932), .Y(n2048) );
  OAI21X1 U1043 ( .A(n11), .B(n2050), .C(n2051), .Y(n1830) );
  NAND2X1 U1044 ( .A(\curr_reg[54][0] ), .B(n2052), .Y(n2051) );
  OAI21X1 U1045 ( .A(n13), .B(n2050), .C(n2053), .Y(n1829) );
  NAND2X1 U1046 ( .A(\curr_reg[54][1] ), .B(n2052), .Y(n2053) );
  OAI21X1 U1047 ( .A(n15), .B(n2050), .C(n2054), .Y(n1828) );
  NAND2X1 U1048 ( .A(\curr_reg[54][2] ), .B(n2052), .Y(n2054) );
  OAI21X1 U1049 ( .A(n17), .B(n2050), .C(n2055), .Y(n1827) );
  NAND2X1 U1050 ( .A(\curr_reg[54][3] ), .B(n2052), .Y(n2055) );
  OAI21X1 U1051 ( .A(n19), .B(n2050), .C(n2056), .Y(n1826) );
  NAND2X1 U1052 ( .A(\curr_reg[54][4] ), .B(n2052), .Y(n2056) );
  OAI21X1 U1053 ( .A(n21), .B(n2050), .C(n2057), .Y(n1825) );
  NAND2X1 U1054 ( .A(\curr_reg[54][5] ), .B(n2052), .Y(n2057) );
  OAI21X1 U1055 ( .A(n23), .B(n2050), .C(n2058), .Y(n1824) );
  NAND2X1 U1056 ( .A(\curr_reg[54][6] ), .B(n2052), .Y(n2058) );
  OAI21X1 U1057 ( .A(n25), .B(n2050), .C(n2059), .Y(n1823) );
  NAND2X1 U1058 ( .A(\curr_reg[54][7] ), .B(n2052), .Y(n2059) );
  NAND2X1 U1059 ( .A(n2060), .B(n1953), .Y(n2052) );
  INVX1 U1060 ( .A(n2060), .Y(n2050) );
  NOR2X1 U1061 ( .A(n2049), .B(n1966), .Y(n2060) );
  OAI21X1 U1062 ( .A(n11), .B(n2061), .C(n2062), .Y(n1822) );
  NAND2X1 U1063 ( .A(\curr_reg[53][0] ), .B(n2063), .Y(n2062) );
  OAI21X1 U1064 ( .A(n13), .B(n2061), .C(n2064), .Y(n1821) );
  NAND2X1 U1065 ( .A(\curr_reg[53][1] ), .B(n2063), .Y(n2064) );
  OAI21X1 U1066 ( .A(n15), .B(n2061), .C(n2065), .Y(n1820) );
  NAND2X1 U1067 ( .A(\curr_reg[53][2] ), .B(n2063), .Y(n2065) );
  OAI21X1 U1068 ( .A(n17), .B(n2061), .C(n2066), .Y(n1819) );
  NAND2X1 U1069 ( .A(\curr_reg[53][3] ), .B(n2063), .Y(n2066) );
  OAI21X1 U1070 ( .A(n19), .B(n2061), .C(n2067), .Y(n1818) );
  NAND2X1 U1071 ( .A(\curr_reg[53][4] ), .B(n2063), .Y(n2067) );
  OAI21X1 U1072 ( .A(n21), .B(n2061), .C(n2068), .Y(n1817) );
  NAND2X1 U1073 ( .A(\curr_reg[53][5] ), .B(n2063), .Y(n2068) );
  OAI21X1 U1074 ( .A(n23), .B(n2061), .C(n2069), .Y(n1816) );
  NAND2X1 U1075 ( .A(\curr_reg[53][6] ), .B(n2063), .Y(n2069) );
  OAI21X1 U1076 ( .A(n25), .B(n2061), .C(n2070), .Y(n1815) );
  NAND2X1 U1077 ( .A(\curr_reg[53][7] ), .B(n2063), .Y(n2070) );
  NAND2X1 U1078 ( .A(n2071), .B(n1953), .Y(n2063) );
  INVX1 U1079 ( .A(n2071), .Y(n2061) );
  NOR2X1 U1080 ( .A(n2049), .B(n1978), .Y(n2071) );
  OAI21X1 U1081 ( .A(n11), .B(n2072), .C(n2073), .Y(n1814) );
  NAND2X1 U1082 ( .A(\curr_reg[52][0] ), .B(n2074), .Y(n2073) );
  OAI21X1 U1083 ( .A(n13), .B(n2072), .C(n2075), .Y(n1813) );
  NAND2X1 U1084 ( .A(\curr_reg[52][1] ), .B(n2074), .Y(n2075) );
  OAI21X1 U1085 ( .A(n15), .B(n2072), .C(n2076), .Y(n1812) );
  NAND2X1 U1086 ( .A(\curr_reg[52][2] ), .B(n2074), .Y(n2076) );
  OAI21X1 U1087 ( .A(n17), .B(n2072), .C(n2077), .Y(n1811) );
  NAND2X1 U1088 ( .A(\curr_reg[52][3] ), .B(n2074), .Y(n2077) );
  OAI21X1 U1089 ( .A(n19), .B(n2072), .C(n2078), .Y(n1810) );
  NAND2X1 U1090 ( .A(\curr_reg[52][4] ), .B(n2074), .Y(n2078) );
  OAI21X1 U1091 ( .A(n21), .B(n2072), .C(n2079), .Y(n1809) );
  NAND2X1 U1092 ( .A(\curr_reg[52][5] ), .B(n2074), .Y(n2079) );
  OAI21X1 U1093 ( .A(n23), .B(n2072), .C(n2080), .Y(n1808) );
  NAND2X1 U1094 ( .A(\curr_reg[52][6] ), .B(n2074), .Y(n2080) );
  OAI21X1 U1095 ( .A(n25), .B(n2072), .C(n2081), .Y(n1807) );
  NAND2X1 U1096 ( .A(\curr_reg[52][7] ), .B(n2074), .Y(n2081) );
  NAND2X1 U1097 ( .A(n2082), .B(n1953), .Y(n2074) );
  INVX1 U1098 ( .A(n2082), .Y(n2072) );
  NOR2X1 U1099 ( .A(n2049), .B(n1990), .Y(n2082) );
  OAI21X1 U1100 ( .A(n11), .B(n2083), .C(n2084), .Y(n1806) );
  NAND2X1 U1101 ( .A(\curr_reg[51][0] ), .B(n2085), .Y(n2084) );
  OAI21X1 U1102 ( .A(n13), .B(n2083), .C(n2086), .Y(n1805) );
  NAND2X1 U1103 ( .A(\curr_reg[51][1] ), .B(n2085), .Y(n2086) );
  OAI21X1 U1104 ( .A(n15), .B(n2083), .C(n2087), .Y(n1804) );
  NAND2X1 U1105 ( .A(\curr_reg[51][2] ), .B(n2085), .Y(n2087) );
  OAI21X1 U1106 ( .A(n17), .B(n2083), .C(n2088), .Y(n1803) );
  NAND2X1 U1107 ( .A(\curr_reg[51][3] ), .B(n2085), .Y(n2088) );
  OAI21X1 U1108 ( .A(n19), .B(n2083), .C(n2089), .Y(n1802) );
  NAND2X1 U1109 ( .A(\curr_reg[51][4] ), .B(n2085), .Y(n2089) );
  OAI21X1 U1110 ( .A(n21), .B(n2083), .C(n2090), .Y(n1801) );
  NAND2X1 U1111 ( .A(\curr_reg[51][5] ), .B(n2085), .Y(n2090) );
  OAI21X1 U1112 ( .A(n23), .B(n2083), .C(n2091), .Y(n1800) );
  NAND2X1 U1113 ( .A(\curr_reg[51][6] ), .B(n2085), .Y(n2091) );
  OAI21X1 U1114 ( .A(n25), .B(n2083), .C(n2092), .Y(n1799) );
  NAND2X1 U1115 ( .A(\curr_reg[51][7] ), .B(n2085), .Y(n2092) );
  NAND2X1 U1116 ( .A(n2093), .B(n1953), .Y(n2085) );
  INVX1 U1117 ( .A(n2093), .Y(n2083) );
  NOR2X1 U1118 ( .A(n2049), .B(n1924), .Y(n2093) );
  OAI21X1 U1119 ( .A(n11), .B(n2094), .C(n2095), .Y(n1798) );
  NAND2X1 U1120 ( .A(\curr_reg[50][0] ), .B(n2096), .Y(n2095) );
  OAI21X1 U1121 ( .A(n13), .B(n2094), .C(n2097), .Y(n1797) );
  NAND2X1 U1122 ( .A(\curr_reg[50][1] ), .B(n2096), .Y(n2097) );
  OAI21X1 U1123 ( .A(n15), .B(n2094), .C(n2098), .Y(n1796) );
  NAND2X1 U1124 ( .A(\curr_reg[50][2] ), .B(n2096), .Y(n2098) );
  OAI21X1 U1125 ( .A(n17), .B(n2094), .C(n2099), .Y(n1795) );
  NAND2X1 U1126 ( .A(\curr_reg[50][3] ), .B(n2096), .Y(n2099) );
  OAI21X1 U1127 ( .A(n19), .B(n2094), .C(n2100), .Y(n1794) );
  NAND2X1 U1128 ( .A(\curr_reg[50][4] ), .B(n2096), .Y(n2100) );
  OAI21X1 U1129 ( .A(n21), .B(n2094), .C(n2101), .Y(n1793) );
  NAND2X1 U1130 ( .A(\curr_reg[50][5] ), .B(n2096), .Y(n2101) );
  OAI21X1 U1131 ( .A(n23), .B(n2094), .C(n2102), .Y(n1792) );
  NAND2X1 U1132 ( .A(\curr_reg[50][6] ), .B(n2096), .Y(n2102) );
  OAI21X1 U1133 ( .A(n25), .B(n2094), .C(n2103), .Y(n1791) );
  NAND2X1 U1134 ( .A(\curr_reg[50][7] ), .B(n2096), .Y(n2103) );
  NAND2X1 U1135 ( .A(n2104), .B(n1953), .Y(n2096) );
  INVX1 U1136 ( .A(n2104), .Y(n2094) );
  NOR2X1 U1137 ( .A(n2049), .B(n2013), .Y(n2104) );
  OAI21X1 U1138 ( .A(n11), .B(n2105), .C(n2106), .Y(n1790) );
  NAND2X1 U1139 ( .A(\curr_reg[49][0] ), .B(n2107), .Y(n2106) );
  OAI21X1 U1140 ( .A(n13), .B(n2105), .C(n2108), .Y(n1789) );
  NAND2X1 U1141 ( .A(\curr_reg[49][1] ), .B(n2107), .Y(n2108) );
  OAI21X1 U1142 ( .A(n15), .B(n2105), .C(n2109), .Y(n1788) );
  NAND2X1 U1143 ( .A(\curr_reg[49][2] ), .B(n2107), .Y(n2109) );
  OAI21X1 U1144 ( .A(n17), .B(n2105), .C(n2110), .Y(n1787) );
  NAND2X1 U1145 ( .A(\curr_reg[49][3] ), .B(n2107), .Y(n2110) );
  OAI21X1 U1146 ( .A(n19), .B(n2105), .C(n2111), .Y(n1786) );
  NAND2X1 U1147 ( .A(\curr_reg[49][4] ), .B(n2107), .Y(n2111) );
  OAI21X1 U1148 ( .A(n21), .B(n2105), .C(n2112), .Y(n1785) );
  NAND2X1 U1149 ( .A(\curr_reg[49][5] ), .B(n2107), .Y(n2112) );
  OAI21X1 U1150 ( .A(n23), .B(n2105), .C(n2113), .Y(n1784) );
  NAND2X1 U1151 ( .A(\curr_reg[49][6] ), .B(n2107), .Y(n2113) );
  OAI21X1 U1152 ( .A(n25), .B(n2105), .C(n2114), .Y(n1783) );
  NAND2X1 U1153 ( .A(\curr_reg[49][7] ), .B(n2107), .Y(n2114) );
  NAND2X1 U1154 ( .A(n2115), .B(n1953), .Y(n2107) );
  INVX1 U1155 ( .A(n2115), .Y(n2105) );
  NOR2X1 U1156 ( .A(n2049), .B(n2025), .Y(n2115) );
  OAI21X1 U1157 ( .A(n11), .B(n2116), .C(n2117), .Y(n1782) );
  NAND2X1 U1158 ( .A(\curr_reg[48][0] ), .B(n2118), .Y(n2117) );
  OAI21X1 U1159 ( .A(n13), .B(n2116), .C(n2119), .Y(n1781) );
  NAND2X1 U1160 ( .A(\curr_reg[48][1] ), .B(n2118), .Y(n2119) );
  OAI21X1 U1161 ( .A(n15), .B(n2116), .C(n2120), .Y(n1780) );
  NAND2X1 U1162 ( .A(\curr_reg[48][2] ), .B(n2118), .Y(n2120) );
  OAI21X1 U1163 ( .A(n17), .B(n2116), .C(n2121), .Y(n1779) );
  NAND2X1 U1164 ( .A(\curr_reg[48][3] ), .B(n2118), .Y(n2121) );
  OAI21X1 U1165 ( .A(n19), .B(n2116), .C(n2122), .Y(n1778) );
  NAND2X1 U1166 ( .A(\curr_reg[48][4] ), .B(n2118), .Y(n2122) );
  OAI21X1 U1167 ( .A(n21), .B(n2116), .C(n2123), .Y(n1777) );
  NAND2X1 U1168 ( .A(\curr_reg[48][5] ), .B(n2118), .Y(n2123) );
  OAI21X1 U1169 ( .A(n23), .B(n2116), .C(n2124), .Y(n1776) );
  NAND2X1 U1170 ( .A(\curr_reg[48][6] ), .B(n2118), .Y(n2124) );
  OAI21X1 U1171 ( .A(n25), .B(n2116), .C(n2125), .Y(n1775) );
  NAND2X1 U1172 ( .A(\curr_reg[48][7] ), .B(n2118), .Y(n2125) );
  NAND2X1 U1173 ( .A(n2126), .B(n1953), .Y(n2118) );
  INVX1 U1174 ( .A(n2126), .Y(n2116) );
  NOR2X1 U1175 ( .A(n2049), .B(n2037), .Y(n2126) );
  NAND3X1 U1176 ( .A(curr_write_ptr[4]), .B(n2127), .C(curr_write_ptr[5]), .Y(
        n2049) );
  OAI21X1 U1177 ( .A(n11), .B(n2128), .C(n2129), .Y(n1774) );
  NAND2X1 U1178 ( .A(\curr_reg[47][0] ), .B(n2130), .Y(n2129) );
  OAI21X1 U1179 ( .A(n13), .B(n2128), .C(n2131), .Y(n1773) );
  NAND2X1 U1180 ( .A(\curr_reg[47][1] ), .B(n2130), .Y(n2131) );
  OAI21X1 U1181 ( .A(n15), .B(n2128), .C(n2132), .Y(n1772) );
  NAND2X1 U1182 ( .A(\curr_reg[47][2] ), .B(n2130), .Y(n2132) );
  OAI21X1 U1183 ( .A(n17), .B(n2128), .C(n2133), .Y(n1771) );
  NAND2X1 U1184 ( .A(\curr_reg[47][3] ), .B(n2130), .Y(n2133) );
  OAI21X1 U1185 ( .A(n19), .B(n2128), .C(n2134), .Y(n1770) );
  NAND2X1 U1186 ( .A(\curr_reg[47][4] ), .B(n2130), .Y(n2134) );
  OAI21X1 U1187 ( .A(n21), .B(n2128), .C(n2135), .Y(n1769) );
  NAND2X1 U1188 ( .A(\curr_reg[47][5] ), .B(n2130), .Y(n2135) );
  OAI21X1 U1189 ( .A(n23), .B(n2128), .C(n2136), .Y(n1768) );
  NAND2X1 U1190 ( .A(\curr_reg[47][6] ), .B(n2130), .Y(n2136) );
  OAI21X1 U1191 ( .A(n25), .B(n2128), .C(n2137), .Y(n1767) );
  NAND2X1 U1192 ( .A(\curr_reg[47][7] ), .B(n2130), .Y(n2137) );
  NAND2X1 U1193 ( .A(n2138), .B(n1953), .Y(n2130) );
  INVX1 U1194 ( .A(n2138), .Y(n2128) );
  NOR2X1 U1195 ( .A(n2139), .B(n1932), .Y(n2138) );
  OAI21X1 U1196 ( .A(n11), .B(n2140), .C(n2141), .Y(n1766) );
  NAND2X1 U1197 ( .A(\curr_reg[46][0] ), .B(n2142), .Y(n2141) );
  OAI21X1 U1198 ( .A(n13), .B(n2140), .C(n2143), .Y(n1765) );
  NAND2X1 U1199 ( .A(\curr_reg[46][1] ), .B(n2142), .Y(n2143) );
  OAI21X1 U1200 ( .A(n15), .B(n2140), .C(n2144), .Y(n1764) );
  NAND2X1 U1201 ( .A(\curr_reg[46][2] ), .B(n2142), .Y(n2144) );
  OAI21X1 U1202 ( .A(n17), .B(n2140), .C(n2145), .Y(n1763) );
  NAND2X1 U1203 ( .A(\curr_reg[46][3] ), .B(n2142), .Y(n2145) );
  OAI21X1 U1204 ( .A(n19), .B(n2140), .C(n2146), .Y(n1762) );
  NAND2X1 U1205 ( .A(\curr_reg[46][4] ), .B(n2142), .Y(n2146) );
  OAI21X1 U1206 ( .A(n21), .B(n2140), .C(n2147), .Y(n1761) );
  NAND2X1 U1207 ( .A(\curr_reg[46][5] ), .B(n2142), .Y(n2147) );
  OAI21X1 U1208 ( .A(n23), .B(n2140), .C(n2148), .Y(n1760) );
  NAND2X1 U1209 ( .A(\curr_reg[46][6] ), .B(n2142), .Y(n2148) );
  OAI21X1 U1210 ( .A(n25), .B(n2140), .C(n2149), .Y(n1759) );
  NAND2X1 U1211 ( .A(\curr_reg[46][7] ), .B(n2142), .Y(n2149) );
  NAND2X1 U1212 ( .A(n2150), .B(n1953), .Y(n2142) );
  INVX1 U1213 ( .A(n2150), .Y(n2140) );
  NOR2X1 U1214 ( .A(n2139), .B(n1966), .Y(n2150) );
  OAI21X1 U1215 ( .A(n11), .B(n2151), .C(n2152), .Y(n1758) );
  NAND2X1 U1216 ( .A(\curr_reg[45][0] ), .B(n2153), .Y(n2152) );
  OAI21X1 U1217 ( .A(n13), .B(n2151), .C(n2154), .Y(n1757) );
  NAND2X1 U1218 ( .A(\curr_reg[45][1] ), .B(n2153), .Y(n2154) );
  OAI21X1 U1219 ( .A(n15), .B(n2151), .C(n2155), .Y(n1756) );
  NAND2X1 U1220 ( .A(\curr_reg[45][2] ), .B(n2153), .Y(n2155) );
  OAI21X1 U1221 ( .A(n17), .B(n2151), .C(n2156), .Y(n1755) );
  NAND2X1 U1222 ( .A(\curr_reg[45][3] ), .B(n2153), .Y(n2156) );
  OAI21X1 U1223 ( .A(n19), .B(n2151), .C(n2157), .Y(n1754) );
  NAND2X1 U1224 ( .A(\curr_reg[45][4] ), .B(n2153), .Y(n2157) );
  OAI21X1 U1225 ( .A(n21), .B(n2151), .C(n2158), .Y(n1753) );
  NAND2X1 U1226 ( .A(\curr_reg[45][5] ), .B(n2153), .Y(n2158) );
  OAI21X1 U1227 ( .A(n23), .B(n2151), .C(n2159), .Y(n1752) );
  NAND2X1 U1228 ( .A(\curr_reg[45][6] ), .B(n2153), .Y(n2159) );
  OAI21X1 U1229 ( .A(n25), .B(n2151), .C(n2160), .Y(n1751) );
  NAND2X1 U1230 ( .A(\curr_reg[45][7] ), .B(n2153), .Y(n2160) );
  NAND2X1 U1231 ( .A(n2161), .B(n1953), .Y(n2153) );
  INVX1 U1232 ( .A(n2161), .Y(n2151) );
  NOR2X1 U1233 ( .A(n2139), .B(n1978), .Y(n2161) );
  OAI21X1 U1234 ( .A(n11), .B(n2162), .C(n2163), .Y(n1750) );
  NAND2X1 U1235 ( .A(\curr_reg[44][0] ), .B(n2164), .Y(n2163) );
  OAI21X1 U1236 ( .A(n13), .B(n2162), .C(n2165), .Y(n1749) );
  NAND2X1 U1237 ( .A(\curr_reg[44][1] ), .B(n2164), .Y(n2165) );
  OAI21X1 U1238 ( .A(n15), .B(n2162), .C(n2166), .Y(n1748) );
  NAND2X1 U1239 ( .A(\curr_reg[44][2] ), .B(n2164), .Y(n2166) );
  OAI21X1 U1240 ( .A(n17), .B(n2162), .C(n2167), .Y(n1747) );
  NAND2X1 U1241 ( .A(\curr_reg[44][3] ), .B(n2164), .Y(n2167) );
  OAI21X1 U1242 ( .A(n19), .B(n2162), .C(n2168), .Y(n1746) );
  NAND2X1 U1243 ( .A(\curr_reg[44][4] ), .B(n2164), .Y(n2168) );
  OAI21X1 U1244 ( .A(n21), .B(n2162), .C(n2169), .Y(n1745) );
  NAND2X1 U1245 ( .A(\curr_reg[44][5] ), .B(n2164), .Y(n2169) );
  OAI21X1 U1246 ( .A(n23), .B(n2162), .C(n2170), .Y(n1744) );
  NAND2X1 U1247 ( .A(\curr_reg[44][6] ), .B(n2164), .Y(n2170) );
  OAI21X1 U1248 ( .A(n25), .B(n2162), .C(n2171), .Y(n1743) );
  NAND2X1 U1249 ( .A(\curr_reg[44][7] ), .B(n2164), .Y(n2171) );
  NAND2X1 U1250 ( .A(n2172), .B(n1953), .Y(n2164) );
  INVX1 U1251 ( .A(n2172), .Y(n2162) );
  NOR2X1 U1252 ( .A(n2139), .B(n1990), .Y(n2172) );
  OAI21X1 U1253 ( .A(n11), .B(n2173), .C(n2174), .Y(n1742) );
  NAND2X1 U1254 ( .A(\curr_reg[43][0] ), .B(n2175), .Y(n2174) );
  OAI21X1 U1255 ( .A(n13), .B(n2173), .C(n2176), .Y(n1741) );
  NAND2X1 U1256 ( .A(\curr_reg[43][1] ), .B(n2175), .Y(n2176) );
  OAI21X1 U1257 ( .A(n15), .B(n2173), .C(n2177), .Y(n1740) );
  NAND2X1 U1258 ( .A(\curr_reg[43][2] ), .B(n2175), .Y(n2177) );
  OAI21X1 U1259 ( .A(n17), .B(n2173), .C(n2178), .Y(n1739) );
  NAND2X1 U1260 ( .A(\curr_reg[43][3] ), .B(n2175), .Y(n2178) );
  OAI21X1 U1261 ( .A(n19), .B(n2173), .C(n2179), .Y(n1738) );
  NAND2X1 U1262 ( .A(\curr_reg[43][4] ), .B(n2175), .Y(n2179) );
  OAI21X1 U1263 ( .A(n21), .B(n2173), .C(n2180), .Y(n1737) );
  NAND2X1 U1264 ( .A(\curr_reg[43][5] ), .B(n2175), .Y(n2180) );
  OAI21X1 U1265 ( .A(n23), .B(n2173), .C(n2181), .Y(n1736) );
  NAND2X1 U1266 ( .A(\curr_reg[43][6] ), .B(n2175), .Y(n2181) );
  OAI21X1 U1267 ( .A(n25), .B(n2173), .C(n2182), .Y(n1735) );
  NAND2X1 U1268 ( .A(\curr_reg[43][7] ), .B(n2175), .Y(n2182) );
  NAND2X1 U1269 ( .A(n2183), .B(n1953), .Y(n2175) );
  INVX1 U1270 ( .A(n2183), .Y(n2173) );
  NOR2X1 U1271 ( .A(n2139), .B(n1924), .Y(n2183) );
  OAI21X1 U1272 ( .A(n11), .B(n2184), .C(n2185), .Y(n1734) );
  NAND2X1 U1273 ( .A(\curr_reg[42][0] ), .B(n2186), .Y(n2185) );
  OAI21X1 U1274 ( .A(n13), .B(n2184), .C(n2187), .Y(n1733) );
  NAND2X1 U1275 ( .A(\curr_reg[42][1] ), .B(n2186), .Y(n2187) );
  OAI21X1 U1276 ( .A(n15), .B(n2184), .C(n2188), .Y(n1732) );
  NAND2X1 U1277 ( .A(\curr_reg[42][2] ), .B(n2186), .Y(n2188) );
  OAI21X1 U1278 ( .A(n17), .B(n2184), .C(n2189), .Y(n1731) );
  NAND2X1 U1279 ( .A(\curr_reg[42][3] ), .B(n2186), .Y(n2189) );
  OAI21X1 U1280 ( .A(n19), .B(n2184), .C(n2190), .Y(n1730) );
  NAND2X1 U1281 ( .A(\curr_reg[42][4] ), .B(n2186), .Y(n2190) );
  OAI21X1 U1282 ( .A(n21), .B(n2184), .C(n2191), .Y(n1729) );
  NAND2X1 U1283 ( .A(\curr_reg[42][5] ), .B(n2186), .Y(n2191) );
  OAI21X1 U1284 ( .A(n23), .B(n2184), .C(n2192), .Y(n1728) );
  NAND2X1 U1285 ( .A(\curr_reg[42][6] ), .B(n2186), .Y(n2192) );
  OAI21X1 U1286 ( .A(n25), .B(n2184), .C(n2193), .Y(n1727) );
  NAND2X1 U1287 ( .A(\curr_reg[42][7] ), .B(n2186), .Y(n2193) );
  NAND2X1 U1288 ( .A(n2194), .B(n1953), .Y(n2186) );
  INVX1 U1289 ( .A(n2194), .Y(n2184) );
  NOR2X1 U1290 ( .A(n2139), .B(n2013), .Y(n2194) );
  OAI21X1 U1291 ( .A(n11), .B(n2195), .C(n2196), .Y(n1726) );
  NAND2X1 U1292 ( .A(\curr_reg[41][0] ), .B(n2197), .Y(n2196) );
  OAI21X1 U1293 ( .A(n13), .B(n2195), .C(n2198), .Y(n1725) );
  NAND2X1 U1294 ( .A(\curr_reg[41][1] ), .B(n2197), .Y(n2198) );
  OAI21X1 U1295 ( .A(n15), .B(n2195), .C(n2199), .Y(n1724) );
  NAND2X1 U1296 ( .A(\curr_reg[41][2] ), .B(n2197), .Y(n2199) );
  OAI21X1 U1297 ( .A(n17), .B(n2195), .C(n2200), .Y(n1723) );
  NAND2X1 U1298 ( .A(\curr_reg[41][3] ), .B(n2197), .Y(n2200) );
  OAI21X1 U1299 ( .A(n19), .B(n2195), .C(n2201), .Y(n1722) );
  NAND2X1 U1300 ( .A(\curr_reg[41][4] ), .B(n2197), .Y(n2201) );
  OAI21X1 U1301 ( .A(n21), .B(n2195), .C(n2202), .Y(n1721) );
  NAND2X1 U1302 ( .A(\curr_reg[41][5] ), .B(n2197), .Y(n2202) );
  OAI21X1 U1303 ( .A(n23), .B(n2195), .C(n2203), .Y(n1720) );
  NAND2X1 U1304 ( .A(\curr_reg[41][6] ), .B(n2197), .Y(n2203) );
  OAI21X1 U1305 ( .A(n25), .B(n2195), .C(n2204), .Y(n1719) );
  NAND2X1 U1306 ( .A(\curr_reg[41][7] ), .B(n2197), .Y(n2204) );
  NAND2X1 U1307 ( .A(n2205), .B(n1953), .Y(n2197) );
  INVX1 U1308 ( .A(n2205), .Y(n2195) );
  NOR2X1 U1309 ( .A(n2139), .B(n2025), .Y(n2205) );
  OAI21X1 U1310 ( .A(n11), .B(n2206), .C(n2207), .Y(n1718) );
  NAND2X1 U1311 ( .A(\curr_reg[40][0] ), .B(n2208), .Y(n2207) );
  OAI21X1 U1312 ( .A(n13), .B(n2206), .C(n2209), .Y(n1717) );
  NAND2X1 U1313 ( .A(\curr_reg[40][1] ), .B(n2208), .Y(n2209) );
  OAI21X1 U1314 ( .A(n15), .B(n2206), .C(n2210), .Y(n1716) );
  NAND2X1 U1315 ( .A(\curr_reg[40][2] ), .B(n2208), .Y(n2210) );
  OAI21X1 U1316 ( .A(n17), .B(n2206), .C(n2211), .Y(n1715) );
  NAND2X1 U1317 ( .A(\curr_reg[40][3] ), .B(n2208), .Y(n2211) );
  OAI21X1 U1318 ( .A(n19), .B(n2206), .C(n2212), .Y(n1714) );
  NAND2X1 U1319 ( .A(\curr_reg[40][4] ), .B(n2208), .Y(n2212) );
  OAI21X1 U1320 ( .A(n21), .B(n2206), .C(n2213), .Y(n1713) );
  NAND2X1 U1321 ( .A(\curr_reg[40][5] ), .B(n2208), .Y(n2213) );
  OAI21X1 U1322 ( .A(n23), .B(n2206), .C(n2214), .Y(n1712) );
  NAND2X1 U1323 ( .A(\curr_reg[40][6] ), .B(n2208), .Y(n2214) );
  OAI21X1 U1324 ( .A(n25), .B(n2206), .C(n2215), .Y(n1711) );
  NAND2X1 U1325 ( .A(\curr_reg[40][7] ), .B(n2208), .Y(n2215) );
  NAND2X1 U1326 ( .A(n2216), .B(n1953), .Y(n2208) );
  INVX1 U1327 ( .A(n2216), .Y(n2206) );
  NOR2X1 U1328 ( .A(n2139), .B(n2037), .Y(n2216) );
  NAND3X1 U1329 ( .A(curr_write_ptr[3]), .B(n2217), .C(curr_write_ptr[5]), .Y(
        n2139) );
  OAI21X1 U1330 ( .A(n11), .B(n2218), .C(n2219), .Y(n1710) );
  NAND2X1 U1331 ( .A(\curr_reg[39][0] ), .B(n2220), .Y(n2219) );
  OAI21X1 U1332 ( .A(n13), .B(n2218), .C(n2221), .Y(n1709) );
  NAND2X1 U1333 ( .A(\curr_reg[39][1] ), .B(n2220), .Y(n2221) );
  OAI21X1 U1334 ( .A(n15), .B(n2218), .C(n2222), .Y(n1708) );
  NAND2X1 U1335 ( .A(\curr_reg[39][2] ), .B(n2220), .Y(n2222) );
  OAI21X1 U1336 ( .A(n17), .B(n2218), .C(n2223), .Y(n1707) );
  NAND2X1 U1337 ( .A(\curr_reg[39][3] ), .B(n2220), .Y(n2223) );
  OAI21X1 U1338 ( .A(n19), .B(n2218), .C(n2224), .Y(n1706) );
  NAND2X1 U1339 ( .A(\curr_reg[39][4] ), .B(n2220), .Y(n2224) );
  OAI21X1 U1340 ( .A(n21), .B(n2218), .C(n2225), .Y(n1705) );
  NAND2X1 U1341 ( .A(\curr_reg[39][5] ), .B(n2220), .Y(n2225) );
  OAI21X1 U1342 ( .A(n23), .B(n2218), .C(n2226), .Y(n1704) );
  NAND2X1 U1343 ( .A(\curr_reg[39][6] ), .B(n2220), .Y(n2226) );
  OAI21X1 U1344 ( .A(n25), .B(n2218), .C(n2227), .Y(n1703) );
  NAND2X1 U1345 ( .A(\curr_reg[39][7] ), .B(n2220), .Y(n2227) );
  NAND2X1 U1346 ( .A(n2228), .B(n1953), .Y(n2220) );
  INVX1 U1347 ( .A(n2228), .Y(n2218) );
  NOR2X1 U1348 ( .A(n2229), .B(n1932), .Y(n2228) );
  OAI21X1 U1349 ( .A(n11), .B(n2230), .C(n2231), .Y(n1702) );
  NAND2X1 U1350 ( .A(\curr_reg[38][0] ), .B(n2232), .Y(n2231) );
  OAI21X1 U1351 ( .A(n13), .B(n2230), .C(n2233), .Y(n1701) );
  NAND2X1 U1352 ( .A(\curr_reg[38][1] ), .B(n2232), .Y(n2233) );
  OAI21X1 U1353 ( .A(n15), .B(n2230), .C(n2234), .Y(n1700) );
  NAND2X1 U1354 ( .A(\curr_reg[38][2] ), .B(n2232), .Y(n2234) );
  OAI21X1 U1355 ( .A(n17), .B(n2230), .C(n2235), .Y(n1699) );
  NAND2X1 U1356 ( .A(\curr_reg[38][3] ), .B(n2232), .Y(n2235) );
  OAI21X1 U1357 ( .A(n19), .B(n2230), .C(n2236), .Y(n1698) );
  NAND2X1 U1358 ( .A(\curr_reg[38][4] ), .B(n2232), .Y(n2236) );
  OAI21X1 U1359 ( .A(n21), .B(n2230), .C(n2237), .Y(n1697) );
  NAND2X1 U1360 ( .A(\curr_reg[38][5] ), .B(n2232), .Y(n2237) );
  OAI21X1 U1361 ( .A(n23), .B(n2230), .C(n2238), .Y(n1696) );
  NAND2X1 U1362 ( .A(\curr_reg[38][6] ), .B(n2232), .Y(n2238) );
  OAI21X1 U1363 ( .A(n25), .B(n2230), .C(n2239), .Y(n1695) );
  NAND2X1 U1364 ( .A(\curr_reg[38][7] ), .B(n2232), .Y(n2239) );
  NAND2X1 U1365 ( .A(n2240), .B(n1953), .Y(n2232) );
  INVX1 U1366 ( .A(n2240), .Y(n2230) );
  NOR2X1 U1367 ( .A(n2229), .B(n1966), .Y(n2240) );
  OAI21X1 U1368 ( .A(n11), .B(n2241), .C(n2242), .Y(n1694) );
  NAND2X1 U1369 ( .A(\curr_reg[37][0] ), .B(n2243), .Y(n2242) );
  OAI21X1 U1370 ( .A(n13), .B(n2241), .C(n2244), .Y(n1693) );
  NAND2X1 U1371 ( .A(\curr_reg[37][1] ), .B(n2243), .Y(n2244) );
  OAI21X1 U1372 ( .A(n15), .B(n2241), .C(n2245), .Y(n1692) );
  NAND2X1 U1373 ( .A(\curr_reg[37][2] ), .B(n2243), .Y(n2245) );
  OAI21X1 U1374 ( .A(n17), .B(n2241), .C(n2246), .Y(n1691) );
  NAND2X1 U1922 ( .A(\curr_reg[37][3] ), .B(n2243), .Y(n2246) );
  OAI21X1 U1923 ( .A(n19), .B(n2241), .C(n2247), .Y(n1690) );
  NAND2X1 U1924 ( .A(\curr_reg[37][4] ), .B(n2243), .Y(n2247) );
  OAI21X1 U1925 ( .A(n21), .B(n2241), .C(n2248), .Y(n1689) );
  NAND2X1 U1926 ( .A(\curr_reg[37][5] ), .B(n2243), .Y(n2248) );
  OAI21X1 U1927 ( .A(n23), .B(n2241), .C(n2249), .Y(n1688) );
  NAND2X1 U1928 ( .A(\curr_reg[37][6] ), .B(n2243), .Y(n2249) );
  OAI21X1 U1929 ( .A(n25), .B(n2241), .C(n2250), .Y(n1687) );
  NAND2X1 U1930 ( .A(\curr_reg[37][7] ), .B(n2243), .Y(n2250) );
  NAND2X1 U1931 ( .A(n2251), .B(n1953), .Y(n2243) );
  INVX1 U1932 ( .A(n2251), .Y(n2241) );
  NOR2X1 U1933 ( .A(n2229), .B(n1978), .Y(n2251) );
  OAI21X1 U1934 ( .A(n11), .B(n2252), .C(n2253), .Y(n1686) );
  NAND2X1 U1935 ( .A(\curr_reg[36][0] ), .B(n2254), .Y(n2253) );
  OAI21X1 U1936 ( .A(n13), .B(n2252), .C(n2255), .Y(n1685) );
  NAND2X1 U1937 ( .A(\curr_reg[36][1] ), .B(n2254), .Y(n2255) );
  OAI21X1 U1938 ( .A(n15), .B(n2252), .C(n2256), .Y(n1684) );
  NAND2X1 U1939 ( .A(\curr_reg[36][2] ), .B(n2254), .Y(n2256) );
  OAI21X1 U1940 ( .A(n17), .B(n2252), .C(n2257), .Y(n1683) );
  NAND2X1 U1941 ( .A(\curr_reg[36][3] ), .B(n2254), .Y(n2257) );
  OAI21X1 U1942 ( .A(n19), .B(n2252), .C(n2258), .Y(n1682) );
  NAND2X1 U1943 ( .A(\curr_reg[36][4] ), .B(n2254), .Y(n2258) );
  OAI21X1 U1944 ( .A(n21), .B(n2252), .C(n2259), .Y(n1681) );
  NAND2X1 U1945 ( .A(\curr_reg[36][5] ), .B(n2254), .Y(n2259) );
  OAI21X1 U1946 ( .A(n23), .B(n2252), .C(n2260), .Y(n1680) );
  NAND2X1 U1947 ( .A(\curr_reg[36][6] ), .B(n2254), .Y(n2260) );
  OAI21X1 U1948 ( .A(n25), .B(n2252), .C(n2261), .Y(n1679) );
  NAND2X1 U1949 ( .A(\curr_reg[36][7] ), .B(n2254), .Y(n2261) );
  NAND2X1 U1950 ( .A(n2262), .B(n1953), .Y(n2254) );
  INVX1 U1951 ( .A(n2262), .Y(n2252) );
  NOR2X1 U1952 ( .A(n2229), .B(n1990), .Y(n2262) );
  OAI21X1 U1953 ( .A(n11), .B(n2263), .C(n2264), .Y(n1678) );
  NAND2X1 U1954 ( .A(\curr_reg[35][0] ), .B(n2265), .Y(n2264) );
  OAI21X1 U1955 ( .A(n13), .B(n2263), .C(n2266), .Y(n1677) );
  NAND2X1 U1956 ( .A(\curr_reg[35][1] ), .B(n2265), .Y(n2266) );
  OAI21X1 U1957 ( .A(n15), .B(n2263), .C(n2267), .Y(n1676) );
  NAND2X1 U1958 ( .A(\curr_reg[35][2] ), .B(n2265), .Y(n2267) );
  OAI21X1 U1959 ( .A(n17), .B(n2263), .C(n2268), .Y(n1675) );
  NAND2X1 U1960 ( .A(\curr_reg[35][3] ), .B(n2265), .Y(n2268) );
  OAI21X1 U1961 ( .A(n19), .B(n2263), .C(n2269), .Y(n1674) );
  NAND2X1 U1962 ( .A(\curr_reg[35][4] ), .B(n2265), .Y(n2269) );
  OAI21X1 U1963 ( .A(n21), .B(n2263), .C(n2270), .Y(n1673) );
  NAND2X1 U1964 ( .A(\curr_reg[35][5] ), .B(n2265), .Y(n2270) );
  OAI21X1 U1965 ( .A(n23), .B(n2263), .C(n2271), .Y(n1672) );
  NAND2X1 U1966 ( .A(\curr_reg[35][6] ), .B(n2265), .Y(n2271) );
  OAI21X1 U1967 ( .A(n25), .B(n2263), .C(n2272), .Y(n1671) );
  NAND2X1 U1968 ( .A(\curr_reg[35][7] ), .B(n2265), .Y(n2272) );
  NAND2X1 U1969 ( .A(n2273), .B(n1953), .Y(n2265) );
  INVX1 U1970 ( .A(n2273), .Y(n2263) );
  NOR2X1 U1971 ( .A(n2229), .B(n1924), .Y(n2273) );
  OAI21X1 U1972 ( .A(n11), .B(n2274), .C(n2275), .Y(n1670) );
  NAND2X1 U1973 ( .A(\curr_reg[34][0] ), .B(n2276), .Y(n2275) );
  OAI21X1 U1974 ( .A(n13), .B(n2274), .C(n2277), .Y(n1669) );
  NAND2X1 U1975 ( .A(\curr_reg[34][1] ), .B(n2276), .Y(n2277) );
  OAI21X1 U1976 ( .A(n15), .B(n2274), .C(n2278), .Y(n1668) );
  NAND2X1 U1977 ( .A(\curr_reg[34][2] ), .B(n2276), .Y(n2278) );
  OAI21X1 U1978 ( .A(n17), .B(n2274), .C(n2279), .Y(n1667) );
  NAND2X1 U1979 ( .A(\curr_reg[34][3] ), .B(n2276), .Y(n2279) );
  OAI21X1 U1980 ( .A(n19), .B(n2274), .C(n2280), .Y(n1666) );
  NAND2X1 U1981 ( .A(\curr_reg[34][4] ), .B(n2276), .Y(n2280) );
  OAI21X1 U1982 ( .A(n21), .B(n2274), .C(n2281), .Y(n1665) );
  NAND2X1 U1983 ( .A(\curr_reg[34][5] ), .B(n2276), .Y(n2281) );
  OAI21X1 U1984 ( .A(n23), .B(n2274), .C(n2282), .Y(n1664) );
  NAND2X1 U1985 ( .A(\curr_reg[34][6] ), .B(n2276), .Y(n2282) );
  OAI21X1 U1986 ( .A(n25), .B(n2274), .C(n2283), .Y(n1663) );
  NAND2X1 U1987 ( .A(\curr_reg[34][7] ), .B(n2276), .Y(n2283) );
  NAND2X1 U1988 ( .A(n2284), .B(n1953), .Y(n2276) );
  INVX1 U1989 ( .A(n2284), .Y(n2274) );
  NOR2X1 U1990 ( .A(n2229), .B(n2013), .Y(n2284) );
  OAI21X1 U1991 ( .A(n11), .B(n2285), .C(n2286), .Y(n1662) );
  NAND2X1 U1992 ( .A(\curr_reg[33][0] ), .B(n2287), .Y(n2286) );
  OAI21X1 U1993 ( .A(n13), .B(n2285), .C(n2288), .Y(n1661) );
  NAND2X1 U1994 ( .A(\curr_reg[33][1] ), .B(n2287), .Y(n2288) );
  OAI21X1 U1995 ( .A(n15), .B(n2285), .C(n2289), .Y(n1660) );
  NAND2X1 U1996 ( .A(\curr_reg[33][2] ), .B(n2287), .Y(n2289) );
  OAI21X1 U1997 ( .A(n17), .B(n2285), .C(n2290), .Y(n1659) );
  NAND2X1 U1998 ( .A(\curr_reg[33][3] ), .B(n2287), .Y(n2290) );
  OAI21X1 U1999 ( .A(n19), .B(n2285), .C(n2291), .Y(n1658) );
  NAND2X1 U2000 ( .A(\curr_reg[33][4] ), .B(n2287), .Y(n2291) );
  OAI21X1 U2001 ( .A(n21), .B(n2285), .C(n2292), .Y(n1657) );
  NAND2X1 U2002 ( .A(\curr_reg[33][5] ), .B(n2287), .Y(n2292) );
  OAI21X1 U2003 ( .A(n23), .B(n2285), .C(n2293), .Y(n1656) );
  NAND2X1 U2004 ( .A(\curr_reg[33][6] ), .B(n2287), .Y(n2293) );
  OAI21X1 U2005 ( .A(n25), .B(n2285), .C(n2294), .Y(n1655) );
  NAND2X1 U2006 ( .A(\curr_reg[33][7] ), .B(n2287), .Y(n2294) );
  NAND2X1 U2007 ( .A(n2295), .B(n1953), .Y(n2287) );
  INVX1 U2008 ( .A(n2295), .Y(n2285) );
  NOR2X1 U2009 ( .A(n2229), .B(n2025), .Y(n2295) );
  OAI21X1 U2010 ( .A(n11), .B(n2296), .C(n2297), .Y(n1654) );
  NAND2X1 U2011 ( .A(\curr_reg[32][0] ), .B(n2298), .Y(n2297) );
  OAI21X1 U2012 ( .A(n13), .B(n2296), .C(n2299), .Y(n1653) );
  NAND2X1 U2013 ( .A(\curr_reg[32][1] ), .B(n2298), .Y(n2299) );
  OAI21X1 U2014 ( .A(n15), .B(n2296), .C(n2300), .Y(n1652) );
  NAND2X1 U2015 ( .A(\curr_reg[32][2] ), .B(n2298), .Y(n2300) );
  OAI21X1 U2016 ( .A(n17), .B(n2296), .C(n2301), .Y(n1651) );
  NAND2X1 U2017 ( .A(\curr_reg[32][3] ), .B(n2298), .Y(n2301) );
  OAI21X1 U2018 ( .A(n19), .B(n2296), .C(n2302), .Y(n1650) );
  NAND2X1 U2019 ( .A(\curr_reg[32][4] ), .B(n2298), .Y(n2302) );
  OAI21X1 U2020 ( .A(n21), .B(n2296), .C(n2303), .Y(n1649) );
  NAND2X1 U2021 ( .A(\curr_reg[32][5] ), .B(n2298), .Y(n2303) );
  OAI21X1 U2022 ( .A(n23), .B(n2296), .C(n2304), .Y(n1648) );
  NAND2X1 U2023 ( .A(\curr_reg[32][6] ), .B(n2298), .Y(n2304) );
  OAI21X1 U2024 ( .A(n25), .B(n2296), .C(n2305), .Y(n1647) );
  NAND2X1 U2025 ( .A(\curr_reg[32][7] ), .B(n2298), .Y(n2305) );
  NAND2X1 U2026 ( .A(n2306), .B(n1953), .Y(n2298) );
  INVX1 U2027 ( .A(n2306), .Y(n2296) );
  NOR2X1 U2028 ( .A(n2229), .B(n2037), .Y(n2306) );
  NAND3X1 U2029 ( .A(n2127), .B(n2217), .C(curr_write_ptr[5]), .Y(n2229) );
  OAI21X1 U2030 ( .A(n11), .B(n1929), .C(n2307), .Y(n1646) );
  NAND2X1 U2031 ( .A(\curr_reg[31][0] ), .B(n2308), .Y(n2307) );
  OAI21X1 U2032 ( .A(n13), .B(n1929), .C(n2309), .Y(n1645) );
  NAND2X1 U2033 ( .A(\curr_reg[31][1] ), .B(n2308), .Y(n2309) );
  OAI21X1 U2034 ( .A(n15), .B(n1929), .C(n2310), .Y(n1644) );
  NAND2X1 U2035 ( .A(\curr_reg[31][2] ), .B(n2308), .Y(n2310) );
  OAI21X1 U2036 ( .A(n17), .B(n1929), .C(n2311), .Y(n1643) );
  NAND2X1 U2037 ( .A(\curr_reg[31][3] ), .B(n2308), .Y(n2311) );
  OAI21X1 U2038 ( .A(n19), .B(n1929), .C(n2312), .Y(n1642) );
  NAND2X1 U2039 ( .A(\curr_reg[31][4] ), .B(n2308), .Y(n2312) );
  OAI21X1 U2040 ( .A(n21), .B(n1929), .C(n2313), .Y(n1641) );
  NAND2X1 U2041 ( .A(\curr_reg[31][5] ), .B(n2308), .Y(n2313) );
  OAI21X1 U2042 ( .A(n23), .B(n1929), .C(n2314), .Y(n1640) );
  NAND2X1 U2043 ( .A(\curr_reg[31][6] ), .B(n2308), .Y(n2314) );
  OAI21X1 U2044 ( .A(n25), .B(n1929), .C(n2315), .Y(n1639) );
  NAND2X1 U2045 ( .A(\curr_reg[31][7] ), .B(n2308), .Y(n2315) );
  NAND2X1 U2046 ( .A(n1953), .B(n2316), .Y(n2308) );
  INVX1 U2047 ( .A(n2316), .Y(n1929) );
  NOR2X1 U2048 ( .A(n2317), .B(n1932), .Y(n2316) );
  OAI21X1 U2049 ( .A(n11), .B(n2318), .C(n2319), .Y(n1638) );
  NAND2X1 U2050 ( .A(\curr_reg[30][0] ), .B(n2320), .Y(n2319) );
  OAI21X1 U2051 ( .A(n13), .B(n2318), .C(n2321), .Y(n1637) );
  NAND2X1 U2052 ( .A(\curr_reg[30][1] ), .B(n2320), .Y(n2321) );
  OAI21X1 U2053 ( .A(n15), .B(n2318), .C(n2322), .Y(n1636) );
  NAND2X1 U2054 ( .A(\curr_reg[30][2] ), .B(n2320), .Y(n2322) );
  OAI21X1 U2055 ( .A(n17), .B(n2318), .C(n2323), .Y(n1635) );
  NAND2X1 U2056 ( .A(\curr_reg[30][3] ), .B(n2320), .Y(n2323) );
  OAI21X1 U2057 ( .A(n19), .B(n2318), .C(n2324), .Y(n1634) );
  NAND2X1 U2058 ( .A(\curr_reg[30][4] ), .B(n2320), .Y(n2324) );
  OAI21X1 U2059 ( .A(n21), .B(n2318), .C(n2325), .Y(n1633) );
  NAND2X1 U2060 ( .A(\curr_reg[30][5] ), .B(n2320), .Y(n2325) );
  OAI21X1 U2061 ( .A(n23), .B(n2318), .C(n2326), .Y(n1632) );
  NAND2X1 U2062 ( .A(\curr_reg[30][6] ), .B(n2320), .Y(n2326) );
  OAI21X1 U2063 ( .A(n25), .B(n2318), .C(n2327), .Y(n1631) );
  NAND2X1 U2064 ( .A(\curr_reg[30][7] ), .B(n2320), .Y(n2327) );
  NAND2X1 U2065 ( .A(n2328), .B(n1953), .Y(n2320) );
  INVX1 U2066 ( .A(n2328), .Y(n2318) );
  NOR2X1 U2067 ( .A(n1966), .B(n2317), .Y(n2328) );
  OAI21X1 U2068 ( .A(n11), .B(n2329), .C(n2330), .Y(n1630) );
  NAND2X1 U2069 ( .A(\curr_reg[29][0] ), .B(n2331), .Y(n2330) );
  OAI21X1 U2070 ( .A(n13), .B(n2329), .C(n2332), .Y(n1629) );
  NAND2X1 U2071 ( .A(\curr_reg[29][1] ), .B(n2331), .Y(n2332) );
  OAI21X1 U2072 ( .A(n15), .B(n2329), .C(n2333), .Y(n1628) );
  NAND2X1 U2073 ( .A(\curr_reg[29][2] ), .B(n2331), .Y(n2333) );
  OAI21X1 U2074 ( .A(n17), .B(n2329), .C(n2334), .Y(n1627) );
  NAND2X1 U2075 ( .A(\curr_reg[29][3] ), .B(n2331), .Y(n2334) );
  OAI21X1 U2076 ( .A(n19), .B(n2329), .C(n2335), .Y(n1626) );
  NAND2X1 U2077 ( .A(\curr_reg[29][4] ), .B(n2331), .Y(n2335) );
  OAI21X1 U2078 ( .A(n21), .B(n2329), .C(n2336), .Y(n1625) );
  NAND2X1 U2079 ( .A(\curr_reg[29][5] ), .B(n2331), .Y(n2336) );
  OAI21X1 U2080 ( .A(n23), .B(n2329), .C(n2337), .Y(n1624) );
  NAND2X1 U2081 ( .A(\curr_reg[29][6] ), .B(n2331), .Y(n2337) );
  OAI21X1 U2082 ( .A(n25), .B(n2329), .C(n2338), .Y(n1623) );
  NAND2X1 U2083 ( .A(\curr_reg[29][7] ), .B(n2331), .Y(n2338) );
  NAND2X1 U2084 ( .A(n2339), .B(n1953), .Y(n2331) );
  INVX1 U2085 ( .A(n2339), .Y(n2329) );
  NOR2X1 U2086 ( .A(n1978), .B(n2317), .Y(n2339) );
  OAI21X1 U2087 ( .A(n11), .B(n2340), .C(n2341), .Y(n1622) );
  NAND2X1 U2088 ( .A(\curr_reg[28][0] ), .B(n2342), .Y(n2341) );
  OAI21X1 U2089 ( .A(n13), .B(n2340), .C(n2343), .Y(n1621) );
  NAND2X1 U2090 ( .A(\curr_reg[28][1] ), .B(n2342), .Y(n2343) );
  OAI21X1 U2091 ( .A(n15), .B(n2340), .C(n2344), .Y(n1620) );
  NAND2X1 U2092 ( .A(\curr_reg[28][2] ), .B(n2342), .Y(n2344) );
  OAI21X1 U2093 ( .A(n17), .B(n2340), .C(n2345), .Y(n1619) );
  NAND2X1 U2094 ( .A(\curr_reg[28][3] ), .B(n2342), .Y(n2345) );
  OAI21X1 U2095 ( .A(n19), .B(n2340), .C(n2346), .Y(n1618) );
  NAND2X1 U2096 ( .A(\curr_reg[28][4] ), .B(n2342), .Y(n2346) );
  OAI21X1 U2097 ( .A(n21), .B(n2340), .C(n2347), .Y(n1617) );
  NAND2X1 U2098 ( .A(\curr_reg[28][5] ), .B(n2342), .Y(n2347) );
  OAI21X1 U2099 ( .A(n23), .B(n2340), .C(n2348), .Y(n1616) );
  NAND2X1 U2100 ( .A(\curr_reg[28][6] ), .B(n2342), .Y(n2348) );
  OAI21X1 U2101 ( .A(n25), .B(n2340), .C(n2349), .Y(n1615) );
  NAND2X1 U2102 ( .A(\curr_reg[28][7] ), .B(n2342), .Y(n2349) );
  NAND2X1 U2103 ( .A(n2350), .B(n1953), .Y(n2342) );
  INVX1 U2104 ( .A(n2350), .Y(n2340) );
  NOR2X1 U2105 ( .A(n1990), .B(n2317), .Y(n2350) );
  OAI21X1 U2106 ( .A(n11), .B(n2351), .C(n2352), .Y(n1614) );
  NAND2X1 U2107 ( .A(\curr_reg[27][0] ), .B(n2353), .Y(n2352) );
  OAI21X1 U2108 ( .A(n13), .B(n2351), .C(n2354), .Y(n1613) );
  NAND2X1 U2109 ( .A(\curr_reg[27][1] ), .B(n2353), .Y(n2354) );
  OAI21X1 U2110 ( .A(n15), .B(n2351), .C(n2355), .Y(n1612) );
  NAND2X1 U2111 ( .A(\curr_reg[27][2] ), .B(n2353), .Y(n2355) );
  OAI21X1 U2112 ( .A(n17), .B(n2351), .C(n2356), .Y(n1611) );
  NAND2X1 U2113 ( .A(\curr_reg[27][3] ), .B(n2353), .Y(n2356) );
  OAI21X1 U2114 ( .A(n19), .B(n2351), .C(n2357), .Y(n1610) );
  NAND2X1 U2115 ( .A(\curr_reg[27][4] ), .B(n2353), .Y(n2357) );
  OAI21X1 U2116 ( .A(n21), .B(n2351), .C(n2358), .Y(n1609) );
  NAND2X1 U2117 ( .A(\curr_reg[27][5] ), .B(n2353), .Y(n2358) );
  OAI21X1 U2118 ( .A(n23), .B(n2351), .C(n2359), .Y(n1608) );
  NAND2X1 U2119 ( .A(\curr_reg[27][6] ), .B(n2353), .Y(n2359) );
  OAI21X1 U2120 ( .A(n25), .B(n2351), .C(n2360), .Y(n1607) );
  NAND2X1 U2121 ( .A(\curr_reg[27][7] ), .B(n2353), .Y(n2360) );
  NAND2X1 U2122 ( .A(n2361), .B(n1953), .Y(n2353) );
  INVX1 U2123 ( .A(n2361), .Y(n2351) );
  NOR2X1 U2124 ( .A(n2317), .B(n1924), .Y(n2361) );
  OAI21X1 U2125 ( .A(n11), .B(n2362), .C(n2363), .Y(n1606) );
  NAND2X1 U2126 ( .A(\curr_reg[26][0] ), .B(n2364), .Y(n2363) );
  OAI21X1 U2127 ( .A(n13), .B(n2362), .C(n2365), .Y(n1605) );
  NAND2X1 U2128 ( .A(\curr_reg[26][1] ), .B(n2364), .Y(n2365) );
  OAI21X1 U2129 ( .A(n15), .B(n2362), .C(n2366), .Y(n1604) );
  NAND2X1 U2130 ( .A(\curr_reg[26][2] ), .B(n2364), .Y(n2366) );
  OAI21X1 U2131 ( .A(n17), .B(n2362), .C(n2367), .Y(n1603) );
  NAND2X1 U2132 ( .A(\curr_reg[26][3] ), .B(n2364), .Y(n2367) );
  OAI21X1 U2133 ( .A(n19), .B(n2362), .C(n2368), .Y(n1602) );
  NAND2X1 U2134 ( .A(\curr_reg[26][4] ), .B(n2364), .Y(n2368) );
  OAI21X1 U2135 ( .A(n21), .B(n2362), .C(n2369), .Y(n1601) );
  NAND2X1 U2136 ( .A(\curr_reg[26][5] ), .B(n2364), .Y(n2369) );
  OAI21X1 U2137 ( .A(n23), .B(n2362), .C(n2370), .Y(n1600) );
  NAND2X1 U2138 ( .A(\curr_reg[26][6] ), .B(n2364), .Y(n2370) );
  OAI21X1 U2139 ( .A(n25), .B(n2362), .C(n2371), .Y(n1599) );
  NAND2X1 U2140 ( .A(\curr_reg[26][7] ), .B(n2364), .Y(n2371) );
  NAND2X1 U2141 ( .A(n2372), .B(n1953), .Y(n2364) );
  INVX1 U2142 ( .A(n2372), .Y(n2362) );
  NOR2X1 U2143 ( .A(n2013), .B(n2317), .Y(n2372) );
  OAI21X1 U2144 ( .A(n11), .B(n2373), .C(n2374), .Y(n1598) );
  NAND2X1 U2145 ( .A(\curr_reg[25][0] ), .B(n2375), .Y(n2374) );
  OAI21X1 U2146 ( .A(n13), .B(n2373), .C(n2376), .Y(n1597) );
  NAND2X1 U2147 ( .A(\curr_reg[25][1] ), .B(n2375), .Y(n2376) );
  OAI21X1 U2148 ( .A(n15), .B(n2373), .C(n2377), .Y(n1596) );
  NAND2X1 U2149 ( .A(\curr_reg[25][2] ), .B(n2375), .Y(n2377) );
  OAI21X1 U2150 ( .A(n17), .B(n2373), .C(n2378), .Y(n1595) );
  NAND2X1 U2151 ( .A(\curr_reg[25][3] ), .B(n2375), .Y(n2378) );
  OAI21X1 U2152 ( .A(n19), .B(n2373), .C(n2379), .Y(n1594) );
  NAND2X1 U2153 ( .A(\curr_reg[25][4] ), .B(n2375), .Y(n2379) );
  OAI21X1 U2154 ( .A(n21), .B(n2373), .C(n2380), .Y(n1593) );
  NAND2X1 U2155 ( .A(\curr_reg[25][5] ), .B(n2375), .Y(n2380) );
  OAI21X1 U2156 ( .A(n23), .B(n2373), .C(n2381), .Y(n1592) );
  NAND2X1 U2157 ( .A(\curr_reg[25][6] ), .B(n2375), .Y(n2381) );
  OAI21X1 U2158 ( .A(n25), .B(n2373), .C(n2382), .Y(n1591) );
  NAND2X1 U2159 ( .A(\curr_reg[25][7] ), .B(n2375), .Y(n2382) );
  NAND2X1 U2160 ( .A(n2383), .B(n1953), .Y(n2375) );
  INVX1 U2161 ( .A(n2383), .Y(n2373) );
  NOR2X1 U2162 ( .A(n2025), .B(n2317), .Y(n2383) );
  OAI21X1 U2163 ( .A(n11), .B(n2384), .C(n2385), .Y(n1590) );
  NAND2X1 U2164 ( .A(\curr_reg[24][0] ), .B(n2386), .Y(n2385) );
  OAI21X1 U2165 ( .A(n13), .B(n2384), .C(n2387), .Y(n1589) );
  NAND2X1 U2166 ( .A(\curr_reg[24][1] ), .B(n2386), .Y(n2387) );
  OAI21X1 U2167 ( .A(n15), .B(n2384), .C(n2388), .Y(n1588) );
  NAND2X1 U2168 ( .A(\curr_reg[24][2] ), .B(n2386), .Y(n2388) );
  OAI21X1 U2169 ( .A(n17), .B(n2384), .C(n2389), .Y(n1587) );
  NAND2X1 U2170 ( .A(\curr_reg[24][3] ), .B(n2386), .Y(n2389) );
  OAI21X1 U2171 ( .A(n19), .B(n2384), .C(n2390), .Y(n1586) );
  NAND2X1 U2172 ( .A(\curr_reg[24][4] ), .B(n2386), .Y(n2390) );
  OAI21X1 U2173 ( .A(n21), .B(n2384), .C(n2391), .Y(n1585) );
  NAND2X1 U2174 ( .A(\curr_reg[24][5] ), .B(n2386), .Y(n2391) );
  OAI21X1 U2175 ( .A(n23), .B(n2384), .C(n2392), .Y(n1584) );
  NAND2X1 U2176 ( .A(\curr_reg[24][6] ), .B(n2386), .Y(n2392) );
  OAI21X1 U2177 ( .A(n25), .B(n2384), .C(n2393), .Y(n1583) );
  NAND2X1 U2178 ( .A(\curr_reg[24][7] ), .B(n2386), .Y(n2393) );
  NAND2X1 U2179 ( .A(n2394), .B(n1953), .Y(n2386) );
  INVX1 U2180 ( .A(n2394), .Y(n2384) );
  NOR2X1 U2181 ( .A(n2037), .B(n2317), .Y(n2394) );
  NAND3X1 U2182 ( .A(curr_write_ptr[3]), .B(n2395), .C(curr_write_ptr[4]), .Y(
        n2317) );
  OAI21X1 U2183 ( .A(n11), .B(n2396), .C(n2397), .Y(n1582) );
  NAND2X1 U2184 ( .A(\curr_reg[23][0] ), .B(n2398), .Y(n2397) );
  OAI21X1 U2185 ( .A(n13), .B(n2396), .C(n2399), .Y(n1581) );
  NAND2X1 U2186 ( .A(\curr_reg[23][1] ), .B(n2398), .Y(n2399) );
  OAI21X1 U2187 ( .A(n15), .B(n2396), .C(n2400), .Y(n1580) );
  NAND2X1 U2188 ( .A(\curr_reg[23][2] ), .B(n2398), .Y(n2400) );
  OAI21X1 U2189 ( .A(n17), .B(n2396), .C(n2401), .Y(n1579) );
  NAND2X1 U2190 ( .A(\curr_reg[23][3] ), .B(n2398), .Y(n2401) );
  OAI21X1 U2191 ( .A(n19), .B(n2396), .C(n2402), .Y(n1578) );
  NAND2X1 U2192 ( .A(\curr_reg[23][4] ), .B(n2398), .Y(n2402) );
  OAI21X1 U2193 ( .A(n21), .B(n2396), .C(n2403), .Y(n1577) );
  NAND2X1 U2194 ( .A(\curr_reg[23][5] ), .B(n2398), .Y(n2403) );
  OAI21X1 U2195 ( .A(n23), .B(n2396), .C(n2404), .Y(n1576) );
  NAND2X1 U2196 ( .A(\curr_reg[23][6] ), .B(n2398), .Y(n2404) );
  OAI21X1 U2197 ( .A(n25), .B(n2396), .C(n2405), .Y(n1575) );
  NAND2X1 U2198 ( .A(\curr_reg[23][7] ), .B(n2398), .Y(n2405) );
  NAND2X1 U2199 ( .A(n2406), .B(n1953), .Y(n2398) );
  INVX1 U2200 ( .A(n2406), .Y(n2396) );
  NOR2X1 U2201 ( .A(n2407), .B(n1932), .Y(n2406) );
  OAI21X1 U2202 ( .A(n11), .B(n2408), .C(n2409), .Y(n1574) );
  NAND2X1 U2203 ( .A(\curr_reg[22][0] ), .B(n2410), .Y(n2409) );
  OAI21X1 U2204 ( .A(n13), .B(n2408), .C(n2411), .Y(n1573) );
  NAND2X1 U2205 ( .A(\curr_reg[22][1] ), .B(n2410), .Y(n2411) );
  OAI21X1 U2206 ( .A(n15), .B(n2408), .C(n2412), .Y(n1572) );
  NAND2X1 U2207 ( .A(\curr_reg[22][2] ), .B(n2410), .Y(n2412) );
  OAI21X1 U2208 ( .A(n17), .B(n2408), .C(n2413), .Y(n1571) );
  NAND2X1 U2209 ( .A(\curr_reg[22][3] ), .B(n2410), .Y(n2413) );
  OAI21X1 U2210 ( .A(n19), .B(n2408), .C(n2414), .Y(n1570) );
  NAND2X1 U2211 ( .A(\curr_reg[22][4] ), .B(n2410), .Y(n2414) );
  OAI21X1 U2212 ( .A(n21), .B(n2408), .C(n2415), .Y(n1569) );
  NAND2X1 U2213 ( .A(\curr_reg[22][5] ), .B(n2410), .Y(n2415) );
  OAI21X1 U2214 ( .A(n23), .B(n2408), .C(n2416), .Y(n1568) );
  NAND2X1 U2215 ( .A(\curr_reg[22][6] ), .B(n2410), .Y(n2416) );
  OAI21X1 U2216 ( .A(n25), .B(n2408), .C(n2417), .Y(n1567) );
  NAND2X1 U2217 ( .A(\curr_reg[22][7] ), .B(n2410), .Y(n2417) );
  NAND2X1 U2218 ( .A(n2418), .B(n1953), .Y(n2410) );
  INVX1 U2219 ( .A(n2418), .Y(n2408) );
  NOR2X1 U2220 ( .A(n2407), .B(n1966), .Y(n2418) );
  OAI21X1 U2221 ( .A(n11), .B(n2419), .C(n2420), .Y(n1566) );
  NAND2X1 U2222 ( .A(\curr_reg[21][0] ), .B(n2421), .Y(n2420) );
  OAI21X1 U2223 ( .A(n13), .B(n2419), .C(n2422), .Y(n1565) );
  NAND2X1 U2224 ( .A(\curr_reg[21][1] ), .B(n2421), .Y(n2422) );
  OAI21X1 U2225 ( .A(n15), .B(n2419), .C(n2423), .Y(n1564) );
  NAND2X1 U2226 ( .A(\curr_reg[21][2] ), .B(n2421), .Y(n2423) );
  OAI21X1 U2227 ( .A(n17), .B(n2419), .C(n2424), .Y(n1563) );
  NAND2X1 U2228 ( .A(\curr_reg[21][3] ), .B(n2421), .Y(n2424) );
  OAI21X1 U2229 ( .A(n19), .B(n2419), .C(n2425), .Y(n1562) );
  NAND2X1 U2230 ( .A(\curr_reg[21][4] ), .B(n2421), .Y(n2425) );
  OAI21X1 U2231 ( .A(n21), .B(n2419), .C(n2426), .Y(n1561) );
  NAND2X1 U2232 ( .A(\curr_reg[21][5] ), .B(n2421), .Y(n2426) );
  OAI21X1 U2233 ( .A(n23), .B(n2419), .C(n2427), .Y(n1560) );
  NAND2X1 U2234 ( .A(\curr_reg[21][6] ), .B(n2421), .Y(n2427) );
  OAI21X1 U2235 ( .A(n25), .B(n2419), .C(n2428), .Y(n1559) );
  NAND2X1 U2236 ( .A(\curr_reg[21][7] ), .B(n2421), .Y(n2428) );
  NAND2X1 U2237 ( .A(n2429), .B(n1953), .Y(n2421) );
  INVX1 U2238 ( .A(n2429), .Y(n2419) );
  NOR2X1 U2239 ( .A(n2407), .B(n1978), .Y(n2429) );
  OAI21X1 U2240 ( .A(n11), .B(n2430), .C(n2431), .Y(n1558) );
  NAND2X1 U2241 ( .A(\curr_reg[20][0] ), .B(n2432), .Y(n2431) );
  OAI21X1 U2242 ( .A(n13), .B(n2430), .C(n2433), .Y(n1557) );
  NAND2X1 U2243 ( .A(\curr_reg[20][1] ), .B(n2432), .Y(n2433) );
  OAI21X1 U2244 ( .A(n15), .B(n2430), .C(n2434), .Y(n1556) );
  NAND2X1 U2245 ( .A(\curr_reg[20][2] ), .B(n2432), .Y(n2434) );
  OAI21X1 U2246 ( .A(n17), .B(n2430), .C(n2435), .Y(n1555) );
  NAND2X1 U2247 ( .A(\curr_reg[20][3] ), .B(n2432), .Y(n2435) );
  OAI21X1 U2248 ( .A(n19), .B(n2430), .C(n2436), .Y(n1554) );
  NAND2X1 U2249 ( .A(\curr_reg[20][4] ), .B(n2432), .Y(n2436) );
  OAI21X1 U2250 ( .A(n21), .B(n2430), .C(n2437), .Y(n1553) );
  NAND2X1 U2251 ( .A(\curr_reg[20][5] ), .B(n2432), .Y(n2437) );
  OAI21X1 U2252 ( .A(n23), .B(n2430), .C(n2438), .Y(n1552) );
  NAND2X1 U2253 ( .A(\curr_reg[20][6] ), .B(n2432), .Y(n2438) );
  OAI21X1 U2254 ( .A(n25), .B(n2430), .C(n2439), .Y(n1551) );
  NAND2X1 U2255 ( .A(\curr_reg[20][7] ), .B(n2432), .Y(n2439) );
  NAND2X1 U2256 ( .A(n2440), .B(n1953), .Y(n2432) );
  INVX1 U2257 ( .A(n2440), .Y(n2430) );
  NOR2X1 U2258 ( .A(n2407), .B(n1990), .Y(n2440) );
  OAI21X1 U2259 ( .A(n11), .B(n2441), .C(n2442), .Y(n1550) );
  NAND2X1 U2260 ( .A(\curr_reg[19][0] ), .B(n2443), .Y(n2442) );
  OAI21X1 U2261 ( .A(n13), .B(n2441), .C(n2444), .Y(n1549) );
  NAND2X1 U2262 ( .A(\curr_reg[19][1] ), .B(n2443), .Y(n2444) );
  OAI21X1 U2263 ( .A(n15), .B(n2441), .C(n2445), .Y(n1548) );
  NAND2X1 U2264 ( .A(\curr_reg[19][2] ), .B(n2443), .Y(n2445) );
  OAI21X1 U2265 ( .A(n17), .B(n2441), .C(n2446), .Y(n1547) );
  NAND2X1 U2266 ( .A(\curr_reg[19][3] ), .B(n2443), .Y(n2446) );
  OAI21X1 U2267 ( .A(n19), .B(n2441), .C(n2447), .Y(n1546) );
  NAND2X1 U2268 ( .A(\curr_reg[19][4] ), .B(n2443), .Y(n2447) );
  OAI21X1 U2269 ( .A(n21), .B(n2441), .C(n2448), .Y(n1545) );
  NAND2X1 U2270 ( .A(\curr_reg[19][5] ), .B(n2443), .Y(n2448) );
  OAI21X1 U2271 ( .A(n23), .B(n2441), .C(n2449), .Y(n1544) );
  NAND2X1 U2272 ( .A(\curr_reg[19][6] ), .B(n2443), .Y(n2449) );
  OAI21X1 U2273 ( .A(n25), .B(n2441), .C(n2450), .Y(n1543) );
  NAND2X1 U2274 ( .A(\curr_reg[19][7] ), .B(n2443), .Y(n2450) );
  NAND2X1 U2275 ( .A(n2451), .B(n1953), .Y(n2443) );
  INVX1 U2276 ( .A(n2451), .Y(n2441) );
  NOR2X1 U2277 ( .A(n2407), .B(n1924), .Y(n2451) );
  OAI21X1 U2278 ( .A(n11), .B(n2452), .C(n2453), .Y(n1542) );
  NAND2X1 U2279 ( .A(\curr_reg[18][0] ), .B(n2454), .Y(n2453) );
  OAI21X1 U2280 ( .A(n13), .B(n2452), .C(n2455), .Y(n1541) );
  NAND2X1 U2281 ( .A(\curr_reg[18][1] ), .B(n2454), .Y(n2455) );
  OAI21X1 U2282 ( .A(n15), .B(n2452), .C(n2456), .Y(n1540) );
  NAND2X1 U2283 ( .A(\curr_reg[18][2] ), .B(n2454), .Y(n2456) );
  OAI21X1 U2284 ( .A(n17), .B(n2452), .C(n2457), .Y(n1539) );
  NAND2X1 U2285 ( .A(\curr_reg[18][3] ), .B(n2454), .Y(n2457) );
  OAI21X1 U2286 ( .A(n19), .B(n2452), .C(n2458), .Y(n1538) );
  NAND2X1 U2287 ( .A(\curr_reg[18][4] ), .B(n2454), .Y(n2458) );
  OAI21X1 U2288 ( .A(n21), .B(n2452), .C(n2459), .Y(n1537) );
  NAND2X1 U2289 ( .A(\curr_reg[18][5] ), .B(n2454), .Y(n2459) );
  OAI21X1 U2290 ( .A(n23), .B(n2452), .C(n2460), .Y(n1536) );
  NAND2X1 U2291 ( .A(\curr_reg[18][6] ), .B(n2454), .Y(n2460) );
  OAI21X1 U2292 ( .A(n25), .B(n2452), .C(n2461), .Y(n1535) );
  NAND2X1 U2293 ( .A(\curr_reg[18][7] ), .B(n2454), .Y(n2461) );
  NAND2X1 U2294 ( .A(n2462), .B(n1953), .Y(n2454) );
  INVX1 U2295 ( .A(n2462), .Y(n2452) );
  NOR2X1 U2296 ( .A(n2407), .B(n2013), .Y(n2462) );
  OAI21X1 U2297 ( .A(n11), .B(n2463), .C(n2464), .Y(n1534) );
  NAND2X1 U2298 ( .A(\curr_reg[17][0] ), .B(n2465), .Y(n2464) );
  OAI21X1 U2299 ( .A(n13), .B(n2463), .C(n2466), .Y(n1533) );
  NAND2X1 U2300 ( .A(\curr_reg[17][1] ), .B(n2465), .Y(n2466) );
  OAI21X1 U2301 ( .A(n15), .B(n2463), .C(n2467), .Y(n1532) );
  NAND2X1 U2302 ( .A(\curr_reg[17][2] ), .B(n2465), .Y(n2467) );
  OAI21X1 U2303 ( .A(n17), .B(n2463), .C(n2468), .Y(n1531) );
  NAND2X1 U2304 ( .A(\curr_reg[17][3] ), .B(n2465), .Y(n2468) );
  OAI21X1 U2305 ( .A(n19), .B(n2463), .C(n2469), .Y(n1530) );
  NAND2X1 U2306 ( .A(\curr_reg[17][4] ), .B(n2465), .Y(n2469) );
  OAI21X1 U2307 ( .A(n21), .B(n2463), .C(n2470), .Y(n1529) );
  NAND2X1 U2308 ( .A(\curr_reg[17][5] ), .B(n2465), .Y(n2470) );
  OAI21X1 U2309 ( .A(n23), .B(n2463), .C(n2471), .Y(n1528) );
  NAND2X1 U2310 ( .A(\curr_reg[17][6] ), .B(n2465), .Y(n2471) );
  OAI21X1 U2311 ( .A(n25), .B(n2463), .C(n2472), .Y(n1527) );
  NAND2X1 U2312 ( .A(\curr_reg[17][7] ), .B(n2465), .Y(n2472) );
  NAND2X1 U2313 ( .A(n2473), .B(n1953), .Y(n2465) );
  INVX1 U2314 ( .A(n2473), .Y(n2463) );
  NOR2X1 U2315 ( .A(n2407), .B(n2025), .Y(n2473) );
  OAI21X1 U2316 ( .A(n11), .B(n2474), .C(n2475), .Y(n1526) );
  NAND2X1 U2317 ( .A(\curr_reg[16][0] ), .B(n2476), .Y(n2475) );
  OAI21X1 U2318 ( .A(n13), .B(n2474), .C(n2477), .Y(n1525) );
  NAND2X1 U2319 ( .A(\curr_reg[16][1] ), .B(n2476), .Y(n2477) );
  OAI21X1 U2320 ( .A(n15), .B(n2474), .C(n2478), .Y(n1524) );
  NAND2X1 U2321 ( .A(\curr_reg[16][2] ), .B(n2476), .Y(n2478) );
  OAI21X1 U2322 ( .A(n17), .B(n2474), .C(n2479), .Y(n1523) );
  NAND2X1 U2323 ( .A(\curr_reg[16][3] ), .B(n2476), .Y(n2479) );
  OAI21X1 U2324 ( .A(n19), .B(n2474), .C(n2480), .Y(n1522) );
  NAND2X1 U2325 ( .A(\curr_reg[16][4] ), .B(n2476), .Y(n2480) );
  OAI21X1 U2326 ( .A(n21), .B(n2474), .C(n2481), .Y(n1521) );
  NAND2X1 U2327 ( .A(\curr_reg[16][5] ), .B(n2476), .Y(n2481) );
  OAI21X1 U2328 ( .A(n23), .B(n2474), .C(n2482), .Y(n1520) );
  NAND2X1 U2329 ( .A(\curr_reg[16][6] ), .B(n2476), .Y(n2482) );
  OAI21X1 U2330 ( .A(n25), .B(n2474), .C(n2483), .Y(n1519) );
  NAND2X1 U2331 ( .A(\curr_reg[16][7] ), .B(n2476), .Y(n2483) );
  NAND2X1 U2332 ( .A(n2484), .B(n1953), .Y(n2476) );
  INVX1 U2333 ( .A(n2484), .Y(n2474) );
  NOR2X1 U2334 ( .A(n2407), .B(n2037), .Y(n2484) );
  NAND3X1 U2335 ( .A(n2127), .B(n2395), .C(curr_write_ptr[4]), .Y(n2407) );
  OAI21X1 U2336 ( .A(n11), .B(n2485), .C(n2486), .Y(n1518) );
  NAND2X1 U2337 ( .A(\curr_reg[15][0] ), .B(n2487), .Y(n2486) );
  OAI21X1 U2338 ( .A(n13), .B(n2485), .C(n2488), .Y(n1517) );
  NAND2X1 U2339 ( .A(\curr_reg[15][1] ), .B(n2487), .Y(n2488) );
  OAI21X1 U2340 ( .A(n15), .B(n2485), .C(n2489), .Y(n1516) );
  NAND2X1 U2341 ( .A(\curr_reg[15][2] ), .B(n2487), .Y(n2489) );
  OAI21X1 U2342 ( .A(n17), .B(n2485), .C(n2490), .Y(n1515) );
  NAND2X1 U2343 ( .A(\curr_reg[15][3] ), .B(n2487), .Y(n2490) );
  OAI21X1 U2344 ( .A(n19), .B(n2485), .C(n2491), .Y(n1514) );
  NAND2X1 U2345 ( .A(\curr_reg[15][4] ), .B(n2487), .Y(n2491) );
  OAI21X1 U2346 ( .A(n21), .B(n2485), .C(n2492), .Y(n1513) );
  NAND2X1 U2347 ( .A(\curr_reg[15][5] ), .B(n2487), .Y(n2492) );
  OAI21X1 U2348 ( .A(n23), .B(n2485), .C(n2493), .Y(n1512) );
  NAND2X1 U2349 ( .A(\curr_reg[15][6] ), .B(n2487), .Y(n2493) );
  OAI21X1 U2350 ( .A(n25), .B(n2485), .C(n2494), .Y(n1511) );
  NAND2X1 U2351 ( .A(\curr_reg[15][7] ), .B(n2487), .Y(n2494) );
  NAND2X1 U2352 ( .A(n2495), .B(n1953), .Y(n2487) );
  INVX1 U2353 ( .A(n2495), .Y(n2485) );
  NOR2X1 U2354 ( .A(n2496), .B(n1932), .Y(n2495) );
  OAI21X1 U2355 ( .A(n11), .B(n2497), .C(n2498), .Y(n1510) );
  NAND2X1 U2356 ( .A(\curr_reg[14][0] ), .B(n2499), .Y(n2498) );
  OAI21X1 U2357 ( .A(n13), .B(n2497), .C(n2500), .Y(n1509) );
  NAND2X1 U2358 ( .A(\curr_reg[14][1] ), .B(n2499), .Y(n2500) );
  OAI21X1 U2359 ( .A(n15), .B(n2497), .C(n2501), .Y(n1508) );
  NAND2X1 U2360 ( .A(\curr_reg[14][2] ), .B(n2499), .Y(n2501) );
  OAI21X1 U2361 ( .A(n17), .B(n2497), .C(n2502), .Y(n1507) );
  NAND2X1 U2362 ( .A(\curr_reg[14][3] ), .B(n2499), .Y(n2502) );
  OAI21X1 U2363 ( .A(n19), .B(n2497), .C(n2503), .Y(n1506) );
  NAND2X1 U2364 ( .A(\curr_reg[14][4] ), .B(n2499), .Y(n2503) );
  OAI21X1 U2365 ( .A(n21), .B(n2497), .C(n2504), .Y(n1505) );
  NAND2X1 U2366 ( .A(\curr_reg[14][5] ), .B(n2499), .Y(n2504) );
  OAI21X1 U2367 ( .A(n23), .B(n2497), .C(n2505), .Y(n1504) );
  NAND2X1 U2368 ( .A(\curr_reg[14][6] ), .B(n2499), .Y(n2505) );
  OAI21X1 U2369 ( .A(n25), .B(n2497), .C(n2506), .Y(n1503) );
  NAND2X1 U2370 ( .A(\curr_reg[14][7] ), .B(n2499), .Y(n2506) );
  NAND2X1 U2371 ( .A(n2507), .B(n1953), .Y(n2499) );
  INVX1 U2372 ( .A(n2507), .Y(n2497) );
  NOR2X1 U2373 ( .A(n2496), .B(n1966), .Y(n2507) );
  OAI21X1 U2374 ( .A(n11), .B(n2508), .C(n2509), .Y(n1502) );
  NAND2X1 U2375 ( .A(\curr_reg[13][0] ), .B(n2510), .Y(n2509) );
  OAI21X1 U2376 ( .A(n13), .B(n2508), .C(n2511), .Y(n1501) );
  NAND2X1 U2377 ( .A(\curr_reg[13][1] ), .B(n2510), .Y(n2511) );
  OAI21X1 U2378 ( .A(n15), .B(n2508), .C(n2512), .Y(n1500) );
  NAND2X1 U2379 ( .A(\curr_reg[13][2] ), .B(n2510), .Y(n2512) );
  OAI21X1 U2380 ( .A(n17), .B(n2508), .C(n2513), .Y(n1499) );
  NAND2X1 U2381 ( .A(\curr_reg[13][3] ), .B(n2510), .Y(n2513) );
  OAI21X1 U2382 ( .A(n19), .B(n2508), .C(n2514), .Y(n1498) );
  NAND2X1 U2383 ( .A(\curr_reg[13][4] ), .B(n2510), .Y(n2514) );
  OAI21X1 U2384 ( .A(n21), .B(n2508), .C(n2515), .Y(n1497) );
  NAND2X1 U2385 ( .A(\curr_reg[13][5] ), .B(n2510), .Y(n2515) );
  OAI21X1 U2386 ( .A(n23), .B(n2508), .C(n2516), .Y(n1496) );
  NAND2X1 U2387 ( .A(\curr_reg[13][6] ), .B(n2510), .Y(n2516) );
  OAI21X1 U2388 ( .A(n25), .B(n2508), .C(n2517), .Y(n1495) );
  NAND2X1 U2389 ( .A(\curr_reg[13][7] ), .B(n2510), .Y(n2517) );
  NAND2X1 U2390 ( .A(n2518), .B(n1953), .Y(n2510) );
  INVX1 U2391 ( .A(n2518), .Y(n2508) );
  NOR2X1 U2392 ( .A(n2496), .B(n1978), .Y(n2518) );
  OAI21X1 U2393 ( .A(n11), .B(n2519), .C(n2520), .Y(n1494) );
  NAND2X1 U2394 ( .A(\curr_reg[12][0] ), .B(n2521), .Y(n2520) );
  OAI21X1 U2395 ( .A(n13), .B(n2519), .C(n2522), .Y(n1493) );
  NAND2X1 U2396 ( .A(\curr_reg[12][1] ), .B(n2521), .Y(n2522) );
  OAI21X1 U2397 ( .A(n15), .B(n2519), .C(n2523), .Y(n1492) );
  NAND2X1 U2398 ( .A(\curr_reg[12][2] ), .B(n2521), .Y(n2523) );
  OAI21X1 U2399 ( .A(n17), .B(n2519), .C(n2524), .Y(n1491) );
  NAND2X1 U2400 ( .A(\curr_reg[12][3] ), .B(n2521), .Y(n2524) );
  OAI21X1 U2401 ( .A(n19), .B(n2519), .C(n2525), .Y(n1490) );
  NAND2X1 U2402 ( .A(\curr_reg[12][4] ), .B(n2521), .Y(n2525) );
  OAI21X1 U2403 ( .A(n21), .B(n2519), .C(n2526), .Y(n1489) );
  NAND2X1 U2404 ( .A(\curr_reg[12][5] ), .B(n2521), .Y(n2526) );
  OAI21X1 U2405 ( .A(n23), .B(n2519), .C(n2527), .Y(n1488) );
  NAND2X1 U2406 ( .A(\curr_reg[12][6] ), .B(n2521), .Y(n2527) );
  OAI21X1 U2407 ( .A(n25), .B(n2519), .C(n2528), .Y(n1487) );
  NAND2X1 U2408 ( .A(\curr_reg[12][7] ), .B(n2521), .Y(n2528) );
  NAND2X1 U2409 ( .A(n2529), .B(n1953), .Y(n2521) );
  INVX1 U2410 ( .A(n2529), .Y(n2519) );
  NOR2X1 U2411 ( .A(n2496), .B(n1990), .Y(n2529) );
  OAI21X1 U2412 ( .A(n11), .B(n2530), .C(n2531), .Y(n1486) );
  NAND2X1 U2413 ( .A(\curr_reg[11][0] ), .B(n2532), .Y(n2531) );
  OAI21X1 U2414 ( .A(n13), .B(n2530), .C(n2533), .Y(n1485) );
  NAND2X1 U2415 ( .A(\curr_reg[11][1] ), .B(n2532), .Y(n2533) );
  OAI21X1 U2416 ( .A(n15), .B(n2530), .C(n2534), .Y(n1484) );
  NAND2X1 U2417 ( .A(\curr_reg[11][2] ), .B(n2532), .Y(n2534) );
  OAI21X1 U2418 ( .A(n17), .B(n2530), .C(n2535), .Y(n1483) );
  NAND2X1 U2419 ( .A(\curr_reg[11][3] ), .B(n2532), .Y(n2535) );
  OAI21X1 U2420 ( .A(n19), .B(n2530), .C(n2536), .Y(n1482) );
  NAND2X1 U2421 ( .A(\curr_reg[11][4] ), .B(n2532), .Y(n2536) );
  OAI21X1 U2422 ( .A(n21), .B(n2530), .C(n2537), .Y(n1481) );
  NAND2X1 U2423 ( .A(\curr_reg[11][5] ), .B(n2532), .Y(n2537) );
  OAI21X1 U2424 ( .A(n23), .B(n2530), .C(n2538), .Y(n1480) );
  NAND2X1 U2425 ( .A(\curr_reg[11][6] ), .B(n2532), .Y(n2538) );
  OAI21X1 U2426 ( .A(n25), .B(n2530), .C(n2539), .Y(n1479) );
  NAND2X1 U2427 ( .A(\curr_reg[11][7] ), .B(n2532), .Y(n2539) );
  NAND2X1 U2428 ( .A(n2540), .B(n1953), .Y(n2532) );
  INVX1 U2429 ( .A(n2540), .Y(n2530) );
  NOR2X1 U2430 ( .A(n2496), .B(n1924), .Y(n2540) );
  OAI21X1 U2431 ( .A(n11), .B(n2541), .C(n2542), .Y(n1478) );
  NAND2X1 U2432 ( .A(\curr_reg[10][0] ), .B(n2543), .Y(n2542) );
  OAI21X1 U2433 ( .A(n13), .B(n2541), .C(n2544), .Y(n1477) );
  NAND2X1 U2434 ( .A(\curr_reg[10][1] ), .B(n2543), .Y(n2544) );
  OAI21X1 U2435 ( .A(n15), .B(n2541), .C(n2545), .Y(n1476) );
  NAND2X1 U2436 ( .A(\curr_reg[10][2] ), .B(n2543), .Y(n2545) );
  OAI21X1 U2437 ( .A(n17), .B(n2541), .C(n2546), .Y(n1475) );
  NAND2X1 U2438 ( .A(\curr_reg[10][3] ), .B(n2543), .Y(n2546) );
  OAI21X1 U2439 ( .A(n19), .B(n2541), .C(n2547), .Y(n1474) );
  NAND2X1 U2440 ( .A(\curr_reg[10][4] ), .B(n2543), .Y(n2547) );
  OAI21X1 U2441 ( .A(n21), .B(n2541), .C(n2548), .Y(n1473) );
  NAND2X1 U2442 ( .A(\curr_reg[10][5] ), .B(n2543), .Y(n2548) );
  OAI21X1 U2443 ( .A(n23), .B(n2541), .C(n2549), .Y(n1472) );
  NAND2X1 U2444 ( .A(\curr_reg[10][6] ), .B(n2543), .Y(n2549) );
  OAI21X1 U2445 ( .A(n25), .B(n2541), .C(n2550), .Y(n1471) );
  NAND2X1 U2446 ( .A(\curr_reg[10][7] ), .B(n2543), .Y(n2550) );
  NAND2X1 U2447 ( .A(n2551), .B(n1953), .Y(n2543) );
  INVX1 U2448 ( .A(n2551), .Y(n2541) );
  NOR2X1 U2449 ( .A(n2496), .B(n2013), .Y(n2551) );
  OAI21X1 U2450 ( .A(n11), .B(n2552), .C(n2553), .Y(n1470) );
  NAND2X1 U2451 ( .A(\curr_reg[9][0] ), .B(n2554), .Y(n2553) );
  OAI21X1 U2452 ( .A(n13), .B(n2552), .C(n2555), .Y(n1469) );
  NAND2X1 U2453 ( .A(\curr_reg[9][1] ), .B(n2554), .Y(n2555) );
  OAI21X1 U2454 ( .A(n15), .B(n2552), .C(n2556), .Y(n1468) );
  NAND2X1 U2455 ( .A(\curr_reg[9][2] ), .B(n2554), .Y(n2556) );
  OAI21X1 U2456 ( .A(n17), .B(n2552), .C(n2557), .Y(n1467) );
  NAND2X1 U2457 ( .A(\curr_reg[9][3] ), .B(n2554), .Y(n2557) );
  OAI21X1 U2458 ( .A(n19), .B(n2552), .C(n2558), .Y(n1466) );
  NAND2X1 U2459 ( .A(\curr_reg[9][4] ), .B(n2554), .Y(n2558) );
  OAI21X1 U2460 ( .A(n21), .B(n2552), .C(n2559), .Y(n1465) );
  NAND2X1 U2461 ( .A(\curr_reg[9][5] ), .B(n2554), .Y(n2559) );
  OAI21X1 U2462 ( .A(n23), .B(n2552), .C(n2560), .Y(n1464) );
  NAND2X1 U2463 ( .A(\curr_reg[9][6] ), .B(n2554), .Y(n2560) );
  OAI21X1 U2464 ( .A(n25), .B(n2552), .C(n2561), .Y(n1463) );
  NAND2X1 U2465 ( .A(\curr_reg[9][7] ), .B(n2554), .Y(n2561) );
  NAND2X1 U2466 ( .A(n2562), .B(n1953), .Y(n2554) );
  INVX1 U2467 ( .A(n2562), .Y(n2552) );
  NOR2X1 U2468 ( .A(n2496), .B(n2025), .Y(n2562) );
  OAI21X1 U2469 ( .A(n11), .B(n2563), .C(n2564), .Y(n1462) );
  NAND2X1 U2470 ( .A(\curr_reg[8][0] ), .B(n2565), .Y(n2564) );
  OAI21X1 U2471 ( .A(n13), .B(n2563), .C(n2566), .Y(n1461) );
  NAND2X1 U2472 ( .A(\curr_reg[8][1] ), .B(n2565), .Y(n2566) );
  OAI21X1 U2473 ( .A(n15), .B(n2563), .C(n2567), .Y(n1460) );
  NAND2X1 U2474 ( .A(\curr_reg[8][2] ), .B(n2565), .Y(n2567) );
  OAI21X1 U2475 ( .A(n17), .B(n2563), .C(n2568), .Y(n1459) );
  NAND2X1 U2476 ( .A(\curr_reg[8][3] ), .B(n2565), .Y(n2568) );
  OAI21X1 U2477 ( .A(n19), .B(n2563), .C(n2569), .Y(n1458) );
  NAND2X1 U2478 ( .A(\curr_reg[8][4] ), .B(n2565), .Y(n2569) );
  OAI21X1 U2479 ( .A(n21), .B(n2563), .C(n2570), .Y(n1457) );
  NAND2X1 U2480 ( .A(\curr_reg[8][5] ), .B(n2565), .Y(n2570) );
  OAI21X1 U2481 ( .A(n23), .B(n2563), .C(n2571), .Y(n1456) );
  NAND2X1 U2482 ( .A(\curr_reg[8][6] ), .B(n2565), .Y(n2571) );
  OAI21X1 U2483 ( .A(n25), .B(n2563), .C(n2572), .Y(n1455) );
  NAND2X1 U2484 ( .A(\curr_reg[8][7] ), .B(n2565), .Y(n2572) );
  NAND2X1 U2485 ( .A(n2573), .B(n1953), .Y(n2565) );
  INVX1 U2486 ( .A(n2573), .Y(n2563) );
  NOR2X1 U2487 ( .A(n2496), .B(n2037), .Y(n2573) );
  NAND3X1 U2488 ( .A(n2217), .B(n2395), .C(curr_write_ptr[3]), .Y(n2496) );
  OAI21X1 U2489 ( .A(n11), .B(n2574), .C(n2575), .Y(n1454) );
  NAND2X1 U2490 ( .A(\curr_reg[7][0] ), .B(n2576), .Y(n2575) );
  OAI21X1 U2491 ( .A(n13), .B(n2574), .C(n2577), .Y(n1453) );
  NAND2X1 U2492 ( .A(\curr_reg[7][1] ), .B(n2576), .Y(n2577) );
  OAI21X1 U2493 ( .A(n15), .B(n2574), .C(n2578), .Y(n1452) );
  NAND2X1 U2494 ( .A(\curr_reg[7][2] ), .B(n2576), .Y(n2578) );
  OAI21X1 U2495 ( .A(n17), .B(n2574), .C(n2579), .Y(n1451) );
  NAND2X1 U2496 ( .A(\curr_reg[7][3] ), .B(n2576), .Y(n2579) );
  OAI21X1 U2497 ( .A(n19), .B(n2574), .C(n2580), .Y(n1450) );
  NAND2X1 U2498 ( .A(\curr_reg[7][4] ), .B(n2576), .Y(n2580) );
  OAI21X1 U2499 ( .A(n21), .B(n2574), .C(n2581), .Y(n1449) );
  NAND2X1 U2500 ( .A(\curr_reg[7][5] ), .B(n2576), .Y(n2581) );
  OAI21X1 U2501 ( .A(n23), .B(n2574), .C(n2582), .Y(n1448) );
  NAND2X1 U2502 ( .A(\curr_reg[7][6] ), .B(n2576), .Y(n2582) );
  OAI21X1 U2503 ( .A(n25), .B(n2574), .C(n2583), .Y(n1447) );
  NAND2X1 U2504 ( .A(\curr_reg[7][7] ), .B(n2576), .Y(n2583) );
  NAND2X1 U2505 ( .A(n2584), .B(n1953), .Y(n2576) );
  INVX1 U2506 ( .A(n2584), .Y(n2574) );
  NOR2X1 U2507 ( .A(n2585), .B(n1932), .Y(n2584) );
  NAND3X1 U2508 ( .A(curr_write_ptr[1]), .B(curr_write_ptr[0]), .C(
        curr_write_ptr[2]), .Y(n1932) );
  OAI21X1 U2509 ( .A(n11), .B(n2586), .C(n2587), .Y(n1446) );
  NAND2X1 U2510 ( .A(\curr_reg[6][0] ), .B(n2588), .Y(n2587) );
  OAI21X1 U2511 ( .A(n13), .B(n2586), .C(n2589), .Y(n1445) );
  NAND2X1 U2512 ( .A(\curr_reg[6][1] ), .B(n2588), .Y(n2589) );
  OAI21X1 U2513 ( .A(n15), .B(n2586), .C(n2590), .Y(n1444) );
  NAND2X1 U2514 ( .A(\curr_reg[6][2] ), .B(n2588), .Y(n2590) );
  OAI21X1 U2515 ( .A(n17), .B(n2586), .C(n2591), .Y(n1443) );
  NAND2X1 U2516 ( .A(\curr_reg[6][3] ), .B(n2588), .Y(n2591) );
  OAI21X1 U2517 ( .A(n19), .B(n2586), .C(n2592), .Y(n1442) );
  NAND2X1 U2518 ( .A(\curr_reg[6][4] ), .B(n2588), .Y(n2592) );
  OAI21X1 U2519 ( .A(n21), .B(n2586), .C(n2593), .Y(n1441) );
  NAND2X1 U2520 ( .A(\curr_reg[6][5] ), .B(n2588), .Y(n2593) );
  OAI21X1 U2521 ( .A(n23), .B(n2586), .C(n2594), .Y(n1440) );
  NAND2X1 U2522 ( .A(\curr_reg[6][6] ), .B(n2588), .Y(n2594) );
  OAI21X1 U2523 ( .A(n25), .B(n2586), .C(n2595), .Y(n1439) );
  NAND2X1 U2524 ( .A(\curr_reg[6][7] ), .B(n2588), .Y(n2595) );
  NAND2X1 U2525 ( .A(n2596), .B(n1953), .Y(n2588) );
  INVX1 U2526 ( .A(n2596), .Y(n2586) );
  NOR2X1 U2527 ( .A(n2585), .B(n1966), .Y(n2596) );
  NAND3X1 U2528 ( .A(curr_write_ptr[1]), .B(n2597), .C(curr_write_ptr[2]), .Y(
        n1966) );
  OAI21X1 U2529 ( .A(n11), .B(n2598), .C(n2599), .Y(n1438) );
  NAND2X1 U2530 ( .A(\curr_reg[5][0] ), .B(n2600), .Y(n2599) );
  OAI21X1 U2531 ( .A(n13), .B(n2598), .C(n2601), .Y(n1437) );
  NAND2X1 U2532 ( .A(\curr_reg[5][1] ), .B(n2600), .Y(n2601) );
  OAI21X1 U2533 ( .A(n15), .B(n2598), .C(n2602), .Y(n1436) );
  NAND2X1 U2534 ( .A(\curr_reg[5][2] ), .B(n2600), .Y(n2602) );
  OAI21X1 U2535 ( .A(n17), .B(n2598), .C(n2603), .Y(n1435) );
  NAND2X1 U2536 ( .A(\curr_reg[5][3] ), .B(n2600), .Y(n2603) );
  OAI21X1 U2537 ( .A(n19), .B(n2598), .C(n2604), .Y(n1434) );
  NAND2X1 U2538 ( .A(\curr_reg[5][4] ), .B(n2600), .Y(n2604) );
  OAI21X1 U2539 ( .A(n21), .B(n2598), .C(n2605), .Y(n1433) );
  NAND2X1 U2540 ( .A(\curr_reg[5][5] ), .B(n2600), .Y(n2605) );
  OAI21X1 U2541 ( .A(n23), .B(n2598), .C(n2606), .Y(n1432) );
  NAND2X1 U2542 ( .A(\curr_reg[5][6] ), .B(n2600), .Y(n2606) );
  OAI21X1 U2543 ( .A(n25), .B(n2598), .C(n2607), .Y(n1431) );
  NAND2X1 U2544 ( .A(\curr_reg[5][7] ), .B(n2600), .Y(n2607) );
  NAND2X1 U2545 ( .A(n2608), .B(n1953), .Y(n2600) );
  INVX1 U2546 ( .A(n2608), .Y(n2598) );
  NOR2X1 U2547 ( .A(n2585), .B(n1978), .Y(n2608) );
  NAND3X1 U2548 ( .A(curr_write_ptr[0]), .B(n2609), .C(curr_write_ptr[2]), .Y(
        n1978) );
  OAI21X1 U2549 ( .A(n11), .B(n2610), .C(n2611), .Y(n1430) );
  NAND2X1 U2550 ( .A(\curr_reg[4][0] ), .B(n2612), .Y(n2611) );
  OAI21X1 U2551 ( .A(n13), .B(n2610), .C(n2613), .Y(n1429) );
  NAND2X1 U2552 ( .A(\curr_reg[4][1] ), .B(n2612), .Y(n2613) );
  OAI21X1 U2553 ( .A(n15), .B(n2610), .C(n2614), .Y(n1428) );
  NAND2X1 U2554 ( .A(\curr_reg[4][2] ), .B(n2612), .Y(n2614) );
  OAI21X1 U2555 ( .A(n17), .B(n2610), .C(n2615), .Y(n1427) );
  NAND2X1 U2556 ( .A(\curr_reg[4][3] ), .B(n2612), .Y(n2615) );
  OAI21X1 U2557 ( .A(n19), .B(n2610), .C(n2616), .Y(n1426) );
  NAND2X1 U2558 ( .A(\curr_reg[4][4] ), .B(n2612), .Y(n2616) );
  OAI21X1 U2559 ( .A(n21), .B(n2610), .C(n2617), .Y(n1425) );
  NAND2X1 U2560 ( .A(\curr_reg[4][5] ), .B(n2612), .Y(n2617) );
  OAI21X1 U2561 ( .A(n23), .B(n2610), .C(n2618), .Y(n1424) );
  NAND2X1 U2562 ( .A(\curr_reg[4][6] ), .B(n2612), .Y(n2618) );
  OAI21X1 U2563 ( .A(n25), .B(n2610), .C(n2619), .Y(n1423) );
  NAND2X1 U2564 ( .A(\curr_reg[4][7] ), .B(n2612), .Y(n2619) );
  NAND2X1 U2565 ( .A(n2620), .B(n1953), .Y(n2612) );
  INVX1 U2566 ( .A(n2620), .Y(n2610) );
  NOR2X1 U2567 ( .A(n2585), .B(n1990), .Y(n2620) );
  NAND3X1 U2568 ( .A(n2597), .B(n2609), .C(curr_write_ptr[2]), .Y(n1990) );
  OAI21X1 U2569 ( .A(n11), .B(n2621), .C(n2622), .Y(n1422) );
  NAND2X1 U2570 ( .A(\curr_reg[3][0] ), .B(n2623), .Y(n2622) );
  OAI21X1 U2571 ( .A(n13), .B(n2621), .C(n2624), .Y(n1421) );
  NAND2X1 U2572 ( .A(\curr_reg[3][1] ), .B(n2623), .Y(n2624) );
  OAI21X1 U2573 ( .A(n15), .B(n2621), .C(n2625), .Y(n1420) );
  NAND2X1 U2574 ( .A(\curr_reg[3][2] ), .B(n2623), .Y(n2625) );
  OAI21X1 U2575 ( .A(n17), .B(n2621), .C(n2626), .Y(n1419) );
  NAND2X1 U2576 ( .A(\curr_reg[3][3] ), .B(n2623), .Y(n2626) );
  OAI21X1 U2577 ( .A(n19), .B(n2621), .C(n2627), .Y(n1418) );
  NAND2X1 U2578 ( .A(\curr_reg[3][4] ), .B(n2623), .Y(n2627) );
  OAI21X1 U2579 ( .A(n21), .B(n2621), .C(n2628), .Y(n1417) );
  NAND2X1 U2580 ( .A(\curr_reg[3][5] ), .B(n2623), .Y(n2628) );
  OAI21X1 U2581 ( .A(n23), .B(n2621), .C(n2629), .Y(n1416) );
  NAND2X1 U2582 ( .A(\curr_reg[3][6] ), .B(n2623), .Y(n2629) );
  OAI21X1 U2583 ( .A(n25), .B(n2621), .C(n2630), .Y(n1415) );
  NAND2X1 U2584 ( .A(\curr_reg[3][7] ), .B(n2623), .Y(n2630) );
  NAND2X1 U2585 ( .A(n2631), .B(n1953), .Y(n2623) );
  INVX1 U2586 ( .A(n2631), .Y(n2621) );
  NOR2X1 U2587 ( .A(n2585), .B(n1924), .Y(n2631) );
  NAND3X1 U2588 ( .A(curr_write_ptr[0]), .B(n2632), .C(curr_write_ptr[1]), .Y(
        n1924) );
  OAI21X1 U2589 ( .A(n11), .B(n2633), .C(n2634), .Y(n1414) );
  NAND2X1 U2590 ( .A(\curr_reg[2][0] ), .B(n2635), .Y(n2634) );
  OAI21X1 U2591 ( .A(n13), .B(n2633), .C(n2636), .Y(n1413) );
  NAND2X1 U2592 ( .A(\curr_reg[2][1] ), .B(n2635), .Y(n2636) );
  OAI21X1 U2593 ( .A(n15), .B(n2633), .C(n2637), .Y(n1412) );
  NAND2X1 U2594 ( .A(\curr_reg[2][2] ), .B(n2635), .Y(n2637) );
  OAI21X1 U2595 ( .A(n17), .B(n2633), .C(n2638), .Y(n1411) );
  NAND2X1 U2596 ( .A(\curr_reg[2][3] ), .B(n2635), .Y(n2638) );
  OAI21X1 U2597 ( .A(n19), .B(n2633), .C(n2639), .Y(n1410) );
  NAND2X1 U2598 ( .A(\curr_reg[2][4] ), .B(n2635), .Y(n2639) );
  OAI21X1 U2599 ( .A(n21), .B(n2633), .C(n2640), .Y(n1409) );
  NAND2X1 U2600 ( .A(\curr_reg[2][5] ), .B(n2635), .Y(n2640) );
  OAI21X1 U2601 ( .A(n23), .B(n2633), .C(n2641), .Y(n1408) );
  NAND2X1 U2602 ( .A(\curr_reg[2][6] ), .B(n2635), .Y(n2641) );
  OAI21X1 U2603 ( .A(n25), .B(n2633), .C(n2642), .Y(n1407) );
  NAND2X1 U2604 ( .A(\curr_reg[2][7] ), .B(n2635), .Y(n2642) );
  NAND2X1 U2605 ( .A(n2643), .B(n1953), .Y(n2635) );
  INVX1 U2606 ( .A(n2643), .Y(n2633) );
  NOR2X1 U2607 ( .A(n2585), .B(n2013), .Y(n2643) );
  NAND3X1 U2608 ( .A(n2597), .B(n2632), .C(curr_write_ptr[1]), .Y(n2013) );
  OAI21X1 U2609 ( .A(n11), .B(n2644), .C(n2645), .Y(n1406) );
  NAND2X1 U2610 ( .A(\curr_reg[1][0] ), .B(n2646), .Y(n2645) );
  OAI21X1 U2611 ( .A(n13), .B(n2644), .C(n2647), .Y(n1405) );
  NAND2X1 U2612 ( .A(\curr_reg[1][1] ), .B(n2646), .Y(n2647) );
  OAI21X1 U2613 ( .A(n15), .B(n2644), .C(n2648), .Y(n1404) );
  NAND2X1 U2614 ( .A(\curr_reg[1][2] ), .B(n2646), .Y(n2648) );
  OAI21X1 U2615 ( .A(n17), .B(n2644), .C(n2649), .Y(n1403) );
  NAND2X1 U2616 ( .A(\curr_reg[1][3] ), .B(n2646), .Y(n2649) );
  OAI21X1 U2617 ( .A(n19), .B(n2644), .C(n2650), .Y(n1402) );
  NAND2X1 U2618 ( .A(\curr_reg[1][4] ), .B(n2646), .Y(n2650) );
  OAI21X1 U2619 ( .A(n21), .B(n2644), .C(n2651), .Y(n1401) );
  NAND2X1 U2620 ( .A(\curr_reg[1][5] ), .B(n2646), .Y(n2651) );
  OAI21X1 U2621 ( .A(n23), .B(n2644), .C(n2652), .Y(n1400) );
  NAND2X1 U2622 ( .A(\curr_reg[1][6] ), .B(n2646), .Y(n2652) );
  OAI21X1 U2623 ( .A(n25), .B(n2644), .C(n2653), .Y(n1399) );
  NAND2X1 U2624 ( .A(\curr_reg[1][7] ), .B(n2646), .Y(n2653) );
  NAND2X1 U2625 ( .A(n2654), .B(n1953), .Y(n2646) );
  INVX1 U2626 ( .A(n2654), .Y(n2644) );
  NOR2X1 U2627 ( .A(n2585), .B(n2025), .Y(n2654) );
  NAND3X1 U2628 ( .A(n2609), .B(n2632), .C(curr_write_ptr[0]), .Y(n2025) );
  OAI21X1 U2629 ( .A(n11), .B(n2655), .C(n2656), .Y(n1398) );
  NAND2X1 U2630 ( .A(\curr_reg[0][0] ), .B(n2657), .Y(n2656) );
  AOI22X1 U2631 ( .A(rx_packet_data[0]), .B(n2658), .C(tx_data[0]), .D(n2659), 
        .Y(n1935) );
  OAI21X1 U2632 ( .A(n13), .B(n2655), .C(n2660), .Y(n1397) );
  NAND2X1 U2633 ( .A(\curr_reg[0][1] ), .B(n2657), .Y(n2660) );
  AOI22X1 U2634 ( .A(rx_packet_data[1]), .B(n2658), .C(tx_data[1]), .D(n2659), 
        .Y(n1938) );
  OAI21X1 U2635 ( .A(n15), .B(n2655), .C(n2661), .Y(n1396) );
  NAND2X1 U2636 ( .A(\curr_reg[0][2] ), .B(n2657), .Y(n2661) );
  AOI22X1 U2637 ( .A(rx_packet_data[2]), .B(n2658), .C(tx_data[2]), .D(n2659), 
        .Y(n1940) );
  OAI21X1 U2638 ( .A(n17), .B(n2655), .C(n2662), .Y(n1395) );
  NAND2X1 U2639 ( .A(\curr_reg[0][3] ), .B(n2657), .Y(n2662) );
  AOI22X1 U2640 ( .A(rx_packet_data[3]), .B(n2658), .C(tx_data[3]), .D(n2659), 
        .Y(n1942) );
  OAI21X1 U2641 ( .A(n19), .B(n2655), .C(n2663), .Y(n1394) );
  NAND2X1 U2642 ( .A(\curr_reg[0][4] ), .B(n2657), .Y(n2663) );
  AOI22X1 U2643 ( .A(rx_packet_data[4]), .B(n2658), .C(tx_data[4]), .D(n2659), 
        .Y(n1944) );
  OAI21X1 U2644 ( .A(n21), .B(n2655), .C(n2664), .Y(n1393) );
  NAND2X1 U2645 ( .A(\curr_reg[0][5] ), .B(n2657), .Y(n2664) );
  AOI22X1 U2646 ( .A(rx_packet_data[5]), .B(n2658), .C(tx_data[5]), .D(n2659), 
        .Y(n1946) );
  OAI21X1 U2647 ( .A(n23), .B(n2655), .C(n2665), .Y(n1392) );
  NAND2X1 U2648 ( .A(\curr_reg[0][6] ), .B(n2657), .Y(n2665) );
  AOI22X1 U2649 ( .A(rx_packet_data[6]), .B(n2658), .C(tx_data[6]), .D(n2659), 
        .Y(n1948) );
  OAI21X1 U2650 ( .A(n25), .B(n2655), .C(n2666), .Y(n1391) );
  NAND2X1 U2651 ( .A(\curr_reg[0][7] ), .B(n2657), .Y(n2666) );
  NAND2X1 U2652 ( .A(n2667), .B(n1953), .Y(n2657) );
  INVX1 U2653 ( .A(n2667), .Y(n2655) );
  NOR2X1 U2654 ( .A(n2585), .B(n2037), .Y(n2667) );
  NAND3X1 U2655 ( .A(n2609), .B(n2632), .C(n2597), .Y(n2037) );
  INVX1 U2656 ( .A(curr_write_ptr[0]), .Y(n2597) );
  INVX1 U2657 ( .A(curr_write_ptr[2]), .Y(n2632) );
  INVX1 U2658 ( .A(curr_write_ptr[1]), .Y(n2609) );
  NAND3X1 U2659 ( .A(n2217), .B(n2395), .C(n2127), .Y(n2585) );
  INVX1 U2660 ( .A(curr_write_ptr[3]), .Y(n2127) );
  INVX1 U2661 ( .A(curr_write_ptr[5]), .Y(n2395) );
  INVX1 U2662 ( .A(curr_write_ptr[4]), .Y(n2217) );
  AOI22X1 U2663 ( .A(rx_packet_data[7]), .B(n2658), .C(tx_data[7]), .D(n2659), 
        .Y(n1950) );
  AND2X1 U2664 ( .A(store_tx_data), .B(n1953), .Y(n2659) );
  NOR2X1 U2665 ( .A(n2668), .B(store_tx_data), .Y(n2658) );
  NAND2X1 U2666 ( .A(n817), .B(n804), .Y(n2668) );
  INVX1 U2667 ( .A(buffer_occupancy[6]), .Y(n804) );
  INVX1 U2668 ( .A(n2669), .Y(n817) );
  OAI21X1 U2669 ( .A(store_tx_data), .B(store_rx_packet_data), .C(n774), .Y(
        n2669) );
  INVX1 U2670 ( .A(n2670), .Y(n1390) );
  MUX2X1 U2671 ( .B(rx_data[7]), .A(N2038), .S(n2671), .Y(n2670) );
  INVX1 U2672 ( .A(n2672), .Y(n1388) );
  MUX2X1 U2673 ( .B(rx_data[6]), .A(N2039), .S(n2671), .Y(n2672) );
  INVX1 U2674 ( .A(n2673), .Y(n1386) );
  MUX2X1 U2675 ( .B(rx_data[5]), .A(N2040), .S(n2671), .Y(n2673) );
  INVX1 U2676 ( .A(n2674), .Y(n1384) );
  MUX2X1 U2677 ( .B(rx_data[4]), .A(N2041), .S(n2671), .Y(n2674) );
  INVX1 U2678 ( .A(n2675), .Y(n1382) );
  MUX2X1 U2679 ( .B(rx_data[3]), .A(N2042), .S(n2671), .Y(n2675) );
  INVX1 U2680 ( .A(n2676), .Y(n1380) );
  MUX2X1 U2681 ( .B(rx_data[2]), .A(N2043), .S(n2671), .Y(n2676) );
  INVX1 U2682 ( .A(n2677), .Y(n1378) );
  MUX2X1 U2683 ( .B(rx_data[1]), .A(N2044), .S(n2671), .Y(n2677) );
  INVX1 U2684 ( .A(n2678), .Y(n1376) );
  MUX2X1 U2685 ( .B(rx_data[0]), .A(N2045), .S(n2671), .Y(n2678) );
  AND2X1 U2686 ( .A(get_rx_data), .B(n771), .Y(n2671) );
  NOR2X1 U2687 ( .A(n2679), .B(get_tx_packet_data), .Y(n771) );
  INVX1 U2688 ( .A(n774), .Y(n2679) );
  NOR2X1 U2689 ( .A(flush), .B(clear), .Y(n774) );
endmodule


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
  wire   n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161;
  wire   [4:0] next_state;

  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(curr_state[0]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(curr_state[1]) );
  DFFSR \state_reg[3]  ( .D(next_state[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(curr_state[3]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(curr_state[2]) );
  DFFSR \state_reg[4]  ( .D(next_state[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(curr_state[4]) );
  DFFSR tx_transfer_active_reg ( .D(n161), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        tx_transfer_active) );
  OR2X1 U9 ( .A(n7), .B(n8), .Y(timer_en) );
  NAND3X1 U10 ( .A(n9), .B(n10), .C(n11), .Y(n8) );
  NOR2X1 U11 ( .A(n12), .B(n13), .Y(n11) );
  NAND3X1 U12 ( .A(n14), .B(n15), .C(n16), .Y(n7) );
  NOR2X1 U13 ( .A(n17), .B(n18), .Y(n16) );
  INVX1 U14 ( .A(load_en), .Y(n15) );
  OAI22X1 U15 ( .A(curr_state[0]), .B(n19), .C(n20), .D(n21), .Y(timer_clr) );
  NAND3X1 U16 ( .A(n22), .B(n23), .C(n24), .Y(n161) );
  MUX2X1 U17 ( .B(next_state[2]), .A(n25), .S(next_state[3]), .Y(n24) );
  NAND3X1 U18 ( .A(n26), .B(n27), .C(n28), .Y(next_state[3]) );
  NOR2X1 U19 ( .A(n29), .B(n30), .Y(n28) );
  OAI21X1 U20 ( .A(n31), .B(n10), .C(n9), .Y(n30) );
  NOR2X1 U21 ( .A(n32), .B(send_eop), .Y(n9) );
  INVX1 U22 ( .A(n33), .Y(n32) );
  NOR2X1 U23 ( .A(n34), .B(n35), .Y(n27) );
  AOI22X1 U24 ( .A(byte_done), .B(n36), .C(curr_state[3]), .D(n37), .Y(n26) );
  OAI21X1 U25 ( .A(n38), .B(n20), .C(n39), .Y(n37) );
  OAI21X1 U26 ( .A(n31), .B(n40), .C(n41), .Y(n36) );
  NAND2X1 U27 ( .A(next_state[2]), .B(n42), .Y(n25) );
  INVX1 U28 ( .A(next_state[0]), .Y(n42) );
  NAND3X1 U29 ( .A(n43), .B(n44), .C(n45), .Y(next_state[0]) );
  NOR2X1 U30 ( .A(n46), .B(n47), .Y(n45) );
  OAI21X1 U31 ( .A(n48), .B(n49), .C(n50), .Y(n47) );
  OAI21X1 U32 ( .A(n51), .B(n52), .C(n17), .Y(n50) );
  INVX1 U33 ( .A(tx_error), .Y(n49) );
  INVX1 U34 ( .A(n53), .Y(n48) );
  OAI21X1 U35 ( .A(n52), .B(n54), .C(n55), .Y(n46) );
  AOI21X1 U36 ( .A(n56), .B(pd_count[0]), .C(n57), .Y(n55) );
  AND2X1 U37 ( .A(n29), .B(n58), .Y(n56) );
  OAI21X1 U38 ( .A(n59), .B(n10), .C(n60), .Y(n29) );
  OR2X1 U39 ( .A(n59), .B(n19), .Y(n54) );
  AOI22X1 U40 ( .A(byte_done), .B(n18), .C(n61), .D(curr_state[0]), .Y(n44) );
  INVX1 U41 ( .A(n41), .Y(n18) );
  NOR2X1 U42 ( .A(n62), .B(n63), .Y(n43) );
  MUX2X1 U43 ( .B(n64), .A(n33), .S(n65), .Y(n63) );
  NAND3X1 U44 ( .A(n66), .B(n67), .C(n68), .Y(next_state[2]) );
  NOR2X1 U45 ( .A(n69), .B(n70), .Y(n68) );
  OAI21X1 U46 ( .A(n71), .B(n65), .C(n72), .Y(n70) );
  OAI21X1 U47 ( .A(n31), .B(n73), .C(n17), .Y(n72) );
  OAI21X1 U48 ( .A(n74), .B(n75), .C(n76), .Y(n69) );
  NOR2X1 U49 ( .A(get_tx_packet_data), .B(n57), .Y(n76) );
  NAND2X1 U50 ( .A(pd_count[0]), .B(n58), .Y(n75) );
  OR2X1 U51 ( .A(n10), .B(n59), .Y(n74) );
  AOI22X1 U52 ( .A(n13), .B(byte_done), .C(n77), .D(n78), .Y(n67) );
  AOI21X1 U53 ( .A(n61), .B(curr_state[2]), .C(n79), .Y(n66) );
  INVX1 U54 ( .A(next_state[4]), .Y(n23) );
  OAI21X1 U55 ( .A(byte_done), .B(n41), .C(n80), .Y(next_state[4]) );
  NOR2X1 U56 ( .A(n81), .B(n61), .Y(n80) );
  INVX1 U57 ( .A(next_state[1]), .Y(n22) );
  NAND3X1 U58 ( .A(n82), .B(n83), .C(n84), .Y(next_state[1]) );
  NOR2X1 U59 ( .A(n85), .B(n86), .Y(n84) );
  OAI22X1 U60 ( .A(n53), .B(n19), .C(n65), .D(n33), .Y(n86) );
  NAND2X1 U61 ( .A(n87), .B(n88), .Y(n33) );
  AOI22X1 U62 ( .A(n59), .B(n89), .C(n90), .D(tx_packet[2]), .Y(n53) );
  OAI21X1 U63 ( .A(n52), .B(n91), .C(n64), .Y(n85) );
  NAND2X1 U64 ( .A(n31), .B(n17), .Y(n91) );
  INVX1 U65 ( .A(n62), .Y(n83) );
  NAND3X1 U66 ( .A(n92), .B(n14), .C(n93), .Y(n62) );
  AOI22X1 U67 ( .A(n94), .B(n65), .C(n13), .D(n73), .Y(n93) );
  INVX1 U68 ( .A(byte_done), .Y(n73) );
  AND2X1 U69 ( .A(n88), .B(n95), .Y(n13) );
  INVX1 U70 ( .A(bit_done), .Y(n65) );
  INVX1 U71 ( .A(n71), .Y(n94) );
  AOI21X1 U72 ( .A(n61), .B(curr_state[1]), .C(n79), .Y(n82) );
  OAI21X1 U73 ( .A(n51), .B(n96), .C(n97), .Y(n79) );
  NOR2X1 U74 ( .A(n12), .B(n35), .Y(n97) );
  INVX1 U75 ( .A(n98), .Y(n35) );
  NAND2X1 U76 ( .A(n99), .B(n59), .Y(n96) );
  NAND3X1 U77 ( .A(n100), .B(n101), .C(n102), .Y(n59) );
  NOR2X1 U78 ( .A(buffer_occupancy[0]), .B(n103), .Y(n102) );
  OR2X1 U79 ( .A(buffer_occupancy[2]), .B(buffer_occupancy[1]), .Y(n103) );
  NOR2X1 U80 ( .A(buffer_occupancy[6]), .B(buffer_occupancy[5]), .Y(n101) );
  NOR2X1 U81 ( .A(buffer_occupancy[4]), .B(buffer_occupancy[3]), .Y(n100) );
  INVX1 U82 ( .A(n31), .Y(n51) );
  NOR2X1 U83 ( .A(n104), .B(pd_count[0]), .Y(n31) );
  INVX1 U84 ( .A(n58), .Y(n104) );
  NOR2X1 U85 ( .A(n105), .B(n106), .Y(n58) );
  NAND3X1 U86 ( .A(bit_count[3]), .B(n107), .C(pd_count[2]), .Y(n106) );
  INVX1 U87 ( .A(bit_count[0]), .Y(n107) );
  NAND2X1 U88 ( .A(n108), .B(n109), .Y(n105) );
  NOR2X1 U89 ( .A(pd_count[3]), .B(pd_count[1]), .Y(n109) );
  NOR2X1 U90 ( .A(bit_count[2]), .B(bit_count[1]), .Y(n108) );
  NOR2X1 U91 ( .A(n19), .B(n110), .Y(tx_error) );
  NAND3X1 U92 ( .A(n98), .B(n111), .C(n112), .Y(load_en) );
  NOR2X1 U93 ( .A(n34), .B(n113), .Y(n112) );
  NAND2X1 U94 ( .A(n114), .B(n92), .Y(n113) );
  NAND3X1 U95 ( .A(n115), .B(n116), .C(n117), .Y(data_to_send[7]) );
  OAI21X1 U96 ( .A(n89), .B(n118), .C(n119), .Y(n116) );
  NOR2X1 U97 ( .A(tx_packet[0]), .B(n120), .Y(n119) );
  NAND2X1 U98 ( .A(tx_packet_data[7]), .B(n121), .Y(n115) );
  NAND2X1 U99 ( .A(n122), .B(n123), .Y(data_to_send[6]) );
  AOI21X1 U100 ( .A(tx_packet_data[6]), .B(n121), .C(n124), .Y(n122) );
  OAI21X1 U101 ( .A(n125), .B(n126), .C(n117), .Y(data_to_send[5]) );
  INVX1 U102 ( .A(tx_packet_data[5]), .Y(n126) );
  NAND2X1 U103 ( .A(n127), .B(n128), .Y(data_to_send[4]) );
  AOI22X1 U104 ( .A(n52), .B(n129), .C(tx_packet_data[4]), .D(n121), .Y(n127)
         );
  INVX1 U105 ( .A(n89), .Y(n52) );
  NAND2X1 U106 ( .A(n130), .B(n131), .Y(data_to_send[3]) );
  AOI21X1 U107 ( .A(n124), .B(tx_packet[0]), .C(n132), .Y(n131) );
  OAI21X1 U108 ( .A(n133), .B(n114), .C(n134), .Y(n132) );
  INVX1 U109 ( .A(tx_packet[0]), .Y(n133) );
  AOI21X1 U110 ( .A(tx_packet_data[3]), .B(n121), .C(n135), .Y(n130) );
  INVX1 U111 ( .A(n117), .Y(n135) );
  NAND2X1 U112 ( .A(n136), .B(n128), .Y(data_to_send[2]) );
  INVX1 U113 ( .A(n137), .Y(n128) );
  AOI21X1 U114 ( .A(tx_packet_data[2]), .B(n121), .C(n138), .Y(n136) );
  INVX1 U115 ( .A(n134), .Y(n138) );
  NAND3X1 U116 ( .A(tx_packet[1]), .B(n129), .C(tx_packet[2]), .Y(n134) );
  NAND2X1 U117 ( .A(n139), .B(n120), .Y(data_to_send[1]) );
  AOI21X1 U118 ( .A(tx_packet_data[1]), .B(n121), .C(n61), .Y(n139) );
  INVX1 U119 ( .A(n125), .Y(n121) );
  NAND3X1 U120 ( .A(n140), .B(n141), .C(n142), .Y(data_to_send[0]) );
  NOR2X1 U121 ( .A(n143), .B(n144), .Y(n142) );
  OAI21X1 U122 ( .A(n20), .B(n21), .C(n123), .Y(n144) );
  AOI21X1 U123 ( .A(n129), .B(n89), .C(n137), .Y(n123) );
  NAND3X1 U124 ( .A(n117), .B(n98), .C(n145), .Y(n137) );
  NOR2X1 U125 ( .A(n81), .B(n146), .Y(n145) );
  NAND2X1 U126 ( .A(n60), .B(n41), .Y(n146) );
  NAND3X1 U127 ( .A(n147), .B(n148), .C(curr_state[4]), .Y(n41) );
  INVX1 U128 ( .A(n12), .Y(n60) );
  NOR2X1 U129 ( .A(n149), .B(n20), .Y(n12) );
  INVX1 U130 ( .A(n111), .Y(n81) );
  NAND2X1 U131 ( .A(n150), .B(n151), .Y(n111) );
  NAND2X1 U132 ( .A(n87), .B(n151), .Y(n98) );
  NOR2X1 U133 ( .A(n152), .B(n153), .Y(n117) );
  OAI22X1 U134 ( .A(n78), .B(n114), .C(n40), .D(n90), .Y(n153) );
  INVX1 U135 ( .A(n38), .Y(n78) );
  NOR2X1 U136 ( .A(n154), .B(n90), .Y(n38) );
  NAND2X1 U137 ( .A(tx_packet[1]), .B(tx_packet[0]), .Y(n90) );
  INVX1 U138 ( .A(tx_packet[2]), .Y(n154) );
  OAI21X1 U139 ( .A(tx_packet[2]), .B(n155), .C(n39), .Y(n152) );
  INVX1 U140 ( .A(n61), .Y(n39) );
  AOI21X1 U141 ( .A(n148), .B(n147), .C(n156), .Y(n61) );
  INVX1 U142 ( .A(n124), .Y(n155) );
  NOR2X1 U143 ( .A(n120), .B(tx_packet[1]), .Y(n124) );
  NOR2X1 U144 ( .A(n118), .B(tx_packet[2]), .Y(n89) );
  INVX1 U145 ( .A(tx_packet[1]), .Y(n118) );
  INVX1 U146 ( .A(n120), .Y(n129) );
  NOR2X1 U147 ( .A(n57), .B(n17), .Y(n120) );
  INVX1 U148 ( .A(n40), .Y(n17) );
  NAND3X1 U149 ( .A(n151), .B(n156), .C(n148), .Y(n40) );
  INVX1 U150 ( .A(n114), .Y(n57) );
  NAND3X1 U151 ( .A(n77), .B(n156), .C(n148), .Y(n114) );
  INVX1 U152 ( .A(n77), .Y(n20) );
  OAI21X1 U153 ( .A(n125), .B(n157), .C(n19), .Y(n143) );
  NAND3X1 U154 ( .A(n158), .B(n156), .C(n148), .Y(n19) );
  NOR2X1 U155 ( .A(curr_state[1]), .B(curr_state[3]), .Y(n148) );
  INVX1 U156 ( .A(tx_packet_data[0]), .Y(n157) );
  NOR2X1 U157 ( .A(n34), .B(n99), .Y(n125) );
  INVX1 U158 ( .A(n10), .Y(n99) );
  NAND2X1 U159 ( .A(n87), .B(n147), .Y(n10) );
  INVX1 U160 ( .A(n21), .Y(n87) );
  NAND3X1 U161 ( .A(n159), .B(n156), .C(curr_state[3]), .Y(n21) );
  AND2X1 U162 ( .A(n151), .B(n95), .Y(n34) );
  NOR2X1 U163 ( .A(n110), .B(n158), .Y(n151) );
  NOR2X1 U164 ( .A(send_eop), .B(get_tx_packet_data), .Y(n141) );
  INVX1 U165 ( .A(n14), .Y(get_tx_packet_data) );
  NAND2X1 U166 ( .A(n95), .B(n77), .Y(n14) );
  NOR2X1 U167 ( .A(n158), .B(curr_state[0]), .Y(n77) );
  INVX1 U168 ( .A(curr_state[2]), .Y(n158) );
  NAND2X1 U169 ( .A(n71), .B(n64), .Y(send_eop) );
  NAND2X1 U170 ( .A(n150), .B(n147), .Y(n64) );
  NAND2X1 U171 ( .A(n88), .B(n150), .Y(n71) );
  INVX1 U172 ( .A(n149), .Y(n150) );
  NAND3X1 U173 ( .A(curr_state[1]), .B(n156), .C(curr_state[3]), .Y(n149) );
  INVX1 U174 ( .A(curr_state[4]), .Y(n156) );
  NOR2X1 U175 ( .A(n88), .B(n160), .Y(n140) );
  INVX1 U176 ( .A(n92), .Y(n160) );
  NAND2X1 U177 ( .A(n147), .B(n95), .Y(n92) );
  NOR3X1 U178 ( .A(curr_state[3]), .B(curr_state[4]), .C(n159), .Y(n95) );
  INVX1 U179 ( .A(curr_state[1]), .Y(n159) );
  NOR2X1 U180 ( .A(curr_state[0]), .B(curr_state[2]), .Y(n147) );
  NOR2X1 U181 ( .A(n110), .B(curr_state[2]), .Y(n88) );
  INVX1 U182 ( .A(curr_state[0]), .Y(n110) );
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
  wire   n13, n14, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12;

  DFFSR d_out_reg ( .D(n14), .CLK(clk), .R(1'b1), .S(n_rst), .Q(dp_out) );
  DFFSR d_inv_reg ( .D(n13), .CLK(clk), .R(n_rst), .S(1'b1), .Q(dm_out) );
  MUX2X1 U4 ( .B(n3), .A(n4), .S(dp_out), .Y(n14) );
  AOI21X1 U5 ( .A(serial_in), .B(n5), .C(n6), .Y(n4) );
  INVX1 U6 ( .A(shift_strobe), .Y(n6) );
  NAND3X1 U7 ( .A(n5), .B(n7), .C(shift_strobe), .Y(n3) );
  INVX1 U8 ( .A(serial_in), .Y(n7) );
  MUX2X1 U9 ( .B(n8), .A(n9), .S(shift_strobe), .Y(n13) );
  NAND2X1 U10 ( .A(n10), .B(n5), .Y(n9) );
  OR2X1 U11 ( .A(n11), .B(n12), .Y(n5) );
  OAI21X1 U12 ( .A(curr_state[1]), .B(curr_state[0]), .C(curr_state[3]), .Y(
        n12) );
  OR2X1 U13 ( .A(curr_state[4]), .B(curr_state[2]), .Y(n11) );
  XOR2X1 U14 ( .A(serial_in), .B(dp_out), .Y(n10) );
  INVX1 U15 ( .A(dm_out), .Y(n8) );
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

  txcu fsm_ctrl ( .clk(clk), .n_rst(n_rst), .tx_packet_data(tx_packet_data), 
        .buffer_occupancy(buffer_occupancy), .tx_packet(tx_packet), 
        .byte_done(byte_done), .bit_done(bit_done), .pd_count(pd_count), 
        .bit_count(bit_count), .data_to_send(data_to_send), .timer_en(timer_en), .timer_clr(timer_clr), .load_en(load_en), .send_eop(send_eop), 
        .tx_transfer_active(tx_transfer_active), .get_tx_packet_data(
        get_tx_packet_data), .tx_error(tx_error), .curr_state(curr_state) );
  tx_timer timer ( .clk(clk), .n_rst(n_rst), .timer_en(timer_en), .timer_clr(
        timer_clr), .byte_done(byte_done), .bit_done(bit_done), .shift_strobe(
        shift_strobe), .pd_count(pd_count), .bit_count(bit_count) );
  flex_sr_SIZE8_MSB_FIRST0 pts_register ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .load_enable(load_en), .serial_in(1'b1), 
        .parallel_in(data_to_send), .serial_out(sr_to_stuffer) );
  encoder encoder_module ( .clk(clk), .n_rst(n_rst), .serial_in(sr_to_stuffer), 
        .shift_strobe(shift_strobe), .send_eop(send_eop), .curr_state(
        curr_state), .dp_out(dp_out), .dm_out(dm_out) );
endmodule


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
         N65, N66, N67, N68, N69, N70, N71, N72, N73, N74, N75, N76, N77, n15,
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
         n155, n156, n157, n158, n160;
  wire   [4:0] state;

  DFFSR prev_end_packet_reg ( .D(N73), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prev_end_packet) );
  DFFSR \state_reg[0]  ( .D(N65), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(N66), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  DFFSR \state_reg[4]  ( .D(N69), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[4])
         );
  DFFSR \state_reg[3]  ( .D(N68), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[3])
         );
  DFFSR \state_reg[2]  ( .D(N67), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  DFFSR prev_valid_reg ( .D(N70), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prev_valid) );
  DFFSR prev_prev_valid_reg ( .D(N71), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prev_prev_valid) );
  DFFSR prev_prev_prev_valid_reg ( .D(N72), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prev_prev_prev_valid) );
  DFFSR \rx_packet_reg[2]  ( .D(N76), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_packet[2]) );
  DFFSR \rx_packet_reg[1]  ( .D(N75), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_packet[1]) );
  DFFSR \rx_packet_reg[0]  ( .D(N74), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_packet[0]) );
  DFFSR rx_data_ready_reg ( .D(N77), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rx_data_ready) );
  INVX2 U16 ( .A(n52), .Y(restart) );
  NAND3X1 U17 ( .A(n15), .B(n16), .C(n17), .Y(rx_transfer_active) );
  NOR2X1 U18 ( .A(n18), .B(n19), .Y(rx_packet_data[7]) );
  NOR2X1 U19 ( .A(n18), .B(n20), .Y(rx_packet_data[6]) );
  NOR2X1 U20 ( .A(n18), .B(n21), .Y(rx_packet_data[5]) );
  NOR2X1 U21 ( .A(n18), .B(n22), .Y(rx_packet_data[4]) );
  NOR2X1 U22 ( .A(n18), .B(n23), .Y(rx_packet_data[3]) );
  NOR2X1 U23 ( .A(n18), .B(n24), .Y(rx_packet_data[2]) );
  NOR2X1 U24 ( .A(n18), .B(n25), .Y(rx_packet_data[1]) );
  NOR2X1 U25 ( .A(n26), .B(n18), .Y(rx_packet_data[0]) );
  NOR2X1 U26 ( .A(n27), .B(n28), .Y(rx_error) );
  NAND2X1 U27 ( .A(n29), .B(n30), .Y(n28) );
  INVX1 U28 ( .A(n18), .Y(rx_store_packet_data) );
  NAND3X1 U29 ( .A(n31), .B(n32), .C(n33), .Y(n18) );
  NOR2X1 U30 ( .A(n34), .B(n35), .Y(n33) );
  NOR2X1 U31 ( .A(n36), .B(n15), .Y(flush) );
  NOR2X1 U32 ( .A(n160), .B(n37), .Y(N77) );
  AOI21X1 U33 ( .A(n38), .B(n39), .C(rx_data_ready), .Y(n37) );
  NAND2X1 U34 ( .A(n40), .B(n41), .Y(N76) );
  AOI22X1 U35 ( .A(n42), .B(n26), .C(rx_packet[2]), .D(n43), .Y(n40) );
  NAND2X1 U36 ( .A(n44), .B(n45), .Y(N75) );
  AOI22X1 U37 ( .A(n46), .B(n42), .C(rx_packet[1]), .D(n43), .Y(n44) );
  NAND2X1 U38 ( .A(n47), .B(n45), .Y(N74) );
  INVX1 U39 ( .A(n48), .Y(n45) );
  OAI21X1 U40 ( .A(n15), .B(n49), .C(n41), .Y(n48) );
  INVX1 U41 ( .A(n50), .Y(n41) );
  OAI21X1 U42 ( .A(n51), .B(n15), .C(n52), .Y(n50) );
  NOR2X1 U43 ( .A(n20), .B(n53), .Y(n51) );
  OAI21X1 U44 ( .A(n46), .B(n54), .C(n24), .Y(n53) );
  OAI21X1 U45 ( .A(n55), .B(n56), .C(n49), .Y(n54) );
  NAND2X1 U46 ( .A(byte_reg[7]), .B(n23), .Y(n56) );
  MUX2X1 U47 ( .B(n57), .A(n58), .S(n21), .Y(n55) );
  NOR2X1 U48 ( .A(n26), .B(n59), .Y(n57) );
  NAND2X1 U49 ( .A(n25), .B(n22), .Y(n59) );
  INVX1 U50 ( .A(n60), .Y(n46) );
  NAND3X1 U51 ( .A(byte_reg[1]), .B(byte_reg[7]), .C(n61), .Y(n60) );
  NOR2X1 U52 ( .A(byte_reg[3]), .B(n62), .Y(n61) );
  NAND3X1 U53 ( .A(byte_reg[1]), .B(byte_reg[3]), .C(n63), .Y(n49) );
  NOR2X1 U54 ( .A(byte_reg[7]), .B(n62), .Y(n63) );
  AOI22X1 U55 ( .A(rx_packet[0]), .B(n43), .C(n64), .D(n58), .Y(n47) );
  NOR2X1 U56 ( .A(n25), .B(n22), .Y(n58) );
  NOR2X1 U57 ( .A(n26), .B(n15), .Y(n64) );
  INVX1 U58 ( .A(n42), .Y(n15) );
  NAND3X1 U59 ( .A(n65), .B(n17), .C(n66), .Y(n43) );
  NOR2X1 U60 ( .A(n67), .B(n34), .Y(n66) );
  INVX1 U61 ( .A(n68), .Y(n17) );
  NAND3X1 U62 ( .A(n69), .B(n70), .C(n71), .Y(n68) );
  NOR2X1 U63 ( .A(n72), .B(n73), .Y(n71) );
  NOR2X1 U64 ( .A(n160), .B(n74), .Y(N73) );
  NOR2X1 U65 ( .A(n160), .B(n34), .Y(N72) );
  NOR2X1 U66 ( .A(n75), .B(n76), .Y(N71) );
  NAND2X1 U67 ( .A(shift_strobe), .B(prev_valid), .Y(n76) );
  NAND2X1 U68 ( .A(n52), .B(n34), .Y(n75) );
  INVX1 U69 ( .A(n160), .Y(n52) );
  NOR2X1 U70 ( .A(n160), .B(n77), .Y(N70) );
  MUX2X1 U71 ( .B(prev_valid), .A(valid_byte), .S(shift_strobe), .Y(n77) );
  NOR2X1 U72 ( .A(n78), .B(state[1]), .Y(n160) );
  NAND3X1 U73 ( .A(n79), .B(n16), .C(n80), .Y(N69) );
  NAND3X1 U74 ( .A(state[3]), .B(n81), .C(n39), .Y(n16) );
  NAND3X1 U75 ( .A(n82), .B(n83), .C(n84), .Y(N68) );
  AOI21X1 U76 ( .A(n85), .B(n86), .C(n87), .Y(n84) );
  OAI21X1 U77 ( .A(n88), .B(n27), .C(n89), .Y(n87) );
  NAND3X1 U78 ( .A(n90), .B(n32), .C(n91), .Y(n89) );
  INVX1 U79 ( .A(n38), .Y(n27) );
  NOR2X1 U80 ( .A(n81), .B(state[3]), .Y(n38) );
  NOR2X1 U81 ( .A(n92), .B(n72), .Y(n82) );
  NAND3X1 U82 ( .A(n93), .B(n94), .C(n95), .Y(N67) );
  NOR2X1 U83 ( .A(n96), .B(n97), .Y(n95) );
  OAI21X1 U84 ( .A(n98), .B(n99), .C(n100), .Y(n97) );
  NAND3X1 U85 ( .A(state[0]), .B(state[1]), .C(n101), .Y(n100) );
  INVX1 U86 ( .A(n90), .Y(n98) );
  OAI21X1 U87 ( .A(n102), .B(n103), .C(n104), .Y(n96) );
  NAND2X1 U88 ( .A(n105), .B(prev_prev_valid), .Y(n103) );
  AOI21X1 U89 ( .A(n42), .B(n36), .C(n106), .Y(n94) );
  NAND3X1 U90 ( .A(byte_reg[0]), .B(n24), .C(byte_reg[1]), .Y(n36) );
  NOR2X1 U91 ( .A(n107), .B(n108), .Y(n93) );
  NAND3X1 U92 ( .A(n109), .B(n110), .C(n111), .Y(N66) );
  NOR2X1 U93 ( .A(n108), .B(n112), .Y(n111) );
  OAI21X1 U94 ( .A(n113), .B(n74), .C(n114), .Y(n112) );
  INVX1 U95 ( .A(n73), .Y(n114) );
  NAND3X1 U96 ( .A(n80), .B(n35), .C(n115), .Y(n73) );
  AOI21X1 U97 ( .A(state[4]), .B(n116), .C(n91), .Y(n115) );
  OAI21X1 U98 ( .A(n117), .B(n74), .C(n118), .Y(n108) );
  MUX2X1 U99 ( .B(n119), .A(n85), .S(n86), .Y(n118) );
  NOR2X1 U100 ( .A(n120), .B(n121), .Y(n119) );
  NAND3X1 U101 ( .A(byte_reg[7]), .B(n122), .C(n123), .Y(n121) );
  NOR2X1 U102 ( .A(n20), .B(n124), .Y(n123) );
  NAND3X1 U103 ( .A(n22), .B(n21), .C(n125), .Y(n120) );
  NOR2X1 U104 ( .A(byte_reg[3]), .B(byte_reg[0]), .Y(n125) );
  OAI21X1 U105 ( .A(n126), .B(n127), .C(n42), .Y(n110) );
  NOR2X1 U106 ( .A(n34), .B(n117), .Y(n42) );
  OAI21X1 U107 ( .A(n24), .B(n25), .C(n23), .Y(n127) );
  INVX1 U108 ( .A(byte_reg[3]), .Y(n23) );
  INVX1 U109 ( .A(byte_reg[1]), .Y(n25) );
  INVX1 U110 ( .A(byte_reg[2]), .Y(n24) );
  XNOR2X1 U111 ( .A(n26), .B(n122), .Y(n126) );
  INVX1 U112 ( .A(byte_reg[0]), .Y(n26) );
  AOI21X1 U113 ( .A(n101), .B(n128), .C(n92), .Y(n109) );
  INVX1 U114 ( .A(n104), .Y(n92) );
  NAND2X1 U115 ( .A(n85), .B(n129), .Y(n104) );
  XNOR2X1 U116 ( .A(n81), .B(state[0]), .Y(n128) );
  NAND3X1 U117 ( .A(n130), .B(n131), .C(n132), .Y(N65) );
  NOR2X1 U118 ( .A(n133), .B(n134), .Y(n132) );
  OAI21X1 U119 ( .A(n90), .B(n99), .C(n80), .Y(n134) );
  NAND3X1 U120 ( .A(state[4]), .B(n135), .C(n136), .Y(n80) );
  NOR2X1 U121 ( .A(state[0]), .B(n81), .Y(n136) );
  NAND3X1 U122 ( .A(n116), .B(state[1]), .C(state[4]), .Y(n99) );
  NOR2X1 U123 ( .A(n102), .B(end_packet), .Y(n90) );
  NAND2X1 U124 ( .A(n70), .B(n137), .Y(n133) );
  INVX1 U125 ( .A(start_count), .Y(n137) );
  NOR3X1 U126 ( .A(n129), .B(n65), .C(n86), .Y(start_count) );
  INVX1 U127 ( .A(prev_prev_prev_valid), .Y(n86) );
  NOR2X1 U128 ( .A(n85), .B(n138), .Y(n65) );
  INVX1 U129 ( .A(n124), .Y(n138) );
  NAND3X1 U130 ( .A(n139), .B(n30), .C(n140), .Y(n124) );
  NOR2X1 U131 ( .A(state[4]), .B(state[2]), .Y(n140) );
  NOR2X1 U132 ( .A(n81), .B(n78), .Y(n85) );
  NAND3X1 U133 ( .A(n29), .B(n30), .C(state[3]), .Y(n78) );
  NAND3X1 U134 ( .A(n141), .B(n122), .C(n142), .Y(n129) );
  NOR2X1 U135 ( .A(byte_reg[3]), .B(n143), .Y(n142) );
  NAND2X1 U136 ( .A(n20), .B(n19), .Y(n143) );
  INVX1 U137 ( .A(byte_reg[7]), .Y(n19) );
  INVX1 U138 ( .A(byte_reg[6]), .Y(n20) );
  NOR2X1 U139 ( .A(byte_reg[2]), .B(byte_reg[1]), .Y(n122) );
  INVX1 U140 ( .A(n62), .Y(n141) );
  NAND3X1 U141 ( .A(n22), .B(n21), .C(byte_reg[0]), .Y(n62) );
  INVX1 U142 ( .A(byte_reg[5]), .Y(n21) );
  INVX1 U143 ( .A(byte_reg[4]), .Y(n22) );
  OR2X1 U144 ( .A(n79), .B(state[0]), .Y(n70) );
  NAND3X1 U145 ( .A(n139), .B(n144), .C(state[4]), .Y(n79) );
  AOI22X1 U146 ( .A(n101), .B(n30), .C(end_packet), .D(n107), .Y(n131) );
  INVX1 U147 ( .A(n113), .Y(n107) );
  AOI21X1 U148 ( .A(n139), .B(n39), .C(n145), .Y(n113) );
  INVX1 U149 ( .A(n69), .Y(n145) );
  NAND3X1 U150 ( .A(n139), .B(n30), .C(n29), .Y(n69) );
  NOR2X1 U151 ( .A(state[1]), .B(state[3]), .Y(n139) );
  INVX1 U152 ( .A(n83), .Y(n101) );
  NAND3X1 U153 ( .A(n144), .B(n146), .C(state[3]), .Y(n83) );
  NOR2X1 U154 ( .A(n106), .B(n147), .Y(n130) );
  MUX2X1 U155 ( .B(n148), .A(n149), .S(n34), .Y(n147) );
  INVX1 U156 ( .A(prev_prev_valid), .Y(n34) );
  OR2X1 U157 ( .A(n117), .B(end_packet), .Y(n149) );
  NAND3X1 U158 ( .A(n81), .B(n146), .C(n116), .Y(n117) );
  INVX1 U159 ( .A(state[1]), .Y(n81) );
  NAND2X1 U160 ( .A(n105), .B(n102), .Y(n148) );
  INVX1 U161 ( .A(n35), .Y(n105) );
  OAI21X1 U162 ( .A(n35), .B(n32), .C(n150), .Y(n106) );
  AOI21X1 U163 ( .A(n91), .B(n151), .C(n72), .Y(n150) );
  INVX1 U164 ( .A(n152), .Y(n72) );
  NAND3X1 U165 ( .A(state[1]), .B(state[3]), .C(n39), .Y(n152) );
  NOR2X1 U166 ( .A(n30), .B(n88), .Y(n39) );
  INVX1 U167 ( .A(n29), .Y(n88) );
  NOR2X1 U168 ( .A(n144), .B(state[4]), .Y(n29) );
  INVX1 U169 ( .A(state[2]), .Y(n144) );
  NAND3X1 U170 ( .A(n74), .B(n32), .C(n102), .Y(n151) );
  NAND3X1 U171 ( .A(n153), .B(n154), .C(n155), .Y(n102) );
  NOR2X1 U172 ( .A(n31), .B(n156), .Y(n155) );
  OR2X1 U173 ( .A(buffer_occupancy[1]), .B(buffer_occupancy[0]), .Y(n156) );
  INVX1 U174 ( .A(buffer_occupancy[6]), .Y(n31) );
  NOR2X1 U175 ( .A(buffer_occupancy[5]), .B(buffer_occupancy[4]), .Y(n154) );
  NOR2X1 U176 ( .A(buffer_occupancy[3]), .B(buffer_occupancy[2]), .Y(n153) );
  INVX1 U177 ( .A(end_packet), .Y(n74) );
  INVX1 U178 ( .A(n157), .Y(n91) );
  NAND3X1 U179 ( .A(state[1]), .B(n146), .C(n116), .Y(n157) );
  NOR2X1 U180 ( .A(n67), .B(n30), .Y(n116) );
  INVX1 U181 ( .A(state[0]), .Y(n30) );
  INVX1 U182 ( .A(n135), .Y(n67) );
  INVX1 U183 ( .A(state[4]), .Y(n146) );
  INVX1 U184 ( .A(prev_end_packet), .Y(n32) );
  NAND3X1 U185 ( .A(n135), .B(state[1]), .C(n158), .Y(n35) );
  NOR2X1 U186 ( .A(state[4]), .B(state[0]), .Y(n158) );
  NOR2X1 U187 ( .A(state[3]), .B(state[2]), .Y(n135) );
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
         start_count, temp, n8, n10;
  wire   [7:0] input_data;
  wire   [7:0] byte_reg;

  DFFSR \byte_reg_reg[0]  ( .D(input_data[0]), .CLK(clk), .R(n10), .S(1'b1), 
        .Q(byte_reg[0]) );
  DFFSR \byte_reg_reg[1]  ( .D(input_data[1]), .CLK(clk), .R(n10), .S(1'b1), 
        .Q(byte_reg[1]) );
  DFFSR \byte_reg_reg[2]  ( .D(input_data[2]), .CLK(clk), .R(n10), .S(1'b1), 
        .Q(byte_reg[2]) );
  DFFSR \byte_reg_reg[3]  ( .D(input_data[3]), .CLK(clk), .R(n10), .S(1'b1), 
        .Q(byte_reg[3]) );
  DFFSR \byte_reg_reg[4]  ( .D(input_data[4]), .CLK(clk), .R(n10), .S(1'b1), 
        .Q(byte_reg[4]) );
  DFFSR \byte_reg_reg[5]  ( .D(input_data[5]), .CLK(clk), .R(n10), .S(1'b1), 
        .Q(byte_reg[5]) );
  DFFSR \byte_reg_reg[6]  ( .D(input_data[6]), .CLK(clk), .R(n10), .S(1'b1), 
        .Q(byte_reg[6]) );
  DFFSR \byte_reg_reg[7]  ( .D(input_data[7]), .CLK(clk), .R(n10), .S(1'b1), 
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
  INVX2 U10 ( .A(n_rst), .Y(n8) );
  OR2X1 U12 ( .A(error), .B(start_count), .Y(temp) );
  NOR2X1 U13 ( .A(restart), .B(n8), .Y(n10) );
endmodule


module top_level ( clk, n_rst, hsel, haddr, hsize, htrans, hwrite, hwdata, 
        hrdata, hresp, hready, dp_in, dm_in, d_mode, dp_out, dm_out );
  input [3:0] haddr;
  input [1:0] hsize;
  input [1:0] htrans;
  input [31:0] hwdata;
  output [31:0] hrdata;
  input clk, n_rst, hsel, hwrite, dp_in, dm_in;
  output hresp, hready, d_mode, dp_out, dm_out;
  wire   rx_data_ready, rx_transfer_active, rx_error, get_rx_data,
         store_tx_data, clear, tx_transfer_active, tx_error, flush,
         get_tx_packet_data, store_rx_packet_data;
  wire   [2:0] rx_packet;
  wire   [6:0] occupancy;
  wire   [7:0] rx_data;
  wire   [7:0] tx_data;
  wire   [2:0] tx_packet;
  wire   [7:0] rx_packet_data;
  wire   [7:0] tx_packet_data;

  ahb_subordinate_lite ahb ( .clk(clk), .n_rst(n_rst), .hsel(hsel), .haddr(
        haddr), .hsize(hsize), .htrans(htrans), .hwrite(hwrite), .hwdata(
        hwdata), .hrdata(hrdata), .hresp(hresp), .hready(hready), .rx_packet(
        rx_packet), .rx_data_ready(rx_data_ready), .rx_transfer_active(
        rx_transfer_active), .rx_error(rx_error), .d_mode(d_mode), 
        .buffer_occupancy(occupancy), .rx_data(rx_data), .get_rx_data(
        get_rx_data), .store_tx_data(store_tx_data), .tx_data(tx_data), 
        .clear(clear), .tx_packet(tx_packet), .tx_transfer_active(
        tx_transfer_active), .tx_error(tx_error) );
  data_buffer buffer ( .clk(clk), .n_rst(n_rst), .flush(flush), .clear(clear), 
        .get_rx_data(get_rx_data), .get_tx_packet_data(get_tx_packet_data), 
        .store_tx_data(store_tx_data), .store_rx_packet_data(
        store_rx_packet_data), .tx_data(tx_data), .rx_packet_data(
        rx_packet_data), .buffer_occupancy(occupancy), .tx_packet_data(
        tx_packet_data), .rx_data(rx_data) );
  usb_tx transmitter ( .clk(clk), .n_rst(n_rst), .tx_packet_data(
        tx_packet_data), .buffer_occupancy(occupancy), .tx_packet(tx_packet), 
        .dp_out(dp_out), .dm_out(dm_out), .tx_transfer_active(
        tx_transfer_active), .tx_error(tx_error), .get_tx_packet_data(
        get_tx_packet_data) );
  usb_rx rx ( .clk(clk), .n_rst(n_rst), .dp_in(dp_in), .dm_in(dm_in), 
        .buffer_occupancy(occupancy), .flush(flush), .rx_data_ready(
        rx_data_ready), .rx_transfer_active(rx_transfer_active), .rx_error(
        rx_error), .rx_store_packet_data(store_rx_packet_data), 
        .rx_packet_data(rx_packet_data), .rx_packet(rx_packet) );
endmodule


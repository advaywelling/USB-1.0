`timescale 1ns/10ps

`celldefine
module AND2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$B$Y = 0.14:0.14:0.14,
       tphhl$B$Y = 0.18:0.18:0.18,
       tpllh$A$Y = 0.14:0.14:0.14,
       tphhl$A$Y = 0.17:0.17:0.17;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AND2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.17:0.17:0.17,
       tphhl$A$Y = 0.2:0.2:0.2,
       tpllh$B$Y = 0.17:0.17:0.17,
       tphhl$B$Y = 0.21:0.21:0.21;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI21X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I0_out, A, B);
   or  (I1_out, I0_out, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.11:0.11:0.11,
       tphlh$A$Y = 0.12:0.12:0.12,
       tplhl$B$Y = 0.11:0.11:0.11,
       tphlh$B$Y = 0.11:0.11:0.11,
       tplhl$C$Y = 0.11:0.12:0.13,
       tphlh$C$Y = 0.069:0.085:0.1;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module AOI22X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   and (I0_out, A, B);
   and (I1_out, C, D);
   or  (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$C$Y = 0.089:0.095:0.1,
       tphlh$C$Y = 0.089:0.11:0.13,
       tplhl$D$Y = 0.089:0.094:0.099,
       tphlh$D$Y = 0.081:0.098:0.11,
       tplhl$A$Y = 0.12:0.13:0.15,
       tphlh$A$Y = 0.12:0.13:0.15,
       tplhl$B$Y = 0.12:0.13:0.15,
       tphlh$B$Y = 0.11:0.12:0.13;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX2 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.19:0.19:0.19,
       tphhl$A$Y = 0.18:0.18:0.18;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module BUFX4 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.21:0.21:0.21,
       tphhl$A$Y = 0.2:0.2:0.2;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUF1 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.25:0.25:0.25,
       tphhl$A$Y = 0.26:0.26:0.26;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUF2 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.37:0.37:0.37,
       tphhl$A$Y = 0.38:0.38:0.38;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module CLKBUF3 (A, Y);
input  A ;
output Y ;

   buf (Y, A);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.49:0.49:0.49,
       tphhl$A$Y = 0.5:0.5:0.5;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
// TP: Metastability decay wrapper file
module DFFNEGX1 (CLK, D, Q);
	input  CLK ;
	input  D ;
	output Q ;
	
	// Metastability handling signals
	reg Q_module;
	reg Q_meta_out;
	reg Q_tmp_out;
	integer v_seed = 1;
	integer d_seed = 2;
	reg v_value;
	integer d_value_ps;
	real d_value_ns;
	reg D_tmp;
	
	// Metastability handling constants
	localparam META_DELAY_MIN = 0; // This constanst values are in ps
	localparam META_DELAY_MAX = 150; // This constanst values are in ps
	localparam CELL_OUT_DELAY = 0.27; // This constanst values are in ns, based on max of progagation delays from cell relative to clock edge
	
	// Pull in the core cell module
	DFFNEGX1_CORE CELL_MODULE
	(
		.CLK(CLK),
		.D(D),
		.Q(Q_module)
	);
	
	// Connect the output to the 'output' from the metastability handler
	assign Q = Q_tmp_out;
	
	// No reset/set pins 
	// -> Don't need a way to have resets/sets bypass decay logic if it was triggered prior to reset/set
	// -> Just use to bypass potential extra delays from the handler using only one propagation delay
	always @ (Q_module, Q_meta_out)
	begin
		if((1'b0 == Q_module) || (1'b1 == Q_module))
		begin
			// Decay shouldn't have activated
			// -> bypass the potentially extra delay from the handler using only one propagation delay
			Q_tmp_out = Q_module;
		end
		else
		begin
			// This pass was due to either a value change on Q_meta_out from the metastability handler
			// or was due to a change to a metastable value on the Q_module from the core
			// -> metastablility handler should already be active and is needed -> use it's value
			Q_tmp_out = Q_meta_out;
		end
	end
	
	// Metastability handling process
	always @ (negedge CLK)
	begin
		// Grab input valuse and move away from clock edge to allow values to properly update before checks
		D_tmp = D;
		#(CELL_OUT_DELAY);
		
		// By default just connect the output to the internal version (common case)
		Q_meta_out = Q_module;
		
		// Check for and decay propagating metastability
		if(1'bx === Q_module)
		begin
			// Currently outputting a metastable value
			if((1'b1 !== D_tmp) && (1'b0 !== D_tmp))
			begin // Bad input -> assume metastable input is propagating to output
			 // This FF is propagating a metastable value -> need to model value decay
			 $warning("DFFNEGX1 instance grabed an invalid input and is propagating a metastable value");
			 
			 // Handle metastable value decay
			 // Get new random decayed line value
			 v_value = $dist_uniform(v_seed, 0, 1);
			
			 // Get new random decay delay time value
			 d_value_ps = $dist_uniform(d_seed, META_DELAY_MIN, META_DELAY_MAX);
			 d_value_ns = $itor(d_value_ps)/1000; // need to convert from ps to ns
			 
			 // Apply the decayed value to the output
			 #(d_value_ns);
			 Q_meta_out = v_value;
			 $warning("DFFNEGX1 instance's metastable output value has randomly decayed to a value of %0d", v_value);
			end
		end
	end
endmodule

`timescale 1ns/10ps
`celldefine
module DFFNEGX1_CORE (CLK, D, Q);
	input  CLK ;
	input  D ;
	output Q ;
	reg NOTIFIER ;
	
	not (I0_CLOCK, CLK);
	udp_dff D0 (DS0000, D, I0_CLOCK, 1'B0, 1'B0, NOTIFIER);
	not (P0002, DS0000);
	buf (Q_tmp_meta, DS0000);

	specify
		// delay parameters
		specparam
			tphlh$CLK$Q = 0.27:0.27:0.27,
			tphhl$CLK$Q = 0.24:0.24:0.24,
			tminpwh$CLK = 0.077:0.18:0.27,
			tminpwl$CLK = 0.14:0.2:0.27,
			tsetup_negedge$D$CLK = 0.38:0.38:0.38,
			thold_negedge$D$CLK = -0.094:-0.094:-0.094,
			tsetup_posedge$D$CLK = 0.28:0.28:0.28,
			thold_posedge$D$CLK = -0.094:-0.094:-0.094;

		// path delays
		(CLK *> Q) = (tphlh$CLK$Q, tphhl$CLK$Q);
		$setup(negedge D, negedge CLK, tsetup_negedge$D$CLK, NOTIFIER);
		$hold (negedge D, negedge CLK, thold_negedge$D$CLK,  NOTIFIER);
		$setup(posedge D, negedge CLK, tsetup_posedge$D$CLK, NOTIFIER);
		$hold (posedge D, negedge CLK, thold_posedge$D$CLK,  NOTIFIER);
		$width(posedge CLK, tminpwh$CLK, 0, NOTIFIER);
		$width(negedge CLK, tminpwl$CLK, 0, NOTIFIER);
	endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
// TP: Metastability decay wrapper file
module DFFPOSX1 (CLK, D, Q);
	input  CLK ;
	input  D ;
	output Q ;
	
	// Metastability handling signals
	reg Q_module;
	reg Q_meta_out;
	reg Q_tmp_out;
	integer v_seed = 1;
	integer d_seed = 2;
	reg v_value;
	integer d_value_ps;
	real d_value_ns;
	reg D_tmp;
	
	// Metastability handling constants
	localparam META_DELAY_MIN = 0; // This constanst values are in ps
	localparam META_DELAY_MAX = 150; // This constanst values are in ps
	localparam CELL_OUT_DELAY = 0.3; // This constanst values are in ns, based on max of progagation delays from cell relative to clock edge
	
	// Pull in the core cell module
	DFFPOSX1_CORE CELL_MODULE
	(
		.CLK(CLK),
		.D(D),
		.Q(Q_module)
	);
	
	// Connect the output to the 'output' from the metastability handler
	assign Q = Q_tmp_out;
	
	// No reset/set pins 
	// -> Don't need a way to have resets/sets bypass decay logic if it was triggered prior to reset/set
	// -> Just use to bypass potential extra delays from the handler using only one propagation delay
	always @ (Q_module, Q_meta_out)
	begin
		if((1'b0 == Q_module) || (1'b1 == Q_module))
		begin
			// Decay shouldn't have activated
			// -> bypass the potentially extra delay from the handler using only one propagation delay
			Q_tmp_out = Q_module;
		end
		else
		begin
			// This pass was due to either a value change on Q_meta_out from the metastability handler
			// or was due to a change to a metastable value on the Q_module from the core
			// -> metastablility handler should already be active and is needed -> use it's value
			Q_tmp_out = Q_meta_out;
		end
	end
	
	// Metastability handling process
	always @ (posedge CLK)
	begin
		// Grab input valuse and move away from clock edge to allow values to properly update before checks
		D_tmp = D;
		#(CELL_OUT_DELAY);
		
		// By default just connect the output to the internal version (common case)
		Q_meta_out = Q_module;
		
		// Check for and decay propagating metastability
		if(1'bx === Q_module)
		begin
			// Currently outputting a metastable value
			if((1'b1 !== D_tmp) && (1'b0 !== D_tmp))
			begin // Bad input -> assume metastable input is propagating to output
			 // This FF is propagating a metastable value -> need to model value decay
			 $warning("DFFPOSX1 instance grabed an invalid input and is propagating a metastable value");
			 
			 // Handle metastable value decay
			 // Get new random decayed line value
			 v_value = $dist_uniform(v_seed, 0, 1);
			
			 // Get new random decay delay time value
			 d_value_ps = $dist_uniform(d_seed, META_DELAY_MIN, META_DELAY_MAX);
			 d_value_ns = $itor(d_value_ps)/1000; // need to convert from ps to ns
			 
			 // Apply the decayed value to the output
			 #(d_value_ns);
			 Q_meta_out = v_value;
			 $warning("DFFPOSX1 instance's metastable output value has randomly decayed to a value of %0d", v_value);
			end
		end
	end
endmodule

`timescale 1ns/10ps
`celldefine
module DFFPOSX1_CORE (CLK, D, Q);
	input  CLK ;
	input  D ;
	output Q ;
	reg NOTIFIER ;

	udp_dff D0 (DS0000, D, CLK, 1'B0, 1'B0, NOTIFIER);
	not (P0002, DS0000);
	buf (Q_tmp_meta, DS0000);

	specify
		// delay parameters
		specparam
		 tpllh$CLK$Q = 0.21:0.21:0.21,
		 tplhl$CLK$Q = 0.3:0.3:0.3,
		 tminpwh$CLK = 0.1:0.2:0.3,
		 tminpwl$CLK = 0.085:0.18:0.27,
		 tsetup_negedge$D$CLK = 0.28:0.28:0.28,
		 thold_negedge$D$CLK = -0.094:-0.094:-0.094,
		 tsetup_posedge$D$CLK = 0.28:0.28:0.28,
		 thold_posedge$D$CLK = -0.094:-0.094:-0.094;

		// path delays
		(CLK *> Q) = (tpllh$CLK$Q, tplhl$CLK$Q);
		$setup(negedge D, posedge CLK, tsetup_negedge$D$CLK, NOTIFIER);
		$hold (negedge D, posedge CLK, thold_negedge$D$CLK,  NOTIFIER);
		$setup(posedge D, posedge CLK, tsetup_posedge$D$CLK, NOTIFIER);
		$hold (posedge D, posedge CLK, thold_posedge$D$CLK,  NOTIFIER);
		$width(posedge CLK, tminpwh$CLK, 0, NOTIFIER);
		$width(negedge CLK, tminpwl$CLK, 0, NOTIFIER);

	endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
// TP: Metastability decay wrapper file
module DFFSR (CLK, D, R, S, Q);
	input  CLK ;
	input  D ;
	input  R ;
	input  S ;
	output Q ;
	
	// Metastability handling signals
	wire Q_module;
	reg Q_meta_out;
	reg Q_tmp_out;
	integer v_seed = 1;
	integer d_seed = 2;
	reg v_value;
	integer d_value_ps;
	real d_value_ns;
	reg D_tmp;
	reg R_tmp;
	reg S_tmp;
	
	// Metastability handling constants
	localparam META_DELAY_MIN = 0; // This constanst values are in ps
	localparam META_DELAY_MAX = 150; // This constanst values are in ps
	localparam CELL_OUT_DELAY = 0.65; // This constanst values are in ns, based on max of progagation delays from cell relative to clock edge
	
	// Pull in the core cell module
	DFFSR_CORE CELL_MODULE
	(
		.CLK(CLK),
		.D(D),
		.R(R),
		.S(S),
		.Q(Q_module)
	);
	
	// Connect the output to the 'output' from the metastability handler
	assign Q = Q_tmp_out;
	
	// Need a way to have resets/sets bypass decay logic if it was triggered prior to reset/set
	always @ (Q_module, Q_meta_out)
	begin
		if((1'b0 == Q_module) || (1'b1 == Q_module))
		begin
			// A reset/set happened or decay shouldn't have activated
			// -> bypass the metastable decay handler's value
			Q_tmp_out = Q_module;
		end
		else
		begin
			// This pass was due to either a value change on Q_meta_out from the metastability handler
			// or was due to a change to a metastable value on the Q_module from the core
			// -> metastablility handler should already be active and is needed -> use it's value
			Q_tmp_out = Q_meta_out;
		end
	end
	
	// Metastability handling process
	always @ (posedge CLK)
	begin
		// Grab input valuse and move away from clock edge to allow values to properly update before checks
    D_tmp = D;
    R_tmp = R;
    S_tmp = S;
		#(CELL_OUT_DELAY);
		
		// By default just connect the output to the internal version (common case)
		Q_meta_out = Q_module;
		
		// Check for and decay propagating metastability
		if(1'bx === Q_module)
		begin
			// Currently outputting a metastable value
		  if(((1'b1 !== D_tmp) && (1'b0 !== D_tmp)) || ((1'b1 !== R_tmp) && (1'b0 !== R_tmp)) || ((1'b1 !== S_tmp) && (1'b0 !== S_tmp)))
			begin // At least one bad inputs -> assume metastable input is propagating to output
			 // This FF is propagating a metastable value -> need to model value decay
			 $warning("DFFSR instance grabed an invalid input and is propagating a metastable value");
			 
			 // Handle metastable value decay
			 // Get new random decayed line value
			 v_value = $dist_uniform(v_seed, 0, 1);
			
			 // Get new random decay delay time value
			 d_value_ps = $dist_uniform(d_seed, META_DELAY_MIN, META_DELAY_MAX);
			 d_value_ns = $itor(d_value_ps)/1000; // need to convert from ps to ns
			 
			 // Apply the decayed value to the output
			 #(d_value_ns);
			 Q_meta_out = v_value;
			 $warning("DFFSR instance's metastable output value has randomly decayed to a value of %0d", v_value);
			end
		end
	end
endmodule
	
`timescale 1ns/10ps
`celldefine
module DFFSR_CORE (CLK, D, R, S, Q);
	input  CLK ;
	input  D ;
	input  R ;
	input  S ;
	output Q ;
	reg NOTIFIER ;

	not (I0_CLEAR, R);
	not (I0_SET, S);
	udp_dff D0 (P0003, D_, CLK, I0_SET, I0_CLEAR, NOTIFIER);
	not (D_, D);
	not (P0002, P0003);
	buf (Q, P0002);
	and (\D&S , D, S);
	not (I7_out, D);
	and (\~D&R , I7_out, R);
	and (\S&R , S, R);

	specify
		// delay parameters
		specparam
			tphlh$S$Q = 0.46:0.46:0.46,
			tpllh$R$Q = 0.33:0.33:0.33,
			tphhl$R$Q = 0.4:0.41:0.41,
			tpllh$CLK$Q = 0.57:0.57:0.57,
			tplhl$CLK$Q = 0.65:0.65:0.65,
			tminpwl$S = 0.064:0.26:0.46,
			tminpwl$R = 0.043:0.23:0.41,
			tminpwh$CLK = 0.32:0.49:0.65,
			tminpwl$CLK = 0.3:0.33:0.37,
			tsetup_negedge$D$CLK = 0.094:0.094:0.094,
			thold_negedge$D$CLK = 0.094:0.094:0.094,
			tsetup_posedge$D$CLK = 0.19:0.19:0.19,
			thold_posedge$D$CLK = 0.000000062:0.000000062:0.000000062,
			trec$R$CLK = 0.19:0.19:0.19, // CHANGED: all were -0.19
			trem$R$CLK = 0.28:0.28:0.28,
			trec$R$S = 0.000000062:0.000000062:0.000000062,
			trec$S$CLK = 0:0:0,
			trem$S$CLK = 0.19:0.19:0.19,
			trec$S$R = 0.094:0.094:0.094;

		// path delays
		(CLK *> Q) = (tpllh$CLK$Q, tplhl$CLK$Q);
		(R *> Q) = (tpllh$R$Q, tphhl$R$Q);
		(S *> Q) = (tphlh$S$Q, 0);
		$setup(negedge D, posedge CLK &&& \S&R , tsetup_negedge$D$CLK, NOTIFIER);
		$hold (negedge D, posedge CLK &&& \S&R , thold_negedge$D$CLK,  NOTIFIER);
		$setup(posedge D, posedge CLK &&& \S&R , tsetup_posedge$D$CLK, NOTIFIER);
		$hold (posedge D, posedge CLK &&& \S&R , thold_posedge$D$CLK,  NOTIFIER);
		$recovery(posedge R, posedge CLK &&& \D&S , trec$R$CLK, NOTIFIER);
		$removal (posedge R, posedge CLK &&& \D&S , trem$R$CLK, NOTIFIER);
		$recovery(posedge R, posedge S, trec$R$S, NOTIFIER);
		$recovery(posedge S, posedge CLK &&& \~D&R , trec$S$CLK, NOTIFIER);
		$removal (posedge S, posedge CLK &&& \~D&R , trem$S$CLK, NOTIFIER);
		$recovery(posedge S, posedge R, trec$S$R, NOTIFIER);
		$width(negedge S, tminpwl$S, 0, NOTIFIER);
		$width(negedge R, tminpwl$R, 0, NOTIFIER);
		$width(posedge CLK, tminpwh$CLK, 0, NOTIFIER);
		$width(negedge CLK, tminpwl$CLK, 0, NOTIFIER);

	endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module FAX1 (A, B, C, YC, YS);
input  A ;
input  B ;
input  C ;
output YC ;
output YS ;

   and (I0_out, A, B);
   and (I1_out, B, C);
   and (I3_out, C, A);
   or  (YC, I0_out, I1_out, I3_out);
   xor (I5_out, A, B);
   xor (YS, I5_out, C);

   specify
     // delay parameters
     specparam
       tpllh$A$YS = 0.34:0.36:0.38,
       tplhl$A$YS = 0.38:0.38:0.39,
       tpllh$A$YC = 0.24:0.24:0.24,
       tphhl$A$YC = 0.27:0.27:0.27,
       tpllh$B$YS = 0.35:0.38:0.41,
       tplhl$B$YS = 0.37:0.4:0.42,
       tpllh$B$YC = 0.23:0.25:0.28,
       tphhl$B$YC = 0.28:0.28:0.28,
       tpllh$C$YS = 0.36:0.38:0.39,
       tplhl$C$YS = 0.37:0.38:0.38,
       tpllh$C$YC = 0.22:0.23:0.25,
       tphhl$C$YC = 0.26:0.26:0.26;

     // path delays
     (A *> YC) = (tpllh$A$YC, tphhl$A$YC);
     (A *> YS) = (tpllh$A$YS, tplhl$A$YS);
     (B *> YC) = (tpllh$B$YC, tphhl$B$YC);
     (B *> YS) = (tpllh$B$YS, tplhl$B$YS);
     (C *> YC) = (tpllh$C$YC, tphhl$C$YC);
     (C *> YS) = (tpllh$C$YS, tplhl$C$YS);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module HAX1 (A, B, YC, YS);
input  A ;
input  B ;
output YC ;
output YS ;

   and (YC, A, B);
   xor (YS, A, B);

   specify
     // delay parameters
     specparam
       tpllh$A$YS = 0.27:0.27:0.27,
       tplhl$A$YS = 0.32:0.32:0.32,
       tpllh$A$YC = 0.18:0.18:0.18,
       tphhl$A$YC = 0.23:0.23:0.23,
       tpllh$B$YS = 0.27:0.27:0.27,
       tplhl$B$YS = 0.31:0.31:0.31,
       tpllh$B$YC = 0.17:0.17:0.17,
       tphhl$B$YC = 0.22:0.22:0.22;

     // path delays
     (A *> YC) = (tpllh$A$YC, tphhl$A$YC);
     (A *> YS) = (tpllh$A$YS, tplhl$A$YS);
     (B *> YC) = (tpllh$B$YC, tphhl$B$YC);
     (B *> YS) = (tpllh$B$YS, tplhl$B$YS);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX1 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.091:0.091:0.091,
       tphlh$A$Y = 0.081:0.081:0.081;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX2 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.083:0.083:0.083,
       tphlh$A$Y = 0.079:0.079:0.079;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX4 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.083:0.083:0.083,
       tphlh$A$Y = 0.079:0.079:0.079;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module INVX8 (A, Y);
input  A ;
output Y ;

   not (Y, A);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.083:0.083:0.083,
       tphlh$A$Y = 0.079:0.079:0.079;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module LATCH (CLK, D, Q);
input  CLK ;
input  D ;
output Q ;
reg NOTIFIER ;

   udp_tlat T0 (DS0000, D, CLK, 1'B0, 1'B0, NOTIFIER);
   not (P0000, DS0000);
   buf (Q, DS0000);

   specify
     // delay parameters
     specparam
       tpllh$D$Q = 0.35:0.35:0.35,
       tphhl$D$Q = 0.37:0.37:0.37,
       tpllh$CLK$Q = 0.29:0.29:0.29,
       tplhl$CLK$Q = 0.38:0.38:0.38,
       tminpwh$CLK = 0.1:0.24:0.38,
       tsetup_negedge$D$CLK = 0.28:0.28:0.28,
       thold_negedge$D$CLK = -0.094:-0.094:-0.094,
       tsetup_posedge$D$CLK = 0.38:0.38:0.38,
       thold_posedge$D$CLK = -0.19:-0.19:-0.19;

     // path delays
     (CLK *> Q) = (tpllh$CLK$Q, tplhl$CLK$Q);
     (D *> Q) = (tpllh$D$Q, tphhl$D$Q);
     $setup(negedge D, negedge CLK, tsetup_negedge$D$CLK, NOTIFIER);
     $hold (negedge D, negedge CLK, thold_negedge$D$CLK,  NOTIFIER);
     $setup(posedge D, negedge CLK, tsetup_posedge$D$CLK, NOTIFIER);
     $hold (posedge D, negedge CLK, thold_posedge$D$CLK,  NOTIFIER);
     $width(posedge CLK, tminpwh$CLK, 0, NOTIFIER);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module MUX2X1 (A, B, S, Y);
input  A ;
input  B ;
input  S ;
output Y ;

   udp_mux2 M0 (I0_out, B, A, S);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tpllh$S$Y = 0.21:0.21:0.21,
       tplhl$S$Y = 0.2:0.2:0.2,
       tplhl$A$Y = 0.11:0.11:0.11,
       tphlh$A$Y = 0.13:0.13:0.13,
       tplhl$B$Y = 0.12:0.12:0.12,
       tphlh$B$Y = 0.12:0.12:0.12;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (S *> Y) = (tpllh$S$Y, tplhl$S$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   and (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.071:0.071:0.071,
       tphlh$A$Y = 0.1:0.1:0.1,
       tplhl$B$Y = 0.072:0.072:0.072,
       tphlh$B$Y = 0.092:0.092:0.092;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NAND3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   and (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$B$Y = 0.076:0.076:0.076,
       tphlh$B$Y = 0.13:0.13:0.13,
       tplhl$A$Y = 0.078:0.078:0.078,
       tphlh$A$Y = 0.15:0.15:0.15,
       tplhl$C$Y = 0.065:0.065:0.065,
       tphlh$C$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tplhl$B$Y = 0.12:0.12:0.12,
       tphlh$B$Y = 0.086:0.086:0.086,
       tplhl$A$Y = 0.15:0.15:0.15,
       tphlh$A$Y = 0.093:0.093:0.093;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module NOR3X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I1_out, A, B, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$B$Y = 0.2:0.2:0.2,
       tphlh$B$Y = 0.12:0.12:0.12,
       tplhl$C$Y = 0.14:0.14:0.14,
       tphlh$C$Y = 0.086:0.086:0.086,
       tplhl$A$Y = 0.24:0.24:0.24,
       tphlh$A$Y = 0.13:0.13:0.13;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI21X1 (A, B, C, Y);
input  A ;
input  B ;
input  C ;
output Y ;

   or  (I0_out, A, B);
   and (I1_out, I0_out, C);
   not (Y, I1_out);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.11:0.11:0.11,
       tphlh$A$Y = 0.12:0.12:0.12,
       tplhl$B$Y = 0.089:0.089:0.089,
       tphlh$B$Y = 0.11:0.11:0.11,
       tplhl$C$Y = 0.063:0.082:0.1,
       tphlh$C$Y = 0.094:0.099:0.1;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OAI22X1 (A, B, C, D, Y);
input  A ;
input  B ;
input  C ;
input  D ;
output Y ;

   or  (I0_out, A, B);
   or  (I1_out, C, D);
   and (I2_out, I0_out, I1_out);
   not (Y, I2_out);

   specify
     // delay parameters
     specparam
       tplhl$D$Y = 0.078:0.1:0.12,
       tphlh$D$Y = 0.097:0.1:0.11,
       tplhl$C$Y = 0.094:0.12:0.14,
       tphlh$C$Y = 0.11:0.11:0.12,
       tplhl$A$Y = 0.1:0.12:0.15,
       tphlh$A$Y = 0.13:0.13:0.14,
       tplhl$B$Y = 0.083:0.1:0.13,
       tphlh$B$Y = 0.11:0.12:0.13;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (B *> Y) = (tphlh$B$Y, tplhl$B$Y);
     (C *> Y) = (tphlh$C$Y, tplhl$C$Y);
     (D *> Y) = (tphlh$D$Y, tplhl$D$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$B$Y = 0.22:0.22:0.22,
       tphhl$B$Y = 0.18:0.18:0.18,
       tpllh$A$Y = 0.17:0.17:0.17,
       tphhl$A$Y = 0.17:0.17:0.17;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module OR2X2 (A, B, Y);
input  A ;
input  B ;
output Y ;

   or  (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$B$Y = 0.26:0.26:0.26,
       tphhl$B$Y = 0.2:0.2:0.2,
       tpllh$A$Y = 0.22:0.22:0.22,
       tphhl$A$Y = 0.19:0.19:0.19;

     // path delays
     (A *> Y) = (tpllh$A$Y, tphhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tphhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module PADINC (YPAD, DI);
input  YPAD ;
output DI ;

   buf (DI, YPAD);

   specify
     // delay parameters
     specparam
       tpllh$YPAD$DI = 0.11:0.11:0.11,
       tphhl$YPAD$DI = 0.12:0.12:0.12;

     // path delays
     (YPAD *> DI) = (tpllh$YPAD$DI, tphhl$YPAD$DI);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module PADINOUT (DO, OEN, DI, YPAD);
input  DO ;
input  OEN ;
output DI ;
inout  YPAD ;

   bufif1 (YPAD, DO, OEN);
   buf (DI, YPAD);

   specify
     // delay parameters
     specparam
       tpllh$DO$YPAD = 0.69:0.69:0.69,
       tphhl$DO$YPAD = 0.5:0.5:0.5,
       tpzh$OEN$YPAD = 0.86:0.86:0.86,
       tpzl$OEN$YPAD = 0.56:0.56:0.56,
       tplz$OEN$YPAD = 0.49:0.49:0.49,
       tphz$OEN$YPAD = 0.62:0.62:0.62,
       tpllh$YPAD$DI = 0.11:0.11:0.11,
       tphhl$YPAD$DI = 0.12:0.12:0.12;

     // path delays
     (DO *> YPAD) = (tpllh$DO$YPAD, tphhl$DO$YPAD);
     (OEN *> YPAD) = (0, 0, tplz$OEN$YPAD, tpzh$OEN$YPAD, tphz$OEN$YPAD, tpzl$OEN$YPAD);
     (YPAD *> DI) = (tpllh$YPAD$DI, tphhl$YPAD$DI);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module PADOUT (DO, YPAD);
input  DO ;
output YPAD ;

   buf (YPAD, DO);

   specify
     // delay parameters
     specparam
       tpllh$DO$YPAD = 0.69:0.69:0.69,
       tphhl$DO$YPAD = 0.5:0.5:0.5;

     // path delays
     (DO *> YPAD) = (tpllh$DO$YPAD, tphhl$DO$YPAD);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX1 (A, EN, Y);
input  A ;
input  EN ;
output Y ;

   not (I0_out, A);
   bufif1 (Y, I0_out, EN);

   specify
     // delay parameters
     specparam
       tpzh$EN$Y = 0.14:0.14:0.14,
       tpzl$EN$Y = 0.053:0.053:0.053,
       tplz$EN$Y = 0.056:0.056:0.056,
       tphz$EN$Y = 0.11:0.11:0.11,
       tplhl$A$Y = 0.098:0.098:0.098,
       tphlh$A$Y = 0.12:0.12:0.12;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (EN *> Y) = (0, 0, tplz$EN$Y, tpzh$EN$Y, tphz$EN$Y, tpzl$EN$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module TBUFX2 (A, EN, Y);
input  A ;
input  EN ;
output Y ;

   not (I0_out, A);
   bufif1 (Y, I0_out, EN);

   specify
     // delay parameters
     specparam
       tplhl$A$Y = 0.099:0.099:0.099,
       tphlh$A$Y = 0.12:0.12:0.12,
       tpzh$EN$Y = 0.13:0.13:0.13,
       tpzl$EN$Y = 0.052:0.052:0.052,
       tplz$EN$Y = 0.056:0.056:0.056,
       tphz$EN$Y = 0.1:0.1:0.1;

     // path delays
     (A *> Y) = (tphlh$A$Y, tplhl$A$Y);
     (EN *> Y) = (0, 0, tplz$EN$Y, tpzh$EN$Y, tphz$EN$Y, tpzl$EN$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XNOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (I0_out, A, B);
   not (Y, I0_out);

   specify
     // delay parameters
     specparam
       tpllh$A$Y = 0.16:0.16:0.16,
       tplhl$A$Y = 0.15:0.15:0.15,
       tpllh$B$Y = 0.18:0.18:0.18,
       tplhl$B$Y = 0.17:0.17:0.17;

     // path delays
     (A *> Y) = (tpllh$A$Y, tplhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

`timescale 1ns/10ps
`celldefine
module XOR2X1 (A, B, Y);
input  A ;
input  B ;
output Y ;

   xor (Y, A, B);

   specify
     // delay parameters
     specparam
       tpllh$B$Y = 0.18:0.18:0.18,
       tplhl$B$Y = 0.18:0.18:0.18,
       tpllh$A$Y = 0.16:0.16:0.16,
       tplhl$A$Y = 0.15:0.15:0.15;

     // path delays
     (A *> Y) = (tpllh$A$Y, tplhl$A$Y);
     (B *> Y) = (tpllh$B$Y, tplhl$B$Y);

   endspecify

endmodule
`endcelldefine

primitive udp_dff (out, in, clk, clr, set, NOTIFIER);
   output out;
   input  in, clk, clr, set, NOTIFIER;
   reg    out;

   table

// in  clk  clr   set  NOT  : Qt : Qt+1
//
   0  r   ?   0   ?   : ?  :  0  ; // clock in 0
   1  r   0   ?   ?   : ?  :  1  ; // clock in 1
   1  *   0   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   0   ?   : 0  :  0  ; // reduce pessimism
   ?  f   ?   ?   ?   : ?  :  -  ; // no changes on negedge clk
   *  b   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   1   ?   : ?  :  1  ; // set output
   ?  b   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1  x   0   *   ?   : 1  :  1  ; // cover all transistions on set
   ?  ?   1   0   ?   : ?  :  0  ; // reset output
   ?  b   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   0  x   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_dff

primitive udp_tlat (out, in, enable, clr, set, NOTIFIER);

   output out;
   input  in, enable, clr, set, NOTIFIER;
   reg    out;

   table

// in  enable  clr   set  NOT  : Qt : Qt+1
//
   1  1   0   ?   ?   : ?  :  1  ; //
   0  1   ?   0   ?   : ?  :  0  ; //
   1  *   0   ?   ?   : 1  :  1  ; // reduce pessimism
   0  *   ?   0   ?   : 0  :  0  ; // reduce pessimism
   *  0   ?   ?   ?   : ?  :  -  ; // no changes when in switches
   ?  ?   ?   1   ?   : ?  :  1  ; // set output
   ?  0   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1  ?   0   *   ?   : 1  :  1  ; // cover all transistions on set
   ?  ?   1   0   ?   : ?  :  0  ; // reset output
   ?  0   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   0  ?   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?  ?   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_tlat

primitive udp_rslat (out, clr, set, NOTIFIER);

   output out;
   input  clr, set, NOTIFIER;
   reg    out;

   table

// clr   set  NOT  : Qt : Qt+1
//
   ?   1   ?   : ?  :  1  ; // set output
   0   *   ?   : 1  :  1  ; // cover all transistions on set
   1   0   ?   : ?  :  0  ; // reset output
   *   0   ?   : 0  :  0  ; // cover all transistions on clr
   ?   ?   *   : ?  :  x  ; // any notifier changed

   endtable
endprimitive // udp_tlat

primitive udp_mux2 (out, in0, in1, sel);
   output out;
   input  in0, in1, sel;

   table

// in0 in1 sel :  out
//
    1  ?  0 :  1 ;
    0  ?  0 :  0 ;
    ?  1  1 :  1 ;
    ?  0  1 :  0 ;
    0  0  x :  0 ;
    1  1  x :  1 ;

   endtable
endprimitive // udp_mux2


module PADNC();
endmodule

module PADFC();
endmodule

module PADGND();
endmodule

module PADVDD();
endmodule


//
// Generated by Bluespec Compiler, version 2018.10.beta1 (build e1df8052c, 2018-10-17)
//
//
//
//
// Ports:
// Name                         I/O  size props
// RDY_flush                      O     1 const
// lookup                         O   131
// RDY_lookup                     O     1
// RDY_insert                     O     1
// CLK                            I     1 clock
// RST_N                          I     1 reset
// lookup_asid                    I    16
// lookup_vpn                     I    27
// insert_asid                    I    16 reg
// insert_vpn                     I    27
// insert_pte                     I    64 reg
// insert_level                   I     2
// insert_pte_pa                  I    64 reg
// EN_flush                       I     1
// EN_insert                      I     1
//
// Combinational paths from inputs to outputs:
//   (lookup_asid, lookup_vpn) -> lookup
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkTLB(CLK,
	     RST_N,

	     EN_flush,
	     RDY_flush,

	     lookup_asid,
	     lookup_vpn,
	     lookup,
	     RDY_lookup,

	     insert_asid,
	     insert_vpn,
	     insert_pte,
	     insert_level,
	     insert_pte_pa,
	     EN_insert,
	     RDY_insert);
  parameter [0 : 0] dmem_not_imem = 1'b0;
  input  CLK;
  input  RST_N;

  // action method flush
  input  EN_flush;
  output RDY_flush;

  // value method lookup
  input  [15 : 0] lookup_asid;
  input  [26 : 0] lookup_vpn;
  output [130 : 0] lookup;
  output RDY_lookup;

  // action method insert
  input  [15 : 0] insert_asid;
  input  [26 : 0] insert_vpn;
  input  [63 : 0] insert_pte;
  input  [1 : 0] insert_level;
  input  [63 : 0] insert_pte_pa;
  input  EN_insert;
  output RDY_insert;

  // signals for module outputs
  wire [130 : 0] lookup;
  wire RDY_flush, RDY_insert, RDY_lookup;

  // register rg_flushing
  reg rg_flushing;
  wire rg_flushing$D_IN, rg_flushing$EN;

  // register tlb0_valids_0
  reg tlb0_valids_0;
  wire tlb0_valids_0$D_IN, tlb0_valids_0$EN;

  // register tlb0_valids_1
  reg tlb0_valids_1;
  wire tlb0_valids_1$D_IN, tlb0_valids_1$EN;

  // register tlb0_valids_2
  reg tlb0_valids_2;
  wire tlb0_valids_2$D_IN, tlb0_valids_2$EN;

  // register tlb0_valids_3
  reg tlb0_valids_3;
  wire tlb0_valids_3$D_IN, tlb0_valids_3$EN;

  // register tlb1_valids_0
  reg tlb1_valids_0;
  wire tlb1_valids_0$D_IN, tlb1_valids_0$EN;

  // register tlb1_valids_1
  reg tlb1_valids_1;
  wire tlb1_valids_1$D_IN, tlb1_valids_1$EN;

  // register tlb1_valids_2
  reg tlb1_valids_2;
  wire tlb1_valids_2$D_IN, tlb1_valids_2$EN;

  // register tlb1_valids_3
  reg tlb1_valids_3;
  wire tlb1_valids_3$D_IN, tlb1_valids_3$EN;

  // register tlb2_valids_0
  reg tlb2_valids_0;
  wire tlb2_valids_0$D_IN, tlb2_valids_0$EN;

  // register tlb2_valids_1
  reg tlb2_valids_1;
  wire tlb2_valids_1$D_IN, tlb2_valids_1$EN;

  // register tlb2_valids_2
  reg tlb2_valids_2;
  wire tlb2_valids_2$D_IN, tlb2_valids_2$EN;

  // register tlb2_valids_3
  reg tlb2_valids_3;
  wire tlb2_valids_3$D_IN, tlb2_valids_3$EN;

  // ports of submodule tlb0_entries
  wire [168 : 0] tlb0_entries$D_IN, tlb0_entries$D_OUT_1;
  wire [1 : 0] tlb0_entries$ADDR_1,
	       tlb0_entries$ADDR_2,
	       tlb0_entries$ADDR_3,
	       tlb0_entries$ADDR_4,
	       tlb0_entries$ADDR_5,
	       tlb0_entries$ADDR_IN;
  wire tlb0_entries$WE;

  // ports of submodule tlb1_entries
  wire [159 : 0] tlb1_entries$D_IN, tlb1_entries$D_OUT_1;
  wire [1 : 0] tlb1_entries$ADDR_1,
	       tlb1_entries$ADDR_2,
	       tlb1_entries$ADDR_3,
	       tlb1_entries$ADDR_4,
	       tlb1_entries$ADDR_5,
	       tlb1_entries$ADDR_IN;
  wire tlb1_entries$WE;

  // ports of submodule tlb2_entries
  wire [150 : 0] tlb2_entries$D_IN, tlb2_entries$D_OUT_1;
  wire [1 : 0] tlb2_entries$ADDR_1,
	       tlb2_entries$ADDR_2,
	       tlb2_entries$ADDR_3,
	       tlb2_entries$ADDR_4,
	       tlb2_entries$ADDR_5,
	       tlb2_entries$ADDR_IN;
  wire tlb2_entries$WE;

  // rule scheduling signals
  wire CAN_FIRE_RL_rl_initialize,
       CAN_FIRE_flush,
       CAN_FIRE_insert,
       WILL_FIRE_RL_rl_initialize,
       WILL_FIRE_flush,
       WILL_FIRE_insert;

  // inputs to muxes for submodule ports
  wire MUX_tlb0_valids_0$write_1__SEL_1,
       MUX_tlb0_valids_1$write_1__SEL_1,
       MUX_tlb0_valids_2$write_1__SEL_1,
       MUX_tlb0_valids_3$write_1__SEL_1,
       MUX_tlb1_valids_0$write_1__SEL_1,
       MUX_tlb1_valids_1$write_1__SEL_1,
       MUX_tlb1_valids_2$write_1__SEL_1,
       MUX_tlb1_valids_3$write_1__SEL_1,
       MUX_tlb2_valids_0$write_1__SEL_1,
       MUX_tlb2_valids_1$write_1__SEL_1,
       MUX_tlb2_valids_2$write_1__SEL_1,
       MUX_tlb2_valids_3$write_1__SEL_1;

  // remaining internal signals
  reg SEL_ARR_tlb0_valids_0_tlb0_valids_1_tlb0_valid_ETC___d8,
      SEL_ARR_tlb1_valids_0_9_tlb1_valids_1_0_tlb1_v_ETC___d25,
      SEL_ARR_tlb2_valids_0_6_tlb2_valids_1_7_tlb2_v_ETC___d42;
  wire [129 : 0] IF_SEL_ARR_tlb0_valids_0_tlb0_valids_1_tlb0_va_ETC___d66,
		 IF_SEL_ARR_tlb1_valids_0_9_tlb1_valids_1_0_tlb_ETC___d65;
  wire SEL_ARR_tlb0_valids_0_tlb0_valids_1_tlb0_valid_ETC___d14,
       SEL_ARR_tlb0_valids_0_tlb0_valids_1_tlb0_valid_ETC___d54,
       SEL_ARR_tlb1_valids_0_9_tlb1_valids_1_0_tlb1_v_ETC___d31,
       SEL_ARR_tlb1_valids_0_9_tlb1_valids_1_0_tlb1_v_ETC___d53;

  // action method flush
  assign RDY_flush = 1'd1 ;
  assign CAN_FIRE_flush = 1'd1 ;
  assign WILL_FIRE_flush = EN_flush ;

  // value method lookup
  assign lookup =
	     { SEL_ARR_tlb0_valids_0_tlb0_valids_1_tlb0_valid_ETC___d54,
	       IF_SEL_ARR_tlb0_valids_0_tlb0_valids_1_tlb0_va_ETC___d66 } ;
  assign RDY_lookup = !rg_flushing ;

  // action method insert
  assign RDY_insert = !rg_flushing ;
  assign CAN_FIRE_insert = !rg_flushing ;
  assign WILL_FIRE_insert = EN_insert ;

  // submodule tlb0_entries
  RegFile #(.addr_width(32'd2),
	    .data_width(32'd169),
	    .lo(2'h0),
	    .hi(2'd3)) tlb0_entries(.CLK(CLK),
				    .ADDR_1(tlb0_entries$ADDR_1),
				    .ADDR_2(tlb0_entries$ADDR_2),
				    .ADDR_3(tlb0_entries$ADDR_3),
				    .ADDR_4(tlb0_entries$ADDR_4),
				    .ADDR_5(tlb0_entries$ADDR_5),
				    .ADDR_IN(tlb0_entries$ADDR_IN),
				    .D_IN(tlb0_entries$D_IN),
				    .WE(tlb0_entries$WE),
				    .D_OUT_1(tlb0_entries$D_OUT_1),
				    .D_OUT_2(),
				    .D_OUT_3(),
				    .D_OUT_4(),
				    .D_OUT_5());

  // submodule tlb1_entries
  RegFile #(.addr_width(32'd2),
	    .data_width(32'd160),
	    .lo(2'h0),
	    .hi(2'd3)) tlb1_entries(.CLK(CLK),
				    .ADDR_1(tlb1_entries$ADDR_1),
				    .ADDR_2(tlb1_entries$ADDR_2),
				    .ADDR_3(tlb1_entries$ADDR_3),
				    .ADDR_4(tlb1_entries$ADDR_4),
				    .ADDR_5(tlb1_entries$ADDR_5),
				    .ADDR_IN(tlb1_entries$ADDR_IN),
				    .D_IN(tlb1_entries$D_IN),
				    .WE(tlb1_entries$WE),
				    .D_OUT_1(tlb1_entries$D_OUT_1),
				    .D_OUT_2(),
				    .D_OUT_3(),
				    .D_OUT_4(),
				    .D_OUT_5());

  // submodule tlb2_entries
  RegFile #(.addr_width(32'd2),
	    .data_width(32'd151),
	    .lo(2'h0),
	    .hi(2'd3)) tlb2_entries(.CLK(CLK),
				    .ADDR_1(tlb2_entries$ADDR_1),
				    .ADDR_2(tlb2_entries$ADDR_2),
				    .ADDR_3(tlb2_entries$ADDR_3),
				    .ADDR_4(tlb2_entries$ADDR_4),
				    .ADDR_5(tlb2_entries$ADDR_5),
				    .ADDR_IN(tlb2_entries$ADDR_IN),
				    .D_IN(tlb2_entries$D_IN),
				    .WE(tlb2_entries$WE),
				    .D_OUT_1(tlb2_entries$D_OUT_1),
				    .D_OUT_2(),
				    .D_OUT_3(),
				    .D_OUT_4(),
				    .D_OUT_5());

  // rule RL_rl_initialize
  assign CAN_FIRE_RL_rl_initialize = rg_flushing ;
  assign WILL_FIRE_RL_rl_initialize = rg_flushing ;

  // inputs to muxes for submodule ports
  assign MUX_tlb0_valids_0$write_1__SEL_1 =
	     EN_insert && insert_vpn[1:0] == 2'd0 && insert_level == 2'd0 ;
  assign MUX_tlb0_valids_1$write_1__SEL_1 =
	     EN_insert && insert_vpn[1:0] == 2'd1 && insert_level == 2'd0 ;
  assign MUX_tlb0_valids_2$write_1__SEL_1 =
	     EN_insert && insert_vpn[1:0] == 2'd2 && insert_level == 2'd0 ;
  assign MUX_tlb0_valids_3$write_1__SEL_1 =
	     EN_insert && insert_vpn[1:0] == 2'd3 && insert_level == 2'd0 ;
  assign MUX_tlb1_valids_0$write_1__SEL_1 =
	     EN_insert && insert_vpn[10:9] == 2'd0 && insert_level == 2'd1 ;
  assign MUX_tlb1_valids_1$write_1__SEL_1 =
	     EN_insert && insert_vpn[10:9] == 2'd1 && insert_level == 2'd1 ;
  assign MUX_tlb1_valids_2$write_1__SEL_1 =
	     EN_insert && insert_vpn[10:9] == 2'd2 && insert_level == 2'd1 ;
  assign MUX_tlb1_valids_3$write_1__SEL_1 =
	     EN_insert && insert_vpn[10:9] == 2'd3 && insert_level == 2'd1 ;
  assign MUX_tlb2_valids_0$write_1__SEL_1 =
	     EN_insert && insert_vpn[19:18] == 2'd0 && insert_level != 2'd0 &&
	     insert_level != 2'd1 ;
  assign MUX_tlb2_valids_1$write_1__SEL_1 =
	     EN_insert && insert_vpn[19:18] == 2'd1 && insert_level != 2'd0 &&
	     insert_level != 2'd1 ;
  assign MUX_tlb2_valids_2$write_1__SEL_1 =
	     EN_insert && insert_vpn[19:18] == 2'd2 && insert_level != 2'd0 &&
	     insert_level != 2'd1 ;
  assign MUX_tlb2_valids_3$write_1__SEL_1 =
	     EN_insert && insert_vpn[19:18] == 2'd3 && insert_level != 2'd0 &&
	     insert_level != 2'd1 ;

  // register rg_flushing
  assign rg_flushing$D_IN = EN_flush ;
  assign rg_flushing$EN = rg_flushing || EN_flush ;

  // register tlb0_valids_0
  assign tlb0_valids_0$D_IN = MUX_tlb0_valids_0$write_1__SEL_1 ;
  assign tlb0_valids_0$EN =
	     EN_insert && insert_vpn[1:0] == 2'd0 && insert_level == 2'd0 ||
	     rg_flushing ;

  // register tlb0_valids_1
  assign tlb0_valids_1$D_IN = MUX_tlb0_valids_1$write_1__SEL_1 ;
  assign tlb0_valids_1$EN =
	     EN_insert && insert_vpn[1:0] == 2'd1 && insert_level == 2'd0 ||
	     rg_flushing ;

  // register tlb0_valids_2
  assign tlb0_valids_2$D_IN = MUX_tlb0_valids_2$write_1__SEL_1 ;
  assign tlb0_valids_2$EN =
	     EN_insert && insert_vpn[1:0] == 2'd2 && insert_level == 2'd0 ||
	     rg_flushing ;

  // register tlb0_valids_3
  assign tlb0_valids_3$D_IN = MUX_tlb0_valids_3$write_1__SEL_1 ;
  assign tlb0_valids_3$EN =
	     EN_insert && insert_vpn[1:0] == 2'd3 && insert_level == 2'd0 ||
	     rg_flushing ;

  // register tlb1_valids_0
  assign tlb1_valids_0$D_IN = MUX_tlb1_valids_0$write_1__SEL_1 ;
  assign tlb1_valids_0$EN =
	     EN_insert && insert_vpn[10:9] == 2'd0 && insert_level == 2'd1 ||
	     rg_flushing ;

  // register tlb1_valids_1
  assign tlb1_valids_1$D_IN = MUX_tlb1_valids_1$write_1__SEL_1 ;
  assign tlb1_valids_1$EN =
	     EN_insert && insert_vpn[10:9] == 2'd1 && insert_level == 2'd1 ||
	     rg_flushing ;

  // register tlb1_valids_2
  assign tlb1_valids_2$D_IN = MUX_tlb1_valids_2$write_1__SEL_1 ;
  assign tlb1_valids_2$EN =
	     EN_insert && insert_vpn[10:9] == 2'd2 && insert_level == 2'd1 ||
	     rg_flushing ;

  // register tlb1_valids_3
  assign tlb1_valids_3$D_IN = MUX_tlb1_valids_3$write_1__SEL_1 ;
  assign tlb1_valids_3$EN =
	     EN_insert && insert_vpn[10:9] == 2'd3 && insert_level == 2'd1 ||
	     rg_flushing ;

  // register tlb2_valids_0
  assign tlb2_valids_0$D_IN = MUX_tlb2_valids_0$write_1__SEL_1 ;
  assign tlb2_valids_0$EN =
	     EN_insert && insert_vpn[19:18] == 2'd0 && insert_level != 2'd0 &&
	     insert_level != 2'd1 ||
	     rg_flushing ;

  // register tlb2_valids_1
  assign tlb2_valids_1$D_IN = MUX_tlb2_valids_1$write_1__SEL_1 ;
  assign tlb2_valids_1$EN =
	     EN_insert && insert_vpn[19:18] == 2'd1 && insert_level != 2'd0 &&
	     insert_level != 2'd1 ||
	     rg_flushing ;

  // register tlb2_valids_2
  assign tlb2_valids_2$D_IN = MUX_tlb2_valids_2$write_1__SEL_1 ;
  assign tlb2_valids_2$EN =
	     EN_insert && insert_vpn[19:18] == 2'd2 && insert_level != 2'd0 &&
	     insert_level != 2'd1 ||
	     rg_flushing ;

  // register tlb2_valids_3
  assign tlb2_valids_3$D_IN = MUX_tlb2_valids_3$write_1__SEL_1 ;
  assign tlb2_valids_3$EN =
	     EN_insert && insert_vpn[19:18] == 2'd3 && insert_level != 2'd0 &&
	     insert_level != 2'd1 ||
	     rg_flushing ;

  // submodule tlb0_entries
  assign tlb0_entries$ADDR_1 = lookup_vpn[1:0] ;
  assign tlb0_entries$ADDR_2 = 2'h0 ;
  assign tlb0_entries$ADDR_3 = 2'h0 ;
  assign tlb0_entries$ADDR_4 = 2'h0 ;
  assign tlb0_entries$ADDR_5 = 2'h0 ;
  assign tlb0_entries$ADDR_IN = insert_vpn[1:0] ;
  assign tlb0_entries$D_IN =
	     { insert_asid, insert_vpn[26:2], insert_pte, insert_pte_pa } ;
  assign tlb0_entries$WE = EN_insert && insert_level == 2'd0 ;

  // submodule tlb1_entries
  assign tlb1_entries$ADDR_1 = lookup_vpn[10:9] ;
  assign tlb1_entries$ADDR_2 = 2'h0 ;
  assign tlb1_entries$ADDR_3 = 2'h0 ;
  assign tlb1_entries$ADDR_4 = 2'h0 ;
  assign tlb1_entries$ADDR_5 = 2'h0 ;
  assign tlb1_entries$ADDR_IN = insert_vpn[10:9] ;
  assign tlb1_entries$D_IN =
	     { insert_asid, insert_vpn[26:11], insert_pte, insert_pte_pa } ;
  assign tlb1_entries$WE = EN_insert && insert_level == 2'd1 ;

  // submodule tlb2_entries
  assign tlb2_entries$ADDR_1 = lookup_vpn[19:18] ;
  assign tlb2_entries$ADDR_2 = 2'h0 ;
  assign tlb2_entries$ADDR_3 = 2'h0 ;
  assign tlb2_entries$ADDR_4 = 2'h0 ;
  assign tlb2_entries$ADDR_5 = 2'h0 ;
  assign tlb2_entries$ADDR_IN = insert_vpn[19:18] ;
  assign tlb2_entries$D_IN =
	     { insert_asid, insert_vpn[26:20], insert_pte, insert_pte_pa } ;
  assign tlb2_entries$WE =
	     EN_insert && insert_level != 2'd0 && insert_level != 2'd1 ;

  // remaining internal signals
  assign IF_SEL_ARR_tlb0_valids_0_tlb0_valids_1_tlb0_va_ETC___d66 =
	     (SEL_ARR_tlb0_valids_0_tlb0_valids_1_tlb0_valid_ETC___d14 &&
	      tlb0_entries$D_OUT_1[152:128] == lookup_vpn[26:2]) ?
	       { tlb0_entries$D_OUT_1[127:64],
		 2'd0,
		 tlb0_entries$D_OUT_1[63:0] } :
	       IF_SEL_ARR_tlb1_valids_0_9_tlb1_valids_1_0_tlb_ETC___d65 ;
  assign IF_SEL_ARR_tlb1_valids_0_9_tlb1_valids_1_0_tlb_ETC___d65 =
	     (SEL_ARR_tlb1_valids_0_9_tlb1_valids_1_0_tlb1_v_ETC___d31 &&
	      tlb1_entries$D_OUT_1[143:128] == lookup_vpn[26:11]) ?
	       { tlb1_entries$D_OUT_1[127:64],
		 2'd1,
		 tlb1_entries$D_OUT_1[63:0] } :
	       { tlb2_entries$D_OUT_1[127:64],
		 2'd2,
		 tlb2_entries$D_OUT_1[63:0] } ;
  assign SEL_ARR_tlb0_valids_0_tlb0_valids_1_tlb0_valid_ETC___d14 =
	     SEL_ARR_tlb0_valids_0_tlb0_valids_1_tlb0_valid_ETC___d8 &&
	     (tlb0_entries$D_OUT_1[168:153] == lookup_asid ||
	      tlb0_entries$D_OUT_1[69]) ;
  assign SEL_ARR_tlb0_valids_0_tlb0_valids_1_tlb0_valid_ETC___d54 =
	     SEL_ARR_tlb0_valids_0_tlb0_valids_1_tlb0_valid_ETC___d14 &&
	     tlb0_entries$D_OUT_1[152:128] == lookup_vpn[26:2] ||
	     SEL_ARR_tlb1_valids_0_9_tlb1_valids_1_0_tlb1_v_ETC___d53 ;
  assign SEL_ARR_tlb1_valids_0_9_tlb1_valids_1_0_tlb1_v_ETC___d31 =
	     SEL_ARR_tlb1_valids_0_9_tlb1_valids_1_0_tlb1_v_ETC___d25 &&
	     (tlb1_entries$D_OUT_1[159:144] == lookup_asid ||
	      tlb1_entries$D_OUT_1[69]) ;
  assign SEL_ARR_tlb1_valids_0_9_tlb1_valids_1_0_tlb1_v_ETC___d53 =
	     SEL_ARR_tlb1_valids_0_9_tlb1_valids_1_0_tlb1_v_ETC___d31 &&
	     tlb1_entries$D_OUT_1[143:128] == lookup_vpn[26:11] ||
	     SEL_ARR_tlb2_valids_0_6_tlb2_valids_1_7_tlb2_v_ETC___d42 &&
	     (tlb2_entries$D_OUT_1[150:135] == lookup_asid ||
	      tlb2_entries$D_OUT_1[69]) &&
	     tlb2_entries$D_OUT_1[134:128] == lookup_vpn[26:20] ;
  always@(lookup_vpn or
	  tlb0_valids_0 or tlb0_valids_1 or tlb0_valids_2 or tlb0_valids_3)
  begin
    case (lookup_vpn[1:0])
      2'd0:
	  SEL_ARR_tlb0_valids_0_tlb0_valids_1_tlb0_valid_ETC___d8 =
	      tlb0_valids_0;
      2'd1:
	  SEL_ARR_tlb0_valids_0_tlb0_valids_1_tlb0_valid_ETC___d8 =
	      tlb0_valids_1;
      2'd2:
	  SEL_ARR_tlb0_valids_0_tlb0_valids_1_tlb0_valid_ETC___d8 =
	      tlb0_valids_2;
      2'd3:
	  SEL_ARR_tlb0_valids_0_tlb0_valids_1_tlb0_valid_ETC___d8 =
	      tlb0_valids_3;
    endcase
  end
  always@(lookup_vpn or
	  tlb1_valids_0 or tlb1_valids_1 or tlb1_valids_2 or tlb1_valids_3)
  begin
    case (lookup_vpn[10:9])
      2'd0:
	  SEL_ARR_tlb1_valids_0_9_tlb1_valids_1_0_tlb1_v_ETC___d25 =
	      tlb1_valids_0;
      2'd1:
	  SEL_ARR_tlb1_valids_0_9_tlb1_valids_1_0_tlb1_v_ETC___d25 =
	      tlb1_valids_1;
      2'd2:
	  SEL_ARR_tlb1_valids_0_9_tlb1_valids_1_0_tlb1_v_ETC___d25 =
	      tlb1_valids_2;
      2'd3:
	  SEL_ARR_tlb1_valids_0_9_tlb1_valids_1_0_tlb1_v_ETC___d25 =
	      tlb1_valids_3;
    endcase
  end
  always@(lookup_vpn or
	  tlb2_valids_0 or tlb2_valids_1 or tlb2_valids_2 or tlb2_valids_3)
  begin
    case (lookup_vpn[19:18])
      2'd0:
	  SEL_ARR_tlb2_valids_0_6_tlb2_valids_1_7_tlb2_v_ETC___d42 =
	      tlb2_valids_0;
      2'd1:
	  SEL_ARR_tlb2_valids_0_6_tlb2_valids_1_7_tlb2_v_ETC___d42 =
	      tlb2_valids_1;
      2'd2:
	  SEL_ARR_tlb2_valids_0_6_tlb2_valids_1_7_tlb2_v_ETC___d42 =
	      tlb2_valids_2;
      2'd3:
	  SEL_ARR_tlb2_valids_0_6_tlb2_valids_1_7_tlb2_v_ETC___d42 =
	      tlb2_valids_3;
    endcase
  end

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        rg_flushing <= `BSV_ASSIGNMENT_DELAY 1'd1;
      end
    else
      begin
        if (rg_flushing$EN)
	  rg_flushing <= `BSV_ASSIGNMENT_DELAY rg_flushing$D_IN;
      end
    if (tlb0_valids_0$EN)
      tlb0_valids_0 <= `BSV_ASSIGNMENT_DELAY tlb0_valids_0$D_IN;
    if (tlb0_valids_1$EN)
      tlb0_valids_1 <= `BSV_ASSIGNMENT_DELAY tlb0_valids_1$D_IN;
    if (tlb0_valids_2$EN)
      tlb0_valids_2 <= `BSV_ASSIGNMENT_DELAY tlb0_valids_2$D_IN;
    if (tlb0_valids_3$EN)
      tlb0_valids_3 <= `BSV_ASSIGNMENT_DELAY tlb0_valids_3$D_IN;
    if (tlb1_valids_0$EN)
      tlb1_valids_0 <= `BSV_ASSIGNMENT_DELAY tlb1_valids_0$D_IN;
    if (tlb1_valids_1$EN)
      tlb1_valids_1 <= `BSV_ASSIGNMENT_DELAY tlb1_valids_1$D_IN;
    if (tlb1_valids_2$EN)
      tlb1_valids_2 <= `BSV_ASSIGNMENT_DELAY tlb1_valids_2$D_IN;
    if (tlb1_valids_3$EN)
      tlb1_valids_3 <= `BSV_ASSIGNMENT_DELAY tlb1_valids_3$D_IN;
    if (tlb2_valids_0$EN)
      tlb2_valids_0 <= `BSV_ASSIGNMENT_DELAY tlb2_valids_0$D_IN;
    if (tlb2_valids_1$EN)
      tlb2_valids_1 <= `BSV_ASSIGNMENT_DELAY tlb2_valids_1$D_IN;
    if (tlb2_valids_2$EN)
      tlb2_valids_2 <= `BSV_ASSIGNMENT_DELAY tlb2_valids_2$D_IN;
    if (tlb2_valids_3$EN)
      tlb2_valids_3 <= `BSV_ASSIGNMENT_DELAY tlb2_valids_3$D_IN;
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    rg_flushing = 1'h0;
    tlb0_valids_0 = 1'h0;
    tlb0_valids_1 = 1'h0;
    tlb0_valids_2 = 1'h0;
    tlb0_valids_3 = 1'h0;
    tlb1_valids_0 = 1'h0;
    tlb1_valids_1 = 1'h0;
    tlb1_valids_2 = 1'h0;
    tlb1_valids_3 = 1'h0;
    tlb2_valids_0 = 1'h0;
    tlb2_valids_1 = 1'h0;
    tlb2_valids_2 = 1'h0;
    tlb2_valids_3 = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on
endmodule  // mkTLB


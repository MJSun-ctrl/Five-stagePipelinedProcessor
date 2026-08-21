// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Nov 18 18:46:03 2025
// Host        : DESKTOP-MKCAUSH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cpu_ans1_rom_sim_netlist.v
// Design      : cpu_ans1_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cpu_ans1_rom,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (a,
    spo);
  input [5:0]a;
  output [63:0]spo;

  wire \<const0> ;
  wire [5:0]a;
  wire [43:0]\^spo ;
  wire [63:0]NLW_U0_dpo_UNCONNECTED;
  wire [63:0]NLW_U0_qdpo_UNCONNECTED;
  wire [63:0]NLW_U0_qspo_UNCONNECTED;
  wire [63:35]NLW_U0_spo_UNCONNECTED;

  assign spo[63] = \<const0> ;
  assign spo[62] = \<const0> ;
  assign spo[61] = \<const0> ;
  assign spo[60] = \<const0> ;
  assign spo[59] = \<const0> ;
  assign spo[58] = \<const0> ;
  assign spo[57] = \<const0> ;
  assign spo[56] = \<const0> ;
  assign spo[55] = \<const0> ;
  assign spo[54] = \<const0> ;
  assign spo[53] = \<const0> ;
  assign spo[52] = \<const0> ;
  assign spo[51] = \<const0> ;
  assign spo[50] = \<const0> ;
  assign spo[49] = \<const0> ;
  assign spo[48] = \<const0> ;
  assign spo[47] = \<const0> ;
  assign spo[46] = \<const0> ;
  assign spo[45] = \<const0> ;
  assign spo[44] = \<const0> ;
  assign spo[43:39] = \^spo [43:39];
  assign spo[38] = \<const0> ;
  assign spo[37] = \<const0> ;
  assign spo[36] = \<const0> ;
  assign spo[35] = \<const0> ;
  assign spo[34:0] = \^spo [34:0];
  GND GND
       (.G(\<const0> ));
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_D = "0" *) 
  (* C_HAS_DPO = "0" *) 
  (* C_HAS_DPRA = "0" *) 
  (* C_HAS_I_CE = "0" *) 
  (* C_HAS_QDPO = "0" *) 
  (* C_HAS_QDPO_CE = "0" *) 
  (* C_HAS_QDPO_CLK = "0" *) 
  (* C_HAS_QDPO_RST = "0" *) 
  (* C_HAS_QDPO_SRST = "0" *) 
  (* C_HAS_WE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_PIPELINE_STAGES = "0" *) 
  (* C_QCE_JOINED = "0" *) 
  (* C_QUALIFY_WE = "0" *) 
  (* C_REG_DPRA_INPUT = "0" *) 
  (* c_addr_width = "6" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "64" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "cpu_ans1_rom.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "64" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[63:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[63:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[63:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo({NLW_U0_spo_UNCONNECTED[63:44],\^spo }),
        .we(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
GxqA6ShybXzGX4SNuhZkgD2SfOuwDYSzjnHIzDz0NN2q/uX43CoUMt0L0xBGvUsa03MpmRUjohf7
RdQy3qKtvQ==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
AStGBi6dS/Pu8paudHFxlgoOUwiUG1xTKkUjscVJKbrztKTibNt5odE52tzbrf+TesjO4JiOib8i
0Jey1TL5RM52iOhyFipAueZE/1eeS8O2cWH4OX9ivJeL0THyXZgGKpsMQCYGLyjhMxSLxlVPoV94
fB5JulLJldV7LL+r0QY=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
EhEa53IbhFK8aH+jEkH9mB6vKemg7bdjNbNbMbNEUK7N+hEAQRxkwZz2tfm3qzUwBD7Hw3Spkyr0
mM4971brJyOIjG3WpVKqmHB45b7aVdWQN9gfE+d7N448c4h/eDZvaYQKQUUIgV9WCMcfD/mXsLEk
V1bEiMJXC6DvzwzhHsFPwYzBWYSGxJahZlyONurjgDNecV9lDxESnU2sXrRvrx6vqLKRU8fJGd82
nUvJqlKVbHbAH75O6ywJ8SuW6yVGMc08qJTVBFU1p55dzlQxemWLGvnBSFi0Y54eAI9o4d6yR1EK
PE2dH8oJTtYhXQBUlL3BoD3MpzMGMoTHU/6juQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
YRxYOjLrYRCvkxF50wuZS9soahAbHJR1U3PA3Oz/HM20BuknrOjgadjwYPKFk7QpQX0HJoufYAKu
VNL4Vcj4ePmhgdkE0/GdjfJaHnc3VJeCpDl9b2bpihBhnZnf/JbpU9QlDLMFdtBaQESF2F2TnZb1
0/JZYr3D8kgSN59mmtBoJAUZVQ09ykROPpiNtW1Ta5TDYPX6Lru7pRCLZMNNt5P9tyhEZ1c/Ynu1
w1M16hPaIjCuj4SgRuFluBvoL5ybQNlZeosBwRCD6ZmUoR0FxueGZN0D2t3FdRy7+8KFu8grCQK6
+zu4KIxt3Nf7gJeOO/mdiVPcTUorAvBjueTVXQ==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
N9TEIv2s4qLNbOamPB+iHsr/skKamzTWWLSQDVGwlSIUkPf7ZdV+br6WAhtBWGDdBtBk+tWj/sn+
m5TbL+jPJQSVLASsDKdp3z/AB5UOFxQ3XGJUBQhs+d+OH2CNamt97mOQamSOh/HonTpnIdNDxJhL
hUfTnXv2cPlTO7Hw/PqmH6JabR8MdbXbEx1t27aR7ZBt+x/IIqUiMvKNX1DuBCxPWJuL9YI6OqWS
JvJf9Zuw1WIWtrsWK9X0LqMlrsqwWGMwHlRj+vIJzFOBErtExTXxwxS2FImyG1YbPcTlj+7UmsK0
k8HlCh1ifM6NNWzWJ479zwyEl95M2qNPLBOBHQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
fKOwMyWryYahcHknLtf6MHFeCSya6sCMrRVc3/N1IsZc7Gg61FyzwRaSFbGF7R5xhIZfLm15HGaX
vTHfmV7inaTJVMSyZoqk4EBdf5xMaDrL/vPHM6XAjSK8itKAwn+syrnhPkkU+uIBovqDFujwHFmH
dvvR/RAnF5Zw84L3pR8=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
jN7WIyrArXu/q301RElviMDMHxQ+PHXin6Y/rmUfCm6hOg5LX3MY3tW0Ig/kDvXGK7sYck2MxDKU
3Vq+gXojG27PDtvlx7RXPpliasPoreafttcWcTrXXHIroTiCWvjO8tFf75MuTX7VAm9Pk8pg1n41
5f0H9XyCdZgqXl3KlJPydlYcXkvUp57cxr8s8kPgNxK49yl/PLcyHGTpM75hdp8mhV/3k3ZYL2cj
X0KK7Umg/OiyLKxHClvY5KMmaeLrou6mvz7HWnwXm1pc6EnOCGeUGGxFYIbOY+8n7VJJAt4ZIafG
IliQdJIa+jcbu/rEUwjdoxtcC+YkjnZZ4zTPHA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
krOfV0etxNMBgHmB9eikWXkLasaz1ND/SLufPd/5MOv2M7uej5fEBgQlzj+OuyvTXpveIP+NESly
0Vpu45HLM3fWu0s5M9wZLfTM5jw/Q2YdiFPqaTBR1nbl8nzQScdbU+XIpP9l377SjU4vO1D5Tv5A
5kdkA3Z47QhtfnViEMmAm43DvyK0YzUy0U/nc5QrfVtpQDtwcVbXLkkl880fyRloUBtBiIeVNPxr
DaSOede4kzdyDEf0vnouHqRrLk8j4LAsoolvfTWXI9AFDt7TVAv1Xvnj17Z+84jZMYRpOd3EiGHb
WuKPk2F0XUIO+DOHFvJwDBmzbwkIvmn9PRwMpg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 15120)
`pragma protect data_block
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
hV1YbRPVz+dUlgLdA+p/
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif

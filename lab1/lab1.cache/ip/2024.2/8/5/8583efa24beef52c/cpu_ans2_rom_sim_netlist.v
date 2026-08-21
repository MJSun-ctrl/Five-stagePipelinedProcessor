// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Nov 18 18:46:03 2025
// Host        : DESKTOP-MKCAUSH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cpu_ans2_rom_sim_netlist.v
// Design      : cpu_ans2_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cpu_ans2_rom,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2" *) 
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
  (* c_mem_init_file = "cpu_ans2_rom.mif" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 16400)
`pragma protect data_block
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
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

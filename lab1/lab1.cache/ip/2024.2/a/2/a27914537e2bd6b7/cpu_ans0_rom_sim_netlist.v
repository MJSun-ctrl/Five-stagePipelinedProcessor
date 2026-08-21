// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Nov 18 18:46:03 2025
// Host        : DESKTOP-MKCAUSH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cpu_ans0_rom_sim_netlist.v
// Design      : cpu_ans0_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cpu_ans0_rom,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (a,
    spo);
  input [5:0]a;
  output [63:0]spo;

  wire \<const0> ;
  wire [5:0]a;
  wire [45:0]\^spo ;
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
  assign spo[45:39] = \^spo [45:39];
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
  (* c_mem_init_file = "cpu_ans0_rom.mif" *) 
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
        .spo({NLW_U0_spo_UNCONNECTED[63:46],\^spo }),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 15456)
`pragma protect data_block
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
/vabjX8jBh9s
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

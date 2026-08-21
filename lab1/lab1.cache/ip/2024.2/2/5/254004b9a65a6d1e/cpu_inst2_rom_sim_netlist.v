// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Nov 18 18:46:04 2025
// Host        : DESKTOP-MKCAUSH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cpu_inst2_rom_sim_netlist.v
// Design      : cpu_inst2_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cpu_inst2_rom,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (a,
    spo);
  input [6:0]a;
  output [31:0]spo;

  wire \<const0> ;
  wire [6:0]a;
  wire [30:0]\^spo ;
  wire [31:0]NLW_U0_dpo_UNCONNECTED;
  wire [31:0]NLW_U0_qdpo_UNCONNECTED;
  wire [31:0]NLW_U0_qspo_UNCONNECTED;
  wire [31:3]NLW_U0_spo_UNCONNECTED;

  assign spo[31] = \<const0> ;
  assign spo[30:27] = \^spo [30:27];
  assign spo[26] = \<const0> ;
  assign spo[25:10] = \^spo [25:10];
  assign spo[9] = \<const0> ;
  assign spo[8] = \<const0> ;
  assign spo[7:5] = \^spo [7:5];
  assign spo[4] = \<const0> ;
  assign spo[3] = \<const0> ;
  assign spo[2:0] = \^spo [2:0];
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
  (* c_addr_width = "7" *) 
  (* c_default_data = "0" *) 
  (* c_depth = "128" *) 
  (* c_elaboration_dir = "./" *) 
  (* c_has_clk = "0" *) 
  (* c_has_qspo = "0" *) 
  (* c_has_qspo_ce = "0" *) 
  (* c_has_qspo_rst = "0" *) 
  (* c_has_qspo_srst = "0" *) 
  (* c_has_spo = "1" *) 
  (* c_mem_init_file = "cpu_inst2_rom.mif" *) 
  (* c_parser_type = "1" *) 
  (* c_read_mif = "1" *) 
  (* c_reg_a_d_inputs = "0" *) 
  (* c_sync_enable = "1" *) 
  (* c_width = "32" *) 
  (* is_du_within_envelope = "true" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_dist_mem_gen_v8_0_13 U0
       (.a(a),
        .clk(1'b0),
        .d({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dpo(NLW_U0_dpo_UNCONNECTED[31:0]),
        .dpra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .i_ce(1'b1),
        .qdpo(NLW_U0_qdpo_UNCONNECTED[31:0]),
        .qdpo_ce(1'b1),
        .qdpo_clk(1'b0),
        .qdpo_rst(1'b0),
        .qdpo_srst(1'b0),
        .qspo(NLW_U0_qspo_UNCONNECTED[31:0]),
        .qspo_ce(1'b1),
        .qspo_rst(1'b0),
        .qspo_srst(1'b0),
        .spo({NLW_U0_spo_UNCONNECTED[31],\^spo }),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 12320)
`pragma protect data_block
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
dicKBn74Z0Y=
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

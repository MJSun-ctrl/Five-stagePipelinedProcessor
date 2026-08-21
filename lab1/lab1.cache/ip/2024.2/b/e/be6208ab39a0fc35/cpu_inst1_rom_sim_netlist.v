// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Nov 18 18:46:04 2025
// Host        : DESKTOP-MKCAUSH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cpu_inst1_rom_sim_netlist.v
// Design      : cpu_inst1_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cpu_inst1_rom,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2" *) 
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
  (* c_mem_init_file = "cpu_inst1_rom.mif" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 11296)
`pragma protect data_block
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
VGgjeG1Q8p/Mog==
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

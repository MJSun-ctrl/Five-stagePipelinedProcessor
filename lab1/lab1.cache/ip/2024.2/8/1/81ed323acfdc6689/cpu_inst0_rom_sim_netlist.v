// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Nov 18 18:46:03 2025
// Host        : DESKTOP-MKCAUSH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ cpu_inst0_rom_sim_netlist.v
// Design      : cpu_inst0_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cpu_inst0_rom,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2" *) 
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
  (* c_mem_init_file = "cpu_inst0_rom.mif" *) 
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17904)
`pragma protect data_block
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
Pe+LcrBw
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

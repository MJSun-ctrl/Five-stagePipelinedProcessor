// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Nov 18 18:46:04 2025
// Host        : DESKTOP-MKCAUSH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/sunmi/Desktop/CPU/lab1_uart_origin/lab1.gen/sources_1/ip/cpu_ans1_rom/cpu_ans1_rom_sim_netlist.v
// Design      : cpu_ans1_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cpu_ans1_rom,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module cpu_ans1_rom
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
  cpu_ans1_rom_dist_mem_gen_v8_0_13 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 15104)
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

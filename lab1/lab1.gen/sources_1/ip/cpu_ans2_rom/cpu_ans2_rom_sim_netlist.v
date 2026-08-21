// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Nov 18 18:46:04 2025
// Host        : DESKTOP-MKCAUSH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/sunmi/Desktop/CPU/lab1_uart_origin/lab1.gen/sources_1/ip/cpu_ans2_rom/cpu_ans2_rom_sim_netlist.v
// Design      : cpu_ans2_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cpu_ans2_rom,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module cpu_ans2_rom
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
  cpu_ans2_rom_dist_mem_gen_v8_0_13 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 16384)
`pragma protect data_block
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
BYeco5ooU6HhGJNeeL+UQgWZcvOiFYT+gA==
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

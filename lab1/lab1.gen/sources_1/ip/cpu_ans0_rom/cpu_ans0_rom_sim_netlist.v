// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Nov 18 18:46:04 2025
// Host        : DESKTOP-MKCAUSH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/sunmi/Desktop/CPU/lab1_uart_origin/lab1.gen/sources_1/ip/cpu_ans0_rom/cpu_ans0_rom_sim_netlist.v
// Design      : cpu_ans0_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cpu_ans0_rom,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module cpu_ans0_rom
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
  cpu_ans0_rom_dist_mem_gen_v8_0_13 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 15440)
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

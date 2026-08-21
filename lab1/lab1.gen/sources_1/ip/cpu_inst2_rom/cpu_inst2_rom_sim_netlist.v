// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Nov 18 18:46:06 2025
// Host        : DESKTOP-MKCAUSH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/sunmi/Desktop/CPU/lab1_uart_origin/lab1.gen/sources_1/ip/cpu_inst2_rom/cpu_inst2_rom_sim_netlist.v
// Design      : cpu_inst2_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cpu_inst2_rom,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module cpu_inst2_rom
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
  cpu_inst2_rom_dist_mem_gen_v8_0_13 U0
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
DrwZGXj9Wio=
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

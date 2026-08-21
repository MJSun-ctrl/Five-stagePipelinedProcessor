// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Nov 18 18:46:04 2025
// Host        : DESKTOP-MKCAUSH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/sunmi/Desktop/CPU/lab1_uart_origin/lab1.gen/sources_1/ip/cpu_inst0_rom/cpu_inst0_rom_sim_netlist.v
// Design      : cpu_inst0_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cpu_inst0_rom,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module cpu_inst0_rom
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
  cpu_inst0_rom_dist_mem_gen_v8_0_13 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17888)
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

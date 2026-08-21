// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Nov 18 18:46:06 2025
// Host        : DESKTOP-MKCAUSH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/sunmi/Desktop/CPU/lab1_uart_origin/lab1.gen/sources_1/ip/cpu_inst1_rom/cpu_inst1_rom_sim_netlist.v
// Design      : cpu_inst1_rom
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a200tfbg676-2
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "cpu_inst1_rom,dist_mem_gen_v8_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dist_mem_gen_v8_0_13,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module cpu_inst1_rom
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
  cpu_inst1_rom_dist_mem_gen_v8_0_13 U0
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
baKE6/mGRv7Z/A==
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

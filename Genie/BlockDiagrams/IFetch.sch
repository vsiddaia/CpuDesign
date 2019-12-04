# File saved with Nlview 6.8.11  2018-08-07 bk=1.4403 VDI=40 GEI=35 GUI=JA:9.0 non-TLS-threadsafe
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 15
property maxzoom 6.25
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #ff6666
property objecthighlight4 #0000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 8
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 15
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new InstructionFetch work:InstructionFetch:NOFILE -nosplit
load symbol InstructionMemory work:InstructionMemory:NOFILE HIERBOX pin rst_n input.left pinBus addr input.left [29:0] pinBus data output.right [31:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_MUX work MUX pin S input.bot pinBus I0 input.left [31:0] pinBus I1 input.left [31:0] pinBus O output.right [31:0] fillcolor 1
load symbol RTL_MUX2 work MUX pin S input.bot pinBus I0 input.left [29:0] pinBus I1 input.left [29:0] pinBus O output.right [29:0] fillcolor 1
load symbol RTL_ADD2 work RTL(+) pin I1 input.left pinBus I0 input.left [29:0] pinBus O output.right [29:0] fillcolor 1
load symbol RTL_MUX3 work MUX pin I0 input.left pin I1 input.left pin O output.right pin S input.bot fillcolor 1
load symbol RTL_REG__BREG_2 workC[29:0]ssw GEN pin C input.neg.clk.left pin D input.left pinBus Q output.right [29:0] fillcolor 1 sandwich 3 prop @bundle 30
load symbol RTL_REG__BREG_1 work[29:0]ssww GEN pin C input.clk.left pin CE input.left pinBus D input.left [29:0] pinBus Q output.right [29:0] fillcolor 1 sandwich 3 prop @bundle 30
load symbol RTL_ROM2 work GEN pinBus A input.left [31:0] pinBus O output.right [7:0] fillcolor 1
load symbol RTL_ADD1 work RTL(+) pinBus I0 input.left [31:0] pinBus I1 input.left [1:0] pinBus O output.right [31:0] fillcolor 1
load symbol RTL_ADD work RTL(+) pin I1 input.left pinBus I0 input.left [31:0] pinBus O output.right [31:0] fillcolor 1
load symbol RTL_LATCH work GEN pin G input.left pinBus D input.left [31:0] pinBus Q output.right [31:0] fillcolor 1
load inst imemory InstructionMemory work:InstructionMemory:NOFILE -unfold -autohide -attr @cell(#000000) InstructionMemory -attr @fillcolor #fafafa -pinBusAttr addr @name addr[29:0] -pinBusAttr data @name data[31:0] -pg 1 -lvl 1 -y 58
load inst imemory|data0_i__0 RTL_ROM2 work -hier imemory -attr @cell(#000000) RTL_ROM -attr @name data0_i__0 -pinBusAttr A @name A[31:0] -pinBusAttr O @name O[7:0] -pg 1 -lvl 3 -y 178
load inst imemory|data1_i__0 RTL_ADD1 work -hier imemory -attr @cell(#000000) RTL_ADD -attr @name data1_i__0 -pinBusAttr I0 @name I0[31:0] -pinBusAttr I1 @name I1[1:0] -pinBusAttr I1 @attr V=B\"10\" -pinBusAttr O @name O[31:0] -pg 1 -lvl 2 -y 178
load inst imemory|data0_i__1 RTL_ROM2 work -hier imemory -attr @cell(#000000) RTL_ROM -attr @name data0_i__1 -pinBusAttr A @name A[31:0] -pinBusAttr O @name O[7:0] -pg 1 -lvl 3 -y 298
load inst imemory|data1_i__1 RTL_ADD work -hier imemory -attr @cell(#000000) RTL_ADD -attr @name data1_i__1 -pinBusAttr I0 @name I0[31:0] -pinBusAttr O @name O[31:0] -pg 1 -lvl 2 -y 298
load inst imemory|extended_addr_reg RTL_LATCH work -hier imemory -attr @cell(#000000) RTL_LATCH -attr @name extended_addr_reg -pinBusAttr D @name D[31:0] -pinBusAttr Q @name Q[31:0] -pg 1 -lvl 1 -y 308
load inst imemory|data0_i__2 RTL_ROM2 work -hier imemory -attr @cell(#000000) RTL_ROM -attr @name data0_i__2 -pinBusAttr A @name A[31:0] -pinBusAttr O @name O[7:0] -pg 1 -lvl 3 -y 388
load inst imemory|data_i RTL_MUX work -hier imemory -attr @cell(#000000) RTL_MUX -attr @name data_i -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 4 -y 188
load inst imemory|data0_i RTL_ROM2 work -hier imemory -attr @cell(#000000) RTL_ROM -attr @name data0_i -pinBusAttr A @name A[31:0] -pinBusAttr O @name O[7:0] -pg 1 -lvl 3 -y 88
load inst imemory|data1_i RTL_ADD1 work -hier imemory -attr @cell(#000000) RTL_ADD -attr @name data1_i -pinBusAttr I0 @name I0[31:0] -pinBusAttr I1 @name I1[1:0] -pinBusAttr O @name O[31:0] -pg 1 -lvl 2 -y 88
load net imemory|data1[17] -attr @rip O[17] -attr @name data1[17] -pin imemory|data0_i__1 A[17] -pin imemory|data1_i__1 O[17]
load net imemory|addr[11] -attr @rip addr[11] -attr @name addr[11] -hierPin imemory addr[11] -pin imemory|extended_addr_reg D[13]
load net imemory|data1_i__0_n_20 -attr @rip O[11] -attr @name data1_i__0_n_20 -pin imemory|data0_i__0 A[11] -pin imemory|data1_i__0 O[11]
load net imemory|data1_i__0_n_21 -attr @rip O[10] -attr @name data1_i__0_n_21 -pin imemory|data0_i__0 A[10] -pin imemory|data1_i__0 O[10]
load net imemory|data1[24] -attr @rip O[24] -attr @name data1[24] -pin imemory|data0_i__1 A[24] -pin imemory|data1_i__1 O[24]
load net imemory|data1_i__0_n_22 -attr @rip O[9] -attr @name data1_i__0_n_22 -pin imemory|data0_i__0 A[9] -pin imemory|data1_i__0 O[9]
load net imemory|rst_n -attr @name rst_n -hierPin imemory rst_n -pin imemory|data_i S -pin imemory|extended_addr_reg G
netloc imemory|rst_n 1 0 4 100 248 NJ 248 NJ 248 N
load net imemory|data1_i__0_n_23 -attr @rip O[8] -attr @name data1_i__0_n_23 -pin imemory|data0_i__0 A[8] -pin imemory|data1_i__0 O[8]
load net imemory|addr[28] -attr @rip addr[28] -attr @name addr[28] -hierPin imemory addr[28] -pin imemory|extended_addr_reg D[30]
load net imemory|data1_i__0_n_24 -attr @rip O[7] -attr @name data1_i__0_n_24 -pin imemory|data0_i__0 A[7] -pin imemory|data1_i__0 O[7]
load net imemory|extended_addr[23] -attr @rip Q[23] -attr @name extended_addr[23] -pin imemory|data0_i__2 A[23] -pin imemory|data1_i I0[23] -pin imemory|data1_i__0 I0[23] -pin imemory|data1_i__1 I0[23] -pin imemory|extended_addr_reg Q[23]
load net imemory|data1_i__0_n_25 -attr @rip O[6] -attr @name data1_i__0_n_25 -pin imemory|data0_i__0 A[6] -pin imemory|data1_i__0 O[6]
load net imemory|extended_addr[10] -attr @rip Q[10] -attr @name extended_addr[10] -pin imemory|data0_i__2 A[10] -pin imemory|data1_i I0[10] -pin imemory|data1_i__0 I0[10] -pin imemory|data1_i__1 I0[10] -pin imemory|extended_addr_reg Q[10]
load net imemory|p_0_in[17] -attr @rip O[1] -attr @name p_0_in[17] -pin imemory|data0_i__1 O[1] -pin imemory|data_i I0[17]
load net imemory|data1_i__0_n_26 -attr @rip O[5] -attr @name data1_i__0_n_26 -pin imemory|data0_i__0 A[5] -pin imemory|data1_i__0 O[5]
load net imemory|extended_addr[8] -attr @rip Q[8] -attr @name extended_addr[8] -pin imemory|data0_i__2 A[8] -pin imemory|data1_i I0[8] -pin imemory|data1_i__0 I0[8] -pin imemory|data1_i__1 I0[8] -pin imemory|extended_addr_reg Q[8]
load net imemory|p_0_in[6] -attr @rip O[6] -attr @name p_0_in[6] -pin imemory|data0_i O[6] -pin imemory|data_i I0[6]
load net imemory|data1_i__0_n_27 -attr @rip O[4] -attr @name data1_i__0_n_27 -pin imemory|data0_i__0 A[4] -pin imemory|data1_i__0 O[4]
load net imemory|data1_i__0_n_28 -attr @rip O[3] -attr @name data1_i__0_n_28 -pin imemory|data0_i__0 A[3] -pin imemory|data1_i__0 O[3]
load net imemory|data1_i__0_n_29 -attr @rip O[2] -attr @name data1_i__0_n_29 -pin imemory|data0_i__0 A[2] -pin imemory|data1_i__0 O[2]
load net imemory|addr[16] -attr @rip addr[16] -attr @name addr[16] -hierPin imemory addr[16] -pin imemory|extended_addr_reg D[18]
load net imemory|addr[4] -attr @rip addr[4] -attr @name addr[4] -hierPin imemory addr[4] -pin imemory|extended_addr_reg D[6]
load net imemory|data[20] -attr @rip O[20] -attr @name data[20] -hierPin imemory data[20] -pin imemory|data_i O[20]
load net imemory|data1[2] -attr @rip O[2] -attr @name data1[2] -pin imemory|data0_i__1 A[2] -pin imemory|data1_i__1 O[2]
load net imemory|data1[18] -attr @rip O[18] -attr @name data1[18] -pin imemory|data0_i__1 A[18] -pin imemory|data1_i__1 O[18]
load net imemory|addr[12] -attr @rip addr[12] -attr @name addr[12] -hierPin imemory addr[12] -pin imemory|extended_addr_reg D[14]
load net imemory|data1_i__0_n_30 -attr @rip O[1] -attr @name data1_i__0_n_30 -pin imemory|data0_i__0 A[1] -pin imemory|data1_i__0 O[1]
load net imemory|data1_i__0_n_31 -attr @rip O[0] -attr @name data1_i__0_n_31 -pin imemory|data0_i__0 A[0] -pin imemory|data1_i__0 O[0]
load net imemory|addr[27] -attr @rip addr[27] -attr @name addr[27] -hierPin imemory addr[27] -pin imemory|extended_addr_reg D[29]
load net imemory|extended_addr[22] -attr @rip Q[22] -attr @name extended_addr[22] -pin imemory|data0_i__2 A[22] -pin imemory|data1_i I0[22] -pin imemory|data1_i__0 I0[22] -pin imemory|data1_i__1 I0[22] -pin imemory|extended_addr_reg Q[22]
load net imemory|extended_addr[11] -attr @rip Q[11] -attr @name extended_addr[11] -pin imemory|data0_i__2 A[11] -pin imemory|data1_i I0[11] -pin imemory|data1_i__0 I0[11] -pin imemory|data1_i__1 I0[11] -pin imemory|extended_addr_reg Q[11]
load net imemory|p_0_in[18] -attr @rip O[2] -attr @name p_0_in[18] -pin imemory|data0_i__1 O[2] -pin imemory|data_i I0[18]
load net imemory|addr[13] -attr @rip addr[13] -attr @name addr[13] -hierPin imemory addr[13] -pin imemory|extended_addr_reg D[15]
load net imemory|extended_addr[9] -attr @rip Q[9] -attr @name extended_addr[9] -pin imemory|data0_i__2 A[9] -pin imemory|data1_i I0[9] -pin imemory|data1_i__0 I0[9] -pin imemory|data1_i__1 I0[9] -pin imemory|extended_addr_reg Q[9]
load net imemory|p_0_in[7] -attr @rip O[7] -attr @name p_0_in[7] -pin imemory|data0_i O[7] -pin imemory|data_i I0[7]
load net imemory|addr[5] -attr @rip addr[5] -attr @name addr[5] -hierPin imemory addr[5] -pin imemory|extended_addr_reg D[7]
load net imemory|data1[3] -attr @rip O[3] -attr @name data1[3] -pin imemory|data0_i__1 A[3] -pin imemory|data1_i__1 O[3]
load net imemory|p_0_in[11] -attr @rip O[3] -attr @name p_0_in[11] -pin imemory|data0_i__0 O[3] -pin imemory|data_i I0[11]
load net imemory|data1[19] -attr @rip O[19] -attr @name data1[19] -pin imemory|data0_i__1 A[19] -pin imemory|data1_i__1 O[19]
load net imemory|addr[21] -attr @rip addr[21] -attr @name addr[21] -hierPin imemory addr[21] -pin imemory|extended_addr_reg D[23]
load net imemory|addr[26] -attr @rip addr[26] -attr @name addr[26] -hierPin imemory addr[26] -pin imemory|extended_addr_reg D[28]
load net imemory|extended_addr[25] -attr @rip Q[25] -attr @name extended_addr[25] -pin imemory|data0_i__2 A[25] -pin imemory|data1_i I0[25] -pin imemory|data1_i__0 I0[25] -pin imemory|data1_i__1 I0[25] -pin imemory|extended_addr_reg Q[25]
load net imemory|extended_addr[12] -attr @rip Q[12] -attr @name extended_addr[12] -pin imemory|data0_i__2 A[12] -pin imemory|data1_i I0[12] -pin imemory|data1_i__0 I0[12] -pin imemory|data1_i__1 I0[12] -pin imemory|extended_addr_reg Q[12]
load net imemory|addr[14] -attr @rip addr[14] -attr @name addr[14] -hierPin imemory addr[14] -pin imemory|extended_addr_reg D[16]
load net imemory|p_0_in[8] -attr @rip O[0] -attr @name p_0_in[8] -pin imemory|data0_i__0 O[0] -pin imemory|data_i I0[8]
load net imemory|data1[8] -attr @rip O[8] -attr @name data1[8] -pin imemory|data0_i__1 A[8] -pin imemory|data1_i__1 O[8]
load net imemory|data[9] -attr @rip O[9] -attr @name data[9] -hierPin imemory data[9] -pin imemory|data_i O[9]
load net imemory|addr[10] -attr @rip addr[10] -attr @name addr[10] -hierPin imemory addr[10] -pin imemory|extended_addr_reg D[12]
load net imemory|data1[21] -attr @rip O[21] -attr @name data1[21] -pin imemory|data0_i__1 A[21] -pin imemory|data1_i__1 O[21]
load net imemory|data[26] -attr @rip O[26] -attr @name data[26] -hierPin imemory data[26] -pin imemory|data_i O[26]
load net imemory|p_0_in[12] -attr @rip O[4] -attr @name p_0_in[12] -pin imemory|data0_i__0 O[4] -pin imemory|data_i I0[12]
load net imemory|addr[20] -attr @rip addr[20] -attr @name addr[20] -hierPin imemory addr[20] -pin imemory|extended_addr_reg D[22]
load net imemory|addr[25] -attr @rip addr[25] -attr @name addr[25] -hierPin imemory addr[25] -pin imemory|extended_addr_reg D[27]
load net imemory|data1_i__0_n_0 -attr @rip O[31] -attr @name data1_i__0_n_0 -pin imemory|data0_i__0 A[31] -pin imemory|data1_i__0 O[31]
load net imemory|extended_addr[17] -attr @rip Q[17] -attr @name extended_addr[17] -pin imemory|data0_i__2 A[17] -pin imemory|data1_i I0[17] -pin imemory|data1_i__0 I0[17] -pin imemory|data1_i__1 I0[17] -pin imemory|extended_addr_reg Q[17]
load net imemory|data1_i__0_n_1 -attr @rip O[30] -attr @name data1_i__0_n_1 -pin imemory|data0_i__0 A[30] -pin imemory|data1_i__0 O[30]
load net imemory|data1_i__0_n_2 -attr @rip O[29] -attr @name data1_i__0_n_2 -pin imemory|data0_i__0 A[29] -pin imemory|data1_i__0 O[29]
load net imemory|data1_i__0_n_3 -attr @rip O[28] -attr @name data1_i__0_n_3 -pin imemory|data0_i__0 A[28] -pin imemory|data1_i__0 O[28]
load net imemory|data1_i__0_n_4 -attr @rip O[27] -attr @name data1_i__0_n_4 -pin imemory|data0_i__0 A[27] -pin imemory|data1_i__0 O[27]
load net imemory|extended_addr[24] -attr @rip Q[24] -attr @name extended_addr[24] -pin imemory|data0_i__2 A[24] -pin imemory|data1_i I0[24] -pin imemory|data1_i__0 I0[24] -pin imemory|data1_i__1 I0[24] -pin imemory|extended_addr_reg Q[24]
load net imemory|data1_i__0_n_5 -attr @rip O[26] -attr @name data1_i__0_n_5 -pin imemory|data0_i__0 A[26] -pin imemory|data1_i__0 O[26]
load net imemory|p_0_in[1] -attr @rip O[1] -attr @name p_0_in[1] -pin imemory|data0_i O[1] -pin imemory|data_i I0[1]
load net imemory|p_0_in[23] -attr @rip O[7] -attr @name p_0_in[23] -pin imemory|data0_i__1 O[7] -pin imemory|data_i I0[23]
load net imemory|data1_i__0_n_6 -attr @rip O[25] -attr @name data1_i__0_n_6 -pin imemory|data0_i__0 A[25] -pin imemory|data1_i__0 O[25]
load net imemory|data1_i__0_n_7 -attr @rip O[24] -attr @name data1_i__0_n_7 -pin imemory|data0_i__0 A[24] -pin imemory|data1_i__0 O[24]
load net imemory|data1_i__0_n_8 -attr @rip O[23] -attr @name data1_i__0_n_8 -pin imemory|data0_i__0 A[23] -pin imemory|data1_i__0 O[23]
load net imemory|p_0_in[9] -attr @rip O[1] -attr @name p_0_in[9] -pin imemory|data0_i__0 O[1] -pin imemory|data_i I0[9]
load net imemory|data1[13] -attr @rip O[13] -attr @name data1[13] -pin imemory|data0_i__1 A[13] -pin imemory|data1_i__1 O[13]
load net imemory|data1[9] -attr @rip O[9] -attr @name data1[9] -pin imemory|data0_i__1 A[9] -pin imemory|data1_i__1 O[9]
load net imemory|data1_i__0_n_9 -attr @rip O[22] -attr @name data1_i__0_n_9 -pin imemory|data0_i__0 A[22] -pin imemory|data1_i__0 O[22]
load net imemory|data1[31] -attr @rip O[31] -attr @name data1[31] -pin imemory|data0_i__1 A[31] -pin imemory|data1_i__1 O[31]
load net imemory|addr[19] -attr @rip addr[19] -attr @name addr[19] -hierPin imemory addr[19] -pin imemory|extended_addr_reg D[21]
load net imemory|data1[20] -attr @rip O[20] -attr @name data1[20] -pin imemory|data0_i__1 A[20] -pin imemory|data1_i__1 O[20]
load net imemory|data[25] -attr @rip O[25] -attr @name data[25] -hierPin imemory data[25] -pin imemory|data_i O[25]
load net imemory|addr[24] -attr @rip addr[24] -attr @name addr[24] -hierPin imemory addr[24] -pin imemory|extended_addr_reg D[26]
load net imemory|p_0_in[13] -attr @rip O[5] -attr @name p_0_in[13] -pin imemory|data0_i__0 O[5] -pin imemory|data_i I0[13]
load net imemory|extended_addr[18] -attr @rip Q[18] -attr @name extended_addr[18] -pin imemory|data0_i__2 A[18] -pin imemory|data1_i I0[18] -pin imemory|data1_i__0 I0[18] -pin imemory|data1_i__1 I0[18] -pin imemory|extended_addr_reg Q[18]
load net imemory|extended_addr[4] -attr @rip Q[4] -attr @name extended_addr[4] -pin imemory|data0_i__2 A[4] -pin imemory|data1_i I0[4] -pin imemory|data1_i__0 I0[4] -pin imemory|data1_i__1 I0[4] -pin imemory|extended_addr_reg Q[4]
load net imemory|data[18] -attr @rip O[18] -attr @name data[18] -hierPin imemory data[18] -pin imemory|data_i O[18]
load net imemory|p_0_in[0] -attr @rip O[0] -attr @name p_0_in[0] -pin imemory|data0_i O[0] -pin imemory|data_i I0[0]
load net imemory|p_0_in[22] -attr @rip O[6] -attr @name p_0_in[22] -pin imemory|data0_i__1 O[6] -pin imemory|data_i I0[22]
load net imemory|data[2] -attr @rip O[2] -attr @name data[2] -hierPin imemory data[2] -pin imemory|data_i O[2]
load net imemory|data1[27] -attr @rip O[27] -attr @name data1[27] -pin imemory|data0_i__1 A[27] -pin imemory|data1_i__1 O[27]
load net imemory|data1[14] -attr @rip O[14] -attr @name data1[14] -pin imemory|data0_i__1 A[14] -pin imemory|data1_i__1 O[14]
load net imemory|addr[8] -attr @rip addr[8] -attr @name addr[8] -hierPin imemory addr[8] -pin imemory|extended_addr_reg D[10]
load net imemory|data[24] -attr @rip O[24] -attr @name data[24] -hierPin imemory data[24] -pin imemory|data_i O[24]
load net imemory|addr[23] -attr @rip addr[23] -attr @name addr[23] -hierPin imemory addr[23] -pin imemory|extended_addr_reg D[25]
load net imemory|p_0_in[14] -attr @rip O[6] -attr @name p_0_in[14] -pin imemory|data0_i__0 O[6] -pin imemory|data_i I0[14]
load net imemory|data[30] -attr @rip O[30] -attr @name data[30] -hierPin imemory data[30] -pin imemory|data_i O[30]
load net imemory|extended_addr[19] -attr @rip Q[19] -attr @name extended_addr[19] -pin imemory|data0_i__2 A[19] -pin imemory|data1_i I0[19] -pin imemory|data1_i__0 I0[19] -pin imemory|data1_i__1 I0[19] -pin imemory|extended_addr_reg Q[19]
load net imemory|extended_addr[5] -attr @rip Q[5] -attr @name extended_addr[5] -pin imemory|data0_i__2 A[5] -pin imemory|data1_i I0[5] -pin imemory|data1_i__0 I0[5] -pin imemory|data1_i__1 I0[5] -pin imemory|extended_addr_reg Q[5]
load net imemory|data[19] -attr @rip O[19] -attr @name data[19] -hierPin imemory data[19] -pin imemory|data_i O[19]
load net imemory|p_0_in[21] -attr @rip O[5] -attr @name p_0_in[21] -pin imemory|data0_i__1 O[5] -pin imemory|data_i I0[21]
load net imemory|data[1] -attr @rip O[1] -attr @name data[1] -hierPin imemory data[1] -pin imemory|data_i O[1]
load net imemory|data[6] -attr @rip O[6] -attr @name data[6] -hierPin imemory data[6] -pin imemory|data_i O[6]
load net imemory|data1[26] -attr @rip O[26] -attr @name data1[26] -pin imemory|data0_i__1 A[26] -pin imemory|data1_i__1 O[26]
load net imemory|addr[17] -attr @rip addr[17] -attr @name addr[17] -hierPin imemory addr[17] -pin imemory|extended_addr_reg D[19]
load net imemory|data1[15] -attr @rip O[15] -attr @name data1[15] -pin imemory|data0_i__1 A[15] -pin imemory|data1_i__1 O[15]
load net imemory|p_0_in[19] -attr @rip O[3] -attr @name p_0_in[19] -pin imemory|data0_i__1 O[3] -pin imemory|data_i I0[19]
load net imemory|addr[2] -attr @rip addr[2] -attr @name addr[2] -hierPin imemory addr[2] -pin imemory|extended_addr_reg D[4]
load net imemory|data[23] -attr @rip O[23] -attr @name data[23] -hierPin imemory data[23] -pin imemory|data_i O[23]
load net imemory|addr[22] -attr @rip addr[22] -attr @name addr[22] -hierPin imemory addr[22] -pin imemory|extended_addr_reg D[24]
load net imemory|addr[9] -attr @rip addr[9] -attr @name addr[9] -hierPin imemory addr[9] -pin imemory|extended_addr_reg D[11]
load net imemory|extended_addr[21] -attr @rip Q[21] -attr @name extended_addr[21] -pin imemory|data0_i__2 A[21] -pin imemory|data1_i I0[21] -pin imemory|data1_i__0 I0[21] -pin imemory|data1_i__1 I0[21] -pin imemory|extended_addr_reg Q[21]
load net imemory|data1_i_n_30 -attr @rip O[1] -attr @name data1_i_n_30 -pin imemory|data0_i A[1] -pin imemory|data1_i O[1]
load net imemory|p_0_in[20] -attr @rip O[4] -attr @name p_0_in[20] -pin imemory|data0_i__1 O[4] -pin imemory|data_i I0[20]
load net imemory|data1_i_n_31 -attr @rip O[0] -attr @name data1_i_n_31 -pin imemory|data0_i A[0] -pin imemory|data1_i O[0]
load net imemory|data[31] -attr @rip O[31] -attr @name data[31] -hierPin imemory data[31] -pin imemory|data_i O[31]
load net imemory|extended_addr[6] -attr @rip Q[6] -attr @name extended_addr[6] -pin imemory|data0_i__2 A[6] -pin imemory|data1_i I0[6] -pin imemory|data1_i__0 I0[6] -pin imemory|data1_i__1 I0[6] -pin imemory|extended_addr_reg Q[6]
load net imemory|data1[4] -attr @rip O[4] -attr @name data1[4] -pin imemory|data0_i__1 A[4] -pin imemory|data1_i__1 O[4]
load net imemory|data[5] -attr @rip O[5] -attr @name data[5] -hierPin imemory data[5] -pin imemory|data_i O[5]
load net imemory|<const1> -power -attr @name <const1> -pin imemory|data1_i I1[1] -pin imemory|data1_i I1[0] -pin imemory|data1_i__0 I1[1] -pin imemory|data1_i__1 I1
load net imemory|data1_i_n_20 -attr @rip O[11] -attr @name data1_i_n_20 -pin imemory|data0_i A[11] -pin imemory|data1_i O[11]
load net imemory|data[4] -attr @rip O[4] -attr @name data[4] -hierPin imemory data[4] -pin imemory|data_i O[4]
load net imemory|data1[30] -attr @rip O[30] -attr @name data1[30] -pin imemory|data0_i__1 A[30] -pin imemory|data1_i__1 O[30]
load net imemory|data1_i_n_21 -attr @rip O[10] -attr @name data1_i_n_21 -pin imemory|data0_i A[10] -pin imemory|data1_i O[10]
load net imemory|data1_i_n_22 -attr @rip O[9] -attr @name data1_i_n_22 -pin imemory|data0_i A[9] -pin imemory|data1_i O[9]
load net imemory|addr[18] -attr @rip addr[18] -attr @name addr[18] -hierPin imemory addr[18] -pin imemory|extended_addr_reg D[20]
load net imemory|data1[29] -attr @rip O[29] -attr @name data1[29] -pin imemory|data0_i__1 A[29] -pin imemory|data1_i__1 O[29]
load net imemory|data1_i_n_23 -attr @rip O[8] -attr @name data1_i_n_23 -pin imemory|data0_i A[8] -pin imemory|data1_i O[8]
load net imemory|data1[16] -attr @rip O[16] -attr @name data1[16] -pin imemory|data0_i__1 A[16] -pin imemory|data1_i__1 O[16]
load net imemory|data1_i_n_24 -attr @rip O[7] -attr @name data1_i_n_24 -pin imemory|data0_i A[7] -pin imemory|data1_i O[7]
load net imemory|extended_addr[13] -attr @rip Q[13] -attr @name extended_addr[13] -pin imemory|data0_i__2 A[13] -pin imemory|data1_i I0[13] -pin imemory|data1_i__0 I0[13] -pin imemory|data1_i__1 I0[13] -pin imemory|extended_addr_reg Q[13]
load net imemory|addr[3] -attr @rip addr[3] -attr @name addr[3] -hierPin imemory addr[3] -pin imemory|extended_addr_reg D[5]
load net imemory|data1_i_n_25 -attr @rip O[6] -attr @name data1_i_n_25 -pin imemory|data0_i A[6] -pin imemory|data1_i O[6]
load net imemory|extended_addr[31] -attr @rip Q[31] -attr @name extended_addr[31] -pin imemory|data0_i__2 A[31] -pin imemory|data1_i I0[31] -pin imemory|data1_i__0 I0[31] -pin imemory|data1_i__1 I0[31] -pin imemory|extended_addr_reg Q[31]
load net imemory|data1_i_n_26 -attr @rip O[5] -attr @name data1_i_n_26 -pin imemory|data0_i A[5] -pin imemory|data1_i O[5]
load net imemory|data1_i_n_27 -attr @rip O[4] -attr @name data1_i_n_27 -pin imemory|data0_i A[4] -pin imemory|data1_i O[4]
load net imemory|data[10] -attr @rip O[10] -attr @name data[10] -hierPin imemory data[10] -pin imemory|data_i O[10]
load net imemory|p_0_in[10] -attr @rip O[2] -attr @name p_0_in[10] -pin imemory|data0_i__0 O[2] -pin imemory|data_i I0[10]
load net imemory|data1_i_n_28 -attr @rip O[3] -attr @name data1_i_n_28 -pin imemory|data0_i A[3] -pin imemory|data1_i O[3]
load net imemory|extended_addr[20] -attr @rip Q[20] -attr @name extended_addr[20] -pin imemory|data0_i__2 A[20] -pin imemory|data1_i I0[20] -pin imemory|data1_i__0 I0[20] -pin imemory|data1_i__1 I0[20] -pin imemory|extended_addr_reg Q[20]
load net imemory|data1_i_n_29 -attr @rip O[2] -attr @name data1_i_n_29 -pin imemory|data0_i A[2] -pin imemory|data1_i O[2]
load net imemory|extended_addr[7] -attr @rip Q[7] -attr @name extended_addr[7] -pin imemory|data0_i__2 A[7] -pin imemory|data1_i I0[7] -pin imemory|data1_i__0 I0[7] -pin imemory|data1_i__1 I0[7] -pin imemory|extended_addr_reg Q[7]
load net imemory|data1[5] -attr @rip O[5] -attr @name data1[5] -pin imemory|data0_i__1 A[5] -pin imemory|data1_i__1 O[5]
load net imemory|p_0_in[2] -attr @rip O[2] -attr @name p_0_in[2] -pin imemory|data0_i O[2] -pin imemory|data_i I0[2]
load net imemory|data1_i_n_10 -attr @rip O[21] -attr @name data1_i_n_10 -pin imemory|data0_i A[21] -pin imemory|data1_i O[21]
load net imemory|data[3] -attr @rip O[3] -attr @name data[3] -hierPin imemory data[3] -pin imemory|data_i O[3]
load net imemory|data[8] -attr @rip O[8] -attr @name data[8] -hierPin imemory data[8] -pin imemory|data_i O[8]
load net imemory|data1_i_n_11 -attr @rip O[20] -attr @name data1_i_n_11 -pin imemory|data0_i A[20] -pin imemory|data1_i O[20]
load net imemory|data1_i_n_12 -attr @rip O[19] -attr @name data1_i_n_12 -pin imemory|data0_i A[19] -pin imemory|data1_i O[19]
load net imemory|p_0_in[27] -attr @rip O[3] -attr @name p_0_in[27] -pin imemory|data0_i__2 O[3] -pin imemory|data_i I0[27]
load net imemory|addr[0] -attr @rip addr[0] -attr @name addr[0] -hierPin imemory addr[0] -pin imemory|extended_addr_reg D[2]
load net imemory|data1[28] -attr @rip O[28] -attr @name data1[28] -pin imemory|data0_i__1 A[28] -pin imemory|data1_i__1 O[28]
load net imemory|data1_i_n_13 -attr @rip O[18] -attr @name data1_i_n_13 -pin imemory|data0_i A[18] -pin imemory|data1_i O[18]
load net imemory|data1_i_n_14 -attr @rip O[17] -attr @name data1_i_n_14 -pin imemory|data0_i A[17] -pin imemory|data1_i O[17]
load net imemory|data1_i_n_15 -attr @rip O[16] -attr @name data1_i_n_15 -pin imemory|data0_i A[16] -pin imemory|data1_i O[16]
load net imemory|extended_addr[27] -attr @rip Q[27] -attr @name extended_addr[27] -pin imemory|data0_i__2 A[27] -pin imemory|data1_i I0[27] -pin imemory|data1_i__0 I0[27] -pin imemory|data1_i__1 I0[27] -pin imemory|extended_addr_reg Q[27]
load net imemory|data1_i_n_16 -attr @rip O[15] -attr @name data1_i_n_16 -pin imemory|data0_i A[15] -pin imemory|data1_i O[15]
load net imemory|extended_addr[0] -attr @rip Q[0] -attr @name extended_addr[0] -pin imemory|data0_i__2 A[0] -pin imemory|data1_i I0[0] -pin imemory|data1_i__0 I0[0] -pin imemory|data1_i__1 I0[0] -pin imemory|extended_addr_reg Q[0]
load net imemory|extended_addr[14] -attr @rip Q[14] -attr @name extended_addr[14] -pin imemory|data0_i__2 A[14] -pin imemory|data1_i I0[14] -pin imemory|data1_i__0 I0[14] -pin imemory|data1_i__1 I0[14] -pin imemory|extended_addr_reg Q[14]
load net imemory|data1_i_n_17 -attr @rip O[14] -attr @name data1_i_n_17 -pin imemory|data0_i A[14] -pin imemory|data1_i O[14]
load net imemory|data[14] -attr @rip O[14] -attr @name data[14] -hierPin imemory data[14] -pin imemory|data_i O[14]
load net imemory|data1_i_n_18 -attr @rip O[13] -attr @name data1_i_n_18 -pin imemory|data0_i A[13] -pin imemory|data1_i O[13]
load net imemory|data1_i_n_19 -attr @rip O[12] -attr @name data1_i_n_19 -pin imemory|data0_i A[12] -pin imemory|data1_i O[12]
load net imemory|data[11] -attr @rip O[11] -attr @name data[11] -hierPin imemory data[11] -pin imemory|data_i O[11]
load net imemory|data[29] -attr @rip O[29] -attr @name data[29] -hierPin imemory data[29] -pin imemory|data_i O[29]
load net imemory|data1[23] -attr @rip O[23] -attr @name data1[23] -pin imemory|data0_i__1 A[23] -pin imemory|data1_i__1 O[23]
load net imemory|data1[10] -attr @rip O[10] -attr @name data1[10] -pin imemory|data0_i__1 A[10] -pin imemory|data1_i__1 O[10]
load net imemory|data1[6] -attr @rip O[6] -attr @name data1[6] -pin imemory|data0_i__1 A[6] -pin imemory|data1_i__1 O[6]
load net imemory|data[7] -attr @rip O[7] -attr @name data[7] -hierPin imemory data[7] -pin imemory|data_i O[7]
load net imemory|p_0_in[3] -attr @rip O[3] -attr @name p_0_in[3] -pin imemory|data0_i O[3] -pin imemory|data_i I0[3]
load net imemory|p_0_in[26] -attr @rip O[2] -attr @name p_0_in[26] -pin imemory|data0_i__2 O[2] -pin imemory|data_i I0[26]
load net imemory|addr[1] -attr @rip addr[1] -attr @name addr[1] -hierPin imemory addr[1] -pin imemory|extended_addr_reg D[3]
load net imemory|data1_i_n_0 -attr @rip O[31] -attr @name data1_i_n_0 -pin imemory|data0_i A[31] -pin imemory|data1_i O[31]
load net imemory|extended_addr[26] -attr @rip Q[26] -attr @name extended_addr[26] -pin imemory|data0_i__2 A[26] -pin imemory|data1_i I0[26] -pin imemory|data1_i__0 I0[26] -pin imemory|data1_i__1 I0[26] -pin imemory|extended_addr_reg Q[26]
load net imemory|data1_i_n_1 -attr @rip O[30] -attr @name data1_i_n_1 -pin imemory|data0_i A[30] -pin imemory|data1_i O[30]
load net imemory|data1_i_n_2 -attr @rip O[29] -attr @name data1_i_n_2 -pin imemory|data0_i A[29] -pin imemory|data1_i O[29]
load net imemory|data1_i_n_3 -attr @rip O[28] -attr @name data1_i_n_3 -pin imemory|data0_i A[28] -pin imemory|data1_i O[28]
load net imemory|extended_addr[15] -attr @rip Q[15] -attr @name extended_addr[15] -pin imemory|data0_i__2 A[15] -pin imemory|data1_i I0[15] -pin imemory|data1_i__0 I0[15] -pin imemory|data1_i__1 I0[15] -pin imemory|extended_addr_reg Q[15]
load net imemory|extended_addr[1] -attr @rip Q[1] -attr @name extended_addr[1] -pin imemory|data0_i__2 A[1] -pin imemory|data1_i I0[1] -pin imemory|data1_i__0 I0[1] -pin imemory|data1_i__1 I0[1] -pin imemory|extended_addr_reg Q[1]
load net imemory|data1_i_n_4 -attr @rip O[27] -attr @name data1_i_n_4 -pin imemory|data0_i A[27] -pin imemory|data1_i O[27]
load net imemory|data[15] -attr @rip O[15] -attr @name data[15] -hierPin imemory data[15] -pin imemory|data_i O[15]
load net imemory|data1_i_n_5 -attr @rip O[26] -attr @name data1_i_n_5 -pin imemory|data0_i A[26] -pin imemory|data1_i O[26]
load net imemory|p_0_in[29] -attr @rip O[5] -attr @name p_0_in[29] -pin imemory|data0_i__2 O[5] -pin imemory|data_i I0[29]
load net imemory|p_0_in[30] -attr @rip O[6] -attr @name p_0_in[30] -pin imemory|data0_i__2 O[6] -pin imemory|data_i I0[30]
load net imemory|data1_i_n_6 -attr @rip O[25] -attr @name data1_i_n_6 -pin imemory|data0_i A[25] -pin imemory|data1_i O[25]
load net imemory|data[12] -attr @rip O[12] -attr @name data[12] -hierPin imemory data[12] -pin imemory|data_i O[12]
load net imemory|data[28] -attr @rip O[28] -attr @name data[28] -hierPin imemory data[28] -pin imemory|data_i O[28]
load net imemory|data1_i_n_7 -attr @rip O[24] -attr @name data1_i_n_7 -pin imemory|data0_i A[24] -pin imemory|data1_i O[24]
load net imemory|data1_i_n_8 -attr @rip O[23] -attr @name data1_i_n_8 -pin imemory|data0_i A[23] -pin imemory|data1_i O[23]
load net imemory|data1[22] -attr @rip O[22] -attr @name data1[22] -pin imemory|data0_i__1 A[22] -pin imemory|data1_i__1 O[22]
load net imemory|data1_i_n_9 -attr @rip O[22] -attr @name data1_i_n_9 -pin imemory|data0_i A[22] -pin imemory|data1_i O[22]
load net imemory|<const0> -ground -attr @name <const0> -pin imemory|data1_i__0 I1[0] -pin imemory|data_i I1[31] -pin imemory|data_i I1[30] -pin imemory|data_i I1[29] -pin imemory|data_i I1[28] -pin imemory|data_i I1[27] -pin imemory|data_i I1[26] -pin imemory|data_i I1[25] -pin imemory|data_i I1[24] -pin imemory|data_i I1[23] -pin imemory|data_i I1[22] -pin imemory|data_i I1[21] -pin imemory|data_i I1[20] -pin imemory|data_i I1[19] -pin imemory|data_i I1[18] -pin imemory|data_i I1[17] -pin imemory|data_i I1[16] -pin imemory|data_i I1[15] -pin imemory|data_i I1[14] -pin imemory|data_i I1[13] -pin imemory|data_i I1[12] -pin imemory|data_i I1[11] -pin imemory|data_i I1[10] -pin imemory|data_i I1[9] -pin imemory|data_i I1[8] -pin imemory|data_i I1[7] -pin imemory|data_i I1[6] -pin imemory|data_i I1[5] -pin imemory|data_i I1[4] -pin imemory|data_i I1[3] -pin imemory|data_i I1[2] -pin imemory|data_i I1[1] -pin imemory|data_i I1[0] -pin imemory|extended_addr_reg D[1] -pin imemory|extended_addr_reg D[0]
load net imemory|data1[11] -attr @rip O[11] -attr @name data1[11] -pin imemory|data0_i__1 A[11] -pin imemory|data1_i__1 O[11]
load net imemory|data1[7] -attr @rip O[7] -attr @name data1[7] -pin imemory|data0_i__1 A[7] -pin imemory|data1_i__1 O[7]
load net imemory|p_0_in[15] -attr @rip O[7] -attr @name p_0_in[15] -pin imemory|data0_i__0 O[7] -pin imemory|data_i I0[15]
load net imemory|p_0_in[25] -attr @rip O[1] -attr @name p_0_in[25] -pin imemory|data0_i__2 O[1] -pin imemory|data_i I0[25]
load net imemory|p_0_in[4] -attr @rip O[4] -attr @name p_0_in[4] -pin imemory|data0_i O[4] -pin imemory|data_i I0[4]
load net imemory|extended_addr[30] -attr @rip Q[30] -attr @name extended_addr[30] -pin imemory|data0_i__2 A[30] -pin imemory|data1_i I0[30] -pin imemory|data1_i__0 I0[30] -pin imemory|data1_i__1 I0[30] -pin imemory|extended_addr_reg Q[30]
load net imemory|extended_addr[29] -attr @rip Q[29] -attr @name extended_addr[29] -pin imemory|data0_i__2 A[29] -pin imemory|data1_i I0[29] -pin imemory|data1_i__0 I0[29] -pin imemory|data1_i__1 I0[29] -pin imemory|extended_addr_reg Q[29]
load net imemory|extended_addr[16] -attr @rip Q[16] -attr @name extended_addr[16] -pin imemory|data0_i__2 A[16] -pin imemory|data1_i I0[16] -pin imemory|data1_i__0 I0[16] -pin imemory|data1_i__1 I0[16] -pin imemory|extended_addr_reg Q[16]
load net imemory|extended_addr[2] -attr @rip Q[2] -attr @name extended_addr[2] -pin imemory|data0_i__2 A[2] -pin imemory|data1_i I0[2] -pin imemory|data1_i__0 I0[2] -pin imemory|data1_i__1 I0[2] -pin imemory|extended_addr_reg Q[2]
load net imemory|p_0_in[28] -attr @rip O[4] -attr @name p_0_in[28] -pin imemory|data0_i__2 O[4] -pin imemory|data_i I0[28]
load net imemory|addr[6] -attr @rip addr[6] -attr @name addr[6] -hierPin imemory addr[6] -pin imemory|extended_addr_reg D[8]
load net imemory|data1[0] -attr @rip O[0] -attr @name data1[0] -pin imemory|data0_i__1 A[0] -pin imemory|data1_i__1 O[0]
load net imemory|data[16] -attr @rip O[16] -attr @name data[16] -hierPin imemory data[16] -pin imemory|data_i O[16]
load net imemory|data[22] -attr @rip O[22] -attr @name data[22] -hierPin imemory data[22] -pin imemory|data_i O[22]
load net imemory|data[27] -attr @rip O[27] -attr @name data[27] -hierPin imemory data[27] -pin imemory|data_i O[27]
load net imemory|p_0_in[31] -attr @rip O[7] -attr @name p_0_in[31] -pin imemory|data0_i__2 O[7] -pin imemory|data_i I0[31]
load net imemory|data[13] -attr @rip O[13] -attr @name data[13] -hierPin imemory data[13] -pin imemory|data_i O[13]
load net imemory|data1_i__0_n_10 -attr @rip O[21] -attr @name data1_i__0_n_10 -pin imemory|data0_i__0 A[21] -pin imemory|data1_i__0 O[21]
load net imemory|data1_i__0_n_11 -attr @rip O[20] -attr @name data1_i__0_n_11 -pin imemory|data0_i__0 A[20] -pin imemory|data1_i__0 O[20]
load net imemory|data[0] -attr @rip O[0] -attr @name data[0] -hierPin imemory data[0] -pin imemory|data_i O[0]
load net imemory|data1_i__0_n_12 -attr @rip O[19] -attr @name data1_i__0_n_12 -pin imemory|data0_i__0 A[19] -pin imemory|data1_i__0 O[19]
load net imemory|data1_i__0_n_13 -attr @rip O[18] -attr @name data1_i__0_n_13 -pin imemory|data0_i__0 A[18] -pin imemory|data1_i__0 O[18]
load net imemory|p_0_in[24] -attr @rip O[0] -attr @name p_0_in[24] -pin imemory|data0_i__2 O[0] -pin imemory|data_i I0[24]
load net imemory|data1[25] -attr @rip O[25] -attr @name data1[25] -pin imemory|data0_i__1 A[25] -pin imemory|data1_i__1 O[25]
load net imemory|data1_i__0_n_14 -attr @rip O[17] -attr @name data1_i__0_n_14 -pin imemory|data0_i__0 A[17] -pin imemory|data1_i__0 O[17]
load net imemory|data1[12] -attr @rip O[12] -attr @name data1[12] -pin imemory|data0_i__1 A[12] -pin imemory|data1_i__1 O[12]
load net imemory|data1_i__0_n_15 -attr @rip O[16] -attr @name data1_i__0_n_15 -pin imemory|data0_i__0 A[16] -pin imemory|data1_i__0 O[16]
load net imemory|p_0_in[16] -attr @rip O[0] -attr @name p_0_in[16] -pin imemory|data0_i__1 O[0] -pin imemory|data_i I0[16]
load net imemory|addr[29] -attr @rip addr[29] -attr @name addr[29] -hierPin imemory addr[29] -pin imemory|extended_addr_reg D[31]
load net imemory|data1_i__0_n_16 -attr @rip O[15] -attr @name data1_i__0_n_16 -pin imemory|data0_i__0 A[15] -pin imemory|data1_i__0 O[15]
load net imemory|p_0_in[5] -attr @rip O[5] -attr @name p_0_in[5] -pin imemory|data0_i O[5] -pin imemory|data_i I0[5]
load net imemory|data1_i__0_n_17 -attr @rip O[14] -attr @name data1_i__0_n_17 -pin imemory|data0_i__0 A[14] -pin imemory|data1_i__0 O[14]
load net imemory|data1_i__0_n_18 -attr @rip O[13] -attr @name data1_i__0_n_18 -pin imemory|data0_i__0 A[13] -pin imemory|data1_i__0 O[13]
load net imemory|data1_i__0_n_19 -attr @rip O[12] -attr @name data1_i__0_n_19 -pin imemory|data0_i__0 A[12] -pin imemory|data1_i__0 O[12]
load net imemory|addr[15] -attr @rip addr[15] -attr @name addr[15] -hierPin imemory addr[15] -pin imemory|extended_addr_reg D[17]
load net imemory|extended_addr[28] -attr @rip Q[28] -attr @name extended_addr[28] -pin imemory|data0_i__2 A[28] -pin imemory|data1_i I0[28] -pin imemory|data1_i__0 I0[28] -pin imemory|data1_i__1 I0[28] -pin imemory|extended_addr_reg Q[28]
load net imemory|data[21] -attr @rip O[21] -attr @name data[21] -hierPin imemory data[21] -pin imemory|data_i O[21]
load net imemory|extended_addr[3] -attr @rip Q[3] -attr @name extended_addr[3] -pin imemory|data0_i__2 A[3] -pin imemory|data1_i I0[3] -pin imemory|data1_i__0 I0[3] -pin imemory|data1_i__1 I0[3] -pin imemory|extended_addr_reg Q[3]
load net imemory|addr[7] -attr @rip addr[7] -attr @name addr[7] -hierPin imemory addr[7] -pin imemory|extended_addr_reg D[9]
load net imemory|data1[1] -attr @rip O[1] -attr @name data1[1] -pin imemory|data0_i__1 A[1] -pin imemory|data1_i__1 O[1]
load net imemory|data[17] -attr @rip O[17] -attr @name data[17] -hierPin imemory data[17] -pin imemory|data_i O[17]
load netBundle @imemory|addr 30 imemory|addr[29] imemory|addr[28] imemory|addr[27] imemory|addr[26] imemory|addr[25] imemory|addr[24] imemory|addr[23] imemory|addr[22] imemory|addr[21] imemory|addr[20] imemory|addr[19] imemory|addr[18] imemory|addr[17] imemory|addr[16] imemory|addr[15] imemory|addr[14] imemory|addr[13] imemory|addr[12] imemory|addr[11] imemory|addr[10] imemory|addr[9] imemory|addr[8] imemory|addr[7] imemory|addr[6] imemory|addr[5] imemory|addr[4] imemory|addr[3] imemory|addr[2] imemory|addr[1] imemory|addr[0] -autobundled
netbloc @imemory|addr 1 0 1 80
load netBundle @imemory|data1_i_n_0 32 imemory|data1_i_n_0 imemory|data1_i_n_1 imemory|data1_i_n_2 imemory|data1_i_n_3 imemory|data1_i_n_4 imemory|data1_i_n_5 imemory|data1_i_n_6 imemory|data1_i_n_7 imemory|data1_i_n_8 imemory|data1_i_n_9 imemory|data1_i_n_10 imemory|data1_i_n_11 imemory|data1_i_n_12 imemory|data1_i_n_13 imemory|data1_i_n_14 imemory|data1_i_n_15 imemory|data1_i_n_16 imemory|data1_i_n_17 imemory|data1_i_n_18 imemory|data1_i_n_19 imemory|data1_i_n_20 imemory|data1_i_n_21 imemory|data1_i_n_22 imemory|data1_i_n_23 imemory|data1_i_n_24 imemory|data1_i_n_25 imemory|data1_i_n_26 imemory|data1_i_n_27 imemory|data1_i_n_28 imemory|data1_i_n_29 imemory|data1_i_n_30 imemory|data1_i_n_31 -autobundled
netbloc @imemory|data1_i_n_0 1 2 1 NJ
load netBundle @imemory|p_0_in_5 8 imemory|p_0_in[15] imemory|p_0_in[14] imemory|p_0_in[13] imemory|p_0_in[12] imemory|p_0_in[11] imemory|p_0_in[10] imemory|p_0_in[9] imemory|p_0_in[8] -autobundled
netbloc @imemory|p_0_in_5 1 3 1 740
load netBundle @imemory|extended_addr 32 imemory|extended_addr[31] imemory|extended_addr[30] imemory|extended_addr[29] imemory|extended_addr[28] imemory|extended_addr[27] imemory|extended_addr[26] imemory|extended_addr[25] imemory|extended_addr[24] imemory|extended_addr[23] imemory|extended_addr[22] imemory|extended_addr[21] imemory|extended_addr[20] imemory|extended_addr[19] imemory|extended_addr[18] imemory|extended_addr[17] imemory|extended_addr[16] imemory|extended_addr[15] imemory|extended_addr[14] imemory|extended_addr[13] imemory|extended_addr[12] imemory|extended_addr[11] imemory|extended_addr[10] imemory|extended_addr[9] imemory|extended_addr[8] imemory|extended_addr[7] imemory|extended_addr[6] imemory|extended_addr[5] imemory|extended_addr[4] imemory|extended_addr[3] imemory|extended_addr[2] imemory|extended_addr[1] imemory|extended_addr[0] -autobundled
netbloc @imemory|extended_addr 1 1 2 310 388 NJ
load netBundle @imemory|data 32 imemory|data[31] imemory|data[30] imemory|data[29] imemory|data[28] imemory|data[27] imemory|data[26] imemory|data[25] imemory|data[24] imemory|data[23] imemory|data[22] imemory|data[21] imemory|data[20] imemory|data[19] imemory|data[18] imemory|data[17] imemory|data[16] imemory|data[15] imemory|data[14] imemory|data[13] imemory|data[12] imemory|data[11] imemory|data[10] imemory|data[9] imemory|data[8] imemory|data[7] imemory|data[6] imemory|data[5] imemory|data[4] imemory|data[3] imemory|data[2] imemory|data[1] imemory|data[0] -autobundled
netbloc @imemory|data 1 4 1 N
load netBundle @imemory|data1 32 imemory|data1[31] imemory|data1[30] imemory|data1[29] imemory|data1[28] imemory|data1[27] imemory|data1[26] imemory|data1[25] imemory|data1[24] imemory|data1[23] imemory|data1[22] imemory|data1[21] imemory|data1[20] imemory|data1[19] imemory|data1[18] imemory|data1[17] imemory|data1[16] imemory|data1[15] imemory|data1[14] imemory|data1[13] imemory|data1[12] imemory|data1[11] imemory|data1[10] imemory|data1[9] imemory|data1[8] imemory|data1[7] imemory|data1[6] imemory|data1[5] imemory|data1[4] imemory|data1[3] imemory|data1[2] imemory|data1[1] imemory|data1[0] -autobundled
netbloc @imemory|data1 1 2 1 N
load netBundle @imemory|data1_i__0_n_0 32 imemory|data1_i__0_n_0 imemory|data1_i__0_n_1 imemory|data1_i__0_n_2 imemory|data1_i__0_n_3 imemory|data1_i__0_n_4 imemory|data1_i__0_n_5 imemory|data1_i__0_n_6 imemory|data1_i__0_n_7 imemory|data1_i__0_n_8 imemory|data1_i__0_n_9 imemory|data1_i__0_n_10 imemory|data1_i__0_n_11 imemory|data1_i__0_n_12 imemory|data1_i__0_n_13 imemory|data1_i__0_n_14 imemory|data1_i__0_n_15 imemory|data1_i__0_n_16 imemory|data1_i__0_n_17 imemory|data1_i__0_n_18 imemory|data1_i__0_n_19 imemory|data1_i__0_n_20 imemory|data1_i__0_n_21 imemory|data1_i__0_n_22 imemory|data1_i__0_n_23 imemory|data1_i__0_n_24 imemory|data1_i__0_n_25 imemory|data1_i__0_n_26 imemory|data1_i__0_n_27 imemory|data1_i__0_n_28 imemory|data1_i__0_n_29 imemory|data1_i__0_n_30 imemory|data1_i__0_n_31 -autobundled
netbloc @imemory|data1_i__0_n_0 1 2 1 N
load netBundle @imemory|p_0_in_1 8 imemory|p_0_in[31] imemory|p_0_in[30] imemory|p_0_in[29] imemory|p_0_in[28] imemory|p_0_in[27] imemory|p_0_in[26] imemory|p_0_in[25] imemory|p_0_in[24] -autobundled
netbloc @imemory|p_0_in_1 1 3 1 780
load netBundle @imemory|p_0_in 8 imemory|p_0_in[23] imemory|p_0_in[22] imemory|p_0_in[21] imemory|p_0_in[20] imemory|p_0_in[19] imemory|p_0_in[18] imemory|p_0_in[17] imemory|p_0_in[16] -autobundled
netbloc @imemory|p_0_in 1 3 1 760
load netBundle @imemory|p_0_in_3 8 imemory|p_0_in[7] imemory|p_0_in[6] imemory|p_0_in[5] imemory|p_0_in[4] imemory|p_0_in[3] imemory|p_0_in[2] imemory|p_0_in[1] imemory|p_0_in[0] -autobundled
netbloc @imemory|p_0_in_3 1 3 1 800
levelinfo -pg 1 -30 50 1140 -top -10 -bot 470
levelinfo -hier imemory * 160 470 600 930 *
show
zoom 0.768253
scrollpos -263 -275
#
# initialize ictrl to current module InstructionFetch work:InstructionFetch:NOFILE
ictrl init topinfo |

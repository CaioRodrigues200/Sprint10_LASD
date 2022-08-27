`default_nettype none //Comando para desabilitar declaração automática de wires
module Mod_Teste (
//Clocks
input CLOCK_27, CLOCK_50,
//Chaves e Botoes
input [3:0] KEY,
input [17:0] SW,
//Displays de 7 seg e LEDs
output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
output [8:0] LEDG,
output [17:0] LEDR,
//Serial
output UART_TXD,
input UART_RXD,
inout [7:0] LCD_DATA,
output LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS,
//GPIO
inout [35:0] GPIO_0, GPIO_1
);
assign GPIO_1 = 36'hzzzzzzzzz;
assign GPIO_0 = 36'hzzzzzzzzz;
assign LCD_ON = 1'b1;
assign LCD_BLON = 1'b1;
wire [7:0] w_d0x0, w_d0x1, w_d0x2, w_d0x3, w_d0x4, w_d0x5,
w_d1x0, w_d1x1, w_d1x2, w_d1x3, w_d1x4, w_d1x5;
LCD_TEST MyLCD (
.iCLK ( CLOCK_50 ),
.iRST_N ( KEY[0] ),
.d0x0(w_d0x0),.d0x1(w_d0x1),.d0x2(w_d0x2),.d0x3(w_d0x3),.d0x4(w_d0x4),.d0x5(w_d0x5),
.d1x0(w_d1x0),.d1x1(w_d1x1),.d1x2(w_d1x2),.d1x3(w_d1x3),.d1x4(w_d1x4),.d1x5(w_d1x5),
.LCD_DATA( LCD_DATA ),
.LCD_RW ( LCD_RW ),
.LCD_EN ( LCD_EN ),
.LCD_RS ( LCD_RS )
);
//---------- modifique a partir daqui --------

//---------- Sprint 2 ----------

// assign HEX0[0:6] = SW[6:0];
//DecoderHexa7 decoder1(.num(SW[11:8]),.seg7(HEX3[0:6]));
//
//parameter divider1 = 26'd50000000;
//parameter divider2 = 26'd8333333;
//wire [1:0] CLOCK1;
//wire [3:0] hexa;
//
//frequencyDivider fd1 (.clock50M(CLOCK_50), .divider(divider1), .clock1(CLOCK1[0]));
//countM10 cM10 (.clock(CLOCK1[0]), .reset(SW[0]), .number(hexa));
//DecoderHexa7 decoder2 (.num(hexa), .seg7(HEX4[0:6]));
//
//frequencyDivider fd2 (.clock50M(CLOCK_50), .divider(divider2), .clock1(CLOCK1[1]));
//Cycle cyc (.clock(CLOCK1[1]), .seg7(HEX6[0:6]));

//---------- Sprint 3 ----------

//assign LEDG[8] = ~KEY[1];
//
//RegisterFile(.wd3(SW[7:0]), .wa3(SW[16:14]), .we3(SW[17]), .CLK(KEY[1]), .ra1(SW[13:11]), 
//.ra2(SW[10:8]), .rd1(w_d0x0), .rd2(w_d0x1) );
//DecoderHexa7 decoder3 (.num(SW[3:0]), .seg7(HEX0[0:6]));
//DecoderHexa7 decoder4 (.num(SW[7:4]), .seg7(HEX1[0:6]));

//---------- Sprint 4 ----------

//wire [7:0] w_rd2, w_SrcB, w_rd1SrcA, w_ULAResultWd3;
//
//assign LEDG[8] = ~KEY[1];
//
//RegisterFile(.wd3(SW[7:0]), .wa3(SW[16:14]), .we3(1'b1), .CLK(KEY[1]), .ra1(SW[13:11]), 
//.ra2(3'b010), .rd1(w_rd1SrcA), .rd2(w_rd2) );
//DecoderHexa7 decoder3 (.num(SW[3:0]), .seg7(HEX0[0:6]));
//DecoderHexa7 decoder4 (.num(SW[7:4]), .seg7(HEX1[0:6]));
//
//assign w_SrcB = SW[17] ? 8'h07 : w_rd2;
//
//ULA(.SrcA(w_rd1SrcA), .SrcB(w_SrcB), .ULActrl(SW[10:8]), .Z(LEDG[0]), .ULArslt(w_ULAResultWd3));
//assign w_d0x0[7:0] = w_rd1SrcA;
//assign w_d1x0[7:0] = w_rd2;
//assign w_d1x1[7:0] = w_SrcB;
//assign w_d0x4[7:0] = w_ULAResultWd3;
//
//endmodule

//---------- Sprint 5 ----------

//wire w_ULASrc, w_RegWrite, w_RegDst;
//wire [2:0] w_ULAControl, w_wa3;
//wire [7:0] w_PCp1, w_PC, w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3;
//wire [31:0] w_Inst;
//wire [63:0] w_LCDexit;
//
//assign LEDG[8] = ~KEY[1];
//assign w_PCp1 = w_PC + 1'b1;
//assign w_d0x4 = w_PC;  
//	
//assign w_wa3 = w_RegDst ? w_Inst[15:11] : w_Inst[20:16];
//assign w_SrcB = w_ULASrc ? w_Inst[7:0] : w_rd2;
//
//register PC (.d_in(w_PCp1), .d_out(w_PC), .enable(1), .clk(KEY[1]));
//
//instrMem instruct (.A(w_PC),.RD(w_Inst));
//
//ControlUnit ctrlUnit (.OP(w_Inst[31:26]),.Funct(w_Inst[5:0]),
//								 .RegWrite(w_RegWrite),.RegDst(w_RegDst),.ULASrc(w_ULASrc),.ULAControl(w_ULAControl),
//								 .Branch(LEDR[3]),.MemWrite(LEDR[2]),.MemtoReg(LEDR[1]),.Jump(LEDR[0]));
//
//assign LEDR[6:4] = w_ULAControl;
//assign LEDR[7] = w_ULASrc;
//assign LEDR[8] = w_RegDst;
//assign LEDR[9] = w_RegWrite;
//								
//RegisterFile regFile (.wd3(w_ULAResultWd3), .wa3(w_wa3), .we3(w_RegWrite), .CLK(KEY[1]), .ra1(w_Inst[25:21]), .ra2(w_Inst[20:16]),
//								 .rd1(w_rd1SrcA), .rd2(w_rd2), .LCD_exit(w_LCDexit) );
//	  
//assign w_d0x0 = w_LCDexit[7:0];
//assign w_d0x1 = w_LCDexit[15:8];
//assign w_d0x2 = w_LCDexit[23:16];
//assign w_d0x3 = w_LCDexit[31:24];
//assign w_d1x0 = w_LCDexit[39:32];
//assign w_d1x1 = w_LCDexit[47:40];
//assign w_d1x2 = w_LCDexit[55:48];
//assign w_d1x3 = w_LCDexit[63:56];
//
//ULA unitLogic (.SrcA(w_rd1SrcA),.SrcB(w_SrcB),.ULActrl(w_ULAControl),.Z(LEDG[0]),.ULArslt(w_ULAResultWd3));
//	
//endmodule

//---------- Sprint 6 ----------

//wire w_ULASrc, w_RegWrite, w_RegDst, w_MemtoReg, w_MemWrite, w_clk;
//wire [2:0] w_ULAControl, w_wa3;
//wire [7:0] w_PCp1, w_PC, w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3, w_wd3, w_RData;
//wire [31:0] w_Inst;
//wire [63:0] w_LCDexit;
//
//assign w_clk = KEY[1];
//assign LEDG[8] = ~KEY[1];
//assign w_PCp1 = w_PC + 1'b1;
//assign w_d0x4 = w_PC;  
//	
//assign w_wa3 = w_RegDst ? w_Inst[15:11] : w_Inst[20:16];
//assign w_SrcB = w_ULASrc ? w_Inst[7:0] : w_rd2;
//assign w_wd3 = w_MemtoReg ? w_RData : w_ULAResultWd3;
//
//register PC (.d_in(w_PCp1), .d_out(w_PC), .enable(1), .clk(w_clk));
//
//RomInstMem InstMem (.address(w_PC),.clock(CLOCK_50),.q(w_Inst));
//
//ControlUnit ctrlUnit (.OP(w_Inst[31:26]),.Funct(w_Inst[5:0]),
//								 .RegWrite(w_RegWrite),.RegDst(w_RegDst),.ULASrc(w_ULASrc),.ULAControl(w_ULAControl),
//		
//						 .Branch(LEDR[3]),.MemWrite(w_MemWrite),.MemtoReg(w_MemtoReg),.Jump(LEDR[0]));
//
//assign LEDR[1] = w_MemtoReg;
//assign LEDR[2]	= w_MemWrite;					 
//assign LEDR[6:4] = w_ULAControl;
//assign LEDR[7] = w_ULASrc;
//assign LEDR[8] = w_RegDst;
//assign LEDR[9] = w_RegWrite;
//								
//RegisterFile regFile (.wd3(w_wd3), .wa3(w_wa3), .we3(w_RegWrite), .CLK(w_clk), .ra1(w_Inst[25:21]), .ra2(w_Inst[20:16]),
//								 .rd1(w_rd1SrcA), .rd2(w_rd2), .LCD_exit(w_LCDexit) );
//	  
//assign w_d0x0 = w_LCDexit[7:0];
//assign w_d0x1 = w_LCDexit[15:8];
//assign w_d0x2 = w_LCDexit[23:16];
//assign w_d0x3 = w_LCDexit[31:24];
//assign w_d1x0 = w_LCDexit[39:32];
//assign w_d1x1 = w_LCDexit[47:40];
//assign w_d1x2 = w_LCDexit[55:48];
//assign w_d1x3 = w_LCDexit[63:56];
//
//ULA unitLogic (.SrcA(w_rd1SrcA),.SrcB(w_SrcB),.ULActrl(w_ULAControl),.Z(LEDG[0]),.ULArslt(w_ULAResultWd3));
//
//RamDataMem DataMem (.address(w_ULAResultWd3),.clock(CLOCK_50),.data(w_rd2),.wren(w_MemWrite),.q(w_RData));
//
//endmodule

//---------- Sprint 7 ----------

//parameter divider1 = 26'd50000000;
//
//wire w_ULASrc, w_RegWrite, w_RegDst, w_MemtoReg, w_MemWrite, w_clk, w_Branch, w_Jump, w_Z, w_PCSrc;
//wire [2:0] w_ULAControl, w_wa3;
//wire [7:0] w_PCp1, w_PC, w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3, w_wd3, w_RData, W_PCBranch, w_nPC, w_m1;
//wire [31:0] w_Inst;
//wire [63:0] w_LCDexit;
//
//frequencyDivider fd1 (.clock50M(CLOCK_50), .divider(divider1), .clock1(w_clk));
//
////assign w_clk = KEY[1];
//assign LEDG[8] = ~KEY[1];
//assign w_PCp1 = w_PC + 1'b1;
//assign W_PCBranch = w_PCp1 + w_Inst[7:0];
//assign w_d0x4 = w_PC;  
//assign w_PCSrc = w_Z & w_Branch;
//	
//assign w_wa3 = w_RegDst ? w_Inst[15:11] : w_Inst[20:16];
//assign w_SrcB = w_ULASrc ? w_Inst[7:0] : w_rd2;
//assign w_wd3 = w_MemtoReg ? w_RData : w_ULAResultWd3;
//assign w_m1 = w_PCSrc ? W_PCBranch : w_PCp1;
//assign w_nPC = w_Jump ? w_Inst[7:0] : w_m1;
//
//register PC (.d_in(w_nPC), .d_out(w_PC), .enable(1), .clk(w_clk));
//
//RomInstMem InstMem (.address(w_PC),.clock(CLOCK_50),.q(w_Inst));
//
//ControlUnit ctrlUnit (.OP(w_Inst[31:26]),.Funct(w_Inst[5:0]),
//								 .RegWrite(w_RegWrite),.RegDst(w_RegDst),.ULASrc(w_ULASrc),.ULAControl(w_ULAControl),
//		
//						 .Branch(w_Branch),.MemWrite(w_MemWrite),.MemtoReg(w_MemtoReg),.Jump(w_Jump));
//
//assign LEDR[1] = w_MemtoReg;
//assign LEDR[2]	= w_MemWrite;					 
//assign LEDR[6:4] = w_ULAControl;
//assign LEDR[7] = w_ULASrc;
//assign LEDR[8] = w_RegDst;
//assign LEDR[9] = w_RegWrite;
//								
//RegisterFile regFile (.wd3(w_wd3), .wa3(w_wa3), .we3(w_RegWrite), .CLK(w_clk), .ra1(w_Inst[25:21]), .ra2(w_Inst[20:16]),
//								 .rd1(w_rd1SrcA), .rd2(w_rd2), .LCD_exit(w_LCDexit) );
//	  
//assign w_d0x0 = w_LCDexit[7:0];
//assign w_d0x1 = w_LCDexit[15:8];
//assign w_d0x2 = w_LCDexit[23:16];
//assign w_d0x3 = w_LCDexit[31:24];
//assign w_d1x0 = w_LCDexit[39:32];
//assign w_d1x1 = w_LCDexit[47:40];
//assign w_d1x2 = w_LCDexit[55:48];
//assign w_d1x3 = w_LCDexit[63:56];
//
//ULA unitLogic (.SrcA(w_rd1SrcA),.SrcB(w_SrcB),.ULActrl(w_ULAControl),.Z(w_Z),.ULArslt(w_ULAResultWd3));
//
//RamDataMem DataMem (.address(w_ULAResultWd3),.clock(CLOCK_50),.data(w_rd2),.wren(w_MemWrite),.q(w_RData));
//
//endmodule

//---------- Sprint 8 e 9 ----------

//parameter divider1 = 26'd50000;
//
//wire w_ULASrc, w_RegWrite, w_RegDst, w_MemtoReg, w_MemWrite, w_clk, w_Branch, w_Jump, w_Z, w_PCSrc, w_We;
//wire [2:0] w_ULAControl, w_wa3;
//wire [7:0] w_PCp1, w_PC, w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3, w_wd3, w_RData, W_PCBranch, w_nPC, w_m1, w_DataOut, w_DataIn, w_RegData;
//wire [31:0] w_Inst;
//wire [63:0] w_LCDexit;
//
//frequencyDivider fd1 (.clock50M(CLOCK_50), .divider(divider1), .clock1(w_clk));
//
////assign w_clk = KEY[1];
//assign LEDG[8] = ~KEY[1];
//assign w_PCp1 = w_PC + 1'b1;
//assign W_PCBranch = w_PCp1 + w_Inst[7:0];
//assign w_d1x0 = w_PC;  
//assign w_PCSrc = w_Z & w_Branch;
//	
//assign w_wa3 = w_RegDst ? w_Inst[15:11] : w_Inst[20:16];
//assign w_SrcB = w_ULASrc ? w_Inst[7:0] : w_rd2;
//assign w_m1 = w_PCSrc ? W_PCBranch : w_PCp1;
//assign w_nPC = w_Jump ? w_Inst[7:0] : w_m1;
//
//register PC (.d_in(w_nPC), .d_out(w_PC), .enable(1), .clk(w_clk));
//
//RomInstMem InstMem (.address(w_PC),.clock(CLOCK_50),.q(w_Inst));
//
//ControlUnit ctrlUnit (.OP(w_Inst[31:26]),.Funct(w_Inst[5:0]),
//								 .RegWrite(w_RegWrite),.RegDst(w_RegDst),.ULASrc(w_ULASrc),.ULAControl(w_ULAControl),
//		
//						 .Branch(w_Branch),.MemWrite(w_MemWrite),.MemtoReg(w_MemtoReg),.Jump(w_Jump));
//
//assign LEDR[1] = w_MemtoReg;
//assign LEDR[2]	= w_MemWrite;					 
//assign LEDR[6:4] = w_ULAControl;
//assign LEDR[7] = w_ULASrc;
//assign LEDR[8] = w_RegDst;
//assign LEDR[9] = w_RegWrite;
//								
//RegisterFile regFile (.wd3(w_wd3), .wa3(w_wa3), .we3(w_RegWrite), .CLK(w_clk), .ra1(w_Inst[25:21]), .ra2(w_Inst[20:16]),
//								 .rd1(w_rd1SrcA), .rd2(w_rd2), .LCD_exit(w_LCDexit) );
//	  
//assign w_d0x0 = w_LCDexit[15:8];
//assign w_d0x1 = w_LCDexit[23:16];
//assign w_d0x2 = w_LCDexit[31:24];
//assign w_d0x3 = w_LCDexit[39:32];
//assign w_d0x4 = w_LCDexit[47:40];
//
//ULA unitLogic (.SrcA(w_rd1SrcA),.SrcB(w_SrcB),.ULActrl(w_ULAControl),.Z(w_Z),.ULArslt(w_ULAResultWd3));
//
//Parallel_OUT POut (.we(w_MemWrite), .wren(w_We), .clk(w_clk), .RegData(w_rd2), .Address(w_ULAResultWd3), .DataOut(w_DataOut));
//
//Parallel_IN PIn (.MemData(w_RData), .Address(w_ULAResultWd3), .DataIn(w_DataIn), .RegData(w_RegData));
//
//RamDataMem DataMem (.address(w_ULAResultWd3),.clock(CLOCK_50),.data(w_rd2),.wren(w_We),.q(w_RData));
//
//assign w_wd3 = w_MemtoReg ? w_RegData : w_ULAResultWd3;
//
//assign w_d1x4 = w_DataOut;
//assign LEDR[0] = w_DataOut[0];
//assign w_DataIn = SW[7:0];
//assign w_d1x1 = SW[7:0];
//
//endmodule


//---------- Sprint 10 ----------

parameter divider1 = 26'd25000000;
parameter divider2 = 26'd4;

wire w_ULASrc, w_RegWrite, w_RegDst, w_MemtoReg, w_MemWrite, w_clk, w2_clk, w_Branch, w_Jump, w_Z, w_PCSrc, w_We, w_Link,
	  w_MemtoPC, w_rstEt, w_Ethernet, w_flag;
wire [2:0] w_ULAControl;
wire [3:0] w_wa3, w_mwa3;
wire [7:0] w_PCp1, w_PC, w_rd1SrcA, w_rd2, w_SrcB, w_ULAResultWd3, w_wd3, w_RData, W_PCBranch, w_nPC, w_m1, w_muxJ,
		   w_DataOut, w_DataIn, w_RegData, w_mwd3, w_dataEt, w_storeEt, w_sizeEt;
wire [31:0] w_Inst;
wire [71:0] w_LCDexit;

frequencyDivider fd1 (.clock50M(CLOCK_50), .divider(divider1), .clock1(w_clk));
frequencyDivider fd2 (.clock50M(CLOCK_50), .divider(divider2), .clock1(w2_clk));

//assign w_clk = KEY[1];
assign LEDG[8]    = ~KEY[0];
assign w_PCp1     = w_PC + 1'b1;
assign W_PCBranch = w_PCp1 + w_Inst[7:0];
assign w_d1x0     = w_PC;  
assign w_PCSrc    = w_Z & w_Branch;
assign w_rstEt    = ~KEY[0];
	
// MUXs
assign w_wa3  = w_RegDst ? w_Inst[15:11] : w_Inst[20:16];
assign w_SrcB = w_ULASrc ? w_Inst[7:0] : w_rd2;
assign w_m1   = w_PCSrc ? W_PCBranch : w_PCp1;
assign w_nPC  = w_Jump ? w_muxJ : w_m1;
assign w_wd3  = w_MemtoReg ? w_RegData : w_ULAResultWd3;
assign w_muxJ = w_MemtoPC ? w_wd3 : w_Inst[7:0];         // JR 
assign w_mwa3 = w_Link ? 4'h8 : w_wa3;                   // JAL
assign w_mwd3 = w_Link ? w_PCp1 : w_wd3;                 // JAL

register PC (.d_in(w_nPC), .d_out(w_PC), .enable(1), .clk(w_clk));

RomInstMem InstMem (.address(w_PC),.clock(CLOCK_50),.q(w_Inst));

ControlUnit ctrlUnit (.OP(w_Inst[31:26]),.Funct(w_Inst[5:0]),
							 .RegWrite(w_RegWrite),.RegDst(w_RegDst),.ULASrc(w_ULASrc),.ULAControl(w_ULAControl),
							 .Branch(w_Branch),.MemWrite(w_MemWrite),.MemtoReg(w_MemtoReg),.Jump(w_Jump),.Link(w_Link),.MemtoPC(w_MemtoPC));

assign LEDR[1]   = w_MemtoReg;
assign LEDR[2]	 = w_MemWrite;					 
assign LEDR[6:4] = w_ULAControl;
assign LEDR[7]   = w_ULASrc;
assign LEDR[8]   = w_Jump;
assign LEDR[9]   = w_RegWrite;
								
RegisterFile regFile (.wd3(w_mwd3), .wa3(w_mwa3), .we3(w_RegWrite), .CLK(w_clk), .ra1(w_Inst[25:21]), .ra2(w_Inst[20:16]),
					  .rd1(w_rd1SrcA), .rd2(w_rd2), .LCD_exit(w_LCDexit) );

assign w_d0x0 = w_LCDexit[15:8];
assign w_d0x1 = w_LCDexit[23:16];
assign w_d0x2 = w_LCDexit[31:24];
assign w_d0x3 = w_LCDexit[39:32];
assign w_d0x4 = w_LCDexit[47:40];
assign w_d1x2 = w_LCDexit[55:48];
assign w_d1x3 = w_LCDexit[63:56];
assign w_d1x4 = w_LCDexit[71:64];

EthernetMod PacketRcv(.clk(w2_clk),.rst(w_rstEt),.mode(2'b01),.dataRcv(w_dataEt),.macAdress(48'h4A6F8A7FAA8F),.dataStore(w_storeEt),.dtSize(w_sizeEt), .flag(w_flag));

EthernetMod PacketGen(.clk(w2_clk),.rst(w_flag),.mode(2'b10),.macAdress(48'hFFFFFFFFFFFF),.dataSend(w_dataEt));


ULA unitLogic (.SrcA(w_rd1SrcA),.SrcB(w_SrcB),.ULActrl(w_ULAControl),.Z(w_Z),.ULArslt(w_ULAResultWd3));

Parallel_OUT POut (.we(w_MemWrite), .wren(w_We), .clk(w_clk), .RegData(w_rd2), .Address(w_A), .DataOut(w_DataOut));

Parallel_IN PIn (.MemData(w_RData), .Address(w_A), .DataIn(w_DataIn), .RegData(w_RegData));

wire[7:0] w_A, w_memdata;
assign w_A = w_Ethernet ? 8'hF0 : w_ULAResultWd3;
assign w_memdata = w_Ethernet ? w_storeEt : w_rd2;

RamDataMem DataMem (.address(w_A),.clock(CLOCK_50),.data(w_memdata),.wren(w_We),.q(w_RData));

// assign w_d1x4 = w_DataOut;
assign LEDR[0] = w_DataOut[0];
assign w_DataIn = SW[7:0];
//assign w_d1x1 = SW[7:0];

endmodule
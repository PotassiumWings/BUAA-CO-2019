`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:46:13 11/19/2019 
// Design Name: 
// Module Name:    mips 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`define lb 	6'b100000
`define lbu 6'b100100
`define lh	6'b100001
`define lhu 6'b100101
`define lw	6'b100011
`define sb	6'b101000
`define sh	6'b101001
`define sw	6'b101011
`define op 	31:26
`define func 5:0
`define eret 32'b010000_1000_0000_0000_0000_0000_011000
`define rd 15:11
module CPU(
    input clk,
    input reset,
	 input [31:0] prRD,
	 input [5:0] HWInt,
	 output [31:2] prAddr,
	 output prWE,
	 output [31:0]PC_M,
	 //output [3:0] prBE,
	 output [31:0] prWD
    );
	 
	 
	 //wire [7:2]HWInt=0;//
	 
	 
	 wire stall;					//stall
	 wire mulBusy,mulBusy1,mulBusy2;					//mul busy
	 
	 //IF
	 wire [31:0] instrM,instrW;
	 wire [31:0] PCF,NPCF,instrF,instrD,instrE;
	 wire [31:0] PCBranch,PCJ,PCJr;	//NPC candidates from D
	 wire j,jal,jalr,jr,b;				//NPC selectors  from controller
	 wire beq,bne,blez,bgtz,bltz,bgez;
	 //Beq:Beq
	 //B:Branch(beq+equal)
	 
	 wire FflagW,FflagM,FflagE;
	 wire [4:0] FaddrW,FaddrM,FaddrE;
	 wire [1:0] FdataselW,FdataselE;
	 wire [2:0] FdataselM;
	 
	 wire [31:0] FdataE,FdataM;
	 
	 //CP0
	 
	 wire [31:0]CP0DataM,CP0DataW;
	 wire CP0WED,CP0WEE,CP0WEM;
	 
	 wire [31:0]EPC;
	 wire req;//reset IFID,IDEX
	 
	 //ALUoverflow
	 wire aluExcInD,aluExcInE,aluExcOut;
	 
	 //RI IN D
	 wire RI;
	 
	 //excCode
	 wire [4:0]excCodeF,excCodeFD,excCodeD,excCodeDE;
	 wire [4:0]excCodeE,excCodeEM,excCodeM;
	 
	 assign excCodeF=(PCF>32'H4FFF||PCF<32'H3000||(|PCF[1:0]))?5'd4:5'd0;
	 assign excCodeD=(RI)?5'd10:excCodeFD;
	 assign excCodeE=(aluExcOut)?5'd12:excCodeDE;
	 assign excCodeM=	(instrM[`op]==`sw&&(|ALUOutM[1:0]))?5'd5://sw
							(instrM[`op]==`sh&&ALUOutM[0])?		5'd5://sh
							((instrM[`op]==`sh||instrM[`op]==`sb||instrM[`op]==`sw)&&
								(
									!(
										ALUOutM<=32'h2fff||
										(ALUOutM>=32'h7f00&&ALUOutM<=32'h7f0b)||
										(ALUOutM>=32'h7f10&&ALUOutM<=32'h7f1b)
									)||//out of range
									(	
										aluExcOut
									)||//overflow
									(	
										ALUOutM>=32'h7f08&&ALUOutM<=32'h7f0b||
										ALUOutM>=32'h7f18&&ALUOutM<=32'h7f1b
									)//save to count reg
								)
							)?												5'd5:
							((instrM[`op]==`sh||instrM[`op]==`sb)&&
								(
									ALUOutM>=32'h7000
								)//save to timer
							)?												5'd5:
							(instrM[`op]==`lw&&(|ALUOutM[1:0]))?							5'd4://lw
							((instrM[`op]==`lh||instrM[`op]==`lhu)&&ALUOutM[0])?		5'd4://lh,lhu
							((instrM[`op]==`lh||instrM[`op]==`lhu||instrM[`op]==`lb||instrM[`op]==`lbu||instrM[`op]==`lw)&&
								(
									!(
										ALUOutM<=32'h2fff||
										(ALUOutM>=32'h7f00&&ALUOutM<=32'h7f0b)||
										(ALUOutM>=32'h7f10&&ALUOutM<=32'h7f1b)
									)||//out of range
									(	
										aluExcOut
									)//overflow
								)
							)?																			5'd4:
							((instrM[`op]==`lh||instrM[`op]==`lhu||instrM[`op]==`lb||instrM[`op]==`lbu)&&
								(
									ALUOutM>=32'h7000
								)//load from timer
							)?																			5'd4:
																										excCodeEM;
																										
	 //bd
	 wire bdF,bdD,bdE,bdM;
	 assign bdF=j|jal|jalr|jr|beq|bne|blez|bgez|bltz|bgez;
	 
	 
	 PCregF pcreg(
		.NPC(NPCF),
		.clk(clk),
		.reset(reset),
		.WE(!stall),
		.PC(PCF)//OUT
	 );
	 
	 NPC npc(
		.PCBranch(PCBranch),
		.PCJ(PCJ),
		.PCJr(PCJr),
		.PC(PCF),
		.j(j),
		.jal(jal),
		.jr(jr),
		.jalr(jalr),
		.b(b),
		
		// ERET in M -> PC = CP0[EPC]
		.EPC(EPC),
		.req(req),
		.eret(instrM==`eret),
		
		.NPC(NPCF)//OUT
	 );
	 
	 IM im(
		.PC(PCF),
		
		// ERET -> INSTR = NOP
		.eretD(instrD==`eret),
		.eretE(instrE==`eret),
		
		.instr(instrF)//OUT
	 );
	 
	 //IFID
	 wire [31:0] PCD;
	 IFID ifid(
		.clk(clk),
		.reset(reset | req),
		.stall(stall), 				//#stall1
		.instrIn(instrF),
		.instrOut(instrD),//OUT
		.PCIn(PCF),
		.PCOut(PCD),//OUT
		
		.excCode(excCodeF),
		.excCodeOut(excCodeFD),
		.bd(bdF),
		.bdOut(bdD)
	 );
	 
	 //ID
	 wire [4:0] rsD,rtD,rdD,grfWriteAddrD;
	 assign rsD=instrD[25:21];
	 assign rtD=instrD[20:16];
	 assign rdD=instrD[15:11];
	 assign PCJ={PCD[31:28],instrD[25:0],2'b0};
	 assign PCBranch=PCD+4+extimmD;
	 //PCJr sel from forward
	 
	 wire [1:0] extOpD;
	 wire [3:0] aluOpD;
	 
	 wire [4:0] grfWriteAddrW;	//from WB
	 wire [31:0] grfWriteDataW;	//from WB
	 
	 wire aluAD,dmWED;
	 wire [1:0] aluBD,aluBE;
	 wire [2:0] memToRegD;
	 wire [2:0] dmWidD;
	 wire dmSignD;
	 
	 CTL ctl(
		.instr(instrD),		//INPUT
		.grfWriteAddr(grfWriteAddrD),
		.extOp(extOpD),
		.aluOp(aluOpD),
		.memToReg(memToRegD),//1:from ALU 0:DM 	2:from PC+8
		.aluB(aluBD),			//1:from EXT 0:rt		2:from sha	3:from rs[4:0]
		.aluA(aluAD),			//0:from Rs  1:rt
		.jal(jal),.jr(jr),.j(j),.jalr(jalr),
		.beq(beq),.bne(bne),.blez(blez),.bgtz(bgtz),.bltz(bltz),.bgez(bgez),
		.dmWE(dmWED),
		.dmWidth(dmWidD),
		.dmSign(dmSignD),
		
		.RI(RI),
		.CP0WE(CP0WED),
		.aluExcIn(aluExcInD)
	 );
	 
	 wire [31:0] readRsD,readRtD;
	 
	 wire [31:0] PCW;
	 
	 GRF grf(
	 .instr_W(instrW),.instr_M(instrM),
		.PC(PCW),
		.clk(clk),
		.reset(reset),
		.A1(rsD),
		.A2(rtD),
		.A3(grfWriteAddrW),
		.data(grfWriteDataW),
		.R1(readRsD),
		.R2(readRtD)
	 );
	 
	 wire CMPEqual,CMPGreater,CMPLess;
	 wire [31:0] grfRsD,grfRtD;
	 assign PCJr=grfRsD;
	 
	 assign grfRsD=rsD==0?								0:
						(rsD==FaddrE&&FflagE)?			FdataE:
						(rsD==FaddrM&&FflagM)?			FdataM:
						(rsD==grfWriteAddrW&&FflagW)?	grfWriteDataW:
																readRsD;
	 
	 assign grfRtD=rtD==0?								0:
						(rtD==FaddrE&&FflagE)?			FdataE:
						(rtD==FaddrM&&FflagM)?			FdataM:
						(rtD==grfWriteAddrW&&FflagW)?	grfWriteDataW:
																readRtD;
	 
	 //beq,bne,blez,bgtz,bltz,bgez
	 CMP cmp(
		.data1(grfRsD),
		.data2((blez|bgtz|bltz|bgez)?0:grfRtD),
		.equal(CMPEqual),
		.greater(CMPGreater),
		.less(CMPLess)
	 );
	 assign b=(CMPEqual&beq)|
				 (!CMPEqual&bne)|
				 (!CMPGreater&blez)|
				 (CMPGreater&bgtz)|
				 (CMPLess&bltz)|
				 (!CMPLess&bgez);
	 
	 wire [15:0] imm=instrD[15:0];
	 wire [31:0] extimmD;
	 EXT ext(
		.data(imm),
		.sel(extOpD),
		.out(extimmD)
	 );
	 
	 //IDEX
	 wire [31:0] grfRsE,grfRtE,extimmE;
	 wire [31:0] grfRsEBeforeF,grfRtEBeforeF;
	 wire [4:0] grfWriteAddrE;
	 wire [3:0] aluOpE;
	 wire dmWEE,dmSignE;
	 wire [2:0] dmWidE;
	 wire [31:0] PCE;
	 wire [2:0] memToRegE;
	 IDEX idex(
		.clk(clk),
		.flush(stall|reset),
		.req(req),//#stall->flush reset->flush
		.grfRs(grfRsD),//readrs
		.grfRsOut(grfRsEBeforeF),
		.grfRt(grfRtD),//readrt
		.grfRtOut(grfRtEBeforeF),
		//controller part
		.extimm(extimmD),
		.extimmOut(extimmE),
		.dmWE(dmWED),
		.dmWEOut(dmWEE),
		.dmSign(dmSignD),
		.dmSignOut(dmSignE),
		.dmWid(dmWidD),
		.dmWidOut(dmWidE),
		.aluB(aluBD),
		.aluBOut(aluBE),
		.aluA(aluAD),
		.aluAOut(aluAE),
		.memToReg(memToRegD),
		.memToRegOut(memToRegE),
		.aluOp(aluOpD),
		.aluOpOut(aluOpE),
		.grfWriteAddr(grfWriteAddrD),
		.grfWriteAddrOut(grfWriteAddrE),
		.PC(PCD),
		.PCOut(PCE),
		.instr(instrD),
		.instrOut(instrE),//OUT
		
		.excCode(excCodeD),
		.excCodeOut(excCodeDE),
		.bd(bdD),
		.bdOut(bdE),
		.aluExcIn(aluExcInD),
		.aluExcInOut(aluExcInE),
		.CP0WE(CP0WED),
		.CP0WEOut(CP0WEE)
	 );
	 
	 //EXE
	 wire [31:0] srcAE,srcBE;//to alu
	 wire [4:0] rsE=instrE[25:21];
	 wire [4:0] rtE=instrE[20:16];
	 
	 assign grfRsE=	(rsE==0)?							0:
							(rsE==FaddrM&&FflagM)?			FdataM:
							(rsE==grfWriteAddrW&&FflagW)?	grfWriteDataW:
																	grfRsEBeforeF;
	 
	 assign grfRtE=	(rtE==0)?							0:
							(rtE==FaddrM&&FflagM)?			FdataM:
							(rtE==grfWriteAddrW&&FflagW)?	grfWriteDataW:
																	grfRtEBeforeF;
	 
	 assign srcAE=		(aluAE==0)?	grfRsE:
											grfRtE;

	 assign srcBE=		(aluBE==0)?	grfRtE:
							(aluBE==1)?	extimmE:
							(aluBE==2)?	instrE[10:6]:
											grfRsE[4:0];
											
	 wire [31:0] ALUOutE;
	 
	 ALU alu(
		.A(srcAE),
		.B(srcBE),
		.excIn(aluExcInE),
		.sel(aluOpE),
		.out(ALUOutE),
		.excOut(aluExcOut)
	 );
	 
	 
	 wire [31:0] mulOutE,mulOutM,mulOutW;
	 HILO hilo(
		.req(req),//interrupt/exception -> stop to run
		
		.clk(clk),
		.reset(reset),
		.A(grfRsE),
		.B(grfRtE),
		.instr(instrE),
		.out(mulOutE),
		.busy(mulBusy1),
		.start(mulBusy2)
	 );
	 
	 assign mulBusy = mulBusy1 | mulBusy2;// start | busy
	 
	 //EXForward
	 assign FdataE=	(FdataselE==2'd1)?	extimmE:
														(PCE+8);
	 
	 
	 //EXME
	 wire [31:0] ALUOutM,dmWriteDataMBeforeF,dmWriteDataM,PCM;
	 
	 assign PC_M=PCM;
	 
	 wire [4:0] grfWriteAddrM;
	 wire dmWEM,dmSignM;
	 wire [2:0] dmWidM;
	 wire [2:0] memToRegM;
	 wire [31:0] extimmM;
	 EXME exme(
		.clk(clk),
		.reset(reset),
		.aluOut(ALUOutE),
		.aluOutOut(ALUOutM),
		.dmWriteData(grfRtE),
		.dmWriteDataOut(dmWriteDataMBeforeF),
		.grfWriteAddr(grfWriteAddrE),
		.grfWriteAddrOut(grfWriteAddrM),
		.dmWE(dmWEE),
		.dmWEOut(dmWEM),
		.dmWid(dmWidE),
		.dmWidOut(dmWidM),
		.dmSign(dmSignE),
		.dmSignOut(dmSignM),
		.memToReg(memToRegE),
		.memToRegOut(memToRegM),
		.PC(PCE),
		.PCOut(PCM),
		.instr(instrE),
		.instrOut(instrM),//OUT
		.extimm(extimmE),
		.extimmOut(extimmM),
		.mulOut(mulOutE),
		.mulOutOut(mulOutM),
		
		.excCode(excCodeE),
		.excCodeOut(excCodeEM),
		.bd(bdE),
		.bdOut(bdM),
		.CP0WE(CP0WEE),
		.CP0WEOut(CP0WEM)
	 );
	 
	 //ME
	 wire [31:0] readDMM;
	 wire [4:0] rtM=instrM[20:16];
	 
	 //dmWD = rt or forward rt
	 assign dmWriteDataM=	(rtM==0)?							0:
									(rtM==grfWriteAddrW&&FflagW)?	grfWriteDataW:
																			dmWriteDataMBeforeF;
	 assign prAddr=ALUOutM[31:2];
	 assign prWE=	dmWEM && !(|excCodeM) && 
						(ALUOutM>=32'h7f00);
	 assign prWD=dmWriteDataM;
	 
	 DM dm(
		.width(dmWidM),
		.sign(dmSignM),
		.address(ALUOutM),
		.data(dmWriteDataM),
		.WE(dmWEM && !(|excCodeM) && !prWE),//exception M -> not write
		.clk(clk),
		.reset(reset),
		.PC(PCM),
		.out(readDMM)
	 );
	 
	 //MEForward
	 assign FdataM=	FdataselM==0?	ALUOutM:	
							FdataselM==1?	PCM+8:
							FdataselM==2?	extimmM:
							FdataselM==3?	mulOutM:
												CP0DataM;
												
	 //CP0
	 CP0 cp0(
		.A1(instrM[`rd]),
		.A2(instrM[`rd]),
		.bdIn(bdM),
		.dataIn(dmWriteDataM),//¼´grfRtM
		.PC(PCM[31:2]),
		.excCode(excCodeM),
		.hwInt(HWInt),//CPU½Ó¿Ú
		.WE(CP0WEM),
		.exlClr(instrM==`eret),
		.clk(clk),
		.reset(reset),
		.req(req),
		.EPC(EPC),
		.dataOut(CP0DataM)
	 );
	 
	 
	 //MEWB
	 wire [31:0] ALUOutW,readDMW;
	 wire [2:0] memToRegW;
	 wire [31:0] extimmW;
	 MEWB mewb(
		.req(req),//interrupt/exception -> not saved
	 
		.clk(clk),
		.reset(reset),
		.PC(PCM),
		.PCOut(PCW),
		.dmData(({prAddr,2'b0}>=32'h7f00)?	prRD:
														readDMM),
		.dmDataOut(readDMW),
		.ALUOut(ALUOutM),
		.ALUOutOut(ALUOutW),
		.grfWriteAddr(grfWriteAddrM),
		.grfWriteAddrOut(grfWriteAddrW),
		.memToReg(memToRegM),
		.memToRegOut(memToRegW),
		.instr(instrM),
		.instrOut(instrW),
		.mulOut(mulOutM),
		.mulOutOut(mulOutW),
		
		.CP0Data(CP0DataM),
		.CP0DataOut(CP0DataW)
	 );
	 
	 //WB
	 
	 assign grfWriteDataW=	(memToRegW==0)?	readDMW:
									(memToRegW==1)?	ALUOutW:
									(memToRegW==2)?	PCW+8:
									(memToRegW==3)?	mulOutW:
															CP0DataW;
	 //stall and forward
	 STALL pause(
		.mulBusy(mulBusy),
		.instrD(instrD),
		.instrE(instrE),
		.instrM(instrM),
		.instrW(instrW),
		.stall(stall)
	 );
	 
	 
	 FORWARD forward(
		.instrD(instrD),
		.instrE(instrE),
		.instrM(instrM),
		.instrW(instrW),
		.clk(clk),
		.flagW(FflagW),
		.flagM(FflagM),
		.flagE(FflagE),
		//.addrW(FaddrW),
		.addrM(FaddrM),
		.addrE(FaddrE),
		//.dataW(FdataselW),
		.dataM(FdataselM),
		.dataE(FdataselE) 
	 );

endmodule

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
module mips(
    input clk,
    input reset
    );
	 
	 wire freeze;
	 wire stall;					//stall
	 wire mulBusy,mulBusy1,mulBusy2;					//mul busy
	 
	 //IF
	 wire [31:0] instrM,instrW;
	 wire [31:0] PCF,NPCF,instrF;		//wires in F
	 wire [31:0] PCBranch,PCJ,PCJr;	//NPC candidates from D
	 wire j,jal,jalr,jr,b;				//NPC selectors  from controller
	 wire beq,bne,blez,bgtz,bltz,bgez;
	 //Beq:Beq
	 //B:Branch(beq+equal)
	 
	 wire FflagW,FflagM,FflagE;
	 wire [4:0] FaddrW,FaddrM,FaddrE;
	 wire [1:0] FdataselW,FdataselM,FdataselE;
	 
	 wire [31:0] FdataE,FdataM;
	 
	 PCregF pcreg(
		.NPC(NPCF),
		.clk(clk),
		.reset(reset),
		.WE(!stall),
		.PC(PCF),//OUT
		.freeze(freeze)
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
		.NPC(NPCF)//OUT
	 );
	 
	 IM im(
		.PC(PCF),
		.instr(instrF)//OUT
	 );
	 
	 //IFID
	 wire [31:0] instrD,PCD;
	 IFID ifid(
		.clk(clk),
		.freeze(freeze),
		.reset(reset),
		.stall(stall), 				//#stall1
		.instrIn(instrF),
		.instrOut(instrD),//OUT
		.PCIn(PCF),
		.PCOut(PCD)//OUT
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
	 wire [1:0] memToRegD;
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
		.dmSign(dmSignD)
	 );
	 
	 wire [31:0] readRsD,readRtD;
	 
	 wire [31:0] PCW;
	 
	 GRF grf(
	 .instr_W(instrW),.instr_M(instrM),
		.PC(PCW),
		.clk(clk),
		.reset(reset),
		.freeze(freeze),
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
	 wire [31:0] PCE,instrE;
	 wire [1:0] memToRegE;
	 IDEX idex(
		.clk(clk),
		.freeze(freeze),
		.flush(stall|reset),				//#stall->flush reset->flush
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
		.instrOut(instrE)//OUT
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
		.sel(aluOpE),
		.out(ALUOutE)
	 );
	 
	 
	 wire [31:0] mulOutE,mulOutM,mulOutW;
	 HILO hilo(
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
	 wire [4:0] grfWriteAddrM;
	 wire dmWEM,dmSignM;
	 wire [2:0] dmWidM;
	 wire [1:0] memToRegM;
	 wire [31:0] extimmM;
	 EXME exme(
		.clk(clk),
		.freeze(freeze),
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
		.mulOutOut(mulOutM)
	 );
	 
	 //ME
	 wire [31:0] readDMM;
	 wire [4:0] rtM=instrM[20:16];
	 
	 //dmWD = rt or forward rt
	 assign dmWriteDataM=	(rtM==0)?							0:
									(rtM==grfWriteAddrW&&FflagW)?	grfWriteDataW:
																			dmWriteDataMBeforeF;
	 DM dm(
		.width(dmWidM),
		.sign(dmSignM),
		.address(ALUOutM),
		.data(dmWriteDataM),
		.WE(dmWEM),
		.freeze(freeze),
		.clk(clk),
		.reset(reset),
		.PC(PCM),
		.out(readDMM)
	 );
	 
	 //MEForward
	 assign FdataM=	FdataselM==0?	ALUOutM:	
							FdataselM==1?	PCM+8:
							FdataselM==2?	extimmM:
												mulOutM;
	 
	 
	 //MEWB
	 wire [31:0] ALUOutW,readDMW;
	 wire [1:0] memToRegW;
	 wire [31:0] extimmW;
	 MEWB mewb(
		.clk(clk),
		.reset(reset),
		.freeze(freeze),
		.PC(PCM),
		.PCOut(PCW),
		.dmData(readDMM),
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
		.mulOutOut(mulOutW)
	 );
	 
	 //WB
	 MUX4 WBMUX(
		.A(readDMW),
		.B(ALUOutW),
		.C(PCW+8),
		.D(mulOutW),
		.sel(memToRegW),
		.out(grfWriteDataW)
	 );
	 
	 //stall and forward
	 STALL pause(
		.mulBusy(mulBusy),
		.instrD(instrD),
		.instrE(instrE),
		.instrM(instrM),
		.instrW(instrW),
		.stall(stall),
		.freeze(freeze)
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

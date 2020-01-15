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
	 
	 wire stall;							//stall???????????????????
	 
	 //IF
	 wire [31:0] PCF,NPCF,instrF;		//wires in F
	 wire [31:0] PCBranch,PCJ,PCJr;	//NPC candidates from D
	 wire j,jal,jr,b,beq;				//NPC selectors  from controller
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
	 wire [2:0] aluOpD;
	 
	 wire [4:0] grfWriteAddrW;	//from WB
	 wire [31:0] grfWriteDataW;	//from WB
	 
	 wire aluAD,aluBD,dmWED;
	 wire [1:0] memToRegD;
	 
	 CTL ctl(
		.instr(instrD),		//INPUT
		.grfWriteAddr(grfWriteAddrD),
		.extOp(extOpD),
		.aluOp(aluOpD),
		.memToReg(memToRegD),//1:from ALU 0:from DM 2:from PC+4
		.aluB(aluBD),			//1:from EXT 0:rt
		.aluA(aluAD),			//0:from Rs  1:???
		.jal(jal),
		.jr(jr),
		.j(j),
		.beq(beq),
		.dmWE(dmWED)
	 );
	 
	 wire [31:0] readRsD,readRtD;
	 
	 wire [31:0] PCW;
	 
	 GRF grf(
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
	 
	 CMP cmp(
		.data1(grfRsD),
		.data2(grfRtD),
		.equal(CMPEqual),
		.greater(CMPGreater),
		.less(CMPLess)
	 );
	 assign b=CMPEqual&beq;
	 
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
	 wire [2:0] aluOpE;
	 wire dmWEE;
	 wire [31:0] PCE,instrE;
	 wire [1:0] memToRegE;
	 IDEX idex(
		.clk(clk),
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
	 
	 assign srcAE=aluAE?0:grfRsE;
	 assign srcBE=aluBE?extimmE:grfRtE;
	 wire [31:0] ALUOutE;
	 
	 ALU alu(
		.A(srcAE),
		.B(srcBE),
		.sel(aluOpE),
		.out(ALUOutE)
	 );
	 
	 //EXForward
	 assign FdataE=	(FdataselE==2'd1)?	extimmE:
														(PCE+8);
	 
	 
	 
	 //EXME
	 wire [31:0] ALUOutM,dmWriteDataMBeforeF,dmWriteDataM,PCM,instrM;
	 wire [4:0] grfWriteAddrM;
	 wire dmWEM;
	 wire [1:0] memToRegM;
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
		.memToReg(memToRegE),
		.memToRegOut(memToRegM),
		.PC(PCE),
		.PCOut(PCM),
		.instr(instrE),
		.instrOut(instrM),//OUT
		.extimm(extimmE),
		.extimmOut(extimmM)
	 );
	 
	 //ME
	 wire [31:0] readDMM;
	 wire [4:0] rtM=instrM[20:16];
	 assign dmWriteDataM=	(rtM==0)?							0:
									(rtM==grfWriteAddrW&&FflagW)?	grfWriteDataW:
																			dmWriteDataMBeforeF;
	 DM dm(
		.address(ALUOutM),
		.data(dmWriteDataM),
		.WE(dmWEM),
		.clk(clk),
		.reset(reset),
		.PC(PCM),
		.out(readDMM)
	 );
	 
	 //MEForward
	 assign FdataM=	FdataselM==0?	ALUOutM:	
							FdataselM==1?	PCM+8:
												extimmM;
	 
	 
	 //MEWB
	 wire [31:0] instrW;
	 wire [31:0] ALUOutW,readDMW;
	 wire [1:0] memToRegW;
	 wire [31:0] extimmW;
	 MEWB mewb(
		.clk(clk),
		.reset(reset),
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
		.instrOut(instrW)
	 );
	 
	 //WB
	 MUX4 WBMUX(
		.A(readDMW),
		.B(ALUOutW),
		.C(PCW+8),
		.D(0),
		.sel(memToRegW),
		.out(grfWriteDataW)
	 );
	 
	 //stall and forward
	 STALL pause(
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

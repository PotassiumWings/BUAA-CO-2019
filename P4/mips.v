`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:26:56 11/07/2019 
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
	 
	 wire ifBeq,ifJal,ifJr;
	 wire [4:0]rs,rt,rd;
	 wire [25:0]dataJal;
	 wire [31:0]ALUres;
	 wire [31:0]instr;
	 wire [31:0]R1,R2;
	 
	 wire [31:0]PC;
	 IFU ifu(
			.PC(PC),
			.ifB(ifBeq&(ALUres==0)),
			.ifJal(ifJal),
			.reset(reset),
			.clk(clk),
			.ifJr(ifJr),
			.dataJal(dataJal),
			.datars(R1),//datars
			.instr(instr)//output
	 );
	 
	 wire grfSlt,grfWE,dmWE,toReg,aluB;
	 wire [1:0]extOp,aluOp;
	 wire [15:0]imm;
	 Controller ctl(
			.instr(instr),
			.grfSlt(grfSlt),	//1:GRFC:rd 0:GRFC:rt
			.grfWE(grfWE),
			.dmWE(dmWE),
			.extOp(extOp),
			.aluOp(aluOp),
			.toReg(toReg),		//1:from ALU 0:from DM
			.ifBeq(ifBeq),
			.rs(rs),
			.rt(rt),
			.rd(rd),
			.imm(imm),
			.aluB(aluB),
			.ifJal(ifJal),
			.ifJr(ifJr),
			.dataJal(dataJal)
	 );
	 
	 wire [31:0]data;
	 wire [31:0]extRes;
	 wire [31:0]dmout;
	 assign data=toReg?	ALUres:
					 ifJal?	PC+4:
								dmout;
	 
	 GRF grf(
			.pc(PC),
			.clk(clk),
			.reset(reset),
			.WE(grfWE),
			.A1(rs),
			.A2(rt),
			.A3(
				 ifJal?    31:
				 grfSlt==1?rd:
							  rt
			),
			.data(data),
			.R1(R1),
			.R2(R2)
	 );
	 
	 EXT ext(
			.data(imm),
			.op(extOp),
			.out(extRes)
	 );
	 ALU alu(
			.A(R1),//datars
			.B(aluB?extRes:R2),
			.op(aluOp),
			.out(ALUres)
	 );
	 
	 DM dm(
			.pc(PC),
			.address(ALUres),
			.data(R2),
			.WE(dmWE),
			.clk(clk),
			.reset(reset),
			.out(dmout)
	 );
	 //always@(*)$display("beq:%d,|:%d",ifBeq,(ALUres));
	 
endmodule

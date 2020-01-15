`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:08:23 11/20/2019 
// Design Name: 
// Module Name:    IDEX 
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
module IDEX(
	 input clk,
	 input flush,
	 input [31:0] grfRs,grfRt,
	 input [4:0] grfWriteAddr,
	 input [1:0] memToReg,
	 input dmWE,aluB,aluA,
	 input [2:0] aluOp,
	 input [31:0] extimm,PC,
    input [31:0] instr,
	 output reg [31:0] grfRsOut=0,grfRtOut=0,
	 output reg [4:0] grfWriteAddrOut=0,
	 output reg [1:0] memToRegOut=0,
	 output reg dmWEOut=0,aluBOut=0,aluAOut=0,	 
	 output reg [2:0]aluOpOut=0,
	 output reg [31:0]extimmOut=0,PCOut=0,
    output reg [31:0] instrOut=0
    );
	 
	 always@(posedge clk)begin
		 if(flush==1)begin
			  grfRsOut<=0;
			  grfRtOut<=0;
			  grfWriteAddrOut<=0;
			  memToRegOut<=0;
			  dmWEOut<=0;
			  aluBOut<=0;
			  aluAOut<=0;
			  aluOpOut<=0;
			  extimmOut<=0;
			  PCOut<=0;
			  instrOut<=0;
		 end
		 else begin
			  grfRsOut<=grfRs;
			  grfRtOut<=grfRt;
			  grfWriteAddrOut<=grfWriteAddr;
			  memToRegOut<=memToReg;
			  dmWEOut<=dmWE;
			  aluBOut<=aluB;
			  aluAOut<=aluA;
			  aluOpOut<=aluOp;
			  extimmOut<=extimm;
			  PCOut<=PC;
			  instrOut<=instr;
		 end
	 end


endmodule

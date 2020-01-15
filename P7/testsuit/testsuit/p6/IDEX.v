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
	 input req,
	 input [31:0] grfRs,grfRt,
	 input [4:0] grfWriteAddr,
	 input [2:0] memToReg,
	 input dmWE,aluA,dmSign,
	 input [1:0] aluB,
	 input [3:0] aluOp,
	 input [31:0] extimm,PC,instr,
	 input [2:0] dmWid,
	 output reg [31:0] grfRsOut=0,grfRtOut=0,
	 output reg [4:0] grfWriteAddrOut=0,
	 output reg [2:0] memToRegOut=0,
	 output reg dmWEOut=0,aluAOut=0,dmSignOut=0,
	 output reg [1:0] aluBOut=0,
	 output reg [3:0] aluOpOut=0,
	 output reg [31:0] extimmOut=0,PCOut=0,instrOut=0,
	 output reg [2:0] dmWidOut=0,
	 
	 input [4:0]excCode,
	 output reg [4:0]excCodeOut=0,
	 input bd,
	 output reg bdOut=0,
	 input aluExcIn,
	 output reg aluExcInOut,
	 input CP0WE,
	 output reg CP0WEOut=0
    );
	 
	 always@(posedge clk or posedge req)begin
		 if(flush==1 || req)begin//req
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
			  dmWidOut<=0;
			  dmSignOut<=0;
			  
			  excCodeOut<=0;
			  bdOut<=0;
			  aluExcInOut<=0;
			  CP0WEOut<=0;
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
			  dmWidOut<=dmWid;
			  dmSignOut<=dmSign;
			  
			  excCodeOut<=excCode;
			  bdOut<=bd;
			  aluExcInOut<=aluExcIn;
			  CP0WEOut<=CP0WE;
		 end
	 end


endmodule

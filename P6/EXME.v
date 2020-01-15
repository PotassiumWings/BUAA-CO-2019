`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:42:11 11/20/2019 
// Design Name: 
// Module Name:    EXME 
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
module EXME(
	 input clk,
	 input reset,
	 input freeze,
    input [31:0] aluOut,
    input [31:0] dmWriteData,
    input [4:0] grfWriteAddr,
    input dmWE,dmSign,
	 input [2:0] dmWid,
    input [1:0] memToReg,
    input [31:0] PC,
    input [31:0] instr,
	 input [31:0] extimm,
	 input [31:0] mulOut,
    output reg [31:0] aluOutOut=0,
    output reg [31:0] dmWriteDataOut=0,
    output reg [4:0] grfWriteAddrOut=0,
    output reg dmWEOut=0,dmSignOut=0,
	 output reg [2:0] dmWidOut=0,
    output reg [1:0] memToRegOut=0,
    output reg [31:0] PCOut=0,
    output reg [31:0] instrOut=0,
	 output reg [31:0] extimmOut=0,
	 output reg [31:0] mulOutOut=0
    );
	 always@(posedge clk or posedge reset)begin
	     if(reset)begin
				aluOutOut<=0;
				dmWriteDataOut<=0;
				grfWriteAddrOut<=0;
				dmWEOut<=0;
				memToRegOut<=0;
				PCOut<=0;
				instrOut<=0;
				extimmOut<=0;
				dmWidOut<=0;
				dmSignOut<=0;
				mulOutOut<=0;
		  end
		  else if(!freeze)begin
				aluOutOut<=aluOut;
				dmWriteDataOut<=dmWriteData;
				grfWriteAddrOut<=grfWriteAddr;
				dmWEOut<=dmWE;
				memToRegOut<=memToReg;
				PCOut<=PC;
				instrOut<=instr;
				extimmOut<=extimm;
				dmWidOut<=dmWid;
				dmSignOut<=dmSign;
				mulOutOut<=mulOut;
		  end
	 end
	 


endmodule
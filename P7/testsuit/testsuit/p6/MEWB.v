`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:02:14 11/20/2019 
// Design Name: 
// Module Name:    MEWB 
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
module MEWB(

	 input req,//req
	
    input clk,
	 input reset,
    input [31:0] dmData,
    input [31:0] ALUOut,
    input [4:0] grfWriteAddr,
    input [31:0] PC,
    input [2:0] memToReg,
    input [31:0] instr,
	 input [31:0] mulOut,
    output reg [31:0] dmDataOut=0,
    output reg [31:0] ALUOutOut=0,
    output reg [4:0] grfWriteAddrOut=0,
    output reg [31:0] PCOut=0,
    output reg [2:0] memToRegOut=0,
    output reg [31:0] instrOut=0,
	 output reg [31:0] mulOutOut=0,
	 
	 input [31:0] CP0Data,
	 output reg [31:0]CP0DataOut=0
    );
	 always@(posedge clk or posedge reset)begin
		  if(reset==1 || req)begin
			  dmDataOut<=0;
			  ALUOutOut<=0;
			  grfWriteAddrOut<=0;
			  memToRegOut<=0;
			  PCOut<=0;
			  instrOut<=0;
			  mulOutOut<=0;
			  
			  CP0DataOut<=0;
		  end
		  else begin
			  dmDataOut<=dmData;
			  ALUOutOut<=ALUOut;
			  grfWriteAddrOut<=grfWriteAddr;
			  memToRegOut<=memToReg;
			  PCOut<=PC;
			  instrOut<=instr;
			  mulOutOut<=mulOut;
			  
			  CP0DataOut<=CP0Data;
		  end
	 end


endmodule

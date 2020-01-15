`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:21:02 11/09/2019 
// Design Name: 
// Module Name:    IFU 
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
module IFU(
    input ifB,
    input ifJal,
	 input [25:0]dataJal,
    input reset,
    input clk,
    input ifJr,
    input [31:0] datars,
	 output reg[31:0]PC,
    output [31:0]instr
    );
	 wire [31:0]pc;//npc
	 reg [31:0]lpc;
	 
	 reg [31:0]im[0:1023];
	 
	 //wire [15:0]instrToEXT;
	 //assign instrToEXT=instr[15:0];
	 
	 wire [31:0]EXTofB={{14{instr[15]}},instr[15:0],2'b00};
	 //EXT ext1(.data(instrToEXT),.op(1'd2),.out(EXTofB));
	 
	 wire [25:0]temp;
	 assign instr=im[lpc[11:2]];
	 
	 assign temp[0]=dataJal[0];
	 assign temp[1]=dataJal[1];
	 assign temp[2]=dataJal[2];
	 assign temp[3]=dataJal[3];
	 assign temp[4]=dataJal[4];
	 assign temp[5]=dataJal[5];
	 assign temp[6]=dataJal[6];
	 assign temp[7]=dataJal[7];
	 assign temp[8]=dataJal[8];
	 assign temp[9]=dataJal[9];
	 assign temp[10]=dataJal[10];
	 assign temp[11]=dataJal[11];
	 assign temp[12]=dataJal[12];
	 assign temp[13]=dataJal[13];
	 assign temp[14]=dataJal[14];
	 assign temp[15]=dataJal[15];
	 assign temp[16]=dataJal[16];
	 assign temp[17]=dataJal[17];
	 assign temp[18]=dataJal[18];
	 assign temp[19]=dataJal[19];
	 assign temp[20]=dataJal[20];
	 assign temp[21]=dataJal[21];
	 assign temp[22]=dataJal[22];
	 assign temp[23]=dataJal[23];
	 assign temp[24]=dataJal[24];
	 assign temp[25]=dataJal[25];
	 assign pc=ifB==1?	lpc+4+EXTofB:
				  ifJal==1?	{lpc[31:28],temp,2'b00}:
				  ifJr==1?	datars:
								lpc+4;
	 
	 initial begin
		  lpc<=32'h3000;
		  PC<=32'h3000;
	     $readmemh("code.txt",im);
	 end
	 always@(posedge clk /*or posedge reset*/)begin
	     if(reset==1)begin
				lpc<=32'h3000;
				PC<=32'h3000;
		  end
		  else begin
				//$display("nextpc:%h,instr:%h,ifjal:%h,ifjr:%d",pc,instr,ifJal,ifJr);
				//$display("%h,%h",lpc[31:28],{temp,2'b00});
				//$display("%h",lpc+4+EXTofB);
		      lpc<=pc;
				PC<=pc;
		  end
	 end


endmodule

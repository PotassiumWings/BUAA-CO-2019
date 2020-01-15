`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:41:37 11/19/2019 
// Design Name: 
// Module Name:    IM 
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
module IM(
    input [31:0] PC,
	 input eretD,eretE,eretM,
    output [31:0] instr
    );
	 reg [31:0] im[4095:0];
	 //reg [31:0]im[4095+32'hc00:32'hc00];
	 integer i;
	 initial begin
	     for(i=0;i<4096;i=i+1)begin
		      im[i/*+32'hc00*/]=0;
		  end
		  $readmemh("code.txt",im);
		  $readmemh("code_handler.txt", im, 1120, 2047);
	 end
	 
	 assign instr=	(PC>32'H4FFF||PC<32'H3000||(|PC[1:0]))?	32'd0:
						(eretD|eretE|eretM)?								32'd0:
																				im[PC[13:2]-12'HC00];


endmodule

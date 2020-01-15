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
    output [31:0] instr
    );
	 reg [31:0] im[4095:0];
	 //reg [31:0]im[4095+32'hc00:32'hc00];
	 integer i;
	 initial begin
	     for(i=0;i<4095;i=i+1)begin
		      im[i/*+32'hc00*/]=0;
		  end
		  $readmemh("code.txt",im);
	 end
	 
	 assign instr=im[PC[13:2]-12'HC00];


endmodule

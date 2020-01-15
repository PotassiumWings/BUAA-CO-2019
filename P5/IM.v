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
	 reg [31:0]im[1023:0];
	 integer i;
	 initial begin
	     for(i=0;i<1024;i=i+1)begin
		      im[i]=0;
		  end
		  $readmemh("code.txt",im);
	 end
	 
	 assign instr=im[PC[11:2]];


endmodule

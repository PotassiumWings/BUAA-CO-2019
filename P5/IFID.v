`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:42:31 11/19/2019 
// Design Name: 
// Module Name:    IFID 
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
module IFID(
	 input clk,
	 input stall,
	 input reset,
    input [31:0] instrIn,
    output reg [31:0] instrOut=0,
    input [31:0] PCIn,
    output reg [31:0] PCOut=0
    );
	 always@(posedge clk or posedge reset)begin
		  if(reset==1)begin
		      PCOut<=0;
				instrOut<=0;
		  end
		  else if(!stall)begin
		      PCOut<=PCIn;
				instrOut<=instrIn;
		  end
	 end


endmodule

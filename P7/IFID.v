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
	 input req,
    input [31:0] instrIn,
    output reg [31:0] instrOut=0,
    input [31:0] PCIn,
    output reg [31:0] PCOut=0,
	 
	 input [4:0]excCode,
	 output reg [4:0]excCodeOut=0,
	 input bd,
	 output reg bdOut=0
    );
	 always@(posedge clk or posedge reset)begin
		  if(reset | req)begin
		      PCOut<=0;
				instrOut<=0;
				
				excCodeOut<=0;
				
				if(stall)bdOut<=bd;
				else bdOut<=0;
		  end
		  else if(!stall)begin
		      PCOut<=PCIn;
				if(excCode!=0)begin//excCodeF!=0:PC exception
					 instrOut<=0;
				end
				else begin
					 instrOut<=instrIn;
				end
				
				excCodeOut<=excCode;
				bdOut<=bd;
		  end
	 end


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:50:26 11/09/2019 
// Design Name: 
// Module Name:    DM 
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
module DM(
    input [31:0] address,
    input [31:0] data,
    input WE,
    input clk,
    input reset,
	 input[31:0]pc,
    output [31:0] out
    );
	 integer i;
	 reg [31:0]dm[1023:0];
	 initial begin
	     for(i=0;i<1024;i=i+1)begin
		      dm[i]=0;
		  end
	 end
	 assign out=dm[address[11:2]];
	 always@(posedge clk or posedge reset)begin
	     if(reset==1)begin
		      for(i=0;i<1024;i=i+1)dm[i]=0;
		  end
		  else if(WE==1)begin
		      dm[address[11:2]]=data;
				$display("@%h: *%h <= %h",pc, address,data);
		  end 
	 end 


endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:50:41 11/19/2019 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
    input [31:0]PC,
    input clk,
    input reset,
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] data,
    output [31:0] R1,
    output [31:0] R2
    );
	 reg [31:0]grf[31:0];
	 assign R1=grf[A1];
	 assign R2=grf[A2];
	 integer i;
	 initial begin
	     for(i=0;i<32;i=i+1)begin
		      grf[i]=0;
		  end
	 end
	 always@(posedge clk or posedge reset)begin
	     if(reset==1)begin
		      for(i=0;i<32;i=i+1)begin
				    grf[i]<=0;
				end
		  end
		  else if(A3!=0)begin
			   grf[A3]<=data;
			   $display("%d@%h: $%d <= %h", $time, PC, A3,data);
		  end
	 end

endmodule

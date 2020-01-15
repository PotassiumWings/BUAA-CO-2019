`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:46:16 11/09/2019 
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
    input [31:0]pc,
    input clk,
    input reset,
    input WE,
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
	 always@(posedge clk /*or posedge reset*/)begin
	     if(reset==1)begin
		      for(i=0;i<32;i=i+1)begin
				    grf[i]=0;
				end
		  end
		  else if(WE==1)begin
		  //$display("A1 %d a2 %d a3 %d data %h r1 %h r2 %h",A1,A2,A3,data,R1,R2);
		      if(A3==0)begin
					 $display("@%h: $%d <= %h", pc, 0,0);
				end
				else begin
				    grf[A3]=data;
					 $display("@%h: $%d <= %h", pc, A3,data);
				end
		  end
	 end

endmodule

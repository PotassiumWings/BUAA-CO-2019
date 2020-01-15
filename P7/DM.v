`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:27:29 11/19/2019 
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
	 input [2:0] width,
	 input sign,
    input clk,
    input reset,
	 input [31:0] PC,
    output [31:0] out
    );
	 integer i;
	 reg [31:0] dm[4095:0];
	 initial begin
	     for(i=0;i<4096;i=i+1)begin
		      dm[i]=0;
		  end
	 end
	 wire [31:0]temp;
	 assign temp=	width==4?	dm[address[13:2]]:
						width==2?	(
											address[1:0]==0?	dm[address[13:2]][15:0]:
																	dm[address[13:2]][31:16]
										):
						width==1?	(
											address[1:0]==0?	dm[address[13:2]][7:0]:
											address[1:0]==1?	dm[address[13:2]][15:8]:
											address[1:0]==2?	dm[address[13:2]][23:16]:
																	dm[address[13:2]][31:24]
										):
										0;
	 assign out=	width==4?	temp:
						width==2?	(
											sign?	{{16{temp[15]}},temp[15:0]}:temp
										):
						width==1?	(
											sign?	{{24{temp[7]}},temp[7:0]}:temp
										):
										0;
	 
	 always@(posedge clk or posedge reset)begin
	     if(reset==1)begin
		      for(i=0;i<4096;i=i+1)dm[i]=0;
		  end
		  else if(WE==1)begin
				if(width==4)begin						//sw
				    dm[address[13:2]]=data;
				end
				else if(width==2)begin				//sh
				    if(address[1:0]==0)dm[address[13:2]][15:0]=data[15:0];
					 else dm[address[13:2]][31:16]=data[15:0];
				end
				else begin								//sb
					 if(address[1:0]==0)dm[address[13:2]][7:0]=data[7:0];
					 else if(address[1:0]==1)dm[address[13:2]][15:8]=data[7:0];
					 else if(address[1:0]==2)dm[address[13:2]][23:16]=data[7:0];
					 else dm[address[13:2]][31:24]=data[7:0];
				end
				
				$display("%d@%h: *%h <= %h", $time, PC, address[31:2]<<2, dm[address[13:2]]);
		  end 
	 end 

endmodule

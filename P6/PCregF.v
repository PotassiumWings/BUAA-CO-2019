`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:34:48 11/19/2019 
// Design Name: 
// Module Name:    PCregF 
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
module PCregF(
    input clk,
    input reset,
	 input freeze,
	 input WE,
    input [31:0] NPC,
    output reg[31:0] PC
    );
	 initial begin
	     PC<=32'H3000;
	 end
	 
	 always@(posedge clk or posedge reset)begin
	     if(reset)begin
		      PC<=32'H3000;
		  end
		  else if(WE&&!freeze)begin
				PC<=NPC;
		  end
	 end


endmodule

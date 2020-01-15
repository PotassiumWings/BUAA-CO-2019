`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:49:06 11/19/2019 
// Design Name: 
// Module Name:    EXT 
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
module EXT(
    input [15:0] data,
    input [1:0] sel,
    output [31:0] out
    );
	 wire sign;
	 wire [31:0]signExt,zeroExt,ext2,toHigh;
	 assign sign=data[15];
	 assign signExt=	{{16{sign}},data};
	 assign zeroExt=	{{16{1'b0}},data};
	 assign ext2=		{{14{sign}},data,2'b00};
	 assign toHigh=	data<<16;
	 assign out=	sel==0?	signExt:
						sel==1?	zeroExt:
						sel==2?	ext2:
									toHigh;

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:21:57 11/09/2019 
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
    input [1:0]op,
    output [31:0] out
    );
	 wire sign;
	 wire [31:0]signext,zeroext,ext2,tohigh;
	 assign sign=data[15];
	 assign signext={{16{sign}},data};
	 assign zeroext={{16{1'b0}},data};
	 assign ext2={{14{sign}},data,2'b00};
	 assign tohigh=data<<16;
	 assign out=(op==0?signext:
		       op==1?zeroext:
				 op==2?ext2:
				 tohigh);
				 
	//always@*$display("EXT:%h data:%h op:%h",out,data,op);

endmodule

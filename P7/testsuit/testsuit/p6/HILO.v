`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:54:18 11/24/2019 
// Design Name: 
// Module Name:    HILO 
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
`define divop	6'b000000
`define divfu	6'b011010
`define divuop	6'b000000
`define divufu	6'b011011
`define mfhiop	6'b000000
`define mfhifu	6'b010000
`define mfloop	6'b000000
`define mflofu	6'b010010
`define mthiop	6'b000000
`define mthifu	6'b010001
`define mtloop	6'b000000
`define mtlofu	6'b010011
`define multop	6'b000000
`define multfu	6'b011000
`define multuop 6'b000000
`define multufu 6'b011001
module HILO(
	 input clk,
	 input reset,
    input [31:0] A,
    input [31:0] B,
	 input [31:0] instr,
    output [31:0] out,
	 output start,
    output reg busy=0,
	 
	 input req
    );
	 wire [5:0] func=instr[5:0];
	 wire [5:0] op=instr[31:26];
 	 
	 wire div=(op==`divop)&(func==`divfu);
	 wire divu=(op==`divuop)&(func==`divufu);
	 wire mfhi=(op==`mfhiop)&(func==`mfhifu);
	 wire mflo=(op==`mfloop)&(func==`mflofu);
	 wire mthi=(op==`mthiop)&(func==`mthifu);
	 wire mtlo=(op==`mtloop)&(func==`mtlofu);
	 wire mult=(op==`multop)&(func==`multfu);
	 wire multu=(op==`multuop)&(func==`multufu);
	 
	 integer state=0;
	 reg [31:0] hi=0,lo=0;
	 reg [31:0] nhi=0,nlo=0;
	 
	 assign start = mult | multu | div | divu;
	 
	 assign out=	mfhi?	hi:
						mflo?	lo:
								0;
	 
	 always@(posedge clk or posedge reset)begin
	     if(reset)begin
				state=0;
		      busy<=0;
				hi<=0;
				lo<=0;
		  end
		  else if(!req)begin
		       if(state)begin
				     state=state-1;
					  if(state==0)begin
					      busy<=0;
							hi<=nhi;
							lo<=nlo;
					  end
				 end 
				 else begin
				     if(mtlo)begin
					      lo<=A;
					  end
					  else if(mthi)begin
					      hi<=A;
					  end
					  else if(mult)begin
					      busy<=1;
							state=5;
							{nhi,nlo}<=$signed(A)*$signed(B);
					  end
					  else if(div)begin
					      busy<=1;
							state=10;
							nlo<=$signed(A)/$signed(B);
							nhi<=$signed(A)%$signed(B);
					  end
					  else if(multu)begin
					      busy<=1;
							state=5;
							{nhi,nlo}<=A*B;
					  end
					  else if(divu)begin
					      busy<=1;
							state=10;
							nlo<=A/B;
							nhi<=A%B;
					  end
				 end
		  end
	 end


endmodule

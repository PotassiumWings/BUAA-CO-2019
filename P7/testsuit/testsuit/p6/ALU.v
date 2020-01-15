`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:24:04 11/19/2019 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0]sel,
	 input excIn,
	 output excOut,
    output [31:0] out
    );
	 							
	 /*assign aluOp=		(lb|lbu|lh|lhu|lui|lw|sb|sh|sw
								|add|addu|addi|addiu|lui)?		4'd0://ADD
							(sub|subu)?								4'd1://SUB
							(And|andi)?								4'd2://AND
							(Or|ori)?								4'd3://OR
							(Xor|xori)?								4'd4://XOR
							(sll|sllv)?								4'd5://<<
							(srl|srlv)?								4'd6://>> Logic
							(sra|srav)?								4'd7://>> Arith
							(Nor)?									4'd8://NOR
							(slt)?									4'd9://<
							(sltu)?									4'd10://<u
																		4'd11;*/
	 
	 wire [31:0] arithRight=($signed(A)>>>$signed({1'b0,B}));
	 wire [31:0] lessSigned=($signed(A)<$signed(B))?32'b1:32'b0;
	 
	 wire [32:0]exA={A[31],A},exB={B[31],B};
	 wire [32:0]add=exA+exB,sub=exA-exB;
	 
	 assign out=	sel==0?	A+B:
						sel==1?	A-B:
						sel==2?	A&B:
						sel==3?	A|B:
						sel==4?	A^B:
						sel==5?	A<<B:
						sel==6?	A>>B:
						sel==7?	arithRight:
						sel==8?	~(A|B):
						sel==9?	lessSigned:
						sel==10?	(A<B):
									0;
	 assign excOut=(!excIn)?	1'd0:
						(
							sel==0?	add[32]!=add[31]:
										sub[32]!=sub[31]
						);

endmodule

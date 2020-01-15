`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:56:40 11/19/2019 
// Design Name: 
// Module Name:    CTL 
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
module CTL(
    input [31:0] instr,
    output [4:0] grfWriteAddr,  //grfWriteAddress
    output [1:0] extOp,
    output [2:0] aluOp,		//+-&|,Ê£ÏÂµÄ´ýÌî³ä
    output [1:0] memToReg,			//1:from ALU 0:from DM 2:PC+4(Jal)
	 output aluB,				//1:from EXT 0:rt
	 output aluA,				//0:from Rs  1:???
    output jal,
    output jr,
	 output j,
	 output beq,
	 output dmWE
    );
	 wire [5:0]func,op;
	 wire [4:0]rs,rt,rd;
	 assign func=instr[5:0];
	 assign op=instr[31:26];
	 assign rs=instr[25:21];
	 assign rt=instr[20:16];
	 assign rd=instr[15:11];
	 
	 wire addu,subu,ori,lw,sw,lui;//,beq,jal,jr,j;
	 assign addu=!(|op)&func[5]&!func[4]&!func[3]&!func[2]&!func[1]&func[0];
	 assign subu=!(|op)&func[5]&!func[4]&!func[3]&!func[2]&func[1]&func[0];
	 assign ori=!op[5]&!op[4]&op[3]&op[2]&!op[1]&op[0];
	 assign lw=op[5]&!op[4]&!op[3]&!op[2]&op[1]&op[0];
	 assign sw=op[5]&!op[4]&op[3]&!op[2]&op[1]&op[0];
	 assign beq=!op[5]&!op[4]&!op[3]&op[2]&!op[1]&!op[0];
	 assign lui=!op[5]&!op[4]&op[3]&op[2]&op[1]&op[0];
	 assign jal=!op[5]&!op[4]&!op[3]&!op[2]&op[1]&op[0];
	 assign jr=!(|op)&!func[5]&!func[4]&func[3]&!func[2]&!func[1]&!func[0];
	 assign j=!op[5]&!op[4]&!op[3]&!op[2]&op[1]&!op[0];
	 //¾¯Ìè(&op)´íÎó
	 
	 //instr alu		grfSave	DM			IFU
	 //addu:	rd=rs+rt rd
	 //subu:	rd=rs-rt rd
	 //ori:				rt=rs|imm(zero_ext)
	 //lw:	+			rt=DM[rs+imm(sign_ext)]
	 //sw:	+						DM[rs+imm(sign_ext)]=rt
	 //beq:	rs-rt==0							PC=PC+4+imm(ext2)
	 //lui:				rt=imm(tohigh)
	 //jal:										PC=PC[31:28]imm[25:0]00
	 //jr:										PC=rs
	 assign grfWriteAddr=	(addu|subu)?	rd:
									(ori|lw|lui)?	rt:
									(jal)?			5'd31:
														5'd0;
												
	 assign extOp=		(lw|sw)?	2'd0:
							ori?		2'd1:
							beq?		2'd2:
							lui?		2'd3:2'd3;
							
	 assign aluOp=		(addu|lw|sw|lui)?	3'd0:	//ADD		//lui:alures=$0+extres from mux!!!
							(subu|beq)?			3'd1:	//SUB
							ori?					3'd3:	//OR
													3'd2;	//AND
							
	 assign memToReg=	(addu|subu|ori|lui)?	2'd1:
							(jal)?					2'd2:
														2'd0;
	 
	 assign aluA=		(addu|subu|ori|lw|sw|lui)?	1'd0:	//rs
																1'd1;	//???
	 
	 assign aluB=		(addu|subu)?		1'd0:			//rt
							(ori|lui|lw|sw)?	1'd1:1'd1;	//ext
	 
	 assign dmWE=		sw;
	 

endmodule
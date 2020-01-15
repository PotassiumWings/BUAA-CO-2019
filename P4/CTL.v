`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:57:52 11/09/2019 
// Design Name: 
// Module Name:    Controller 
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
module Controller(
    input [31:0] instr,
    output grfSlt,			//1:GRFC:rd 0:GRFC:rt
    output grfWE,
    output dmWE,
    output [1:0] extOp,
    output [1:0] aluOp,
    output toReg,				//1:from ALU 0:from DM
    output ifBeq,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] rd,
	 output aluB,				//1:from EXT 0:rt
    output [15:0] imm,
    output ifJal,
    output ifJr,
    output [25:0] dataJal
    );
	 wire [5:0]func,op;
	 assign func=instr[5:0];
	 assign op=instr[31:26];
	 assign rs=instr[25:21];
	 assign rt=instr[20:16];
	 assign rd=instr[15:11];
	 assign imm=instr[15:0];
	 assign dataJal=instr[25:0];
	 
	 wire addu,subu,ori,lw,sw,beq,lui,jal,jr;
	 assign addu=!(|op)&func[5]&!func[4]&!func[3]&!func[2]&!func[1]&func[0];
	 assign subu=!(|op)&func[5]&!func[4]&!func[3]&!func[2]&func[1]&func[0];
	 assign ori=!op[5]&!op[4]&op[3]&op[2]&!op[1]&op[0];
	 assign lw=op[5]&!op[4]&!op[3]&!op[2]&op[1]&op[0];
	 assign sw=op[5]&!op[4]&op[3]&!op[2]&op[1]&op[0];
	 assign beq=!op[5]&!op[4]&!op[3]&op[2]&!op[1]&!op[0];
	 assign lui=!op[5]&!op[4]&op[3]&op[2]&op[1]&op[0];
	 assign jal=!op[5]&!op[4]&!op[3]&!op[2]&op[1]&op[0];
	 assign jr=!(|op)&!func[5]&!func[4]&func[3]&!func[2]&!func[1]&!func[0];
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
	 assign grfSlt=	addu|subu;
	 assign grfWE=		addu|subu|ori|lw|lui|jal;
	 assign dmWE=		sw;
	 assign extOp=		(lw|sw)?	0:
							ori?		1:
							beq?		2:
							lui?		3:3;
	 assign aluOp=		(addu|lw|sw|lui)?	0://lui:alures=$0+extres from mux!!!
							(subu|beq)?		1:
							ori?				3:2;
	 assign toReg=		addu|subu|ori|lui;
	 //aluA=rs
	 assign aluB=		ori|lw|sw|lui;
	 assign ifBeq=beq;
	 assign ifJal=jal;
	 assign ifJr=jr;
	 //always@(posedge beq)begin
	 //    $display("instr beq $%d $%d %d",rs,rt,imm);
	 //end 

endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:05:24 11/25/2019 
// Design Name: 
// Module Name:    interpreter 
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
`define lb 	6'b100000
`define lbu 6'b100100
`define lh	6'b100001
`define lhu 6'b100101
`define lw	6'b100011
`define sb	6'b101000
`define sh	6'b101001
`define sw	6'b101011
`define addop	6'b000000
`define addfu	6'b100000
`define addi	6'b001000
`define addiu	6'b001001
`define adduop	6'b000000
`define addufu	6'b100001
`define andop	6'b000000
`define andfu	6'b100100
`define andi	6'b001100
`define beq		6'b000100
`define bgezop	6'b000001
`define bgezrt 5'b00001
`define bgtz	6'b000111
`define blez	6'b000110
`define bltzop	6'b000001
`define bltzrt 5'b00000
`define bne		6'b000101
`define divop	6'b000000
`define divfu	6'b011010
`define divuop	6'b000000
`define divufu	6'b011011
`define j		6'b000010
`define jal		6'b000011
`define jalrop	6'b000000
`define jalrfu 6'b001001
`define jrop	6'b000000
`define jrfu	6'b001000
`define lui		6'b001111
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
`define norop	6'b000000
`define norfu	6'b100111
`define orop	6'b000000
`define orfu	6'b100101
`define ori		6'b001101
`define sllop	6'b000000
`define sllfu	6'b000000
`define sllvop	6'b000000
`define sllvfu	6'b000100
`define sltop	6'b000000
`define sltfu	6'b101010
`define slti	6'b001010
`define sltiu	6'b001011
`define sltuop	6'b000000
`define sltufu	6'b101011
`define sraop	6'b000000
`define srafu	6'b000011
`define sravop	6'b000000
`define sravfu	6'b000111
`define srlop	6'b000000
`define srlfu	6'b000010
`define srlvop	6'b000000
`define srlvfu	6'b000110
`define subop	6'b000000
`define subfu	6'b100010
`define subuop	6'b000000
`define subufu	6'b100011
`define sw		6'b101011
`define xorop	6'b000000
`define xorfu	6'b100110
`define xori	6'b001110
`define mtc0	11'b010000_00100
`define mfc0	11'b010000_00000
`define eret	32'b010000_1000_0000_0000_0000_0000_011000
module interpreter(
    input [31:0] instr,
    output store,
    output load,
    output cal_rExceptMuldiv,
    output cal_iExceptLui,
    output j,
    output jal,
    output jalr,
    output jr,
    output b,
    output shiftS,
    output mt,
    output mf,
    output muldiv,
    output lui,
	 output bgez,
	 output mtc0,mfc0
    );
	 wire [5:0]func,op;
	 wire [4:0]rs,rt,rd,sha;
	 assign func=instr[5:0];
	 assign op=instr[31:26];
	 assign rs=instr[25:21];
	 assign rt=instr[20:16];
	 assign rd=instr[15:11];

	 wire beq=(op==`beq);
	 assign bgez=(op==`bgezop)&(rt==`bgezrt);
	 wire bgtz=(op==`bgtz);
	 wire blez=(op==`blez);
	 wire bltz=(op==`bltzop)&(rt==`bltzrt);
	 wire bne=(op==`bne);
	 
	 assign b=beq|bne|bgez|bgtz|blez|bltz;
	 assign j=(op==`j);
	 assign jal=(op==`jal);
	 assign jalr=(op==`jalrop)&(func==`jalrfu);
	 assign jr=(op==`jrop)&(func==`jrfu);
 	
	 wire lb=(op==`lb);
	 wire lbu=(op==`lbu);
	 wire lh=(op==`lh);
	 wire lhu=(op==`lhu);
	 wire lw=(op==`lw);
	 wire sb=(op==`sb);
	 wire sh=(op==`sh);
	 wire sw=(op==`sw);
	 
	 assign lui=(op==`lui);
 	
	 wire add=(op==`addop)&(func==`addfu);
	 wire addi=(op==`addi);
	 wire addiu=(op==`addiu);
	 wire addu=(op==`adduop)&(func==`addufu);
	 wire And=(op==`andop)&(func==`andfu);
	 wire andi=(op==`andi);
	 wire div=(op==`divop)&(func==`divfu);
	 wire divu=(op==`divuop)&(func==`divufu);
	 wire mfhi=(op==`mfhiop)&(func==`mfhifu);
	 wire mflo=(op==`mfloop)&(func==`mflofu);
	 wire mthi=(op==`mthiop)&(func==`mthifu);
	 wire mtlo=(op==`mtloop)&(func==`mtlofu);
	 wire mult=(op==`multop)&(func==`multfu);
	 wire multu=(op==`multuop)&(func==`multufu);
	 wire Nor=(op==`norop)&(func==`norfu);
	 wire Or=(op==`orop)&(func==`orfu);
	 wire ori=(op==`ori);
	 wire sll=(op==6'b000000)&(func==6'b000000)&(|rd);
	 wire sllv=(op==`sllvop)&(func==`sllvfu);
	 wire slt=(op==`sltop)&(func==`sltfu);
	 wire slti=(op==`slti);
	 wire sltiu=(op==`sltiu);
	 wire sltu=(op==`sltuop)&(func==`sltufu);
	 wire sra=(op==`sraop)&(func==`srafu);
	 wire srav=(op==`sravop)&(func==`sravfu);
	 wire srl=(op==`srlop)&(func==`srlfu);
	 wire srlv=(op==`srlvop)&(func==`srlvfu);
	 wire sub=(op==`subop)&(func==`subfu);
	 wire subu=(op==`subuop)&(func==`subufu);
	 wire Xor=(op==`xorop)&(func==`xorfu);
	 wire xori=(op==`xori);
	 
	 assign mtc0=(instr[31:21]==`mtc0);
	 assign mfc0=(instr[31:21]==`mfc0);
	 
	 assign load=lb|lbu|lw|lh|lhu;
	 assign store=sb|sh|sw;
	 assign cal_rExceptMuldiv=add|addu|sub|subu|slt|sltu|sll|sllv|srlv|sra|srav|And|Or|Xor|Nor;
	 assign muldiv=mult|multu|div|divu;
	 assign mt=mtlo|mthi;
	 assign mf=mflo|mfhi;
    assign cal_iExceptLui=addi|addiu|andi|ori|xori|slti|sltiu;
    assign shiftS=sll|srl|sra;


endmodule

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
`define xorop	6'b000000
`define xorfu	6'b100110
`define xori	6'b001110

`define mtc0	11'b010000_00100
`define mfc0	11'b010000_00000
`define eret	32'b010000_1000_0000_0000_0000_0000_011000
module CTL(
    input [31:0] instr,
    output [4:0] grfWriteAddr,  //grfWriteAddress
    output [1:0] extOp,
    output [3:0] aluOp,		//+-&|^,<<,>>l,>>a,~|,<,<u
    output [2:0] memToReg,	//1:from ALU 0:from DM	2:PC+8(Jal)	3:from mulOut	4:CP0[rd]
	 output [1:0]aluB,		//1:from EXT 0:rt			2:from sha	3:from rs[4:0]
	 output aluA,				//0:from Rs  1:from Rt
    output jal,
    output jr,
	 output j,
	 output jalr,
	 output beq,
	 output bne,
	 output blez,
	 output bgtz,
	 output bltz,
	 output bgez,
	 output dmWE,
	 output [2:0] dmWidth,
	 output dmSign,
	 
	 output CP0WE,
	 output RI,
	 output aluExcIn
    );
	 wire [5:0]func,op;
	 wire [4:0]rs,rt,rd;
	 assign func=instr[5:0];
	 assign op=instr[31:26];
	 assign rs=instr[25:21];
	 assign rt=instr[20:16];
	 assign rd=instr[15:11];

	 assign beq=(op==`beq);
	 assign bgez=(op==`bgezop)&(rt==`bgezrt);
	 assign bgtz=(op==`bgtz);
	 assign blez=(op==`blez);
	 assign bltz=(op==`bltzop)&(rt==`bltzrt);
	 assign bne=(op==`bne);
	 assign j=(op==`j);
	 assign jal=(op==`jal);
	 assign jalr=(op==`jalrop)&(func==`jalrfu);
	 assign jr=(op==`jrop)&(func==`jrfu);
 	
	 wire lb=(op==`lb);
	 wire lbu=(op==`lbu);
	 wire lh=(op==`lh);
	 wire lhu=(op==`lhu);
	 wire lui=(op==`lui);
	 wire lw=(op==`lw);
	 wire sb=(op==`sb);
	 wire sh=(op==`sh);
	 wire sw=(op==`sw);
 	
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
	 
	 wire mtc0=(instr[31:21]==`mtc0);
	 wire mfc0=(instr[31:21]==`mfc0);
	 wire eret=instr==`eret;
	 
	 assign CP0WE=mtc0;
	 
	 assign aluExcIn=(add|addi|sub|lb|lbu|lh|lhu|lw|sb|sh|sw);
	 
	 assign RI=!(	
						beq|bne|bgez|bgtz|blez|bltz|
						j|jal|jalr|jr|
						lb|lbu|lh|lhu|lw|sb|sh|sw|
						lui|
						add|addi|addiu|addu|And|andi|div|divu|mfhi|mflo|mthi|mtlo|
						mult|multu|Nor|Or|ori|sll|sllv|slt|slti|sltiu|sltu|sra|
						srav|srl|srlv|sub|subu|Xor|xori|
						mtc0|mfc0|eret|
						((op==6'b000000)&(func==6'b000000))//sll,rd=0
					);


	 assign grfWriteAddr=	(add|addu|And|jalr|mfhi|mflo|Nor|Or|sll|sllv|slt|sltu
										|sra|srav|srl|srlv|sub|subu|Xor)?					rd:
									(addi|addiu|andi|lb|lbu|lh|lhu|lui|lw|ori|slti|
										sltiu|xori | mfc0)?										rt://mfc0
									(jal)?															5'd31:
																										5'd0;
			
	 assign extOp=		(addi|addiu|lb|lbu|lh|lhu|lw|sb|sh|slti|sltiu|sw)?	2'd0:
							(andi|ori|xori)?												2'd1:
							(beq|bgez|bgtz|blez|bltz|bne)?							2'd2:
							(lui)?															2'd3:2'd3;
							
							
							
	 assign aluOp=		(lb|lbu|lh|lhu|lui|lw|sb|sh|sw
								|add|addu|addi|addiu|lui)?		4'd0://ADD
							(sub|subu)?								4'd1://SUB
							(And|andi)?								4'd2://AND
							(Or|ori)?								4'd3://OR
							(Xor|xori)?								4'd4://XOR
							(sll|sllv)?								4'd5://<<
							(srl|srlv)?								4'd6://>> Logic
							(sra|srav)?								4'd7://>> Arith
							(Nor)?									4'd8://NOR
							(slt|slti)?								4'd9://<
							(sltu|sltiu)?							4'd10://<u
																		4'd11;
	 
	 assign aluA=	(sll|sllv|srl|srlv|sra|srav)?			1'd1:1'd0;
	 
	 assign aluB=	(add|addu|sub|subu|And|Or|Xor|Nor|
							slt|sltu)?								2'd0://rt
						(lb|lbu|lh|lhu|lui|lw|sb|sh|sw|
							addi|addiu|lui|andi|ori|xori|
							slti|sltiu)?							2'd1://ext
						(sll|srl|sra)?								2'd2://sha
						(sllv|srlv|srav)?							2'd3://rs[4:0]
																		2'd0;
	 assign memToReg=(lb|lbu|lh|lhu|lw)?	3'd0://DM
						  (jal|jalr)?				3'd2://PC+8
						  (mfhi|mflo)?				3'd3://mulOut
						  (mfc0)?					3'd4://CP0[rd]
														3'd1;//ALUOut
	 
	 assign dmWE=		sw|sb|sh;
	 
	 assign dmWidth=		(sw|lw)?	3'd4:
							(sh|lh|lhu)?3'd2:
											3'd1;
	 
	 assign dmSign=		(lh|lb|lw);
	 

endmodule

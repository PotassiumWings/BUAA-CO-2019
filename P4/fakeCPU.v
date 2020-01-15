`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:26:56 11/07/2019 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input clk,
    input reset
    );
	 reg [31:0]PC;
	 reg [31:0]im[0:1023],grf[31:0],dm[0:1023];
	 wire [31:0]instr;
	 wire [5:0]func,op;
	 wire [4:0]rs,rt,rd;
	 wire [15:0]imm;
	 wire [31:0]dmaddr;
	 
	 assign func=instr[5:0];
	 assign op=instr[31:26];
	 assign rs=instr[25:21];
	 assign rt=instr[20:16];
	 assign rd=instr[15:11];
	 assign imm=instr[15:0];
	 assign dataJal=instr[25:0];
	 assign instr=im[PC[11:2]];
	 assign dmaddr=grf[rs]+{{16{imm[15]}},imm};//to be changed
	 
	 wire addu,subu,ori,lw,sw,beq,lui,jal,jr,j;
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
	 
	 wire jump;
	 assign jump=j|jal|jr|(beq&&(grf[rs]==grf[rt]));//yanchicao
	 reg flag;
	 integer jumppc;
	 
	 integer i;
	 
	 initial begin
		  PC<=32'h3000;
		  flag<=0;
		  for(i=0;i<1024;i=i+1)begin
				dm[i]=0;
		  end
		  for(i=0;i<32;i=i+1)begin
			   grf[i]=0;
		  end
	     $readmemh("code.txt",im);
	 end
	 
	 always@(posedge clk or posedge reset)begin
        if(reset)begin
				PC=32'h3000;
				flag<=0;
		      for(i=0;i<1024;i=i+1)begin
					 dm[i]=0;
				end
				for(i=0;i<32;i=i+1)begin
					 grf[i]=0;
				end
		  end
		  else begin
			   if(flag==1)begin
				   flag<=0;
					PC=jumppc;
				end
				
				if(jump)begin
				   flag<=1;
					if(beq)begin
						 if(grf[rs]==grf[rt])begin
							 jumppc=PC+{{14{imm[15]}},imm,2'b0}+4;
						 end
					end
					else if(jal)begin
						 grf[31]=PC+4 +4;//ycc
						 $display("@%h: $%d <= %h", PC, 5'd31, grf[31]);
						 jumppc={PC[31:28],imm,2'b0};//-4;
					end
					else if(jr)begin
						 jumppc=grf[rs];//-4;
					end
					else if(j)begin
						 jumppc={PC[31:28],imm,2'b0};//-4;
					end
				end
				else begin
					if(addu)begin
						 if(rd!=0)begin
							 grf[rd]=grf[rs]+grf[rt];
							 $display("@%h: $%d <= %h", PC, rd, grf[rd]);
						 end
					end
					else if(subu)begin
						 if(rd!=0)begin
							 grf[rd]=grf[rs]-grf[rt];
							 $display("@%h: $%d <= %h", PC, rd, grf[rd]);
						 end
					end
					else if(ori)begin
						 if(rt!=0)begin
							 grf[rt]=grf[rs]|({16'b0,imm});
							 $display("@%h: $%d <= %h", PC, rt, grf[rt]);
						 end
					end
					else if(lw)begin
						 if(rt!=0)begin
							 grf[rt]=dm[dmaddr[11:2]];
							 $display("@%h: $%d <= %h", PC, rt, grf[rt]);
						 end
					end
					else if(sw)begin
						 dm[dmaddr[11:2]]=grf[rt];
						 $display("@%h: *%h <= %h", PC, dmaddr, dm[dmaddr[11:2]]);
					end
					else if(lui)begin
						 if(rt!=0)begin
							 grf[rt]={imm,16'b0};
							 $display("@%h: $%d <= %h", PC, rt, grf[rt]);
						 end
					end
					else if(beq)begin
						 if(grf[rs]==grf[rt])begin
							 PC=PC+{{14{imm[15]}},imm,2'b0};
						 end
					end
					else if(jal)begin
						 grf[31]=PC+4 +4;
						 $display("@%h: $%d <= %h", PC, 5'd31, grf[31]);
						 PC={PC[31:28],imm,2'b0}-4;
					end
					else if(jr)begin
						 PC=grf[rs]-4;
					end
					else if(j)begin
						 PC={PC[31:28],imm,2'b0}-4;
					end
				end
				
				PC=PC+4;
		  end
	 end
	 
	 
	 
endmodule

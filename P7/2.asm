#initialize
li $4,0x98765432
li $5,0x23456789
li $6,0xfedcba98
addi $8,$4,0x7654
addi $9,$4,0xfedc
addiu $10,$4,0x7654
addiu $11,$4,0xfedc
andi $12,$5,0x7654
ori $13,$5,0x7654
xori $14,$5,0x7654
lui $15,0x7654
slti $16,$4,-32765
sltiu $17,$4,-32765
nop
nop
nop
nop
nop
#start

#addi/addiu
addi $7,$4,0x7654
beq $7,$8,label1
nop
ori $1,$0,1
label1:
addi $7,$4,0xfedc
beq $7,$9,label2
nop
ori $1,$1,2
label2:
addiu $7,$4,0x7654
beq $7,$10,label3
nop
ori $1,$0,4
label3:
addiu $7,$4,0xfedc
bne $7,$11,label4
nop
ori $1,$1,8
label4:

#andi/ori/xori
andi $7,$5,0x7654
bne $7,$12,label5
nop
ori $1,$0,4
label5:
ori $7,$5,0x7654
beq $7,$13,label6
nop
ori $1,$1,8
label6:
xori $7,$5,0x7654
bne $7,$14,label7
nop
ori $1,$0,4
label7:

#lui,slti,sltiu
slti $7,$4,-32765
beq $7,$16,label8
nop
ori $1,$0,4
label8:
sltiu $7,$4,-32765
beq $7,$17,label9
label9:
beq $0,$0,label9
nop

#initialize
li $2,0x3000
li $3,0x0004
#start

#addi/addiu
add $4,$2,$3
addiu $4,$4,16#line 10
jr $4
xori $1,$1,1
addiu $4,$4,12#line 13
jr $4
xori $1,$1,1

#andi/ori/xori
ori $4,$4,12#line 18 3024->302c
jr $4
xori $1,$1,1
li $4,0xffffffff
andi $4,$4,0x303c#line 21 3034->303c
jr $4
xori $1,$1,1
xori $4,$4,0x70#line 24 3044->304c
jalr $10,$4
xori $1,$1,1

#lui,slti,sltiu
#这个测不了

#add/sub
li $12,16
add $4,$4,$12
jalr $10,$4
xori $1,$1,1
li $12,-16
sub $4,$4,$12
jalr $10,$4
xori $1,$1,1

#addu/subu
li $12,16
addu $4,$4,$12
jalr $10,$4
xori $1,$1,1
li $12,-16
subu $4,$4,$12
jalr $10,$4
xori $1,$1,1

#slt/sltu
#没法测

#sll,srl,sra,sllv,srlv,srav
#srl,sra
li $12,0x309c0
srl $4,$12,4
jalr $10,$4
xori $1,$1,1
li $12,0x30b00
sra $4,$12,4
jalr $10,$4
xori $1,$1,1
#sll,sllv
li $12,0x30c
sll $4,$12,4
jalr $10,$4
xori $1,$1,1
li $12,0xc38
li $13,0x77777702
nop
nop
sllv $4,$12,$13
jalr $10,$4
xori $1,$1,1
#srlv,srav
li $12,0xc3c0
srlv $4,$12,$13
jalr $10,$4
xori $1,$1,1
li $12,0xc400
srav $4,$12,$13
jalr $10,$4
xori $1,$1,1

#now:3100(line 83)

#and,or,nor,xor
li $12,0x3110
li $13,4
or $4,$12,$13
jalr $10,$4
xori $1,$1,1
li $14,0x34
xor $4,$12,$14
jalr $10,$4
xori $1,$1,1

#mflo,mfhi
li $15,0x313c
li $16,0x1
mult $15,$16
mflo $4
jalr $10,$4
xori $1,$1,1
li $15,0x315c000
li $16,0x100000
mult $15,$16
mfhi $4
jalr $10,$4
xori $1,$1,1
end:
beq $0,$0,end
nop

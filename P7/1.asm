#initialize
li $4,0x98765432
li $5,0x23456789
li $6,0xfedcba98
li $10,1
li $9,0
add $3,$4,$5
addu $2,$4,$6
and $11,$4,$5
or $12,$5,$4
nor $13,$4,$5
xor $14,$4,$5
move $31,$0
mult $4,$6
mfhi $15
mflo $16
multu $4,$6
mfhi $17
mflo $18
div $4,$6
mfhi $19
mflo $20
divu $4,$6
mfhi $21
mflo $22
nop
nop
nop
nop
nop
#start

#add/sub,beq/bne
add $7,$5,$4
beq $7,$3,label1
nop
ori $1,$0,1
label1:
sub $7,$7,$5
beq $7,$4,label2
nop
ori $1,$1,2
label2:

#addu/subu,beq/bne
addu $7,$6,$4
beq $7,$2,label3
nop
ori $1,$0,4
label3:
subu $7,$7,$6
bne $7,$4,label4
nop
ori $1,$1,8
label4:

#slt/sltu,beq/bne
slt $7,$6,$5#1
bne $7,$10,label5
nop
ori $1,$0,4
label5:
slt $7,$5,$4#0
beq $7,$10,label6
nop
ori $1,$1,8
label6:
sltu $7,$5,$4#1
bne $7,$10,label7
nop
ori $1,$0,4
label7:
sltu $7,$6,$5#0
bne $7,$10,label8
nop
ori $1,$1,8
label8:

#slt/sltu,blez/bltz/bgez/bgtz
slt $7,$6,$5#1
blez $7,label9
nop
ori $1,$0,4
label9:
slt $7,$5,$4#0
blez $7,label10
nop
ori $1,$1,8
label10:
sltu $7,$5,$4#1
bgtz $7,label11
nop
ori $1,$0,4
label11:
sltu $7,$6,$5#0
bgtz $7,label12
nop
ori $1,$1,8
label12:

#sll,srl,sra,sllv,srlv,srav
sll $7,$4,3#<0
bgez $7,label13
nop
ori $1,$0,1
label13:
srl $7,$4,1
bgez $7,label14#>0
nop
ori $1,$1,2
label14:
sra $7,$6,14#<0
blez $7,label15
nop
ori $1,$0,1
label15:
sllv $7,$4,$4#>0
blez $7,label16
nop
ori $1,$0,1
label16:
srav $7,$6,$6#>0
bgtz $7,label17
nop
ori $1,$1,2
label17:
srlv $7,$6,$6
bgtz $7,label18#<0
nop
ori $1,$0,1
label18:
srlv $7,$5,$4
bltz $7,label19#>0
nop
ori $1,$1,2
label19:
srav $7,$4,$5
bltz $7,label20
nop
ori $1,$0,1
label20:

#and,or,nor,xor
and $7,$4,$5
beq $7,$11,label21
nop
ori $1,$0,1
label21:
or $7,$4,$5
beq $7,$12,label22
nop
ori $1,$0,1
label22:
nor $7,$4,$5
beq $7,$13,label23
nop
ori $1,$0,1
label23:
xor $7,$4,$5
beq $7,$14,label24
nop
ori $1,$0,1
label24:

#mflo,mfhi
mult $4,$6

mfhi $7
beq $7,$15,mul1
nop
xori $1,$1,1
mul1:
mflo $7
beq $7,$16,mul2
nop
xori $1,$1,1
mul2:

multu $4,$6

mfhi $7
beq $7,$17,mul3
nop
xori $1,$1,1
mul3:
mflo $7
beq $7,$18,mul4
nop
xori $1,$1,1
mul4:


div $4,$6

mfhi $7
beq $7,$19,div1
nop
xori $1,$1,1
div1:
mflo $7
beq $7,$20,div2
nop
xori $1,$1,1
div2:

divu $4,$6

mfhi $7
beq $7,$21,div3
nop
xori $1,$1,1
div3:
mflo $7
beq $7,$18,div4
nop
xori $1,$1,1
div4:
beq $0,$0,div4
nop
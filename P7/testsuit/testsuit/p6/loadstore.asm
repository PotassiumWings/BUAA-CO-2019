li $2,0x12345678#data
li $4,0x0000f000
li $5,0x00008001
li $6,0x0000affe
li $7,0x0000affd
li $8,0x0000affb
sb $2,0xffff8001($6)
sb $2,0xffffaffe($5)
sh $2,0xffff8001($7)
sh $2,0xffffaffd($5)
sw $2,0xffff8001($8)
sw $2,0xffffaffd($5)#exception
sw $2,0xffffaffb($5)
sw $2,0xfffffeff($5)
li $6,0x7f00
sw $2,0($6)
addiu $6,$6,4
sw $2,0($6)
addi $6,$6,4
sw $2,0($6)
addi $6,$6,4
sw $2,0($6)
addiu $6,$6,4
sw $2,0($6)
addi $6,$6,4
sw $2,0($6)
addi $6,$6,4
sw $2,0($6)
addiu $6,$6,4
sw $2,0($6)
addi $6,$6,4
lw $2,0xfffffeff($5)
lw $2,0x7f00($0)
lw $2,0x7f04($0)
lw $2,0x7f08($0)
lw $2,0x7f0c($0)
lw $2,0x7f10($0)
lw $2,0x7f14($0)
lw $2,0x7f18($0)
lw $2,0x7f1c($0)

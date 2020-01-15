.ktext 0x4180
kstart:
li $k0, 0xe01c
mfc0 $k0, $13
mfc0 $k1, $14
addiu $k1, $k1, 4
mtc0 $k1, $14
eret
j kstart

.text
li $2, 0x5010
li $3, 0x1013
sw $2, 0($3)
lui $12, 0x1111
lw $4, 0($3)
lui $13, 0x2222
lw $5, -1($3)
lui $14, 0x3333
sw $2, 0($2)
lui $15, 0x4444
lw $3, 0($2)
lui $16, 0x5555
lw $3, 0($2)
lui $16, 0x5666

li $3, 0x0002
sw $2, 0($3)
lw $2, 0($3)
li $3, 0x0001
sw $2, 0($3)
lui $17, 0x6666
lw $2, 0($3)
lui $18, 0x7777

li $3, 0x7f10
lw $4, ($3)
lw $5, 4($3)
lw $6, 8($3)
lw $7, 7($3)
lui $19, 0x8888
lh $8, 7($3)
lui $20, 0x9999
lh $9, 6($3)
lui $21, 0xaaaa
lb $4, 6($3)
lui $22, 0xbbbb
sb $2, 0($3)
lui $23, 0xcccc
sh $2, 2($3)
lui $24, 0xdddd
sw $2, 8($3)
lui $25, 0xeeee
li $3, 0x7fffffff
lw $2, 0x7fff($3)
sw $2, 0x7fff($3)
lui $11, 0xffff







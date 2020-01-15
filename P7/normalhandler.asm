.ktext 0x4180
mfc0 $1,$14
addi $1,$1,4
mtc0 $1,$14
li $5,0x98765432
li $6,0xfedcba98
div $5,$6
eret
mflo $7
eret

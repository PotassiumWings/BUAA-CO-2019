li $5,0x80000001
add $6,$5,$5
lw $6,0($5)
label:
beq $0,$0,label
nop

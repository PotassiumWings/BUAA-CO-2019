.text
ori $3,$0, 0x0c01
mtc0 $3,$12
li $3,9
sw $3,0x7f00($0)
li $3,20
sw $3,0x7f04($0)
label:
beq $0,$0,label
nop

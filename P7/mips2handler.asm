.ktext 0x4180
mfc0 $8,$14
addi $8,$8,14
xori $8,$5,0x2347
beq $0,$0,next
nop
xori $1,$1,1
next:
mtc0 $0,$14
nop
nop
nop
li $7,0x3004
mtc0 $7,$14
eret
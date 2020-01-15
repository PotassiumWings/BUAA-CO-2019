.ktext 0x00004180
mfc0 $k0, $13
mfc0 $k1, $14
beq $0, $0, save_scene
nop

branches:
andi $t0, $t3, 0x80000000
beq $t0, $0, no_branch
nop
beq $0, $0, with_branch
nop

with_branch:
addi $k1, $k1, 4

no_branch:
andi $t0, $k0, 0xfc
ori $t2, $0, 48
beq $t0, $t2, ov
nop
ori $t2, $0, 16
beq $t0, $t2, adel
nop
ori $t2, $0, 20
beq $t0, $t2, ades
nop
ori $t2, $0, 40
beq $t0, $t2, ir
nop
beq $t0, $0, int
nop
beq $0, $0, finish
nop

ov:
li $s0, 0x12121212
beq $0, $0, finish
nop

adel:
andi $t0, $k1, 3
beq $t0, $0, aligned
nop
andi $t0, $k1, 0xffffffc
move $k1, $t0
aligned:
li $s0, 0x04040404
beq $0, $0, finish
nop

ades:
li $s0, 0x05050505
beq $0, $0, finish
nop

ir:
li $s0, 0x10101010
beq $0, $0, finish
nop

int:
addiu $k1, $k1, -4
mtc0 $k1, $14
andi $t0, $k0, 0xc00
li $t1, 0x400
beq $t0, $t1, clock1
li $s3, 0

li $t1, 0x800
beq $t0, $t1, clock2
li $s3, 0
#both clock
li $s3, 1
li $t1, 0xc00
beq $t0, $t1, clock1
nop

clock1:
li $s0, 0x7f00
beq $0, $0, reset_clock
nop

clock2:
li $s0, 0x7f10
beq $0, $0, reset_clock
nop

reset_clock:
lw $t0, 0($s0)
andi $t0, 0xfffffffe
sw $t0, 0($s0)
lw $t1, 4($s0)
li $t0, 1000
beq $t1, $t0, dead_clock
nop
addiu $t1, $t1, 100
sw $t1, 4($s0)
lw $t0, 0($s0)
ori $t0, 1
sw $t0, 0($s0)
beq $0, $0, finish
nop
dead_clock:
li $t0, 1
beq $s3, $t0, clock2
li $s3, 0
beq $0, $0, finish

finish:
addiu $k1, $k1, 4
mtc0 $k1, $14
beq $0, $0, load_scene
nop

end:
eret
ori $s0, $0, 233

save_scene:
addiu $sp, $sp, -120
sw $11, 0($sp)
sw $2, 4($sp)
sw $3, 8($sp)
sw $4, 12($sp)
sw $5, 16($sp)
sw $6, 20($sp)
sw $7, 24($sp)
sw $8, 28($sp)
sw $9, 32($sp)
sw $10, 36($sp)
sw $11, 40($sp)
sw $12, 44($sp)
sw $13, 48($sp)
sw $14, 52($sp)
sw $15, 56($sp)
sw $16, 60($sp)
sw $17, 64($sp)
sw $18, 68($sp)
sw $19, 72($sp)
sw $20, 76($sp)
sw $21, 80($sp)
sw $22, 84($sp)
sw $23, 88($sp)
sw $24, 92($sp)
sw $25, 96($sp)
sw $28, 108($sp)
sw $31, 112($sp)
sw $30, 116($sp)
beq $0, $0, branches
nop

load_scene:
lw $1, 0($sp)
lw $2, 4($sp)
lw $3, 8($sp)
lw $4, 12($sp)
lw $5, 16($sp)
lw $6, 20($sp)
lw $7, 24($sp)
lw $8, 28($sp)
lw $9, 32($sp)
lw $10, 36($sp)
lw $11, 40($sp)
lw $12, 44($sp)
lw $13, 48($sp)
lw $14, 52($sp)
lw $15, 56($sp)
lw $16, 60($sp)
lw $17, 64($sp)
lw $18, 68($sp)
lw $19, 72($sp)
lw $20, 76($sp)
lw $21, 80($sp)
lw $22, 84($sp)
lw $23, 88($sp)
lw $24, 92($sp)
lw $25, 96($sp)
lw $28, 108($sp)
lw $31, 112($sp)
lw $30, 116($sp)
addiu $sp, $sp, 120
beq $0, $0, end
nop

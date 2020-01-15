#multiplies and stalls and forwarding
.text
li $sp, 0xffc

mfc0 $t0, $12
ori $t0, 0xfc01
mtc0 $t0, $12
li $t0, 0x7f00
lw $t1, 0($t0)
lw $t2, 4($t0)
lw $t3, 8($t0)
ori $t1, 9
li $t2, 100
sw $t2, 4($t0)
sw $t1, 0($t0)
sw $t3, 8($t0)	#ades
sh $t3, 0($t0)	#ades
sb $t3, 0($t0)	#ades
sw $t3, 2($t0)	#ades
lh $t3, 2($t0)	#adel
lhu $t3, 0($t0)	#adel
lb $t3, 0($t0)	#adel
lbu $t3, 0($t0)	#adel
lw $t3, 2($t0)	#adel

li $t0, 233
li $t1, 332
mult $t0, $t1
mfhi $s0
mflo $s1
multu $t1, $t0
mfhi $s0
mflo $s1
div $t1, $t0
mfhi $s0
mflo $s1
divu $t0, $t1
mfhi $s0
mflo $s1

li $t0, -1
li $t1, -1
mult $t0, $t1
mfhi $s0
mflo $s1
multu $t0, $t1
mfhi $s0
mflo $s1
div $t0, $t1
mfhi $s0
mflo $s1
divu $t0, $t1
mfhi $s0
mflo $s1

li $t0, 0x80000000
li $t1, 0xffffffff
mult $t0, $t1
mfhi $s0
mflo $s1
multu $t0, $t1
mfhi $s0
mflo $s1
div $t0, $t1
mfhi $s0
mflo $s1
divu $t0, $t1
mfhi $s0
mflo $s1

li $t0, -1
li $t1, 2147483647
mult $t0, $t1
mfhi $s0
mflo $s1
multu $t0, $t1
mfhi $s0
mflo $s1
div $t0, $t1
mfhi $s0
mflo $s1
divu $t0, $t1
mfhi $s0
mflo $s1

li $t0, 233
li $t1, -1
mult $t0, $t1
mult $t1, $t0
mthi $t0
mfhi $t0
div $t0, $t1
mflo $t0
mfhi $t1
mtlo $t1
mult $t0, $t1
mthi $t1
mfhi $t2
mthi $t0
mthi $t2

li $t0, 0x7fffffff
li $t1, 1
add $t2, $t0, $t1
mult $t0, $t1

add $t2, $t0, $t1
div $t0, $t1

add $t2, $t0, $t1
multu $t0, $t1

add $t2, $t0, $t1
divu $t0, $t1

add $t2, $t0, $t1
mthi $t0

add $t2, $t0, $t1
mtlo $t0

add $t2, $t0, $t1
mfhi $t2

add $t2, $t0, $t1
mflo $t2

mult $t0, $t1
add $t2, $t0, $t1

div $t0, $t1
add $t2, $t0, $t1

multu $t0, $t1
add $t2, $t0, $t1

divu $t0, $t1
add $t2, $t0, $t1

li $t0, 0x7fffffff
move $t1, $t0

j L1
add $t2, $t1, $t0	#ov in ds
L1:
la $t0, L11
addi $t0, $t0, 2
li $s0, 1
L11:
sw $t0, 2($0)		#ades
sw $t0, 0($0)
lw $t0, 2($0)		#adel
lw $t0, 0($0)
beq $s0, $0, L2
nop
jr $t0				#then adel
addiu $s0, $s0, -1
L2:
syscall				#ir
li $t0, 0x80000000
li $t1, 1
sub $t2, $t0, $t1	#ov
li $t1, 0x80000000
add $t2, $t0, $t1	#ov
sub $t2, $t0, $t1	#noov
sub $t2, $0, $t1	#ov

li $t0, 0x7fffffff
li $t1, 1
add $t2, $t0, $t1	#ov
addi $t2, $t0, 1	#ov
addi $t2, $t0, -1	#noov
sub $t2, $0, $t0	#noov
sub $t2, $t0, $t1
sub $t2, $t1, $t0

li $t0, 0
li $t1, 1
add $t2, $t0, $t1
sub $t2, $t0, $t1
sub $t2, $t1, $t0

li $t0, 0x7f10
lw $t1, 0($t0)
lw $t2, 4($t0)
lw $t3, 8($t0)
ori $t1, 11
li $t2, 100
sw $t2, 4($t0)
sw $t1, 0($t0)
sw $t3, 8($t0)	#ades
lw $t3, 2($t0)	#adel
sw $t3, 6($t0)	#ades

li $t0, 0x12345678
sw $t0, 0($0)
sw $t0, 2($0)	#ades
sh $t0, 2($0)
sh $t0, 3($0)	#ades
sb $t0, 1($0)
lw $t1, 0($0)
lw $t1, 2($0)	#adel
lh $t1, 2($0)	#adel
lh $t1, 1($0)	#adel
lhu $t1, 1($0)	#adel
lb $t1, -1($0)	#adel
lbu $t1, -2($0)	#adel

#addi
li $t0, 0x80000000
addi $t1, $t0, -1	#ov

#beq
li $t0, 123
move $t1, $t0
beq $t1, $t0, B1
nop
li $s0, 233
B1:
li $s1, 0x1111
addi $t0, $t0, 1
beq $t0, $t1, B2
nop
li $s1, 0x2222
B2:

#bgez
li $t0, 0
bgez $t0, B3
nop
li $s0, 233
B3:
li $s1, 0x3333
li $t0, -1
bgez $t0, B4
nop
li $s1, 0x4444
B4:
li $t0, 1
bgez $t0, B5
nop
li $s0, 233
B5:
li $s1, 0x5555

#bgtz
li $t0, 0
bgtz $t0, B6
nop
li $s1, 0x6666
B6:
li $t0, -1
bgtz $t0, B7
nop
li $s1, 0x7777
B7:
li $t0, 1
bgtz $t0, B8
nop
li $s0, 233
B8:
li $s1, 0x8888

#blez
li $t0, 0
blez $t0, B9
nop
li $s0, 233
B9:
li $s1, 0x9999
li $t0, -1
blez $t0, B10
nop
li $s0, 233
B10:
li $s1, 0x1010
li $t0, 1
blez $t0, B11
nop
li $s1, 0x1111
B11:

#bltz
li $t0, 0
bltz $t0, B12
nop
li $s1, 0x1212
B12:
li $t0, -1
bltz $t0, B13
nop
li $s0, 233
B13:
li $s1, 0x1313
li $t0, 1
bltz $t0, B14
nop
li $s1, 0x1414
B14:

#bne
li $t0, -1
move $t1, $t0
bne $t1, $t0, B15
nop
li $s1, 0x1515
B15:
li $t0, 1
bne $t0, $t1, B16
nop
li $s0, 233
B16:
li $s1, 0x1616

#j
j B17
nop
li $s0, 233
B17:
#jal
jal B18
li $s0, 1
B18:
beq $s0, $0, B19
nop
#jalr
jalr $s1, $ra
addi $s0, $s0, -1
B19:

li $t0, 0xa23486ff
sw $t0, 4($0)
lb $t0, 5($0)
lbu $t0, 5($0)
lh $t0, 6($0)
lhu $t0, 6($0)
lb $t0, 4($0)
sh $t0, 6($0)
sb $t0, 7($0)
lui $t0, 0x8000

#logics
li $t0, 3
li $t1, 5
and $t2, $t0, $t1
andi $t2, $t0, 5
or $t2, $t0, $t1
ori $t2, $t0, 5
nor $t2, $t0, $t1
xor $t2, $t0, $t1

#shifts
li $t0, 0x87654321
li $t1, 0xa00a
sll $t2, $t0, 10
srl $t2, $t0, 10
sra $t2, $t0, 10
sllv $t2, $t0, $t1
srlv $t2, $t0, $t1
srav $t2, $t0, $t1

li $t0, 0
li $t1, 1
li $t2, -1
slt $t3 $t0 $t2
slt $t3 $t0 $t1
slt $t3 $t1 $t0
slt $t3 $t1 $t2
slt $t3 $t2 $t1
slt $t3 $t2 $t0
sltu $t3 $t0 $t2
sltu $t3 $t0 $t1
sltu $t3 $t1 $t0
sltu $t3 $t1 $t2
sltu $t3 $t2 $t1
sltu $t3 $t2 $t0
slti $t3 $t0 -1
slti $t3 $t0 0
slti $t3 $t0 1
slti $t3 $t1 -1
slti $t3 $t1 0
slti $t3 $t1 1
slti $t3 $t2 -1
slti $t3 $t2 0
slti $t3 $t2 1
sltiu $t3 $t0 -1
sltiu $t3 $t0 0
sltiu $t3 $t0 1
sltiu $t3 $t1 -1
sltiu $t3 $t1 0
sltiu $t3 $t1 1
sltiu $t3 $t2 -1
sltiu $t3 $t2 0
sltiu $t3 $t2 1

li $s0, 0x233
dead_loop:
beq $0, $0, dead_loop
nop

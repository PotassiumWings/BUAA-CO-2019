.data
	vis:	.space	256
	mt:	.space	256
.macro 	getindex(%ans,%i,%j)
		sll %ans,%i,3
		add %ans,%ans,%j
		sll %ans,%ans,2
.end_macro

.text
li $k0 1
li $k1 0

li $v0,5
syscall
move $s0,$v0

li $v0,5
syscall
move $s1,$v0

li $t0,0
loop_i:
	beq $t0,$s0,loop_i_out
	li $t1,0
	loop_j:
		beq $t1,$s1,loop_j_out
		
		li $v0,5
		syscall
		getindex($t2,$t0,$t1)
		sw $v0,mt($t2)
		
		add $t1,$t1,1
		j loop_j
		loop_j_out:
	add $t0,$t0,1
	j loop_i
loop_i_out:

li $v0,5
syscall
move $s2,$v0
sub $s2,$s2,1

li $v0,5
syscall
move $s3,$v0
sub $s3,$s3,1

li $v0,5
syscall
move $s4,$v0
sub $s4,$s4,1

li $v0,5
syscall
move $s5,$v0
sub $s5,$s5,1

move $s6,$s2
move $s7,$s3
jal dfs

move $a0,$t8
li $v0,1
syscall

li $v0,10
syscall

dfs:
	#yuejie
	bge $s6,$s0,go_back
	bge $s7,$s1,go_back
	bltz $s6,go_back
	bltz $s7,go_back
	
	#vis
	getindex($t2,$s6,$s7)
	lw $t3,mt($t2)
	bnez $t3,go_back
	lw $t3,vis($t2)
	bnez $t3,go_back
	
	sw $k0,vis($t2)
	
	#arrived
	bne $s6,$s4,work
	bne $s7,$s5,work
	add $t8,$t8,1
	j work
	
	go_back:
		jr $31
	
work:
	sw $ra,0($sp)
	sub $sp,$sp,4
	sw $s6,0($sp)
	sub $sp,$sp,4
	sw $s7,0($sp)
	sub $sp,$sp,4
		add $s6,$s6,1
		jal dfs
	add $sp,$sp,4
	lw $s7,0($sp)
	add $sp,$sp,4
	lw $s6,0($sp)
	add $sp,$sp,4
	lw $ra,0($sp)
	
	
	sw $ra,0($sp)
	sub $sp,$sp,4
	sw $s6,0($sp)
	sub $sp,$sp,4
	sw $s7,0($sp)
	sub $sp,$sp,4
		sub $s6,$s6,1
		jal dfs
	add $sp,$sp,4
	lw $s7,0($sp)
	add $sp,$sp,4
	lw $s6,0($sp)
	add $sp,$sp,4
	lw $ra,0($sp)
	
	
	sw $ra,0($sp)
	sub $sp,$sp,4
	sw $s6,0($sp)
	sub $sp,$sp,4
	sw $s7,0($sp)
	sub $sp,$sp,4
		add $s7,$s7,1
		jal dfs
	add $sp,$sp,4
	lw $s7,0($sp)
	add $sp,$sp,4
	lw $s6,0($sp)
	add $sp,$sp,4
	lw $ra,0($sp)
	
	
	sw $ra,0($sp)
	sub $sp,$sp,4
	sw $s6,0($sp)
	sub $sp,$sp,4
	sw $s7,0($sp)
	sub $sp,$sp,4
		sub $s7,$s7,1
		jal dfs
	add $sp,$sp,4
	lw $s7,0($sp)
	add $sp,$sp,4
	lw $s6,0($sp)
	add $sp,$sp,4
	lw $ra,0($sp)
	
	getindex($t2,$s6,$s7)
	sw $0,vis($t2)
	
	jr $31
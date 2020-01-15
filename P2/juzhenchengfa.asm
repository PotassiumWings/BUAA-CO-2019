.data
	a:	.space 256
	b:	.space 256
	c:	.space 256
	str_enter:	.asciiz"\n"
	str_space:	.asciiz" "
	
.macro 	getindex(%ans,%i,%j)
		sll %ans,%i,3
		add %ans,%ans,%j
		sll %ans,%ans,2
.end_macro

.text
	li $v0,5
	syscall
	move $t3,$v0
		
	
li $t0,0
loop_i:
	li $t1,0
	beq $t0,$t3,loop_i_out
	loop_j:
		beq $t1,$t3,loop_j_out
		
		li $v0,5
		syscall
		getindex($t4,$t0,$t1)
		sw $v0,a($t4)
		
		add $t1,$t1,1
		j loop_j
	loop_j_out:
	add $t0,$t0,1
	j loop_i
loop_i_out:

li $t0,0
loop2_i:
	li $t1,0
	beq $t0,$t3,loop2_i_out
	loop2_j:
		beq $t1,$t3,loop2_j_out
		
		li $v0,5
		syscall
		getindex($t4,$t0,$t1)
		sw $v0,b($t4)
		
		add $t1,$t1,1
		j loop2_j
	loop2_j_out:
	add $t0,$t0,1
	j loop2_i
loop2_i_out:

li $t0,0
loop3_i:
	li $t1,0
	beq $t0,$t3,loop3_i_out
	loop3_j:
		beq $t1,$t3,loop3_j_out
		
		getindex($t4,$t0,$t1)
		li $t2,0
		loop3_k:
			beq $t2,$t3,loop3_k_out
			
			getindex($t5,$t0,$t2)
			getindex($t6,$t2,$t1)
			lw $s0,a($t5)
			lw $s1,b($t6)
			mul $s0,$s0,$s1
			lw $s2,c($t4)
			add $s2,$s2,$s0
			sw $s2,c($t4)
			
			add $t2,$t2,1
			j loop3_k
		loop3_k_out:
		add $t1,$t1,1
		j loop3_j
	loop3_j_out:
	add $t0,$t0,1
	j loop3_i
loop3_i_out:

li $t0,0
loop4_i:
	beq $t0,$t3,loop4_i_out
	li $t1,0
	loop4_j:
		beq $t1,$t3,loop4_j_out
		
		getindex($t4,$t0,$t1)
		lw $a0,c($t4)
		li $v0,1
		syscall
		
		la $a0,str_space
		li $v0,4
		syscall
		
		add $t1,$t1,1
		j loop4_j
	loop4_j_out:
	add $t0,$t0,1
	
	la $a0,str_enter
	li $v0,4
	syscall
	
	j loop4_i
loop4_i_out:
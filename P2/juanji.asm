.data
	a:	.space 576
	b:	.space 576
	c:	.space 576
	enter:	.asciiz"\n"
	space:	.asciiz" "
.macro	getindex(%ans,%i,%j)
		mul %ans,%i,12
		add %ans,%ans,%j
		sll %ans,%ans,2
.end_macro
	
.text

li $v0,5
syscall
move $s0,$v0

li $v0,5
syscall
move $s1,$v0

li $v0,5
syscall
move $s2,$v0

li $v0,5
syscall
move $s3,$v0

li $t0,0
loop1_i:
	beq $t0,$s0,loop1_i_out
	li $t1,0
	loop1_j:
		beq $t1,$s1,loop1_j_out
		li $t2,0
		
		getindex($s7,$t0,$t1)
		li $v0,5
		syscall
		sw $v0,a($s7) 
		
		add $t1,$t1,1
		j loop1_j
	loop1_j_out:
	add $t0,$t0,1
	j loop1_i
loop1_i_out:

li $t0,0
loop2_i:
	beq $t0,$s2,loop2_i_out
	li $t1,0
	loop2_j:
		beq $t1,$s3,loop2_j_out
		li $t2,0
		
		getindex($s7,$t0,$t1)
		li $v0,5
		syscall
		sw $v0,b($s7) 
		
		add $t1,$t1,1
		j loop2_j
	loop2_j_out:
	add $t0,$t0,1
	j loop2_i
loop2_i_out:

move $k0,$s0
sub $k0,$k0,$s2
add $k0,$k0,1
move $k1,$s1
sub $k1,$k1,$s3
add $k1,$k1,1

li $t0,0
loop_i:
	beq $t0,$k0,loop_i_out
	li $t1,0
	loop_j:
		beq $t1,$k1,loop_j_out
		li $t2,0
		
		getindex($s7,$t0,$t1)#cij
		
		loop_k:
			beq $t2,$s2,loop_k_out
			li $t3,0
			loop_l:
				beq $t3,$s3,loop_l_out
				
					move $s5,$t0
					add $s5,$s5,$t2
					move $s6,$t1
					add $s6,$s6,$t3
					getindex($s4,$s5,$s6)
					lw $t4,a($s4)# $t4=a[i+k][j+l]
					
					move $s5,$t2
					move $s6,$t3
					getindex($s4,$s5,$s6)
					lw $t5,b($s4)# $t5=b[k][l]
					
					mul $t4,$t4,$t5 #t4=** * **
					
					lw $t6,c($s7)# c[i][j]
					add $t6,$t6,$t4
					sw $t6,c($s7)
					
				add $t3,$t3,1
				j loop_l
			loop_l_out:
			add $t2,$t2,1
			j loop_k
		loop_k_out:
		
		lw $t6,c($s7)
		move $a0,$t6
		li $v0,1
		syscall
		
		la $a0,space
		li $v0,4
		syscall
		
		add $t1,$t1,1
		j loop_j
	loop_j_out:
	add $t0,$t0,1
	
	la $a0,enter
	li $v0,4
	syscall
	
	j loop_i
loop_i_out:


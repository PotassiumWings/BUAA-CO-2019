.data
	array_a: .space 1000
	array_b: .space 1000
	array_c: .space 1000
	str_space: .asciiz" "
	str_enter: .asciiz"\n"

.text

	#t0:i 	t1:j
	#s0:n	s1:m
	#t2:top t3:x
	#t4:tempaddress

li $v0,5
syscall
move $s0,$v0#in n 

li $v0,5
syscall
move $s1,$v0#in m
	
in_i:
	beq $t0,$s0,in_i_end
	li $t1,0
in_j:
	beq $t1,$s1,in_j_end
	
	li $v0,5
	syscall
	move $t3,$v0#in x
	
	beqz $t3,without_save
	
	addi $t2,$t2,1
	sll $t4,$t2,2
	sw $t0,array_a($t4)
	sw $t1,array_b($t4)
	sw $t3,array_c($t4)
	
	without_save:
	addi $t1,$t1,1
	j in_j
in_j_end:
	addi $t0,$t0,1
	j in_i
in_i_end:

#only t2 useful
	move $t0,$t2
out_i:
	beq $t0,$0,out_i_end
	
	sll $t4,$t0,2
	
	lw $a0,array_a($t4)
	add $a0,$a0,1
	li $v0,1
	syscall 
	la $a0,str_space
	li $v0,4
	syscall#print "a[i] "
	
	lw $a0,array_b($t4)
	add $a0,$a0,1
	li $v0,1
	syscall 
	la $a0,str_space
	li $v0,4
	syscall
	
	lw $a0,array_c($t4)
	li $v0,1
	syscall 
	la $a0,str_enter
	li $v0,4
	syscall
	
	addi $t0,$t0,-1
	
	j out_i
	
out_i_end:

li $v0,10
syscall
	

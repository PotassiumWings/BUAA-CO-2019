.data
	seq:	.space 28
	vis:	.space 28
	enter:	.asciiz"\n"
	space:	.asciiz" "

.text

li $k0,1

li $v0,5
syscall
move $s0,$v0

li $s1,0
jal p

li $v0,10
syscall


p:
	bne $s1,$s0,work
	li $t0,0
	li $t3,0
	
	outputloop:
		bge $t0,$s0,outputout
		lw $a0,seq($t3)
		li $v0,1
		syscall
		li $v0,4
		la $a0,space
		syscall
		add $t0,$t0,1
		add $t3,$t3,4
		j outputloop
		
	outputout:
	li $v0,4
	la $a0,enter
	syscall
	
	jr $31
	
work:
	li $t0,1
	loop:
	bgt $t0,$s0,loopout
		sll $t5,$t0,2
		lw $t6,vis($t5)
		beq $t6,1,next
		
		sw $k0,vis($t5)
		sll $s2,$s1,2
		sw $t0,seq($s2)
		#t0,s1
		
		sw $ra,0($sp)
		sub $sp,$sp,4
		sw $t0,0($sp)
		sub $sp,$sp,4
		
		add $s1,$s1,1
		
		jal p
		
		sub $s1,$s1,1
		
		add $sp,$sp,4
		lw $t0,0($sp)
		add $sp,$sp,4
		lw $ra,0($sp)
		
		sll $t5,$t0,2
		sw $0,vis($t5)
		
		next:
		add $t0,$t0,1
		j loop
	loopout:
	jr $31
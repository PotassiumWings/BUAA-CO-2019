.text
li $v0 5
syscall

move $t1,$v0
li $t2,4
li $t3,100
li $t4,400

	div $t1,$t2
	mfhi $t5	#t5=(n%4)
	beqz $t5,if_n_div_4

j bad_end

if_n_div_4:	#n%4==0

	div $t1,$t3
	mfhi $t5	#t5=(n%4)
	beqz $t5,if_n_div_100
	nop
	j good_end

if_n_div_100:

	div $t1,$t4
	mfhi $t5
	beqz $t5,good_end
	
	j bad_end

good_end:
	
	li $a0,1
	li $v0,1
	syscall
	
	li $v0,10
	syscall

bad_end:

	li $a0,0
	li $v0,1
	syscall
	
	li $v0,10
	syscall

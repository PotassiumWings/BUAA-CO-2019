.data
	a:	.space 20

.text

li $v0,5
syscall 
move $s0,$v0

li $t0,0
loop:
	beq $t0,$s0,loop_out
	li $v0,12
	syscall
	sb $v0,a($t0)
	add $t0,$t0,1
	j loop
loop_out:

li $t0,0
move $t1,$s0
sub $t1,$t1,1
loop2:
	bge $t0,$t1,loop2_out
	lb $k0,a($t0)
	lb $k1,a($t1)
	beq $k0,$k1,next
	li $v0,1
	li $a0,0
	syscall
	li $v0,10
	syscall
	next:
	add $t0,$t0,1
	sub $t1,$t1,1
	j loop2
loop2_out:
li $v0,1
li $a0,1
syscall
li $v0,10
syscall
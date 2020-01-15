.data
matrix:	.space 256
array_vis:	.space 32

.macro getindex(%ans,%i,%j)#get 4(i*8+j)
	sll	%ans,%i,3
	add	%ans,%ans,%j
	sll	%ans,%ans,2
.end_macro

.text
main:
	li $v0,5
	syscall
	move $s0,$v0#s0=n

	li $v0,5
	syscall
	move $s1,$v0#s1=m

#while(m--)
loop_m:
	beqz $s1,next_part

	subi $s1,$s1,1#m--

	li $v0,5
	syscall
	move $t1,$v0#u
	subi $t1,$t1,1#u--

	li $v0,5
	syscall
	move $t2,$v0#v
	subi $t2,$t2,1#v--

	getindex($t3,$t1,$t2)
	lw $v0,matrix($t3)
	bnez $v0,dontmind#dont mind chong bian
	
	li $v0,1
	sw $v0,matrix($t3)#G[u][v]=1
	getindex($t3,$t2,$t1)
	sw $v0,matrix($t3)#G[v][u]=1

dontmind:
	j loop_m

next_part:

	li $a0 0
	li $a1 0
	jal dfs#dfs(0,0)

	li $a0,0
	li $v0,1
	syscall#printf 0

	li $v0,10
	syscall#exit

#dfs
dfs:
	bne $a1,$s0,work

	bnez $a0,return

	li $a0,1
	li $v0,1
	syscall#printf 1

	li $v0,10
	syscall#exit

return:
	jr $ra

work:
	#save j
	li $t6,0
next_j:
	beq $t6,$s0,go_out

	sll $t7,$t6,2
	lw $k0,array_vis($t7)
	bnez $k0,add_j#vis[j]==1

	getindex($t3,$a0,$t6)
	lw $k0,matrix($t3)
	beqz $k0,add_j#G[p][j]==0

		li $k0 1
		sll $t7,$t6,2
		sw $k0,array_vis($t7)#vis[j]=1

		move $t4,$a0#save pos
		move $t5,$a1#save dep

		sw $ra,0($sp)
		subi $sp,$sp,4#pointer for this part
		sw $t4,0($sp)
		subi $sp,$sp,4#pos
		sw $t5,0($sp)
		subi $sp,$sp,4#dep
		sw $t6,0($sp)
		subi $sp,$sp,4#j

		addi $a1,$a1,1
		move $a0,$t6
		jal dfs

		addi $sp,$sp,4
		lw $t6,0($sp)#j
		addi $sp,$sp,4
		lw $a1,0($sp)#dep
		addi $sp,$sp,4
		lw $a0,0($sp)#pos
		addi $sp,$sp,4
		lw $ra,0($sp)#pointer

		li $k0 0
		sll $t7,$t6,2
		sw $k0,array_vis($t7)#vis[j]=0
add_j:
	addi $t6,$t6,1
	j next_j

	subi $t1,$t0,1
	move $a0,$t1
	jal dfs

go_out:
	jr $ra

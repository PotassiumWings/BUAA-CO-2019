.data
.globl TC0_BASE TC1_BASE cnt0 cnt1 cnt0_double cnt1_double
TC0_BASE: .word 0x7f00
TC1_BASE: .word 0x7f10
cnt0: .word 0
cnt1: .word 0
cnt0_double: .word 0
cnt1_double: .word 0
	
.text 
	ori	$28, $0, 0x0000
	ori	$29, $0, 0x0f00
	mtc0	$0, $12

	ori	$8, $0, 0x0008
	ori	$9, $0, 0x000c
	
	lw	$10, 1($8)
	lw	$10, 2($8)
	lw	$10, 3($8)
	lw	$10, 4($8)
	lw	$10, -1($9)
	lw	$10, -2($9)
	lw	$10, -3($9)
	lw	$10, -4($9)
	
	lh	$10, 1($8)
	lh	$10, 2($8)
	lh	$10, 3($8)
	lh	$10, 4($8)
	lh	$10, -1($9)
	lh	$10, -2($9)
	lh	$10, -3($9)
	lh	$10, -4($9)
	
	lhu	$10, 1($8)
	lhu	$10, 2($8)
	lhu	$10, 3($8)
	lhu	$10, 4($8)
	lhu	$10, -1($9)
	lhu	$10, -2($9)
	lhu	$10, -3($9)
	lhu	$10, -4($9)
	
dead_loop:
	j	dead_loop
	nop

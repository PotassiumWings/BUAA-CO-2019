	ori 	$2, $0, 0x1001
    	mtc0 	$2, $12
	ori	$28, $0, 0x0000
	ori	$29, $0, 0x0000
	lui	$8, 0x7fff
	lui	$9, 0x7fff
	add	$10, $8, $9
	or	$10, $8, $9

end:
	beq $0, $0, end
	nop

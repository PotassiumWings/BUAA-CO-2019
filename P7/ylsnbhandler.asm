.ktext 0x4180
mfc0 $t9, $14
addiu $t9, $t9, 4
mtc0 $t9, $14
eret
sh $2, 42($0)
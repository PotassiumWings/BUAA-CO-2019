
.data
.space 64
arr1: .space 64
arr2: .space 64
.space 64


.text

N0: sll $t2, $t2, 17
N1: srav $t1, $zero, $t1
N2: sra $zero, $zero, 28
andi $zero, $zero, 0xfffffffe
lhu $t1, 70($zero)
N3: mult $t2, $zero
N4: lui $t0, 36233
N5: slt $t2, $t1, $t0
N6: sra $t1, $t1, 28
andi $t1, $t1, 0xfffffffc
sw $t0, 64($t1)
N7: nor $zero, $zero, $t3
N8: srl $t3, $t3, 28
addi $t3, $t3, 64
lb $t1, 10($t3)
N9: xor $t3, $t1, $zero
N10: nop
N11: bgtz $t3, N32
N12: sra $zero, $zero, 28
andi $zero, $zero, 0xfffffffe
lhu $t1, 72($zero)
N13: mthi $t2
N14: andi $t1, $t3, 59921
N15: lui $t2, 37729
N16: sra $t1, $t1, 28
andi $t1, $t1, 0xfffffffc
lw $t2, 76($t1)
N17: sra $t2, $t2, 28
sb $t0, 78($t2)
N18: jal N144
N19: sra $t1, $t1, 28
sb $zero, 74($t1)
N20: sub $t0, $t3, $t3
N21: sra $t1, $t1, 28
andi $t1, $t1, 0xfffffffe
lh $t0, 74($t1)
N22: la $t2, N177
jr $t2
N23: addu $zero, $t2, $t3
N24: addiu $zero, $t0, 48508
N25: srav $t1, $zero, $t3
N26: ori $t3, $t3, 1
divu $t3, $t3
N27: sra $t3, $zero, 25
N28: lui $t0, 56892
N29: beq $zero, $t1, N77
N30: mult $t0, $t3
N31: addu $t3, $t2, $t0
N32: sra $t1, $t1, 28
andi $t1, $t1, 0xfffffffe
lhu $t0, 78($t1)
N33: mthi $t1
N34: blez $t3, N120
N35: sra $zero, $t1, 12
N36: srl $zero, $zero, 28
addi $zero, $zero, 64
andi $zero, $zero, 0xfffffffc
sw $t1, 8($zero)
N37: and $t1, $t3, $t3
N38: srl $t1, $t1, 28
addi $t1, $t1, 64
lbu $t0, 15($t1)
N39: mflo $zero
N40: la $ra, N297
jr $ra
N41: sra $t0, $t0, 28
andi $t0, $t0, 0xfffffffe
lhu $t0, 76($t0)
N42: srl $t1, $t0, 9
N43: addu $zero, $t0, $t3
N44: j N275
N45: mfhi $t3
N46: srl $t3, $t3, 28
addi $t3, $t3, 64
andi $t3, $t3, 0xfffffffc
lw $t2, 4($t3)
N47: srlv $zero, $zero, $t2
N48: sra $zero, $zero, 28
andi $zero, $zero, 0xfffffffe
sh $t0, 78($zero)
N49: sra $t1, $t1, 28
lbu $t2, 66($t1)
N50: sra $t3, $t3, 28
lb $t3, 70($t3)
N51: srl $t0, $t0, 28
addi $t0, $t0, 64
lbu $zero, 12($t0)
N52: nor $t0, $zero, $t1
N53: srl $t2, $t2, 28
addi $t2, $t2, 64
andi $t2, $t2, 0xfffffffc
sw $zero, 4($t2)
N54: ori $t0, $t0, 1
divu $t3, $t0
N55: or $t1, $t3, $t3
N56: srl $t3, $t3, 28
addi $t3, $t3, 64
andi $t3, $t3, 0xfffffffe
lh $zero, 0($t3)
N57: sltiu $t1, $t3, 4408
N58: srl $t1, $t1, 28
addi $t1, $t1, 64
andi $t1, $t1, 0xfffffffc
sw $zero, 0($t1)
N59: sra $t3, $t3, 28
andi $t3, $t3, 0xfffffffc
lw $t3, 68($t3)
N60: subu $t0, $t0, $t3
N61: mult $t2, $zero
N62: srlv $t2, $zero, $t3
N63: la $t0, N113
jr $t0
N64: srl $t0, $t0, 28
addi $t0, $t0, 64
andi $t0, $t0, 0xfffffffe
lhu $t2, 6($t0)
N65: mult $zero, $zero
N66: multu $t3, $t3
N67: la $t0, N229
jr $t0
N68: nor $t2, $t3, $t2
N69: slt $t2, $t0, $zero
N70: subu $t3, $t0, $t3
N71: srl $t3, $t3, 28
addi $t3, $t3, 64
andi $t3, $t3, 0xfffffffe
lh $t2, 6($t3)
N72: sra $t2, $t2, 28
andi $t2, $t2, 0xfffffffe
lhu $t3, 64($t2)
N73: xori $t0, $t2, 42962
N74: and $zero, $zero, $t2
N75: srl $t3, $t3, 28
addi $t3, $t3, 64
sb $t3, 11($t3)
N76: add $t0, $t3, $t2
N77: sra $t2, $t2, 28
andi $t2, $t2, 0xfffffffc
lw $t3, 64($t2)
N78: or $zero, $t2, $t1
N79: srl $t0, $t0, 28
addi $t0, $t0, 64
andi $t0, $t0, 0xfffffffc
sw $t0, 4($t0)
N80: srl $zero, $zero, 28
addi $zero, $zero, 64
andi $zero, $zero, 0xfffffffe
lh $zero, 14($zero)
N81: bltz $zero, N207
N82: lui $t1, 20670
N83: sra $t0, $t0, 28
andi $t0, $t0, 0xfffffffc
lw $t2, 76($t0)
N84: blez $t2, N219
N85: sra $t3, $t3, 28
lbu $t0, 65($t3)
N86: slt $t3, $t3, $t1
N87: sub $t0, $t1, $t1
N88: ori $t3, $t0, 42175
N89: srl $t1, $t1, 28
addi $t1, $t1, 64
andi $t1, $t1, 0xfffffffc
sw $t2, 8($t1)
N90: mflo $t2
N91: nor $t1, $t0, $t0
N92: addu $t1, $t2, $t3
N93: bgtz $t1, N127
N94: sub $t2, $zero, $t0
N95: or $t1, $t1, $zero
N96: la $ra, N185
jr $ra
N97: sra $t0, $t0, 28
andi $t0, $t0, 0xfffffffc
sw $zero, 76($t0)
N98: jal N284
N99: slti $t2, $t0, -922
N100: ori $t3, $t2, 60182
N101: sra $t0, $t0, 28
lbu $t0, 69($t0)
N102: sltiu $t3, $t0, 31514
N103: sra $t0, $t0, 28
andi $t0, $t0, 0xfffffffc
sw $t3, 76($t0)
N104: sra $t3, $t3, 28
andi $t3, $t3, 0xfffffffc
lw $zero, 72($t3)
N105: sra $t0, $t0, 28
andi $t0, $t0, 0xfffffffe
lhu $zero, 68($t0)
N106: sub $zero, $t1, $t1
N107: srl $t0, $t0, 28
addi $t0, $t0, 64
andi $t0, $t0, 0xfffffffe
lh $t2, 4($t0)
N108: mtlo $t3
N109: sra $t0, $t0, 28
andi $t0, $t0, 0xfffffffe
lhu $t3, 74($t0)
N110: blez $t0, N203
N111: and $t2, $t2, $zero
N112: jal N135
N113: sltiu $zero, $t3, -30851
N114: srlv $t1, $t3, $t0
N115: bgez $t0, N268
N116: nop
N117: sra $t1, $t0, 31
N118: addiu $t0, $t1, 28531
N119: srl $t0, $t0, 0
N120: xori $t0, $t3, 42270
N121: srl $zero, $zero, 28
addi $zero, $zero, 64
andi $zero, $zero, 0xfffffffe
lhu $t1, 2($zero)
N122: srl $zero, $zero, 28
addi $zero, $zero, 64
lbu $t1, 15($zero)
N123: sra $zero, $zero, 28
lbu $t3, 70($zero)
N124: or $t1, $zero, $t0
N125: srl $t3, $t3, 28
addi $t3, $t3, 64
sb $zero, 6($t3)
N126: mthi $zero
N127: srl $t0, $t0, 28
addi $t0, $t0, 64
sb $t3, 14($t0)
N128: bgez $zero, N173
N129: addu $zero, $t3, $zero
N130: blez $t1, N267
N131: srl $t1, $t1, 28
addi $t1, $t1, 64
lbu $t3, 5($t1)
N132: sub $t2, $t2, $t2
N133: sra $t3, $t3, 28
lbu $zero, 74($t3)
N134: sra $t1, $t1, 28
lb $t3, 79($t1)
N135: and $t1, $t2, $t0
N136: j N192
N137: srlv $t0, $zero, $t2
N138: bltz $t3, N194
N139: lui $t0, 60457
N140: srl $t0, $t0, 28
addi $t0, $t0, 64
lb $t0, 15($t0)
N141: la $t3, N156
jr $t3
N142: ori $t2, $t1, 53433
N143: srl $zero, $zero, 28
addi $zero, $zero, 64
lbu $zero, 7($zero)
N144: la $ra, N204
jr $ra
N145: lui $zero, 13056
N146: blez $t3, N291
N147: ori $t3, $t3, 1
div $t3, $t3
N148: la $ra, N249
jalr $t2, $ra
N149: sltu $t1, $zero, $zero
N150: mflo $t0
N151: sra $t0, $t0, 28
andi $t0, $t0, 0xfffffffc
lw $t1, 76($t0)
N152: jal N287
N153: ori $t2, $t2, 1
divu $zero, $t2
N154: srl $zero, $zero, 28
addi $zero, $zero, 64
andi $zero, $zero, 0xfffffffe
lhu $zero, 0($zero)
N155: addi $t0, $zero, -8931
N156: andi $t1, $t0, 26819
N157: srl $t3, $t3, 28
N158: bgtz $zero, N190
N159: add $t3, $t1, $t2
N160: bgtz $t0, N278
N161: sra $zero, $zero, 28
andi $zero, $zero, 0xfffffffe
sh $t1, 68($zero)
N162: sltu $zero, $t2, $t2
N163: la $ra, N285
jalr $t2, $ra
N164: srl $t3, $t3, 28
addi $t3, $t3, 64
lb $t1, 8($t3)
N165: addi $t0, $t3, -22894
N166: bne $t3, $t0, N181
N167: sll $t2, $t1, 29
N168: nor $zero, $zero, $zero
N169: mthi $zero
N170: ori $t0, $t0, 1
divu $t3, $t0
N171: addi $t3, $t3, 31820
N172: mfhi $t3
N173: la $ra, N179
jr $ra
N174: mthi $t1
N175: lui $t1, 47397
N176: srl $t0, $t0, 28
addi $t0, $t0, 64
andi $t0, $t0, 0xfffffffe
sh $t3, 12($t0)
N177: sra $zero, $zero, 28
andi $zero, $zero, 0xfffffffe
lh $t0, 70($zero)
N178: andi $t0, $t1, 48529
N179: srl $zero, $zero, 28
addi $zero, $zero, 64
andi $zero, $zero, 0xfffffffe
lhu $zero, 6($zero)
N180: sra $t0, $t2, 11
N181: multu $t0, $t2
N182: sra $t1, $t1, 28
andi $t1, $t1, 0xfffffffe
lhu $t2, 70($t1)
N183: nop
N184: srl $zero, $zero, 28
addi $zero, $zero, 64
andi $zero, $zero, 0xfffffffc
sw $t0, 8($zero)
N185: sra $t0, $t0, 28
andi $t0, $t0, 0xfffffffe
sh $t2, 74($t0)
N186: jal N293
N187: xor $t1, $zero, $zero
N188: mfhi $t0
N189: la $ra, N268
jalr $t2, $ra
N190: mflo $t1
N191: srl $t3, $t3, 28
addi $t3, $t3, 64
andi $t3, $t3, 0xfffffffe
sh $t0, 8($t3)
N192: sra $t2, $t2, 28
andi $t2, $t2, 0xfffffffe
sh $t1, 66($t2)
N193: la $ra, N230
jr $ra
N194: sra $zero, $zero, 28
andi $zero, $zero, 0xfffffffc
lw $zero, 68($zero)
N195: mfhi $zero
N196: lui $t0, 23435
N197: bltz $zero, N287
N198: sllv $t2, $t3, $zero
N199: bgez $t2, N272
N200: sra $t1, $zero, 11
N201: sra $zero, $zero, 28
andi $zero, $zero, 0xfffffffe
lh $zero, 64($zero)
N202: nor $t3, $zero, $t3
N203: srl $t3, $t3, 28
addi $t3, $t3, 64
andi $t3, $t3, 0xfffffffc
sw $t1, 8($t3)
N204: sra $zero, $zero, 28
andi $zero, $zero, 0xfffffffe
lh $t3, 68($zero)
N205: srl $t2, $t2, 28
addi $t2, $t2, 64
sb $zero, 12($t2)
N206: or $t3, $t0, $t2
N207: srl $t1, $t1, 28
addi $t1, $t1, 64
lbu $t2, 12($t1)
N208: lui $t0, 56991
N209: sra $t0, $t0, 28
lbu $t0, 64($t0)
N210: ori $t2, $t1, 43197
N211: ori $t3, $zero, 27944
N212: mult $t3, $t0
N213: mflo $t3
N214: nop
N215: addiu $t0, $t3, 2789
N216: j N298
N217: addiu $zero, $t0, 40580
N218: nop
N219: srl $t1, $t1, 28
addi $t1, $t1, 64
lb $t0, 13($t1)
N220: sra $zero, $zero, 28
andi $zero, $zero, 0xfffffffc
lw $t3, 72($zero)
N221: jal N233
N222: mthi $zero
N223: addu $t1, $t2, $t0
N224: srl $zero, $zero, 14
N225: srlv $t0, $t1, $t2
N226: la $ra, N236
jr $ra
N227: sra $t3, $t3, 28
lb $t1, 75($t3)
N228: slt $t1, $t3, $t0
N229: srl $t2, $t1, 18
N230: sra $t2, $t2, 28
andi $t2, $t2, 0xfffffffc
lw $t0, 76($t2)
N231: sllv $t0, $t3, $t0
N232: srl $t3, $t3, 28
addi $t3, $t3, 64
andi $t3, $t3, 0xfffffffc
sw $t0, 4($t3)
N233: srl $t1, $t1, 28
addi $t1, $t1, 64
lb $t0, 3($t1)
N234: beq $t0, $t2, N299
N235: srl $t0, $t1, 19
N236: srl $t0, $t3, 26
N237: jal N296
N238: srl $zero, $zero, 28
addi $zero, $zero, 64
lbu $t0, 6($zero)
N239: bne $t1, $t3, N285
N240: sltiu $t1, $zero, -1756
N241: srl $zero, $zero, 28
addi $zero, $zero, 64
andi $zero, $zero, 0xfffffffc
sw $t3, 0($zero)
N242: mtlo $t3
N243: nop
N244: bgez $t1, N287
N245: nor $zero, $t3, $t2
N246: sra $zero, $t3, 19
N247: ori $t2, $t2, 1
divu $t3, $t2
N248: sub $t3, $t2, $t3
N249: sra $t3, $t3, 28
andi $t3, $t3, 0xfffffffc
sw $t1, 76($t3)
N250: sltiu $t1, $zero, 19377
N251: sll $zero, $t2, 28
N252: srl $t2, $t2, 31
N253: j N268
N254: srl $t2, $t2, 28
addi $t2, $t2, 64
andi $t2, $t2, 0xfffffffe
lh $t2, 4($t2)
N255: mult $t2, $t3
N256: andi $t3, $t0, 7689
N257: xori $t2, $t2, 47196
N258: j N284
N259: srl $t3, $t3, 28
addi $t3, $t3, 64
andi $t3, $t3, 0xfffffffe
lhu $zero, 8($t3)
N260: bgez $t2, N294
N261: sra $t1, $t1, 28
sb $t2, 64($t1)
N262: bgtz $t2, N295
N263: sllv $zero, $t3, $t0
N264: srl $t0, $t0, 28
addi $t0, $t0, 64
andi $t0, $t0, 0xfffffffc
sw $zero, 4($t0)
N265: ori $t3, $t3, 1
divu $t2, $t3
N266: jal N286
N267: sra $zero, $zero, 28
andi $zero, $zero, 0xfffffffe
sh $t1, 70($zero)
N268: srl $zero, $zero, 28
addi $zero, $zero, 64
andi $zero, $zero, 0xfffffffc
lw $t1, 12($zero)
N269: add $t0, $t3, $t1
N270: srav $t2, $t3, $t3
N271: sll $t3, $zero, 6
N272: mflo $t3
N273: la $ra, N287
jalr $t0, $ra
N274: and $t3, $zero, $zero
N275: srl $t1, $t1, 7
N276: bgez $t0, N286
N277: xor $t0, $zero, $t2
N278: sllv $t0, $t2, $zero
N279: mfhi $t0
N280: sub $zero, $t1, $t3
N281: srl $t2, $t2, 28
addi $t2, $t2, 64
andi $t2, $t2, 0xfffffffc
lw $t1, 0($t2)
N282: srl $t2, $t2, 28
addi $t2, $t2, 64
sb $t3, 7($t2)
N283: blez $zero, N300
N284: mflo $zero
N285: bltz $t3, N290
N286: sllv $t2, $t1, $zero
N287: blez $zero, N294
N288: mflo $zero
N289: ori $t2, $t1, 21463
N290: sra $zero, $zero, 28
sb $t0, 65($zero)
N291: srl $t2, $t2, 28
addi $t2, $t2, 64
andi $t2, $t2, 0xfffffffe
lhu $t0, 10($t2)
N292: srl $t0, $t0, 28
addi $t0, $t0, 64
lbu $t2, 15($t0)
N293: mult $t0, $t2
N294: srl $t1, $t1, 28
addi $t1, $t1, 64
andi $t1, $t1, 0xfffffffe
lh $t2, 4($t1)
N295: srl $t1, $t1, 28
addi $t1, $t1, 64
andi $t1, $t1, 0xfffffffe
sh $t0, 14($t1)
N296: bgtz $t2, N298
N297: mfhi $t3
N298: sra $t0, $t1, 29
N299: slti $t3, $t3, 4871
N300: nop
EXIT:
beq $zero, $zero, EXIT
nop

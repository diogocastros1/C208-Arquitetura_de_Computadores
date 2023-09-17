.data
p1: .word 0x00000000
p2: .half 0x0000
p3: .word 0x00

.text
li $t1, 0x10203040
li $t2, 0x5060
li $t3, 0x70
sw $t1, p1
sh $t2, p2
sb $t3, p3
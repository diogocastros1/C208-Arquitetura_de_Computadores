.data #0x10010000
	a: .word 2, 6, 5
	
.text #0x00400000
	la $s1, a # $s1 = 0x10010000
	lw $t1, 0($s1)
	lw $t2, 4($s1)	
	lw $t3, 8($s1)
	
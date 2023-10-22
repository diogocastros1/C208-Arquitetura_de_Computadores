.data
	a: .word 10
	b: .word 20
	c: .word 30
	
.text
	# acessando memórias
	la $s1, a
	la $s2, b
	la $s3, c
	
	# efetuando operações
	lw $t1, 15($s2)
	sub $t1, $t1, $s3
	
	lw $t2, 5($s1)
	lw $t3, 3($s3)
	add $t2, $t2, $t3
	
	lw $t3, 21($s1)
	sub $t3, $s2, $t3
	
	# salvando resultados
	sw $t1, 0($s1)
	sw $t2, 0($s2)	
	sw $t3, 0($s3)
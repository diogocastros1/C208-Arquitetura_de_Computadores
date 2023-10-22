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
	sub $t1, $s2, $s3
	add $t2, $s1, $s3
	sub $t3, $s2, $s1
	
	# salvando resultados
	sw $t1, 10($s1)
	sw $t2, 245($s2)	
	sw $t3, 0($s3)
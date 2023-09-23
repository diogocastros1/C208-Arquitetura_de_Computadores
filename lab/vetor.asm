.data # 0x10010000 se não direcionar ele irá apontar para este endereco
	a: .word 2, 6, 5 # tamanho word ocupa 4 posições começando no 0x10010000
	
.text
	# load: 
	# mem -> reg
	# store: 
	# reg -> mem

	la $s1, a
	
	lw $t1, 0($s1) # acessando a posição 0 do vetor a, neste caso 2
	lw $t2, 4($s1) # acessando a posição 4 do vetor a, neste caso 6


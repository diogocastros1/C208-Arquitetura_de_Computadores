.data # 0x10010000 se n�o direcionar ele ir� apontar para este endereco
	a: .word 2, 6, 5 # tamanho word ocupa 4 posi��es come�ando no 0x10010000
	
.text
	# load: 
	# mem -> reg
	# store: 
	# reg -> mem

	la $s1, a
	
	lw $t1, 0($s1) # acessando a posi��o 0 do vetor a, neste caso 2
	lw $t2, 4($s1) # acessando a posi��o 4 do vetor a, neste caso 6


.data
prompt:     .asciiz "Digite o valor de N: "
result:     .asciiz "A diferença é: "

.text
    # Imprimir o prompt para o valor de N
    li $v0, 4
    la $a0, prompt
    syscall

    # Ler o valor de N
    li $v0, 5
    syscall
    move $t0, $v0  # $t0 contém o valor de N

    # Calcular a soma dos N primeiros números naturais
    li $t1, 0  # Inicializa $t1 para a soma
    li $t2, 1  # Inicializa $t2 com 1 (o primeiro número natural)
    
    loop1:
    	bgt $t2, $t0, calc_square_sum  # Se $t2 <= N, calcular o quadrado da soma
    	add $t1, $t1, $t2  # Adiciona $t2 à soma
    	addi $t2, $t2, 1  # Incrementa $t2
    	j loop1

    calc_square_sum:
    	mul $t1, $t1, $t1  # Calcula o quadrado da soma

    # Calcular a soma dos quadrados dos N primeiros números naturais
    li $t3, 0  # Inicializa $t3 para a soma dos quadrados
    li $t2, 1  # Reinicializa $t2 com 1
    loop2:
    	bgt $t2, $t0, calculate_difference  # Se $t2 == N, calcular a diferença
    	mul $t4, $t2, $t2  # Calcula o quadrado de $t2
    	add $t3, $t3, $t4  # Adiciona o quadrado à soma
    	addi $t2, $t2, 1  # Incrementa $t2
    	j loop2

    calculate_difference:
	    sub $t5, $t1, $t3  # Calcula a diferença

    # Imprimir o resultado
    li $v0, 4
    la $a0, result
    syscall
    li $v0, 1
    move $a0, $t5
    syscall

    # Terminar o programa
    li $v0, 10
    syscall

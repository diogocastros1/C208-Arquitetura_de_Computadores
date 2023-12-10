.data
    A: .word 0    # Variável A inicializada com zero
    B: .word 0    # Variável B inicializada com zero
    promptA: .asciiz "Digite o valor de A: "
    promptB: .asciiz "Digite o valor de B: "
    result: .asciiz "Valores trocados: \n"

.text

# Solicita ao usuário para digitar o valor de A
li $v0, 4
la $a0, promptA
syscall

# Lê o valor de A do usuário
li $v0, 5
syscall
sw $v0, A

# Solicita ao usuário para digitar o valor de B
li $v0, 4
la $a0, promptB
syscall

# Lê o valor de B do usuário
li $v0, 5
syscall
sw $v0, B

# Troca os valores entre A e B
lw $t0, A    # Carrega o valor de A para registrador temporário $t0
lw $t1, B    # Carrega o valor de B para registrador temporário $t1
sw $t1, A    # Armazena o valor de $t1 em A
sw $t0, B    # Armazena o valor de $t0 em B

# Apresenta os valores trocados na tela
li $v0, 4
la $a0, result
syscall

# Apresenta o valor de A
lw $a0, A
li $v0, 1
syscall

# Apresenta o valor de B
lw $a0, B
li $v0, 1
syscall

# Termina o programa
li $v0, 10
syscall
 

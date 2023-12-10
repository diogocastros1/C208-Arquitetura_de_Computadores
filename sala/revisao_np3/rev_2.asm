# 1º criar variavel e frase para user
.data 
  A: .word 0 # variavel A com valor = 0
  frase_A: .asciiz "Alguma frase aqui: "

# 2º utilizar a variavel e entrar com alguma info
.text
  # print da frase
  li $v0, 4 # print de uma string
  la $a0, frase_A # atribuindo a frase para $a0
  syscall # executando a instrução de $v0

  # entrada de dados
  li $v0, 5 # leitura de int
  syscall
  sw $v0, A # salvando a leitura em A

  # somando o valor de A com 5 e salvando em A novamente
  lw $t0, A # atribuindo o valor de A para $t0
  addi $t0, $t0, 5 # somando 5 com o valor de $t0 e salvando em $t0 novamente
  sw $t0, A # salvando o valor de $t0 em A novamente
  
  # printando o novo valor de A
  li $v0, 1 # print int
  lw $a0, A # atribuindo o valor de A para $a0
  syscall
  
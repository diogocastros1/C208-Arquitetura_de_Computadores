# Declaracao de variaveis
.data

# Corpo do programa
.text
addi $t1, $0, 0x20 # $t1 <- 0x20
# aqui:
addi $t2, $0, 0x50 # $t2 <- 0x50
#addi $t3, $t1, -0x10
# j aqui jump para o 'aqui' da linha 7

mul $t3, $t1, $t2
mflo $t4
mfhi $t5


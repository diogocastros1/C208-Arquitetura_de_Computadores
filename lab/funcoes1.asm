.text
li $t1, 10
li $t2, 8

sll $s1, $t1, 2 # shift left 10 << 2 que fica 2^x.n onde x é o numero de casas e n o numero desejado neste exemplo 10
srl $s2, $t1, 2 # para shift right, 10 >> 1 a formula é n/2^x onde x é o numero de casas e n o numero desejado neste exemplo 10.

.data
n1: .byte 0x20
n2: .byte 0x60
m: .byte # memoria ja foi alocada mesmo sem informacao

.text
la $s0, n1
la $s1, n2
lb $t1, n1
lb $t2, n2 # lb $t2, 1($s0) -> outra forma de aprener
add $t3, $t1, $t2
srl $t4, $t3, 1 # deslocamento de 1 casa para direita
sb $t4, m # guardando o resultado na memória alocada em data
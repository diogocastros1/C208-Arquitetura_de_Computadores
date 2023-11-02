# Print string

.data
S: .asciiz "Entre com seu nome:"

.text

li $v0, 4
la $a0, S
syscall 
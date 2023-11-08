addiu $1, $0, 0x0100
addiu $2, $0, 0xdad0
addu $3, $1, $2
sw $3, 10($1)
lw $4, 10($1)
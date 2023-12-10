addiu $1, $0, 5
addu $1, $1, $1
addu $1, $1, $1 
#$1 = 20 ate aqui

addiu $2, $0, 0xff
nor $3, $1, $2
sw $1, 0($1)

addu $4, $1, $1
addu $4, $4, $1
#$4 = 60 até aqui

nor $5, $4, $2
sw $4, 0($4)

addu $7, $4, $4

nor $8, $7, $2
sw $9, 0($9)


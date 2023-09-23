# o mips possui 32 registradores e possuem 32 bits cada um.
# ou seja 32 registradores de 32 bits cada
.text
li $t1, 10
li $t2, 8

and $t0, $t1, $t2
andi $t3, $t1, 8

# OR/ ORI/ NOR/ XOR/ XORI

slt $t4, $t2, $t1 # verifica se 8 > 10 e retorna boolean (0, 1)
slti $t5, $t1, 10 

.data

.text

# x = 5 + 4 ---> tipo R
# A = 5 --> $t1
# B = 4 --> $t2
# X = A + B --> $t3 = $t1 + $t2

# li = Load Immediate
li $t1, 5
li $t2, 4
add $t3, $t1, $t2

# X = 10 + 125 ---> tipo I
# A = 10 --> $s0
# B = 125
# X --> $s1
li $s0, 10
addi $s1, $s0, 125

# Subtração
sub $t4, $s1, $t1
subi $t0, $t4, 100

addi $s7, $s1, -10

# Multiplicação
li $t1, 10
li $s7, 5
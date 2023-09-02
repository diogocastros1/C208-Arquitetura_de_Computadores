.data

.text

# b = 1, c = 2, d = 3, e = 4

addi $s1, $0, 1 # b
addi $s2, $0, 2 # c
addi $s3, $0, 3 # d
addi $s4, $0, 4 # d
addi $t1, $s1, 10 # t0 = b + 10
addi $t2, $s2, -5 # t1 = c + (-5)
sub $t3, $s3, $s4 # t3 = d - e
add $s0, $t1, $t2
sub $s0, $s0, $t3
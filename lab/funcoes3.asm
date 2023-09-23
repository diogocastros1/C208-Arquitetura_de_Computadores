.text 
li $s1, 4
li $s2, 5
li $s3, 4
li $s4, 5
bne $s3, $s4, A # se $s3 diferente de $s4
sub $s0, $s1, $s2
j EXIT

A:
	add $s0, $s1, $s2
EXIT:
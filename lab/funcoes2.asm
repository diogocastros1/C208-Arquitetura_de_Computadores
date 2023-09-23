.text
li $t0, 0
li $t2, 0

while: ble $t0, 2, loop 
j exit

loop:
	addi $t0, $t0, 1 # encrementando 1 a $t0
	addi $t2, $t2, 1
	j while # voltando para while
exit: 
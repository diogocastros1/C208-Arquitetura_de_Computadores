.text
li $t1, 8
li $t2, 5

# if ($t1 > 10): maior, else: $t2 - 1
bge $t1, 10, maior 
addi $t2, $t2, -1
j exit # pula para exit e não entra no maiors

maior: 
	addi $t2, $t2, 1
exit: 
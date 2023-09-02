.text
# soma imediata, pois ja passamos o valor na conta
addi $t1, $0, 0x20 # $t1 = 0x20 
addi $t2, $0, 0x30 # $t2 = 0x30
addi $t4, $0, 0x50 # $t4 = 0x50

sub $t3,$t2,$t1
add $t5,$t3,$t4
subi $t6, $t5, 0x40



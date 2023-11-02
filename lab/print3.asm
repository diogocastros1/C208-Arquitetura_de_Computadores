# Print double

.data
DOUBLE: .double 53.60254
ZERO: .double 0.0

.text

li $v0, 2
ldc1 $f2, DOUBLE
ldc1 $f0, ZERO
add.d $f12, $f2, $f0

syscall 
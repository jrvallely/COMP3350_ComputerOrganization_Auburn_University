# Task b - Compute the given expression and store Z as the result
.data
# Values assigned

A: .word 15
B: .word 10
C: .word 7
D: .word 2
E: .word 18
F: .word -3
Z: .word 0      # result

.text
main:
    # Load the given values
    lw $t0, A
    lw $t1, B
    lw $t2, C
    lw $t3, D
    lw $t4, E
    lw $t5, F

    # (A+B)
    add $t6, $t0, $t1

    # (C-D)
    sub $t7, $t2, $t3

    # (E+F)
    add $t8, $t4, $t5

    # (A-C)
    sub $t9, $t0, $t2

    # Z = (A+B) + (C-D) + (E+F) - (A-C)
    add $t6, $t6, $t7
    add $t6, $t6, $t8
    sub $t6, $t6, $t9

    # Store Z as the result in the memory
    sw $t6, Z

    # Exit
    li $v0, 10
    syscall

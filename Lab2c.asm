# Task c - Implement Algorithm in C 
.data
# Values Assigned

A: .word 10
B: .word 15
C: .word 6
Z: .word 0

.text
main:
    # Load the given values
    lw $t0, A
    lw $t1, B
    lw $t2, C

    # if (A > B || C < 5)
    ble $t0, $t1, check_c   # if A <= B, check C
    li $t3, 1               # A > B
    b set_Z1
check_c:
    slti $t3, $t2, 5        # C < 5 ?
    beq $t3, $zero, else_if
set_Z1:
    li $t4, 1
    sw $t4, Z
    b switch_stmt

else_if:

    # else if ((A > B) && ((C+1) == 7))
    
    slt $t5, $t1, $t0       # $t5 = (A > B)
    addi $t6, $t2, 1        # C+1
    li $t7, 7
    seq $t6, $t6, $t7       # (C+1 == 7)
    and $t8, $t5, $t6       # (A > B) && (C+1 == 7)
    beq $t8, $zero, else_part
    li $t4, 2
    sw $t4, Z
    b switch_stmt

else_part:
    li $t4, 3
    sw $t4, Z

switch_stmt:
    lw $t9, Z
    li $t4, 1
    beq $t9, $t4, case1
    li $t4, 2
    beq $t9, $t4, case2
    b default_case

case1:
    li $t9, -1
    sw $t9, Z
    b end

case2:
    li $t9, -2
    sw $t9, Z
    b end

default_case:
    li $t9, 0
    sw $t9, Z

end:
    li $v0, 10
    syscall

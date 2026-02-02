.data
A: .word 9, 3, 7, 1, 5, 8, 2, 6, 4
N: .word 9

.text
.globl main

main:
	la $a0, A
	lw $a1, N
	jal selection_sort_iterative

	li $v0, 10
	syscall

selection_sort_iterative:
	addi $t0, $zero, 0      # i

outer_loop:
	bge $t0, $a1, sort_done
	move $t1, $t0           # min_index
	addi $t2, $t0, 1        # j
	
inner_loop:
	bge $t2, $a1, do_swap
	sll $t3, $t2, 2
	sll $t4, $t1, 2
	add $t5, $a0, $t3
	add $t6, $a0, $t4
	lw $t7, 0($t5)
	lw $t8, 0($t6)
	blt $t7, $t8, update_min
	j skip_update

update_min:
	move $t1, $t2


skip_update:
	addi $t2, $t2, 1
	j inner_loop

do_swap:
	bge $t0, $t1, next_outer # only swap if min_index != i
	sll $t3, $t0, 2
	sll $t4, $t1, 2
	add $t5, $a0, $t3        # A[i] address
	add $t6, $a0, $t4        # A[min_index] address
	lw $t7, 0($t5)
	lw $t8, 0($t6)
	sw $t8, 0($t5)
	sw $t7, 0($t6)

next_outer:
	addi $t0, $t0, 1
	j outer_loop

sort_done:
	jr $ra
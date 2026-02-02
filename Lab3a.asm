.data 
newline: .asciiz "\n"

.text
.globl main

main:
# Calls fact_acc(5, 1)

	li $a0, 5	#n
	li $a1, 1	#acc
	jal fact_acc
	move $a0, $v0	#$v0 result
	li $v0, 1
	syscall		#Prints $v0 result
	
	li $v0, 4
	la $a0, newline
	syscall
	
#Calls fact_acc(10, 1)
	li $a0, 10
	li $a1, 1
	jal fact_acc
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 10
	syscall
	
fact_acc:
	addi $sp, $sp, -8	#Allocates room for 8 bytes
	sw $ra, 4($sp)		#Saves return address
	sw $a0, 0($sp)		#Saves n

	beq $a0, $zero, base_case

	mul $a1, $a1, $a0	#acc * n
	addi $a0, $a0, -1	#n - 1
	jal fact_acc

	lw $ra, 4($sp)		#Restores n
	lw $a0, 0($sp)		#Restores return address
	addi $sp, $sp, 8	#pop
	jr $ra

base_case:
	move $v0, $a1
	lw $ra, 4($sp)
	lw $a0, 0($sp)
	addi $sp, $sp, 8
	jr $ra

.data
src: .asciiz "Hello, MIPS world!"
dst: .space 20
dst_cap: .word 20
newline: .asciiz "\n"

.text
.globl main

main:
	la $a0, dst	#pointer
	la $a1, src	#pointer
	lw $a2, dst_cap
	jal strcpy_safe
	
#Prints return value
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 10
	syscall
	
strcpy_safe:
	beq $a2, $zero, trunc_return
	addi $t0, $zero, 0	#index
	addi $t1, $a2, -1	#maximum bytes
	
copy_loop:
	lb $t2, 0($a1)			#src[i]
	beq $t2, $zero, success		#If src[i] == \0 stop
	beq $t0, $t1, trunc_return	#If counter == limit stop
	sb $t2, 0($a0)			#Stores dst[i] = src[i]
	addi $a0, $a0, 1
	addi $a1, $a1, 1
	addi $t0, $t0, 1
	j copy_loop

success:
	sb $zero, 0($a0)	
	li $v0, 0		#Returns 0
	jr $ra

trunc_return:
	sb $zero, 0($a0)
	li $v0, -1
	jr $ra
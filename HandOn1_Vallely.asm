.data

base: .word 0 #base+0 (unused place holder)
i: .word 0 #base+4: i
a: .space 80 #base+8: a[0..19] (20 words = _ bytes)

.text

la $gp, base #set $gp = baseaddress
lw $t0, 4($gp)#load i from memory with offset
addiu $t2, $gp, 8 #t2 stores the pointer to &a[0] (base + 8)

loop:
	slti $t3, $t0, 20 #while (i<20)
	beq $t3, $zero, exit
	
	sll $t1, $t0, 3 #t1 = 8*i
	sw $t1, 0($t2) #store 8*i into array (using the pointer in t2)
	
	addi $t0, $t0, 1 #i++
	addi $t2, $t2, 4 #pointer +=4
	
	j loop

exit: 
	sw $t0, 4($gp) # i = 0
	
	#syscall exit
	li $v0, 10
	syscall
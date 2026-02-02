# Julia Vallely
# Lab 1 - Swap Elements

.data
A: .word 7, 42, 0, 27, 16, 8, 4, 15, 31, 45
n: .word 3 #int n = 3
m: .word 6 #int m = 6

.text
.globl main

# Swap 2 elements n & m
main:

la $a0, A
lw $a1, n
lw $a2, m

#Find address for N
sll $t1, $a1, 2 # Calculate Array Index of N offset
add $t1, $a0, $t1 # Calculate Array Index of N address

# Find address in array for M
sll $t2, $a2, 2 # Calculate Array Index of M offset
add $t2, $a0, $t2 # Calculate Array Index of M address

# Load number of address to temp 4, 5
lw $t0, 0($t1)
lw $t3, 0($t2)

# Swap Elements Position
sw $t0, 0($t2)
sw $t3, 0($t1)

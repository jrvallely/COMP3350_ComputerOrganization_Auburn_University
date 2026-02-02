# Task a - Read a string from the user and print it back

.data
prompt: .asciiz "Please enter a string that is less than 40 characters: "
buffer: .space  40  # spaces allotted for string

.text
main:
    # Print prompt from user
    li $v0, 4
    la $a0, prompt
    syscall

    # Read string from user
    li $v0, 8          # syscall should read the string
    la $a0, buffer     
    li $a1, 40         # max length of string
    syscall

    # Print the string back to user
    li $v0, 4
    la $a0, buffer
    syscall

    # Exit
    li $v0, 10
    syscall

.data
num1: .word 5       # First number
num2: .word 3       # Second number
result: .word 0     # To store the result

.text
.globl main
main:
    # Load the numbers into registers
    lw $t0, num1     # Load num1 into $t0
    lw $t1, num2     # Load num2 into $t1
    lw $t2, result   # Load result into $t2 (initially 0)

    # Initialize temporary registers
    move $t3, $zero  # $t3 will be used to store the shifted num1
    move $t4, $zero  # $t4 will be used as a counter

multiply:
    beq $t4, 32, end_multiply  # If counter equals 32, end loop
    andi $t5, $t1, 1           # Check if the least significant bit of num2 is 1
    beq $t5, $zero, skip_add   # If the bit is 0, skip addition
    add $t2, $t2, $t0          # Add num1 to result

skip_add:
    sll $t0, $t0, 1            # Left shift num1 by 1
    srl $t1, $t1, 1            # Right shift num2 by 1
    addi $t4, $t4, 1           # Increment counter
    j multiply                 # Repeat the loop

end_multiply:
    # Store the result back to memory
    sw $t2, result

    # Exit the program
    li $v0, 10
    syscall

.data
num1:   .word   5                               # First number
num2:   .word   3                               # Second number
result: .word   0                               # To store the result

.text
.globl  main
main:
    # Load the numbers into registers
    lw      $t0,        num1                    # a = num1
    lw      $t1,        num2                    # b = num2
    lw      $t2,        result                  # ans = 0 (result)

    # Initialize temporary registers
    move    $t3,        $zero                   # int i = 0;

multiply:
    beq     $t3,        32,     end_multiply    # while(i < 32){
    andi    $t4,        $t1,    1               # b & 1
    beq     $t4,        $zero,  skip_add        # if(b & 1)
    add     $t2,        $t2,    $t0             # ans += a;

skip_add:
    sll     $t0,        $t0,    1               # a <<= 1;
    srl     $t1,        $t1,    1               # b >>= 1;
    addi    $t3,        $t3,    1               # i++;
    j       multiply                            # }

end_multiply:
    # Store the result back to memory
    sw      $t2,        result

    addi    $a0,        $t2,    0               # load value into a0
    li      $v0,        1                       # print integer
    syscall

    # Exit the program
    li      $v0,        10
    syscall

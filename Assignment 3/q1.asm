.data   
PQ:     .half   10, 5               # Example value for p and q
RESULT: .word   0                   # To store the result

.text   
        .globl  MAIN
MAIN:   
    la      $gp,        pq          # load address pq into gp
    jal     SUBTRACT                # Call the Subtract function
    sw      $s0,        RESULT      # Store the result back to memory
    
    # Exit the program
    li      $v0,        10
    syscall 

SUBTRACT:
    lh      $s0,        0($gp)      # Load and sign extend a to get p
    lh      $s1,        2($gp)      # Load and sign extend b to get q
    not     $s1,        $s1         # Do ~q | (taking two's complement -
    addi    $s1,        $s1,    1   # Add 1 to q |  and getting -q)
    add     $s0,        $s0,    $s1 # Add -q to p.
    jr      $ra
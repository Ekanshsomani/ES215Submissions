.data   
PQ: .word   10, 5, 0, 0             # Example values for p and q

.text   
    .globl  MAIN
MAIN:
    la      $gp,    PQ              # Load address of pq into $gp


    jal     LCM                     # Call the Lcm function

    # Exit the program
    li      $v0,    10
    syscall 

LCM:
    lw      $s0,    0($gp)          # Load p
    lw      $s1,    4($gp)          # Load q

    sub     $t2,    $s0,        $s1 # calculate p - q
    addi    $t0,    $s1,        0   # a = q
    addi    $t1,    $s0,        0   # b = p
    blez    $t2,    LOOP            # jump to loop if p <= q
    addi    $t0,    $s0,        0   # a = p
    addi    $t1,    $s1,        0   # b = q

LOOP:
    div     $t0,    $t1             # HI = a % b
    mfhi    $t2                     # temp = HI
    beqz    $t2,    DONE            # jump to done if temp == 0
    addi    $t0,    $t1,        0   # a = b
    mfhi    $t1                     # b = HI
    j       LOOP                    # loop back to check condition

DONE:
    div     $s1,    $t1             # LO = q / b
    mflo    $s1                     # q = LO
    mul     $s0,    $s1             # HI, LO = p * q
    mflo    $t0                     # t0 = LO
    sw      $t0,    8($gp)          # store t0(LO) in lower bits
    mfhi    $t0                     # t0 = HI
    sw      $t0,    12($gp)         # store t0(HI) in higher bits

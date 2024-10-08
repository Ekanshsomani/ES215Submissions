.data
ARRAY: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15  # Example array
RESULT: .word 0   # To store the result

.text
.globl main
main:
    la      $s0,    ARRAY            # Load the base address of the array into $s0

    jal     AVERAGE                  # Call the Average function

    mov.s   $f12,   $f2              #
    li      $v0,    2                # print float syscall code
    syscall

    # Exit the program
    li $v0, 10
    syscall

AVERAGE:                            # array address comes in $s0 (assume)
    addi    $s1,    $zero,      0   # int ans = 0
    addi    $t0,    $s0,        60  # t0: 15 4 byte numbers ahead of s0

LOOP:
    beq     $s0,    $t0,        DONE# jump to done if at array end
    lw      $t1,    0($s0)          # load arr[i]
    add     $s1,    $s1,        $t1 # ans += arr[i]
    addi    $s0,    $s0,        4   # i++
    j       LOOP                    # loop back to check condition

DONE:
    addi    $t0,    $zero,      15  # t0 = 15
    mtc1    $s1,    $f0             #
    mtc1    $t0,    $f1             #
    cvt.s.w $f0,    $f0             #
    cvt.s.w $f1,    $f1             #
    div.s   $f2,    $f0,        $f1 # 
    s.s     $f2,    RESULT          #
    jr      $ra                     # global will find their answer in $LO
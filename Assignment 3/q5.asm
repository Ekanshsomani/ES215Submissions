.data
list: .word 1, 3, 5, 7, 9, 11, 13, 15, 17, 19  # Sorted list of 10 numbers
X:    .word 7, 0, -1, -1                       # Given number to find and the memory to store the result

.text
.globl main
main:
    la      $s0,    list                    # Load base address of the list into $t0
    lw      $s1,    X
    la      $gp,    X                       # global pointer at X's address
    jal     findNum

    lw      $a0,    4($gp)                  # load the output for printing
    li      $v0,    1                       #
    syscall

    li      $v0,    10
    syscall

findNum:
    li      $t0,    0                       # iterations = 0
    li      $t1,    0                       # left = 0
    li      $t2,    9                       # right = 9

loop:
    sub     $t3,    $t1,            $t2     # left - right
    bgtz    $t3,    endLoop                 # end loop if left > right
    addi    $t0,    1                       # iterations++
    add     $t4,    $t1,            $t2     # mid = left + right
    srl     $t4,    $t4,            1       # mid >>= 1
    sll     $t5,    $t4,            2       # t5 = mid*4
    add     $t5,    $s0,            $t5     # t5 = &list + 4*(mid)
    lw      $t5,    0($t5)                  # load arr[mid]

    beq     $t5,    $s1,            found   # found if arr[mid] = X
    sub     $t5,    $t5,            $s1     # arr[mid] - X
    bltz    $t5,    updateLeft              # update_left if arr[mid] < x

    addi    $t2,    $t4,            -1      # right = mid - 1
    j       loop

updateLeft:
    addi    $t1,    $t4,            1       # left = mid + 1
    j       loop

endLoop:
    li      $t0,    2
    sw      $t0,    4($gp)                  # store 2 at output (right after X)
    j       $ra

found:
    li      $t1,    1
    sw      $t1,    4($gp)                  # store 1 at output
    sw      $t0,    8($gp)                  # store iterations
    sw      $t4,    12($gp)                 # store index of X
    j       $ra
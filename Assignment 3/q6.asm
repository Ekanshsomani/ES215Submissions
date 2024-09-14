.data
string:         .asciiz "Finding a Character"       # Example string
char_to_find:   .byte   'a'                         # c = 'a'
string_length:  .word   11
result:         .word   0

.text
.globl  main

main:
    la      $s0,        string                      # $s0 = arr[]
    lb      $s1,        char_to_find                # $s1 = c
    lw      $s2,        string_length               # $s2 = arrLength
    la      $s3,        result                      # address to store the result
    jal     findChar

    addi    $a0,        $t0,            0           #
    li      $v0,        1                           #
    syscall

    li      $v0,        10                          # Exitting the program
    syscall

findChar:
    move    $t0,        $s0                         # int i = 0
    add     $t1,        $t0,            $s2         # define array end

loop:
    beq     $t0,        $t1,            not_found   # end if i==arrLength
    lb      $t2,        0($t0)                      # load arr[i]
    beq     $t2,        $s1,            found       # if arr[i] == c
    addi    $t0,        $t0,            1           # i++
    j       loop

not_found:
    li      $t0,        -1                          # ans = -1
    j       write_back

found:
    sub     $t0,        $t0,            $s0         # ans = &arr[i] - &arr

write_back:
    sw      $t0,        0($s3)                      # return ans
    j       $ra
.data
A:  .word 1,1,1,1
B:  .word 1,2,3,4,5,6,7,8,9

.text
    li   $s0, 0
    li   $s1, 0
    li   $s2, 0
    li   $s3, 3
    li   $s4, 5

    la   $s6, A
    la   $s7, B

    sub  $t0, $s4, $s3    # $t0 = k = i - j

    sll  $t1, $t0, 2      # $t1 = k * 4
    addu $t2, $s6, $t1    # $t2 = &A[k]
    lw   $t3, 0($t2)      # $t3 = A[k]

    li   $t4, 8
    sll  $t5, $t4, 2      # $t5 = 32
    addu $t6, $s7, $t5    # $t6 = &B[8]

    sw   $t3, 0($t6)

    li   $v0, 10
    syscall

.data
D:  .word 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1

a:  .word 5
b:  .word 2

.text
    lw   $s0, a		# a
    lw   $s1, b		# b

    la   $s6, D		# D

    li $t0, 0
    start_i:
    slt $t2, $t0, $s0
    beq $t2, $zero, end_i
    
    li $t1, 0
    start_j:
    slt, $t3, $t1, $s1
    beq $t3, $zero, end_j
    
    add $t4, $t0, $t1
    sll $t5, $t1, 4
    add $t5, $s3, $t5
    sw $t4, 0($t5)
    
    addi $t1, $t1, 1
    j start_j
    end_j:
    
    addi $t0, $t0, 1
    j start_i
    end_i:
    

    li   $v0, 10
    syscall

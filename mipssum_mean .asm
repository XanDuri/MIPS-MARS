.data

A: .word 1,2,3,4,5,6,7,8,9
N: .word 9
.text
.globl main
main:	la $a0, A
	lw $a1, N
	jal mean
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
sum:	li $v0,0
	sll $t1, $a1, 2
	add $t1, $a0, $t1
	move $t2, $a1
	addi $t3, $a2, 1
	
sum_t_i:slt $t4, $t2, $t3
	beq $t4, $zero, sum_e
	lw $t5, 0($t1)
	add $v0, $v0, $t5
	addi $t1, $t1, 4
	addi $t2, $t2, 1
	j sum_t_i 
	
sum_e: 	jr $ra

mean:	addi $sp, $sp, -8
	sw $a1, 4($sp)
	sw $ra, 0($sp)
	addi $a2, $a1, -1
	li $a1, 0
	jal sum
	lw $ra, 0($sp)
	lw $a1, 4($sp)
	addi $sp, $sp, 8
	div $v0, $v0, $a1
	jr $ra
	

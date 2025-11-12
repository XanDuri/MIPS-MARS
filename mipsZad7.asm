.globl main
.data
n: .word 5

.text
main:
	lw $a0, n
	jal factorial
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0,10
	syscall

factorial:	
	addi $sp, $sp-4
	sw $s0, 0($sp)

       	li $s0, 1
       	li $t0, 1
       	addi $t1, $a0, 1
       	start_n:
       	slt $t2, $t0, $t1
       	beq $t2, $zero, end_n
       	
       	mul $s0, $s0, $t0
       	
       	addi $t0, $t0, 1
       	j start_n
       	end_n:
       	
       	move $v0, $s0
       	lw $s0, 0($sp)
       	addi $sp, $sp, 4
       	jr $ra
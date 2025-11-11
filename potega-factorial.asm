.data
newline: .asciiz "\n"

.text
.globl main

########################
# Funkcja g?ówna (start)
########################
main:
    #### test: potega(2,5) ####
    li   $a0, 2        # x = 2
    li   $a1, 5        # n = 5
    jal  potega        # wywo?anie potega(2,5), wynik w $v0

    # wypisz wynik pot?gi
    move $a0, $v0
    li   $v0, 1
    syscall

    # nowa linia
    la   $a0, newline
    li   $v0, 4
    syscall

    #### test: factorial(5) ####
    li   $a0, 5        # n = 5
    jal  factorial     # wynik w $v0

    # wypisz silni?
    move $a0, $v0
    li   $v0, 1
    syscall

    # koniec programu
    li   $v0, 10
    syscall


########################
# int potega(int x, int n)
# Wej?cie:  x -> $a0,  n -> $a1
# Wyj?cie:  wynik w $v0
########################
potega:
    addi $sp, $sp, -8      # miejsce na x i $ra
    sw   $ra, 4($sp)
    sw   $a0, 0($sp)       # zapisz x

    beq  $a1, $zero, potega_base   # if (n == 0) return 1

    addi $a1, $a1, -1      # n-1
    jal  potega            # rekurencja: potega(x, n-1)

    lw   $t0, 0($sp)       # x
    mul  $v0, $v0, $t0     # v0 = x * wynik_rekurencji
    j    potega_end

potega_base:
    li   $v0, 1            # return 1

potega_end:
    lw   $ra, 4($sp)
    addi $sp, $sp, 8
    jr   $ra


########################
# int factorial(int n)
# Wej?cie:  n -> $a0
# Wyj?cie:  wynik w $v0
########################
factorial:
    addi $sp, $sp, -8      # miejsce na n i $ra
    sw   $ra, 4($sp)
    sw   $a0, 0($sp)       # zapisz n

    beq  $a0, $zero, fact_base   # if (n == 0) return 1

    addi $a0, $a0, -1      # n-1
    jal  factorial         # rekurencja: factorial(n-1)

    lw   $t0, 0($sp)       # n
    mul  $v0, $v0, $t0     # v0 = n * wynik_rekurencji
    j    fact_end

fact_base:
    li   $v0, 1            # return 1

fact_end:
    lw   $ra, 4($sp)
    addi $sp, $sp, 8
    jr   $ra
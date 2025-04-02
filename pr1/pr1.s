// Mirsad Masic, Zadatak 1
.section .data
number:
  .word 31
result:
  .word 0
.section .text
.global main
main:
  lw $t0, number
  andi $t0, $t0, 1
  sw $t0, result
  addiu $v0, $0, 0
  jr $ra
//1 se nalazi u result ako je broj neparan, u slucaju 0 je paran

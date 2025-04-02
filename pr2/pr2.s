// Mirsad Masic, Zadatak 2
.section .data
number:
  .word 4
result:
  .word 0
.section .text
.global main
main:
  lw $t0, number
  // mnozenje sa 22
  sll $t1, $t0, 4
  sll $t2, $t0, 2
  addu $t1, $t1, $t2
  sll $t2, $t0, 1
  addu $t1, $t1, $t2
  // mnozenje sa 7
  sll $t0, $t1, 3
  subu $t1, $t0, $t1
  // modul sa 8
  andi $t1, $t1, 7
  // modul sa 16
  // andi $t1, $t1, 15
  sw $t1, result
  addiu $v0, $0, 0
  jr $ra

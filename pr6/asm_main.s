// Mirsad Masic, Zadatak 6
.section .data
var:
  .hword 5
.section .text
.global main
main:
  addu $t0, $ra, $0
  lui $a0, %hi(var)
  ori $a0, $a0, %lo(var)
  addiu $a1, $0, 10
  jal exchange
  addiu $v0, $0, 0
  addiu $ra, $t0, 0
  jr $ra

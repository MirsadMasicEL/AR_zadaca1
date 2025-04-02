// Mirsad Masic, Zadatak 3
.section .text
.global main
main:
  lui $t1, 0x77ff
  ori $t1, 0xbffe
  and $v0, $t0, $t1
  jr $ra

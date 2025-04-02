// Mirsad Masic, Zadatak 6
.section .text
.global exchange
exchange:
  lh $v0, ($a0)
  sh $a1, ($a0) 
  jr $ra

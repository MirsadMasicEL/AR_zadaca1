//Mirsad Masic, Zadatak 7
.section .text
.globl swap
swap:
  addiu $t0, $0, 0 // i = 0
condition:
  beq $t0, $a2, while_leave // i < size?
  addu $t1, $a0, $t0 // arr1 + i
  addu $t2, $a1, $t0 // arr2 + i
  lw $t4, ($t1) // arr1[i]
  lw $t5, ($t2) // arr1[i]
  addiu $t3, $t4, 0 // temp = arr1[i]
  addiu $t4, $t5, 0 // arr1[i] = arr2[i]
  addiu $t5, $t3, 0 // arr2[i] = temp
  sw $t4, ($t1) // set arr1
  sw $t5, ($t2) // set arr2
  addiu $t0, $t0, 4 // ++i
  j condition
while_leave:
  jr $ra

//Mirsad Masic, Zadatak 7
.section .data
.globl arr1
.align 1
arr1:
  .word 4, 21, -18, 40, 51
.globl arr2
arr2:
  .word 1, 0, -1, 20, 2
.section .text
.globl main
main:
  lui $a0, %hi(arr1)
  ori $a0, $a0, %lo(arr1) // arr1
  lui $a1, %hi(arr2)
  ori $a1, $a1, %lo(arr2) // arr2
  addiu $a2, $0, 20 // sizeof(int) * 4
  addiu $sp, $sp, -4 // stack $ra
  sw $ra, ($sp)
  jal swap // swap()
  lw $ra, ($sp)
  addiu $sp, $sp, 4 // vrati stack
  addiu $v0, $0, 0
  jr $ra

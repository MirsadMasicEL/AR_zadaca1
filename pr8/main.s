.section .data
  .globl buffer
buffer: 
  .space 4

.section .text
  .globl main
main:
  lui $a0, %hi(buffer)
  ori $a0, $a0, %lo(buffer)
  addiu $a1, $0, 4
  addiu $sp, $sp, -4
  sw $ra, ($sp)
  jal toBinary
  lw $ra, ($sp)
  addiu $sp, $sp, 4
  addiu $v0, $0, 0
  jr $ra



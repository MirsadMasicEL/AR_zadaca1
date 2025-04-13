.section .text
  .global transform
transform:
  #a0 = buff
  #a1 = size
  #a2 = funk

  addiu $t0, $0, 0 #brojac
  addiu $t5, $a1, -1


loop:
  slt $t1, $t0, $t5
  beq $t1, $0, outLoop
  addu $t2, $a0, $t0 #adresa
  lb $t3, ($t2)
  addiu $sp, $sp, -16
  sw $ra, 12($sp)
  sw $a0, 8($sp)
  sw $t0, 4($sp)
  sw $t2, ($sp)
  addu $a0, $0, $t3
  jalr $a2
  lw $t2, ($sp)
  lw $t0, 4($sp)
  lw $a0, 8($sp)
  lw $ra, 12($sp)
  sb $v0, ($t2)
  addiu $t0, $t0, 1
  j loop
outLoop:
  addiu $sp, $sp, 16
  addiu $v0, $0, 0
  jr $ra

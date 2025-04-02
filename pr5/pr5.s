// Mirsad Masic, Zadatak 5
.section .rodata
.globl str
str:
  .byte 77, 105, 44, 105, 77, 0
.globl str
size:
  .byte 5 
.section .data
.globl result
result:
  .byte 0
.section .text
.global main
main:
  // ucitavanje velicine niza
  lui $t0, %hi(size)
  ori $t0, $t0, %lo(size)
  lbu $t0, ($t0)
  // ucitavanje adrese od prvog i zadnjeg elementa niza str
  lui $t1, %hi(str)
  ori $t1, $t1, %lo(str)
  addu $t2, $t1, $t0
  addiu $t2, $t2, -1
  j while_body
while_increment:
  // promjena adresa, odnosno prelazak na sljedeci element u nizu
  addiu $t1, $t1, 1
  addiu $t2, $t2, -1
while_body:
  // provjera da li je adresa prvog elementa manja od adrese drugog
  slt $t3, $t1, $t2
  beq $t3, $0, palindrom_true 
  // ucitavanje elemenata sa memorijske lokacije u nizu
  lbu $t4, ($t1)
  lbu $t5, ($t2)
  beq $t4, $t5, while_increment
  j palindrom_not_true
palindrom_true:
  addiu $t0, $0, 1
  lui $t1, %hi(result)
  ori $t1, $t1, %lo(result)
  sb $t0, ($t1)
  j leave_main
palindrom_not_true:
  lui $t1, %hi(result)
  ori $t1, $t1, %lo(result)
  sb $0, ($t1)
leave_main:
  addiu $v0, $0, 0
  jr $ra

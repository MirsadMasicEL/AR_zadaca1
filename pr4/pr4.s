// Mirsad Masic, Zadatak 4
.section .rodata
.globl arr
.align 1
arr:
  .hword 1, 19, 350, 740, 1522
  //test 2 -> .hword 1, 19, 350, 740, 1522, 2020, promijeniti i size na 6
.globl size
size:
  .byte 5 
.section .data
.globl result
.align 1
result:
  .hword 0
.section .text
.global main
main:
  // $t3 je size niza
  lui $t3, %hi(size)
  ori $t3, $t3, %lo(size)
  lbu $t3, ($t3)
  // ucitavanje adrese niza
  lui $t6, %hi(arr)
  ori $t6, $t6, %lo(arr)
  // ucitavanje prvog elementa niza
  lh $t4, ($t6)
  // ucitavanje adrese drugog elementa niza
  addu $t1, $t6, 2
  // pravljenje brojaca i = 1
  addiu $t0, $0, 1
  j while_uslov
increment:
  // povecanje niz++, promjena memorijske adrese
  addiu $t1, $t1, 2
  // postavljanje niz[i]
  addu $t4, $t2, $0
  // povecanje i++
  addiu $t0, $t0, 1
while_uslov:
  // provjera i < size
  beq $t0, $t3, leave
  lh $t2, ($t1)
  // provjera niz[i] < niz[i + 1]
  slt $t5, $t4, $t2
  bne $t5, $0, increment
  j not_true
leave:
  // sortirano
  lui $t0, %hi(arr)
  ori $t0, $t0, %lo(arr)
  // provjera da li je paran broj elemenata niza
  andi $t1, $t3, 1
  bne $t1, $0, odd
  // algoritam za paran broj
  // formula za element size - 2
  addiu $t1, $t3, -2
  addu $t1, $t1, $t0
  lh $t3, ($t1)
  addiu $t1, $t1, 2
  lh $t2, ($t1)
  addu $t0, $t3, $t2
  srl $t0, $t0, 1
  lui $t1, %hi(result)
  ori $t1, $t1, %lo(result)
  sh $t0, ($t1)
  j leave_main
odd:
  // algoritam za neparan broj
  // formula za element size - 1
  addiu $t3, $t3, -1
  addu $t0, $t0, $t3
  lh $t0, ($t0)
  lui $t1, %hi(result)
  ori $t1, $t1, %lo(result)
  sh $t0, ($t1) 
  j leave_main
not_true:
  // nije sortirano
  lui $t0, 0xdead
  ori $t0, $t0, 0xfa11
  lui $t1, %hi(result)
  ori $t1, $t1, %lo(result)
  sh $t0, ($t1)
leave_main:
  addiu $v0, $0, 0
  jr $ra

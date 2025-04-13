.section .text
  .global toBinary
toBinary:
  #a0 = pointer
  #a1 = 32bitna vrijednost
  #v0 = br iteracija

  addiu $t0, $0, 0 #brojac
loop:
  beq $a1, $0, out #da li je a1 = 0
  addu $t1, $a0, $t0 #$t1 je adresa
  andi $t2, $a1, 0x001 #trazimo zadnji bit
  beq $t2, $0, zero #provjeravamo vrijednost zadnjeg bita
  addiu $t3, $0, '1' 
  j outequal
zero:
  addiu $t3, $0, '0'
outequal:
  srl $a1, $a1, 1
  addiu $t0, $t0, 1
  sb $t3, ($t1)
  j loop
out:

#moramo obrnuti ovaj niz
  addiu $t2, $0, 0 #novi brojac od pocetka
  addu $t3, $0, $t0 #brojac sa kraja
  addiu $t3, $t3, -1 #oduzimamo jedan da ostanemo unutar niza
loopReverse:
  slt $t4, $t2, $t3
  beq $t4, $0, outReverse
  addu $t4, $a0, $t2 #ucitavamo adrese
  addu $t5, $a0, $t3
  lb $t6, ($t4) #reverse vrijednosti
  lb $t7, ($t5)
  sb $t7, ($t4)
  sb $t6, ($t5)

  addiu $t2, $t2, 1
  addiu $t3, $t3, -1
  addiu $t4, $t4, 1

  outReverse:
  addu $t1, $a0, $t0 
  sb $0, ($t1) #na kraj dodajemo nulu
  addu $v0, $0, $t0
  jr $ra


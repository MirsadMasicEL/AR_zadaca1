// Mirsad Masic, Zadatak 6
#include <stdio.h>

extern int exchange(int *, int);

int main(){
  int a = 5;
  int* b = &a;
  int result = exchange(b, 10);
  printf("Rezultat funckije je: %d, a vrijednost memorijske lokacije u varijabli je: %d\n", result, *b);
  return 0;
}

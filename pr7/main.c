//Mirsad Masic, Zadatak 6
#include <stdio.h>

extern void swap(int*, int*, int);

int main(){
  int n1[4] = {1, 3, 5, -6};
  int n2[4] = {-2, 4, 8, 11};
  swap(n1, n2, 4 * sizeof(int));
  for(int i = 0; i < 4; ++i){
    printf("%d. broj prvog niza je: %d\n", i + 1, n1[i]);
    printf("%d. broj drugog niza je: %d\n", i + 1, n2[i]);
  }
  return 0;
}

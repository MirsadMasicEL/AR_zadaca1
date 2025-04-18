#include <stdint.h>
#include <stdio.h>

char c1[12] = "Hello world"; 

void transform(char *buff, int32_t size, char (*predicate)(char));

char mytoupper(char c) {
  if (c > 96 && c < 127)
    return c - 32;
  return c;
}

int main(int argc, char *argv[]) {
  transform(c1, 12, mytoupper);
  printf("C1: %s\n", c1);
  return 0;
}

//c version of example code stack_variable.s
#include <stdio.h>

int main()
{
  int i, sum = 0;
  for(i = 1; i < 100, i++){
    sum += i;
  }
   printf("1+2+...+98+99 = %d", sum);
   return 0;
}

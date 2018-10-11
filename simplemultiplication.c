//this is a simple version of a multiplication process for binary number in c
//it is only useful for 4-bit unsigned number, can be a reference for assignment 2 


#include <stdio.h>
int main()
{
  int multiplier, multiplicand, product
  multiplicand = 0b00001010;
  multiplier = 0b00001011;
  product = 0;
  printf("multiplier = 0x%02x (%d)  
          multiplicand = 0x%02x (%d)\n\n",
          multiplier, multiplier,
          multiplicand, multiplicand);
  for (int i = 0; i < 4; i++) {
    if (multiplier & 0x1) {
      product = product + multiplicand;
    }
    multiplier = multiplier >> 1;
    multiplicand = multiplicand << 1;
  }

  printf("product = 0x%02x(%d)\n",
   product, product);
  return 0;
}









#include <stdio.h>

int main (void)
{
   int x;
   int *pX;
   
   pX = &x;
   
   *pX = 5;

   printf("x = %d, pX = %p, *pX = %d, &x = %p, &px = %p\n", x, pX, *pX, &x, &pX);
   printf("%d\n", sizeof(pX));

 
   return 0;
}



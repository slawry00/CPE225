/* Spencer Lawry
 * CPE 225
 * Assignment 7 part 1 */

#include <stdio.h>
void countForwardTo(int x);
void countBackwardsFrom(int x);

int main()
{
   int num;
   printf("Enter a value: ");
   scanf(" %d", &num);
   countBackwardsFrom(num);
   countForwardTo(num);
   return 0;
}

void countBackwardsFrom(int x)
{
   printf("%d, ", x--);

   if (x > 1)
      countBackwardsFrom(x);
   else
   printf("%d\n", x--);
}

void countForwardTo(int x)
{
   if (x != 1)
      countForwardTo(x-1);
    
   printf("%d, ", x);
}


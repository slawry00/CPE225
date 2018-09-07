#include <stdio.h>
#include <string.h>

void arrayFunc(int ar[]);

int main (void)
{
   int nums[10];

   printf("Size of nums is: %d\n", sizeof(nums));
   arrayFunc(nums);

   return 0;
}

void arrayFunc(int ar[])
{
   printf("Size of ar is: %d\n", sizeof(ar));
}

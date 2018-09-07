#include <stdio.h>
#include <string.h>

void printArrayAndX(int ar[], int size, int x);

int main (void)
{
   int x = -1;
   int nums[10] =  {0,1,2,3,4,5,6,7,8,9}; 
 
   /* draw stack and discuss */
   printf("nums = %p &nums[10] = %p &x = %p\n\n", nums, &nums[10], &x);
   printArrayAndX(nums, 10, x);
   
   nums[10] = 10;
   printf("\nMangle x\n");
   printArrayAndX(nums, 10, x);

   x = -1;    
   printf("\nFix x\n");
   printArrayAndX(nums, 10, x);

   printf("\nnums[-1]: %d\n", nums[-1]);

   return 0;
}
void printArrayAndX(int ar[], int size, int x)
{
   int i;

   printf("Array is:\n");
   for (i=0;i<size;i++)
   {
      printf("%d ", ar[i]);
   }
   printf("\nx is %d\n", x);
}

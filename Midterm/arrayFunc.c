#include <stdio.h>

void junk(int a[]);
void junk2(int *a);

int main(void)
{
   int ar[] = {1, 2, 3, 4, 5};
   
   junk(ar);
   
   // print ar, then increment and print again
   printf("ar: %p   ar[0]: %d\n", ar, ar[0]);
   //ar++;
   printf("ar: %p   ar[0]: %d\n", ar, ar[0]);

   // call junk2 to change the array
   junk2(ar);
   printf("ar[2]: %d\n", ar[2]);

   printf("ar[3]: %d\n", ar[3]);
   return 0;
}

void junk(int a[])
{
   printf("a: %p a[0]: %d\n", a, a[0]);
   a++;
   printf("a: %p a[0]: %d\n", a, a[0]);
}

/* a is really a pointer.  Show const */
void junk2(int *a)
{
   a++;
   a[2] = 10;
}










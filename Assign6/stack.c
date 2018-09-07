/* Spencer Lawry */
/* CPE225 */
#include <stdio.h>
int top = -1;
int stack[10];


int push(int value)
{
   if (top >= 9)
      return 1;
   else
   {
      stack[++top] = value;
      return 0;
   }
}

int pop(int *value)
{
   if (top < 0)
      return 1;
   else
   {
      *value = stack[top--];
      return 0;
   }
}

int printStack(int format)
{
   int i;
   if (format == 0)
   {
      for (i = 0; i <= top; i++)
      printf("%d ", stack[i]);
   }
   if (format == 1)
   {
      for (i = 0; i <= top; i++)
      printf("%x ", stack[i]);
   }
   if (format == 2)
   {
      for (i = 0; i <= top; i++)
      printf("%c ", stack[i]);
   }
   return 0;
}

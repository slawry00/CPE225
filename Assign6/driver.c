/* Spencer Lawry */
/* CPE225 */
#include "stack.h"
#include <stdio.h>

int main()
{
   char option;
   int format = 0;
   int num, error;
   printf("Welcome to the stack program.\n");
   printf("\nEnter option: ");
   scanf("%c", &option);
   while (option != 'x')
   {
      if (option == 'd')
      {
         format = 0;
         printf("Stack: ");
         printStack(format);
      }
      if (option == 'h')
      {
         format = 1;
         printf("Stack: ");
         printStack(format);
      }
      if (option == 'c')
      {
         format = 2;
         printf("Stack: ");
         printStack(format);
      }
      if (option == 'u')
      {
         printf("What number? ");
         scanf("%d", &num);
         error = push(num);
         if (error)
            printf("Overflow!!!\n");
         printf("Stack: ");
         printStack(format);
      }
      if (option == 'o')
      {
         error = pop(&num);
         if (error)
            printf("Underflow!!!\n");
         else
            printf("Popped %d\n", num);
         printf("Stack: ");
         printStack(format);
      }
   printf("\n\nEnter option: ");
   scanf(" %c", &option);

   }
   printf("Goodbye!\n");
   return 0;
}


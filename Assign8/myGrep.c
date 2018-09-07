/* Spencer Lawry
 * CPE 225
 * Assignment 8 */

#include <stdio.h>
#include <stdlib.h> /* for malloc */
#include <string.h> /* for string functions*/
#define LINE_SIZE 100
typedef struct FoundWord Word;
struct FoundWord
{
   int line_num;
   int word_num;
   char line_cont[LINE_SIZE];
   Word *next;
};

int main(int argc, char *argv[])
{
   int total_lines = 0;
   int num_chars = 0;
   char long_line[LINE_SIZE];
   char line[LINE_SIZE];
   char line_copy[LINE_SIZE];
   FILE *in_file = fopen(argv[1], "r");


   Word *head = NULL;
   Word *tail;
   char *p;
   int word_counter = 0;
   int words_found = 0;


   /* Part 1 */
   if (argc == 3)
   {
      if (!in_file) /* fopen returns 0 if it fails */
      {
         printf("Unable to open file: %s\n", argv[1]);
         return 1;
      }
      printf("%s %s %s\n", argv[0], argv[1], argv[2]);
   }

   else
   {
      printf("myGrep: improper number of arguments\n");
      printf("Usage: ./a.out <filename> <word>\n");
      return 1;
   }


   /* Part 2 & 3 */
   while (fgets(line, LINE_SIZE, in_file)) /* get lines one at a time */
   {
      total_lines++;
      strcpy(line_copy, line);

      if (strlen(line) > num_chars)
      {
         strcpy(long_line, line);
         num_chars = (int)strlen(line);
      }
      p = strtok(line_copy, " ,.?\n");
      while (p) /* get words one at a time */
      {
         word_counter++;
         if (!strcmp(p, argv[2])) /* if a word was found */
         {
            words_found++;
            if (head == NULL)
            {
               head = malloc(sizeof(Word));
               tail = head;
            }
            else
            {
               tail->next = malloc(sizeof(Word));
               tail = tail->next;
            }
            tail->line_num = total_lines;
            tail->word_num = word_counter;
            strcpy(tail->line_cont, line);
         }
         p = strtok(NULL, " ,.?\n");
      }
      word_counter = 0;
   }
   fclose(in_file);
   printf("longest line: %s", long_line);
   printf("num chars: %d\n", num_chars);
   printf("num lines: %d\n", total_lines);
   printf("total occurrences of word: %d\n", words_found);

   tail = head;
   while (tail != NULL)
   {
      printf("line %d; word %d; %s", tail->line_num - 1, tail->word_num - 1, tail->line_cont);
      free(tail);
      tail = tail->next;
   }
   return 0;
}


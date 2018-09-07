	     .ORIG 	x3300

Q1       .STRINGZ  "\nHow much sleep do you get on average?\n   1 - 9+ Hours\n   2 - 7-8 Hours\n   3 - 5-6 Hours\n   4 - 5 or less Hours\n"
Q1Answ   .FILL    #1
         .FILL    #3
         .FILL    #5
         .FILL    #10

Q2    	 .STRINGZ  "\nHow would you describe your social life?\n   1 - Non Existent\n   2 - Not bad\n   3 - Pretty Good\n   4 - Amazing\n"
Q2Answ   .FILL    #8
         .FILL    #5
         .FILL    #2
         .FILL    #0

Q3    	 .STRINGZ  "\nWhat do you like to do in your free time?\n   1 - Watch Movies\n   2 - Go Hiking\n   3 - Go out with friends\n   4 - I don't have free time\n"
Q3Answ   .FILL    #1
         .FILL    #1
         .FILL    #1
         .FILL    #5

Result1	.STRINGZ  "\nYou're going to fail!\n"
Result2	.STRINGZ  "\nYou're in a lot of trouble!\n"
Result3	.STRINGZ  "\nNot bad! You'll probably be alright!\n"
Result4	.STRINGZ  "\nYou're doing it right! Great job!\n"
ANS	    .STRINGZ  "\n Answer: "

	.END

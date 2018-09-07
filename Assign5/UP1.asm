	.ORIG	x3000		;UP1
	LD R1, TRAP26
	STI R1, V26
	LD R1, ISR
	STI R1, KBIV
	LD R6, STACK
LOOP	TRAP	x26  ; get char
	TRAP	x21  ; print char to screen
	TRAP	x26  ; get char
	TRAP	x21  ; print char to screen
	TRAP	x26  ; get char
	TRAP	x21  ; print char to screen
	TRAP	x26  ; get char
	TRAP	x21  ; print char to screen
	TRAP	x26  ; get char
	TRAP	x21  ; print char to screen
	LEA	R0, END_MSG
	PUTS
	BRnzp LOOP

END_MSG .STRINGZ "\nSuccess!  Running again...\n"
V26	.FILL x0026
KBIV    .FILL x0180
STACK   .FILL x3000
TRAP26  .FILL x3300
UP2     .FILL x3400
ISR     .FILL x3500


        .END

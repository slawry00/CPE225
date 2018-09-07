	.ORIG x3000

; Main
BEG 	AND R3, R3, #0		; Reset the score
	LD R0, Q1L		        ; Loads location of Q1 into R0
	LD R1, Q1AnswL		    ; Loads location of Q1 answers into R1
	JSR PAT			        ; Jumps to question pattern
	LD R0, Q2L		        ; Question 2
	LD R1, Q2AnswL
	JSR PAT
 	LD R0, Q3L		        ; Question 3 
	LD R1, Q3AnswL
	JSR PAT
	
; Give Score
	ADD R3, R3, #-6		    ; Check for Result1
	BRnz RES1
	ADD R3, R3, #-5		    ; Check for Result2
	BRnz RES2		
	ADD R3, R3, #-7		    ; Check for Result3
	Brnz RES3
	BRnzp RES4


; Print Final Message
RES1	LD R0, Result1L		; Store location of Result1 into R0
	PUTS
	BRnzp BEG
RES2	LD R0, Result2L		; Result2
	PUTS
	BRnzp BEG
RES3	LD R0, Result3L		; Result3
	PUTS
	BRnzp BEG
RES4	LD R0, Result4L		; Result4
	PUTS
	BRnzp BEG
	
	
; Question Pattern

PAT	ST R7, STORER7		; Stores R7
	PUTS			    ; Prints Question 
	GETC			    ; gets the number
	ADD R2, R0, #0		; Stores IN data into R2
	LD R0, ANSL		    ; Loads the start of the "Answer :" string into R0
	PUTS			    ; Prints "Answer: "	
	ADD R0, R2, #0		; Puts IN data back into R0
	OUT			        ; Prints the number to the console
	LD R2, ASCII		; Puts -48 into R2
	ADD R0, R0, R2 		; Converts from ASCII to decimal
	JSR POINTS		    ; Calculates Points and updates counter
	LD R7, STORER7		; Loads correct return address into R7
	RET			        ; Jumps to the next question

; Points subroutine

POINTS	ST R0, STORER0		; Store stuff
	ST R1, STORER1
	ADD R1, R1, R0		; R1 now holds 1 past the address of the points to be added
	LDR R0, R1, #-1		; Put amount of points in R0, (subtract 1 from R1 too)
	ADD R3, R3, R0		; Add amount of points to R3 (the counter)
	LD R0, STORER0		; restores R0
	LD R1, STORER1		; restores R1
	RET

; Store Registers and Addresses

STORER7	.FILL x0000
STORER0	.FILL x0000
STORER1	.FILL x0000
ASCII	.FILL #-48
ANSL 	.FILL x34F8
Q1L	.FILL x3300
Q1AnswL	.FILL x3371
Q2L	.FILL x3375
Q2AnswL	.FILL x33E5
Q3L	.FILL x33E9
Q3AnswL	.FILL x3473
Result1L .FILL x3477
Result2L .FILL x348F
Result3L .FILL x34AD
Result4L .FILL x34D4
	.END

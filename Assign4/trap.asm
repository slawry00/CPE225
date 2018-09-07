	.ORIG x3300
	ST R2, STORER2
	ST R0, STORER0
	ST R1, STORER1
KBCHECK	LDI R1, KBSR	; Keyboard Poll
	BRzp KBCHECK	 	; Keyboard Poll
	LDI R1, KBDR	 	; Load Char into R1
	ADD R1, R1, #-10 	; Checking for Null Char
	BRz FINISH          ; If it is the null, break loop
	ADD R1, R1, #10		; Add the 10 back
	STR R1, R0, #0	 	; Write the char into memory at R0's location
	ADD R0, R0, #1	 	; Increment R0 by 1 for next location to be written to
DCHECK  LDI R2, DSR		; Display Poll
    BRzp DCHECK	 	    ; Display Poll	
	STI R1, DDR	 	    ; Store Char from R1 into the DDR to display it
	BRnzp KBCHECK		; Loop back to get another char	




FINISH  STR R1, R0, #0
	LD R0, STORER0
	LD R2, STORER2
	LD R1, STORER1
	RET


; Register Store Addresses
STORER2	.FILL x0000
STORER1 .FILL x0000
STORER0 .FILL x0000
KBSR	.FILL xFE00
KBDR	.FILL xFE02
DSR	.FILL xFE04
DDR	.FILL xFE06 
	.END


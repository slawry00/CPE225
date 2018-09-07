	.ORIG x3300
; Finish Callee Setup
	ADD R6, R6, #-1		; Make room for ret val
	ADD R6, R6, #-1		; decriment R6
	STR R7, R6, #0		; store old R7 into ret addr
	ADD R6, R6, #-1 	; decriment R6
	STR R5, R6, #0		; store old R5 into dyn link
	ADD R5, R6, #-1		; set new frame pointer
	ADD R6, R6, #-1		; set new stack pointer

; Start doing charCount stuff
	AND R3, R3, #0		; result = 0 by default
	STR R3, R6, #0		; storing result = 0 onto the stack
	LDR R2, R5, #4		; Load str into R2
	LDR R2, R2, #0		; Load *str into R2
	BRz DONE		; Branch to Done if current char (*str) == null
	LDR R1, R5, #5		; Load search key (c) into R1
	NOT R1, R1		; NOT R1
	ADD R1, R1, #1		; ADD 1
	ADD R1, R1, R2		; Add current char and -(search key)
	BRnp SKIP		; Skip add 1 if c != *str
	ADD R3, R3, #1		; result = 1
	STR R3, R6, #0		; Storing result = 1 on the stack (overwriting 0)



; Recursive Call
SKIP	LDR R0, R5, #5		; get c into R0
	ADD R6, R6, #-1
	STR R0, R6, #0		; push c onto the stack
	LDR R0, R5, #4		; get str into R0
	ADD R0, R0, #1		; Add 1 to str (to the pointer, not the value it points to)
	ADD R6, R6, #-1		
	STR R0, R6, #0		; push str onto the stack
	LD R0, LOOP
	JSRR R0

; return from recursive call (caller teardown)
	LDR R0, R6, #0		; load ret val into R0
	LDR R1, R5, #0		; load old result into R1
	ADD R1, R0, R1		; result(new) = charCount(rest) + result(old)
	STR R1, R5, #0		; store result onto stack
	ADD R6, R6, #3		; Pop return value and params
	
				
; callee teardown
DONE	LDR R0, R5, #0		; Load result into R0
	STR R0, R5, #3		; Store result into ret val
	ADD R6, R5, #1		; Pop local vars
	LDR R5, R6, #0		; pop dynamic link
	ADD R6, R6, #1
	LDR R7, R6, #0		; pop ret addr
	ADD R6, R6, #1
	RET	


LOOP	.FILL x3300
	.END

	.ORIG	x3400		;UP2
	AND	R1, R1, #0
	LD	R0, AST  	
LOOP	ADD	R1, R1, #1
	BRzp 	LOOP
	OUT
	AND R1, R1, #0
	BRnzp 	LOOP
	
	
AST	.FILL #42
	.END

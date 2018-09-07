 ; Assignment 3                                                                 
   ; Encryption Program                                                            
                                                                                   
   ; Takes Input and Stores it                                                     
           .ORIG  x3000                                                            
          LD     R4, ASCII   ; Stores xFFD0 (-48)into R4 
          LEA    R0, FIRST
          PUTS
          GETC               ; gets encryption code 1-9 and stores in R0          
          OUT                ; writes the character from R0 to the console        
          ST     R0, NUM     ; Stores encryption code from R0 into NUM location   
          LEA R0, SECOND
          PUTS
          LEA    R1, WORD    ; loads address of where WORD starts into R1         
  LOOP    GETC               ; gets next character for the string                 
          STR    R0, R1, #0  ; Stores ASCII of letter(from R0) into address R1 points to
          ADD    R1, R1, #1  ; Adds 1 to R1 for the next storing address          
          OUT                ; writes character to the console                    
          ADD    R0, R0 #-10 ; Subtracts 10 (ASCII of enter key) from R0          
          BRnp   LOOP        ; Loops back to GETC                                 
          STR    R0, R1, #0  ; Adds the null character at the end after the loop terminates
                                                                                  
  ; Prints the Word Original Word                                                 

          ;LEA R0, WORD        Loads location of WORD into R0                     
          ;PUTS                Prints the original string to the screen              
                                                                                  
  ; Encrypts the Word                                                             
          LEA    R1, WORD    ; loads location of WORD into R1                     
  ENCR    LDR    R0, R1, #0  ; Load next char to encrypt into R0
	  ADD    R0, R0, #-10 ; checks for enter key
	  BRz    PRINT       ; Breaks out if it is the enter key
	  ADD    R0, R0, #10 ; Adds the 10 back                             
          AND    R2, R0, #1  ; AND char with #1                                   
          BRz    ADD1        ; Adds 1 if AND #1 = 0                               
          BRnp   SUB1        ; Subtracts 1 if AND #1 = 1                          
  ADDNUM  LD     R2, NUM     ; Loads encryption number into R2                    
          ADD    R0, R0, R2  ; Adds encryption number to R0                       
          ADD    R0, R0, R4  ; subtracts 30 from R0 number                        
          STR    R0, R1, #0  ; Stores encrypted code into memory                  
          ADD    R1, R1, #1  ; Adds 1 to the address counter
          BRnzp  ENCR        ; loops back to ENCR     
                         
                                                                                  
                                                                                  
  ; Prints the Encrypted Word 
  PRINT   LEA R0, THIRD
          PUTS                                                   
          LEA R0, WORD      ; Loads location of WORD into R0                      
          PUTS              ; Prints the encrypted string to the screen              
                                                                                  
          HALT                                                                    
  ; Add or Subtract 1                                                             
  ADD1    ADD R0, R0, #1     ; Add 1 to R0                                        
          BRnzp ADDNUM                                                            
  SUB1    ADD R0, R0, #-1    ; Subtract 1 from R0                                 
          BRnzp ADDNUM                                                            
  ; Storing stuff                                                                 
                                                                                  
  NUM     .FILL x0001                                                             
  WORD    .BLKW #21  
  FIRST   .STRINGZ "Encryption Key (1-9): "
          .FILL x0000
  SECOND  .FILL x000A
          .STRINGZ "Input Message: "
          .FILL x000A
          .FILL x0000
  THIRD   .STRINGZ "Encrypted Message: "
          .FILL x000A
          .FILL x0000
  ASCII   .FILL xFFD0                                                             
          .END 
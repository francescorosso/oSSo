[BITS 16]	;Tells the assembler that its a 16 bit code

MOV AL, 0x23	;print #
CALL PrintCharacter	;Call print string procedure
JMP $ 		;Infinite loop, hang it here.


PrintCharacter:	;Procedure to print character on screen
	;Assume that ASCII value is in register AL
MOV AH, 0x0E	;Tell BIOS that we need to print one charater on screen.
MOV BH, 0x00	;Page no.
MOV BL, 0x07	;Text attribute 0x07 is lightgrey font on black background

INT 0x10	;Call video interrupt
RET		;Return to calling procedure

TIMES 512 - ($ - $$) db 0

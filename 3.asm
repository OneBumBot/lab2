%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    LEA     EBX, [a]
    MOV     ECX, 5
next:
    PUSH    EBX
    PUSH    ECX
    MOV     DL, [EBX]
    MOV     EDI, EBX
next1:
    MOV     AL, [EBX]
    CMP     AL, DL
    JNL     skip
    MOV     DL, AL
    MOV     EDI, EBX
skip:
    INC     EBX
    LOOP    next1
    POP     ECX
    POP     EBX
    
    MOV     AL, [EBX]
    MOV     [EDI], AL
    MOV     [EBX], DL
    
    INC     EBX
    LOOP    next
            
    ret
    
    
section .data
a: DB 5, 3, 6, 2, 4
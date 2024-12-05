JMP MAIN

MSG1 DB 'Enter the first number: $'
MSG2 DB 'Enter the second number: $'
MSG3 DB 'Result is: $'

MAIN:
  MOV DX,OFFSET MSG1
  MOV AH,09
  INT 021

  CALL INPUT
  MOV BX,AX

  MOV DX,OFFSET MSG2
  MOV AH,09
  INT 021

  CALL INPUT
  ADD AX,BX

  MOV DX,OFFSET MSG3
  MOV AH,09
  INT 021

  CALL PRINT_NUM

  INT 020

INPUT:
  PUSH BX
  XOR AX,AX
  XOR BX,BX

  L0:
    MOV AH,01
    INT 021

    CMP AL,0D
    JE L1
    
    IMUL BX,10
    AND AX,0F
    ADD BX,AX
    JMP L0

  L1:
    MOV AX,BX
    POP BX
    RET

PRINT_NUM:
  XOR CX,CX
  CMP AX,0
  JNE PRINT_LOOP
  MOV DX,'0'
  PUSH DX
  INC CX
  JMP L3
  L2:
    XOR DX, DX
    MOV BX, 10
    DIV BX
    ADD DX, '0'
    PUSH DX
    INC CX
    TEST AX, AX
    JNZ L2
  L3: 
    POP DX
    MOV AH, 02H
    INT 21H
    LOOP L3
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H
    MOV DL, 0AH
    MOV AH, 02H
    INT 21H
    RET
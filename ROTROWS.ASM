MOV DS,0B800
MOV BX,160
CYCLE:
  MOV SI,0
  MOV DI,2
  MOV AL,B[DS:SI]
  SHIFT1:
    MOV DL,B[DS:DI]
    MOV B[DS:SI],DL
    ADD SI,2
    ADD DI,2
    CMP SI,158
    JL SHIFT1
  MOV SI,318
  MOV DI,316
  MOV AH,B[DS:SI]
  SHIFT2:
    MOV DL,B[DS:DI]
    MOV B[DS:SI],DL
    SUB SI,2
    SUB DI,2
    CMP SI,160
    JG SHIFT2
  MOV B[DS:160],AL
  MOV B[DS:158],AH
  MOV CX,1
  MOV DX,0
  MOV AH,086
  INT 015
  DEC BX
  CMP BX,0
  JG CYCLE
INT 020

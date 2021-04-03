NAME "Prog"
ORG 100H
.MODEL small
.STACK 512d
.DATA
cont DW 0
aux DB "",10,13,"$"
digite DB "Digite os valores:$"
vet DW 10(0)
.CODE 

CALL INTERACAO
MOV CX, 10
LEA SI, vet

laco:
CALL CONTADOR
CALL LE
loop laco


SAI2:

CALL INCREMENTA
CALL DECREMENTA

CALL TERMINA

CONTADOR:
MOV [SI], AL
CMP AL, 13
JE SAI
INC SI
INC cont
RET

SAI:
JMP SAI2

INCREMENTA:
MOV CX, cont
LEA SI, vet

MOV AH, 09
LEA DX, aux
INT 21H
imprime:
MOV AH, 02
MOV DL, [SI]
INT 21H
INC SI  
loop imprime
RET

DECREMENTA:
MOV CX, cont
SUB SI,1

MOV AH, 09
LEA DX, aux
INT 21H
imprime2:
MOV AH, 02
MOV DL, [SI]
INT 21H
DEC SI
loop imprime2
RET

LE:
MOV AH, 01
INT 21H
RET 

INTERACAO:
MOV AH, 09
LEA DX, digite
INT 21H
RET

TERMINA:
MOV AH, 4CH
INT 21H
END
RET
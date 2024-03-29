SEGMENT CODE:
  LEA R0, DATA
  LDR R1, R0, ONE  ;R1<-1
  LDR R2, R0, TWO  ;R2<-2
  MULT R1, R1, R2  ;R1<-2
  DIV R1, R1, R2   ;R2<-1
  LEA R0, DATATWO  
  MULT R1, R1, R2
  DIV R1, R1, R2
  LDR R5, R0, STORE1 ; R5 <- 2
  MULT R1, R1, R2
  DIV R1, R1, R2
  ADD R5, R5, 4      ; R5 <- 6
  MULT R1, R1, R2
  DIV R1, R1, R2
  STR R5, R0, STORE1
  LDR R6, R0, STORE2 ; R6 <- 3
  MULT R1, R1, R2
  DIV R1, R1, R2
  ADD R6, R6, 5      ; R6 <- 8
  MULT R1, R1, R2
  DIV R1, R1, R2
  STR R6, R0, STORE2
  MULT R1, R1, R2
  DIV R1, R1, R2
  MULT R1, R1, R2
  DIV R1, R1, R2
  LDR R1, R0, STORE1  ; R1 <- 6
  LDR R2, R0, STORE2  ; R2 <- 8
  NEG R1, R1          ; R1 <- -6
  NEG R2, R2          ; R2 <- -8
  NEG R1, R1          ; R1 <- 6
  OR R1, R1, R2
  XOR R1, R1, R2
  NOR R1, R1, R2
  NAND R1, R1, R2
  LEA R0, DATA 
  LDR R1, R0, TWO     ; R1 <- 2
  LDR R2, R0, ONE     ; R2 <- 1
  SUB R2, R2, R1      ; R2 <- -1
  LEA R6, SEVEN
  PUSH R1
  PUSH R2
  POP R3              ; R3 <- -1
  POP R4              ; R4 <- 2
  LDBSE R1, R0, LDF   ; R1 <- 0x0033
  ADD R0, R0, 1
  LDBSE R2, R0, LDF   ; R2 <- 0xFF86
  AND R1, R1, 0
  AND R2, R2, 0
  ADD R1, R1, 6       ; R1 <- 6
  ADD R2, R2, 14      ; R2 <- 14
  XNOR R3, R1, R2
  NOR R4, R3, R1
  AND R1, R1, 0
  AND R2, R2, 0
  ADD R1, R1, 3       ; R1 <- 3
  ADD R2, R2, 4       ; R2 <- 4
  MULT R3, R1, R2     ; R3 <- 12
  MULT R3, R3, R3     ; R3 <- 144
  DIV R3, R3, R2      ; R3 <- 36
  NEG R1, R1          ; R1 <- -3
  DIV R3, R3, R1      ; R3 <- -12
HALT: BRnzp HALT

SEGMENT DATA:
ONE: DATA2 4x0001
TWO: DATA2 4x0002
LDF: DATA2 4x8633
THREE: NOP
FOUR: NOP
FIVE: NOP
SIX: NOP
SEVEN: NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
NOP
SEGMENT DATATWO:
STORE1: DATA2 4x0002
STORE2: DATA2 4x0003

  1)            LUI R0, 15 => 3c00000f  ;   1)   LUI r0, 15	;load r0 with 15 
  2)             LUI R2, 1 => 3c400001  ;   2)   LUI r2, 1 
  3)            LUI R3, 20 => 3c600014  ;   3)   LUI r3, 20 
  4)             LUI R1, 1 => 3c200001  ;   4)   LUI r1, 1 
  5)         SD R0, R15, 0 => 580f0000  ;   5)   sd r0, r15, 0 
  6)        ADDI R3, R3, 1 => 30630001  ;   6)   addi r3, r3, 1 
  7)                   NOP => 00000000  ;   7)   nop 
  8)                   NOP => 00000000  ;   8)   nop 
  9)                   NOP => 00000000  ;   9)   nop 
 10)                   NOP => 00000000  ;  10)   nop 
 11)          SD R2, R3, 0 => 58430000  ;  11)   sd r2, r3, 0 
 12)        ADDI R3, R3, 1 => 30630001  ;  12)   addi r3, r3, 1 ; This is a comment .... 
 13)             LUI R5, 7 => 3ca00007  ;  13)   LUI r5, 7 
 14)        SUB R0, R3, R2 => 08031000  ;  14)   sub r0, r3, r2 
 15)                  HALT => fc000000  ;  15)   halt 

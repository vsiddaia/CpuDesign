  1)             LDI R1, 1 => 40200001  ;   1)   H:	LDI r1, 1	;hi 
  2)             LDI R2, 2 => 40400002  ;   2)   LDI r2, 2 
  3)        ADD R3, R2, R1 => 04620800  ;   3)   ADD r3, r2, r1 
  4)         BEQ R1, R2, H => 6022fff0  ;   4)   BEQ r1, r2, H 
  5)                  HALT => fc000000  ;  12)   L2:	HALT 
  6)                  J L2 => 80000004  ;  13)   J L2 

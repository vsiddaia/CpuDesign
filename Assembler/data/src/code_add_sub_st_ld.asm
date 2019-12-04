LDI r0, 15	;load r0 with 15 
ldi r2, 1 
ldi r3, 20 
ldi r1, 1 
sd r0, r15, 0 
addi r3, r3, 1 
nop
nop
nop
nop
sd r2, r3, 0 
addi r3, r3, 1 ; This is a comment .... 
ldi r5, 7
sub r0, r3, r2
halt
LDI r0, 15	;load r0 with 0
ldi r2, 1
ldi r3, 20
ldi r1, 1
sd r1, r15, 0
addi r3, r3, 1
sd r2, r3, 0
addi r3, r3, 1 ; This is a comment ....
ldi r5, 7
Label: add r4, r1, r2
sd r4, r3, 0
addi r3, r3, 1
mov r1, r2
mov r2, r4
addi r5, r5, -1
bgez r5, Label
halt
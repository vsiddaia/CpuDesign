# Assembler Design

This is a python based assembler design

### Pre-requisite
Python 3.x or higher to compile the assembly

### Options

Option           |       Details     | Example
----------------:|:-----------------:|:-------
**assembler.py** | Assembler program |
**-i**           | Assembly source input file option | **-i ./data/src/doa.asm**
**-o**           | Binary output file option         | **-o ./data/hex/doa.hex**



#### Example - 1

```
🐌 python3.6 ./assembler.py -i ./data/src/doa.asm -o ./data/hex/doa.hex

```

For the command typical display of output would be:

```shell
******************************************* Genie Assembler ********************************************
*                                             Version 0.2                                              *
*                                        Texas State University                                        *
*                        EE 5320: Advanced Computer Architecture and Arithmetic                        *
*                          Contact: (Vittal) v_s191@txstate.edu  (A04848680)                           *
********************************************************************************************************

Input file is : ./data/src/doa.asm
Output file is : ./data/hex/doa.hex
```

### Details

#### Input File

```asm
🐌 cat ./data/src/doa.asm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Author: Vittal Siddaiah
; Date:   12/Mar/2019
; Description:
;   This is a basic program called DOA (Dead on Arrival) to test the CPU on boot.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
xor r0, r1, r1  ; Simple XOR Command
HALT            ; Park to he PC to halt...

```
The above program when compiled would yeild two output files
1. **./data/src/doa.hex** *// a hex file*
2. **./data/src/doa.s**   *//a debug log file*

#### Hex file for the above source would be 
```
🐌 cat ./data/hex/doa.hex 
14 01 08 00
fc 00 00 00
```
#### Debug log file for the above source would be 
```
🐌 cat ./data/hex/doa.s 
  7)        XOR R0, R1, R1 => 14010800  ;   7)   xor r0, r1, r1 
  8)                  HALT => fc000000  ;   8)   HALT 
```


## Future Plans
Implement the assembler in C++


> For More Details 🧞:  vittal.siddaiah@txstate.edu;  vittal.siddaiah@gmail.com

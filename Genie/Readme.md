# Instruction Set Architecture for Genie

Thirty two 32-bit registers = R0 - R31

## Features
* 32 registers of 32-bit width


<table>
    <thead>
        <tr>
            <th>Type</th>
            <th>31:26</th>
            <th>25:21</th>
            <th>20:16</th>
            <th>15:11</th>
            <th>10:6</th>         
            <th>5:0</th>                 
        </tr>
    </thead>
    <tbody>
       <tr style="text-align:center" >
            <td>R</td>
            <td>Opcode</td>
            <td>Rd</td>
            <td>Rs</td>
            <td>Rt</td>
            <td>shamt</td>         
            <td>func</td>                 
        </tr>
        <tr style="text-align:center" >
            <td>I</td>
            <td>Opcode</td>
            <td>Rd</td>
            <td>Rs</td>
            <td colspan=3 > Imm[15:0]</td>               
        </tr>
        <tr style="text-align:center" >
            <td>J</td>
            <td>Opcode</td>
            <td colspan=5 > target[25:0] </td>               
        </tr>
    </tbody>
</table>


---
## Instruction Set
---
````asm 
NOP				0

ADD Rd, Rs, Rt 			1		Rd=Rs+Rt
SUB Rd, Rs, Rt 			2		Rd=Rs-Rt
AND Rd, Rs, Rt 			3		Rd=Rs&Rt
OR  Rd, Rs, Rt 			4		Rd=Rs|Rt
XOR Rd, Rs, Rt 			5		Rd=Rs^Rt

SLL Rd, Rs, shamt		6		Rd=Rt<<shamt
SRL	Rd, Rt, shamt		7		Rd=(unsigned)Rt>>shamt
SRA Rd, rt 			8		Rd=(signed)Rt>>1
SLLV Rd, Rt, Rs 		9		Rd=Rt<<Rs
SRLV rd, rt, rs 		10		rd=(unsiged)rt>>rs

SLT	rd, rs, rt 		23		rd=1 if rs < rt

MOV rd, rs			34		rd=rs
SWAP rd, rs 			35		swap rd and rs

I Type

ADDI rd, rs, const		12		rd=rs+const
ORI	rd, rs, const		13		rd=rs|const
ANDI rd, rs, const		14		rd=rs&const

LUI	rd, const		15		rd=const<<16
LDI rd, const			16		rd=const
LW	rd, rs, const		17		rd=[rs + const]
LH	rd, rs, const		18		rd=[rs + const](lower 2 bytes)
LD 	rd, rs, const		19		rd=[rs + const](lower 1 byte)
SW	rd, rs, const		20		[rs + const]=rd
SH	rd, rs, const		21		[rs + const]=rd(lower 2 bytes)
SD	rd, rs, const		22		[rs + const]=rd(lower 1 bytes)

BEQ rd, offset			24		branch to PC+1+offset if rd = 0
BNE rd, offset			25		branch to PC+1+offset if rd != 0
BGTZ rd, offset			26		branch to PC+1+offset if rd > 0
BLTZ rd, offset			27		branch to PC+1+offset if rd < 0
BGEZ rd, offset			28		branch to PC+1+offset if rd >= 0
BLEZ rd, offset			29		branch to PC+1+offset if rd <= 0

JR	rd, offset 		30		jump to rd + (signed)offset
JALR rd, offset			31		jump to rd + (signed)offset and link

J Type

J 	target			32		jump to target
JAL	target			33		jump to target and link


HALT 				63		HALT the processor
````

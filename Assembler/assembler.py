# -----------------------------------------------------------------------
# Title              : Assembler for Genie Processor 
# Project            : EE 5320: Advanced Computer Architecture and Arithmetic
# File               : assembler.py
# -----------------------------------------------------------------------
# Primary Contact    : v_s191@txstate.edu; vittal.siddaiah@gmail.com;
# RegNo              : A04848680
# Secondary Contact  :
# Creation Date      : 10/Feb/2019 :: 22:44
# -----------------------------------------------------------------------
# Description :
#
#
# -----------------------------------------------------------------------
# Review :
#
#
#
# -----------------------------------------------------------------------
# Copyright (c) 2019 Texas State University
# -----------------------------------------------------------------------
import os
import re
import sys
import getopt
import inspect
import subprocess


# Documentation of Assembler

# Code is NOT CASE Sensitive
#

########################################################################################################
def DebugFrame():
    info = inspect.getframeinfo(inspect.stack()[1][0])
    return "> %s , %25s , %02d-> " % (os.path.basename(info.filename), info.function, info.lineno)


########################################################################################################

########################################################################################################
def GetTerminalWidth():
    command = ['tput', 'cols']
    width = 0
    try:
        width = int(subprocess.check_output(command))
    except OSError as e:
        print("Invalid Command '{0}': exit status ({1})".format(
            command[0], e.errno))
    except subprocess.CalledProcessError as e:
        print("Command '{0}' returned non-zero exit status: ({1})".format(
            command, e.returncode))
    if width < 60: width = 60
    return width


########################################################################################################

########################################################################################################
def GenieVersion(toWidth=False):
    width = GetTerminalWidth()
    width -= 2
    label = ''
    close = '*'
    label += '*' + ' Genie Assembler'.center(width, '*') + '*' + '\n'
    label += '*' + ('Version ' + "0.2").center(width, ' ') + '*' + '\n'
    label += '*' + "Texas State University".center(width, ' ') + '*' + '\n'
    label += '*' + 'EE 5320: Advanced Computer Architecture and Arithmetic'.center(width, ' ') + '*' + '\n'
    label += '*' + "Contact: (Vittal) v_s191@txstate.edu  (A04848680)".center(width, ' ') + '*' + '\n'
    label += '*' + close.center(width, '*') + '*' + '\n'
    return label


########################################################################################################

########################################################################################################
class Assembler:
    """Assembler for the Genie Core
    Assembler Class documentation goes here...
    """
    __asm_file = ""
    __hex_file = ""
    __asm_raw_code = []
    __asm_clean_code = []
    __hex_code = []
    __log_debug = []
    __dict_label = {}
    __dict_instr_imm = {}
    __dict_instr_reg = {}
    __dict_instr_jmp = {}
    __dict_oprnd_pos = {}
    __dict_map_src = {}
    __opcode_offset = 26
    __max_register = 16

    ################################################################################################################
    def __init__(self, inputArgs):
        print(GenieVersion())
        try:
            opts, args = getopt.getopt(inputArgs, "hi:o:", ["ifile=", "ofile="])
        except getopt.GetoptError:
            print('assembler.py -i <inputfile> -o <outputfile>')
            sys.exit(2)
        for opt, arg in opts:
            if opt == '-h':
                print(GenieVersion())
                print("assembler.py -i|--ifile <inputfile> -o|--ofile <outputfile>")
                sys.exit()
            elif opt in ("-i", "--ifile"):
                self.__asm_file = arg
            elif opt in ("-o", "--ofile"):
                self.__hex_file = arg
        print('Input file is :', self.__asm_file)
        print('Output file is :', self.__hex_file)

        self.__clean_parse()
        self.__map_labels()
        self.__define_instructions()
        self.__semantic_analysis()
        self.__generate_code()
        return

    ####################################################################################################################

    ####################################################################################################################
    def __error_handler(self, line_number, error):
        print(" !!! %s !!! Syntax Error !!! in Line : %d => %s      !!!!!" %
              (error, line_number, self.__asm_raw_code[self.__dict_map_src[line_number - 1]].strip()))
        return

    def __del__(self):
        file_name_only = ".".join(re.split(r"\.", self.__hex_file)[:-1])

        with open(file_name_only + ".s", 'w') as debug_outfile:
            for line in self.__log_debug:
                debug_outfile.write(line + "\n")

        buffer = self.__generate_code(True)
        with open(file_name_only + ".hex", 'w') as hex_outfile:
            hex_outfile.write(buffer)
        return

    def __doc__(self):
        return

    def __name__(self):
        return

    ####################################################################################################################

    ####################################################################################################################
    def __semantic_analysis(self):
        line_number = 0;
        for line in self.__asm_clean_code:
            line_number += 1
            op_code = re.split(r"\s+", line, 1)[0].strip()
            if op_code.strip() == "" : continue
            bit_32 = 0
            if op_code in self.__dict_instr_imm:
                # print(">I>", op_code )
                data = re.split(r"\s+", line, 1)[1].strip()
                try:
                    bit_32 = self.__code_generation_immediate(op_code, data, line_number)
                    self.__debug_print(line_number, line, bit_32)
                except Exception as error:
                    self.__error_handler(line_number, error)

            elif op_code in self.__dict_instr_reg:
                data = re.split(r"\s+", line, 1)[1].strip()
                try:
                    bit_32 = self.__code_generation_register(op_code, data)
                    self.__debug_print(line_number, line, bit_32)
                except Exception as error:
                    self.__error_handler(line_number, error)

            elif op_code in self.__dict_instr_jmp:
                data = re.split(r"\s+", line, 1)[1].strip()
                bit_32 = self.__code_generation_jump(op_code, data, len(self.__asm_clean_code))
                self.__debug_print(line_number, line, bit_32)

            elif op_code in self.__dict_instr_spl:
                bit_32 = self.__position_opcode(self.__dict_instr_spl[op_code], 0)
                self.__debug_print(line_number, line, bit_32)

            else:
                raise Exception("%s :: Undefined OpCode %s" % (DebugFrame(), op_code))

            self.__hex_code.append(bit_32)
        return

    ####################################################################################################################

    ####################################################################################################################
    def __code_generation_register(self, opcode, data):
        bit_32 = self.__position_opcode(self.__dict_instr_reg[opcode], 0)
        operands = re.split(r"\s*,\s*", data)

        if 1 < len(operands) > 3:
            raise Exception(" %s Invalid number of operands in line " % DebugFrame())

        offset = 0
        for operand in operands:
            operand = operand.strip()
            if operand[0] == 'R':
                if not self.__check_register_valid(int(operand[1:])):
                    raise Exception("%s :: Invalid register, \"%s\" !, Not defined in architecture. Error in line  " %
                                    (DebugFrame(), operand))
                if offset < 3:
                    bit_32 |= int(operand[1:]) << self.__dict_oprnd_pos[offset]
                else:
                    raise Exception("%s :: Exceeded number of operands in line" % DebugFrame())
            else:
                raise Exception("%s :: Invalid operand at Line" % DebugFrame())
            offset += 1
        # print("%08x" % bit_32)
        return bit_32

    ####################################################################################################################

    ####################################################################################################################
    def __code_generation_immediate(self, opcode, data, line_number):
        bit_32 = self.__position_opcode(self.__dict_instr_imm[opcode], 0)
        operands = re.split(r"\s*,\s*", data)

        if 1 < len(operands) > 3:
            raise Exception("Invalid operand at Line  %s " % DebugFrame())

        offset = 0
        for operand in operands:
            operand = operand.strip()
            if operand in self.__dict_label:
                if offset > 0:
                    jmp_offset = (self.__dict_label[operand] - line_number) * 4 % (1 << 16)
                    bit_32 |= jmp_offset
                else:
                    raise Exception(
                        "Invalid operand %d \"%s\", expect a variable here... %s " % (offset, operand, DebugFrame()))
            elif operand[0] == 'R':
                if not self.__check_register_valid(int(operand[1:])):
                    raise Exception("Invalid register, \"%s\" !, Not defined in architecture. Error in line %s " %
                                    (operand, DebugFrame()))
                if offset < 2:
                    bit_32 |= int(operand[1:]) << self.__dict_oprnd_pos[offset]
                else:
                    raise Exception("Exceeded number of operands in line  %s " % DebugFrame())
            elif self.__is_numeric(operand):
                if offset < 3:
                    bit_32 |= ((int(operand) % (1 << 16)) & 0xFFFF)
                else:
                    raise Exception("Exceeded number of operands in line  %s " % DebugFrame())
            else:
                raise Exception("Invalid operand %d \"%s\"  %s " % (offset, operand, DebugFrame()))
            # print("%08x" % bit_32)
            offset += 1
        # print("%08x" % bit_32)
        return bit_32

    ####################################################################################################################

    ####################################################################################################################
    def __code_generation_jump(self, opcode, data, src_code_length):
        bit_32 = self.__position_opcode(self.__dict_instr_jmp[opcode], 0)
        offset = -1
        data = data.strip()
        if data in self.__dict_label:
            offset = self.__dict_label[data]
        elif self.__is_numeric(data):
            offset = int(data)
        else:
            raise Exception("Cannot Process code, %s %s ,  %s " % (opcode, data, DebugFrame()))

        if offset > src_code_length:
            raise Exception("Unreachable line of code line # %d,  %s " % (offset, DebugFrame()))
        if offset.bit_length() > 26:
            raise Exception("Addressing exceeded the limits # %d,  %s " % (offset, DebugFrame()))

        bit_32 |= offset
        return bit_32

    ####################################################################################################################

    def __is_numeric(self, value):
        try:
            int(value)
            return True
        except ValueError:
            return False

    ####################################################################################################################
    def GetSrcCode(self):
        # print(self.__dict_label)
        line_number = 0
        for codeLine in self.__asm_clean_code:
            line_number += 1
            print(line_number, " ", codeLine)
        return

    ####################################################################################################################

    ####################################################################################################################
    def __define_instructions(self):
        '''
        Instructions and description:
        ADD     Addition, signed, result is same size as operands
        ADDC    Addition with carry, signed, result is same size as operands
        SUB     Subtraction, signed, result is same size as operands, (RS – RT)
        SUBB    Subtraction with borrow, signed, result is same size as operands, (RS – RT)
        MUL     Multiply, signed, result is twice the length of operands up to 32-bits
        MULHI   Multiply, signed, “W” only, result is upper 32 bits of product
        DIV     Divide quotient, signed, result is same size as operands
        REM     Divide remainder, signed, result is same size as operands
        ADDU    Addition, unsigned, result is same size as operands
        ADDCU   Addition with carry, unsigned, result is same size as operands
        SUBU    Subtraction, unsigned, result is same size as operands, (RS – RT)
        SUBBU   Subtraction with borrow, unsigned, result is same size as operands, (RS – RT)
        MULU    Multiply, unsigned, result is twice the length of operands up to 32-bits
        MULHIU  Multiply, unsigned, “W” only, result is upper 32 bits of product
        DIVU    Divide quotient, unsigned, result is same size as operands
        REMU    Divide remainder, unsigned, result is same size as operands
        AND     AND (bitwise), result is same size as operands
        OR      OR (bitwise), result is same size as operands
        XOR     XOR (bitwise), result is same size as operands
        :return:
        :rtype:
        '''
        self.__dict_instr_imm = {
            "ADDI": 12, "ORI": 13, "ANDI": 14, "LUI": 15, "LDI": 16,
            "LW": 17, "LH": 18, "LD": 19, "SW": 20, "SH": 21, "SD": 22,
            "BEQ": 24, "BNE": 25, "BGTZ": 26, "BLTZ": 27, "BGEZ": 28,
            "BLEZ": 29, "JR": 30, "JALR": 31
        }

        self.__dict_instr_reg = {
            "ADD": 1, "SUB": 2, "AND": 3, "OR": 4, "XOR": 5,
            "SLL": 6, "SRL": 7, "SRA": 8, "SLLV": 9, "SRLV": 10,
            "SLT": 23, "MOV": 34, "SWAP": 35
        }

        self.__dict_instr_spl = {
            "NOP": 0, "HALT": 63
        }

        self.__dict_instr_jmp = {
            "J": 32, "JAL": 33
        }

        self.__dict_oprnd_pos = {
            0: 21, 1: 16, 2: 11
        }

        return

    ####################################################################################################################

    ####################################################################################################################

    def __debug_print(self, line_no, line, hex_value):
        self.__log_debug.append("%3d)  %20s => %08x  ; %3d)   %s " %
                                (line_no, line, hex_value, self.__dict_map_src[line_no - 1] + 1,
                                 self.__asm_raw_code[self.__dict_map_src[line_no - 1]].strip()))
        return

    def __generate_code(self, is_file=False):
        print_hex = ""
        if not is_file:
            print_hex += "---,-------------\n"
        hex_buffer = []
        for bit_32 in self.__hex_code:
            hex_buffer.append("%02x %02x %02x %02x" % (((bit_32 & 0xff000000) >> 24), ((bit_32 & 0x00ff0000) >> 16),
                                                       ((bit_32 & 0x0000ff00) >> 8), ((bit_32 & 0x000000ff) >> 0)))

        line_counter = 0
        for buffer in hex_buffer:
            line_counter += 1
            if is_file:
                print_hex += "%s\n" % (buffer)
            else:
                print_hex += "%3d, %s\n" % (line_counter, buffer)

        if not is_file:
            print_hex += "---,-------------"
        return print_hex

    ####################################################################################################################

    ####################################################################################################################
    def __position_opcode(self, opcode_val, bit_32):
        return (bit_32 & 0x03ffffff) | (opcode_val << self.__opcode_offset)

    ####################################################################################################################

    ####################################################################################################################
    def __check_register_valid(self, register_offset):
        if register_offset < (self.__max_register):
            return True
        else:
            return False

    ####################################################################################################################

    ####################################################################################################################
    def __clean_parse(self):
        try:
            with open(self.__asm_file) as fd_asm_file:
                raw_line_counter = 0
                clean_line_counter = 0
                for line in fd_asm_file:
                    raw_line_counter += 1
                    self.__asm_raw_code.append(line)

                    if line.strip() == "":  # skip empty lines and map it
                        continue

                    else:
                        # Step 1: Isolate the instructions from comments and push into list.
                        try:
                            line = line.split(";", 1)[0]
                            self.__asm_clean_code.append(line.strip().upper())
                            clean_line_counter += 1
                            self.__dict_map_src[clean_line_counter - 1] = (raw_line_counter - 1)
                        except:
                            self.__error_handler(raw_line_counter)
                        # From this point it should be only valid codes for compilation
                        # Step 2: Make the op-code case-insensitive so that we can read strings

            # print("\n".join(self.__asm_clean_code))
            # print(self.__dict_map_src)
        except:
            print("Unable to open file %s , please verify ..." % os.path.abspath(self.__asm_file))

        return

    ####################################################################################################################

    ####################################################################################################################
    def __map_labels(self):
        line_number = 0
        for line in self.__asm_clean_code:
            line_number += 1
            if ":" in line:
                labelLineArray = line.split(":", 1)
                self.__dict_label[labelLineArray[0].strip()] = line_number - 1
                try:
                    self.__asm_clean_code[line_number - 1] = labelLineArray[1].strip()
                except:
                    self.__error_handler(line_number)
        return
    ####################################################################################################################


def main(argv):
    assembler = Assembler(argv)
    assembler.GetSrcCode()
    ####################################################################################################################


if __name__ == "__main__":
    main(sys.argv[1:])

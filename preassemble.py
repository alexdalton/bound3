#!/usr/bin/env python

from optparse import OptionParser
from shutil import move
from os import remove, close
import string

def convert_to_hex(line_toks):
  bin_str = ''
  op_dict = {"MULT": ("0001", "01"), "DIV":("0001", "10"), "SUB":("0001", "11"),
               "OR": ("0101", "01"), "XOR":("0101", "10"), "NEG":("0101", "11"),
               "NOR":("0101", "01"), "XNOR":("0101", "10")}
  reg_dict = {"R0":"000", "R1":"001", "R2":"010", "R3":"011", "R4":"100",
              "R5":"101", "R6":"110", "R7":"111"}
  dr = string.rstrip(line_toks[1], ',')
  sr1 = string.rstrip(line_toks[2], ',')

  if line_toks[0] == 'NEG':
    sr2 = sr1
  else:
    print line_toks
    sr2 = string.rstrip(line_toks[3], ',;')

  op_info = op_dict[string.rstrip(line_toks[0], ',')]

  bin_str = op_info[0] + reg_dict[dr] + reg_dict[sr1] + '0' + op_info[1] + reg_dict[sr2]
  
  return '%04X' % int(bin_str, 2)


parser = OptionParser()
parser.add_option("-f", "--file", dest="filename",
		  help="file to pre-assemble", metavar="FILE")
(options, args) = parser.parse_args()
if not options.filename:
  print("No file name provided")
  exit(1)

new_file = open("../testcode/preassemble.asm", 'w')
old_file = open(options.filename)
for line in old_file:
  tokens = line.split()
  if len(tokens) <= 0:
    continue
  if tokens[0] == "MULT":
    new_file.write("DATA2 4x" + convert_to_hex(tokens) + '\n')
  elif tokens[0] == "DIV":
    new_file.write("DATA2 4x" + convert_to_hex(tokens) + '\n')
  elif tokens[0] == "SUB":
    new_file.write("DATA2 4x" + convert_to_hex(tokens) + '\n')
  elif tokens[0] == "OR":
    new_file.write("DATA2 4x" + convert_to_hex(tokens) + '\n')
  elif tokens[0] == "XOR":
    new_file.write("DATA2 4x" + convert_to_hex(tokens) + '\n')
  elif tokens[0] == "NEG":
    new_file.write("DATA2 4x" + convert_to_hex(tokens) + '\n')
  elif tokens[0] == "LDBSE":
    tokens[0] = "LDB"
    new_file.write(string.join(tokens) + '\n')
    new_file.write("LSHF " + tokens[1] + ' ' + tokens[1] + ' 8\n')
    new_file.write("RSHFA " + tokens[1] + ' ' + tokens[1] + ' 8\n')
  elif tokens[0] == "NOR": 
    new_file.write("DATA2 4x" + convert_to_hex(tokens) + '\n')
    new_file.write("NOT " + tokens[1] + ' ' + string.rstrip(tokens[1], ',') + '\n')
  elif tokens[0] == "XNOR":
    new_file.write("DATA2 4x" + convert_to_hex(tokens) + '\n')
    new_file.write("NOT " + tokens[1] + ' ' + string.rstrip(tokens[1], ',') + '\n')
  elif tokens[0] == "NAND":
    tokens[0] = "AND"
    new_file.write(string.join(tokens) + '\n')
    new_file.write("NOT " + tokens[1] + ' ' + string.rstrip(tokens[1], ',') + '\n')
  elif tokens[0] == "PUSH":
    new_file.write("STR " + tokens[1] + ', ' + "R6, 0\n")
    new_file.write("ADD R6, R6, -2\n")
  elif tokens[0] == "POP":
    new_file.write("ADD R6, R6, 2\n")
    new_file.write("LDR " + tokens[1] + ', ' + "R6, 0\n")
  else:
    new_file.write(line)

new_file.close()
old_file.close()
move(options.filename, options.filename + '.bk')
move("../testcode/preassemble.asm", options.filename)

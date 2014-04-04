--
-- VHDL Architecture ece411.CW_ROM.untitled
--
-- Created:
--          by - lis2.ews (gelib-057-27.ews.illinois.edu)
--          at - 22:17:42 03/19/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY CW_ROM IS
   PORT( 
      OPCODE : IN     LC3B_OPCODE;
      clk    : IN     std_logic;
      CW1out : OUT    LC3B_DWORD
   );

-- Declarations

END CW_ROM ;

--
ARCHITECTURE untitled OF CW_ROM IS
BEGIN
  controlROM : PROCESS(OPCODE)
  VARIABLE cword_out : lc3b_dword;
    BEGIN
        CASE OPCODE is  --X     X   XXX XXX 0   X   0   0   XX  00  X   0   X   0   XXXXXXXXXXX = do nothing. NOP = branch with nzp = 000.
          when OP_ADD =>--31    30  29  26  23  22  21  20  19  17  15  14  13  12  11
            cword_out := "100000000010XX000100XXXXXXXXXXXX";
          when OP_AND =>
            cword_out := "100010000010XX000100XXXXXXXXXXXX";
          when OP_NOT =>
            cword_out := "100100000010XX000100XXXXXXXXXXXX";
          when OP_BR =>
            cword_out := "XXXXXXXX0X00XX00X0X1XXXXXXXXXXXX";
          when OP_JSR =>
            cword_out := x"XXXXXXXX";
          when OP_JMP =>
            cword_out := x"XXXXXXXX";
          when OP_LDR =>
            cword_out := "11000001111100000110XXXXXXXXXXXX";
          when OP_LDB =>
            cword_out := x"XXXXXXXX";
          when OP_LDI =>
            cword_out := x"XXXXXXXX";
          when OP_LEA =>
            cword_out := x"XXXXXXXX";
          when OP_RTI =>
            cword_out := x"XXXXXXXX";
          when OP_SHF =>
            cword_out := x"XXXXXXXX";
          when OP_STR =>
            cword_out := "11000001010100110010XXXXXXXXXXXX";
          when OP_STB =>
            cword_out := x"XXXXXXXX";
          when OP_STI =>
            cword_out := x"XXXXXXXX";
          when OP_TRAP =>
            cword_out := x"XXXXXXXX";
          when others =>
            cword_out := "XXXXXXXX0X00XX00X0X0XXXXXXXXXXXX";   
        end CASE;
        CW1out <= cword_out after DELAY_ROM;
  END PROCESS;
END ARCHITECTURE untitled;


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
      IR5_4  : IN   LC3B_SHFTOP;
      clk    : IN     std_logic;
      CW1out : OUT    LC3B_DWORD
   );

-- Declarations

END CW_ROM ;

--
ARCHITECTURE untitled OF CW_ROM IS
BEGIN
  controlROM : PROCESS(OPCODE, IR5_4)
  VARIABLE cword_out : lc3b_dword;
    BEGIN
        CASE OPCODE is  --X     X   XXX XXX 0   X   0   0   XX  00  X   0   X   0   XXXXXXXXXXX = do nothing. NOP = branch with nzp = 000.
          when OP_ADD =>--31    30  29  26  23  22  21  20  19  17  15  14  13  12  11
            cword_out := "10000000001000000100000000000000";
          when OP_AND =>
            cword_out := "10001000001000000100000000000000";
          when OP_NOT =>
            cword_out := "10010000001000000100000000000000";
          when OP_BR =>
            cword_out := "00000000000000000001000000000000";
          when OP_JSR =>
            cword_out := "10000000000000001100101000000000";
          when OP_JMP =>
            cword_out := "10000000000000000000100000000000";
          when OP_LDR =>
            cword_out := "11000001111100000110000000000000";
          when OP_LDB =>
            cword_out := "11000011111100000110010000000000";
          when OP_LDI =>
            cword_out := "00000000000000000000000000000000";
          when OP_LEA =>
            cword_out := "10000100001000000100000100000000";
          when OP_RTI =>
            cword_out := "00000000000000000000000000000000";
          when OP_SHF =>
            CASE IR5_4 is
              when SHFT_SLL =>
                cword_out := "10100010001000000100000000000000";
              when SHFT_SRL =>
                cword_out := "10110010001000000100000000000000";
              when SHFT_SRA =>
                cword_out := "10111010001000000100000000000000";
              when others =>
                cword_out := "10100010001000000100000000000000";
            end case;
          when OP_STR =>
            cword_out := "11000001010100110010000000000000";
          when OP_STB =>
            cword_out := "11000011010100010010010000000000";
          when OP_STI =>
            cword_out := "00000000000000000000000000000000";
          when OP_TRAP =>
            cword_out := "00000000100110001100001010000000";
          when others =>
            cword_out := "00000000000000000000000000000000";   
        end CASE;
        CW1out <= cword_out after DELAY_ROM;
  END PROCESS;
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.SEXT5.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-31.ews.illinois.edu)
--          at - 17:52:57 02/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY SEXT5 IS
   PORT( 
      imm5   : IN     LC3b_IMM5;
      sext16 : OUT    LC3b_word
   );

-- Declarations

END SEXT5 ;

--
-- sign extend 5 bits to 16 bits
ARCHITECTURE untitled OF SEXT5 IS
BEGIN
  sext16 <= imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5(4) & imm5 AFTER DELAY_MUX2;
END ARCHITECTURE untitled;


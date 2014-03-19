--
-- VHDL Architecture ece411.wordsplit.untitled
--
-- Created:
--          by - buris2.ews (evrt-252-13.ews.illinois.edu)
--          at - 10:45:40 02/25/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY wordsplit IS
   PORT( 
      word_in : IN     lc3b_word;
      byteH   : OUT    lc3b_byte;
      byteL   : OUT    lc3b_byte
   );

-- Declarations

END wordsplit ;

--
ARCHITECTURE untitled OF wordsplit IS
BEGIN
  byteH <= word_in(15 DOWNTO 8);
  byteL <= word_in(7 DOWNTO 0);
END ARCHITECTURE untitled;


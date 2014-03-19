--
-- VHDL Architecture ece411.SEXT6.untitled
--
-- Created:
--          by - buris2.ews (siebl-0218-16.ews.illinois.edu)
--          at - 19:20:32 02/05/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY SEXT6 IS
   PORT( 
      clk         : IN     std_logic;
      index6      : IN     LC3b_index6;
      SEXToffset6 : OUT    lc3b_word
   );

-- Declarations

END SEXT6 ;

--
ARCHITECTURE untitled OF SEXT6 IS
BEGIN
  SEXToffset6 <= INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6 AFTER DELAY_MUX2;
END ARCHITECTURE untitled;
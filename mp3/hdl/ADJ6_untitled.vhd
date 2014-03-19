--
-- VHDL Architecture ece411.ADJ6.untitled
--
-- Created:
--          by - buris2.ews (evrt-252-11.ews.illinois.edu)
--          at - 16:21:40 01/25/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ6 IS
   PORT( 
      clk     : IN     std_logic;
      index6  : IN     LC3b_index6;
      ADJ6out : OUT    LC3b_word
   );

-- Declarations

END ADJ6 ;

--
ARCHITECTURE untitled OF ADJ6 IS
BEGIN
  	ADJ6OUT <= INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6(5) & INDEX6 & '0' AFTER DELAY_MUX2;
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.ADJ8.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 19:19:30 02/03/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ8 IS
   PORT( 
      clk       : IN     std_logic;
      trapvect8 : IN     lc3b_trapvect8;
      ADJ8out   : OUT    lc3b_word
   );

-- Declarations

END ADJ8 ;

-- out <= ZEXT(trapvect8) << 1
-- ZEXT has no delay
ARCHITECTURE untitled OF ADJ8 IS
BEGIN
  ADJ8out <= "0000000" & trapvect8 & '0';
END ARCHITECTURE untitled;

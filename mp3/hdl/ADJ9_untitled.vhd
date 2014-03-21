--
-- VHDL Architecture ece411.ADJ9.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-16.ews.illinois.edu)
--          at - 21:09:43 03/20/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADJ9 IS
   PORT( 
      offset9  : IN    LC3b_offset9;
      ADJ9out : OUT    LC3b_word
   );

-- Declarations

END ADJ9 ;

--
ARCHITECTURE UNTITLED OF ADJ9 IS
BEGIN
	ADJ9OUT <= OFFSET9(8) & OFFSET9(8) & OFFSET9(8) & OFFSET9(8) & OFFSET9(8) & OFFSET9(8) & OFFSET9 & '0' AFTER DELAY_MUX2;
END UNTITLED;



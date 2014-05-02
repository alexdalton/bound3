--
-- VHDL Architecture ece411.NAND2.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-17.ews.illinois.edu)
--          at - 00:26:32 02/20/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NAND2 IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      C : OUT    std_logic
   );

-- Declarations

END NAND2 ;

--
ARCHITECTURE untitled OF NAND2 IS
BEGIN
  C <= NOT(A AND B) after DELAY_LOGIC2;
END ARCHITECTURE untitled;


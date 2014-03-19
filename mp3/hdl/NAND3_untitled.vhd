--
-- VHDL Architecture ece411.NAND3.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-17.ews.illinois.edu)
--          at - 00:29:33 02/20/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NAND3 IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      C : IN     std_logic;
      D : OUT    std_logic
   );

-- Declarations

END NAND3 ;

--
ARCHITECTURE untitled OF NAND3 IS
BEGIN
  D <= NOT(A AND B AND C) after DELAY_LOGIC3;
END ARCHITECTURE untitled;


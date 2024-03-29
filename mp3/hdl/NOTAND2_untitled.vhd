--
-- VHDL Architecture ece411.NOTAND2.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-16.ews.illinois.edu)
--          at - 22:32:12 02/19/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NOTAND2 IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      C : OUT    std_logic
   );

-- Declarations

END NOTAND2 ;

--
ARCHITECTURE untitled OF NOTAND2 IS
BEGIN
  C <= NOT(A) AND B after DELAY_LOGIC2;
END ARCHITECTURE untitled;


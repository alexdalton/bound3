--
-- VHDL Architecture ece411.ORINV2.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-31.ews.illinois.edu)
--          at - 23:15:33 03/19/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ORINV2 IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      C : OUT    std_logic
   );

-- Declarations

END ORINV2 ;

--
ARCHITECTURE untitled OF ORINV2 IS
BEGIN
  C <= NOT(A) OR B after DELAY_LOGIC2;
END ARCHITECTURE untitled;


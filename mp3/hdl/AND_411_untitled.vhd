--
-- VHDL Architecture ece411.AND_411.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-34.ews.illinois.edu)
--          at - 01:09:10 02/14/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AND2 IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      C : OUT    std_logic
   );

-- Declarations

END AND2 ;

--
ARCHITECTURE untitled OF AND2 IS
BEGIN
  C <= A and B after DELAY_LOGIC2;
END ARCHITECTURE untitled;


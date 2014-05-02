--
-- VHDL Architecture ece411.NOR2.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-18.ews.illinois.edu)
--          at - 23:12:10 02/26/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY NOR2 IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      C : OUT    std_logic
   );

-- Declarations

END NOR2 ;

--
ARCHITECTURE untitled OF NOR2 IS
BEGIN
  C <= not(A or B) after DELAY_LOGIC2;
END ARCHITECTURE untitled;


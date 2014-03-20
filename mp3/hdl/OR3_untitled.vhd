--
-- VHDL Architecture ece411.OR3.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 19:55:01 03/19/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY OR3 IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      C : IN     std_logic;
      D : OUT    std_logic
   );

-- Declarations

END OR3 ;

--
ARCHITECTURE untitled OF OR3 IS
BEGIN
  D <= A or B or C after delay_logic3;
END ARCHITECTURE untitled;


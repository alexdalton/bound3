--
-- VHDL Architecture ece411.OR4.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-12.ews.illinois.edu)
--          at - 17:26:23 04/16/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY OR4 IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      C : IN     std_logic;
      D : IN     std_logic;
      E : OUT    std_logic
   );

-- Declarations

END OR4 ;

--
ARCHITECTURE untitled OF OR4 IS
BEGIN
  E <= A or B or C or D after delay_logic4;
END ARCHITECTURE untitled;


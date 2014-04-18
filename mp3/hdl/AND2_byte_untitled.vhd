--
-- VHDL Architecture ece411.AND2_byte.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-12.ews.illinois.edu)
--          at - 16:42:56 04/16/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AND2_byte IS
   PORT( 
      A : IN     lc3b_byte;
      B : IN     lc3b_byte;
      C : OUT    lc3b_byte
   );

-- Declarations

END AND2_byte ;

--
ARCHITECTURE untitled OF AND2_byte IS
BEGIN
    C <= A AND B after delay_logic3;
END ARCHITECTURE untitled;


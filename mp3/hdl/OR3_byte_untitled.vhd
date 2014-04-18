--
-- VHDL Architecture ece411.OR3_byte.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-12.ews.illinois.edu)
--          at - 16:40:19 04/16/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY OR3_byte IS
   PORT( 
      A : IN     lc3b_byte;
      B : IN     lc3b_byte;
      C : IN     lc3b_byte;
      D : OUT    lc3b_byte
   );

-- Declarations

END OR3_byte ;

--
ARCHITECTURE untitled OF OR3_byte IS
BEGIN
  D <= A OR B OR C after delay_logic3;
END ARCHITECTURE untitled;


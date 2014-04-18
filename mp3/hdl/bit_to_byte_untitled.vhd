--
-- VHDL Architecture ece411.bit_to_byte.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-12.ews.illinois.edu)
--          at - 19:18:04 04/16/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY bit_to_byte IS
   PORT( 
      Valid           : IN     std_logic;
      Valid_expanded : OUT    lc3b_byte
   );

-- Declarations

END bit_to_byte ;

--
ARCHITECTURE untitled OF bit_to_byte IS
BEGIN
  Valid_expanded <= Valid & Valid & Valid & Valid & Valid & Valid & Valid & Valid;
END ARCHITECTURE untitled;


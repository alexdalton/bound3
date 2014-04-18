--
-- VHDL Architecture ece411.valid_delay_6ns.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 23:53:36 04/16/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY valid_delay_6ns IS
   PORT( 
      RD_V          : IN     std_logic;
      Valid_delayed : OUT    std_logic
   );

-- Declarations

END valid_delay_6ns ;

--
ARCHITECTURE untitled OF valid_delay_6ns IS
BEGIN
  Valid_delayed <= RD_V after 6ns;
END ARCHITECTURE untitled;


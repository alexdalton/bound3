--
-- VHDL Architecture ece411.RWactiveHITdelay.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-33.ews.illinois.edu)
--          at - 15:40:44 02/27/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RWactiveHITdelay IS
   PORT( 
      RWactiveHIT : IN     std_logic;
      LRU_load    : OUT    std_logic
   );

-- Declarations

END RWactiveHITdelay ;

--
ARCHITECTURE untitled OF RWactiveHITdelay IS
BEGIN
  LRU_load <= RWactiveHIT after 0ns;
END ARCHITECTURE untitled;


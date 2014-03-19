--
-- VHDL Architecture ece411.eq_v0Delay6ns.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-18.ews.illinois.edu)
--          at - 04:57:55 02/27/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY eq_v0Delay IS
   PORT( 
      eq_v0         : IN     std_logic;
      eq_v0_delayed : OUT    std_logic
   );

-- Declarations

END eq_v0Delay ;

--
ARCHITECTURE untitled OF eq_v0Delay IS
BEGIN
  eq_v0_delayed <= eq_v0 after 4ns;
END ARCHITECTURE untitled;


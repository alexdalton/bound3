--
-- VHDL Architecture ece411.dirty_delay.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-37.ews.illinois.edu)
--          at - 03:22:25 02/28/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY dirty_delay IS
   PORT( 
      set_dirty     : IN     std_logic;
      dirty_delayed : OUT    std_logic
   );

-- Declarations

END dirty_delay ;

--
ARCHITECTURE untitled OF dirty_delay IS
BEGIN
  dirty_delayed <= set_dirty after 1ns;
END ARCHITECTURE untitled;


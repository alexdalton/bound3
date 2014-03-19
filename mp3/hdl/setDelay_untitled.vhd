--
-- VHDL Architecture ece411.setDelay.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-33.ews.illinois.edu)
--          at - 14:09:43 02/27/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY setDelay IS
   PORT( 
      set_index   : IN     lc3b_c_index;
      set_index_delayed : OUT    lc3b_c_index
   );

-- Declarations

END setDelay ;

--
ARCHITECTURE untitled OF setDelay IS
BEGIN
  set_index_delayed <= set_index after 25ns;
END ARCHITECTURE untitled;


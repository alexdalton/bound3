--
-- VHDL Architecture ece411.ADDR_split.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-34.ews.illinois.edu)
--          at - 23:56:07 02/13/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ADDR_split IS
   PORT( 
      ADDRESS   : IN     LC3b_word;
      offset    : OUT    lc3b_c_offset;
      offset3_1 : OUT    lc3b_8mux_sel;
      set_index : OUT    lc3b_c_index;
      tag       : OUT    lc3b_c_tag
   );

-- Declarations

END ADDR_split ;

--
ARCHITECTURE untitled OF ADDR_split IS
BEGIN
  offset <= ADDRESS(3 DOWNTO 0);
  offset3_1 <= ADDRESS(3 DOWNTO 1);
  set_index <= ADDRESS(6 DOWNTO 4);
  tag <= ADDRESS(15 DOWNTO 7);
  --no delay needed for splitting
END ARCHITECTURE untitled;


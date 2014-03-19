--
-- VHDL Architecture ece411.tagDelay20ns.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-18.ews.illinois.edu)
--          at - 04:46:48 02/27/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY tagDelay20ns IS
   PORT( 
      tag         : IN     lc3b_c_tag;
      tag_delayed : OUT    lc3b_c_tag
   );

-- Declarations

END tagDelay20ns ;

--
ARCHITECTURE untitled OF tagDelay20ns IS
BEGIN
  tag_delayed <= tag after 20ns;
END ARCHITECTURE untitled;


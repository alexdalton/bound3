--
-- VHDL Architecture ece411.Tag_Compare.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-34.ews.illinois.edu)
--          at - 00:50:13 02/14/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Tag_Compare IS
  PORT( 
      TagA      : IN     lc3b_c_tag;
      TagB      : IN     lc3b_c_tag;
      isEqual   : OUT    std_logic
   );

-- Declarations
END ENTITY Tag_Compare;

--
ARCHITECTURE untitled OF Tag_Compare IS
BEGIN
    --isEqual <= TagA = TagB after DELAY_COMPARE8;
    isEqual <= '1' WHEN (TagA = TagB) ELSE
               '0'after DELAY_COMPARE8;
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.bit_join.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-17.ews.illinois.edu)
--          at - 01:11:43 02/20/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY bit_join IS
   PORT( 
      set_index  : IN     lc3b_c_index;
      tagMUXout  : IN     lc3b_c_tag;
      WRbackADDR : OUT    LC3b_word
   );

-- Declarations

END bit_join ;

--
ARCHITECTURE untitled OF bit_join IS
BEGIN
  WRbackADDR <= tagMUXout & set_index & "0000";
END ARCHITECTURE untitled;


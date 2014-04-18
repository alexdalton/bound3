--
-- VHDL Architecture ece411.RD_IR_ripper.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-12.ews.illinois.edu)
--          at - 17:04:54 04/16/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RD_IR_ripper IS
   PORT( 
      RD_IR  : IN     lc3b_word;
      IR11_9 : OUT    lc3b_reg;
      IR2_0  : OUT    lc3b_reg;
      IR8_6  : OUT    lc3b_reg
   );

-- Declarations

END RD_IR_ripper ;

--
ARCHITECTURE untitled OF RD_IR_ripper IS
BEGIN
  IR11_9 <= RD_IR(11 downto 9);
  IR8_6 <= RD_IR(8 downto 6);
  IR2_0 <= RD_IR(2 downto 0);
END ARCHITECTURE untitled;


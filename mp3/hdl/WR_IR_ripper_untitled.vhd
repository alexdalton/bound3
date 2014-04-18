--
-- VHDL Architecture ece411.WR_IR_ripper.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-12.ews.illinois.edu)
--          at - 16:33:12 04/16/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WR_IR_ripper IS
   PORT( 
      WR_IR   : IN     lc3b_word;
      destreg : OUT    lc3b_reg
   );

-- Declarations

END WR_IR_ripper ;

--
ARCHITECTURE untitled OF WR_IR_ripper IS
BEGIN
  destreg <= WR_IR(11 downto 9);
END ARCHITECTURE untitled;


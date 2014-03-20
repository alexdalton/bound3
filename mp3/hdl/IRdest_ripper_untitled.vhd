--
-- VHDL Architecture ece411.IRdest_ripper.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 22:14:02 03/19/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IRdest_ripper IS
   PORT( 
      IR4out   : IN     lc3b_word;
      clk      : IN     std_logic;
      destreg5 : OUT    lc3b_reg
   );

-- Declarations

END IRdest_ripper ;

--
ARCHITECTURE untitled OF IRdest_ripper IS
BEGIN
  destreg5 <= IR4out(11 DOWNTO 9);
END ARCHITECTURE untitled;


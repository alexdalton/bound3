--
-- VHDL Architecture ece411.IRnzp_ripper.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 19:58:48 03/19/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IRnzp_ripper IS
   PORT( 
      IR3out : IN     lc3b_word;
      clk    : IN     std_logic;
      NZP    : OUT    LC3b_CC
   );

-- Declarations

END IRnzp_ripper ;

--
ARCHITECTURE untitled OF IRnzp_ripper IS
BEGIN
  NZP <= IR3out(11 DOWNTO 9);
END ARCHITECTURE untitled;


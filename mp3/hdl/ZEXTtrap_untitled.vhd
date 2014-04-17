--
-- VHDL Architecture ece411.ZEXTtrap.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-40.ews.illinois.edu)
--          at - 22:51:15 04/16/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ZEXTtrap IS
   PORT( 
      IR3out   : IN     lc3b_word;
      zext8out : OUT    lc3b_word
   );

-- Declarations

END ZEXTtrap ;

--
ARCHITECTURE untitled OF ZEXTtrap IS
BEGIN
  zext8out <= "0000000" & IR3out(7 downto 0) & '0';
END ARCHITECTURE untitled;


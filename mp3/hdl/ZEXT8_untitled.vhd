--
-- VHDL Architecture ece411.ZEXT8.untitled
--
-- Created:
--          by - buris2.ews (siebl-0218-16.ews.illinois.edu)
--          at - 18:21:21 02/05/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ZEXT8 IS
   PORT( 
      zext8in  : IN     lc3b_word;
      zext8out : OUT    lc3b_word
   );

-- Declarations

END ZEXT8 ;

--gets lower 8 bits of data, zero extends
ARCHITECTURE untitled OF ZEXT8 IS
BEGIN
  zext8out <= "00000000" & zext8in(7 downto 0);
END ARCHITECTURE untitled;


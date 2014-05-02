--
-- VHDL Architecture ece411.DATAOUTsplit.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-24.ews.illinois.edu)
--          at - 20:38:15 02/27/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DATAOUTsplit IS
   PORT( 
      DATAOUT  : IN     LC3b_word;
      highByte : OUT    lc3b_byte;
      lowByte  : OUT    lc3b_byte
   );

-- Declarations

END DATAOUTsplit ;

--
ARCHITECTURE untitled OF DATAOUTsplit IS
BEGIN
  highByte <= lc3b_byte(DATAOUT(15 downto 8));
  lowByte  <= lc3b_byte(DATAOUT(7 downto 0));
END ARCHITECTURE untitled;


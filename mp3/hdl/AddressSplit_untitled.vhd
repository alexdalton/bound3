--
-- VHDL Architecture ece411.AddressSplit.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-31.ews.illinois.edu)
--          at - 21:46:35 02/13/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AddressSplit IS
   PORT( 
      ADDRESS : IN     LC3b_word;
      OFFSET  : OUT    LC3B_C_OFFSET;
      INDEX   : OUT    LC3B_C_INDEX;
      TAG     : OUT    LC3B_C_TAG
   );

-- Declarations

END AddressSplit ;

--
ARCHITECTURE untitled OF AddressSplit IS
BEGIN
  OFFSET <= ADDRESS(3 downto 0) after (DELAY_256B + delay_MUX2);
  INDEX <= ADDRESS(6 downto 4);
  TAG <= ADDRESS(15 downto 7);
END ARCHITECTURE untitled;




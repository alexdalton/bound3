--
-- VHDL Architecture ece411.IR3sigripper.untitled
--
-- Created:
--          by - adalton2.ews (siebl-0220-18.ews.illinois.edu)
--          at - 00:53:58 05/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IR3sigripper IS
   PORT( 
      IR3out   : IN     lc3b_word;
      IR11     : OUT    std_logic;
      IR8      : OUT    std_logic;
      OFFSET11 : OUT    lc3b_OFFSET11;
      OFFSET9  : OUT    LC3B_OFFSET9
   );

-- Declarations

END IR3sigripper ;

--
ARCHITECTURE untitled OF IR3sigripper IS
BEGIN
  IR11 <= IR3out(11);
  OFFSET11 <= IR3out(10 downto 0);
  OFFSET9 <= IR3out(8 downto 0);
  IR8 <= IR3out(8);
END ARCHITECTURE untitled;


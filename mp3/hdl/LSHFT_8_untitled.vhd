--
-- VHDL Architecture ece411.LSHFT_8.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-40.ews.illinois.edu)
--          at - 21:43:40 04/16/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LSHFT_8 IS
   PORT( 
      regB3out  : IN     lc3b_word;
      regB_shft : OUT    lc3b_word
   );

-- Declarations

END LSHFT_8 ;

--
ARCHITECTURE untitled OF LSHFT_8 IS
BEGIN
  regB_shft <= regB3out(7 downto 0) & "00000000";
END ARCHITECTURE untitled;


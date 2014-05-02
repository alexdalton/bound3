--
-- VHDL Architecture ece411.LDB_align.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-40.ews.illinois.edu)
--          at - 21:05:09 04/16/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LDB_align IS
   PORT( 
      D_DATAIN : IN     lc3b_word;
      M_align  : IN     std_logic;
      byteOut  : OUT    lc3b_word
   );

-- Declarations

END LDB_align ;

--
ARCHITECTURE untitled OF LDB_align IS
BEGIN
  byteOut <= "00000000" & D_DATAIN(15 downto 8) after DELAY_MUX2 when M_align = '1' else
             "00000000" & D_DATAIN(7 downto 0) after DELAY_MUX2;
END ARCHITECTURE untitled;


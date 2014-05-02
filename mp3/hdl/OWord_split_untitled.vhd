--
-- VHDL Architecture ece411.OWord_split.untitled
--
-- Created:
--          by - buris2.ews (evrt-252-04.ews.illinois.edu)
--          at - 13:00:57 02/14/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY OWord_split IS
   PORT( 
      word0     : OUT    LC3B_WORD;
      word1     : OUT    LC3B_WORD;
      word2     : OUT    LC3B_WORD;
      word3     : OUT    LC3B_WORD;
      word4     : OUT    LC3B_WORD;
      word5     : OUT    LC3B_WORD;
      word6     : OUT    LC3B_WORD;
      word7     : OUT    LC3B_WORD;
      PMDATAOUT : IN     LC3B_OWORD
   );

-- Declarations

END OWord_split ;

--
ARCHITECTURE untitled OF OWord_split IS
BEGIN
  word0 <= PMDATAOUT(15 DOWNTO 0);
  word1 <= PMDATAOUT(31 DOWNTO 16);
  word2 <= PMDATAOUT(47 DOWNTO 32);
  word3 <= PMDATAOUT(63 DOWNTO 48);
  word4 <= PMDATAOUT(79 DOWNTO 64);
  word5 <= PMDATAOUT(95 DOWNTO 80);
  word6 <= PMDATAOUT(111 DOWNTO 96);
  word7 <= PMDATAOUT(127 DOWNTO 112);
END ARCHITECTURE untitled;


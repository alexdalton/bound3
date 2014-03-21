--
-- VHDL Architecture ece411.byteJoin.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-24.ews.illinois.edu)
--          at - 21:11:59 02/27/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY wordJoin IS
   PORT( 
      word0out  : IN     lc3b_word;
      word1out  : IN     lc3b_word;
      word2out  : IN     lc3b_word;
      word3out  : IN     lc3b_word;
      word4out  : IN     lc3b_word;
      word5out  : IN     lc3b_word;
      word6out  : IN     lc3b_word;
      word7out  : IN     lc3b_word;
      mixedData : OUT    lc3b_oword
   );

-- Declarations

END wordJoin ;

--
ARCHITECTURE untitled OF wordJoin IS
BEGIN
  mixedData <= word7out & word6out & word5out & word4out & word3out & word2out & word1out & word0out;
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.WordJoin8.untitled
--
-- Created:
--          by - buris2.ews (siebl-0220-10.ews.illinois.edu)
--          at - 12:22:20 02/25/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordJoin8 IS
   PORT( 
      Dout0         : IN     LC3b_word;
      Dout1         : IN     LC3b_word;
      Dout2         : IN     LC3b_word;
      Dout3         : IN     LC3b_word;
      Dout4         : IN     LC3b_word;
      Dout5         : IN     LC3b_word;
      Dout6         : IN     LC3b_word;
      Dout7         : IN     LC3b_word;
      wordwrite_out : OUT    lc3b_oword
   );

-- Declarations

END WordJoin8 ;

--
ARCHITECTURE untitled OF WordJoin8 IS
BEGIN
  wordwrite_out <= Dout7 & Dout6 & Dout5 & Dout4 & Dout3 & Dout2 & Dout1 & Dout0;
END ARCHITECTURE untitled;


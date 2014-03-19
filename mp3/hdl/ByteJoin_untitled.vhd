--
-- VHDL Architecture ece411.ByteJoin.untitled
--
-- Created:
--          by - buris2.ews (siebl-0220-10.ews.illinois.edu)
--          at - 12:34:02 02/25/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ByteJoin IS
   PORT (
      Dout  : OUT    LC3b_word;
      Hbyte : IN     LC3b_byte;
      Lbyte : IN     LC3b_byte
   );
END ByteJoin;

--
ARCHITECTURE untitled OF ByteJoin IS
BEGIN
  Dout <= Hbyte & Lbyte;
END ARCHITECTURE untitled;


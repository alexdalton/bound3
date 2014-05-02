--
-- VHDL Architecture ece411.Encoder2.untitled
--
-- Created:
--          by - buris2.ews (evrt-252-04.ews.illinois.edu)
--          at - 13:42:57 02/14/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Decoder2 IS
   PORT( 
      S : IN     std_logic;
      A : OUT    std_logic;
      B : OUT    std_logic
   );

-- Declarations

END Decoder2 ;

--
ARCHITECTURE untitled OF Decoder2 IS
BEGIN
  A <= '1' AFTER DELAY_DECODE3 WHEN (S = '0') ELSE
       '0' AFTER DELAY_DECODE3;
  B <= '1' AFTER DELAY_DECODE3 WHEN (S = '1') ELSE
       '0' AFTER DELAY_DECODE3;
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.AND4.untitled
--
-- Created:
--          by - buris2.ews (siebl-0218-18.ews.illinois.edu)
--          at - 00:19:43 04/04/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AND4 IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      C : IN     std_logic;
      D : IN     std_logic;
      E : OUT    std_logic
   );

-- Declarations

END AND4 ;

--
ARCHITECTURE untitled OF AND4 IS
BEGIN
  E <= A and B and C and D after DELAY_LOGIC4;
END ARCHITECTURE untitled;


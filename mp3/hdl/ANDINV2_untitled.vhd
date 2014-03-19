--
-- VHDL Architecture ece411.ANDINV2.untitled
--
-- Created:
--          by - buris2.ews (evrt-252-23.ews.illinois.edu)
--          at - 15:18:47 02/21/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ANDINV2 IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      C : OUT    std_logic
   );

-- Declarations

END ANDINV2 ;

--
ARCHITECTURE untitled OF ANDINV2 IS
BEGIN
  C <= A and (not B) after DELAY_LOGIC2;
END ARCHITECTURE untitled;--

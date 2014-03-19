--
-- VHDL Architecture ece411.AND3_slow.untitled
--
-- Created:
--          by - buris2.ews (evrt-252-23.ews.illinois.edu)
--          at - 16:35:43 02/21/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AND3_slow IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      C : IN     std_logic;
      D : OUT    std_logic
   );

-- Declarations

END AND3_slow ;

--
ARCHITECTURE untitled OF AND3_slow IS
BEGIN
  D <= A and B and C after 5ns; -- normal DELAY_LOGIC3 = 2ns
END ARCHITECTURE untitled;

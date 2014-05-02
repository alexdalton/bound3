--
-- VHDL Architecture ece411.bitOne.untitled
--
-- Created:
--          by - adalton2.ews (siebl-0220-12.ews.illinois.edu)
--          at - 22:41:14 04/02/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY bitOne IS
   PORT( 
      one : OUT    std_logic
   );

-- Declarations

END bitOne ;

--
ARCHITECTURE untitled OF bitOne IS
BEGIN
  one <= '1';
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.RESET_DELAY.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-16.ews.illinois.edu)
--          at - 23:11:06 03/20/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RESET_DELAY IS
   PORT( 
      RESET_L       : IN     std_logic;
      clk           : IN     std_logic;
      reset_delayed : OUT    std_logic
   );

-- Declarations

END RESET_DELAY ;

--
ARCHITECTURE untitled OF RESET_DELAY IS
BEGIN
  reset_delayed <= RESET_L after 5 ns;
END ARCHITECTURE untitled;


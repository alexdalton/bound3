--
-- VHDL Architecture ece411.CLKgen.untitled
--
-- Created:
--          by - buris2.ews (evrt-252-01.ews.illinois.edu)
--          at - 14:00:13 01/24/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY CLKgen IS
   PORT( 
      clk : INOUT  std_logic  := '0'
   );

-- Declarations

END CLKgen ;

--
ARCHITECTURE untitled OF CLKgen IS
BEGIN
  PROCESS (clk)
  BEGIN
    clk <= NOT clk AFTER HALF_CLOCK_PERIOD;
  END PROCESS;
END ARCHITECTURE untitled;


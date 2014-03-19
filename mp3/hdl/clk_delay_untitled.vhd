--
-- VHDL Architecture ece411.clk_delay.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-37.ews.illinois.edu)
--          at - 02:25:15 02/28/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY clk_delay IS
   PORT( 
      clk         : IN     std_logic;
      clk_delayed : OUT    std_logic
   );

-- Declarations

END clk_delay ;

--
ARCHITECTURE untitled OF clk_delay IS
BEGIN
  clk_delayed <= clk after 6 ns;
END ARCHITECTURE untitled;


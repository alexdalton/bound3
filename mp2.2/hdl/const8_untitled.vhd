--
-- VHDL Architecture ece411.const8.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-03.ews.illinois.edu)
--          at - 00:59:08 02/07/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY const8 IS
   PORT( 
      clk       : IN     std_logic;
      const8out : OUT    lc3b_word
   );

-- Declarations

END const8 ;

--
ARCHITECTURE untitled OF const8 IS
BEGIN
  const8out <= "0000000000001000";
END ARCHITECTURE untitled;

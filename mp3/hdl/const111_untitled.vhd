--
-- VHDL Architecture ece411.const111.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 18:30:09 03/19/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY const111 IS
   PORT( 
      clk      : IN     std_logic;
      const111 : OUT    LC3b_reg
   );

-- Declarations

END const111 ;

--
ARCHITECTURE untitled OF const111 IS
BEGIN
  const111<= "111";
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.validDelay.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-33.ews.illinois.edu)
--          at - 12:50:28 02/27/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY validDelay IS
   PORT( 
      DataOut   : IN     std_logic;
      Valid_out : OUT    std_logic
   );

-- Declarations

END validDelay ;

--
ARCHITECTURE untitled OF validDelay IS
BEGIN
  Valid_out <= DataOut after 500ns;
END ARCHITECTURE untitled;

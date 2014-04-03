--
-- VHDL Architecture ece411.Decode2.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-24.ews.illinois.edu)
--          at - 22:21:43 02/27/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Decode2 IS
   PORT( 
      A : IN     std_logic;
      B : OUT    std_logic;
      C : OUT    std_logic
   );

-- Declarations

END Decode2 ;

--
ARCHITECTURE untitled OF Decode2 IS
BEGIN
  B <= '1' when A = '0' else '0';
  C <= '1' when A = '1' else '0';
END ARCHITECTURE untitled;


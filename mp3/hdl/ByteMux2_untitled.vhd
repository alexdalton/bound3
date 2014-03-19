--
-- VHDL Architecture ece411.ByteMux2.untitled
--
-- Created:
--          by - buris2.ews (siebl-0220-10.ews.illinois.edu)
--          at - 12:02:34 02/25/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ByteMux2 IS
   PORT( 
      A   : IN     LC3b_byte;
      B   : IN     LC3b_byte;
      Sel : IN     std_logic;
      F   : OUT    LC3b_byte
   );

-- Declarations

END ByteMux2 ;

--
ARCHITECTURE untitled OF ByteMux2 IS
BEGIN
  PROCESS (A, B, Sel)
    variable state : LC3b_byte;
  BEGIN
    case Sel is 
      when '0' =>
        state := A;
      when '1' =>
        state := B;
      when others =>
        state := (OTHERS => 'X');
      end case;
    F <= state after delay_MUX2; 
  END PROCESS;
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.WordMux2.untitled
--
-- Created:
--          by - buris2.ews (evrt-252-01.ews.illinois.edu)
--          at - 13:45:13 01/24/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordMux2 IS
   PORT( 
      A   : IN     LC3b_word;
      B   : IN     LC3b_word;
      Sel : IN     std_logic;
      F   : OUT    LC3b_word
   );

-- Declarations

END WordMux2 ;

--
ARCHITECTURE untitled OF WordMux2 IS
BEGIN
  PROCESS (A, B, Sel)
    variable state : LC3b_word;
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


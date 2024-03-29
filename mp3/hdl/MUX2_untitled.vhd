--
-- VHDL Architecture ece411.MUX2.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-17.ews.illinois.edu)
--          at - 22:12:53 02/19/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MUX2 IS
   PORT( 
      A   : IN     std_logic;
      B   : IN     std_logic;
      Sel : IN     std_logic;
      F   : OUT    std_logic
   );

-- Declarations

END MUX2 ;

--
ARCHITECTURE untitled OF MUX2 IS
BEGIN
  PROCESS (A, B, Sel)
    variable state : std_logic;
  BEGIN
    case Sel is 
      when '0' =>
        state := A;
      when '1' =>
        state := B;
      when others =>
        state := 'X';
      end case;
    F <= state after delay_MUX2; 
  END PROCESS;
END ARCHITECTURE untitled;


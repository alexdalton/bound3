--
-- VHDL Architecture ece411.OwordMux2.untitled
--
-- Created:
--          by - adalton2.ews (evrt-252-06.ews.illinois.edu)
--          at - 20:35:14 02/26/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY OwordMux2 IS
   PORT( 
      A   : IN     LC3b_oword;
      B   : IN     LC3b_oword;
      Sel : IN     std_logic;
      C   : OUT    LC3b_oword
   );

-- Declarations

END OwordMux2 ;

--
ARCHITECTURE untitled OF OwordMux2 IS
BEGIN
  PROCESS (A, B, Sel)
    variable state : LC3b_oword;
  BEGIN
    case Sel is
      when '0' =>
        state := A;
      when '1' =>
        state := B;
      when others =>
        state := (OTHERS => 'X');
    end case;
    C <= state after delay_MUX2;
  END PROCESS;
END ARCHITECTURE untitled;


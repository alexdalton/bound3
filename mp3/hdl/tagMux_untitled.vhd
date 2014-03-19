--
-- VHDL Architecture ece411.tagMux.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-17.ews.illinois.edu)
--          at - 00:57:48 02/20/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY tagMUX IS
   PORT( 
      A   : IN     lc3b_c_tag;
      B   : IN     lc3b_c_tag;
      Sel : IN     std_logic;
      F   : OUT    lc3b_c_tag
   );

-- Declarations

END tagMUX ;

--
ARCHITECTURE untitled OF tagMUX IS
BEGIN
  PROCESS (A, B, Sel)
    variable state : lc3b_c_tag;
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


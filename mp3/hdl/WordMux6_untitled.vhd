--
-- VHDL Architecture ece411.WordMux6.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 20:27:06 02/03/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordMux5 IS
   PORT( 
      A   : IN     lc3b_word;
      B   : IN     lc3b_word;
      C   : IN     lc3b_word;
      D   : IN     lc3b_word;
      E   : IN     lc3b_word;
      Sel : IN     lc3b_8mux_sel;
      F   : OUT    lc3b_word
   );

-- Declarations

END WordMux5 ;

-- 6-input mux, basically 8-input, but smaller symbol
ARCHITECTURE untitled OF WordMux5 IS
BEGIN
PROCESS (A, B, C, D, E, F, Sel)
    variable state : LC3b_word;
  BEGIN
    case Sel is 
      when "000" =>
        state := A;
      when "001" =>
        state := B;
      when "010" =>
        state := C;
      when "011" =>
        state := D;
      when "100" =>
        state := E;
      when others =>
        state := (OTHERS => 'X');
      end case;
    F <= state after delay_MUX8; 
  END PROCESS;
END ARCHITECTURE untitled;

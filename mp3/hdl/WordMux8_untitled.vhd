--
-- VHDL Architecture ece411.WordMux8.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 20:08:47 02/03/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordMux8 IS
   PORT( 
      A     : IN     lc3b_word;
      B     : IN     lc3b_word;
      C     : IN     lc3b_word;
      D     : IN     lc3b_word;
      E     : IN     lc3b_word;
      F     : IN     lc3b_word;
      G     : IN     lc3b_word;
      H     : IN     lc3b_word;
      Sel   : IN     lc3b_8mux_sel;
      F_out : OUT    lc3b_word
   );

-- Declarations

END WordMux8 ;

--
ARCHITECTURE untitled OF WordMux8 IS
BEGIN
  PROCESS (A, B, C, D, E, F, G, H, Sel)
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
      when "101" =>
        state := F;
      when "110" =>
        state := G;
      when "111" =>
        state := H;
      when others =>
        state := (OTHERS => 'X');
      end case;
    F_out <= state after delay_MUX8; 
  END PROCESS;
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.MUX8_3.untitled
--
-- Created:
--          by - lis2.ews (gelib-057-16.ews.illinois.edu)
--          at - 00:41:06 04/18/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MUX8_3 IS
   PORT( 
      A      : IN     lc3b_8mux_sel;
      B      : IN     lc3b_8mux_sel;
      C      : IN     lc3b_8mux_sel;
      D      : IN     lc3b_8mux_sel;
      E      : IN     lc3b_8mux_sel;
      F      : IN     lc3b_8mux_sel;
      G      : IN     lc3b_8mux_sel;
      H      : IN     lc3b_8mux_sel;
      sel    : IN     lc3b_8mux_sel;
      result : OUT    lc3b_8mux_sel
   );

-- Declarations

END MUX8_3 ;

--
ARCHITECTURE untitled OF MUX8_3 IS
BEGIN
  PROCESS (A, B, C, D, E, F, G, H, sel)
    variable state : LC3b_8mux_sel;
  BEGIN
    case sel is 
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
    Result <= state after delay_MUX8; 
  END PROCESS;
END ARCHITECTURE untitled;


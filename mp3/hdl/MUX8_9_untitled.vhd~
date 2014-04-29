--
-- VHDL Architecture ece411.MUX8_9.untitled
--
-- Created:
--          by - lis2.ews (gelib-057-16.ews.illinois.edu)
--          at - 22:59:13 04/17/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MUX8_9 IS
   PORT( 
      A      : IN     lc3b_c_tag;
      B      : IN     lc3b_c_tag;
      C      : IN     lc3b_c_tag;
      D      : IN     lc3b_c_tag;
      E      : IN     lc3b_c_tag;
      F      : IN     lc3b_c_tag;
      G      : IN     lc3b_c_tag;
      H      : IN     lc3b_c_tag;
      Sel    : IN     lc3b_8mux_sel;
      Result : OUT    lc3b_c_tag
   );

-- Declarations

END MUX8_9 ;

--
ARCHITECTURE untitled OF MUX8_9 IS
BEGIN
  PROCESS (A, B, C, D, E, F, G, H, sel)
    variable state : LC3b_c_tag;
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


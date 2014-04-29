--
-- VHDL Architecture ece411.oWordMux8.untitled
--
-- Created:
--          by - lis2.ews (gelib-057-16.ews.illinois.edu)
--          at - 21:34:00 04/17/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY oWordMux8 IS
   PORT( 
      In0 : IN     lc3b_oword;
      In1 : IN     lc3b_oword;
      In2 : IN     lc3b_oword;
      In3 : IN     lc3b_oword;
      In4 : IN     lc3b_oword;
      In5 : IN     lc3b_oword;
      In6 : IN     lc3b_oword;
      In7 : IN     lc3b_oword;
      Sel : IN     lc3b_8mux_sel;
      F   : OUT    lc3b_oword
   );

-- Declarations

END oWordMux8 ;

--
ARCHITECTURE untitled OF oWordMux8 IS
BEGIN
  PROCESS (In0, In1, In2, In3, In4, In5, In6, In7, Sel)
    variable state : LC3b_oword;
  BEGIN
    case Sel is 
      when "000" =>
        state := In0;
      when "001" =>
        state := In1;
      when "010" =>
        state := In2;
      when "011" =>
        state := In3;
      when "100" =>
        state := In4;
      when "101" =>
        state := In5;
      when "110" =>
        state := In6;
      when "111" =>
        state := In7;
      when others =>
        state := (OTHERS => 'X');
      end case;
    F <= state after delay_MUX8; 
  END PROCESS;

END ARCHITECTURE untitled;


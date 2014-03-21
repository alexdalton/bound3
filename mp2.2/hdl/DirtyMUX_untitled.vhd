--
-- VHDL Architecture ece411.DirtyMUX.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-09.ews.illinois.edu)
--          at - 01:29:51 02/27/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DirtyMUX IS
   PORT (
      A   : IN     std_logic;
      B   : IN     std_logic;
      C   : OUT    std_logic;
      Sel : IN     std_logic
   );
END DirtyMUX;

--
ARCHITECTURE untitled OF DirtyMux IS
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
    C <= state after delay_MUX2;
  END PROCESS;
END ARCHITECTURE untitled;


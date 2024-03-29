--
-- VHDL Architecture ece411.BitMux2.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-16.ews.illinois.edu)
--          at - 22:08:33 02/19/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BitMux2 IS
   PORT( 
      A   : IN     std_logic;
      B   : IN     std_logic;
      Sel : IN     std_logic;
      C   : OUT    std_logic := '0'
   );

-- Declarations

END BitMux2 ;

--
ARCHITECTURE untitled OF BitMux2 IS
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
        state := '0';
    end case;
    C <= state after delay_MUX2; --+ delay_MUX2 + delay_MUX2 + DELAY_256B);
  END PROCESS;
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.TwoBitMux2.untitled
--
-- Created:
--          by - adalton2.ews (evrt-252-06.ews.illinois.edu)
--          at - 22:51:42 02/26/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TwoBitMux2 IS
   PORT( 
      A0  : IN     std_logic;
      A1  : IN     std_logic;
      B0  : IN     std_logic;
      B1  : IN     std_logic;
      sel : IN     std_logic;
      C0  : OUT    std_logic;
      C1  : OUT    std_logic
   );

-- Declarations

END TwoBitMux2 ;

--
ARCHITECTURE untitled OF TwoBitMux2 IS
BEGIN
  PROCESS (A0, A1, B0, B1, Sel)
    variable state0 : std_logic;
    variable state1 : std_logic;
  BEGIN
    case Sel is
      when '0' =>
        state0 := A0;
        state1 := A1;
      when '1' =>
        state0 := B0;
        state1 := B1;
      when others =>
        state0 := 'X';
        state1 := 'X';
    end case;
    C0 <= state0 after delay_MUX2;
    C1 <= state1 after delay_MUX2;
  END PROCESS;
END ARCHITECTURE untitled;

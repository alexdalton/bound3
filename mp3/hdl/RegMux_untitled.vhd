--
-- VHDL Architecture ece411.RegMux.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 17:34:08 02/03/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RegMux IS
   PORT( 
      DestMuxSel : IN     std_logic;
      dest       : IN     LC3b_reg;
      clk        : IN     std_logic;
      DestMuxout : OUT    LC3b_reg
   );

-- Declarations

END RegMux ;

--
ARCHITECTURE untitled OF RegMux IS
BEGIN
  PROCESS (dest, DestMuxSel)
    variable state : LC3b_reg;
  BEGIN
    case DestMuxSel is 
      when '0' =>
        state := dest;
      when '1' =>
        state := "111"; -- it's a constant anyways...
      when others =>
        state := (OTHERS => 'X');
      end case;
    DestMuxOut <= state after delay_MUX2; 
  END PROCESS;
END ARCHITECTURE untitled;
--
-- VHDL Architecture ece411.StoreMux.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 18:36:48 02/03/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY StoreMux IS
   PORT( 
      SrcA        : IN     LC3b_reg;
      StoreSR     : IN     std_logic;
      clk         : IN     std_logic;
      dest        : IN     LC3b_reg;
      StoreMuxout : OUT    LC3b_reg
   );

-- Declarations

END StoreMux ;

--
ARCHITECTURE untitled OF StoreMux IS
BEGIN
  PROCESS (SrcA, dest, StoreSR)
    variable state : LC3b_reg;
  BEGIN
    case StoreSR is -- is this the right ordering?
      when '0' =>
        state := dest; -- when we store (active low), source reg is in IR[11:9] == dest reg
      when '1' =>
        state := SrcA; 
      when others =>
        state := (OTHERS => 'X');
      end case;
    StoreMuxout <= state after delay_MUX2; 
  END PROCESS;
END ARCHITECTURE untitled;


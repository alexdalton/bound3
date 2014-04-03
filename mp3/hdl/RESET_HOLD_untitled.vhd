--
-- VHDL Architecture ece411.RESET_HOLD.untitled
--
-- Created:
--          by - adalton2.ews (siebl-0220-12.ews.illinois.edu)
--          at - 00:05:27 04/03/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RESET_HOLD IS
   PORT( 
      RESET_L      : IN     std_logic;
      RESET_L_HOLD : OUT    std_logic
   );

-- Declarations

END RESET_HOLD ;

--
ARCHITECTURE untitled OF RESET_HOLD IS
BEGIN
  HOLD : PROCESS(RESET_L)
  BEGIN
    if RESET_L = '0' then
      RESET_L_HOLD <= '0' after 0 NS, '1' after CLOCK_PERIOD;
    end if;
  end process;
END ARCHITECTURE untitled;


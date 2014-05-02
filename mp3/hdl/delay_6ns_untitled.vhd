--
-- VHDL Architecture ece411.delay_6ns.untitled
--
-- Created:
--          by - buris2.ews (siebl-0222-02.ews.illinois.edu)
--          at - 02:45:13 04/30/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY delay_6ns IS
   PORT( 
      Vin  : IN     std_logic;
      Vout : OUT    std_logic
   );

-- Declarations

END delay_6ns ;

--
ARCHITECTURE untitled OF delay_6ns IS
BEGIN
  Vout <= Vin after 6 ns;
END ARCHITECTURE untitled;


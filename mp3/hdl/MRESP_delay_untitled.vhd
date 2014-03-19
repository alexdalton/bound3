--
-- VHDL Architecture ece411.MRESP_delay.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-37.ews.illinois.edu)
--          at - 00:50:00 02/28/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY MRESP_delay IS
   PORT( 
      F       : IN     std_logic;
      MRESP_H : OUT    std_logic
   );

-- Declarations

END MRESP_delay ;

--
ARCHITECTURE untitled OF MRESP_delay IS
BEGIN
  MRESP_H <= F after 50ns;
END ARCHITECTURE untitled;


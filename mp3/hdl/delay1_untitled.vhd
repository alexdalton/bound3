--
-- VHDL Architecture ece411.delay1.untitled
--
-- Created:
--          by - adalton2.ews (siebl-0220-02.ews.illinois.edu)
--          at - 04:08:21 05/01/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY delay1 IS
   PORT( 
      ALU_STALL_IRESP       : IN     STD_LOGIC;
      clk                   : IN     std_logic;
      ALU_STALL_IRESP_DELAY : OUT    std_logic := '0'
   );

-- Declarations

END delay1 ;

--
ARCHITECTURE untitled OF delay1 IS
BEGIN
  ALU_STALL_IRESP_DELAY <= ALU_STALL_IRESP after 50ns;
END ARCHITECTURE untitled;


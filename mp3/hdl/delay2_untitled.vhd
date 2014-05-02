--
-- VHDL Architecture ece411.delay2.untitled
--
-- Created:
--          by - adalton2.ews (siebl-0220-02.ews.illinois.edu)
--          at - 04:39:52 05/01/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY delay2 IS
   PORT( 
      ALU_STALL_DRESP       : IN     STD_LOGIC;
      clk                   : IN     std_logic;
      ALU_STALL_DRESP_DELAY : OUT    std_logic := '0'
   );

-- Declarations

END delay2 ;

--
ARCHITECTURE untitled OF delay2 IS
BEGIN
  ALU_STALL_DRESP_DELAY <= ALU_STALL_DRESP after 50ns;
END ARCHITECTURE untitled;


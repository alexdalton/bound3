-- VHDL Entity ece411.RESET_DELAY.generatedInstance
--
-- Created:
--          by - adalton2.ews (siebl-0220-12.ews.illinois.edu)
--          at - 21:20:03 04/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RESET_DELAY IS
   PORT( 
      clk           : IN     std_logic;
      reset_delayed : OUT    std_logic;
      RESET_L       : IN     std_logic
   );

END RESET_DELAY ;

-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF RESET_DELAY IS 
BEGIN


END generatedInstance;
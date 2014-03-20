-- VHDL Entity ece411.ControlWord.generatedInstance
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 17:02:27 03/19/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ControlWord IS
   PORT( 
      clk         : IN     std_logic;
      ControlWord : IN     lc3b_oword;
      CW1out      : OUT    lc3b_oword;
      RESET_L     : IN     std_logic;
      STALL_L     : IN     std_logic
   );

END ControlWord ;

-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF ControlWord IS 
BEGIN


END generatedInstance;

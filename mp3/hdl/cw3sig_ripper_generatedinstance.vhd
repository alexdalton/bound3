-- VHDL Entity ece411.CW3sig_ripper.generatedInstance
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 22:01:54 03/19/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY CW3sig_ripper IS
   PORT( 
      CCdatasel : OUT    std_logic;
      clk       : IN     std_logic;
      CW3out    : IN     lc3b_word;
      LoadNZP   : OUT    std_logic;
      MREADD_L  : OUT    std_logic
   );

END CW3sig_ripper ;

-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF CW3sig_ripper IS 
BEGIN


END generatedInstance;

-- VHDL Entity ece411.CW4sig_ripper.generatedInstance
--
-- Created:
--          by - adalton2.ews (gelib-057-27.ews.illinois.edu)
--          at - 22:43:32 03/19/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY CW4sig_ripper IS
   PORT( 
      clk          : IN     std_logic;
      CW4out       : IN     lc3b_word;
      destsel5     : OUT    std_logic;
      RegDataInSel : OUT    std_logic;
      RegWrite5    : OUT    std_logic
   );

END CW4sig_ripper ;

-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF CW4sig_ripper IS 
BEGIN


END generatedInstance;

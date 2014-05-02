-- VHDL Entity ece411.WRITEBACK.generatedInstance
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 15:06:50 03/19/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WRITEBACK IS
   PORT( 
      ALUout4   : IN     lc3b_word;
      clk       : IN     std_logic;
      CW4       : IN     std_logic;
      CW5       : OUT    std_logic;
      IR4       : IN     lc3b_word;
      IR5       : OUT    lc3b_word;
      MemData4  : IN     lc3b_word;
      PC4       : IN     lc3b_word;
      PC5       : OUT    lc3b_word;
      RegA4     : IN     lc3b_word;
      RegB4     : IN     lc3b_word;
      RegIn5    : OUT    lc3b_word;
      RegWrite5 : OUT    std_logic;
      RESET_L   : IN     std_logic;
      STALL     : IN     std_logic;
      V4        : IN     std_logic;
      V5        : OUT    std_logic
   );

END WRITEBACK ;

-- 
-- Auto generated dummy architecture for leaf level instance.
-- 
ARCHITECTURE generatedInstance OF WRITEBACK IS 
BEGIN


END generatedInstance;

-- VHDL Entity ece411.stage_writeback.symbol
--
-- Created:
--          by - adalton2.ews (gelib-057-27.ews.illinois.edu)
--          at - 21:12:14 03/19/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY stage_writeback IS
   PORT( 
      ALU4out     : IN     lc3b_word;
      CW4out      : IN     lc3b_word;
      IR4out      : IN     lc3b_word;
      MEMdata4out : IN     lc3b_word;
      PC4out      : IN     lc3b_word;
      RESET_L     : IN     std_logic;
      STALL_L     : IN     std_logic;
      Valid4out   : IN     lc3b_word;
      clearValid5 : IN     std_logic;
      clk         : IN     std_logic;
      regA4out    : IN     lc3b_word;
      regB4out    : IN     lc3b_word;
      RegWrite5   : OUT    std_logic;
      destreg5    : OUT    lc3b_reg;
      destregsel5 : OUT    std_logic;
      regdata5in  : OUT    lc3b_word
   );

-- Declarations

END stage_writeback ;

--
-- VHDL Architecture ece411.stage_writeback.struct
--
-- Created:
--          by - adalton2.ews (gelib-057-27.ews.illinois.edu)
--          at - 21:12:14 03/19/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF stage_writeback IS

   -- Architecture declarations

   -- Internal signal declarations



BEGIN

   -- Instance port mappings.

END struct;

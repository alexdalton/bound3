--
-- VHDL Architecture ece411.IRregsplitter.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-26.ews.illinois.edu)
--          at - 18:32:44 03/19/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IRregsplitter IS
   PORT( 
      IR1out : IN     lc3b_word;
      clk    : IN     std_logic;
      IR11_9 : OUT    lc3b_reg;
      IR8_6  : OUT    lc3b_reg;
      IR2_0  : OUT    lc3b_reg;
      IR5_4  : OUT    LC3B_SHFTOP;
      IR11   : OUT    std_logic;
      OPCODE : OUT    LC3B_OPCODE;
      OFFSET9 : OUT   LC3B_OFFSET9;
      OFFSET11: OUT lc3b_OFFSET11;
      const111 : OUT lc3b_reg
   );

-- Declarations

END IRregsplitter ;

--
ARCHITECTURE untitled OF IRregsplitter IS
BEGIN
  IR11_9 <= IR1out(11 DOWNTO 9);
  IR8_6  <= IR1out(8 DOWNTO 6);
  IR2_0  <= IR1out(2 DOWNTO 0);
  OPCODE <= IR1out(15 downto 12);
  OFFSET11 <= IR1out(10 downto 0);
  IR11 <= IR1out(11);
  OFFSET9 <= IR1out(8 downto 0);
  IR5_4 <= IR1out(5 downto 4);
  const111 <= "111";
END ARCHITECTURE untitled;


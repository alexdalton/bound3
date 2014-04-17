--
-- VHDL Architecture ece411.IR2sig_ripper.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-16.ews.illinois.edu)
--          at - 22:00:48 03/20/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IR2sig_ripper IS
   PORT( 
      IR2out : IN     lc3b_word;
      IR2_5  : OUT    std_logic;
      imm4   : OUT    lc3b_nibble;
      imm5   : OUT    LC3b_imm5;
      offset9 : OUT LC3B_OFFSET9;
      index6 : OUT    LC3b_index6
   );

-- Declarations

END IR2sig_ripper ;

--
ARCHITECTURE untitled OF IR2sig_ripper IS
BEGIN
  IR2_5 <= IR2out(5);
  imm4 <= IR2out(3 downto 0);
  imm5 <= IR2out(4 downto 0);
  index6 <= IR2out(5 downto 0);
  offset9 <= IR2out(8 downto 0);
END ARCHITECTURE untitled;


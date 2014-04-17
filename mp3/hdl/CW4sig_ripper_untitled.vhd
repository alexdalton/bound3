--
-- VHDL Architecture ece411.CW4sig_ripper.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-31.ews.illinois.edu)
--          at - 01:12:39 03/20/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY CW4sig_ripper IS
   PORT( 
      CW4out       : IN     lc3b_dword;
      clk          : IN     std_logic;
      RegDataInSel : OUT    std_logic;
      RegWrite    : OUT    std_logic;
      destsel5     : OUT    std_logic
   );

-- Declarations

END CW4sig_ripper ;

--
ARCHITECTURE untitled OF CW4sig_ripper IS
BEGIN
  destsel5 <= CW4out(15);
  RegWrite <= CW4out(14);
  RegDataInSel <= CW4out(13);
END ARCHITECTURE untitled;


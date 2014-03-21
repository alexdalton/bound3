--
-- VHDL Architecture ece411.CW1sig_ripper.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-31.ews.illinois.edu)
--          at - 01:08:46 03/20/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY CW1sig_ripper IS
   PORT( 
      CW1out  : IN     LC3B_DWORD;
      clk     : IN     std_logic;
      srcAsel : OUT    std_logic;
      srcBsel : OUT    std_logic;
      branch  : OUT    std_logic
   );

-- Declarations

END CW1sig_ripper ;

--
ARCHITECTURE untitled OF CW1sig_ripper IS
BEGIN
  srcAsel <= CW1out(31);
  srcBsel <= CW1out(30);
  branch <= CW1out(12);
END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.RD_CW_ripper.untitled
--
-- Created:
--          by - buris2.ews (gelib-057-12.ews.illinois.edu)
--          at - 17:06:03 04/16/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY RD_CW_ripper IS
   PORT( 
      RD_CW   : IN     lc3b_dword;
      src11_9 : OUT    std_logic;
      src2_0  : OUT    std_logic;
      src8_6  : OUT    std_logic;
      srcAsel : OUT    std_logic;
      srcBsel : OUT    std_logic
   );

-- Declarations

END RD_CW_ripper ;

--
ARCHITECTURE untitled OF RD_CW_ripper IS
BEGIN
  SRC11_9 <= RD_CW(2);
  SRC8_6 <= RD_CW(1);
  SRC2_0 <= RD_CW(0);
  srcAsel <= RD_CW(31);
  srcBsel <= RD_CW(30);
END ARCHITECTURE untitled;


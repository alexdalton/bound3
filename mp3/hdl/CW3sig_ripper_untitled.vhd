--
-- VHDL Architecture ece411.CW3sig_ripper.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-31.ews.illinois.edu)
--          at - 01:10:58 03/20/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY CW3sig_ripper IS
   PORT( 
      CW3out       : IN     lc3b_dword;
      ADDRESS2_SEL : OUT    lc3b_4mux_sel;
      CCdatasel    : OUT    std_logic;
      LoadNZP      : OUT    std_logic;
      ismemoryOP     : OUT    std_logic;
      readOP       : OUT    std_logic;
      byteOP      : OUT    std_logic;
      istrap        : OUT     std_logic;
      STIOP : OUT   std_logic;
      LDIOP : OUT   std_logic;
      writeType    : OUT    std_logic_vector (1 DOWNTO 0)
   );

-- Declarations

END CW3sig_ripper ;

--
ARCHITECTURE untitled OF CW3sig_ripper IS
BEGIN
  readOP <= CW3out(23);
  CCdatasel <= CW3out(22);
  LoadNZP <= CW3out(21);
  ismemoryOP <= CW3out(20);
  ADDRESS2_SEL <= CW3out(19 downto 18);
  writeType <= CW3out(17 downto 16);
  istrap <= CW3out(7);
  byteOP <= CW3out(10);
  STIOP <= CW3out(6);
  LDIOP <= CW3out(5);
END ARCHITECTURE untitled;


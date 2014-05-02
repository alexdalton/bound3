-- VHDL Architecture ece411.WayDataSplit.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-24.ews.illinois.edu)
--          at - 20:40:17 02/27/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WayDataSplit IS
   PORT( 
      WayMuxData : IN     LC3b_oword;
      byte1      : OUT    lc3b_byte;
      byte2      : OUT    lc3b_byte;
      byte3      : OUT    lc3b_byte;
      byte4      : OUT    lc3b_byte;
      byte5      : OUT    lc3b_byte;
      byte6      : OUT    lc3b_byte;
      byte7      : OUT    lc3b_byte;
      byte8      : OUT    lc3b_byte;
      byte9      : OUT    lc3b_byte;
      byte10     : OUT    lc3b_byte;
      byte11     : OUT    lc3b_byte;
      byte12     : OUT    lc3b_byte;
      byte13     : OUT    lc3b_byte;
      byte14     : OUT    lc3b_byte;
      byte15     : OUT    lc3b_byte;
      byte0      : OUT    lc3b_byte
   );

-- Declarations

END WayDataSplit ;

--
ARCHITECTURE untitled OF WayDataSplit IS
BEGIN
  byte0 <= lc3b_byte(WayMuxData(7 downto 0));
  byte1 <= lc3b_byte(WayMuxData(15 downto 8));
  byte2 <= lc3b_byte(WayMuxData(23 downto 16));
  byte3 <= lc3b_byte(WayMuxData(31 downto 24));
  byte4 <= lc3b_byte(WayMuxData(39 downto 32));
  byte5 <= lc3b_byte(WayMuxData(47 downto 40));
  byte6 <= lc3b_byte(WayMuxData(55 downto 48));
  byte7 <= lc3b_byte(WayMuxData(63 downto 56));
  byte8 <= lc3b_byte(WayMuxData(71 downto 64));
  byte9 <= lc3b_byte(WayMuxData(79 downto 72));
  byte10 <= lc3b_byte(WayMuxData(87 downto 80));
  byte11 <= lc3b_byte(WayMuxData(95 downto 88));
  byte12 <= lc3b_byte(WayMuxData(103 downto 96));
  byte13 <= lc3b_byte(WayMuxData(111 downto 104));
  byte14 <= lc3b_byte(WayMuxData(119 downto 112));
  byte15 <= lc3b_byte(WayMuxData(127 downto 120));
END ARCHITECTURE untitled;


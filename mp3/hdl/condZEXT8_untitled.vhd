--
-- VHDL Architecture ece411.condZEXT8.untitled
--
-- Created:
--          by - buris2.ews (siebl-0218-16.ews.illinois.edu)
--          at - 19:43:46 02/05/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY byteSelect IS
   PORT( 
      RFMuxout    : IN     LC3b_word;
      B_op        : IN     std_logic;
      m_align     : IN     std_logic;
      clk         : IN     std_logic;
      REGDATAin   : OUT    LC3b_word
   );

-- Declarations

END byteSelect ;

--on byte operations, zero extend and put bits in proper place
--ZEXT, concat, and splitting; no delay required
ARCHITECTURE untitled OF byteSelect IS
  --signal S : std_logic;
BEGIN
 
--new implementation
--set B_op only on reg. load

    REGDATAin <= "00000000" & RFMuxout(7 DOWNTO 0)
                  WHEN (B_op = '1' and m_align = '0') ELSE
  
                 "00000000" & RFMuxout(15 DOWNTO 8)
                  WHEN (B_op = '1' and m_align = '1') ELSE
  
                  RFMuxout;


END ARCHITECTURE untitled;


--
-- VHDL Architecture ece411.OffsetDecode.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-24.ews.illinois.edu)
--          at - 20:25:38 02/27/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY OffsetDecode IS
   PORT( 
      OFFSET : IN     LC3B_C_OFFSET;
      word0  : OUT    std_logic;
      word1  : OUT    std_logic;
      word2  : OUT    std_logic;
      word3  : OUT    std_logic;
      word4  : OUT    std_logic;
      word5  : OUT    std_logic;
      word6  : OUT    std_logic;
      word7  : OUT    std_logic);

-- Declarations

END OffsetDecode ;

--
ARCHITECTURE untitled OF OffsetDecode IS
BEGIN
  PROCESS(OFFSET)
  BEGIN
    word0 <= '0';
    word1 <= '0';
    word2 <= '0';
    word3 <= '0';
    word4 <= '0';
    word5 <= '0';
    word6 <= '0';
    word7 <= '0';
    CASE OFFSET(3 downto 1) is
      when "000" =>
        word0 <= '1' after DELAY_DECODE3;
      when "001" =>
        word1 <= '1' after DELAY_DECODE3;
      when "010" =>
        word2 <= '1' after DELAY_DECODE3;
      when "011" =>
        word3 <= '1' after DELAY_DECODE3;
      when "100" =>
        word4 <= '1' after DELAY_DECODE3;
      when "101" =>
        word5 <= '1' after DELAY_DECODE3;
      when "110" =>
        word6 <= '1' after DELAY_DECODE3;
      when "111" =>
        word7 <= '1' after DELAY_DECODE3;
      when others =>
        NULL;
    end case;
  end process;
    
END ARCHITECTURE untitled;


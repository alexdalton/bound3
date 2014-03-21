--
-- VHDL Architecture ece411.WriteLogic.untitled
--
-- Created:
--          by - adalton2.ews (evrt-252-06.ews.illinois.edu)
--          at - 20:43:31 02/26/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WriteLogic IS
   PORT( 
      DATAOUT     : IN     LC3b_word;
      MWRITEH_L   : IN     std_logic;
      MWRITEL_L   : IN     std_logic;
      OFFSET      : IN     LC3B_C_OFFSET;
      WayMuxData  : IN     LC3b_oword;
      writtenData : OUT    lc3b_oword
   );

-- Declarations

END WriteLogic ;

--
ARCHITECTURE untitled OF WriteLogic IS
BEGIN
  PROCESS (DATAOUT, MWRITEH_L, MWRITEL_L, OFFSET, WayMuxData)
  BEGIN
    writtenData <= WayMuxData;
    case OFFSET(3 downto 1) is
      when "000" =>
        if MWRITEL_L = '0' then
          writtenData(7 downto 0) <= LC3b_byte(DATAOUT(7 downto 0)) after (delay_MUX2 + delay_logic2);
        end if;
        if MWRITEH_L = '0' then
          writtenData(15 downto 8) <= LC3b_byte(DATAOUT(15 downto 8)) after (delay_MUX2 + delay_logic2);
        end if;
      when "001" =>
        if MWRITEL_L = '0' then
          writtenData(23 downto 16) <= LC3b_byte(DATAOUT(7 downto 0)) after (delay_MUX2 + delay_logic2);
        end if;
        if MWRITEH_L = '0' then
          writtenData(31 downto 24) <= LC3b_byte(DATAOUT(15 downto 8)) after (delay_MUX2 + delay_logic2);
        end if;
      when "010" =>
        if MWRITEL_L = '0' then
          writtenData(39 downto 32) <= LC3b_byte(DATAOUT(7 downto 0)) after (delay_MUX2 + delay_logic2);
        end if;
        if MWRITEH_L = '0' then
          writtenData(47 downto 40) <= LC3b_byte(DATAOUT(15 downto 8)) after (delay_MUX2 + delay_logic2);
        end if;
      when "011" =>
        if MWRITEL_L = '0' then
          writtenData(55 downto 48) <= LC3b_byte(DATAOUT(7 downto 0)) after (delay_MUX2 + delay_logic2);
        end if;
        if MWRITEH_L = '0' then
          writtenData(63 downto 56) <= LC3b_byte(DATAOUT(15 downto 8)) after (delay_MUX2 + delay_logic2);
        end if;
      when "100" =>
        if MWRITEL_L = '0' then
          writtenData(71 downto 64) <= LC3b_byte(DATAOUT(7 downto 0)) after (delay_MUX2 + delay_logic2);
        end if;
        if MWRITEH_L = '0' then
          writtenData(79 downto 72) <= LC3b_byte(DATAOUT(15 downto 8)) after (delay_MUX2 + delay_logic2);
        end if;
      when "101" =>
        if MWRITEL_L = '0' then
          writtenData(87 downto 80) <= LC3b_byte(DATAOUT(7 downto 0)) after (delay_MUX2 + delay_logic2);
        end if;
        if MWRITEH_L = '0' then
          writtenData(95 downto 88) <= LC3b_byte(DATAOUT(15 downto 8)) after (delay_MUX2 + delay_logic2);
        end if;
      when "110" =>
        if MWRITEL_L = '0' then
          writtenData(103 downto 96) <= LC3b_byte(DATAOUT(7 downto 0)) after (delay_MUX2 + delay_logic2);
        end if;
        if MWRITEH_L = '0' then
          writtenData(111 downto 104) <= LC3b_byte(DATAOUT(15 downto 8)) after (delay_MUX2 + delay_logic2);
        end if;
      when "111" =>
        if MWRITEL_L = '0' then
          writtenData(119 downto 112) <= LC3b_byte(DATAOUT(7 downto 0)) after (delay_MUX2 + delay_logic2);
        end if;
        if MWRITEH_L = '0' then
          writtenData(127 downto 120) <= LC3b_byte(DATAOUT(15 downto 8)) after (delay_MUX2 + delay_logic2);
        end if;
      when others =>
        NULL;
    end case;
  END PROCESS;
END ARCHITECTURE untitled;


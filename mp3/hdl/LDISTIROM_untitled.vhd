--
-- VHDL Architecture ece411.LDISTIROM.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-40.ews.illinois.edu)
--          at - 00:21:04 04/17/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY LDISTIROM IS
   PORT( 
      LDIOP    : IN     std_logic;
      STIOP    : IN     std_logic;
      memCWORD : OUT    lc3b_dword
   );

-- Declarations

END LDISTIROM ;

--
ARCHITECTURE untitled OF LDISTIROM IS
  signal LDISTI : std_logic_vector(1 downto 0);
BEGIN
  LDISTI <= LDIOP & STIOP;
  controlROM : PROCESS(LDISTI)
  VARIABLE cword_out : lc3b_dword;
    BEGIN
        CASE LDISTI is
          when "10" =>
            cword_out := "11000001111100000110000000000000";
          when "01" =>
            cword_out := "11000001010100110010000000000000";
          when others =>
            cword_out := "00000000000000000000000000000000";
        end case;
        memCWORD <= cword_out after DELAY_ROM;
  END PROCESS;
END ARCHITECTURE untitled;


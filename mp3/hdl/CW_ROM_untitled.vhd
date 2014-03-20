--
-- VHDL Architecture ece411.CW_ROM.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-27.ews.illinois.edu)
--          at - 22:17:42 03/19/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY CW_ROM IS
   PORT( 
      OPCODE : IN     LC3B_OPCODE;
      clk    : IN     std_logic;
      CW1out : OUT    LC3B_DWORD
   );

-- Declarations

END CW_ROM ;

--
ARCHITECTURE untitled OF CW_ROM IS
BEGIN
  controlROM : PROCESS(OPCODE)
  VARIABLE cword_out : lc3b_dword;
    BEGIN
        CASE OPCODE is
          when "0000" =>
            cword_out := x"00000000";
          when "0001" =>
            cword_out := x"00000000";
          when "0010" =>
            cword_out := x"00000000";
          when "0011" =>
            cword_out := x"00000000";
          when "0100" =>
            cword_out := x"00000000";
          when "0101" =>
            cword_out := x"00000000";
          when "0110" =>
            cword_out := x"00000000";
          when "0111" =>
            cword_out := x"00000000";
          when "1000" =>
            cword_out := x"00000000";
          when "1001" =>
            cword_out := x"00000000";
          when "1010" =>
            cword_out := x"00000000";
          when "1011" =>
            cword_out := x"00000000";
          when "1100" =>
            cword_out := x"00000000";
          when "1101" =>
            cword_out := x"00000000";
          when "1110" =>
            cword_out := x"00000000";
          when "1111" =>
            cword_out := x"00000000";
          when others =>
            NULL;   
        end CASE;
        CW1out <= cword_out after DELAY_ROM;
  END PROCESS;
END ARCHITECTURE untitled;


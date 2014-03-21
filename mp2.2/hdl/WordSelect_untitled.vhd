--
-- VHDL Architecture ece411.WordSelect.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-24.ews.illinois.edu)
--          at - 20:56:32 02/27/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordSelect IS
   PORT( 
      S0       : IN     std_logic;
      S1       : IN     std_logic;
      S2       : IN     std_logic;
      current0 : IN     lc3b_byte;
      current1 : IN     lc3b_byte;
      new0     : IN     lc3b_byte;
      new1     : IN     lc3b_byte;
      WordOut  : OUT    lc3b_word
   );

-- Declarations

END WordSelect ;

--
ARCHITECTURE untitled OF WordSelect IS
BEGIN
  PROCESS (S0, S1, S2, current0, current1, new0, new1)
    variable state : LC3b_word;
  BEGIN
   case S2 is
    when '1' =>
      case S0 is
        when '0' =>
          state(7 downto 0) := new0;
        when '1' =>
          state(7 downto 0) := current0;
        when others =>
          state(7 downto 0) := (OTHERS => 'X');
      end case;
      case S1 is
        when '0' =>
          state(15 downto 8) := new1;
        when '1' =>
          state(15 downto 8) := current0;
        when others =>
          state(15 downto 8) := (OTHERS => 'X');
      end case;
   when others =>
     state := current1 & current0;
   end case;
    WordOut <= state after delay_MUX4;
  END PROCESS;
END ARCHITECTURE untitled;

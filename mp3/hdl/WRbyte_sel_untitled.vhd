--
-- VHDL Architecture ece411.WRbyte_sel.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-31.ews.illinois.edu)
--          at - 00:14:21 03/20/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WRbyte_sel IS
   PORT( 
      M_align   : IN     std_logic;
      valid3out : IN     std_logic;
      writeType : IN     std_logic_vector (1 DOWNTO 0);
      MWRITEH_L : OUT    std_logic;
      MWRITEL_L : OUT    std_logic
   );

-- Declarations

END WRbyte_sel ;

--
ARCHITECTURE untitled OF WRbyte_sel IS
BEGIN
  WRITE : PROCESS(M_align, Valid3out, writeType)
    VARIABLE write : std_logic_vector(1 downto 0);
    BEGIN
      if Valid3out = '1' then
        case writeType is
         when "00" =>
            write := "11";
         when "01" =>
            if M_align = '1' then
              write := "01";
            else
              write := "10";
            end if;
          when "11" =>
            write := "00";
          when others =>
           write := "11";
        end case;
      else
        write := "11";
      end if;
      MWRITEH_L <= write(1) after delay_MUX8;
      MWRITEL_L <= write(0) after delay_MUX8;
    end process;
END ARCHITECTURE untitled;

-- VHDL Entity ece411.stage_data.symbol
--
-- Created:
--          by - adalton2.ews (siebl-0218-19.ews.illinois.edu)
--          at - 23:07:53 04/03/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY stage_data IS
   PORT( 
      ClearValid       : IN     std_logic;
      Control_word     : IN     lc3b_dword;
      IR               : IN     lc3b_word;
      PC               : IN     lc3b_word;
      RESET_L          : IN     std_logic;
      STALL_L          : IN     std_logic;
      Valid            : IN     std_logic;
      clk              : IN     std_logic;
      Control_word_out : OUT    lc3b_dword;
      IR_out           : OUT    lc3b_word;
      PC_out           : OUT    lc3b_word;
      Valid_out        : OUT    std_logic
   );

-- Declarations

END stage_data ;

--
-- VHDL Architecture ece411.stage_data.struct
--
-- Created:
--          by - adalton2.ews (siebl-0218-19.ews.illinois.edu)
--          at - 23:07:53 04/03/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF stage_data IS

   -- Architecture declarations

   -- Internal signal declarations


   -- Component Declarations
   COMPONENT REG32
   PORT (
      A       : IN     lc3b_dword;
      CLK     : IN     STD_LOGIC;
      EN      : IN     STD_LOGIC;
      RESET_L : IN     STD_LOGIC;
      F       : OUT    lc3b_dword
   );
   END COMPONENT;
   COMPONENT REG1
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     STD_LOGIC ;
      EN      : IN     STD_LOGIC ;
      CLK     : IN     STD_LOGIC ;
      F       : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT REG16
   PORT (
      RESET_L : IN     STD_LOGIC ;
      A       : IN     STD_LOGIC_VECTOR (15 DOWNTO 0);
      EN      : IN     STD_LOGIC ;
      CLK     : IN     STD_LOGIC ;
      F       : OUT    STD_LOGIC_VECTOR (15 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : REG1 USE ENTITY mp3lib.REG1;
   FOR ALL : REG16 USE ENTITY mp3lib.REG16;
   FOR ALL : REG32 USE ENTITY ece411.REG32;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   CWORD : REG32
      PORT MAP (
         RESET_L => RESET_L,
         A       => Control_word,
         EN      => STALL_L,
         CLK     => clk,
         F       => Control_word_out
      );
   U_2 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => Valid,
         EN      => STALL_L,
         CLK     => clk,
         F       => Valid_out
      );
   U_0 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => PC,
         EN      => STALL_L,
         CLK     => clk,
         F       => PC_out
      );
   U_1 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => IR,
         EN      => STALL_L,
         CLK     => clk,
         F       => IR_out
      );

END struct;

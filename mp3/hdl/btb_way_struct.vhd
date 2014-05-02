-- VHDL Entity ece411.BTB_way.symbol
--
-- Created:
--          by - lis2.ews (siebl-0220-14.ews.illinois.edu)
--          at - 03:29:00 05/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY BTB_way IS
   PORT( 
      CLK        : IN     std_logic;
      DataIn     : IN     LC3b_word;
      DataWrite  : IN     std_logic;
      RESET_L    : IN     std_logic;
      ReadIndex  : IN     std_logic;
      TagIn      : IN     LC3b_word;
      TakenIn    : IN     std_logic;
      WriteIndex : IN     std_logic;
      DataOut    : OUT    LC3b_word;
      TagOut     : OUT    LC3b_word;
      TakenOut   : OUT    std_logic;
      ValidOut   : OUT    std_logic;
      WriteTag   : OUT    LC3b_word
   );

-- Declarations

END BTB_way ;

--
-- VHDL Architecture ece411.BTB_way.struct
--
-- Created:
--          by - lis2.ews (siebl-0220-14.ews.illinois.edu)
--          at - 03:29:00 05/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF BTB_way IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ValidIn : std_logic;


   -- Component Declarations
   COMPONENT BTB_DataArray
   PORT (
      CLK        : IN     std_logic;
      DataIn     : IN     LC3b_word;
      DataWrite  : IN     std_logic;
      RESET_L    : IN     std_logic;
      ReadIndex  : IN     std_logic;
      WriteIndex : IN     std_logic;
      DataOut    : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT BTB_TagArray
   PORT (
      CLK        : IN     std_logic;
      DataIn     : IN     LC3b_word;
      DataWrite  : IN     std_logic;
      RESET_L    : IN     std_logic;
      ReadIndex  : IN     std_logic;
      WriteIndex : IN     std_logic;
      DataOut    : OUT    LC3b_word;
      WriteTag   : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT BTB_TakenArray
   PORT (
      CLK        : IN     std_logic;
      DataIn     : IN     std_logic;
      DataWrite  : IN     std_logic;
      RESET_L    : IN     std_logic;
      ReadIndex  : IN     std_logic;
      WriteIndex : IN     std_logic;
      DataOut    : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT BTB_ValidArray
   PORT (
      CLK        : IN     std_logic;
      DataIn     : IN     std_logic;
      DataWrite  : IN     std_logic;
      RESET_L    : IN     std_logic;
      ReadIndex  : IN     std_logic;
      WriteIndex : IN     std_logic;
      DataOut    : OUT    std_logic
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : BTB_DataArray USE ENTITY ece411.BTB_DataArray;
   FOR ALL : BTB_TagArray USE ENTITY ece411.BTB_TagArray;
   FOR ALL : BTB_TakenArray USE ENTITY ece411.BTB_TakenArray;
   FOR ALL : BTB_ValidArray USE ENTITY ece411.BTB_ValidArray;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   ValidIn <= '1';


   -- Instance port mappings.
   U_0 : BTB_DataArray
      PORT MAP (
         RESET_L    => RESET_L,
         DataWrite  => DataWrite,
         WriteIndex => WriteIndex,
         ReadIndex  => ReadIndex,
         DataIn     => DataIn,
         CLK        => CLK,
         DataOut    => DataOut
      );
   U_1 : BTB_TagArray
      PORT MAP (
         RESET_L    => RESET_L,
         DataWrite  => DataWrite,
         WriteIndex => WriteIndex,
         ReadIndex  => ReadIndex,
         DataIn     => TagIn,
         CLK        => CLK,
         DataOut    => TagOut,
         WriteTag   => WriteTag
      );
   U_2 : BTB_TakenArray
      PORT MAP (
         RESET_L    => RESET_L,
         DataWrite  => DataWrite,
         WriteIndex => WriteIndex,
         ReadIndex  => ReadIndex,
         DataIn     => TakenIn,
         CLK        => CLK,
         DataOut    => TakenOut
      );
   U_4 : BTB_ValidArray
      PORT MAP (
         RESET_L    => RESET_L,
         DataWrite  => DataWrite,
         WriteIndex => WriteIndex,
         ReadIndex  => ReadIndex,
         DataIn     => ValidIn,
         CLK        => CLK,
         DataOut    => ValidOut
      );

END struct;

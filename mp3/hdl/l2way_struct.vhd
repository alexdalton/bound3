-- VHDL Entity ece411.l2way.symbol
--
-- Created:
--          by - adalton2.ews (siebl-0220-18.ews.illinois.edu)
--          at - 23:45:31 05/01/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY l2way IS
   PORT( 
      CacheWrite : IN     std_logic;
      DataIn     : IN     LC3b_oword;
      DirtyIn    : IN     std_logic;
      DirtyWrite : IN     std_logic;
      Index      : IN     LC3b_c_index;
      RESET_L    : IN     std_logic;
      TagIn      : IN     LC3B_C_TAG;
      DataOut    : OUT    LC3b_oword;
      DirtyOut   : OUT    std_logic;
      TagOut     : OUT    LC3B_C_TAG;
      ValidOut   : OUT    std_logic  := '0'
   );

-- Declarations

END l2way ;

--
-- VHDL Architecture ece411.l2way.struct
--
-- Created:
--          by - adalton2.ews (siebl-0220-18.ews.illinois.edu)
--          at - 23:45:31 05/01/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF l2way IS

   -- Architecture declarations

   -- Internal signal declarations


   -- Component Declarations
   COMPONENT L2DataArray
   PORT (
      DataIn    : IN     LC3b_oword;
      DataWrite : IN     std_logic;
      Index     : IN     LC3b_c_index;
      RESET_L   : IN     std_logic;
      DataOut   : OUT    LC3b_oword
   );
   END COMPONENT;
   COMPONENT L2DirtyArray
   PORT (
      DirtyIn    : IN     std_logic;
      DirtyWrite : IN     std_logic;
      Index      : IN     LC3b_c_index;
      RESET_L    : IN     std_logic;
      DirtyOut   : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT L2TagArray
   PORT (
      Index    : IN     LC3b_c_index;
      RESET_L  : IN     std_logic;
      TagIn    : IN     LC3B_C_TAG;
      TagWrite : IN     std_logic;
      TagOut   : OUT    LC3B_C_TAG
   );
   END COMPONENT;
   COMPONENT L2ValidArray
   PORT (
      Index      : IN     LC3b_c_index;
      RESET_L    : IN     std_logic;
      ValidWrite : IN     std_logic;
      ValidOut   : OUT    std_logic  := '0'
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : L2DataArray USE ENTITY ece411.L2DataArray;
   FOR ALL : L2DirtyArray USE ENTITY ece411.L2DirtyArray;
   FOR ALL : L2TagArray USE ENTITY ece411.L2TagArray;
   FOR ALL : L2ValidArray USE ENTITY ece411.L2ValidArray;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   wayData : L2DataArray
      PORT MAP (
         RESET_L   => RESET_L,
         DataWrite => CacheWrite,
         Index     => Index,
         DataIn    => DataIn,
         DataOut   => DataOut
      );
   wayDirty : L2DirtyArray
      PORT MAP (
         RESET_L    => RESET_L,
         DirtyWrite => DirtyWrite,
         Index      => Index,
         DirtyIn    => DirtyIn,
         DirtyOut   => DirtyOut
      );
   wayTag : L2TagArray
      PORT MAP (
         RESET_L  => RESET_L,
         TagWrite => CacheWrite,
         Index    => Index,
         TagIn    => TagIn,
         TagOut   => TagOut
      );
   wayValid : L2ValidArray
      PORT MAP (
         RESET_L    => RESET_L,
         ValidWrite => CacheWrite,
         Index      => Index,
         ValidOut   => ValidOut
      );

END struct;

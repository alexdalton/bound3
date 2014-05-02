-- VHDL Entity ece411.srcRegMUX_calc.symbol
--
-- Created:
--          by - lis2.ews (siebl-0220-14.ews.illinois.edu)
--          at - 03:28:59 05/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY srcRegMUX_calc IS
   PORT( 
      EXEC_DestMask : IN     lc3b_byte;
      EXEC_memOP    : IN     std_logic;
      MEM_DestMask  : IN     lc3b_byte;
      MEM_memOP     : IN     std_logic;
      src_mask      : IN     lc3b_byte;
      hazard        : OUT    STD_LOGIC;
      srcregMUXsel  : OUT    lc3b_4MUX_SEL
   );

-- Declarations

END srcRegMUX_calc ;

--
-- VHDL Architecture ece411.srcRegMUX_calc.struct
--
-- Created:
--          by - lis2.ews (siebl-0220-14.ews.illinois.edu)
--          at - 03:28:59 05/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF srcRegMUX_calc IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL EXmatch_no_memOP : std_logic;
   SIGNAL MEMdatasel       : STD_LOGIC_VECTOR(1 DOWNTO 0);
   SIGNAL MEMsel           : lc3b_4MUX_SEL;
   SIGNAL const00          : lc3b_4MUX_SEL;
   SIGNAL const01          : lc3b_4MUX_SEL;
   SIGNAL match_EXEC       : STD_LOGIC;
   SIGNAL match_MEM        : STD_LOGIC;


   -- Component Declarations
   COMPONENT AND2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT ANDINV2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT mask_intersection_check
   PORT (
      maskA   : IN     lc3b_byte ;
      maskB   : IN     lc3b_byte ;
      match   : OUT    std_logic ;
      match_L : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT MUX2_2
   PORT (
      A   : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      B   : IN     STD_LOGIC_VECTOR (1 DOWNTO 0);
      SEL : IN     STD_LOGIC ;
      F   : OUT    STD_LOGIC_VECTOR (1 DOWNTO 0)
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY ece411.AND2;
   FOR ALL : ANDINV2 USE ENTITY ece411.ANDINV2;
   FOR ALL : MUX2_2 USE ENTITY mp3lib.MUX2_2;
   FOR ALL : mask_intersection_check USE ENTITY ece411.mask_intersection_check;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 constants
   -- constants 1
   const00 <= "00";
   const01 <= "01";
   MEMdatasel <= '1' & MEM_memOP;
                                           


   -- Instance port mappings.
   U_2 : AND2
      PORT MAP (
         A => match_EXEC,
         B => EXEC_memOP,
         C => hazard
      );
   U_4 : ANDINV2
      PORT MAP (
         A => match_EXEC,
         B => EXEC_memOP,
         C => EXmatch_no_memOP
      );
   U_3 : mask_intersection_check
      PORT MAP (
         maskA   => EXEC_DestMask,
         maskB   => src_mask,
         match   => match_EXEC,
         match_L => OPEN
      );
   U_11 : mask_intersection_check
      PORT MAP (
         maskA   => src_mask,
         maskB   => MEM_DestMask,
         match   => match_MEM,
         match_L => OPEN
      );
   U_0 : MUX2_2
      PORT MAP (
         A   => MEMsel,
         B   => const01,
         SEL => EXmatch_no_memOP,
         F   => srcregMUXsel
      );
   U_1 : MUX2_2
      PORT MAP (
         A   => const00,
         B   => MEMdatasel,
         SEL => match_MEM,
         F   => MEMsel
      );

END struct;

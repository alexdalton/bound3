-- VHDL Entity ece411.DependencyCheck.symbol
--
-- Created:
--          by - lis2.ews (siebl-0220-14.ews.illinois.edu)
--          at - 22:31:45 05/01/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY DependencyCheck IS
   PORT( 
      RD_CW        : IN     lc3b_dword;
      RD_IR        : IN     lc3b_word;
      RD_V         : IN     std_logic;
      WR_CW1       : IN     lc3b_dword;
      WR_CW2       : IN     lc3b_dword;
      WR_CW3       : IN     lc3b_dword;
      WR_IR1       : IN     lc3b_word;
      WR_IR2       : IN     lc3b_word;
      WR_IR3       : IN     lc3b_word;
      WR_V1        : IN     std_logic;
      WR_V2        : IN     std_logic;
      WR_V3        : IN     std_logic;
      indirect_mem : IN     std_logic;
      valid_memOP  : IN     std_logic;
      RAW_hazard   : OUT    std_logic;
      RAW_hazard_L : OUT    std_logic;
      srcA_MUXsel  : OUT    lc3b_4MUX_SEL;
      srcB_MUXsel  : OUT    lc3b_4MUX_SEL
   );

-- Declarations

END DependencyCheck ;

--
-- VHDL Architecture ece411.DependencyCheck.struct
--
-- Created:
--          by - lis2.ews (siebl-0220-14.ews.illinois.edu)
--          at - 22:31:45 05/01/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF DependencyCheck IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL EXEC_DestMask : lc3b_byte;
   SIGNAL EXEC_memOP    : std_logic;
   SIGNAL MEM_DestMask  : lc3b_byte;
   SIGNAL SrcMask       : lc3b_byte;
   SIGNAL V_EXEC_memOP  : std_logic;
   SIGNAL V_MEM_memOP   : std_logic;
   SIGNAL WB_DestMask   : lc3b_byte;
   SIGNAL WRmask        : lc3b_byte;
   SIGNAL srcAhazard    : STD_LOGIC;
   SIGNAL srcAmask      : LC3B_BYTE;
   SIGNAL srcBhazard    : STD_LOGIC;
   SIGNAL srcBmask      : LC3B_BYTE;


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
   COMPONENT DestReg_MaskCalc
   PORT (
      WR_CW    : IN     lc3b_dword ;
      WR_IR    : IN     lc3b_word ;
      WR_V     : IN     std_logic ;
      DestMask : OUT    lc3b_byte 
   );
   END COMPONENT;
   COMPONENT NOR2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT OR2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT OR3_byte
   PORT (
      A : IN     lc3b_byte ;
      B : IN     lc3b_byte ;
      C : IN     lc3b_byte ;
      D : OUT    lc3b_byte 
   );
   END COMPONENT;
   COMPONENT SrcReg_MaskCalc
   PORT (
      RD_CW    : IN     lc3b_dword ;
      RD_IR    : IN     lc3b_word ;
      RD_V     : IN     std_logic ;
      SrcMask  : OUT    lc3b_byte ;
      srcAmask : OUT    LC3B_BYTE ;
      srcBmask : OUT    LC3B_BYTE 
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
   COMPONENT mem_op_ripper
   PORT (
      WR_CW1     : IN     lc3b_dword ;
      EXEC_memOP : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT srcRegMUX_calc
   PORT (
      EXEC_DestMask : IN     lc3b_byte ;
      EXEC_memOP    : IN     std_logic ;
      MEM_DestMask  : IN     lc3b_byte ;
      MEM_memOP     : IN     std_logic ;
      src_mask      : IN     lc3b_byte ;
      hazard        : OUT    STD_LOGIC ;
      srcregMUXsel  : OUT    lc3b_4MUX_SEL 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY ece411.AND2;
   FOR ALL : ANDINV2 USE ENTITY ece411.ANDINV2;
   FOR ALL : DestReg_MaskCalc USE ENTITY ece411.DestReg_MaskCalc;
   FOR ALL : NOR2 USE ENTITY ece411.NOR2;
   FOR ALL : OR2 USE ENTITY ece411.OR2;
   FOR ALL : OR3_byte USE ENTITY ece411.OR3_byte;
   FOR ALL : SrcReg_MaskCalc USE ENTITY ece411.SrcReg_MaskCalc;
   FOR ALL : mask_intersection_check USE ENTITY ece411.mask_intersection_check;
   FOR ALL : mem_op_ripper USE ENTITY ece411.mem_op_ripper;
   FOR ALL : srcRegMUX_calc USE ENTITY ece411.srcRegMUX_calc;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   U_6 : AND2
      PORT MAP (
         A => WR_V1,
         B => EXEC_memOP,
         C => V_EXEC_memOP
      );
   U_5 : ANDINV2
      PORT MAP (
         A => valid_memOP,
         B => indirect_mem,
         C => V_MEM_memOP
      );
   EX_dest : DestReg_MaskCalc
      PORT MAP (
         WR_CW    => WR_CW1,
         WR_IR    => WR_IR1,
         WR_V     => WR_V1,
         DestMask => EXEC_DestMask
      );
   MEM_dest : DestReg_MaskCalc
      PORT MAP (
         WR_CW    => WR_CW2,
         WR_IR    => WR_IR2,
         WR_V     => WR_V2,
         DestMask => MEM_DestMask
      );
   WB_dest : DestReg_MaskCalc
      PORT MAP (
         WR_CW    => WR_CW3,
         WR_IR    => WR_IR3,
         WR_V     => WR_V3,
         DestMask => WB_DestMask
      );
   U_7 : NOR2
      PORT MAP (
         A => srcAhazard,
         B => srcBhazard,
         C => RAW_hazard_L
      );
   U_4 : OR2
      PORT MAP (
         A => srcAhazard,
         B => srcBhazard,
         C => RAW_hazard
      );
   U_0 : OR3_byte
      PORT MAP (
         A => EXEC_DestMask,
         B => MEM_DestMask,
         C => WB_DestMask,
         D => WRmask
      );
   DEC_src : SrcReg_MaskCalc
      PORT MAP (
         RD_CW    => RD_CW,
         RD_IR    => RD_IR,
         RD_V     => RD_V,
         SrcMask  => SrcMask,
         srcAmask => srcAmask,
         srcBmask => srcBmask
      );
   U_12 : mask_intersection_check
      PORT MAP (
         maskA   => SrcMask,
         maskB   => WRmask,
         match   => OPEN,
         match_L => OPEN
      );
   U_1 : mem_op_ripper
      PORT MAP (
         WR_CW1     => WR_CW1,
         EXEC_memOP => EXEC_memOP
      );
   U_2 : srcRegMUX_calc
      PORT MAP (
         EXEC_DestMask => EXEC_DestMask,
         EXEC_memOP    => EXEC_memOP,
         MEM_DestMask  => MEM_DestMask,
         MEM_memOP     => V_MEM_memOP,
         src_mask      => srcAmask,
         hazard        => srcAhazard,
         srcregMUXsel  => srcA_MUXsel
      );
   U_3 : srcRegMUX_calc
      PORT MAP (
         EXEC_DestMask => EXEC_DestMask,
         EXEC_memOP    => EXEC_memOP,
         MEM_DestMask  => MEM_DestMask,
         MEM_memOP     => V_MEM_memOP,
         src_mask      => srcBmask,
         hazard        => srcBhazard,
         srcregMUXsel  => srcB_MUXsel
      );

END struct;

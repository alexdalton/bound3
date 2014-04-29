-- VHDL Entity ece411.pipelineDP.symbol
--
-- Created:
--          by - lis2.ews (siebl-0218-26.ews.illinois.edu)
--          at - 17:02:15 04/29/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY pipelineDP IS
   PORT( 
      D_DATAIN  : IN     lc3b_word;
      D_MRESP_H : IN     std_logic;
      I_DATAIN  : IN     lc3b_word;
      I_MRESP_H : IN     std_logic  := '0';
      RESET_L   : IN     std_logic;
      clk       : IN     std_logic;
      ADDRESS1  : OUT    lc3b_word;
      ADDRESS2  : OUT    lc3b_word;
      DATAOUT   : OUT    lc3b_word;
      MREADD_L  : OUT    std_logic;
      MREADI_L  : OUT    std_logic;
      MWRITEH_L : OUT    std_logic;
      MWRITEL_L : OUT    std_logic
   );

-- Declarations

END pipelineDP ;

--
-- VHDL Architecture ece411.pipelineDP.struct
--
-- Created:
--          by - lis2.ews (siebl-0218-26.ews.illinois.edu)
--          at - 17:02:15 04/29/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

LIBRARY mp3lib;

ARCHITECTURE struct OF pipelineDP IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ALU3out              : lc3b_word;
   SIGNAL ALU4out              : lc3b_word;
   SIGNAL C                    : std_logic;
   SIGNAL C1                   : std_logic;
   SIGNAL CW1out               : lc3b_dword;
   SIGNAL CW2out               : lc3b_dword;
   SIGNAL CW3out               : lc3b_dword;
   SIGNAL CW4out               : lc3b_dword;
   SIGNAL DECODE_STALL_L       : std_logic;
   SIGNAL F                    : STD_LOGIC;
   SIGNAL F1                   : STD_LOGIC;
   SIGNAL F2                   : STD_LOGIC;
   SIGNAL IMRESP_RST           : std_logic;
   SIGNAL IR1out               : lc3b_word;
   SIGNAL IR2out               : lc3b_word;
   SIGNAL IR3out               : lc3b_word;
   SIGNAL IR4out               : lc3b_word;
   SIGNAL MEMdata4out          : lc3b_word;
   SIGNAL PC1out               : lc3b_word;
   SIGNAL PC2out               : lc3b_word;
   SIGNAL PC3out               : lc3b_word;
   SIGNAL PC4out               : lc3b_word;
   SIGNAL RAW_STALL_L          : std_logic;
   SIGNAL RAW_hazard           : std_logic;
   SIGNAL RAW_hazard_L         : std_logic;
   SIGNAL RAW_hazard_clked     : STD_LOGIC;
   SIGNAL RAW_hazard_long      : std_logic;
   SIGNAL RegWrite5            : std_logic;
   SIGNAL STALL_L              : std_logic;
   SIGNAL STALL_L_B            : std_logic;
   SIGNAL Valid1out            : std_logic;
   SIGNAL Valid2out            : std_logic;
   SIGNAL Valid3out            : std_logic;
   SIGNAL Valid4out            : std_logic;
   SIGNAL calcPC               : LC3b_word;
   SIGNAL clearValid3          : std_logic;
   SIGNAL clearValid4          : std_logic;
   SIGNAL clearValid5          : std_logic;
   SIGNAL const1               : STD_LOGIC;
   SIGNAL destreg5             : lc3b_reg;
   SIGNAL destsel5             : std_logic;
   SIGNAL invalidate_fetch     : std_logic;
   SIGNAL invalidate_fetch_de  : std_logic;
   SIGNAL invalidate_fetch_ex  : STD_LOGIC;
   SIGNAL invalidate_fetch_mem : STD_LOGIC;
   SIGNAL memAddress           : lc3b_word;
   SIGNAL memCWORD             : lc3b_dword;
   SIGNAL memIndirect          : std_logic;
   SIGNAL memoryOP             : std_logic;
   SIGNAL n                    : std_logic;
   SIGNAL p                    : std_logic;
   SIGNAL regA2out             : lc3b_word;
   SIGNAL regA3out             : lc3b_word;
   SIGNAL regA4out             : lc3b_word;
   SIGNAL regB2out             : lc3b_word;
   SIGNAL regB3out             : lc3b_word;
   SIGNAL regB4out             : lc3b_word;
   SIGNAL regdata5in           : lc3b_word;
   SIGNAL reset_delayed        : std_logic;
   SIGNAL takeBranch           : std_logic;
   SIGNAL trap                 : std_logic;
   SIGNAL trapPC               : LC3b_word;
   SIGNAL z                    : std_logic;


   -- Component Declarations
   COMPONENT DependencyCheck
   PORT (
      RD_CW        : IN     lc3b_dword ;
      RD_IR        : IN     lc3b_word ;
      RD_V         : IN     std_logic ;
      WR_CW1       : IN     lc3b_dword ;
      WR_CW2       : IN     lc3b_dword ;
      WR_CW3       : IN     lc3b_dword ;
      WR_IR1       : IN     lc3b_word ;
      WR_IR2       : IN     lc3b_word ;
      WR_IR3       : IN     lc3b_word ;
      WR_V1        : IN     std_logic ;
      WR_V2        : IN     std_logic ;
      WR_V3        : IN     std_logic ;
      RAW_hazard   : OUT    std_logic ;
      RAW_hazard_L : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT MUX2
   PORT (
      A   : IN     std_logic ;
      B   : IN     std_logic ;
      Sel : IN     std_logic ;
      F   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT ORINV2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT RESET_DELAY
   PORT (
      RESET_L       : IN     std_logic ;
      clk           : IN     std_logic ;
      reset_delayed : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT stage_decode
   PORT (
      IR1out           : IN     lc3b_word ;
      PC1out           : IN     lc3b_word ;
      RESET_L          : IN     std_logic ;
      RegWrite5        : IN     std_logic ;
      STALL_L          : IN     std_logic ;
      Valid1out        : IN     std_logic ;
      clearValid2      : IN     std_logic ;
      clk              : IN     std_logic ;
      destreg5         : IN     lc3b_reg ;
      destsel5         : IN     std_logic ;
      n                : IN     std_logic ;
      p                : IN     std_logic ;
      regdata5in       : IN     lc3b_word ;
      z                : IN     std_logic ;
      CW1out           : OUT    LC3B_DWORD ;
      CW2out           : OUT    lc3b_dword ;
      IR2out           : OUT    lc3b_word ;
      PC2out           : OUT    lc3b_word ;
      Valid2out        : OUT    std_logic ;
      calcPC           : OUT    lc3b_word ;
      invalidate_fetch : OUT    std_logic ;
      regA2out         : OUT    lc3b_word ;
      regB2out         : OUT    lc3b_word ;
      takeBranch       : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT stage_execute
   PORT (
      CW2out           : IN     lc3b_dword ;
      IR2out           : IN     lc3b_word ;
      PC2out           : IN     lc3b_word ;
      RESET_L          : IN     std_logic ;
      STALL_L          : IN     std_logic ;
      STALL_L_B        : IN     std_logic ;
      Valid2out        : IN     std_logic ;
      clearValid       : IN     std_logic ;
      clk              : IN     std_logic ;
      memAddress       : IN     lc3b_word ;
      memCWORD         : IN     lc3b_dword ;
      memIndirect      : IN     std_logic ;
      regA2out         : IN     lc3b_word ;
      regB2out         : IN     lc3b_word ;
      ALU3out          : OUT    lc3b_word ;
      CW3out           : OUT    lc3b_dword ;
      IR3out           : OUT    lc3b_word ;
      PC3out           : OUT    lc3b_word ;
      Valid3out        : OUT    std_logic ;
      invalidate_fetch : OUT    STD_LOGIC ;
      regA3out         : OUT    lc3b_word ;
      regB3out         : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT stage_fetch
   PORT (
      DataIn1    : IN     lc3b_word ;
      RESET_L    : IN     std_logic ;
      STALL_L    : IN     std_logic ;
      branch     : IN     std_logic ;
      calcPC     : IN     LC3b_word ;
      clearValid : IN     std_logic ;
      clk        : IN     std_logic ;
      trap       : IN     std_logic ;
      trapPC     : IN     LC3b_word ;
      ADDRESS1   : OUT    lc3b_word ;
      IR1out     : OUT    lc3b_word ;
      MREADI_L   : OUT    std_logic ;
      PC1out     : OUT    lc3b_word ;
      Valid1out  : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT stage_memory
   PORT (
      ALU3out          : IN     lc3b_word ;
      CW3out           : IN     lc3b_dword ;
      D_DATAIN         : IN     lc3b_word ;
      IR3out           : IN     lc3b_word ;
      PC3out           : IN     lc3b_word ;
      RESET_L          : IN     std_logic ;
      STALL_L          : IN     std_logic ;
      clearValid4      : IN     std_logic ;
      clk              : IN     std_logic ;
      regA3out         : IN     lc3b_word ;
      regB3out         : IN     lc3b_word ;
      valid3out        : IN     std_logic ;
      ADDRESS2         : OUT    lc3b_word ;
      ALU4out          : OUT    lc3b_word ;
      CW4out           : OUT    lc3b_dword ;
      DATAOUT          : OUT    lc3b_word ;
      IR4out           : OUT    lc3b_word ;
      MEMdata4out      : OUT    lc3b_word ;
      MREADD_L         : OUT    std_logic ;
      MWRITEH_L        : OUT    std_logic ;
      MWRITEL_L        : OUT    std_logic ;
      PC4out           : OUT    lc3b_word ;
      Valid4out        : OUT    std_logic ;
      invalidate_fetch : OUT    STD_LOGIC ;
      memAddress       : OUT    lc3b_word ;
      memCWORD         : OUT    lc3b_dword ;
      memIndirect      : OUT    std_logic ;
      memoryOP         : OUT    std_logic ;
      n                : OUT    std_logic ;
      p                : OUT    std_logic ;
      regA4out         : OUT    lc3b_word ;
      regB4out         : OUT    lc3b_word ;
      trap             : OUT    std_logic ;
      trapPC           : OUT    lc3b_word ;
      z                : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT stage_writeback
   PORT (
      ALU4out     : IN     lc3b_word ;
      CW4out      : IN     lc3b_dword ;
      IR4out      : IN     lc3b_word ;
      MEMdata4out : IN     lc3b_word ;
      PC4out      : IN     lc3b_word ;
      RESET_L     : IN     std_logic ;
      STALL_L     : IN     std_logic ;
      Valid4out   : IN     std_logic ;
      clearValid5 : IN     std_logic ;
      clk         : IN     std_logic ;
      regA4out    : IN     lc3b_word ;
      regB4out    : IN     lc3b_word ;
      RegWrite5   : OUT    std_logic ;
      destreg5    : OUT    lc3b_reg ;
      destsel5    : OUT    std_logic ;
      regdata5in  : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT AND3
   PORT (
      A : IN     STD_LOGIC ;
      B : IN     STD_LOGIC ;
      C : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
   );
   END COMPONENT;
   COMPONENT NOT1
   PORT (
      A : IN     STD_LOGIC ;
      F : OUT    STD_LOGIC 
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

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND3 USE ENTITY mp3lib.AND3;
   FOR ALL : DependencyCheck USE ENTITY ece411.DependencyCheck;
   FOR ALL : MUX2 USE ENTITY ece411.MUX2;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : ORINV2 USE ENTITY ece411.ORINV2;
   FOR ALL : REG1 USE ENTITY mp3lib.REG1;
   FOR ALL : RESET_DELAY USE ENTITY ece411.RESET_DELAY;
   FOR ALL : stage_decode USE ENTITY ece411.stage_decode;
   FOR ALL : stage_execute USE ENTITY ece411.stage_execute;
   FOR ALL : stage_fetch USE ENTITY ece411.stage_fetch;
   FOR ALL : stage_memory USE ENTITY ece411.stage_memory;
   FOR ALL : stage_writeback USE ENTITY ece411.stage_writeback;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   -- eb1 1
   const1 <= '1';
   clearValid3 <= '1';
   clearValid4 <= '1';
   clearValid5 <= '1';                                      


   -- Instance port mappings.
   U_7 : ENTITY ece411.AND2
      PORT MAP (
         A => STALL_L,
         B => RAW_hazard_L,
         C => DECODE_STALL_L
      );
   U_11 : ENTITY ece411.AND2
      PORT MAP (
         A => F2,
         B => RAW_hazard_long,
         C => C
      );
   aDepCheck : DependencyCheck
      PORT MAP (
         RD_CW        => CW1out,
         RD_IR        => IR1out,
         RD_V         => Valid1out,
         WR_CW1       => CW2out,
         WR_CW2       => CW3out,
         WR_CW3       => CW4out,
         WR_IR1       => IR2out,
         WR_IR2       => IR3out,
         WR_IR3       => IR4out,
         WR_V1        => Valid2out,
         WR_V2        => Valid3out,
         WR_V3        => Valid4out,
         RAW_hazard   => RAW_hazard,
         RAW_hazard_L => RAW_hazard_L
      );
   U_0 : MUX2
      PORT MAP (
         A   => RAW_STALL_L,
         B   => D_MRESP_H,
         Sel => memoryOP,
         F   => STALL_L_B
      );
   U_5 : ENTITY ece411.OR2
      PORT MAP (
         A => RAW_hazard,
         B => RAW_hazard_clked,
         C => RAW_hazard_long
      );
   U_6 : ENTITY ece411.OR2
      PORT MAP (
         A => C,
         B => IMRESP_RST,
         C => RAW_STALL_L
      );
   U_9 : ENTITY ece411.OR2
      PORT MAP (
         A => RAW_hazard_clked,
         B => RAW_hazard,
         C => C1
      );
   StallOR1 : ORINV2
      PORT MAP (
         A => reset_delayed,
         B => I_MRESP_H,
         C => IMRESP_RST
      );
   adelay : RESET_DELAY
      PORT MAP (
         RESET_L       => RESET_L,
         clk           => clk,
         reset_delayed => reset_delayed
      );
   stage2 : stage_decode
      PORT MAP (
         IR1out           => IR1out,
         PC1out           => PC1out,
         RESET_L          => RESET_L,
         RegWrite5        => RegWrite5,
         STALL_L          => STALL_L,
         Valid1out        => Valid1out,
         clearValid2      => DECODE_STALL_L,
         clk              => clk,
         destreg5         => destreg5,
         destsel5         => destsel5,
         n                => n,
         p                => p,
         regdata5in       => regdata5in,
         z                => z,
         CW1out           => CW1out,
         CW2out           => CW2out,
         IR2out           => IR2out,
         PC2out           => PC2out,
         Valid2out        => Valid2out,
         calcPC           => calcPC,
         invalidate_fetch => invalidate_fetch_de,
         regA2out         => regA2out,
         regB2out         => regB2out,
         takeBranch       => takeBranch
      );
   stage3 : stage_execute
      PORT MAP (
         CW2out           => CW2out,
         IR2out           => IR2out,
         PC2out           => PC2out,
         RESET_L          => RESET_L,
         STALL_L          => STALL_L,
         STALL_L_B        => STALL_L_B,
         Valid2out        => Valid2out,
         clearValid       => clearValid3,
         clk              => clk,
         memAddress       => memAddress,
         memCWORD         => memCWORD,
         memIndirect      => memIndirect,
         regA2out         => regA2out,
         regB2out         => regB2out,
         ALU3out          => ALU3out,
         CW3out           => CW3out,
         IR3out           => IR3out,
         PC3out           => PC3out,
         Valid3out        => Valid3out,
         invalidate_fetch => invalidate_fetch_ex,
         regA3out         => regA3out,
         regB3out         => regB3out
      );
   stage1 : stage_fetch
      PORT MAP (
         DataIn1    => I_DATAIN,
         RESET_L    => RESET_L,
         STALL_L    => DECODE_STALL_L,
         branch     => takeBranch,
         calcPC     => calcPC,
         clearValid => invalidate_fetch,
         clk        => clk,
         trap       => trap,
         trapPC     => trapPC,
         ADDRESS1   => ADDRESS1,
         IR1out     => IR1out,
         MREADI_L   => MREADI_L,
         PC1out     => PC1out,
         Valid1out  => Valid1out
      );
   stage4 : stage_memory
      PORT MAP (
         ALU3out          => ALU3out,
         CW3out           => CW3out,
         D_DATAIN         => D_DATAIN,
         IR3out           => IR3out,
         PC3out           => PC3out,
         RESET_L          => RESET_L,
         STALL_L          => STALL_L,
         clearValid4      => clearValid4,
         clk              => clk,
         regA3out         => regA3out,
         regB3out         => regB3out,
         valid3out        => Valid3out,
         ADDRESS2         => ADDRESS2,
         ALU4out          => ALU4out,
         CW4out           => CW4out,
         DATAOUT          => DATAOUT,
         IR4out           => IR4out,
         MEMdata4out      => MEMdata4out,
         MREADD_L         => MREADD_L,
         MWRITEH_L        => MWRITEH_L,
         MWRITEL_L        => MWRITEL_L,
         PC4out           => PC4out,
         Valid4out        => Valid4out,
         invalidate_fetch => invalidate_fetch_mem,
         memAddress       => memAddress,
         memCWORD         => memCWORD,
         memIndirect      => memIndirect,
         memoryOP         => memoryOP,
         n                => n,
         p                => p,
         regA4out         => regA4out,
         regB4out         => regB4out,
         trap             => trap,
         trapPC           => trapPC,
         z                => z
      );
   stage5 : stage_writeback
      PORT MAP (
         ALU4out     => ALU4out,
         CW4out      => CW4out,
         IR4out      => IR4out,
         MEMdata4out => MEMdata4out,
         PC4out      => PC4out,
         RESET_L     => RESET_L,
         STALL_L     => STALL_L,
         Valid4out   => Valid4out,
         clearValid5 => clearValid5,
         clk         => clk,
         regA4out    => regA4out,
         regB4out    => regB4out,
         RegWrite5   => RegWrite5,
         destreg5    => destreg5,
         destsel5    => destsel5,
         regdata5in  => regdata5in
      );
   U_2 : ENTITY mp3lib.AND2
      PORT MAP (
         A => STALL_L_B,
         B => F,
         F => STALL_L
      );
   U_1 : AND3
      PORT MAP (
         A => invalidate_fetch_de,
         B => invalidate_fetch_ex,
         C => invalidate_fetch_mem,
         F => invalidate_fetch
      );
   U_3 : NOT1
      PORT MAP (
         A => memIndirect,
         F => F
      );
   U_10 : ENTITY mp3lib.OR2
      PORT MAP (
         A => F2,
         B => I_MRESP_H,
         F => F1
      );
   U_4 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => RAW_hazard,
         EN      => const1,
         CLK     => clk,
         F       => RAW_hazard_clked
      );
   U_8 : REG1
      PORT MAP (
         RESET_L => C1,
         A       => F1,
         EN      => RAW_hazard,
         CLK     => clk,
         F       => F2
      );

END struct;

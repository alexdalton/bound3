-- VHDL Entity ece411.pipelineDP.symbol
--
-- Created:
--          by - adalton2.ews (siebl-0220-18.ews.illinois.edu)
--          at - 02:31:24 05/02/14
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
--          by - adalton2.ews (siebl-0220-18.ews.illinois.edu)
--          at - 02:31:24 05/02/14
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
   SIGNAL ALU3out               : lc3b_word;
   SIGNAL ALU3out_prelatch      : lc3b_word;
   SIGNAL ALU4out               : lc3b_word;
   SIGNAL ALU_STALL             : STD_LOGIC;
   SIGNAL ALU_STALL_DRESP       : STD_LOGIC;
   SIGNAL ALU_STALL_DRESP_DELAY : std_logic;
   SIGNAL ALU_STALL_IRESP       : STD_LOGIC;
   SIGNAL ALU_STALL_IRESP_DELAY : std_logic;
   SIGNAL ALU_STALL_L           : std_logic;
   SIGNAL ALU_STALL_LAST        : std_logic;
   SIGNAL BRprediction          : std_logic;
   SIGNAL C                     : std_logic;
   SIGNAL C1                    : std_logic;
   SIGNAL C2                    : std_logic;
   SIGNAL C3                    : std_logic;
   SIGNAL CW1out                : lc3b_dword;
   SIGNAL CW2out                : lc3b_dword;
   SIGNAL CW3out                : lc3b_dword;
   SIGNAL CW4out                : lc3b_dword;
   SIGNAL DECODE_STALL_L        : std_logic;
   SIGNAL F                     : STD_LOGIC;
   SIGNAL F1                    : STD_LOGIC;
   SIGNAL F2                    : STD_LOGIC;
   SIGNAL F4                    : STD_LOGIC;
   SIGNAL HAZARD_IRESP          : STD_LOGIC;
   SIGNAL HAZARD_STALL_LAST     : std_logic;
   SIGNAL IMRESP_RST            : std_logic;
   SIGNAL IR1out                : lc3b_word;
   SIGNAL IR2out                : lc3b_word;
   SIGNAL IR3out                : lc3b_word;
   SIGNAL IR4out                : lc3b_word;
   SIGNAL IRESP_STALL_LAST      : std_logic;
   SIGNAL MEMdata4out           : lc3b_word;
   SIGNAL MEMdata4out_prelatch  : LC3b_word;
   SIGNAL PC1out                : lc3b_word;
   SIGNAL PC2out                : lc3b_word;
   SIGNAL PC3out                : lc3b_word;
   SIGNAL PC4out                : lc3b_word;
   SIGNAL PCmismatch            : std_logic;
   SIGNAL PCmismatch_L          : STD_LOGIC;
   SIGNAL RAW_STALL_L           : std_logic;
   SIGNAL RAW_hazard            : std_logic;
   SIGNAL RAW_hazard_L          : std_logic;
   SIGNAL RAW_hazard_clked      : STD_LOGIC;
   SIGNAL RAW_hazard_long       : std_logic;
   SIGNAL RegWrite5             : std_logic;
   SIGNAL STALL_L               : std_logic;
   SIGNAL STALL_L_B             : std_logic;
   SIGNAL Valid1out             : std_logic;
   SIGNAL Valid2out             : std_logic;
   SIGNAL Valid3out             : std_logic;
   SIGNAL Valid4out             : std_logic;
   SIGNAL calcPC                : lc3b_word;
   SIGNAL clearDecode           : std_logic;
   SIGNAL clearValid4           : std_logic;
   SIGNAL clearValid5           : std_logic;
   SIGNAL const0                : std_logic;
   SIGNAL const1                : STD_LOGIC;
   SIGNAL destreg5              : lc3b_reg;
   SIGNAL destsel5              : std_logic;
   SIGNAL memAddress            : lc3b_word;
   SIGNAL memCWORD              : lc3b_dword;
   SIGNAL memIndirect           : std_logic;
   SIGNAL memoryOP              : std_logic;
   SIGNAL regA2out              : lc3b_word;
   SIGNAL regA3out              : lc3b_word;
   SIGNAL regA4out              : lc3b_word;
   SIGNAL regB2out              : lc3b_word;
   SIGNAL regB3out              : lc3b_word;
   SIGNAL regB4out              : lc3b_word;
   SIGNAL regdata5in            : lc3b_word;
   SIGNAL reset_delayed         : std_logic;
   SIGNAL srcA_MUXsel           : lc3b_4MUX_SEL;
   SIGNAL srcB_MUXsel           : lc3b_4MUX_SEL;
   SIGNAL writeBTB              : std_logic;


   -- Component Declarations
   COMPONENT AND3
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : IN     std_logic ;
      D : OUT    std_logic 
   );
   END COMPONENT;
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
      indirect_mem : IN     std_logic ;
      valid_memOP  : IN     std_logic ;
      RAW_hazard   : OUT    std_logic ;
      RAW_hazard_L : OUT    std_logic ;
      srcA_MUXsel  : OUT    lc3b_4MUX_SEL ;
      srcB_MUXsel  : OUT    lc3b_4MUX_SEL 
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
   COMPONENT OR3
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : IN     std_logic ;
      D : OUT    std_logic 
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
   COMPONENT delay1
   PORT (
      ALU_STALL_IRESP       : IN     STD_LOGIC;
      clk                   : IN     std_logic;
      ALU_STALL_IRESP_DELAY : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT delay2
   PORT (
      ALU_STALL_DRESP       : IN     STD_LOGIC;
      clk                   : IN     std_logic;
      ALU_STALL_DRESP_DELAY : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT stage_decode
   PORT (
      EXEC_ALUout : IN     lc3b_word ;
      IR1out      : IN     lc3b_word ;
      MEM_ALUout  : IN     lc3b_word ;
      MEM_dataout : IN     lc3b_word ;
      PC1out      : IN     lc3b_word ;
      RESET_L     : IN     std_logic ;
      RegWrite5   : IN     std_logic ;
      STALL_L     : IN     std_logic ;
      Valid1out   : IN     std_logic ;
      clearValid2 : IN     std_logic ;
      clk         : IN     std_logic ;
      destreg5    : IN     lc3b_reg ;
      destsel5    : IN     std_logic ;
      regdata5in  : IN     lc3b_word ;
      srcAMUXsel  : IN     lc3b_4mux_sel ;
      srcBMUXsel  : IN     lc3b_4mux_sel ;
      CW1out      : OUT    LC3B_DWORD ;
      CW2out      : OUT    lc3b_dword ;
      IR2out      : OUT    lc3b_word ;
      PC2out      : OUT    lc3b_word ;
      Valid2out   : OUT    std_logic ;
      regA2out    : OUT    lc3b_word ;
      regB2out    : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT stage_execute
   PORT (
      CW2out      : IN     lc3b_dword ;
      IR2out      : IN     lc3b_word ;
      PC2out      : IN     lc3b_word ;
      RESET_L     : IN     std_logic ;
      STALL_L     : IN     std_logic ;
      STALL_L_B   : IN     std_logic ;
      Valid2out   : IN     std_logic ;
      clearValid  : IN     std_logic ;
      clk         : IN     std_logic ;
      memAddress  : IN     lc3b_word ;
      memCWORD    : IN     lc3b_dword ;
      memIndirect : IN     std_logic ;
      regA2out    : IN     lc3b_word ;
      regB2out    : IN     lc3b_word ;
      ALU3out     : OUT    lc3b_word ;
      ALU_STALL_L : OUT    std_logic ;
      CW3out      : OUT    lc3b_dword ;
      IR3out      : OUT    lc3b_word ;
      PC3out      : OUT    lc3b_word ;
      Valid3out   : OUT    std_logic ;
      nextALUout  : OUT    lc3b_word ;
      regA3out    : OUT    lc3b_word ;
      regB3out    : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT stage_fetch
   PORT (
      BRprediction : IN     std_logic ;
      DataIn1      : IN     lc3b_word ;
      PC4out       : IN     lc3b_word ;
      PCmismatch   : IN     std_logic ;
      RESET_L      : IN     std_logic ;
      STALL_L      : IN     std_logic ;
      calcPC       : IN     LC3b_word ;
      clearValid   : IN     std_logic ;
      clk          : IN     std_logic ;
      writeBTB     : IN     std_logic ;
      ADDRESS1     : OUT    lc3b_word ;
      IR1out       : OUT    lc3b_word ;
      MREADI_L     : OUT    std_logic ;
      PC1out       : OUT    lc3b_word ;
      Valid1out    : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT stage_memory
   PORT (
      ALU3out      : IN     lc3b_word ;
      CW3out       : IN     lc3b_dword ;
      D_DATAIN     : IN     lc3b_word ;
      IR3out       : IN     lc3b_word ;
      PC3out       : IN     lc3b_word ;
      RESET_L      : IN     std_logic ;
      STALL_L      : IN     std_logic ;
      clearValid4  : IN     std_logic ;
      clk          : IN     std_logic ;
      regA3out     : IN     lc3b_word ;
      regB3out     : IN     lc3b_word ;
      valid3out    : IN     std_logic ;
      ADDRESS2     : OUT    lc3b_word ;
      ALU4out      : OUT    lc3b_word ;
      BRprediction : OUT    std_logic ;
      CW4out       : OUT    lc3b_dword ;
      DATAOUT      : OUT    lc3b_word ;
      IR4out       : OUT    lc3b_word ;
      MEMdata4out  : OUT    lc3b_word ;
      MREADD_L     : OUT    std_logic ;
      MWRITEH_L    : OUT    std_logic ;
      MWRITEL_L    : OUT    std_logic ;
      PC4out       : OUT    lc3b_word ;
      PCmismatch   : OUT    std_logic ;
      Valid4out    : OUT    std_logic ;
      calcPC       : OUT    lc3b_word ;
      loadData     : OUT    LC3b_word ;
      memAddress   : OUT    lc3b_word ;
      memCWORD     : OUT    lc3b_dword ;
      memIndirect  : OUT    std_logic ;
      memoryOP     : OUT    std_logic ;
      regA4out     : OUT    lc3b_word ;
      regB4out     : OUT    lc3b_word ;
      writeBTB     : OUT    std_logic 
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
   FOR ALL : AND3 USE ENTITY ece411.AND3;
   FOR ALL : DependencyCheck USE ENTITY ece411.DependencyCheck;
   FOR ALL : MUX2 USE ENTITY ece411.MUX2;
   FOR ALL : NOT1 USE ENTITY mp3lib.NOT1;
   FOR ALL : OR3 USE ENTITY ece411.OR3;
   FOR ALL : ORINV2 USE ENTITY ece411.ORINV2;
   FOR ALL : REG1 USE ENTITY mp3lib.REG1;
   FOR ALL : RESET_DELAY USE ENTITY ece411.RESET_DELAY;
   FOR ALL : delay1 USE ENTITY ece411.delay1;
   FOR ALL : delay2 USE ENTITY ece411.delay2;
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
   const0 <= '0';
   clearValid4 <= '1';
   clearValid5 <= '1';                                      


   -- Instance port mappings.
   U_7 : ENTITY ece411.AND2
      PORT MAP (
         A => STALL_L,
         B => RAW_hazard_L,
         C => DECODE_STALL_L
      );
   U_12 : ENTITY ece411.AND2
      PORT MAP (
         A => D_MRESP_H,
         B => ALU_STALL_L,
         C => C
      );
   U_19 : ENTITY ece411.AND2
      PORT MAP (
         A => ALU_STALL_DRESP_DELAY,
         B => ALU_STALL_L,
         C => C2
      );
   U_23 : ENTITY ece411.AND2
      PORT MAP (
         A => DECODE_STALL_L,
         B => PCmismatch_L,
         C => clearDecode
      );
   U_16 : AND3
      PORT MAP (
         A => HAZARD_IRESP,
         B => RAW_hazard_long,
         C => ALU_STALL_L,
         D => HAZARD_STALL_LAST
      );
   U_17 : AND3
      PORT MAP (
         A => ALU_STALL_L,
         B => RAW_hazard_L,
         C => IMRESP_RST,
         D => IRESP_STALL_LAST
      );
   U_18 : AND3
      PORT MAP (
         A => ALU_STALL_IRESP_DELAY,
         B => RAW_hazard_L,
         C => ALU_STALL_L,
         D => ALU_STALL_LAST
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
         WR_V3        => const0,
         indirect_mem => memIndirect,
         valid_memOP  => memoryOP,
         RAW_hazard   => RAW_hazard,
         RAW_hazard_L => RAW_hazard_L,
         srcA_MUXsel  => srcA_MUXsel,
         srcB_MUXsel  => srcB_MUXsel
      );
   U_0 : MUX2
      PORT MAP (
         A   => RAW_STALL_L,
         B   => C3,
         Sel => memoryOP,
         F   => STALL_L_B
      );
   U_5 : ENTITY ece411.OR2
      PORT MAP (
         A => RAW_hazard,
         B => RAW_hazard_clked,
         C => RAW_hazard_long
      );
   U_9 : ENTITY ece411.OR2
      PORT MAP (
         A => RAW_hazard_clked,
         B => RAW_hazard,
         C => C1
      );
   U_11 : ENTITY ece411.OR2
      PORT MAP (
         A => C2,
         B => C,
         C => C3
      );
   U_6 : OR3
      PORT MAP (
         A => ALU_STALL_LAST,
         B => HAZARD_STALL_LAST,
         C => IRESP_STALL_LAST,
         D => RAW_STALL_L
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
   adelay1 : delay1
      PORT MAP (
         ALU_STALL_IRESP       => ALU_STALL_IRESP,
         clk                   => clk,
         ALU_STALL_IRESP_DELAY => OPEN
      );
   adelay2 : delay2
      PORT MAP (
         ALU_STALL_DRESP       => ALU_STALL_DRESP,
         clk                   => clk,
         ALU_STALL_DRESP_DELAY => ALU_STALL_DRESP_DELAY
      );
   stage2 : stage_decode
      PORT MAP (
         EXEC_ALUout => ALU3out_prelatch,
         IR1out      => IR1out,
         MEM_ALUout  => ALU3out,
         MEM_dataout => MEMdata4out_prelatch,
         PC1out      => PC1out,
         RESET_L     => RESET_L,
         RegWrite5   => RegWrite5,
         STALL_L     => STALL_L,
         Valid1out   => Valid1out,
         clearValid2 => clearDecode,
         clk         => clk,
         destreg5    => destreg5,
         destsel5    => destsel5,
         regdata5in  => regdata5in,
         srcAMUXsel  => srcA_MUXsel,
         srcBMUXsel  => srcB_MUXsel,
         CW1out      => CW1out,
         CW2out      => CW2out,
         IR2out      => IR2out,
         PC2out      => PC2out,
         Valid2out   => Valid2out,
         regA2out    => regA2out,
         regB2out    => regB2out
      );
   stage3 : stage_execute
      PORT MAP (
         CW2out      => CW2out,
         IR2out      => IR2out,
         PC2out      => PC2out,
         RESET_L     => RESET_L,
         STALL_L     => STALL_L,
         STALL_L_B   => STALL_L_B,
         Valid2out   => Valid2out,
         clearValid  => PCmismatch_L,
         clk         => clk,
         memAddress  => memAddress,
         memCWORD    => memCWORD,
         memIndirect => memIndirect,
         regA2out    => regA2out,
         regB2out    => regB2out,
         ALU3out     => ALU3out,
         ALU_STALL_L => ALU_STALL_L,
         CW3out      => CW3out,
         IR3out      => IR3out,
         PC3out      => PC3out,
         Valid3out   => Valid3out,
         nextALUout  => ALU3out_prelatch,
         regA3out    => regA3out,
         regB3out    => regB3out
      );
   stage1 : stage_fetch
      PORT MAP (
         BRprediction => BRprediction,
         DataIn1      => I_DATAIN,
         PC4out       => PC4out,
         PCmismatch   => PCmismatch,
         RESET_L      => RESET_L,
         STALL_L      => DECODE_STALL_L,
         calcPC       => calcPC,
         clearValid   => PCmismatch_L,
         clk          => clk,
         writeBTB     => writeBTB,
         ADDRESS1     => ADDRESS1,
         IR1out       => IR1out,
         MREADI_L     => MREADI_L,
         PC1out       => PC1out,
         Valid1out    => Valid1out
      );
   stage4 : stage_memory
      PORT MAP (
         ALU3out      => ALU3out,
         CW3out       => CW3out,
         D_DATAIN     => D_DATAIN,
         IR3out       => IR3out,
         PC3out       => PC3out,
         RESET_L      => RESET_L,
         STALL_L      => STALL_L,
         clearValid4  => clearValid4,
         clk          => clk,
         regA3out     => regA3out,
         regB3out     => regB3out,
         valid3out    => Valid3out,
         ADDRESS2     => ADDRESS2,
         ALU4out      => ALU4out,
         BRprediction => BRprediction,
         CW4out       => CW4out,
         DATAOUT      => DATAOUT,
         IR4out       => IR4out,
         MEMdata4out  => MEMdata4out,
         MREADD_L     => MREADD_L,
         MWRITEH_L    => MWRITEH_L,
         MWRITEL_L    => MWRITEL_L,
         PC4out       => PC4out,
         PCmismatch   => PCmismatch,
         Valid4out    => Valid4out,
         calcPC       => calcPC,
         loadData     => MEMdata4out_prelatch,
         memAddress   => memAddress,
         memCWORD     => memCWORD,
         memIndirect  => memIndirect,
         memoryOP     => memoryOP,
         regA4out     => regA4out,
         regB4out     => regB4out,
         writeBTB     => writeBTB
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
   U_1 : NOT1
      PORT MAP (
         A => PCmismatch,
         F => PCmismatch_L
      );
   U_3 : NOT1
      PORT MAP (
         A => memIndirect,
         F => F
      );
   U_13 : NOT1
      PORT MAP (
         A => ALU_STALL_L,
         F => ALU_STALL
      );
   U_10 : ENTITY mp3lib.OR2
      PORT MAP (
         A => HAZARD_IRESP,
         B => I_MRESP_H,
         F => F1
      );
   U_14 : ENTITY mp3lib.OR2
      PORT MAP (
         A => ALU_STALL_IRESP,
         B => I_MRESP_H,
         F => F4
      );
   U_20 : ENTITY mp3lib.OR2
      PORT MAP (
         A => ALU_STALL_DRESP,
         B => D_MRESP_H,
         F => F2
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
         F       => HAZARD_IRESP
      );
   U_15 : REG1
      PORT MAP (
         RESET_L => ALU_STALL,
         A       => F4,
         EN      => ALU_STALL,
         CLK     => clk,
         F       => ALU_STALL_IRESP
      );
   U_21 : REG1
      PORT MAP (
         RESET_L => ALU_STALL,
         A       => F2,
         EN      => ALU_STALL,
         CLK     => clk,
         F       => ALU_STALL_DRESP
      );
   U_22 : REG1
      PORT MAP (
         RESET_L => RESET_L,
         A       => ALU_STALL_IRESP,
         EN      => const1,
         CLK     => clk,
         F       => ALU_STALL_IRESP_DELAY
      );

END struct;

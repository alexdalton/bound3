-- VHDL Entity ece411.stage_memory.symbol
--
-- Created:
--          by - adalton2.ews (siebl-0220-18.ews.illinois.edu)
--          at - 02:31:23 05/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY stage_memory IS
   PORT( 
      ALU3out      : IN     lc3b_word;
      CW3out       : IN     lc3b_dword;
      D_DATAIN     : IN     lc3b_word;
      IR3out       : IN     lc3b_word;
      PC3out       : IN     lc3b_word;
      RESET_L      : IN     std_logic;
      STALL_L      : IN     std_logic;
      clearValid4  : IN     std_logic;
      clk          : IN     std_logic;
      regA3out     : IN     lc3b_word;
      regB3out     : IN     lc3b_word;
      valid3out    : IN     std_logic;
      ADDRESS2     : OUT    lc3b_word;
      ALU4out      : OUT    lc3b_word;
      BRprediction : OUT    std_logic;
      CW4out       : OUT    lc3b_dword;
      DATAOUT      : OUT    lc3b_word;
      IR4out       : OUT    lc3b_word;
      MEMdata4out  : OUT    lc3b_word;
      MREADD_L     : OUT    std_logic;
      MWRITEH_L    : OUT    std_logic;
      MWRITEL_L    : OUT    std_logic;
      PC4out       : OUT    lc3b_word;
      PCmismatch   : OUT    std_logic;
      Valid4out    : OUT    std_logic;
      calcPC       : OUT    lc3b_word;
      loadData     : OUT    LC3b_word;
      memAddress   : OUT    lc3b_word;
      memCWORD     : OUT    lc3b_dword;
      memIndirect  : OUT    std_logic;
      memoryOP     : OUT    std_logic;
      regA4out     : OUT    lc3b_word;
      regB4out     : OUT    lc3b_word;
      writeBTB     : OUT    std_logic
   );

-- Declarations

END stage_memory ;

--
-- VHDL Architecture ece411.stage_memory.struct
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

ARCHITECTURE struct OF stage_memory IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ADDRESS2_SEL       : lc3b_4mux_sel;
   SIGNAL ADJ11out           : LC3b_word;
   SIGNAL ADJ9out            : LC3b_word;
   SIGNAL BEN                : std_logic;
   SIGNAL BranchAddout       : lc3b_word;
   SIGNAL BranchNotTakenAddr : LC3b_word;
   SIGNAL C                  : std_logic;
   SIGNAL C1                 : std_logic;
   SIGNAL C2                 : std_logic;
   SIGNAL CCdata             : LC3b_word;
   SIGNAL CCdatasel          : std_logic;
   SIGNAL CheckN             : std_logic;
   SIGNAL CheckP             : std_logic;
   SIGNAL CheckZ             : std_logic;
   SIGNAL D                  : std_logic;
   SIGNAL F                  : LC3b_word;
   SIGNAL F1                 : LC3b_word;
   SIGNAL IR11               : std_logic;
   SIGNAL IR8                : std_logic;
   SIGNAL JSRAddout          : lc3b_word;
   SIGNAL LDB_word           : lc3b_word;
   SIGNAL LDIOP              : std_logic;
   SIGNAL LoadNZP            : std_logic;
   SIGNAL M_align            : std_logic;
   SIGNAL NZPin              : LC3b_CC;
   SIGNAL Ncond              : std_logic;
   SIGNAL OFFSET11           : lc3b_OFFSET11;
   SIGNAL OFFSET9            : LC3B_OFFSET9;
   SIGNAL PCequal            : STD_LOGIC;
   SIGNAL Pcond              : std_logic;
   SIGNAL SRCABRMUXout       : LC3b_word;
   SIGNAL STB_data           : LC3b_word;
   SIGNAL STIOP              : std_logic;
   SIGNAL Zcond              : std_logic;
   SIGNAL backwardsbranch    : std_logic;
   SIGNAL branch             : std_logic;
   SIGNAL byteOP             : std_logic;
   SIGNAL byteOut            : lc3b_word;
   SIGNAL condJMP            : std_logic;
   SIGNAL controlInst        : std_logic;
   SIGNAL genCCout           : LC3b_CC;
   SIGNAL ismemoryOP         : std_logic;
   SIGNAL istrap             : std_logic;
   SIGNAL jmp_detected       : std_logic;
   SIGNAL n                  : std_logic;
   SIGNAL p                  : std_logic;
   SIGNAL readOP             : std_logic;
   SIGNAL regB_shft          : lc3b_word;
   SIGNAL trapPC             : lc3b_word;
   SIGNAL uncondJMP          : std_logic;
   SIGNAL uncondbranch       : std_logic;
   SIGNAL uncondjmptrap      : std_logic;
   SIGNAL writeType          : std_logic_vector(1 DOWNTO 0);
   SIGNAL z                  : std_logic;
   SIGNAL zext8out           : lc3b_word;

   -- Implicit buffer signal declarations
   SIGNAL ADDRESS2_internal    : lc3b_word;
   SIGNAL MEMdata4out_internal : lc3b_word;
   SIGNAL PC4out_internal      : lc3b_word;
   SIGNAL calcPC_internal      : lc3b_word;
   SIGNAL loadData_internal    : LC3b_word;


   -- Component Declarations
   COMPONENT ADJ11
   PORT (
      offset11 : IN     LC3b_offset11;
      ADJ11out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT ADJ9
   PORT (
      offset9 : IN     LC3b_offset9;
      ADJ9out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT AND2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT AND3
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : IN     std_logic ;
      D : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT ANDINV2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT BranchAdd
   PORT (
      ADJ9out      : IN     LC3b_word ;
      clk          : IN     std_logic ;
      BranchAddout : OUT    lc3b_word ;
      PC4out       : IN     lc3b_word 
   );
   END COMPONENT;
   COMPONENT CW3sig_ripper
   PORT (
      CW3out       : IN     lc3b_dword ;
      ADDRESS2_SEL : OUT    lc3b_4mux_sel ;
      CCdatasel    : OUT    std_logic ;
      LoadNZP      : OUT    std_logic ;
      ismemoryOP   : OUT    std_logic ;
      readOP       : OUT    std_logic ;
      byteOP       : OUT    std_logic ;
      istrap       : OUT    std_logic ;
      STIOP        : OUT    std_logic ;
      LDIOP        : OUT    std_logic ;
      branch       : OUT    std_logic ;
      uncondJMP    : OUT    std_logic ;
      writeType    : OUT    std_logic_vector (1 DOWNTO 0)
   );
   END COMPONENT;
   COMPONENT IR3sigripper
   PORT (
      IR3out   : IN     lc3b_word ;
      IR11     : OUT    std_logic ;
      IR8      : OUT    std_logic ;
      OFFSET11 : OUT    lc3b_OFFSET11 ;
      OFFSET9  : OUT    LC3B_OFFSET9 
   );
   END COMPONENT;
   COMPONENT IRnzp_ripper
   PORT (
      IR3out : IN     lc3b_word;
      NZPin  : OUT    LC3b_CC
   );
   END COMPONENT;
   COMPONENT JSRAdd
   PORT (
      ADJ11out  : IN     LC3b_word ;
      clk       : IN     std_logic ;
      JSRAddout : OUT    lc3b_word ;
      PC4out    : IN     lc3b_word 
   );
   END COMPONENT;
   COMPONENT LDB_align
   PORT (
      D_DATAIN : IN     lc3b_word ;
      M_align  : IN     std_logic ;
      byteOut  : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT LDISTIROM
   PORT (
      LDIOP    : IN     std_logic ;
      STIOP    : IN     std_logic ;
      memCWORD : OUT    lc3b_dword 
   );
   END COMPONENT;
   COMPONENT LSHFT_8
   PORT (
      regB3out  : IN     lc3b_word ;
      regB_shft : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT MEMalign
   PORT (
      ADDRESS : IN     LC3b_word;
      M_align : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT NAND2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT NZP
   PORT (
      LoadNZP  : IN     std_logic;
      RESET_L  : IN     STD_LOGIC;
      clk      : IN     std_logic;
      genCCout : IN     LC3b_CC;
      n        : OUT    std_logic;
      p        : OUT    std_logic;
      z        : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT NZPsplit
   PORT (
      dest   : IN     LC3b_reg;
      CheckN : OUT    std_logic;
      CheckP : OUT    std_logic;
      CheckZ : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT OR2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
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
   COMPONENT Plus2
   PORT (
      PCout      : IN     LC3b_word;
      clk        : IN     std_logic;
      PCPlus2out : OUT    LC3b_word
   );
   END COMPONENT;
   COMPONENT WRbyte_sel
   PORT (
      M_align   : IN     std_logic ;
      valid3out : IN     std_logic ;
      writeType : IN     std_logic_vector (1 DOWNTO 0);
      MWRITEH_L : OUT    std_logic ;
      MWRITEL_L : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT WordMux2
   PORT (
      A   : IN     LC3b_word ;
      B   : IN     LC3b_word ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT WordMux4
   PORT (
      A   : IN     lc3b_word ;
      B   : IN     lc3b_word ;
      C   : IN     lc3b_word ;
      D   : IN     lc3b_word ;
      Sel : IN     lc3b_4mux_sel ;
      F   : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT ZEXT8
   PORT (
      zext8in  : IN     lc3b_word ;
      zext8out : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT ZEXTtrap
   PORT (
      IR3out   : IN     lc3b_word ;
      zext8out : OUT    lc3b_word 
   );
   END COMPONENT;
   COMPONENT generateCC
   PORT (
      CCdata   : IN     LC3b_word;
      genCCout : OUT    LC3b_CC
   );
   END COMPONENT;
   COMPONENT stage_data
   PORT (
      ClearValid       : IN     std_logic ;
      Control_word     : IN     lc3b_dword ;
      IR               : IN     lc3b_word ;
      PC               : IN     lc3b_word ;
      RESET_L          : IN     std_logic ;
      STALL_L          : IN     std_logic ;
      Valid            : IN     std_logic ;
      clk              : IN     std_logic ;
      Control_word_out : OUT    lc3b_dword ;
      IR_out           : OUT    lc3b_word ;
      PC_out           : OUT    lc3b_word ;
      Valid_out        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT COMP16
   PORT (
      A : IN     LC3B_WORD ;
      B : IN     LC3B_WORD ;
      F : OUT    STD_LOGIC 
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
   FOR ALL : ADJ11 USE ENTITY ece411.ADJ11;
   FOR ALL : ADJ9 USE ENTITY ece411.ADJ9;
   FOR ALL : AND2 USE ENTITY ece411.AND2;
   FOR ALL : AND3 USE ENTITY ece411.AND3;
   FOR ALL : ANDINV2 USE ENTITY ece411.ANDINV2;
   FOR ALL : BranchAdd USE ENTITY ece411.BranchAdd;
   FOR ALL : COMP16 USE ENTITY mp3lib.COMP16;
   FOR ALL : CW3sig_ripper USE ENTITY ece411.CW3sig_ripper;
   FOR ALL : IR3sigripper USE ENTITY ece411.IR3sigripper;
   FOR ALL : IRnzp_ripper USE ENTITY ece411.IRnzp_ripper;
   FOR ALL : JSRAdd USE ENTITY ece411.JSRAdd;
   FOR ALL : LDB_align USE ENTITY ece411.LDB_align;
   FOR ALL : LDISTIROM USE ENTITY ece411.LDISTIROM;
   FOR ALL : LSHFT_8 USE ENTITY ece411.LSHFT_8;
   FOR ALL : MEMalign USE ENTITY ece411.MEMalign;
   FOR ALL : NAND2 USE ENTITY ece411.NAND2;
   FOR ALL : NZP USE ENTITY ece411.NZP;
   FOR ALL : NZPsplit USE ENTITY ece411.NZPsplit;
   FOR ALL : OR2 USE ENTITY ece411.OR2;
   FOR ALL : OR3 USE ENTITY ece411.OR3;
   FOR ALL : Plus2 USE ENTITY ece411.Plus2;
   FOR ALL : REG16 USE ENTITY mp3lib.REG16;
   FOR ALL : WRbyte_sel USE ENTITY ece411.WRbyte_sel;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WordMux4 USE ENTITY ece411.WordMux4;
   FOR ALL : ZEXT8 USE ENTITY ece411.ZEXT8;
   FOR ALL : ZEXTtrap USE ENTITY ece411.ZEXTtrap;
   FOR ALL : generateCC USE ENTITY ece411.generateCC;
   FOR ALL : stage_data USE ENTITY ece411.stage_data;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   -- eb1 1    
   trapPC <= D_DATAIN;
   memAddress <= D_DATAIN;


   -- Instance port mappings.
   U_7 : ADJ11
      PORT MAP (
         offset11 => OFFSET11,
         ADJ11out => ADJ11out
      );
   aADJ9 : ADJ9
      PORT MAP (
         offset9 => OFFSET9,
         ADJ9out => ADJ9out
      );
   U_5 : AND2
      PORT MAP (
         A => CheckN,
         B => n,
         C => Ncond
      );
   U_8 : AND2
      PORT MAP (
         A => C1,
         B => valid3out,
         C => memIndirect
      );
   U_13 : AND2
      PORT MAP (
         A => ismemoryOP,
         B => valid3out,
         C => memoryOP
      );
   U_15 : AND2
      PORT MAP (
         A => LoadNZP,
         B => valid3out,
         C => C2
      );
   U_18 : AND2
      PORT MAP (
         A => CheckP,
         B => p,
         C => Pcond
      );
   U_19 : AND2
      PORT MAP (
         A => CheckZ,
         B => z,
         C => Zcond
      );
   U_21 : AND2
      PORT MAP (
         A => BEN,
         B => branch,
         C => condJMP
      );
   U_25 : AND2
      PORT MAP (
         A => controlInst,
         B => valid3out,
         C => writeBTB
      );
   U_29 : AND2
      PORT MAP (
         A => C,
         B => controlInst,
         C => PCmismatch
      );
   U_33 : AND2
      PORT MAP (
         A => D,
         B => branch,
         C => uncondbranch
      );
   U_34 : AND2
      PORT MAP (
         A => IR8,
         B => branch,
         C => backwardsbranch
      );
   U_32 : AND3
      PORT MAP (
         A => CheckN,
         B => CheckP,
         C => CheckZ,
         D => D
      );
   U_24 : ANDINV2
      PORT MAP (
         A => valid3out,
         B => PCequal,
         C => C
      );
   aBranchAdd : BranchAdd
      PORT MAP (
         ADJ9out      => ADJ9out,
         clk          => clk,
         BranchAddout => BranchAddout,
         PC4out       => PC4out_internal
      );
   aCW3sig_ripper : CW3sig_ripper
      PORT MAP (
         CW3out       => CW3out,
         ADDRESS2_SEL => ADDRESS2_SEL,
         CCdatasel    => CCdatasel,
         LoadNZP      => LoadNZP,
         ismemoryOP   => ismemoryOP,
         readOP       => readOP,
         byteOP       => byteOP,
         istrap       => istrap,
         STIOP        => STIOP,
         LDIOP        => LDIOP,
         branch       => branch,
         uncondJMP    => uncondJMP,
         writeType    => writeType
      );
   aIR3sigripper : IR3sigripper
      PORT MAP (
         IR3out   => IR3out,
         IR11     => IR11,
         IR8      => IR8,
         OFFSET11 => OFFSET11,
         OFFSET9  => OFFSET9
      );
   aIRnzpripper : IRnzp_ripper
      PORT MAP (
         IR3out => IR3out,
         NZPin  => NZPin
      );
   aJSRAdd : JSRAdd
      PORT MAP (
         ADJ11out  => ADJ11out,
         clk       => clk,
         JSRAddout => JSRAddout,
         PC4out    => PC4out_internal
      );
   aLDB_align : LDB_align
      PORT MAP (
         D_DATAIN => D_DATAIN,
         M_align  => M_align,
         byteOut  => byteOut
      );
   aLDISTIROM : LDISTIROM
      PORT MAP (
         LDIOP    => LDIOP,
         STIOP    => STIOP,
         memCWORD => memCWORD
      );
   aLSHFT_8 : LSHFT_8
      PORT MAP (
         regB3out  => regB3out,
         regB_shft => regB_shft
      );
   aMemalign : MEMalign
      PORT MAP (
         ADDRESS => ADDRESS2_internal,
         M_align => M_align
      );
   U_1 : NAND2
      PORT MAP (
         A => valid3out,
         B => readOP,
         C => MREADD_L
      );
   aNZP : NZP
      PORT MAP (
         LoadNZP  => C2,
         clk      => clk,
         genCCout => genCCout,
         RESET_L  => RESET_L,
         n        => n,
         p        => p,
         z        => z
      );
   aNZPsplit : NZPsplit
      PORT MAP (
         dest   => NZPin,
         CheckN => CheckN,
         CheckP => CheckP,
         CheckZ => CheckZ
      );
   U_6 : OR2
      PORT MAP (
         A => STIOP,
         B => LDIOP,
         C => C1
      );
   U_22 : OR2
      PORT MAP (
         A => condJMP,
         B => uncondJMP,
         C => jmp_detected
      );
   U_30 : OR2
      PORT MAP (
         A => uncondJMP,
         B => istrap,
         C => uncondjmptrap
      );
   U_20 : OR3
      PORT MAP (
         A => Ncond,
         B => Pcond,
         C => Zcond,
         D => BEN
      );
   U_28 : OR3
      PORT MAP (
         A => istrap,
         B => branch,
         C => uncondJMP,
         D => controlInst
      );
   U_31 : OR3
      PORT MAP (
         A => uncondjmptrap,
         B => uncondbranch,
         C => backwardsbranch,
         D => BRprediction
      );
   U_26 : Plus2
      PORT MAP (
         PCout      => PC4out_internal,
         clk        => clk,
         PCPlus2out => BranchNotTakenAddr
      );
   write_logic : WRbyte_sel
      PORT MAP (
         M_align   => M_align,
         valid3out => valid3out,
         writeType => writeType,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L
      );
   CCdataMux : WordMux2
      PORT MAP (
         A   => ALU3out,
         B   => loadData_internal,
         Sel => CCdatasel,
         F   => CCdata
      );
   U_2 : WordMux2
      PORT MAP (
         A   => D_DATAIN,
         B   => LDB_word,
         Sel => byteOP,
         F   => loadData_internal
      );
   U_3 : WordMux2
      PORT MAP (
         A   => regB3out,
         B   => regB_shft,
         Sel => M_align,
         F   => STB_data
      );
   U_4 : WordMux2
      PORT MAP (
         A   => regB3out,
         B   => STB_data,
         Sel => byteOP,
         F   => DATAOUT
      );
   U_16 : WordMux2
      PORT MAP (
         A   => regA3out,
         B   => JSRAddout,
         Sel => IR11,
         F   => SRCABRMUXout
      );
   U_17 : WordMux2
      PORT MAP (
         A   => SRCABRMUXout,
         B   => BranchAddout,
         Sel => branch,
         F   => F
      );
   U_23 : WordMux2
      PORT MAP (
         A   => F1,
         B   => trapPC,
         Sel => istrap,
         F   => calcPC_internal
      );
   U_27 : WordMux2
      PORT MAP (
         A   => BranchNotTakenAddr,
         B   => F,
         Sel => jmp_detected,
         F   => F1
      );
   ADDRESS2MUX : WordMux4
      PORT MAP (
         A   => ALU3out,
         B   => MEMdata4out_internal,
         C   => zext8out,
         D   => zext8out,
         Sel => ADDRESS2_SEL,
         F   => ADDRESS2_internal
      );
   U_0 : ZEXT8
      PORT MAP (
         zext8in  => byteOut,
         zext8out => LDB_word
      );
   aZEXTtrap : ZEXTtrap
      PORT MAP (
         IR3out   => IR3out,
         zext8out => zext8out
      );
   agenerateCC : generateCC
      PORT MAP (
         CCdata   => CCdata,
         genCCout => genCCout
      );
   stage4data : stage_data
      PORT MAP (
         ClearValid       => clearValid4,
         Control_word     => CW3out,
         IR               => IR3out,
         PC               => PC3out,
         RESET_L          => RESET_L,
         STALL_L          => STALL_L,
         Valid            => valid3out,
         clk              => clk,
         Control_word_out => CW4out,
         IR_out           => IR4out,
         PC_out           => PC4out_internal,
         Valid_out        => Valid4out
      );
   U_14 : COMP16
      PORT MAP (
         A => calcPC_internal,
         B => PC3out,
         F => PCequal
      );
   U_9 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => regA3out,
         EN      => STALL_L,
         CLK     => clk,
         F       => regA4out
      );
   U_10 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => regB3out,
         EN      => STALL_L,
         CLK     => clk,
         F       => regB4out
      );
   U_11 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => ALU3out,
         EN      => STALL_L,
         CLK     => clk,
         F       => ALU4out
      );
   U_12 : REG16
      PORT MAP (
         RESET_L => RESET_L,
         A       => loadData_internal,
         EN      => STALL_L,
         CLK     => clk,
         F       => MEMdata4out_internal
      );

   -- Implicit buffered output assignments
   ADDRESS2    <= ADDRESS2_internal;
   MEMdata4out <= MEMdata4out_internal;
   PC4out      <= PC4out_internal;
   calcPC      <= calcPC_internal;
   loadData    <= loadData_internal;

END struct;

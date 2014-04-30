-- VHDL Entity ece411.Memory.symbol
--
-- Created:
--          by - lis2.ews (siebl-0222-22.ews.illinois.edu)
--          at - 20:10:13 04/29/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Memory IS
   PORT( 
      CLK         : IN     std_logic;
      D_ADDRESS   : IN     lc3b_word;
      D_DATAOUT   : IN     lc3b_word;
      D_MREAD_L   : IN     std_logic;
      D_MWRITEH_L : IN     std_logic;
      D_MWRITEL_L : IN     std_logic;
      I_ADDRESS   : IN     lc3b_word;
      I_MREAD_L   : IN     std_logic;
      RESET_L     : IN     std_logic;
      D_DATAIN    : OUT    lc3b_word;
      D_MRESP_H   : OUT    std_logic;
      I_DATAIN    : OUT    lc3b_word;
      I_MRESP_H   : OUT    std_logic  := '0'
   );

-- Declarations

END Memory ;

--
-- VHDL Architecture ece411.Memory.struct
--
-- Created:
--          by - lis2.ews (siebl-0222-22.ews.illinois.edu)
--          at - 20:10:13 04/29/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF Memory IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL C           : std_logic;
   SIGNAL DC_ADDRESS  : LC3B_WORD;
   SIGNAL DC_BLOCK_L  : std_logic;
   SIGNAL DC_MREAD_L  : std_logic;
   SIGNAL DC_MRESP_H  : std_logic;
   SIGNAL DC_MWRITE_L : std_logic;
   SIGNAL E           : std_logic;
   SIGNAL IC_ADDRESS  : LC3B_WORD;
   SIGNAL IC_MREAD_L  : std_logic;
   SIGNAL IC_RESP_H   : std_logic;
   SIGNAL MWRITEH_L   : std_logic;
   SIGNAL MWRITEL_L   : std_logic;
   SIGNAL PMADDRESS   : LC3B_WORD;
   SIGNAL PMADDRESSb  : LC3B_WORD;
   SIGNAL PMDATAIN    : LC3B_OWORD;
   SIGNAL PMDATAINb   : LC3b_oword;
   SIGNAL PMDATAOUT   : LC3B_OWORD;
   SIGNAL PMDATAOUTb  : LC3B_OWORD;
   SIGNAL PMREAD_L    : std_logic;
   SIGNAL PMREAD_Lb   : STD_LOGIC;
   SIGNAL PMRESP_H    : STD_LOGIC;
   SIGNAL PMRESP_H1   : std_logic;
   SIGNAL PMRESP_Hb   : STD_LOGIC;
   SIGNAL PMWRITE_L   : std_logic;
   SIGNAL PMWRITE_Lb  : STD_LOGIC;

   -- Implicit buffer signal declarations
   SIGNAL I_MRESP_H_internal : std_logic;


   -- Component Declarations
   COMPONENT AND2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT AND4
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : IN     std_logic ;
      D : IN     std_logic ;
      E : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Cache_Arbiter
   PORT (
      CLK         : IN     std_logic ;
      DC_ADDRESS  : IN     LC3B_WORD ;
      DC_MREAD_L  : IN     std_logic ;
      DC_MWRITE_L : IN     std_logic ;
      IC_ADDRESS  : IN     LC3B_WORD ;
      IC_MREAD_L  : IN     std_logic ;
      PMRESP_H    : IN     STD_LOGIC ;
      rst         : IN     std_logic ;
      DC_BLOCK_L  : OUT    std_logic ;
      DC_RESP_H   : OUT    std_logic ;
      IC_RESP_H   : OUT    std_logic ;
      PMADDRESS   : OUT    LC3B_WORD ;
      PMREAD_L    : OUT    std_logic ;
      PMWRITE_L   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT L2cache
   PORT (
      ADDRESS   : IN     LC3b_word ;
      CLK       : IN     STD_LOGIC ;
      DATAOUT   : IN     LC3b_oword ;
      MREAD_L   : IN     std_logic ;
      MWRITE_L  : IN     std_logic ;
      PMDATAIN  : IN     LC3B_OWORD ;
      PMRESP_H  : IN     std_logic ;
      RESET_L   : IN     STD_LOGIC ;
      DATAIN    : OUT    LC3b_oword ;
      MRESP_H   : OUT    std_logic ;
      PMADDRESS : OUT    LC3B_WORD ;
      PMDATAOUT : OUT    LC3B_OWORD ;
      PMREAD_L  : OUT    std_logic ;
      PMWRITE_L : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT OR2
   PORT (
      A : IN     std_logic ;
      B : IN     std_logic ;
      C : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT PHYSICAL_MEMORY
   PORT (
      CLK       : IN     STD_LOGIC;
      PMADDRESS : IN     LC3B_WORD;
      PMDATAOUT : IN     LC3B_OWORD;
      PMREAD_L  : IN     STD_LOGIC;
      PMWRITE_L : IN     STD_LOGIC;
      RESET_L   : IN     STD_LOGIC;
      PMDATAIN  : OUT    LC3B_OWORD;
      PMRESP_H  : OUT    STD_LOGIC
   );
   END COMPONENT;
   COMPONENT cache
   PORT (
      ADDRESS   : IN     LC3b_word ;
      CLK       : IN     STD_LOGIC ;
      DATAOUT   : IN     LC3b_word ;
      MREAD_L   : IN     std_logic ;
      MWRITEH_L : IN     std_logic ;
      MWRITEL_L : IN     std_logic ;
      PMDATAIN  : IN     LC3B_OWORD ;
      PMRESP_H  : IN     std_logic ;
      RESET_L   : IN     STD_LOGIC ;
      DATAIN    : OUT    LC3b_word ;
      MRESP_H   : OUT    std_logic  := '0';
      PMADDRESS : OUT    LC3B_WORD ;
      PMDATAOUT : OUT    LC3B_OWORD ;
      PMREAD_L  : OUT    std_logic ;
      PMWRITE_L : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : AND2 USE ENTITY ece411.AND2;
   FOR ALL : AND4 USE ENTITY ece411.AND4;
   FOR ALL : Cache_Arbiter USE ENTITY ece411.Cache_Arbiter;
   FOR ALL : L2cache USE ENTITY ece411.L2cache;
   FOR ALL : OR2 USE ENTITY ece411.OR2;
   FOR ALL : PHYSICAL_MEMORY USE ENTITY ece411.PHYSICAL_MEMORY;
   FOR ALL : cache USE ENTITY ece411.cache;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   -- eb1 1
   MWRITEH_L <= '1';
   MWRITEL_L <= '1';


   -- Instance port mappings.
   U_0 : AND2
      PORT MAP (
         A => DC_MRESP_H,
         B => I_MRESP_H_internal,
         C => C
      );
   U_2 : AND4
      PORT MAP (
         A => IC_MREAD_L,
         B => DC_BLOCK_L,
         C => I_MREAD_L,
         D => DC_MRESP_H,
         E => E
      );
   arbiter : Cache_Arbiter
      PORT MAP (
         CLK         => CLK,
         DC_ADDRESS  => DC_ADDRESS,
         DC_MREAD_L  => DC_MREAD_L,
         DC_MWRITE_L => DC_MWRITE_L,
         IC_ADDRESS  => IC_ADDRESS,
         IC_MREAD_L  => IC_MREAD_L,
         PMRESP_H    => PMRESP_H,
         rst         => RESET_L,
         DC_BLOCK_L  => DC_BLOCK_L,
         DC_RESP_H   => PMRESP_H1,
         IC_RESP_H   => IC_RESP_H,
         PMADDRESS   => PMADDRESS,
         PMREAD_L    => PMREAD_L,
         PMWRITE_L   => PMWRITE_L
      );
   aL2Cache : L2cache
      PORT MAP (
         ADDRESS   => PMADDRESS,
         CLK       => CLK,
         DATAOUT   => PMDATAOUT,
         MREAD_L   => PMREAD_L,
         MWRITE_L  => PMWRITE_L,
         PMDATAIN  => PMDATAINb,
         PMRESP_H  => PMRESP_Hb,
         RESET_L   => RESET_L,
         DATAIN    => PMDATAIN,
         MRESP_H   => PMRESP_H,
         PMADDRESS => PMADDRESSb,
         PMDATAOUT => PMDATAOUTb,
         PMREAD_L  => PMREAD_Lb,
         PMWRITE_L => PMWRITE_Lb
      );
   U_1 : OR2
      PORT MAP (
         A => E,
         B => C,
         C => D_MRESP_H
      );
   PMEM : PHYSICAL_MEMORY
      PORT MAP (
         CLK       => CLK,
         PMADDRESS => PMADDRESSb,
         PMDATAOUT => PMDATAOUTb,
         PMREAD_L  => PMREAD_Lb,
         PMWRITE_L => PMWRITE_Lb,
         RESET_L   => RESET_L,
         PMDATAIN  => PMDATAINb,
         PMRESP_H  => PMRESP_Hb
      );
   dL1Cache : cache
      PORT MAP (
         ADDRESS   => D_ADDRESS,
         CLK       => CLK,
         DATAOUT   => D_DATAOUT,
         MREAD_L   => D_MREAD_L,
         MWRITEH_L => D_MWRITEH_L,
         MWRITEL_L => D_MWRITEL_L,
         PMDATAIN  => PMDATAIN,
         PMRESP_H  => PMRESP_H1,
         RESET_L   => RESET_L,
         DATAIN    => D_DATAIN,
         MRESP_H   => DC_MRESP_H,
         PMADDRESS => DC_ADDRESS,
         PMDATAOUT => PMDATAOUT,
         PMREAD_L  => DC_MREAD_L,
         PMWRITE_L => DC_MWRITE_L
      );
   iL1Cache : cache
      PORT MAP (
         ADDRESS   => I_ADDRESS,
         CLK       => CLK,
         DATAOUT   => D_DATAOUT,
         MREAD_L   => I_MREAD_L,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L,
         PMDATAIN  => PMDATAIN,
         PMRESP_H  => IC_RESP_H,
         RESET_L   => RESET_L,
         DATAIN    => I_DATAIN,
         MRESP_H   => I_MRESP_H_internal,
         PMADDRESS => IC_ADDRESS,
         PMDATAOUT => OPEN,
         PMREAD_L  => IC_MREAD_L,
         PMWRITE_L => OPEN
      );

   -- Implicit buffered output assignments
   I_MRESP_H <= I_MRESP_H_internal;

END struct;

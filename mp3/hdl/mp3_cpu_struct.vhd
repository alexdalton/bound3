-- VHDL Entity ece411.mp3_CPU.symbol
--
-- Created:
--          by - adalton2.ews (gelib-057-16.ews.illinois.edu)
--          at - 21:50:07 03/20/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY mp3_CPU IS
   PORT( 
      RESET_L : IN     std_logic;
      START_H : IN     std_logic
   );

-- Declarations

END mp3_CPU ;

--
-- VHDL Architecture ece411.mp3_CPU.struct
--
-- Created:
--          by - adalton2.ews (gelib-057-16.ews.illinois.edu)
--          at - 21:50:07 03/20/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF mp3_CPU IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ADDRESS1  : lc3b_word;
   SIGNAL ADDRESS2  : lc3b_word;
   SIGNAL DATAOUT   : lc3b_word;
   SIGNAL D_DATAIN  : LC3B_WORD;
   SIGNAL D_MRESP_H : STD_LOGIC;
   SIGNAL I_DATAIN  : LC3B_WORD;
   SIGNAL I_MRESP_H : std_logic;
   SIGNAL MREADD_L  : std_logic;
   SIGNAL MREADI_L  : std_logic;
   SIGNAL MWRITEH_L : std_logic;
   SIGNAL MWRITEL_L : std_logic;
   SIGNAL clk       : std_logic;


   -- Component Declarations
   COMPONENT CLKgen
   PORT (
      clk : INOUT  std_logic  := '0'
   );
   END COMPONENT;
   COMPONENT DRAM16_DP
   PORT (
      CLK         : IN     STD_LOGIC;
      D_ADDRESS   : IN     LC3B_WORD;
      D_DATAOUT   : IN     LC3B_WORD;
      D_MREAD_L   : IN     STD_LOGIC;
      D_MWRITEH_L : IN     STD_LOGIC;
      D_MWRITEL_L : IN     STD_LOGIC;
      I_ADDRESS   : IN     LC3B_WORD;
      I_MREAD_L   : IN     STD_LOGIC;
      RESET_L     : IN     STD_LOGIC;
      D_DATAIN    : OUT    LC3B_WORD;
      D_MRESP_H   : OUT    STD_LOGIC;
      I_DATAIN    : OUT    LC3B_WORD;
      I_MRESP_H   : OUT    STD_LOGIC
   );
   END COMPONENT;
   COMPONENT pipelineDP
   PORT (
      D_DATAIN  : IN     lc3b_word ;
      D_MRESP_H : IN     std_logic ;
      I_DATAIN  : IN     lc3b_word ;
      I_MRESP_H : IN     std_logic ;
      RESET_L   : IN     std_logic ;
      START_H   : IN     std_logic ;
      clk       : IN     std_logic ;
      ADDRESS1  : OUT    lc3b_word ;
      ADDRESS2  : OUT    lc3b_word ;
      DATAOUT   : OUT    lc3b_word ;
      MREADD_L  : OUT    std_logic ;
      MREADI_L  : OUT    std_logic ;
      MWRITEH_L : OUT    std_logic ;
      MWRITEL_L : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : CLKgen USE ENTITY ece411.CLKgen;
   FOR ALL : DRAM16_DP USE ENTITY ece411.DRAM16_DP;
   FOR ALL : pipelineDP USE ENTITY ece411.pipelineDP;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   I0 : CLKgen
      PORT MAP (
         clk => clk
      );
   MEMORY : DRAM16_DP
      PORT MAP (
         RESET_L     => RESET_L,
         CLK         => clk,
         I_MREAD_L   => MREADI_L,
         I_ADDRESS   => ADDRESS1,
         I_MRESP_H   => I_MRESP_H,
         I_DATAIN    => I_DATAIN,
         D_MREAD_L   => MREADD_L,
         D_MWRITEH_L => MWRITEH_L,
         D_MWRITEL_L => MWRITEL_L,
         D_ADDRESS   => ADDRESS2,
         D_DATAOUT   => DATAOUT,
         D_DATAIN    => D_DATAIN,
         D_MRESP_H   => D_MRESP_H
      );
   DATAPATH : pipelineDP
      PORT MAP (
         D_DATAIN  => D_DATAIN,
         D_MRESP_H => D_MRESP_H,
         I_DATAIN  => I_DATAIN,
         I_MRESP_H => I_MRESP_H,
         RESET_L   => RESET_L,
         START_H   => START_H,
         clk       => clk,
         ADDRESS1  => ADDRESS1,
         ADDRESS2  => ADDRESS2,
         DATAOUT   => DATAOUT,
         MREADD_L  => MREADD_L,
         MREADI_L  => MREADI_L,
         MWRITEH_L => MWRITEH_L,
         MWRITEL_L => MWRITEL_L
      );

END struct;

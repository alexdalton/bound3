-- VHDL Entity ece411.mp3_CPU.symbol
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


ARCHITECTURE struct OF mp3_CPU IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ADDRESS1  : lc3b_word;
   SIGNAL ADDRESS2  : lc3b_word;
   SIGNAL DATAOUT   : lc3b_word;
   SIGNAL D_DATAIN  : LC3B_WORD;
   SIGNAL D_MRESP_H : STD_LOGIC := '0';
   SIGNAL I_DATAIN  : LC3B_WORD;
   SIGNAL I_MRESP_H : std_logic := '0';
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
   COMPONENT Memory
   PORT (
      CLK         : IN     std_logic ;
      D_ADDRESS   : IN     lc3b_word ;
      D_DATAOUT   : IN     lc3b_word ;
      D_MREAD_L   : IN     std_logic ;
      D_MWRITEH_L : IN     std_logic ;
      D_MWRITEL_L : IN     std_logic ;
      I_ADDRESS   : IN     lc3b_word ;
      I_MREAD_L   : IN     std_logic ;
      RESET_L     : IN     std_logic ;
      D_DATAIN    : OUT    lc3b_word ;
      D_MRESP_H   : OUT    std_logic ;
      I_DATAIN    : OUT    lc3b_word ;
      I_MRESP_H   : OUT    std_logic  := '0'
   );
   END COMPONENT;
   COMPONENT pipelineDP
   PORT (
      D_DATAIN  : IN     lc3b_word ;
      D_MRESP_H : IN     std_logic ;
      I_DATAIN  : IN     lc3b_word ;
      I_MRESP_H : IN     std_logic  := '0';
      RESET_L   : IN     std_logic ;
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
   FOR ALL : Memory USE ENTITY ece411.Memory;
   FOR ALL : pipelineDP USE ENTITY ece411.pipelineDP;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   I0 : CLKgen
      PORT MAP (
         clk => clk
      );
   aMemory : Memory
      PORT MAP (
         CLK         => clk,
         D_ADDRESS   => ADDRESS2,
         D_DATAOUT   => DATAOUT,
         D_MREAD_L   => MREADD_L,
         D_MWRITEH_L => MWRITEH_L,
         D_MWRITEL_L => MWRITEL_L,
         I_ADDRESS   => ADDRESS1,
         I_MREAD_L   => MREADI_L,
         RESET_L     => RESET_L,
         D_DATAIN    => D_DATAIN,
         D_MRESP_H   => D_MRESP_H,
         I_DATAIN    => I_DATAIN,
         I_MRESP_H   => I_MRESP_H
      );
   DATAPATH : pipelineDP
      PORT MAP (
         D_DATAIN  => D_DATAIN,
         D_MRESP_H => D_MRESP_H,
         I_DATAIN  => I_DATAIN,
         I_MRESP_H => I_MRESP_H,
         RESET_L   => RESET_L,
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

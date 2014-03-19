--
-- VHDL Architecture ece411.Memory.untitled
--
-- Created:
--          by - buris2.ews (evrt-252-11.ews.illinois.edu)
--          at - 16:25:51 01/25/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Memory IS
   PORT( 
      ADDRESS   : IN     LC3b_word;
      DATAOUT   : IN     LC3b_word;
      MREAD_L   : IN     std_logic;
      MWRITEH_L : IN     std_logic;
      MWRITEL_L : IN     std_logic;
      RESET_L   : IN     std_logic;
      clk       : IN     std_logic;
      DATAIN    : OUT    LC3b_word;
      MRESP_H   : OUT    std_logic
   );

-- Declarations

END Memory ;

--
-- VHDL Architecture ece411.Memory.struct
--
-- Created:
--          by - buris2.ews (evrt-252-10.ews.illinois.edu)
--          at - 15:10:18 02/28/14
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
   SIGNAL ACTIVE      : std_logic;
   SIGNAL CACHE_HIT   : std_logic;
   SIGNAL CACHE_WRITE : std_logic;
   SIGNAL DIRTY       : std_logic;
   SIGNAL MRESP_EN    : std_logic;
   SIGNAL PMADDRESS   : LC3B_WORD;
   SIGNAL PMADDRsel   : std_logic;
   SIGNAL PMDATAIN    : LC3B_OWORD;
   SIGNAL PMDATAOUT   : LC3B_OWORD;
   SIGNAL PMREAD_L    : STD_LOGIC;
   SIGNAL PMRESP_H    : STD_LOGIC;
   SIGNAL PMWRITE_L   : STD_LOGIC;
   SIGNAL WRITING     : std_logic;
   SIGNAL WRstate     : std_logic;
   SIGNAL set_dirty   : std_logic;


   -- Component Declarations
   COMPONENT Cache_Controller
   PORT (
      ACTIVE      : IN     std_logic ;
      CACHE_HIT   : IN     std_logic ;
      DIRTY       : IN     std_logic ;
      PMRESP_H    : IN     STD_LOGIC ;
      RESET_L     : IN     std_logic ;
      WRITING     : IN     std_logic ;
      clk         : IN     std_logic ;
      CACHE_WRITE : OUT    std_logic ;
      MRESP_EN    : OUT    std_logic ;
      PMADDRsel   : OUT    std_logic ;
      PMREAD_L    : OUT    STD_LOGIC ;
      PMWRITE_L   : OUT    STD_LOGIC ;
      WRstate     : OUT    std_logic ;
      set_dirty   : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Cache_Datapath
   PORT (
      ADDRESS     : IN     LC3b_word ;
      CACHE_WRITE : IN     std_logic ;
      DATAOUT     : IN     LC3b_word ;
      MREAD_L     : IN     std_logic ;
      MRESP_EN    : IN     std_logic ;
      MWRITEH_L   : IN     std_logic ;
      MWRITEL_L   : IN     std_logic ;
      PMADDRsel   : IN     std_logic ;
      PMDATAIN    : IN     LC3B_OWORD ;
      RESET_L     : IN     std_logic ;
      WRstate     : IN     std_logic ;
      clk         : IN     std_logic ;
      set_dirty   : IN     std_logic ;
      ACTIVE      : OUT    std_logic ;
      CACHE_HIT   : OUT    std_logic ;
      DATAIN      : OUT    LC3b_word ;
      DIRTY       : OUT    std_logic ;
      MRESP_H     : OUT    std_logic ;
      PMADDRESS   : OUT    LC3B_WORD ;
      PMDATAOUT   : OUT    LC3B_OWORD ;
      WRITING     : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Physical_Memory
   PORT (
      clk       : IN     std_logic ;
      PMADDRESS : IN     LC3B_WORD ;
      PMDATAOUT : IN     LC3B_OWORD ;
      PMREAD_L  : IN     STD_LOGIC ;
      PMWRITE_L : IN     STD_LOGIC ;
      RESET_L   : IN     std_logic ;
      PMDATAIN  : OUT    LC3B_OWORD ;
      PMRESP_H  : OUT    STD_LOGIC 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Cache_Controller USE ENTITY ece411.Cache_Controller;
   FOR ALL : Cache_Datapath USE ENTITY ece411.Cache_Datapath;
   FOR ALL : Physical_Memory USE ENTITY ece411.Physical_Memory;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   Cache_Cont : Cache_Controller
      PORT MAP (
         ACTIVE      => ACTIVE,
         CACHE_HIT   => CACHE_HIT,
         DIRTY       => DIRTY,
         PMRESP_H    => PMRESP_H,
         RESET_L     => RESET_L,
         WRITING     => WRITING,
         clk         => clk,
         CACHE_WRITE => CACHE_WRITE,
         MRESP_EN    => MRESP_EN,
         PMADDRsel   => PMADDRsel,
         PMREAD_L    => PMREAD_L,
         PMWRITE_L   => PMWRITE_L,
         WRstate     => WRstate,
         set_dirty   => set_dirty
      );
   Cache_DP : Cache_Datapath
      PORT MAP (
         ADDRESS     => ADDRESS,
         CACHE_WRITE => CACHE_WRITE,
         DATAOUT     => DATAOUT,
         MREAD_L     => MREAD_L,
         MRESP_EN    => MRESP_EN,
         MWRITEH_L   => MWRITEH_L,
         MWRITEL_L   => MWRITEL_L,
         PMADDRsel   => PMADDRsel,
         PMDATAIN    => PMDATAIN,
         RESET_L     => RESET_L,
         WRstate     => WRstate,
         clk         => clk,
         set_dirty   => set_dirty,
         ACTIVE      => ACTIVE,
         CACHE_HIT   => CACHE_HIT,
         DATAIN      => DATAIN,
         DIRTY       => DIRTY,
         MRESP_H     => MRESP_H,
         PMADDRESS   => PMADDRESS,
         PMDATAOUT   => PMDATAOUT,
         WRITING     => WRITING
      );
   PDRAM : Physical_Memory
      PORT MAP (
         clk       => clk,
         PMADDRESS => PMADDRESS,
         PMDATAOUT => PMDATAOUT,
         PMREAD_L  => PMREAD_L,
         PMWRITE_L => PMWRITE_L,
         RESET_L   => RESET_L,
         PMDATAIN  => PMDATAIN,
         PMRESP_H  => PMRESP_H
      );

END struct;
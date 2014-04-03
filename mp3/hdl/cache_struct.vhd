-- VHDL Entity ece411.cache.symbol
--
-- Created:
--          by - adalton2.ews (siebl-0220-12.ews.illinois.edu)
--          at - 23:52:58 04/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY cache IS
   PORT( 
      ADDRESS   : IN     lc3b_word;
      CLK       : IN     std_logic;
      DATAOUT   : IN     lc3b_word;
      MREAD_L   : IN     std_logic;
      MWRITEH_L : IN     std_logic;
      MWRITEL_L : IN     std_logic;
      PMDATAIN  : IN     LC3B_OWORD;
      PMRESP_H  : IN     std_logic;
      RESET_L   : IN     std_logic;
      DATAIN    : OUT    lc3b_word;
      MRESP_H   : OUT    std_logic  := '0';
      PMADDRESS : OUT    LC3B_WORD;
      PMDATAOUT : OUT    LC3B_OWORD;
      PMREAD_L  : OUT    std_logic;
      PMWRITE_L : OUT    std_logic
   );

-- Declarations

END cache ;

--
-- VHDL Architecture ece411.cache.struct
--
-- Created:
--          by - adalton2.ews (siebl-0220-12.ews.illinois.edu)
--          at - 23:52:58 04/02/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF cache IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL AddrSel        : std_logic;
   SIGNAL CacheDataInSel : std_logic;
   SIGNAL DirtySel       : std_logic;
   SIGNAL DirtyWrite     : std_logic;
   SIGNAL LD_Cache       : std_logic;
   SIGNAL MRESPSel       : std_logic;
   SIGNAL WayMuxDirty    : std_logic;
   SIGNAL cont_RESP_H    : std_logic;
   SIGNAL hit            : std_logic;
   SIGNAL ignoreLRU      : std_logic;
   SIGNAL read           : std_logic;
   SIGNAL write          : std_logic;


   -- Component Declarations
   COMPONENT Cache_Controller
   PORT (
      CLK            : IN     STD_LOGIC ;
      PMRESP_H       : IN     STD_LOGIC ;
      RESET_L        : IN     STD_LOGIC ;
      WayMuxDirty    : IN     std_logic ;
      hit            : IN     std_logic ;
      read           : IN     std_logic ;
      write          : IN     std_logic ;
      AddrSel        : OUT    std_logic ;
      CacheDataInSel : OUT    std_logic ;
      DirtyWrite     : OUT    std_logic ;
      Dirtysel       : OUT    std_logic ;
      LD_Cache       : OUT    std_logic ;
      MRESPSel       : OUT    std_logic ;
      PMREAD_L       : OUT    STD_LOGIC ;
      PMWRITE_L      : OUT    STD_LOGIC ;
      cont_RESP_H    : OUT    std_logic ;
      ignoreLRU      : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Cache_Datapath
   PORT (
      ADDRESS        : IN     LC3b_word ;
      AddrSel        : IN     std_logic ;
      CLK            : IN     STD_LOGIC ;
      CacheDataInSel : IN     std_logic ;
      DATAOUT        : IN     LC3b_word ;
      DirtyWrite     : IN     std_logic ;
      Dirtysel       : IN     std_logic ;
      LD_Cache       : IN     std_logic ;
      MREAD_L        : IN     std_logic ;
      MRESPSel       : IN     std_logic ;
      MWRITEH_L      : IN     std_logic ;
      MWRITEL_L      : IN     std_logic ;
      PMDATAIN       : IN     LC3B_OWORD ;
      RESET_L        : IN     STD_LOGIC ;
      cont_RESP_H    : IN     std_logic ;
      ignoreLRU      : IN     std_logic ;
      DATAIN         : OUT    LC3b_word ;
      MRESP_H        : OUT    std_logic  := '0';
      PMADDRESS      : OUT    LC3B_WORD ;
      PMDATAOUT      : OUT    LC3B_OWORD ;
      WayMuxDirty    : OUT    std_logic ;
      hit            : OUT    std_logic ;
      read           : OUT    std_logic ;
      write          : OUT    std_logic 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : Cache_Controller USE ENTITY ece411.Cache_Controller;
   FOR ALL : Cache_Datapath USE ENTITY ece411.Cache_Datapath;
   -- pragma synthesis_on


BEGIN

   -- Instance port mappings.
   Cache_Cont : Cache_Controller
      PORT MAP (
         CLK            => CLK,
         PMRESP_H       => PMRESP_H,
         RESET_L        => RESET_L,
         WayMuxDirty    => WayMuxDirty,
         hit            => hit,
         read           => read,
         write          => write,
         AddrSel        => AddrSel,
         CacheDataInSel => CacheDataInSel,
         DirtySel       => DirtySel,
         DirtyWrite     => DirtyWrite,
         LD_Cache       => LD_Cache,
         MRESPSel       => MRESPSel,
         PMREAD_L       => PMREAD_L,
         PMWRITE_L      => PMWRITE_L,
         cont_RESP_H    => cont_RESP_H,
         ignoreLRU      => ignoreLRU
      );
   Cache_DP : Cache_Datapath
      PORT MAP (
         ADDRESS        => ADDRESS,
         AddrSel        => AddrSel,
         CLK            => CLK,
         CacheDataInSel => CacheDataInSel,
         DATAOUT        => DATAOUT,
         DirtySel       => DirtySel,
         DirtyWrite     => DirtyWrite,
         LD_Cache       => LD_Cache,
         MREAD_L        => MREAD_L,
         MRESPSel       => MRESPSel,
         MWRITEH_L      => MWRITEH_L,
         MWRITEL_L      => MWRITEL_L,
         PMDATAIN       => PMDATAIN,
         RESET_L        => RESET_L,
         cont_RESP_H    => cont_RESP_H,
         ignoreLRU      => ignoreLRU,
         DATAIN         => DATAIN,
         MRESP_H        => MRESP_H,
         PMADDRESS      => PMADDRESS,
         PMDATAOUT      => PMDATAOUT,
         WayMuxDirty    => WayMuxDirty,
         hit            => hit,
         read           => read,
         write          => write
      );

END struct;

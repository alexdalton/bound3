-- VHDL Entity ece411.Cache_Arbiter.symbol
--
-- Created:
--          by - lis2.ews (siebl-0220-14.ews.illinois.edu)
--          at - 22:31:44 05/01/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Cache_Arbiter IS
   PORT( 
      CLK         : IN     std_logic;
      DC_ADDRESS  : IN     LC3B_WORD;
      DC_MREAD_L  : IN     std_logic;
      DC_MWRITE_L : IN     std_logic;
      IC_ADDRESS  : IN     LC3B_WORD;
      IC_MREAD_L  : IN     std_logic;
      PMRESP_H    : IN     STD_LOGIC;
      rst         : IN     std_logic;
      DC_BLOCK_L  : OUT    std_logic;
      DC_RESP_H   : OUT    std_logic;
      IC_RESP_H   : OUT    std_logic;
      PMADDRESS   : OUT    LC3B_WORD;
      PMREAD_L    : OUT    std_logic;
      PMWRITE_L   : OUT    std_logic
   );

-- Declarations

END Cache_Arbiter ;

--
-- VHDL Architecture ece411.Cache_Arbiter.fsm
--
-- Created:
--          by - lis2.ews (siebl-0220-14.ews.illinois.edu)
--          at - 22:31:44 05/01/14
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;
 
ARCHITECTURE fsm OF Cache_Arbiter IS

   TYPE STATE_TYPE IS (
      Start,
      Instr,
      Data
   );
 
   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE;
   SIGNAL next_state : STATE_TYPE;

BEGIN

   -----------------------------------------------------------------
   clocked_proc : PROCESS ( 
      clk,
      rst
   )
   -----------------------------------------------------------------
   BEGIN
      IF (rst = '0') THEN
         current_state <= Start;
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;
      END IF;
   END PROCESS clocked_proc;
 
   -----------------------------------------------------------------
   nextstate_proc : PROCESS ( 
      DC_MREAD_L,
      DC_MWRITE_L,
      IC_MREAD_L,
      PMRESP_H,
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      CASE current_state IS
         WHEN Start => 
            IF ((IC_MREAD_L = '0')) THEN 
               next_state <= Instr;
            ELSIF ((DC_MREAD_L = '0'  OR DC_MWRITE_L = '0')) THEN 
               next_state <= Data;
            ELSE
               next_state <= Start;
            END IF;
         WHEN Instr => 
            IF (PMRESP_H = '1') THEN 
               next_state <= Start;
            ELSE
               next_state <= Instr;
            END IF;
         WHEN Data => 
            IF (PMRESP_H = '1') THEN 
               next_state <= Start;
            ELSE
               next_state <= Data;
            END IF;
         WHEN OTHERS =>
            next_state <= Start;
      END CASE;
   END PROCESS nextstate_proc;
 
   -----------------------------------------------------------------
   output_proc : PROCESS ( 
      DC_ADDRESS,
      DC_MREAD_L,
      DC_MWRITE_L,
      IC_ADDRESS,
      IC_MREAD_L,
      PMRESP_H,
      current_state
   )
   -----------------------------------------------------------------
   BEGIN
      -- Default Assignment
      DC_BLOCK_L <= '1';
      DC_RESP_H <= '0';
      IC_RESP_H <= '0';
      PMREAD_L <= '1';
      PMWRITE_L <= '1';

      -- Combined Actions
      CASE current_state IS
         WHEN Instr => 
            IC_RESP_H <= PMRESP_H;
            PMADDRESS <= IC_ADDRESS;
            PMREAD_L <= IC_MREAD_L;
            DC_BLOCK_L <= '0';
         WHEN Data => 
            DC_RESP_H <= PMRESP_H;
            PMADDRESS <= DC_ADDRESS;
            PMREAD_L <= DC_MREAD_L;
            PMWRITE_L <= DC_MWRITE_L;
         WHEN OTHERS =>
            NULL;
      END CASE;
   END PROCESS output_proc;
 
END fsm;

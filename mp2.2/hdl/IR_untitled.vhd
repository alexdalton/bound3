--
-- VHDL Architecture ece411.IR.untitled
--
-- Created:
--          by - adalton2.ews (gelib-057-01.ews.illinois.edu)
--          at - 17:34:15 01/26/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY IR IS
   PORT( 
      LoadIR  : IN     std_logic;
      MDROUT  : IN     LC3b_word;
      clk     : IN     std_logic;
      Opcode  : OUT    LC3b_opcode;
      SrcA    : OUT    LC3b_reg;
      SrcB    : OUT    LC3b_reg;
      dest1    : OUT    LC3b_reg;
      index6  : OUT    LC3b_index6;
      imm5    : OUT    LC3b_imm5;
      offset9 : OUT    LC3b_offset9;
      ir5     : OUT    std_logic;
      ir11    : OUT    std_logic;
      imm4    : OUT    LC3b_nibble;
      offset11: OUT    LC3B_OFFSET11;
      shftop  : OUT    LC3B_SHFTOP;
      trapvect8 : OUT  LC3B_TRAPVECT8
   );

-- Declarations

END IR ;

--
ARCHITECTURE UNTITLED OF IR IS
SIGNAL VAL_IR : LC3B_WORD;
BEGIN
	------------------------------
	VHDL_REG_IR : PROCESS (CLK, LOADIR, MDROUT)
	------------------------------
	BEGIN
		IF (CLK'EVENT AND (CLK = '1') AND (CLK'LAST_VALUE = '0')) THEN
			IF (LOADIR = '1') THEN
				VAL_IR <= MDROUT AFTER DELAY_REG;
			END IF;
		END IF;
	END PROCESS VHDL_REG_IR;
	OPCODE <= VAL_IR(15 DOWNTO 12);
	SRCA <= VAL_IR(8 DOWNTO 6);
	SRCB <= VAL_IR(2 DOWNTO 0);
	DEST1 <= VAL_IR(11 DOWNTO 9);
	OFFSET9 <= VAL_IR(8 DOWNTO 0);
	OFFSET11 <= VAL_IR(10 DOWNTO 0);
	INDEX6 <= VAL_IR(5 DOWNTO 0);
	IMM5 <= VAL_IR(4 DOWNTO 0);
	IMM4 <= VAL_IR(3 DOWNTO 0);
	IR5 <= VAL_IR(5);
	IR11 <= VAL_IR(11);
	shftop <= VAL_IR(5 DOWNTO 4);
	trapvect8 <= VAL_IR(7 downto 0);
END UNTITLED;

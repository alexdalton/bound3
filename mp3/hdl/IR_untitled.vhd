--
-- VHDL Architecture ece411.IR.untitled
--
-- Created:
--          by - buris2.ews (evrt-252-11.ews.illinois.edu)
--          at - 16:20:04 01/25/14
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
      LoadIR   : IN     std_logic;
      MDRout   : IN     LC3b_word;
      clk      : IN     std_logic;
      Opcode   : OUT    LC3b_opcode;
      SrcA     : OUT    LC3b_reg;
      SrcB     : OUT    LC3b_reg;
      dest     : OUT    LC3b_reg;
      imm5     : OUT    LC3b_imm5;
      index6   : OUT    LC3b_index6;
      offset9  : OUT    LC3b_offset9;
      offset11 : OUT    LC3b_offset11;
      imm5sel  : OUT    std_logic;
      IR11     : OUT    std_logic;
      trapvect8 : OUT   lc3b_trapvect8;
      SHFop     : OUT   lc3b_shftop
   );

-- Declarations

END IR ;

--
ARCHITECTURE untitled OF IR IS
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
	DEST <= VAL_IR(11 DOWNTO 9);
	OFFSET9 <= VAL_IR(8 DOWNTO 0);
	OFFSET11 <= VAL_IR(10 DOWNTO 0);
	INDEX6 <= VAL_IR(5 DOWNTO 0);
	IMM5 <= VAL_IR(4 DOWNTO 0);
	imm5sel <= VAL_IR(5);
	IR11 <= VAL_IR(11);
	trapvect8 <= VAL_IR(7 DOWNTO 0);
	SHFop <= VAL_IR(5 DOWNTO 4);
END ARCHITECTURE untitled;


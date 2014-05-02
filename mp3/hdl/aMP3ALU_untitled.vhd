--
-- VHDL Architecture ece411.aMP3ALU.untitled
--
-- Created:
--          by - lis2.ews (gelib-057-37.ews.illinois.edu)
--          at - 15:56:01 03/19/14
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY aMP3ALU IS
   PORT( 
      ALUop     : IN     lc3b_aluop;
      sourceA   : IN     lc3b_word;
      sourceB   : IN     LC3b_word;
      ALUout    : OUT    lc3b_word;
      LC3X_OP   : IN     std_logic_vector (1 DOWNTO 0);
      IR2_5     : IN     std_logic;
      ALU_STALL : OUT    std_logic := '0'
   );

-- Declarations

END aMP3ALU ;

--
ARCHITECTURE untitled OF aMP3ALU IS
BEGIN

    PROCESS(sourceA, sourceB, ALUop, LC3X_OP, IR2_5)
        variable temp : LC3b_dword;
        VARIABLE count : INTEGER;
    BEGIN
        case ALUop is
            when alu_add =>
                ALUout <= std_logic_vector(signed(sourceA) + signed(sourceB)) after delay_ALU;
            when alu_and =>
			         IF IR2_5 = '1' THEN
			            ALUout <= (sourceA AND sourceB) after delay_ALU;
			         ELSE
			           case LC3X_OP is
			             when "00" =>
			               ALUout <= (sourceA AND sourceB) after delay_ALU;
			             when "01" =>
			               ALUout <= (sourceA OR sourceB) after delay_ALU;
			             when "10" =>
	                   ALUout <= (sourceA XOR sourceB) after delay_ALU;
			             when "11" =>
	                   ALUout <= std_logic_vector(signed(NOT sourceA) + '1') after delay_ALU;
			             when others =>
			               ALUout <= (OTHERS => 'X');
			           end case;
			         end if;
            when alu_not =>
                ALUout <= NOT sourceA after delay_ALU;
            when alu_pass =>
                ALUout <= sourceA after delay_ALU;
			      when alu_sll =>
			          ALUout <= LC3B_WORD("sll"(unsigned(sourceA), to_integer(unsigned(sourceB)))) after delay_ALU;
			      when alu_srl =>
			          ALUout <= LC3B_WORD("srl"(unsigned(sourceA), to_integer(unsigned(sourceB)))) after delay_ALU;
			      when alu_sra =>
			          count := to_integer(unsigned(sourceB(3 downto 0)));
			          if (sourceB(3 downto 0) = "0000") then
			               ALUout <= sourceA;
			          else
			               ALUout(15 - count downto 0) <= sourceA(15 downto count) after delay_ALU;
			               ALUout(15 downto (15 - count + 1)) <= (others => sourceA(15)) after delay_ALU;
			          end if;    
			      when alu_addx =>
			         IF IR2_5 = '1' THEN
			            ALUout <= std_logic_vector(signed(sourceA) + signed(sourceB)) after delay_ALU;
			         ELSE
			           case LC3X_OP is
			             when "00" =>
			               ALUout <= std_logic_vector(signed(sourceA) + signed(sourceB)) after delay_ALU;
			             when "01" =>
			               temp := std_logic_vector(signed(sourceA) * signed(sourceB));
			               ALUout <= temp(15 downto 0)  after 90ns;
			               ALU_STALL <= '1' after 0 ns, '0' after 90 ns;
			             when "10" =>
			               ALUout <= std_logic_vector(signed(sourceA) / signed(sourceB)) after 340ns;
			               ALU_STALL <= '1' after 0 ns, '0' after 340 ns;
			             when "11" =>
			               ALUout <= std_logic_vector(signed(sourceA) - signed(sourceB)) after delay_ALU;
			             when others =>
			               ALUout <= (OTHERS => 'X');
			           end case;
			         end if;
            when others =>
                ALUout <= (OTHERS => 'X');
        end case;
        
        --ALUout <= temp after delay_ALU;

    END PROCESS;


END ARCHITECTURE untitled;

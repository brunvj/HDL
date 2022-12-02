----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2021 09:37:25 AM
-- Design Name: 
-- Module Name: decision - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decision is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           A: in signed(3 downto 0);
           B: in signed(3 downto 0);
           A_OUT_ADD : out signed(3 downto 0);
           B_OUT_ADD : out signed(3 downto 0);
           A_OUT_MUL : out signed(3 downto 0);
           B_OUT_MUL : out signed(3 downto 0);
           ADD_SUB : out STD_LOGIC);
end decision;

architecture Behavioral of decision is

begin
process (S, A_OUT_ADD, B_OUT_ADD, A_OUT_MUL, B_OUT_MUL, A, B) is
begin
    
    Temp_A(4 downto 0) <= ('0' & A);
    Temp_B(4 downto 0) <= ('0' & B);
        
    case S is
    --Add (1 = ADD, 0 = SUB)
    when "101" =>
    A_OUT_ADD <= Temp_A;
    B_OUT_ADD <= Temp_B;
    ADD_SUB <= "1";
    A_OUT_MUL <= NULL;
    B_OUT_MUL <= NULL;
    
    --Sub (1 = ADD, 0 = SUB)
    when "100" =>
    A_OUT_ADD <= Temp_A;
    B_OUT_ADD <= Temp_B;
    ADD_SUB <= "0";
    A_OUT_MUL <= NULL;
    B_OUT_MUL <= NULL;
    
    --Multiply
    when "010" =>
    A_OUT_ADD <= NULL;
    B_OUT_ADD <= NULL;
    ADD_SUB <= NULL;
    A_OUT_MUL <= Temp_A;
    B_OUT_MUL <= Temp_B;
    
    when others =>
    A_OUT_ADD <= "0000";
    B_OUT_ADD <= "0000";
    ADD_SUB <= "0";
    A_OUT_MUL <= "0000";
    B_OUT_MUL <= "0000";
    
    end case;
    
    end process;
end Behavioral;

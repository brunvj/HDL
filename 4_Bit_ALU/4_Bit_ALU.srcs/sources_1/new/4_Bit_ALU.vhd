----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/10/2021 04:03:41 PM
-- Design Name: 
-- Module Name: 4_Bit_ALU - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity 4_Bit_ALU is
    Port ( A : in signed (3 downto 0);
           B : in signed (3 downto 0);
           Selection : in STD_LOGIC_VECTOR (2 downto 0);
           Carry : in STD_LOGIC;
           Not_Carry_Prop : out STD_LOGIC;
           Not_Carry_Gen : out STD_LOGIC;
           Funct : out signed (3 downto 0));
end 4_Bit_ALU;

architecture Behavioral of 4_Bit_ALU is

signal c0, c1, c2, c3, c4, g0, g1, g2, g3, p0, p1, p2, p3, p4, g0, g1, g2, g3, g4: std_logic;

begin
process (A, B, Carry, Selection, temp, temp_A, temp_B, temp_Carry, c0, c1, c2, c3, c4, g0, g1, g2, g3, g4, p0, p1, p2, p3, p4) is
begin

temp_A(4 downto 0) <= ('0' & A);
temp_B(4 downto 0) <= ('0' & B);
temp_Carry(0 downto 0) <= (Carry);

g0 <= (temp_A(0) and temp_B(0));
g1 <= (temp_A(1) and temp_B(1));
g2 <= (temp_A(2) and temp_B(2));
g3 <= (temp_A(3) and temp_B(3));

p0 <= (temp_A(0) and temp_B(0));
p1 <= (temp_A(1) and temp_B(1));
p2 <= (temp_A(2) and temp_B(2));
p3 <= (temp_A(3) and temp_B(3));

c1 <= (g0 or (p0 and c0));
c2 <= (g1 or (p1 and c1));
c3 <= (g2 or (p2 and c2));
c4 <= (g3 or (p3 and c3));

    case Selection is
        when "011" =>
            temp <= (temp_Carry + temp_A) + temp_B;
            Funct (3 downto 0) <= (temp (3 downto 0));
            Not_Carry_Gen <= not g3;
            Not_Carry_Prop <= not p3;
        
        when "010" =>
            temp <= ((-1) + (temp_Carry + temp_A) - temp_B);
            Funct (3 downto 0) <= (temp (3 downto 0));
            g3 <= (temp_A(3) and (not temp_B(3)));
            p3 <= (temp_A(3) or (not temp_B(3)));
            c3 <= (g3 or (p3 and c3));
            Not_Carry_Gen <= not g3;
            Not_Carry_Prop <= not p3;
            
       when "001" =>
            temp <= ((-1) + (temp_Carry + temp_B) - temp_A);
            Funct (3 downto 0) <= (temp (3 downto 0));
            g3 <= ((not temp_A(3)) and (temp_B(3)));
            p3 <= ((not temp_A(3)) and (temp_B(3)));
            c3 <= (g3 or (p3 and c3));
            Not_Carry_Gen <= not g3;
            Not_Carry_Prop <= not p3;
       
       when "110" =>
            Funct <= A and B;
            Not_Carry_Gen <= 'Z';
            Not_Carry_Prop <= 'Z';
       
       when "101" =>
            Funct <= A or B;
            Not_Carry_Gen <= 'Z';
            Not_Carry_Prop <= 'Z';
      
       when "100" =>
            Funct <= A xor B;
            Not_Carry_Gen <= 'Z';
            Not_Carry_Prop <= 'Z';
       
      when "000" =>
            Funct <= "0000";
            Not_Carry_Gen <= '0';
            Not_Carry_Prop <= '0'; 
      
      when "111" =>
            Funct <= "1111";
            Not_Carry_Gen <= '1';
            Not_Carry_Prop <= '1';
      
      when others =>
            Funct(3 downto 0) <= (temp(3 downto 0));
            temp <= "0000000";
            Not_Carry_Gen <= '1';
            Not_Carry_Prop <= '0'; 
                       
end case;

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2021 11:26:53 AM
-- Design Name: 
-- Module Name: Bin_Hex - RTL
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Bin_Hex is
    Port ( X : in signed (7 downto 0);
           CLK : in STD_LOGIC;
           o_Segment_A  : out std_logic;
           o_Segment_B  : out std_logic;
           o_Segment_C  : out std_logic;
           o_Segment_D  : out std_logic;
           o_Segment_E  : out std_logic;
           o_Segment_F  : out std_logic;
           o_Segment_G  : out std_logic);
end Bin_Hex;

architecture RTL of Bin_Hex is

begin
-- Downscale FPGA source clock (100MHZ) to a frequency ranging from 60HZ to 1kHZ
    --18 bit register for creating 2.6ms digit refresh period
    signal refresh_counter : std_logic register(19 downto 0);
    --2 bit signal for creating four LED-lighting signals
    signal LED_lighting_count (1 downto 0);
    

end RTL;

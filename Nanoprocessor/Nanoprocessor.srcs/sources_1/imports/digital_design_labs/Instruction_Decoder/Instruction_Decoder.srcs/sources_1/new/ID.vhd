----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/11/2022 12:28:45 PM
-- Design Name: 
-- Module Name: ID - Behavioral
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

entity ID is
    Port ( I : in STD_LOGIC_VECTOR (11 downto 0);
           J : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_sel_2 : out STD_LOGIC_VECTOR (2 downto 0);
           Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
           Load_select : out STD_LOGIC;
           Add_Sub : out STD_LOGIC;
           Im_value : out STD_LOGIC_VECTOR (3 downto 0);
           Jump_flag : out STD_LOGIC;
           Jump_address : out STD_LOGIC_VECTOR (2 downto 0));
end ID;

architecture Behavioral of ID is
component Decoder_2_to_4
    Port ( I : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal yy : STD_LOGIC_VECTOR (3 downto 0);
begin
Decoder_2_4_0 : Decoder_2_to_4
     port map(
               I => I(11 downto 10),
               EN => '1',
               Y => yy 
              );

Reg_sel_1 <= I(6 downto 4);
Reg_sel_2 <= I(9 downto 7);
Load_select <= yy(0);
Reg_EN <= I(9 downto 7);
Im_value <= I(3 downto 0);
Add_Sub <= yy(2);
Jump_flag <= yy(3) AND NOT ( J(0) OR J(1) OR J(2) OR  J(3));
Jump_address <= I(2 downto 0);
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.07.2022 22:12:27
-- Design Name: 
-- Module Name: MUX_2_1_4bit_Sim - Behavioral
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

entity MUX_2_1_4bit_Sim is
--  Port ( );
end MUX_2_1_4bit_Sim;

architecture Behavioral of MUX_2_1_4bit_Sim is

component MUX_2_1_4bit
   Port ( I1 : in STD_LOGIC_VECTOR (3 downto 0);
           I2 : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC;
           Y_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal mux_in_0,mux_in_1,mux_out:STD_LOGIC_VECTOR (3 downto 0);
signal mux_sel:std_logic;


begin

UUT:MUX_2_1_4bit
port map(
    I1=>mux_in_0,
    I2=>mux_in_1,
    Y_out=>mux_out,
    C_in=>mux_sel);
    
process
begin
mux_in_0<="1011";
mux_in_1<="0110";

mux_sel<='0';
wait for 200ns;

mux_sel<='1';
wait for 200ns;
end process;
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/19/2022 04:07:25 PM
-- Design Name: 
-- Module Name: sim_nanoprocessor_with_7_segment_display - Behavioral
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

entity sim_nanoprocessor_with_7_segment_display is
--  Port ( );
end sim_nanoprocessor_with_7_segment_display;

architecture Behavioral of sim_nanoprocessor_with_7_segment_display is

component nanoprocessor_with_7_segment_display
     Port ( 
           Reset : in STD_LOGIC;
           Clock : in STD_LOGIC;
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC
       );
end component;
signal s_7seg : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
signal reset, clk, zero, carry : STD_LOGIC := '0';
begin
UUT : nanoprocessor_with_7_segment_display
     Port Map (
                Reset => reset,
                S_7Seg => s_7seg,
                Clock => clk,
                Zero => zero,
                Carry => carry
    );
process
  begin
         reset <= '1';
         wait for 95ns;
         reset <= '0';
         wait;
         
end process;

process
 begin
         clk <= NOT(clk);
         wait for 5ns;
end process;
end Behavioral;

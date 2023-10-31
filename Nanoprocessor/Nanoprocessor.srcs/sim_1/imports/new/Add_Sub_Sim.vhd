----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 12:31:46 AM
-- Design Name: 
-- Module Name: Add_Sub_Sim - Behavioral
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

entity Add_Sub_Sim is
--  Port ( );
end Add_Sub_Sim;

architecture Behavioral of Add_Sub_Sim is
component ADD_SUB_4bit
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
       B : in STD_LOGIC_VECTOR (3 downto 0);
       Add_Sub : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR (3 downto 0);
       Over : out STD_LOGIC;
       Zero : out STD_LOGIC);
end component;

signal a, b, s : std_logic_vector (3 downto 0);
signal add_sub, over, zero : std_logic;

begin
UUT: ADD_SUB_4bit
   PORT MAP(
             A => a,
             B => b,
             Add_Sub => add_sub,
             S => s,
             Over => over,
             Zero => zero
             );

process
begin
        add_sub <= '0';
        a <= "0100";
        b <= "0010";
        wait for 100ns;
        
        add_sub <= '1';
        a <= "0100";
        b <= "0010";
        wait for 100ns;
        
        add_sub <= '0';
        a <= "1100";
        b <= "1010";
        wait for 100ns;

        add_sub <= '1';
        a <= "0000";
        b <= "0000";
        wait;
        
end process;
end Behavioral;

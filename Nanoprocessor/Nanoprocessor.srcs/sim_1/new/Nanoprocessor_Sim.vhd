----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 03:51:34 PM
-- Design Name: 
-- Module Name: Nanoprocessor_Sim - Behavioral
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

entity Nanoprocessor_Sim is
--  Port ( );
end Nanoprocessor_Sim;

architecture Behavioral of Nanoprocessor_Sim is
component Nanoprocessor_Group_11
    Port ( 
          Clock : in STD_LOGIC;
          Reset : in STD_LOGIC;
          Over1 : out STD_LOGIC;
          Zero1 : out STD_LOGIC;
          Registr : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal clock1, res : STD_LOGIC := '0';
signal over, zero : STD_LOGIC := '0';
signal registr : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT: Nanoprocessor_Group_11
   port map(
             Clock => clock1,
             Reset => res,
             Over1 => over,
             Zero1 => zero,
             Registr => registr
         );
process
 begin
       res <= '1';
       wait for 95ns;
       res <= '0';
       wait for 375ns;
       res <= '1';
       wait for 95ns;
       res <= '0';
       wait;
end process;

process
 begin
      clock1 <= NOT(clock1);
      wait for 5ns;
end process;
end Behavioral;

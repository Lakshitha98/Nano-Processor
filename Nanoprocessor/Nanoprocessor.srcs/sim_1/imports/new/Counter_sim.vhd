----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/16/2022 11:14:46 AM
-- Design Name: 
-- Module Name: Counter_sim - Behavioral
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

entity Counter_sim is
--  Port ( );
end Counter_sim;

architecture Behavioral of Counter_sim is
component Counter
      Port ( Dir : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal dir, q : STD_LOGIC_VECTOR (2 downto 0);
signal res : STD_LOGIC := '1';
signal clk : STD_LOGIC := '0';

begin

UUT : Counter
      Port Map(
           Dir => dir,
           Res => res,
           Clk => clk,
           Q => q    
      );
      
process
  begin     
     clk <= not (clk);
     wait for 5ns;
end process;
process
  begin 
     res <= '0';
     wait for 90ns;   
     dir <= "000";
     wait for 100ns;
     dir <= "001";
     wait for 100ns;
     dir <= "010";
     res <= '1';
     wait for 100ns;
     dir <= "011";
     wait for 100ns;
end process;
end Behavioral;

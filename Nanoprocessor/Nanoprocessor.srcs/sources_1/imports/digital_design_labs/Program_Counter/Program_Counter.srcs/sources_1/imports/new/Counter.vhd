----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/16/2022 10:30:13 AM
-- Design Name: 
-- Module Name: Counter - Behavioral
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

entity Counter is
    Port ( Dir : in STD_LOGIC_VECTOR (2 downto 0) := "000";
           Res : in STD_LOGIC := '1';
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end Counter;

architecture Behavioral of Counter is
component D_FF
    Port ( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end component;
component Slow_Clk
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;
signal dd : STD_LOGIC_VECTOR (2 downto 0);
signal qq : STD_LOGIC_VECTOR (2 downto 0);
signal clk_slow : STD_LOGIC;

begin

Slow_Clk0 : Slow_Clk
       Port Map(
               Clk_in => Clk,
               Clk_out => clk_slow
       );

D_FF0 : D_FF
       Port Map(
            D => dd(0),
            Res => Res,
            Clk => clk_slow,
            Q => qq(0)  
       );
D_FF1 : D_FF
        Port Map(
            D => dd(1),
            Res => Res,
            Clk => clk_slow,
            Q => qq(1)  
         );
D_FF2 : D_FF
         Port Map(
            D => dd(2),
            Res => Res,
            Clk => clk_slow,
            Q => qq(2)  
          );
dd <= Dir;
Q <= qq;

end Behavioral;

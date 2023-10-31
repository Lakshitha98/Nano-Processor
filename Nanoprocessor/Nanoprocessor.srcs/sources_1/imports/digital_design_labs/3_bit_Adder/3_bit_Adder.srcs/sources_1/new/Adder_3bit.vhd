----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/08/2022 01:27:29 AM
-- Design Name: 
-- Module Name: Adder_3bit - Behavioral
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

entity Adder_3bit is
    Port ( 
            A : in STD_LOGIC_VECTOR (2 downto 0);
            S : out STD_LOGIC_VECTOR (2 downto 0)
         
         );
end Adder_3bit;

architecture Behavioral of Adder_3bit is
component FA
   Port ( 
           A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC
         );
end component;
signal aa : std_logic_vector (2 downto 0) := "000";
signal bb, FA_C, FA_S : std_logic_vector (2 downto 0);
begin

  FA_0 : FA 
      port map ( 
                A => aa(0), 
                B => bb(0), 
                C_in => '1', -- increment value
                S => FA_S(0), 
                C_out => FA_C(0)
               ); 
 FA_1 : FA
     port map ( 
                A => aa(1), 
                B => bb(1), 
                C_in => FA_C(0), 
                S => FA_S(1), 
                C_out => FA_C(1)
               );
 FA_2 : FA
     port map ( 
                A => aa(2), 
                B => bb(2), 
                C_in => FA_C(1),
                S => FA_S(2), 
                C_out => FA_C(2)
               ); 
aa <= A;
bb <= "000";
S <= FA_S;

end Behavioral;

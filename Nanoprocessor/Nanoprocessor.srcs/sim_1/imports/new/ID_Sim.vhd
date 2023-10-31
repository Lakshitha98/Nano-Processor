----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/14/2022 02:10:58 PM
-- Design Name: 
-- Module Name: ID_Sim - Behavioral
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

entity ID_Sim is

end ID_Sim;

architecture Behavioral of ID_Sim is

component ID
  Port(
       I : in STD_LOGIC_VECTOR (11 downto 0);
       J : in STD_LOGIC_VECTOR (3 downto 0);
       Reg_sel_1 : out STD_LOGIC_VECTOR (2 downto 0);
       Reg_sel_2 : out STD_LOGIC_VECTOR (2 downto 0);
       Reg_EN : out STD_LOGIC_VECTOR (2 downto 0);
       Load_select : out STD_LOGIC;
       Add_Sub : out STD_LOGIC;
       Im_value : out STD_LOGIC_VECTOR (3 downto 0);
       Jump_flag : out STD_LOGIC;
       Jump_address : out STD_LOGIC_VECTOR (2 downto 0)
       );
end component;
signal i : STD_LOGIC_VECTOR (11 downto 0);
signal j, imvalue : STD_LOGIC_VECTOR (3 downto 0);
signal regsel1, regsel2, regen, jmpads : STD_LOGIC_VECTOR (2 downto 0);
signal loadsl, addsub, jmpflg : STD_LOGIC;
begin
UUT : ID
 PORT MAP(   
             I => i,
             J => j,
             Reg_sel_1 => regsel1,
             Reg_sel_2 => regsel2,
             Reg_EN => regen,
             Load_select => loadsl,
             Add_Sub => addsub,
             Im_value =>imvalue,
             Jump_flag => jmpflg,
             Jump_address => jmpads
       );
       
process

 begin
    i <= "101010001010";
    wait for 100ns;
    i <= "001101110000";
    wait for 100ns;
    i <= "100010000010";
    wait for 100ns;
    i <= "100100000001";
    wait for 100ns;
    
end process;

end Behavioral;

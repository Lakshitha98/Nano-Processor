----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/09/2022 09:54:10 AM
-- Design Name: 
-- Module Name: TB_Bank - Behavioral
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

entity TB_Bank is
--  Port ( );
end TB_Bank;

architecture Behavioral of TB_Bank is
component Register_Bank
    Port ( Mux : in STD_LOGIC_VECTOR (3 downto 0);
        Clk : in std_logic;
        Reg_out_0 : out std_logic_vector(3 downto 0);
        Reg_out_1 : out std_logic_vector(3 downto 0);
        Reg_out_2 : out std_logic_vector(3 downto 0);
        Reg_out_3 : out std_logic_vector(3 downto 0);
        Reg_out_4 : out std_logic_vector(3 downto 0);
        Reg_out_5 : out std_logic_vector(3 downto 0);
        Reg_out_6 : out std_logic_vector(3 downto 0);
        Reg_out_7 : out std_logic_vector(3 downto 0);
        Input : in std_logic_vector( 2 downto 0);
        En : in std_logic);
end component;
signal mux,reg_out_0,reg_out_1,reg_out_2,reg_out_3,reg_out_4,reg_out_5,reg_out_6,reg_out_7:std_logic_vector(3 downto 0):="0000";
signal Clk,En:std_logic:='0';
signal input:std_logic_vector(2 downto 0):="000";
begin
UUT:Register_Bank
    port map(
        Mux=>mux,
        Clk=>clk,
        Input=>input,
        En=>En,
        Reg_out_0=>reg_out_0,
        Reg_out_1=>reg_out_1,
        Reg_out_2=>reg_out_2,
        Reg_out_3=>reg_out_3,
        Reg_out_4=>reg_out_4,
        Reg_out_5=>reg_out_5,
        Reg_out_6=>reg_out_6,
        Reg_out_7=>reg_out_7
    
    );
    process
    begin
        Clk <= Not(Clk);
        wait for 2ns;
    end process;
    process
    begin
    En <='1';
    input <="000";
    mux <="1111";
    wait for 100ns;
    input <="001";
    mux <="1110";
    wait for 100ns;
    input <="010";
    mux<="1101";
    wait for 100ns;
    input <="011";
    mux <="1100";
    wait for 100ns;
    input <="100";
    mux<="1011";
    wait for 100ns;
    input <="101";
    mux<="1010";
    wait for 100ns;
    input <="110";
    mux<="1001";
    wait for 100ns;
    input <="111";
    mux<="1000";
    wait;
    end process;
end Behavioral;

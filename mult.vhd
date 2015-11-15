----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:07:13 11/14/2015 
-- Design Name: 
-- Module Name:    mult - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mult is
  	port( X,Y: in std_logic_vector (3 downto 0);
			Z  : out std_logic_vector (7 downto 0));
end mult;

architecture Behavioral of mult is

component Sum8
    Port ( X : in  STD_LOGIC_VECTOR(7 downto 0);
           Y : in  STD_LOGIC_VECTOR(7 downto 0);
			  cin : in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(7 downto 0);
           Cout : out  STD_LOGIC);
end component;

--señales intermedias de calculo

signal s0: std_logic_vector(7 downto 0):= (others => '0');
signal s1: std_logic_vector(7 downto 0):= (others => '0');
signal s2: std_logic_vector(7 downto 0):= (others => '0');
signal s3: std_logic_vector(7 downto 0):= (others => '0');

--sumas parciales

signal sum1 : std_logic_vector(7 downto 0);
signal sum2 : std_logic_vector(7 downto 0);

begin

s0(3 downto 0) <= X and(Y(0)&Y(0)&Y(0)&Y(0));
s1(4 downto 1) <= X and(Y(1)&Y(1)&Y(1)&Y(1));
s2(5 downto 2) <= X and(Y(2)&Y(2)&Y(2)&Y(2));
s3(6 downto 3) <= X and(Y(3)&Y(3)&Y(3)&Y(3));


Sumador1: Sum8 port map(
					cin => '0',
					X => s0,
					Y => s1,
					S => sum1,
					Cout => open);
					
Sumador2: Sum8 port map(
					cin => '0',
					X => s2,
					Y => sum1,
					S => sum2,
					Cout => open);
					
Sumador3: Sum8 port map(
					cin => '0',
					X => s3,
					Y => sum2,
					S => Z,
					Cout => open);

end Behavioral;


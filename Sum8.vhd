----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:39:43 11/14/2015 
-- Design Name: 
-- Module Name:    Sum8 - Behavioral 
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

entity Sum8 is
    Port ( X : in  STD_LOGIC_VECTOR(7 downto 0);
           Y : in  STD_LOGIC_VECTOR(7 downto 0);
			  cin : in STD_LOGIC;
           S : out  STD_LOGIC_VECTOR(7 downto 0);
           Cout : out  STD_LOGIC);
end Sum8;

architecture Behavioral of Sum8 is

component carrylookahead
  	port( op1,op2: in std_logic_vector (3 downto 0);
	      cin:     in std_logic;
			add:     out std_logic_vector (3 downto 0);
			cout:    out std_logic);
			
end component;

--señal intermedia cout -> cin

signal C : std_logic;

begin


--conectamos ambos carrylookahead para hacer un sumador de 8

LA: carrylookahead port map(
					cin => cin,
					op1 => X(3 downto 0),
					op2 => Y(3 downto 0),
					add => S(3 downto 0),
					cout => C
);
LA2: carrylookahead port map(
					cin => C,
					op1 => X(7 downto 4),
					op2 => Y(7 downto 4),
					add => S(7 downto 4),
					cout => Cout
);


end Behavioral;


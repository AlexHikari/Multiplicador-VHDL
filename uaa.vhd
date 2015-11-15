----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alejandro Rivas Moreira
-- 
-- Create Date:    12:02:24 11/02/2015 
-- Design Name: 
-- Module Name:    uaa - Behavioral 
-- Project Name: Carrylookahead 1 nivel
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

entity uaa is
   generic(n: natural := 3);
   port (  cin  : in std_logic;
           G    : in std_logic_vector (3 downto 0);
           P    : in std_logic_vector (3 downto 0);
           Cx   : out std_logic_vector (2 downto 0);
           cout : out std_logic);
end uaa ;

architecture Behavioral of uaa is

begin

   Cx(0) <= G(0) or (P(0) and cin);
	Cx(1) <= G(1) or (P(1) and G(0)) or (P(1) and P(0) and cin);
	Cx(2) <= G(2) or (P(2) and G(1)) or (P(2) and P(1) and G(0)) or (P(2) and P(1) and P(0) and cin);
	cout  <= G(3) or (P(3) and G(2)) or (P(3) and P(2) and G(1)) or (P(3) and P(2) and P(1) and G(0)) or (P(3) and P(2) and P(1) and P(0) and cin);
	

end Behavioral;


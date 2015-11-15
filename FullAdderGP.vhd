----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Alejandro Rivas Moreira
-- 
-- Create Date:    11:57:45 11/02/2015 
-- Design Name: 
-- Module Name:    FullAdderGP - Behavioral 
-- Project Name: carry-lookahead
-- Target Devices: 
-- Tool versions: 
-- Description: Sumador completo con generaci´on y propagaci´on de acarreo
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

entity FullAdderGP is
   port ( cin : in std_logic;
          x   : in std_logic;
          y   : in std_logic;
          g   : out std_logic;
          p   : out std_logic;
          s   : out std_logic);

end FullAdderGP;

architecture Behavioral of FullAdderGP is

begin

   g <= x and y;
	p <= (x xor y);
	s <= (x xor y) xor cin;

end Behavioral;


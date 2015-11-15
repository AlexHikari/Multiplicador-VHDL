----------------------------------------------------------------------------------
-- Company:
-- Engineer: Alejandro Rivas Moreira
--
-- Create Date:    12:11:51 11/02/2015
-- Design Name:
-- Module Name:    carrylookahead - Behavioral
-- Project Name: carryllokahead 1 nivel
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

entity carrylookahead is
	port( op1,op2: in std_logic_vector (3 downto 0);
	      cin:     in std_logic;
			add:     out std_logic_vector (3 downto 0);
			cout:    out std_logic);
end carrylookahead;

architecture Behavioral of carrylookahead is
	--componente sumador
   component FullAdderGP
	    port ( cin : in std_logic;
              x   : in std_logic;
              y   : in std_logic;
              g   : out std_logic;
              p   : out std_logic;
              s   : out std_logic);
	end component;
	--componente uaa
	component uaa
	   port ( cin : in std_logic ;
             G   : in std_logic_vector (3 downto 0);
             P   : in std_logic_vector (3 downto 0);
             Cx  : out std_logic_vector (2 downto 0);
				 cout: out std_logic);
	end component;
	--se�ales intermedias
	signal CarryG   : std_logic_vector(3 downto 0);
	signal CarryP   : std_logic_vector(3 downto 0);
	signal Carry    : std_logic_vector(4 downto 0);
	signal CarryCx  : std_logic_vector(2 downto 0);
	signal CarryOut : std_logic;

begin
	--condiciones de contorno
   Carry(0) <= cin;

   uaaa: uaa port map(
							 cin  => cin,
							 G    => CarryG,
							 P    => CarryP,
							 Cx   => CarryCx,
							 cout => CarryOut);

	--Carry de anticipaci�n que pasamos a FAGP
   Carry(3 downto 1) <= CarryCx;

   gen1: for i in 0 to 3 generate
	   FAGP: FullAdderGP port map (
		              cin => Carry(i),
		              x => op1(i),
		              y => op2(i),
		              g => CarryG(i),
		              p => CarryP(i),
						  s => add(i));
   end generate gen1;
	--contorno final Carry n es carryOut de uaaa => cout del modulo
	Carry(4) <= CarryOut;
	cout <= Carry(4);
end Behavioral;

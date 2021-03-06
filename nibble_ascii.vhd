----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:56:11 03/20/2014 
-- Design Name: 
-- Module Name:    nibble_ascii - Behavioral 
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

library UNISIM;
use UNISIM.VComponents.all;


entity nibble_ascii is
    Port ( nibble : in  STD_LOGIC_VECTOR (3 downto 0);
           ascii : out  STD_LOGIC_VECTOR (7 downto 0));
end nibble_ascii;

architecture Behavioral of nibble_ascii is

begin

	with nibble select
	ascii <=  x"30" when "0000",
				 x"31" when "0001",
				 x"32" when "0010",
				 x"33" when "0011",
				 x"34" when "0100",
				 x"35" when "0101",
				 x"36" when "0110",
				 x"37" when "0111",
				 x"38" when "1000",
				 x"39" when "1001",
				 x"41" when "1010",
				 x"42" when "1011",
				 x"43" when "1100",
				 x"44" when "1101",
				 x"45" when "1110",
				 x"46" when others;

end Behavioral;

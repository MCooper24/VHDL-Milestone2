--------- Students: Martin Cooper & Antonio Tembo ------
-------------- Numbers: UP736129 & UP504815 ------------
---------------- Module: SECOND - Counter --------------

library ieee;																			
use ieee.std_logic_1164.all;				
use ieee.numeric_std.all;	

entity T17_M2_Counter is
	port( Reset : in std_logic;
			Clock_50MHz : in std_logic;
			Digit_selection : out std_logic_vector (1 downto 0) );
end T17_M2_Counter;

architecture Behavioral of T17_M2_Counter is

	signal Output_250Hz : std_logic;
	signal Zero_to_Three : std_logic_vector (1 downto 0);
	signal Counter_250Hz : integer;

begin

process (Reset, Clock_50MHz)						
	begin 																					
	if Reset = '1' then													
		Counter_250Hz <= 0;										
	elsif rising_edge (Clock_50MHz) then												
		if Counter_250Hz < 200000 - 1 then											
			Counter_250Hz <= Counter_250Hz + 1;								
		else									
			Counter_250Hz <= 0;											
		end if;																				
	end if;																					
end process;

process(Reset, Clock_50MHz, Output_250Hz, Zero_to_Three)
begin
	if Reset = '1' then
		Zero_to_Three <= "00";
	elsif falling_edge (Output_250Hz) then
		if Output_250Hz <= '1' then
			if Zero_to_Three < "01" then
			Zero_to_Three <= std_logic_vector(unsigned(Zero_to_Three) + 2);
		else
			Zero_to_Three <= "00";
			end if;
		end if;
	end if;
end process;															

Output_250Hz <= '0' when Counter_250Hz < 99999 else '1';
Digit_selection <= Zero_to_Three;

end Behavioral;
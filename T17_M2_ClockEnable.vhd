--------- Students: Martin Cooper & Antonio Tembo ------
-------------- Numbers: UP736129 & UP504815 ------------
-------------- Module: FIRST - Clock Enable ------------

library ieee;																			
use ieee.std_logic_1164.all;				
use ieee.numeric_std.all;	

entity T17_M2_ClockEnable is
	port( Reset : in std_logic;
			Clock_50MHz : in std_logic;
			Output_1Hz_Enable : out std_logic;
			Output_1Hz : out std_logic;
			Output_250Hz_Enable : out std_logic;
			Output_250Hz : out std_logic );
end T17_M2_ClockEnable;

architecture Behavioral of T17_M2_ClockEnable is

	signal Clock_1Hz_Enable : std_logic; 
	signal Clock_250Hz_enable : std_logic;
	signal Counter_50MHz : integer;
	signal Counter_250Hz : integer;

begin

-- 1Hz Clock Enable --

process (Reset, Clock_50MHz)							
	begin																						
	if Reset = '1' then																
		Counter_50MHz <= 0;												
	elsif rising_edge (Clock_50MHz) then													
		if Counter_50MHz < 50000000 - 1 then							
			Counter_50MHz <= Counter_50MHz + 1;								
		else																		
			Counter_50MHz <= 0;											
		end if;																				
	end if;																					
end process;

process (Reset, Clock_50MHz)									
	begin																						
	if Reset = '1' then																
		Clock_1Hz_Enable <= '0';											
	elsif falling_edge (Clock_50MHz) then														
		if Counter_50MHz < 50000000 - 1 then									
			Clock_1Hz_Enable <= '0';
		else 															
			Clock_1Hz_Enable <= '1';
		end if;																				
	end if;																					
end process;	

-- 250Hz Clock Enable --

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

process (Reset, Clock_50MHz)
	begin																						
	if Reset = '1' then																	
		Clock_250Hz_Enable <= '0';													
	elsif falling_edge (Clock_50MHz) then												
		if Counter_250Hz < 200000 - 1 then								
			Clock_250Hz_Enable <= '0';													
		else											
			Clock_250Hz_Enable <= '1';													
		end if;																				
	end if;																					
end process;

-- Output Signals --

Output_1Hz_Enable <= Clock_1Hz_Enable;
Output_1Hz <= '0' when Counter_50MHz < 24999999 else '1';
Output_250Hz_Enable <= Clock_250Hz_Enable;
Output_250Hz <= '0' when Counter_250Hz < 99999 else '1';

end Behavioral;
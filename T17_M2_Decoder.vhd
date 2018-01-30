--------- Students: Martin Cooper & Antonio Tembo ------
-------------- Numbers: UP736129 & UP504815 ------------
---------------- Module: FIFTH - Decoder ---------------

library ieee;																			
use ieee.std_logic_1164.all;				
use ieee.numeric_std.all;	

entity T17_M2_Decoder is
	port (C50MHz : in std_logic;
			Reset : in std_logic;
			Wave1 : in std_logic_vector (3 downto 0);
			Wave2 : in std_logic_vector (3 downto 0);
			SQ1 : 
end T17_M2_Decoder;

architecture Behavioral of T17_M2_Decoder is

signal Byte : std_logic_vector (3 downto 0);
signal SQ1 : std_logic_vector (7 downto 0);
signal SQ2 : std_logic_vector (7 downto 0);
signal TRW : std_logic_vector (7 downto 0);
signal SAW : std_logic_vector (7 downto 0);
signal Cathodes : std_logic_vector (15 downto 0);

begin

-- ------------------------------------------------------

process (Digit, Right_displays, Left_displays)
begin
	case Digit is -
		when "00" => 		State <= Right_displays;
								Anodes <= "1100";
		when "01" => 		State <= Left_displays;
								Anodes <= "0011";
		when others => null;
	end case;
end process;

process (State)
begin
	case State is
		when "0000" => 	Cathodes <= "0000001100000011"; -- Displays 00.
		when "0001" =>	 	Cathodes <= "0010010100000011"; -- Displays 20.
		when "0010" => 	Cathodes <= "1001100100000011"; -- Displays 40.
		when "0011" => 	Cathodes <= "0100000100000011"; -- Displays 60.
		when "0100" => 	Cathodes <= "0000000100000011"; -- Displays 80.
		when "0101" => 	Cathodes <= "0001000100000011"; -- Displays A0.
		when "0110" => 	Cathodes <= "0110001100000011"; -- Displays C0.
		when "0111" => 	Cathodes <= "0110000100000011"; -- Displays E0.
		when "1000" => 	Cathodes <= "0111000101110001"; -- Displays FF.
		when others => 	Cathodes <= "1111111111111111"; -- Displays nothing.
	end case;
end process;

Anode_Displays <= Anodes;
Cathode_Segments <= Cathodes;

end Behavioral;
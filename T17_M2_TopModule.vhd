-- Students: Martin Cooper & Antonio Tembo --
------- Numbers: UP736129 & UP504815 --------
------------ Module: TOP MODULE -------------

library ieee;																			
use ieee.std_logic_1164.all;				
use ieee.numeric_std.all;	

entity T17_M2_TopModule is
	port( Reset : in std_logic;
			Clock_50MHz : in std_logic;
			Output_1Hz_Enable : out std_logic;
			Output_1Hz : out std_logic;
			Output_250Hz_Enable : out std_logic;
			Output_250Hz : out std_logic;
			Digit_selection : out std_logic_vector (1 downto 0) );	
end T17_M2_TopModule;

architecture Behavioral of T17_M2_TopModule is

component T17_M2_ClockEnable is
	port( Reset : in std_logic;
			Clock_50MHz : in std_logic;
			Output_1Hz_Enable : out std_logic;
			Output_1Hz : out std_logic;
			Output_250Hz_Enable : out std_logic;
			Output_250Hz : out std_logic );
	end component;

component T17_M2_Counter is
	port( Reset : in std_logic;
			Clock_50MHz : in std_logic;
			Digit_selection : out std_logic_vector (1 downto 0) );
	end component;

--component T17_M2_ChannelZero is
--	end component;
	
--component T17_M2_ChannelOne is
--	end component;
	
--component T17_M2_Decoder is
--	end component;

begin

	First : T17_M2_ClockEnable		port map (	Reset,
															Clock_50MHz,
															Output_1Hz_Enable,
															Output_1Hz,
															Output_250Hz_Enable,
															Output_250Hz );
	
	Second : T17_M2_Counter			port map ( 	Reset,
															Clock_50MHz,
															Digit_selection );
	
--	Third : T17_M2_ChannelZero;
	
--	Fourth : T17_M2_ChannelOne;
	
--	Fifth : T17_M2_Decoder;

end Behavioral;
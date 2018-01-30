LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY T17_M2_Counter_TB IS
END T17_M2_Counter_TB;
 
ARCHITECTURE behavior OF T17_M2_Counter_TB IS 

    COMPONENT T17_M2_Counter
    PORT(
         Reset : IN  std_logic;
         Clock_50MHz : IN  std_logic;
         Digit_selection : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    
   signal Reset : std_logic := '0';
   signal Clock_50MHz : std_logic := '0';
   signal Digit_selection : std_logic_vector(1 downto 0);
   constant Clock_50MHz_period : time := 20 ns;
 
BEGIN
 
   uut: T17_M2_Counter PORT MAP (
          Reset => Reset,
          Clock_50MHz => Clock_50MHz,
          Digit_selection => Digit_selection
        );

   Clock_50MHz_process :process
   begin
		Clock_50MHz <= '0';
		wait for Clock_50MHz_period/2;
		Clock_50MHz <= '1';
		wait for Clock_50MHz_period/2;
   end process;
 
   stim_proc: process
   begin		
		Reset <= '0';
      wait for 10 ns;	
		Reset <= '1';
      wait for 10 ns;
		Reset <= '0';
      wait;
   end process;

END;
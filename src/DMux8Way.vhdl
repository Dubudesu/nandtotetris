library ieee;
use ieee.std_logic_1164.all;

entity DMux8Way is
    port (
		i 	: in std_logic;
		sel	: in Std_Logic_Vector(2 downto 0);

		o 	: out Std_Logic_Vector(7 downto 0)
    );
end DMux8Way;

-------------------------------------------------------------------------------
architecture rtl of DMux8Way is
-------------------------------------------------------------------------------

--Component list--

---Signal list---

begin
	process(sel,i) is
	begin
		case( sel ) is
		
			when "000" => 
				o <= B"10000000";
			when "001" => 
				o <= B"01000000";
			when "010" => 
				o <= B"00100000";
			when "011" => 
				o <= B"00010000";
			when "100" => 
				o <= B"00001000";
			when "101" => 
				o <= B"00000100";
			when "110" => 
				o <= B"00000010";
			when "111" => 
				o <= B"00000001";
			when others =>
				o <= (others => 'X');
		end case ;
	end process;

end rtl ; -- rtl
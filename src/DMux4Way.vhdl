library ieee;
use ieee.std_logic_1164.all;

entity DMux4Way is
    port (
		i 	: in std_logic;
		sel	: in Std_Logic_Vector(1 downto 0);

		o 	: out Std_Logic_Vector(3 downto 0)
    );
end DMux4Way;

-------------------------------------------------------------------------------
architecture rtl of DMux4Way is
-------------------------------------------------------------------------------

--Component list--

---Signal list---

begin
	process(sel,i) is
	begin
		case( sel ) is
		
			when "00" => 
				o <= B"1000";
			when "01" => 
				o <= B"0100";
			when "10" => 
				o <= B"0010";
			when "11" => 
				o <= B"0001";
			when others =>
				o <= (others => 'X');
		end case ;
	end process;

end rtl ; -- rtl
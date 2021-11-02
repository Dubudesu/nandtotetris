library ieee;
use ieee.std_logic_1164.all;

entity Mux4Way16 is
    port (
		a : in std_logic_vector(15 downto 0);
		b : in std_logic_vector(15 downto 0);
		c : in std_logic_vector(15 downto 0);
		d : in std_logic_vector(15 downto 0);

		o : out std_logic_vector(15 downto 0);

		sel: in Std_Logic_Vector(1 downto 0)
    );
end Mux4Way16;

-------------------------------------------------------------------------------
architecture rtl of Mux4Way16 is
-------------------------------------------------------------------------------

--Component list--

---Signal list---

begin
	process(sel,a,b,c,d) is
	begin
		case( sel ) is
		
			when "00" => 
				o <= a;
			when "01" => 
				o <= b;
			when "10" => 
				o <= c;
			when "11" => 
				o <= d;
			when others =>
				o <= (others => 'X');
		end case ;
	end process;

end rtl ; -- rtl
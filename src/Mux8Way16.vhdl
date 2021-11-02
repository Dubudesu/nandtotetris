library ieee;
use ieee.std_logic_1164.all;

entity Mux8Way16 is
    port (
		a : in std_logic_vector(15 downto 0);
		b : in std_logic_vector(15 downto 0);
		c : in std_logic_vector(15 downto 0);
		d : in std_logic_vector(15 downto 0);
		e : in std_logic_vector(15 downto 0);
		f : in std_logic_vector(15 downto 0);
		g : in std_logic_vector(15 downto 0);
		h : in std_logic_vector(15 downto 0);

		o : out std_logic_vector(15 downto 0);

		sel: in Std_Logic_Vector(2 downto 0)
    );
end Mux8Way16;

-------------------------------------------------------------------------------
architecture rtl of Mux8Way16 is
-------------------------------------------------------------------------------

--Component list--

---Signal list---

begin
	process(sel,a,b,c,d,e,f,g,h) is
	begin
		case( sel ) is
		
			when "000" => 
				o <= a;
			when "001" => 
				o <= b;
			when "010" => 
				o <= c;
			when "011" => 
				o <= d;
			when "100" => 
				o <= e;
			when "101" => 
				o <= f;
			when "110" => 
				o <= g;
			when "111" => 
				o <= h;
			when others =>
				o <= (others => 'X');
		end case ;
	end process;

end rtl ; -- rtl
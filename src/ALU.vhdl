library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is
  port (
    clk : in std_logic;
    rst : in std_logic;

    x   : in Std_Logic_Vector(15 downto 0);
    y   : in Std_Logic_Vector(15 downto 0);

    zx  : in std_logic;
    nx  : in std_logic;
    zy  : in std_logic;
    ny  : in std_logic;
     f  : in std_logic;
    no  : in std_logic;

    --zr  : std_logic;
    --ng  : std_logic
    o   : out Std_Logic_Vector(15 downto 0)
  );

  constant zeros: STD_LOGIC_VECTOR(15 downto 0) := "0000000000000000";
end ALU;

-------------------------------------------------------------------------------
architecture behavioral of ALU is
    -------------------------------------------------------------------------------
    
    --Component list--
    
    ---Signal list---

begin
    
    op: process( rst, clk )
        variable tmp_x : Std_Logic_Vector(15 downto 0);
        variable tmp_y : Std_Logic_Vector(15 downto 0);
        variable tmp_o : Std_Logic_Vector(15 downto 0);
    begin
        
        tmp_x := x;
        tmp_y := y;

        tmp_x := zeros          when (zx = '1');
        tmp_x := std_logic_vector(not signed(tmp_x))    when (nx = '1');
        tmp_y := zeros          when (zy = '1');
        tmp_y := std_logic_vector(not signed(tmp_y))    when (ny = '1');
        
        if ( f = '1') then
            tmp_o := Std_Logic_Vector( signed(tmp_x) + signed(tmp_y) );
        else 
            tmp_o := (tmp_x AND tmp_y);
        end if;

        tmp_o := std_logic_vector(not signed(tmp_o)) when ( no = '1');
        o     <= tmp_o;

    end process;

end behavioral ;
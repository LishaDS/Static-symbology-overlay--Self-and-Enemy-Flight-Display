library ieee ;
use ieee . std_logic_1164 .all;
entity hud_background_black is
port (
clk : in std_logic ;
de : in std_logic ;
rgb : out std_logic_vector (11 downto 0)
);
end entity ;
architecture rtl of hud_background_black is
begin
process (clk )
begin
if rising_edge (clk ) then
if de=’1’ then
rgb <= x "000";
else
rgb <= x "000";
end if;
end if;
end process ;
end architecture ;

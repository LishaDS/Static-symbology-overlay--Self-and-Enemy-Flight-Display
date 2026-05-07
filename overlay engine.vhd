library ieee ;
use ieee . std_logic_1164 .all;
entity overlay_engine_simple is
port (
clk : in std_logic ;
de : in std_logic ;
rgb_bg : in std_logic_vector (11 downto 0);
green_on : in std_logic ;
green_rgb : in std_logic_vector (11 downto 0);
red_on : in std_logic ;
red_rgb : in std_logic_vector (11 downto 0);
rgb_out : out std_logic_vector (11 downto 0)
);
end entity ;
architecture rtl of overlay_engine_simple is
begin
  process (clk )
begin
if rising_edge (clk ) then
if de=’1’ then
if red_on =’1’ then
rgb_out <= red_rgb ;
elsif green_on =’1’ then
rgb_out <= green_rgb ;
else
rgb_out <= rgb_bg ;
end if;
else
rgb_out <= ( others =>’0’);
end if;
end if;
end process ;
end architecture ;

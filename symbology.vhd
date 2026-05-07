library ieee ;
use ieee . std_logic_1164 .all;
use ieee . numeric_std .all;
entity hud_image1_symbology is
port (
clk : in std_logic ;
de : in std_logic ;
x : in unsigned (9 downto 0);
y : in unsigned (9 downto 0);
green_on : out std_logic ;
green_rgb : out std_logic_vector (11 downto 0);
red_on : out std_logic ;
red_rgb : out std_logic_vector (11 downto 0)
);
end entity ;
architecture rtl of hud_image1_symbology is
constant HUD_GREEN : std_logic_vector (11 downto 0) := x"9 DA ";
constant HUD_RED : std_logic_vector (11 downto 0) := x"F22 ";
constant CX : integer := 320;
constant CY : integer := 240;
function abs_i (v : integer ) return integer is
begin
if v < 0 then
  return -v;
else
return v;
end if;
end function ;
function glyph (c : character ; row : integer ) return
std_logic_vector is
variable g : std_logic_vector (7 downto 0) := ( others =>’0’);
begin
case c is
when ’0’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x"6E";
when 3 => g:=x "76";
when 4 => g:=x "66"; when 5 => g:=x "66"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’1’ => case row is
when 0 => g:=x "18"; when 1 => g:=x "38"; when 2 => g:=x "18";
when 3 => g:=x "18";
when 4 => g:=x "18"; when 5 => g:=x "18"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’2’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x "06";
when 3 => g:=x"1C";
when 4 => g:=x "30"; when 5 => g:=x "60"; when 6 => g:=x"7E";
when others => g:=x "00"; end
case ;
when ’3’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x "06";
when 3 => g:=x"1C";
when 4 => g:=x "06"; when 5 => g:=x "66"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’4’ => case row is
when 0 => g:=x"0C"; when 1 => g:=x"1C"; when 2 => g:=x"3C";
when 3 => g:=x"6C";
when 4 => g:=x"7E"; when 5 => g:=x"0C"; when 6 => g:=x"0C";
when others => g:=x "00"; end
case ;
when ’5’ => case row is
when 0 => g:=x"7E"; when 1 => g:=x "60"; when 2 => g:=x"7C";
when 3 => g:=x "06";
when 4 => g:=x "06"; when 5 => g:=x "66"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’6’ => case row is
when 0 => g:=x"1C"; when 1 => g:=x "30"; when 2 => g:=x "60";
when 3 => g:=x"7C";
when 4 => g:=x "66"; when 5 => g:=x "66"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’7’ => case row is
  when 0 => g:=x"7E"; when 1 => g:=x "66"; when 2 => g:=x "06";
when 3 => g:=x"0C";
when 4 => g:=x "18"; when 5 => g:=x "18"; when 6 => g:=x "18";
when others => g:=x "00"; end case ;
when ’8’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x "66";
when 3 => g:=x"3C";
when 4 => g:=x "66"; when 5 => g:=x "66"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’9’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x "66";
when 3 => g:=x"3E";
when 4 => g:=x "06"; when 5 => g:=x"0C"; when 6 => g:=x "38";
when others => g:=x "00"; end
case ;
when ’A’ => case row is
when 0 => g:=x "18"; when 1 => g:=x"3C"; when 2 => g:=x "66";
when 3 => g:=x "66";
when 4 => g:=x"7E"; when 5 => g:=x "66"; when 6 => g:=x "66";
when others => g:=x "00"; end
case ;
when ’C’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x "60";
when 3 => g:=x "60";
when 4 => g:=x "60"; when 5 => g:=x "66"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’D’ => case row is
when 0 => g:=x"7C"; when 1 => g:=x "66"; when 2 => g:=x "66";
when 3 => g:=x "66";
when 4 => g:=x "66"; when 5 => g:=x "66"; when 6 => g:=x"7C";
when others => g:=x "00"; end
case ;
when ’E’ => case row is
when 0 => g:=x"7E"; when 1 => g:=x "60"; when 2 => g:=x "60";
when 3 => g:=x"7C";
when 4 => g:=x "60"; when 5 => g:=x "60"; when 6 => g:=x"7E";
when others => g:=x "00"; end
case ;
when ’F’ => case row is
when 0 => g:=x"7E"; when 1 => g:=x "60"; when 2 => g:=x "60";
when 3 => g:=x"7C";
when 4 => g:=x "60"; when 5 => g:=x "60"; when 6 => g:=x "60";
when others => g:=x "00"; end case ;
when ’G’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x "60";
when 3 => g:=x"6E";
when 4 => g:=x "66"; when 5 => g:=x "66"; when 6 => g:=x"3E";
when others => g:=x "00"; end
case ;
when ’H’ => case row is
when 0 => g:=x "66"; when 1 => g:=x "66"; when 2 => g:=x "66";
when 3 => g:=x"7E";
when 4 => g:=x "66"; when 5 => g:=x "66"; when 6 => g:=x "66";
when others => g:=x "00"; end case ;
when ’I’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "18"; when 2 => g:=x "18";
when 3 => g:=x "18";
when 4 => g:=x "18"; when 5 => g:=x "18"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’L’ => case row is
when 0 => g:=x "60"; when 1 => g:=x "60"; when 2 => g:=x "60";
when 3 => g:=x "60";
when 4 => g:=x "60"; when 5 => g:=x "60"; when 6 => g:=x"7E";
when others => g:=x "00"; end
case ;
when ’M’ => case row is
when 0 => g:=x "63"; when 1 => g:=x "77"; when 2 => g:=x"7F";
when 3 => g:=x"6B";
when 4 => g:=x "63"; when 5 => g:=x "63"; when 6 => g:=x "63";
when others => g:=x "00"; end case ;
when ’N’ => case row is
when 0 => g:=x "66"; when 1 => g:=x "76"; when 2 => g:=x"7E";
when 3 => g:=x"7E";
when 4 => g:=x"6E"; when 5 => g:=x "66"; when 6 => g:=x "66";
when others => g:=x "00"; end
case ;
when ’O’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x "66";
when 3 => g:=x "66";
when 4 => g:=x "66"; when 5 => g:=x "66"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’P’ => case row is
when 0 => g:=x"7C"; when 1 => g:=x "66"; when 2 => g:=x "66";
when 3 => g:=x"7C";
when 4 => g:=x "60"; when 5 => g:=x "60"; when 6 => g:=x "60";
when others => g:=x "00"; end case ;
when ’R’ => case row is
when 0 => g:=x"7C"; when 1 => g:=x "66"; when 2 => g:=x "66";
when 3 => g:=x"7C";
when 4 => g:=x"6C"; when 5 => g:=x "66"; when 6 => g:=x "66";
when others => g:=x "00"; end
case ;
when ’S’ => case row is
when 0 => g:=x"3C"; when 1 => g:=x "66"; when 2 => g:=x "30";
when 3 => g:=x "18";
when 4 => g:=x"0C"; when 5 => g:=x "66"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’T’ => case row is
when 0 => g:=x"7E"; when 1 => g:=x"5A"; when 2 => g:=x "18";
when 3 => g:=x "18";
when 4 => g:=x "18"; when 5 => g:=x "18"; when 6 => g:=x"3C";
when others => g:=x "00"; end
  case ;
when ’W’ => case row is
when 0 => g:=x "63"; when 1 => g:=x "63"; when 2 => g:=x "63";
when 3 => g:=x"6B";
when 4 => g:=x"7F"; when 5 => g:=x "77"; when 6 => g:=x "63";
when others => g:=x "00"; end case ;
when ’X’ => case row is
when 0 => g:=x "66"; when 1 => g:=x "66"; when 2 => g:=x"3C";
when 3 => g:=x "18";
when 4 => g:=x"3C"; when 5 => g:=x "66"; when 6 => g:=x "66";
when others => g:=x "00"; end
case ;
when ’Y’ => case row is
when 0 => g:=x "66"; when 1 => g:=x "66"; when 2 => g:=x"3C";
when 3 => g:=x "18";
when 4 => g:=x "18"; when 5 => g:=x "18"; when 6 => g:=x"3C";
when others => g:=x "00"; end
case ;
when ’ ’ => g := x "00";
when ’.’ => case row is
when 5 => g:=x "18"; when 6 => g:=x "18"; when others => g:=x
"00"; end case ;
when ’-’ => case row is
when 3 => g:=x"7E"; when others => g:=x "00"; end case ;
when ’:’ => case row is
when 1 => g:=x "18"; when 2 => g:=x "18"; when 4 => g:=x "18";
when 5 => g:=x "18"; when others
=> g:=x "00"; end case ;
when others => g := x "00";
end case ;
return g;
end function ;
function text_on (str : string ; px , py , x0 , y0 : integer ) return
std_logic is
variable relx , rely : integer ;
variable chpos , col , row : integer ;
variable c : character ;
variable gg : std_logic_vector (7 downto 0);
begin
if px < x0 or py < y0 then
return ’0’;
end if;
relx := px - x0;
rely := py - y0;
if rely < 0 or rely >= 8 then
return ’0’;
end if;
chpos := relx / 8;
col := relx mod 8;
row := rely ;
if chpos < 0 or chpos >= str ’ length then
return ’0’;
end if;
  c := str(str ’low + chpos );
gg := glyph (c, row );
if gg (7- col )=’1’ then
return ’1’;
else
return ’0’;
end if;
end function ;
signal xi , yi : integer range 0 to 1023;
signal g_on , r_on : std_logic ;
begin
xi <= to_integer (x);
yi <= to_integer (y);
-- pale green geometry
g_on <= ’1’ when (de=’1’ and (
-- top heading scale
( text_on ("190" , xi , yi , 260 , 16) =’1’) or
( text_on ("195" , xi , yi , 302 , 16) =’1’) or
( text_on ("200" , xi , yi , 350 , 16) =’1’) or
(( yi = 34) and (xi = 242 or xi = 272 or xi = 320 or xi = 370 or
xi = 400) ) or
(( yi >= 30 and yi <= 42) and (xi = 280 or xi = 320 or xi = 360)
) or
(( yi = 46 and xi >= 315 and xi <= 325) or
(yi = 45 and xi >= 316 and xi <= 324) or
(yi = 44 and xi >= 317 and xi <= 323) ) or
-- own aircraft cue / central HUD
(( xi = 290 and yi >= 62 and yi <= 78) or
(yi = 70 and xi >= 282 and xi <= 298) ) or
-- center circle
((( xi -CX)*(xi -CX) + (yi -CY)*(yi -CY) >= 78*78) and
((xi -CX)*(xi -CX) + (yi -CY)*(yi -CY) <= 80*80) ) or
-- central marker
((( xi -CX)*(xi -CX) + (yi -(CY -32) )*(yi -(CY -32) )) <= 3*3) or
-- horizon line
(( yi = CY) and (xi >= 20 and xi <= 620) ) or
-- center W- like symbol
(( yi = CY +6 and xi >= 328 and xi <= 336) ) or
(( yi = CY +6 and xi >= 344 and xi <= 352) ) or
(( xi >= 336 and xi <= 344 and yi = CY +6 + abs_i (340 - xi))) or
(( xi >= 344 and xi <= 352 and yi = CY +14 - abs_i (348 - xi))) or
-- pitch ladders
(( yi = 156 + (xi -140) /6) and (xi >= 140 and xi <= 260) ) or
(( yi = 156 - (xi -380) /6) and (xi >= 380 and xi <= 500) ) or
((( yi = 300 + (xi -210) /8) or (yi = 340 + (xi -210) /8)) and
((( xi >= 210 and xi <= 230) or (xi >= 240 and xi <= 260) or (xi
>= 270 and xi <= 290) or
(xi >= 300 and xi <= 320) or (xi >= 330 and xi <= 350) ))) or
((( yi = 295 - (xi -350) /8) or (yi = 335 - (xi -350) /8)) and
((( xi >= 350 and xi <= 370) or (xi >= 380 and xi <= 400) or (xi
>= 410 and xi <= 430) or
(xi >= 440 and xi <= 460) ))) or
-- pitch labels that are green in source
  ( text_on ("5" , xi , yi , 168 , 148) =’1’) or
( text_on ("5" , xi , yi , 462 , 148) =’1’) or
( text_on ("5L", xi , yi , 198 , 292) =’1’) or
( text_on ("10" , xi , yi , 196 , 372) =’1’) or
( text_on ("5" , xi , yi , 472 , 284) =’1’) or
( text_on ("10" , xi , yi , 196 , 346) =’1’) or
-- own aircraft / FPM style symbol lower - left
(((( xi -240) *(xi -240) + (yi -320) *(yi -320) ) >= 8*8) and
((( xi -240) *(xi -240) + (yi -320) *(yi -320) ) <= 10*10) ) or
(( yi = 320) and (xi >= 220 and xi <= 230) ) or
(( yi = 320) and (xi >= 250 and xi <= 260) ) or
(( xi = 240) and (yi >= 300 and yi <= 310) ) or
(( yi = 292 + (xi -220) /3) and (xi >= 220 and xi <= 232) ) or
(( yi = 348 - (xi -248) /3) and (xi >= 248 and xi <= 260) ) or
-- own aircraft callout lines
(( xi = 208 and yi >= 286 and yi <= 332) ) or
(( yi = 286 and xi >= 208 and xi <= 228) ) or
(( yi = 332 and xi >= 208 and xi <= 228) ) or
-- enemy target box
((( xi >= 402 and xi <= 442) and (yi = 302 or yi = 330) ) or
(( yi >= 302 and yi <= 330) and (xi = 402 or xi = 442) )) or
-- enemy aircraft side - profile marker
(( yi = 316 and xi >= 411 and xi <= 433) ) or
(( yi = 315 and xi >= 418 and xi <= 428) ) or
(( yi = 317 and xi >= 418 and xi <= 428) ) or
(( yi = 314 and xi >= 425 and xi <= 431) ) or
(( yi = 318 and xi >= 425 and xi <= 431) ) or
(( yi = 312 and xi >= 431 and xi <= 436) ) or
(( yi = 320 and xi >= 431 and xi <= 436) ) or
(( xi = 418 and yi >= 313 and yi <= 319) ) or
-- enemy callout lines
(( xi = 454 and yi >= 292 and yi <= 338) ) or
(( yi = 292 and xi >= 442 and xi <= 454) ) or
(( yi = 338 and xi >= 442 and xi <= 454) ) or
-- right altitude readout and box
( text_on ("2260" , xi , yi , 546 , 152) =’1’) or
((( xi = 566 or xi = 586) and (yi >= 208 and yi <= 304) ) or
(( yi = 208 or yi = 304) and (xi >= 566 and xi <= 576) ) or
(( yi = 256) and (xi >= 566 and xi <= 576) )) or
( text_on ("150" , xi , yi , 530 , 247) =’1’) or
(( yi = 256 and xi >= 548 and xi <= 556) or
(xi = 556 and yi >= 252 and yi <= 260) ) or
-- bottom arc cleaned and symmetric
((( xi -320) *(xi -320) + (yi -440) *(yi -440) >= 70*70) and
((xi -320) *(xi -320) + (yi -440) *(yi -440) <= 72*72) and yi < 440)
or
(( xi = 270 or xi = 290 or xi = 320 or xi = 350 or xi = 370) and
yi >= 386 and yi <= 398) or
(( yi = 408 and xi >= 312 and xi <= 328) or
(yi = 416 and xi >= 315 and xi <= 325) or
(yi = 424 and xi >= 318 and xi <= 322) ) or
-- left raw values
( text_on (" GS 190" , xi , yi , 48, 104) =’1’) or
  ((( xi = 50 or xi = 104) and (yi >= 136 and yi <= 160) ) or
(( yi = 136 or yi = 160) and (xi >= 50 and xi <= 104) )) or
( text_on ("251" , xi , yi , 60, 144) =’1’) or
( text_on ("M 0.8" , xi , yi , 48, 244) =’1’) or
( text_on ("G 1.0" , xi , yi , 48, 264) =’1’) or
( text_on (" ARM 0.7" , xi , yi , 28, 374) =’1’) or
( text_on ("4 MRM", xi , yi , 36, 392) =’1’) or
( text_on ("4.1" , xi , yi , 56, 410) =’1’) or
-- bottom - right missile panel widened so all text stays inside
((( xi = 520 or xi = 628) and (yi >= 350 and yi <= 438) ) or
(( yi = 350 or yi = 438) and (xi >= 520 and xi <= 628) )) or
( text_on ("F 006.6" , xi , yi , 540 , 366) =’1’) or
( text_on ("T 0:00:39" , xi , yi , 540 , 384) =’1’) or
( text_on ("005 -02" , xi , yi , 548 , 402) =’1’) or
( text_on ("4 DF -XX", xi , yi , 540 , 420) =’1’)
)) else ’0’;
-- red labels only
r_on <= ’1’ when (de=’1’ and (
( text_on (" OWN AIRCRAFT ", xi , yi , 136 , 260) =’1’) or
( text_on (" ENEMY AIRCRAFT ", xi , yi , 356 , 342) =’1’) or
( text_on (" AIRSPEED ", xi , yi , 45, 86) =’1’) or
( text_on (" MISSILE ", xi , yi , 548 , 334) =’1’)
)) else ’0’;
process (clk )
begin
if rising_edge (clk ) then
green_on <= g_on ;
green_rgb <= HUD_GREEN ;
red_on <= r_on ;
red_rgb <= HUD_RED ;
end if;
end process ;
end architecture ;

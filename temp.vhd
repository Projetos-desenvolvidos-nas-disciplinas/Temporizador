library ieee;
use ieee.std_logic_1164.all;


entity temp is
   port ( RST, CK : in  std_logic;
          S5, S20: out std_logic);
end temp ;


architecture logica of temp is
  
  
component ffjk is
   port (ck, clr, set, j, k : in  std_logic;
                          q : out std_logic);
end component;


signal rst_neg: std_logic;
signal b: std_logic_vector(4 downto 0);
signal a: std_logic_vector(4 downto 0);



begin
  
   V1: ffjk port map (CK, RST, '1', '1', '1', a(0));
   V2: ffjk port map (a(0), RST, '1', '1', '1', a(1));
   V3: ffjk port map (a(1), RST, '1', '1', '1', a(2));
   V4: ffjk port map (a(2), RST, '1', '0', '1', a(3));
   V5: ffjk port map (a(3), RST, '1', '0', '1', a(4));
   
   
   U1: ffjk port map (CK, rst_neg, '1', '1', '1', b(0));
   U2: ffjk port map (b(0), rst_neg, '1', '1', '1', b(1));
   U3: ffjk port map (b(1), rst_neg, '1', '1', '1', b(2));
   U4: ffjk port map (b(2), rst_neg, '1', '1', '1', b(3));
   U5: ffjk port map (b(1), rst_neg, '1', '1', '1', b(4));
   
   S5 <= ( b(0) and (not b(1)) and b(2));
   S20 <= ( b(0) and (not b(1)) and b(2) and (not b(3)) and (not b(4)));
   
   rst_neg <= not RST;
  
end logica;
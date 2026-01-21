library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CNTREG is
  port(RST,CLK:in std_logic;
    D:in std_logic_vector(15 downto 0);
    M1,ME:out std_logic;
    Q1:out std_logic_vector(4 downto 0)
  );
end CNTREG;

architecture Neneci of CNTREG is
begin
  process(RST,CLK)
    variable cnt:unsigned(4 downto 0);
    begin
      if RST='1'then
        Q1<=(others=>'0');
        M1<='0';
        ME<='0';
      elsif CLK'event and CLK='1' then
        for i in 0 to 15 loop
          if D(i)='1' then
            cnt:=cnt+1;
          end if;
        end loop;
        if cnt>"1000" then
          M1<='1';
        else
          M1<='0';
          if cnt="1000" then
            ME<='1';
          else
            ME<='0';
          end if;
        end if;
        Q1<=std_logic_vector(cnt);
      end if;
    end process;
  end;
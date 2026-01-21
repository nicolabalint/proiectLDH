library IEEE;		--includerea bibliotecii standard IEEE
use IEEE.std_logic_1164.all;	--utilizeaza toate elementele din pachetul std_logic_1164

entity ban_DFFNS_test is end;--definirea entitatii de test

architecture ban_test of ban_DFFNS_test is--definirea arhitecturii
  component ban_DFFNS --declaratia componentei ban_DFFR
    port(   	--declaratia porturilor componentei
      SN, D, CKN: in std_logic; --porturile de intrare
      Q, QN: out std_logic --porturile de iesire
    );
  end component;
  signal SN: std_logic := '0';--semnalul de reset initializat cu 0(activ)
  signal CKN: std_logic := '0';--semnalul de clock initializat cu 0
  signal D: std_logic := '1';--semnalul de date initializat cu 1
  signal Q: std_logic := '1';--semnalul Q initializat cu 1
  signal QN: std_logic := '1';--semnalul QN initializat cu 1
  begin
    UUT:ban_DFFNS port map(SN,D,CKN,Q,QN);--instantierea componentei ban_DFFR
    D<= not D after 10 ns;--genereaza un semnal periodic (p=20ns) pt D
    SN<= '0','1' after 20 ns;--dezactiveaza setul dupa 20 ns
    CKN<= not CKN after 5 ns;--genereaza un semnal periodic(p=10ns) pt CK
end;
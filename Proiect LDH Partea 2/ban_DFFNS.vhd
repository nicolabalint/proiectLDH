library IEEE; --includerea bibliotecii standard IEEE
use IEEE.std_logic_1164.all;--utilizeaza toate elementele din pachetul std_logic_1164


entity ban_DFFNS is--definirea entitatii ban_DFFR
  generic(  --definirea parametrilor generici
    tp_LHQ: time := 0.71 ns;--intarzierea tranzitiei de la Low la High pt Q
    tp_HLQ: time := 0.64 ns;-- intarzierea tranzitiei de la High la Low pt Q
    tp_LHQN: time := 0.54 ns;-- intarzierea tranzitiei de la Low la High pt QN
    tp_HLQN: time := 0.59 ns-- intarzierea tranzitiei de la High la Low pt QN
  );
  port( --definirea porturilor
    SN, D, CKN: in std_logic; --porturile de intrare de tip std_logic
    Q, QN: out std_logic  --porturile de iesire de tip std_logic   
  );
end ban_DFFNS;--sfarsitul entitatii

architecture ban_DFFNS_COMP of ban_DFFNS is --definirea arhitecturii
begin
  process(SN, CKN) --procesul descrie comportamentul flip-flop-ului
  begin
    if (SN = '0') then --verifica daca setul este activ
      Q <= '1';--seteaza iesirea Q la High
      QN <= '0';--seteaza iesirea QN la Low
    elsif (falling_edge(CKN)) then --verifica daca resetul este inactiv si exista front negativ al semnalului de CK
      if (D = '0') then --verifica daca intrarea D este Low
        Q <= '0' after tp_HLQ;-- seteaza iesirea Q la Low dupa tp_HLQ
        QN <= '1' after tp_LHQN;-- seteaza iesirea QN la High dupa tp_LHQN
      elsif (D = '1') then-- verifica daca intrarea D este High
        Q <= '1' after tp_LHQ;-- seteaza iesirea Q la High dupa tp_LHQ
        QN <= '0' after tp_HLQN;	-- seteaza iesirea QN la Low dupa tp_HLQN
      end if;
    end if;
  end process; --sfarsitul procesului
end;

# Proiect LDH – DFFNS CMOS (Analiză dinamică SPICE)

##  Descriere
Acest repository conține **proiectarea și analiza dinamică în SPICE a circuitului DFFNS**  
(*D Flip-Flop cu Set asincron, activ Low*), realizat în tehnologia  
**CMOS_HP_05_T49G**, în cadrul disciplinei **LDH**.

Circuitul DFFNS stochează un bit de informație sincronizat cu semnalul de ceas
(*clock activ Low*) și include funcție de **set asincron activ Low**,
fiind destinat aplicațiilor digitale de mare viteză și consum redus de energie.

Documentația completă (dimensionare, netlist, simulări și grafice) este inclusă
în fișierul PDF al proiectului.

---

##  Tehnologii și unelte utilizate

- **SPICE**
- **Tehnologie CMOS_HP_05_T49G**
- Modelare ierarhică folosind **subcircuite**
- Analiză tranzitorie
- Simulări parametrice
- Probe (goal functions)

---

##  Structura proiectului
Proiectul este organizat pe blocuri funcționale și etape de analiză:

```text
│   CMOS_035.txt
│   NAND3.cir
│   NAND3.dat
│   NAND3.out
│   NOR3.cir
│   NOR3.dat
│   NOR3.out
│   NOR3.prb
│
├───LDH PROIECT_BALINT_NICOLA
│       CMOS_HP_05_T49G.txt
│       EX_2.cir
│       EX_2.dat
│       EX_2.out
│       EX_2.out.1
│       EX_2.prb
│       EX_3.cir
│       EX_3.dat
│       EX_3.out
│       EX_3.prb
│       EX_4.cir
│       EX_4.dat
│       EX_4.log
│       EX_4.op.raw
│       EX_4.out
│       EX_4.prb
│       EX_4.raw
│       SUBCIRCUITE.txt
│
└───Proiect LDH Partea 2
    │   ban_DFFNS.vhd
    │   ban_DFFNS.vhd.bak
    │   ban_DFFNS_test.vhd
    │   ban_DFFNS_test.vhd.bak
    │   ban_DFFNS_verilog.v
    │   ldh proiect partea 2.docx
    │   modelsim.ini
    │   verilog1.v
    │   verilog1.v.bak
    │   verilog1_tb.v
    │   verilog1_tb.v.bak
    │   vhdl1.vhd
    │   vhdl1.vhd.bak
    │   vhdl1_tb.vhd
    │   vhdl1_tb.vhd.bak
    │   vsim.wlf
    │
    └───work
            _info
            _lib.qdb
            _lib1_0.qdb
            _lib1_0.qpg
            _vmake
```

## Descrierea etapelor

### Dimensionarea tranzistoarelor și netlist SPICE

Tranzistoarele MOS au fost dimensionate conform tehnologiei CMOS impuse,  
iar circuitul a fost descris ierarhic folosind **subcircuite SPICE**:

- invertor (**INV**)
- invertor complex (**INV3**)
- poartă **NAND2**

Netlist-ul include instanțierea subcircuitelor și definirea surselor de semnal  
și a parametrilor tehnologici.  

---

###  Analiza tranzitorie

A fost realizată analiza tranzitorie pentru a evidenția funcționarea corectă  
a circuitului **DFFNS**.

Pentru fiecare ieșire s-a considerat o capacitate de sarcină **CL**, iar  
valorile pentru:

- **VDD**
- **TR** (timp de tranziție)
- **CL**

au fost alese conform tehnologiei CMOS de **0.5 μm**.

Au fost definite semnale **PULSE** pentru:

- intrarea **D**
- semnalul de **clock (CKN)**
- semnalul de **set asincron (S)**

---

### Analiza parametrică a timpilor de propagare

Au fost efectuate simulări parametrice pentru determinarea dependenței  
timpilor de propagare:

- de la **CKN → Q**
- de la **CKN → QN**

în funcție de:

- capacitatea de sarcină **CL**
- timpul de tranziție **TR**

Parametrii au fost variați în intervalul  
**(0.5 – 1.5) × valoarea nominală**.


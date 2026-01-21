`timescale 1ns/10ps

module tb1;
  reg d,s,clk,rst;
  wire [2:0]q;
  
  FSM uut(
  .d(d),
  .s(s),
  .clk(clk),
  .rst(rst),
  .q(q) 
  );
  
  always #5 clk=~clk;
  
  initial begin
    clk=0;
    rst=0;
    d=0;
    s=0;
    
    #10;
     rst = 1;
        #10;
        
        // Test 1: Tranzi?ie normal?
        d = 1; s = 1;
        #10;
        s = 0;
        #10;
        
        // Test 2: Tranzi?ie înapoi la s1
        d = 0; s = 1;
        #10;
        s = 0;
        #10;
        
        // Test 3: Diverse combina?ii de intr?ri
        d = 1; s = 1;
        #10;
        d = 0; s = 1;
        #10;
        d = 1; s = 0;
        #10;
        
        // Reset din nou
        rst = 0;
        #10;
        rst = 1;
        #10;

        // Încheierea simul?rii
        $stop;
    end
endmodule
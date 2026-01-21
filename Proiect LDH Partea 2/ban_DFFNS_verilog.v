`timescale 1ns / 1ps

module ban_DFFNS #(
  parameter tp_LHQ = 0.71 ,    
  parameter tp_HLQ = 0.64 ,    
  parameter tp_LHQN = 0.54 ,   
  parameter tp_HLQN = 0.59   
)(
  input wire SN,              
  input wire D,              
  input wire CKN,              
  output reg Q,               
  output reg QN               
);

  always @(negedge CKN or negedge SN) begin
    if (!SN) begin
      Q <= 1'b1;              
      QN <= 1'b0;             
    end else begin
      if (D == 1'b0) begin
        #tp_HLQ Q<= 1'b0;           
        #(tp_HLQ-tp_LHQN) QN <= 1'b1; 
      end else if (D == 1'b1) begin
        #tp_LHQ Q <= 1'b1;            
        #(tp_LHQ-tp_HLQN) QN <= 1'b0; 
      end
    end
  end

endmodule


module ban_DFFNS_test;

  reg SN = 1;      
  reg CKN = 0;     
  reg D = 1;       
  wire Q;         
  wire QN;         

  ban_DFFNS uut (
    .SN(SN),
    .D(D),
    .CKN(CKN),
    .Q(Q),
    .QN(QN)
  );

  initial begin
    D = 1;
    SN = 0;
    #20 SN = 1;      
end
always #10 D = ~D; 
always #5 CKN = ~CKN;  
endmodule
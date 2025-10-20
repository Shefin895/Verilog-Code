
module D_FF(input clk,D,output reg Q);
  
  always@(posedge clk)begin
    Q<=D;
  end
  
endmodule


module D_FF_tb;
  reg clk,D;
  wire Q;
  
  D_FF uut(clk,D,Q);
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  
  initial begin
    
    $monitor("Time = %t || clk =%b || D = %b || Q = %b||",$time,clk,D,Q);
    
    D=0;#10;
    D=1;#10;
    D=0;#10;
    D=1;#10;
    D=0;#10;
    D=1;#10;
    D=0;#10;
    D=1;#10;
    #10;$stop;
  end
endmodule
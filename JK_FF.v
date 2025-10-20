module JK_FF(input clk,j,k,output reg q,qbar); 
  always@(posedge clk)begin
    case({j,k})
      2'b00:begin
        q<=q;
        qbar<=qbar;
      end
      
      2'b01:begin
        q<=0;
        qbar<=1;//reset
      end
      2'b10:begin
        q<=1; //set 
        qbar<=0;
      end
      2'b11:begin
        q<=~q; //toggle
        qbar<=~qbar;
      end
    endcase
  end
endmodule

module JK_FF_tb;
  reg clk,j,k;
  wire q,qbar;
  
  initial begin
    clk=0;
    forever #5 clk=~clk;
  end
  JK_FF uut(clk,j,k,q,qbar);
  initial begin
    $monitor("Time=%t | clk=%b | J=%b | K=%b | Q=%b | Qbar=%b", 
                 $time, clk, j, k, q, qbar);
    
    j=0;k=0;#10;
    j=0;k=1;#10;
    j=1;k=0;#10;
    j=1;k=1;#10;

    $finish;
  end
endmodule

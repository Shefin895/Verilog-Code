
// Code your design here
module jk(input j,k,clk,output  reg q,qbar);
 initial q = 0;
 initial qbar = 1;
  always@(posedge clk)begin
    case({j,k})
      2'b00:begin
        q<=q;
        qbar<=qbar;
      end
        2'b01:begin
        q<=0;
        qbar<=1;
        end
        2'b10:begin
        q<=1;
        qbar<=0;
        end
        2'b11:begin
        q<=~q;
        qbar<=~qbar;
      end     
    endcase
  end
endmodule

module jk_to_t(input clk,T,output reg Q,Qbar);
  wire q1;
  
  jk jk1(.j(T),.k(T),.clk(clk),.q(Q),.qbar(Qbar));
endmodule
          
// Code your testbench here
// or browse Examples
module T_FF_tb;
  reg T, clk;
  wire Q, Qbar;

  jk_to_t uut (.T(T), .clk(clk), .Q(Q), .Qbar(Qbar));
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    $monitor("Time=%0t || CLK=%b || T=%b || Q=%b || Qbar=%b",
              $time, clk, T, Q, Qbar);

    // Case 1: Hold (T=0)
    T = 0; #10;

    // Case 2: Toggle (T=1)
    T = 0; #10;

    // Case 3: Hold again
    T = 1; #10;

    // Case 4: Toggle again
    T = 1; #10;

    $finish;
  end
endmodule
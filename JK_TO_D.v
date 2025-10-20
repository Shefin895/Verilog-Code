
// Code your design here
module jk(input j,k,clk,output  reg q,qbar);
  initial begin
  q = 0;    // start with Q=1
  qbar = 1;  // start with Qbar=0
end  
  always@(posedge clk)begin
    case({j,k})
      2'b00: ;
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

module jk_to_D(input clk,D,output reg Q,Qbar);
  wire q1;
  
  jk jk1(.j(D),.k(~D),.clk(clk),.q(Q),.qbar(Qbar));
endmodule

// Code your testbench here
// or browse Examples
module DFF_tb;
  reg D, clk;
  wire Q, Qbar;

  jk_to_D uut (.D(D), .clk(clk), .Q(Q), .Qbar(Qbar));
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
  initial begin
    
    // Case 1: Hold (T=0)
    D <= 0; #10;

    // Case 2: Toggle (T=1)
    D <= 0; #10;

    // Case 3: Hold again
    D <= 1; #10;

    // Case 4: Toggle again
    D <= 1; #10;

    $finish;
  end
  always@(posedge clk)begin
    $display("Time=%0t || CLK=%b || D=%b || Q=%b || Qbar=%b",
              $time, clk, D, Q, Qbar);

  end
  
endmodule
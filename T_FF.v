

module T_FF(input T, clk,output reg Q,output Qbar);
initial Q = 0;
  
  always @(posedge clk) begin
    if (T)
      Q <= ~Q;   // Toggle when T=1
    else
      Q <= Q;    // Hold when T=0
  end
  assign Qbar = ~Q;

endmodule


module T_FF_tb;
  reg T, clk;
  wire Q, Qbar;

  T_FF uut (.T(T), .clk(clk), .Q(Q), .Qbar(Qbar));
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
    T = 1; #10;

    // Case 3: Hold again
    T = 0; #10;

    // Case 4: Toggle again
    T = 1; #10;

    $finish;
  end
endmodule
